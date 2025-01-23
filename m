Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A320F998
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638922; cv=none; b=G7kKXRSPriRgzHNvmvQVKhX72c03tc6jyIwAmihIIiJoNzXGwnhFOioINrl9/VXWIrCXSRq/ATmy3QtmuWUuGRLjswuqPaJakg3jYvZji7Y9+n94fefpx5rmQ9vI6TkC2XV5ffviuQTEvgau+ZGdU7zM3LhDRe4A6kIGWfqF5RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638922; c=relaxed/simple;
	bh=eQ1gDVYEi4GJ9NNk990799a8vwaHFwWdA59vhGfOsTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SuJC5t87atsgPfG8COiE0BQU5Op3VTUbkgHN/BnDwgZTgCmXtd5UWEjhr1mXBIl77fFXILX6GwA6MjywgH+/ZFs7HNBCv80H5sWjmQMYV34qh4swflYWnes7IDSFSrrOzXHdCTUlb440m1PHm5ccQCt2EutHRR/TiyWLtXrSIoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=D1TrvTWZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="D1TrvTWZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2167141dfa1so16993445ad.1
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 05:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638918; x=1738243718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYmxrc32hC6wxjmJA23IxEYTBygiQADV4kK+4R+dKSU=;
        b=D1TrvTWZn3yfSEuFZ4ZNia6/a+sQlNiABsDWf4+XsLtTzVSyuA71wf/rPUAdvwRnpz
         NodAsQsp4Nj6l4A1ldajBzO8Vjw0yUdbUgcw5sw3POczkQMnpGTpi1M2MGEd/irt1Wpy
         y0px7lwPqpI0OQzekQWO80m5CPNLSlGNqZg/JLSETwL+yiDhQyfycvercSUPKcVLh27b
         jPybPMOTyI5RTbo0jqkux7FtupP45YnkjCl6n2CKUSdVTV79bi5pO3xYLvl1NSXsIlfg
         agqzIZXH11dfHKel5iVJC4JGpC7u288mfjmwjvf32OawEv6R1kNYDeBx9xMwMoZtblRq
         dVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638918; x=1738243718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYmxrc32hC6wxjmJA23IxEYTBygiQADV4kK+4R+dKSU=;
        b=jbrvLSpJNZKG15d2hkKaDTGXmi/cEsBPA2F929qia5/atAhhF9g0Kshe4GNHo7walm
         rvq2Sa6MxPsHN1SmokfpDvV1Hqi4PGjMiIaZ4w7BKavoqjAfvpPYlfmcDJJUHbdY1Sb0
         VZIU8GXHzEv1e/H0Xf5BhDdlGnE4CDbC7F7EAe02IMZBEfcvZwo14J1X758fyBGNacxm
         EiggHf2e/YUNiSv/Pcx4opfnmR0kMWw/5xQ7Jeyb2GNANCLj4OP4B3piz5QdOrVVJj4I
         nb5Kxwz3v3kh0cTP3rgriAiyVyRRj6X0dJCpa91whu8Q62uWdDoDckbsfRGJDFSiezTY
         6f8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrM9vmT2tYDtM/WH3vUmo1DpJ5OLdv5aHprXDHoL0FRbQMCUsmI2AXGflkNdWJPZob5cMWc46RO/M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt2nJR0YhjqVzKT0zsPoII/ohyC68UzSA3JlDz2//c1lCyyvkN
	RwTxtbUfCeliVAY/CcJyhwb1uzD9ESR2vCKCr7GNcGcbhZHoDKAVm2WevNm3b6s=
X-Gm-Gg: ASbGncs5tA5NIIAYxJy9d48KyJtoqmfn7L5PSQ9IIweL6ohCLX/9TLj3WqYWy2NtQ8E
	1qEHngUzeKVfunAtibmwkNbMteEuuaV+dDhlyK80YKsOv1dL5ykNUt4b2PGexyRQquu1SgXhX1C
	5+YijC2F9EfYAI184/2fsG8ZJI1U1t6anrJgrUdteJKdZPNxH3efhw7iANXQcRM425Y9ZymHYQ8
	dzLilAizIJiy3hK8YGHqJyyZQNnJ4FD22je1IE3KHEQV2IE0vQieDrWUckABA23zOLiRyM4fSnY
	THqzGfhxL8ZNeOap4cVdWsNcddFc7IAqaT4SPP2iofbZ
X-Google-Smtp-Source: AGHT+IG+jllXP/317uDYbnlVUGPZ9HFJ1DJp/HAbnaAGo0uqbORoOrOrnQgvR5mS4AHQ1q7HvBksTg==
X-Received: by 2002:a17:902:cf45:b0:216:59f1:c7d9 with SMTP id d9443c01a7336-21d9937ac97mr46072665ad.19.1737638918431;
        Thu, 23 Jan 2025 05:28:38 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:37 -0800 (PST)
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
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 2/5] mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
Date: Thu, 23 Jan 2025 21:26:15 +0800
Message-Id: <f32bcf7fe9740e891c4e76a92c0ef0349bb87e8b.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
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
---
 arch/csky/include/asm/pgalloc.h      | 3 +--
 arch/hexagon/include/asm/pgalloc.h   | 3 +--
 arch/loongarch/include/asm/pgalloc.h | 3 +--
 arch/m68k/include/asm/sun3_pgalloc.h | 3 +--
 arch/mips/include/asm/pgalloc.h      | 3 +--
 arch/nios2/include/asm/pgalloc.h     | 9 ++++-----
 arch/openrisc/include/asm/pgalloc.h  | 3 +--
 arch/sh/include/asm/pgalloc.h        | 3 +--
 arch/um/include/asm/pgalloc.h        | 9 +++------
 9 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index bf8400c28b5a3..9d2b50265a8d8 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pagetable_dtor(page_ptdesc(pte));		\
-	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index 1ee5f5f157ca7..3d35d2bc42534 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -89,8 +89,7 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor((page_ptdesc(pte)));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 7211dff8c969e..ac026146e7e95 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -57,8 +57,7 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index f1ae4ed890db5..55a982ffb0457 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -19,8 +19,7 @@ extern const char bad_pmd_string[];
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 26c7a6ede983c..7e73d2f913dd4 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -50,8 +50,7 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index 12a536b7bfbd4..4b4a1766e2cc7 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,9 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)					\
-	do {								\
-		pagetable_dtor(page_ptdesc(pte));			\
-		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-	} while (0)
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
+} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index 3372f4e6ab4b5..2964e26980a18 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,8 +66,7 @@ extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #endif
diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index 96d938fdf2244..c376d4b708fda 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -34,8 +34,7 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index f0af23c3aeb2b..a70151cfd11c9 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -27,24 +27,21 @@ extern pgd_t *pgd_alloc(struct mm_struct *);
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #if CONFIG_PGTABLE_LEVELS > 2
 
 #define __pmd_free_tlb(tlb, pmd, address)			\
 do {								\
-	pagetable_dtor(virt_to_ptdesc(pmd));			\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd));		\
 } while (0)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
 #define __pud_free_tlb(tlb, pud, address)			\
 do {								\
-	pagetable_dtor(virt_to_ptdesc(pud));		\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pud));		\
 } while (0)
 
 #endif
-- 
2.20.1

