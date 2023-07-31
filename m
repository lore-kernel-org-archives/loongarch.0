Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C41D2E2
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:04:27 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bff89873d34so3787494276.2
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823066; x=1691427866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=f6adceAKsPvui0l7VSUiRnWj+VnC8V29gRyKPW/KXba4L11duKnXDkkl9h+DOUEe82
         /+uFEmkPUA7pfwVfanOSjRVPX3wfPLVY3FZPvGi3VyyqlsToEnHzzIylic2yHwlsDcH3
         W3JP9R5mJExPbkEH69AGyH0gizw4AowCqMoujs5LGqqMzZnJK/dPFOzk0elvmdxwimx1
         zHO/RBskNqXdsMC9zN3IXGN1/Qatnc3KRzwrgmn/b1CAPxkc6smcQgcPCS+F4TUkpdDt
         7sG/wG+FEbTCZLXxJ46EURhFx988hfZQfl6N1HhCumdsXb4Bqj21mhmFktRwf8yfQcyF
         sVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823066; x=1691427866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=IWBZmpgAOXm035P25u3wQYPFW/Gcoxuxj3XJnjjOLtAQQ3eroyp95eSKRCqxFiSiik
         sgRql/D2JW865JHnno6Dvtoffsiucasn2jHrdmixZHo41uzh6zsiWdwL4OrNJ6J2k6mQ
         LxQsEJgLYhQ7SzUijFNZ3ZKSMD6g6x68PH38f0gM6MfddTEFrCTVAGjI7x3jkm+F+4Ua
         Q6EXgyZiooUjSEAxg2Z/xxJlOaszPLPthSukQ4z5WWBrvrx769bNV4KWDDA/eAhjrG8k
         NkL82svtCmLcalvymOdSQ7epHcjJpw1XozGWTaOr9SGjx1YETSSizXmkFplhY5Adzo8C
         JwHA==
X-Gm-Message-State: ABy/qLYP9Az9MK/+3Z0LmLJliXJ0urrp5ghgU/NV8NSehPxKWqQtiN/Q
	FZh4idBmOEJjiVqlmIiDGAs=
X-Google-Smtp-Source: APBJJlE4T05ogdyrjIbBXTs0RpkDVTPnYG3Ig2UA6lH+KuSSQ9n98n0kBdmmWfFoFgc9s9NgVox+UA==
X-Received: by 2002:a25:ada4:0:b0:d0a:8973:b1c with SMTP id z36-20020a25ada4000000b00d0a89730b1cmr247583ybi.12.1690823066447;
        Mon, 31 Jul 2023 10:04:26 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:26 -0700 (PDT)
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
	Mike Rapoport <rppt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH mm-unstable v8 24/31] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:25 -0700
Message-Id: <20230731170332.69404-25-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ce6bb8e74271 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		pagetable_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.40.1

