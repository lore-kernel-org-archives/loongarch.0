Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF501A23A6
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549748; cv=none; b=bRlru96fpX+iPIxaMUOjWNJxeOTlICtutAFKrojgOXeG+XFLHEnlBxqGWsgupB8114yh6odlcpi9LpfFzx8xHScXKaT9xxRF+2zflmXsjz6vwSt1LC9DCBilEuoubvtNt3PWMG4ElodbT8q2h4zsjnLfO2eHu9VhrkFVGFGCZG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549748; c=relaxed/simple;
	bh=PKxGSwR+56aVOtqiYfVzo+PhXISkTKu7YVtS9mMtvvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fvqMWtf6hUAk7AS5+YbRaG1kAGIvcwekZTW7/w0LjeRDKAj2z9KwG0/YM1wZlFHyeVCO3/wsoB7hg5qYrwa+g176Uw7YeDAvylGAoeb8FI0yBiIQ2fZbgYxMBe2JJS91oVlir3PJrgBPtDxv+uP9tqQqQL+efp9PIAHj1UPmnc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ct94GA+M; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ct94GA+M"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21683192bf9so116587705ad.3
        for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549745; x=1736154545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHzGZQny5JmimEm0kycepUlCOKttN6NXbKtm7VNKgbw=;
        b=ct94GA+MOTi0TKuuSClrMJHcHJfjSgRBBKEum6EStBCOmZCqnC83rtk/xyyAQlwxpP
         uuIzWJ7jAKYGEYK9gEC2mvYY1MRTSbGty9Pkg8cqmMM7Mv7+OBWX0Egy8gBK1IlrNUFh
         xSlIj6O9Q7izpTmHJauS+5jLn8aOUFR26Drrz9qNSww/fuahU/xqDzKGHhLzSHBhiAlT
         TrXp88irM//17wqVdsJ7kkSli67vt02HD2EXhngKGWe54fUBqHobGVe0tWN1tQppGE2K
         VFgJn0YG6VTyIMfrKWJ5R3JuMvqOunM178LOn2bDxlYyVCTP08Q2fWVlYgVlnwkGOB0U
         2FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549745; x=1736154545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHzGZQny5JmimEm0kycepUlCOKttN6NXbKtm7VNKgbw=;
        b=ZKp2S5Il5OTZutE5DhAhxyQLyh5b516KdyX+23IojkHxzTmncyxR9Pi0FEZt9LaKfy
         WbWwztKfXegT+zB3y2co8ks27kj1RUHjM5WFKO+1LeT2d4CvTxCBz2d2PqVS3MvyrbAq
         irjRxqFjL5b/uV52NqrUv/lYBZWkypR5l4yIPfYdgPBtySWosRiRyxAC4fCugMPBugyz
         mOmAjeUHh9pnbbV/sUDysgmGrVJnTzMCJiZ8x4fqBZPZXKVEKC4GAmPuC/i0/MILGvth
         /i80C7qSaNk9Qfk7ENa+qUGeuvPrJWmxiXmpT0xUNy6QX7UR2wSij26vVdJUyGlDmSaV
         b74Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGdyjivPPtFgmgtfa9m5NFDejYAIyv4U+qJTEavENN2n4qqthjojs+Cx/v6BqXrnw69fQxueCBGt8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8fC8BNeHqUEqz12olN6cX3ikph3eg6yXLU8mWdfK6Oo/gWl7N
	A7n/JmP+p7vLWC4bpz3AEb+HMahp4Bqjdv3CYDYyvmvPgXIvy7jLnLTFBV9T9Sc=
X-Gm-Gg: ASbGncvPKYOu2bVCcCHL1+DggiMOAdbJeo0mle7nWejMnQTxhXdjMu12WBtL5JA88wo
	UUfQeFI03QTtLkwTCjCo12zeDCMKVR0Dqz1QLUWzF3rdQD5ud0RrNrketwHdPHj2GgWdwqiPIWT
	PXKPBIHSAQNju7l3BdQLuSbYpdWrH6o8192DJ63fuyZ0QcDp6R2wc9v35FeYIZOegp9/bAL7Kx3
	M1WB5UTnw0KETyqzG9TM7zLDy8X5UE/Px5v4tmBX0UIoG4lsKsZ8Xcw2rxSkk0u2C925dbpU7r5
	ySgOlYmvDMu1tVr86pIpDA==
X-Google-Smtp-Source: AGHT+IEdmvGR6U/qwRYH5ruA02a+sFRctKWchidIfEBAoumo12DzBepIE5K3QuQVJJ60xG/AvigJ4Q==
X-Received: by 2002:a05:6a20:a127:b0:1db:ddba:8795 with SMTP id adf61e73a8af0-1e5e08028cfmr53967973637.36.1735549745320;
        Mon, 30 Dec 2024 01:09:05 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:04 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
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
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 02/15] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Mon, 30 Dec 2024 17:07:37 +0800
Message-Id: <84ddf857508b98a195a790bc6ff6ab8849b44633.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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

