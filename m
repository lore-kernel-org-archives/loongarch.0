Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82B71E9B28
	for <loongarch@lists.linux.dev>; Mon,  3 Mar 2025 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986799; cv=none; b=fDOtR4Iclil4yYR7Dv2pkwb21NVoIRRAZL3g89mNexkPzhstv26Hau9z4REI1gHWMQaZWrJbzgTmX4DQY6nlFerG7tADcQ3oWLP5TwJVFaW8rgHrfGX/QvrO1slmRy7wdWMpJzvMJUxydLddalh3Tam/BzCmXfdTko8GmDxIsz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986799; c=relaxed/simple;
	bh=RuA+uroo3JnnqiveXvV7x6EK7oz5OdDodupXgS0+g8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgoDAkg/CjCEgfbMsWTOc5JlYGL37E+mU6BrOMfTFUhDElMIUeDuafVV97Xo9rb3ZtxWaRjqIKFzJ3G3WxCGhWsWdEOIp83U+m680ewMSCpVk5ea/Ji0vZSlDJQ5O6/Bzg7TcJgIKRVIYeSHb/IXo/+duBHunT5XyRz3dqlvWnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Dwhu9fep; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Dwhu9fep"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fea78afde5so5228637a91.2
        for <loongarch@lists.linux.dev>; Sun, 02 Mar 2025 23:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740986797; x=1741591597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKqMp2ldkM6onLRqmB7AQD5dXslJ0Fc9YwwNhjL6y0w=;
        b=Dwhu9fepPoahO0EeqgJXGjFgd92YZLPg/WVBf7rFVrXRv2tA20rWe44u6FC98WPZkT
         5RK/l8CQYCK5G4rsZ6LIgigGS5cLtoT3FBiMLrMA5sXfgrZqLUXH16sJc/QEVB+atbwz
         tL+m1Ip1r1jC89cjIOp4sqozVwDl8oWycwXKPgSyYFIH4F+4r2KO6qJNALywF+Tu6GYC
         GqvHSuGAq7Zsuk9jtNWpNweLNoOXhQZkwxocqBgBzYFxSB0TC30NbEOJscjTGg9gHXWz
         F8DWTl0eWjAwzuCWGOL3tiyKG+jhXmg6woqsbgjUfDp8DpE5cG7Fot7BvckiJc+zIbm9
         OFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986797; x=1741591597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKqMp2ldkM6onLRqmB7AQD5dXslJ0Fc9YwwNhjL6y0w=;
        b=chBaTlH3TFanDdFYH/969peTlBLr1uEBr9hJoePUi2LC/CeJnSXYTQBruNc4XAtmKD
         lIGTb+zvA4IS+tGkoQJ0hoh9KUIes1BB191qcj6oQfEs3JxvMPeqSFaU7GhfVx7S+FQb
         Drs4RRV2NNtr7GrvJ0E2vLL70sZndKdNlpY5f5dlHe+T/fvX4uBAAtBismYVGUbCaBP8
         0U8x02LAndmGaLHacoiFbkjOnNj4jBIblmQWpAmO0MdYGvvW4/9ZivWTc+1ury5Oj79g
         M3op18QgBWHXec9qwgkCtFQcXBx7hix4TStyJgFs8r17Y0FJW5o4UzAxyMhOXVKxJ2F6
         m7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVA59skk0HDw19V3t6r/0otuUoeOKQwjyw9IVIPXMg2nPrm0y1n1i30U9BAo968/FMjKqHbRKg1El8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxDyii47b5S2tbAOO4p8yqSuEa3L9/odUvYTEL4XrRp697KYp7
	UbCz6KaYIUucZp2Gnypr74SN8luEzLswQrGR9W8Ol2edcYhlv8bqL9y97whNdbM=
X-Gm-Gg: ASbGncuObRktcgEhzJIir7/zstE4VTzVhLjdrxKRdLONzjpfdXWcqYKKuI8NFd9hHcP
	TuWIzKyFhrqBGooxeMx//PtwB6sF9l2b56w7az9m0G/qW3Dymtvfyuj/DG5h7QzrDuGg9oZHBJf
	NURi+EgAFCMfac7yGaeRYWi4IoU2A01Psa+9p1/aIdOZIwc924TcCk0F83UrZuNyh8QemGypuv2
	9OafmTXyXHV3reqyfG1EIJK+/BhKeHsSi+ouf2I0Tz1XSCo5gD1KRCL+rYb4mAVFN9EbSSM0S8q
	aeN/8rSVCUolBZqJnhG2JVYW2M1yuwO8R1X6qjxIQqOZrY27K4Pz6TrKt1xcF+t/mDHJiQzVY2u
	jz4iMGg==
X-Google-Smtp-Source: AGHT+IHY/mguPL5YJZdh+hkpdyJ3sc0BaAvd1rDPiW9eR/qaACJ5BQlxWj/zL9j3Gfy9PeYzz+4/5A==
X-Received: by 2002:a17:90a:f948:b0:2fe:d766:ad87 with SMTP id 98e67ed59e1d1-2fed766af9cmr12568619a91.7.1740986796693;
        Sun, 02 Mar 2025 23:26:36 -0800 (PST)
Received: from G7HT0H2MK4.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea676c06asm8211638a91.16.2025.03.02.23.26.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 02 Mar 2025 23:26:35 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 3/6 update] mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
Date: Mon,  3 Mar 2025 15:26:03 +0800
Message-ID: <20250303072603.45423-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
References: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
tlb_remove_page()). This is the same as the implementation of
tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
convert these architectures to use tlb_remove_ptdesc().

The ultimate goal is to make the architecture only use tlb_remove_ptdesc()
or tlb_remove_table() for page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
---
Changes in v2 update:
 - remove the do { ... } while construct. (Geert Uytterhoeven)
 - collect the Reviewed-by and Acked-by.

 arch/csky/include/asm/pgalloc.h      |  7 ++-----
 arch/hexagon/include/asm/pgalloc.h   |  7 ++-----
 arch/loongarch/include/asm/pgalloc.h |  7 ++-----
 arch/m68k/include/asm/sun3_pgalloc.h |  7 ++-----
 arch/mips/include/asm/pgalloc.h      |  7 ++-----
 arch/nios2/include/asm/pgalloc.h     |  7 ++-----
 arch/openrisc/include/asm/pgalloc.h  |  7 ++-----
 arch/sh/include/asm/pgalloc.h        |  7 ++-----
 arch/um/include/asm/pgalloc.h        | 21 ++++++---------------
 9 files changed, 22 insertions(+), 55 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index bf8400c28b5a3..11055c5749686 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -61,11 +61,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 	return ret;
 }
 
-#define __pte_free_tlb(tlb, pte, address)		\
-do {							\
-	pagetable_dtor(page_ptdesc(pte));		\
-	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 extern void pagetable_init(void);
 extern void mmu_init(unsigned long min_pfn, unsigned long max_pfn);
diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index 1ee5f5f157ca7..937a11ef4c33c 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,7 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-do {								\
-	pagetable_dtor((page_ptdesc(pte)));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 7211dff8c969e..73629c1b8328e 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -55,11 +55,8 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 	return pte;
 }
 
-#define __pte_free_tlb(tlb, pte, address)			\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));
 
 #ifndef __PAGETABLE_PMD_FOLDED
 
diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index 80afc3a187249..1e21c758b774e 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -17,11 +17,8 @@
 
 extern const char bad_pmd_string[];
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
 {
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 26c7a6ede983c..bbca420c96d3c 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -48,11 +48,8 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 extern void pgd_init(void *addr);
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, address)			\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #ifndef __PAGETABLE_PMD_FOLDED
 
diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index 12a536b7bfbd4..db122b093a8be 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,7 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)					\
-	do {								\
-		pagetable_dtor(page_ptdesc(pte));			\
-		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-	} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index 3372f4e6ab4b5..3f110931d8f6e 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -64,10 +64,7 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #endif
diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index 96d938fdf2244..6fe7123d38fa9 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -32,10 +32,7 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #endif /* __ASM_SH_PGALLOC_H */
diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index f0af23c3aeb2b..826ec44b58cdb 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,27 +25,18 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb, pte, address)			\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #if CONFIG_PGTABLE_LEVELS > 2
 
-#define __pmd_free_tlb(tlb, pmd, address)			\
-do {								\
-	pagetable_dtor(virt_to_ptdesc(pmd));			\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
-} while (0)
+#define __pmd_free_tlb(tlb, pmd, address)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd))
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
-#define __pud_free_tlb(tlb, pud, address)			\
-do {								\
-	pagetable_dtor(virt_to_ptdesc(pud));		\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
-} while (0)
+#define __pud_free_tlb(tlb, pud, address)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pud))
 
 #endif
 #endif
-- 
2.20.1

