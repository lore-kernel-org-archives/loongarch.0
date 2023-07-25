Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681AB6FA7
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 04:21:59 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d08658c7713so3153946276.3
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258918; x=1690863718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=dhPD8MhdzMmnO7UJpDnYU2UUndnCrctJzCVX4h8RxV/2AqAGAmNSSgBAimCgoOXbFI
         jwqB3InLHcwQnBW7LGy3zNpfxtaFx0sRNMrc2BW/oP9Y9sT30Imc49n106obHaMafKD9
         3iENsXyRilYTy2IVeIDj7UinpA3gJg4m95b/YmknsgUr223VL5cVJ4//6IC3DQ94xugG
         7BqjgjAuhv+rjaUhUgEIiEByqDs5npSuOOnKXGMd/lRwDVio+iIe4ROtQu1UVk7GVi+q
         O8m155eNSAMp9dX3vcmdIfcwnE6nUvi43OowEy4OezSv6ZkWZbIGQtYJYSHuCGDVV+u2
         iZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258918; x=1690863718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=JCmtQ4a0b/36eHBNjiiQF3ocomMsKBmBx230bxohcSfHu8z9W61qANl7VZSKiq30Y+
         oYjuVc1vNzwaASH2y2ZfLw4SuAXkjZJ8PK56D5ttZY1/e3Bo4n3V+bkVhwg/a7kGvcEy
         K4b2FaNa9iymhnwr6Ur+CCHMFtAmj0fVhZLI3+RAOP7TqCpIa8kF0qK4EsAiRu+6/gXE
         d/7OvU2U+m2NjygaaDpfeO9C+YiWluNc6401qZQ/Mm+bUK3DqujTLMWtUnv71COuKBh4
         /jHVlxt10BLWN8NesYfsXF2+HXjDxMLJaDRmJnvw75CO7sHrcqLiEUbtsgqEcJeXqscb
         oDEA==
X-Gm-Message-State: ABy/qLbvwsfYDd9j3hgK5Wi2BTei64Lq9ewVHLh0XRZJX3y3Jv4hNb48
	bFrb0MLnD/ZmlCgZoysfz1I=
X-Google-Smtp-Source: APBJJlGh3t71iGxZySWvCqAB9/DfGs5U66hmdz8Mr8qCsALi+Mic17AL5W5IK2UTO7itITs/+4o4Zw==
X-Received: by 2002:a25:ced0:0:b0:d13:e334:241b with SMTP id x199-20020a25ced0000000b00d13e334241bmr2805085ybe.21.1690258918114;
        Mon, 24 Jul 2023 21:21:58 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:57 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 24/31] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:44 -0700
Message-Id: <20230725042051.36691-25-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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

