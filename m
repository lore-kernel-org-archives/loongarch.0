Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF611A0AF7
	for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947088; cv=none; b=uFhMt+RO99GGnJwwR1YP0AGGP50s0WomMsDUpi9F8JKJrVNRv3FSAQc/bbTdiRkKcpAvUAUh9k8LAe1wk89gKmPaO9T5S/8K8OmJ4juFpA0IgTzkqM8SqWM/l0hTDskRugF5rMmtXqeBrbElWq2pY7zjn6dUpQyR8xf2txGgLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947088; c=relaxed/simple;
	bh=H/x1u07M3HXF9oVd+o3reuerQgd2pca8MMjlY49GFUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nIZ5W54iIzOb9ktLFnwrmJQub7NrTJi++dAAMjiAUZKs9zfOw7AGtHOWjOKloWPOL2epqYzPTBmwFmOPEtYW9lEDVTJz5WQ1ixQraUtixztFtCZZDL/BjOQRoPczNy+YA8VGuJIttIx/LXCCVFSbe8bbMDrZJkXIHPQ5N6KskXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Efa7kgZf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Efa7kgZf"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-72764c995e5so2420716b3a.2
        for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 01:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947085; x=1735551885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=Efa7kgZf/MVFsPQ35KQT3sUak6dlOp4ilBx+Y02n6uRWGP+sBsWU3ZE4dTX9DU6cPB
         OmnG5mW+PoU1aUwMiNwVUwHV9SYG0aKcyasf2LZ1rlJDun1GXaVFVSSEC4fwNYsCXiLs
         1CpfVp5Wk8bmK0zWTGrxU0GYtZr8gqmNdJeeSmPn9KWQOxsubnbwbJWmwGzQ2840oQ5o
         wHabyxq97bo41Fpq4RuWhiuTFWFI1FpnUfQINdZTF07OrWwy1EFk+NCNcI8rfrXAk+S9
         DjXbKDIYVTPrKc9QsHNNxZAClUgpiJ7cDsfRvpZZIbcpKThEaIuiBMELyaKifDGg6YgM
         F+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947085; x=1735551885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=AzzaQWEp07P5FEqI5OUwC2vHGyQzuo7RyNKmPx+0kD4+PH4XK0PikrZ5XvktT5uMRr
         Q1w1Iuk6oSXRaZwog3jV4gK/VPEx1awhT/kkL9ZCvmxDuz+NL7jcriSSwJbz/hseNfLc
         v6MyIXwGwcRvnoGOGmfel82BfLjrSQWVS8nE53btG68PHFfKXA6SsKO51OGULt8EDkli
         sRrIVeK55+f23Lzd5LP8Lh7/FF/CpE7UCcNumLFm42p47gUitqiol05zpYIzy3ERY8HH
         WA/HA+uPmhxKhs8LTQHfp//8Y1Zqz7meIDZeZV+nMgjkfPiw4kVR+/n/wDxf/u2YbZvn
         /HBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa6Pgu8ydK0M+XVhd3d3QSDB8cteOSRgYKJyiQhQV5vKh7YcSi4GQR3Q8lIYM6SgAGKyGz3gFWzAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNZsu3Ie8rDvPUEPTGb40I42c+w569uXGKcQSK9F7toyEgiFht
	ngONbhYzR+YMPMiuJcgf1+eKaNMZU2CBLbOS5JibHVnhnPFXYBmIDZv4eKxb+no=
X-Gm-Gg: ASbGncsrtIKPXYN/Qn8qt5a+NubW5SOjvO9ei2voUGxLhtPVX8cd7K/o3+Cp8S9ZK6z
	B3GGulsOeG7S2/2LZyjvOAZdSBU3WSRtM0ghlvA9GEKpd1J/GGO7Nqc7D9xBPLUuu3ozisRBcZ8
	OWwcNwaXR6GfZCNkPUfqDTMcZare10ecCdBQPoZVFuWquh5tDxc8qYB1LZtV7Zx1zKGCPDZv71O
	lq1NZrC9hg4y9gQX7xzt/z2NblKlItxrQf+CaiU6roF82gYlb4G0O2P09ifBbnTz64j9luobiaG
	0C9D03UwkvTQa88LeMxj0g==
X-Google-Smtp-Source: AGHT+IEwnxNRxjpY566VNLJW6lRIrSoOOApqv/9DKS3yUbVNE+/391+nOnqyFIwO+T3gR5XgQach6A==
X-Received: by 2002:a05:6a00:330b:b0:728:e382:5f14 with SMTP id d2e1a72fcca58-72abdd7bae3mr14443469b3a.9.1734947085429;
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
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
Subject: [PATCH v3 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:54 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1734945104.git.zhengqi.arch@bytedance.com>
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..264ab635e807a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,8 +43,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -61,7 +61,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1

