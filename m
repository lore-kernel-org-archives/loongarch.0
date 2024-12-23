Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815451946B1
	for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947011; cv=none; b=HprD7yzbhCXwzgdSqjhqAxPXzfWkDlzrDzZl8yFJoMLFYSpmSLCHqe7wwMcAWJYEEPoUjkc7XNqeaoUN33/P/RV86fPRrxYO9cV9qQg/dBNLu5kgShDhziYOy9VyYB75cE2MoxpEqS43cbGfXBlio/DJ9Jd/zH/Xa/UKcfBtoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947011; c=relaxed/simple;
	bh=ju5DuzkKGwFmMyIwrlT1Lgl5SSQbM6pKt1IYE0Qmp1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HVsj82AGPKqy7CH+4m/uXs0zlMbylwMUD/q0ztIdRQH3psldfcnceg0Ykb0AgpFI+WvIQ6eQm3jqO2+a7DnOjrHhxKZbxhovtmLoDVXDz6GmQv6t42cw1uDbzwhwLru+dQOHBzja//o498xWGOleBZOV99+ycHmpAifxAN7J+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Egc4YtLN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Egc4YtLN"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-728f28744c5so3822105b3a.1
        for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 01:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947009; x=1735551809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=Egc4YtLNrgm7prUdGZDCdtlq5ww21BPDqUm6QeznV1yVkJkJEYqAruPWEWbWgvseUW
         XK1OiHF9Xq70cpqG70aGfQ0j9zJmPcZRXsGxbOB2z8mArbme8tkYZ0RQUljO3ZVOIuK8
         DuI8asBcsvO4Li9Mya44PUmYzI3ZohKAZJJm5d3ZkeWaNfyl9HSgVjgMxOHPNHapc21T
         MUT1YmuREFWnR+XwXheKkebRWWix0MUdZwe2stf04h4/w7dTNvCoig/v9zfH/Mnz8v2H
         tIH/fDiICEW3mc5/JOUmGUtLRazat30Vb0+3bR6NEVRdmuF8OH9c5PXZqK4qikGVqQef
         qafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947009; x=1735551809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=FnSwzquDjM/gLkcFYZ+zEvQxynMEl8H4YSw1B7iGNmBos2Tc7O463R9w3O4IjYu4PZ
         BhYDCpkQjEQ5HGOitzR/HTg1ekWcEZaxMA3hGYWmPRTqL36SdVCu/n+2y8mTiYRCN6Kh
         lusLzjzBHA9qMfw/x1Ljp59xqMHPPT7K32yJals12GUZn7SDhbx+wbN3NhSEhIjIURq5
         Y0AW004wl4at0wXKfVm727Dhiwq8rSsBQUTth9aQhPTMLiZTzt0x7KtaHrcATkF4AdMr
         I+7dmrZesux9nGbn1bUeXbOCtc69JWK6TZnQNC73ac9/DNVkUQgsQf9Ei+2+fF6o92Yk
         O79Q==
X-Forwarded-Encrypted: i=1; AJvYcCXj3tf8uKB/wLdtmpbi2tSfcMfQPQOytKViTkUkx00ePB0VMjB9FmBn1APXD97S/R52KHLLnAwAROs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw809xICi3QboSFNjSy0g+pN/HLlYVDEZ8HfAUAX+ajIwqvbD9P
	J0fII5YcdCtKqVxwCiEJpqCoFgU9BQrfOXYehlpWJb8Iymj1MhoyKLWApkxNIeQ=
X-Gm-Gg: ASbGnctg2ATnZY7eOq5Ces0m3oWA/ag6CEuoNRlM7J0z39RMlKsIrYBe1JFa94M2Ll9
	FYs0eLstyMTufbh3RfjiiI9F7UOUgKG4YWgSYUTmO1M/izfOf1EZBqCLhQp85YQML2V9IMNMyDj
	4ywaCz32Fu8Ph1sp02wWH7pQ8c9vs/BXb3ILXXc9h0o//jGy5u4zcts782IQBksVkxpgYEpwPNf
	26gYqGAJB7Eiklf5BIepwxCwmJvP579bmxihfOC3+hjY0BJjHRv3nhc+8gfP2jcc6ifl3guDJd8
	cvsNfQ7dXBalrRq4pRA45w==
X-Google-Smtp-Source: AGHT+IGn0WgNlH4n6jFU+xV15Lu8l6dnMV2FFWuW4zvXTMVJTCCaTT+ZxewqFKpQcJgKvmYU0RJrVw==
X-Received: by 2002:a05:6a00:35ca:b0:724:f86e:e3d9 with SMTP id d2e1a72fcca58-72abdecbdb4mr16058641b3a.14.1734947008718;
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Mon, 23 Dec 2024 17:40:48 +0800
Message-Id: <84ddf857508b98a195a790bc6ff6ab8849b44633.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Brodsky <kevin.brodsky@arm.com>

{pmd,pud,p4d}_alloc_one() is never called if the corresponding page
table level is folded, as {pmd,pud,p4d}_alloc() already does the
required check. We can therefore remove the runtime page table level
checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
the generic version, so we remove it altogether.

This is consistent with the way arm64 and x86 handle this situation
(runtime check in p4d_free() only).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index f52264304f772..8ad0bbe838a24 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -12,7 +12,6 @@
 #include <asm/tlb.h>
 
 #ifdef CONFIG_MMU
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
@@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 	}
 }
 
-#define pud_alloc_one pud_alloc_one
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	if (pgtable_l4_enabled)
-		return __pud_alloc_one(mm, addr);
-
-	return NULL;
-}
-
 #define pud_free pud_free
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
@@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 #define p4d_alloc_one p4d_alloc_one
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		gfp_t gfp = GFP_PGTABLE_USER;
-
-		if (mm == &init_mm)
-			gfp = GFP_PGTABLE_KERNEL;
-		return (p4d_t *)get_zeroed_page(gfp);
-	}
+	gfp_t gfp = GFP_PGTABLE_USER;
 
-	return NULL;
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (p4d_t *)get_zeroed_page(gfp);
 }
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
-- 
2.20.1

