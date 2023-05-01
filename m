Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9658C746F
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:29:22 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1aaec6f189cso12402305ad.3
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969362; x=1685561362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8/b+eKq2obnq3wrn4AaChyOhPXbZKipyE2UTOB7XHg=;
        b=Q3jl6YttJDwUuWKyn1dVs6I8W94SFWxxciTJdLpT/LELBYCeGyev+ExIC9w29x2Yt1
         zXHIDz5du52vN2frCHR+hIpcwuJ6c3WNhfC/Gsy1nS14RuXHFXtXj5G9xq8KbaH8upCB
         hoZ+KR9ZQITjkQA540sZmLX6PX4iGNe7NpnWG1G2AsO+NZdypSRuEfFuzqh0wPvQQaGw
         4XpO3Q1D/iCtA92s97XY1Or0L7GqG2SHJxpwKx0yuxfIbjPslNXarskrtkCCtU8UwW5x
         DSxt7iwfG4oFpxWasaAVqe2jz7cH5xxqomQxklMjhuQacqvGLIa7+5cde3ROrtfKL2NP
         oDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969362; x=1685561362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8/b+eKq2obnq3wrn4AaChyOhPXbZKipyE2UTOB7XHg=;
        b=hYHq4kA5A8L7t61mU5dRXAesOEtibh8A4He7oo3lXEod6C8gsQNGb4og7IlyN9jXVs
         OBGGt6sjncekmUiPoFV8gow9b1C7X4UoBBQr8FdmCXITqOG8LfKUnIk4Z5xDCukXULRZ
         TaymniB8nBd/z3wsJmDzktUjsbHOrHYuJ6BItiWkJQaMG3XFjwCfETvHrnD6bMvsBs+E
         yaFWBCEs1zdBljpjftS3thVbpM/q9hWrg48lxG30HqhAhx9fPsl8fBuoNqLgQ4etvF8F
         cdFIvMQ2sJshk7Opt5VT/084cMevpoA4IjjBdsjc2PVD+Ppc9xg2oUfGFcm21a4Ox7SC
         GvPA==
X-Gm-Message-State: AC+VfDyPokMcHoEoaI91DoaFp+T5piPSsSbrmnXzFblhQ//iY1oqU+PW
	RoLWik3q0HH9VzX64fosog0=
X-Google-Smtp-Source: ACHHUZ7SACaylL3/aSyKhkx7S2g1HYBvFG08B1pme9nPnu6u4pSNBbJS188a/Kq3fbmOV3eKOsv72w==
X-Received: by 2002:a17:902:db0b:b0:1aa:e5cd:647a with SMTP id m11-20020a170902db0b00b001aae5cd647amr7875588plx.23.1682969362180;
        Mon, 01 May 2023 12:29:22 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:21 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 33/34] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:28 -0700
Message-Id: <20230501192829.17086-34-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..760b029505c1 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	ptdesc_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.39.2

