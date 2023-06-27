Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EC0EA2
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 03:16:05 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5769e6a6818so30023087b3.1
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 20:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835765; x=1690427765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=e60Y6sevaT4oQ/L5KuHLcNtraCcaqymJSw0Pta6sshcpf6ZZ6QManSmR0ZQpDOB1TG
         Zv6Fux3N6RAGTYaqlaV6L/vXV7y5TNrp+A8hP8/1TroaBlBjnjU2829v3J+cnc+AhOb5
         JN+Np+61YaCNuusYO6cIWgMGGdhyo7H5wD/egNG2vy+zzD2dD0OPETzsjKXbKfq9Y/2e
         UqWfUGJ07+JZFMPC47CCL6nCuIIVod63+MvhTRgj6G4ml0xqLiHcn4xnMK5EG5kSpCpR
         IaKEXBQ7G4bgWt8P3QrMWU+dPATv19IcGEhHsTfe2EI7sEKEiwRzexwBCQnzrxDWjBM/
         K5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835765; x=1690427765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=eZ04GlWPjoqNfLuxKXFKFvdn8h+c/HtJM9h6R6dkzOROdAvysdirEG3Ag8zh8CoSns
         6yaZbQAyEfe+wIjsuwE2V2LePoFv7FkvMGUh1UY/YjtIclirzDtRwf5eypqLLdj585am
         rccy+HRq9O49TcRvXt49NZAzLRa3s8Q2xuGljAHVlf5Lfp/whiyIY0JSepJtW5WJV0dA
         OZye67LSlgQ27JrK2EanT92aue9LIGlMOGQ3Z4OJsv0Kk9XxUDO0DTWQbXiVBS0SjBWp
         TwOD1nnLceio9/ZqIcMPUeSeASZM5vtOqGaknGYFJOb9xGeVBkIKhla4sgrghSOo+TVN
         CwRQ==
X-Gm-Message-State: AC+VfDwsXhhp1LEWWce9Tg0m0bO0mcjLzSmMF3LnPNhsojJNa59YXEYC
	CXvhF5CHYF+MiqlI4+QWJO0=
X-Google-Smtp-Source: ACHHUZ5DGQdkUnjmZtvUypsIHEbjelQEN0sIFmuzviWoifvHBxszYaVoeD06anXcP6T6X+bEflb+Ug==
X-Received: by 2002:a0d:fb86:0:b0:573:5071:2a12 with SMTP id l128-20020a0dfb86000000b0057350712a12mr24368068ywf.18.1687835764817;
        Mon, 26 Jun 2023 20:16:04 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:16:04 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v6 27/33] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:25 -0700
Message-Id: <20230627031431.29653-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..c6a73772a546 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)	\
-do {					\
-	pgtable_pte_page_dtor(pte);	\
-	tlb_remove_page((tlb), (pte));	\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1

