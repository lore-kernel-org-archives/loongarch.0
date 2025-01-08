Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA021E1A2B
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319683; cv=none; b=SwrdX41vsN2hlbDDAfA2VdDgcvfQSGH0sdLUgLfCRa0P7QHOjZNf5xahLZG74qvIuW5lNog4v8gsiIiyW8KuD4otW6rFHZ6T0w0vCeBwHpVdoXxKjygCLD4sbxK49yS3rWdhOfcJw99GMiXQZYqkFbaqxpv+pREGpOEVuC3r28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319683; c=relaxed/simple;
	bh=wfTgGSVhXTkiP60cV7XgYAcbBAoscYS/kqOY2RPeVxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PBPHP/BzfYOum2mVefTIaXt26Iay8oFzgkxltPFlHlIucAIiu5GZdOEx1UtSq3IFgne9fxFxdKj8qBbcRJxvdEluhCgq9XMhrZfpDINrkAm2EkrPV76qgjW74GAMOft5tXjFrBzYtNQp/2k3t0e6SpuxC6dISzlnjshykB6W6+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=k4Dzfg3/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="k4Dzfg3/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2164b1f05caso238227865ad.3
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 23:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319680; x=1736924480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=k4Dzfg3/gn0RUmubIldix2g2UhemHpFqK8kexaBJLMto8leaepPLEqwiHwdhXyYnyH
         H1tFI2lYsu4fgrNHBC4RMxFgEZFD3e3/Jp3RNutf3svKFhLHmoZYY/ie9OBDO3YHWpRJ
         dJjInkMNb3UY7P96uMZWvmDguu7UFhkbqNz8xmZMuaDuXuKV+gN8qfhmjc9HoiErMR+4
         spcDzh3RMv6czvhfxTfbmAPLJgBHMFmhv++KEAZnrm4iGu1eUB1bPLtJSwGSMO/C4C5J
         zagUwDP9c5MpJlfBLNgGqzB8qFBFGNx8vs1BfLBF77Nm25fsZKdH4/zKK0gcPXWsO0AK
         XKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319680; x=1736924480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=GP2zBjJpLtaFjcmfw5qKXDLidZiJmXuKtFQkiHNKgrQoI8+0OMNCrsm3I3uu4NE0Ci
         DGJdJSGn9PwC3Xv+SOzg6vjL/7a0OxoWjJe5Keu/IkWb/9tfFx2wjnXz72tnOjRKTFeg
         RW+PtdUzl+0gK9kBPvio9nwv+90q5X7iDnvTQkC65lPoHVtxZNqzHFbvUs9FDxMXfN4h
         438cGeTRtF/2D2EP45R3sp4knGEUoehQAZ9R7cbSmb1j5G9XGDa1Q4fcGlbFrFQmJ6A1
         2zIntJGCndfEH/4r+gROVExiAu4NiIc5aioiEFUW4ILhEEA4ZvU9Nvpxs9U/yegiNKN3
         SEVw==
X-Forwarded-Encrypted: i=1; AJvYcCXV54vroU67HB0EM/pXc7/aTvhE/J0aTrOb14dIW8BQVinE9J32YnENxhjfmX6lIrusN8jK09N6bWw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOWsyl6t6pK2/lbsYYQ8Q7Kt+/EkZ8gTrk3CNrcy8JsX1TyWPa
	DP6d3Qd4yUNpITBsULqbru0t0ptMtfvx0m70RRiP6JFyH3+qcvCahqgsyYsOs0w=
X-Gm-Gg: ASbGnctwRBMEIgTdc+CLIsYayhMWB3FbqZbxX9+1bfr9QzxHAP01QVP4nhCWP9VHBMm
	JMLTQNQXId22LZvfPCTGU6bR4aCh0BVs5pmtu3rwhaGkZPrfN+VhGq2ItqQE24fGRkIuBy1IwgQ
	MtJBPx39OqCsq5UTMHQ+M7cBLoT4/QntYYl4GOUmRuJPN6756QACjRGgRh0VJYw124nGJE245/O
	7fdsWhQR5/Az8zzK8iU8Cg2p+XJYtVyw6nJ2C8cA4lY5nyLhlD1uHxGrGZXMGGZernpsBvWk3rt
	a3e0mP4Rlz67fyYK8hcHFScRK9Y=
X-Google-Smtp-Source: AGHT+IGA+MEO+KKVHOehVcxKdAaP4kVFc+4x/MGW5FidU7ZYZhG+ejtfRbHdQiRj7WdzfqmV0LUjgQ==
X-Received: by 2002:a17:902:d352:b0:215:8847:435c with SMTP id d9443c01a7336-21a83f4b133mr25527805ad.12.1736319679689;
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
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
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:24 +0800
Message-Id: <327b4b8990729edd4ce97d9d5acbdaff2d9fa1d1.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
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
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..59854c6b97bc5 100644
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
@@ -41,7 +43,9 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
+#ifndef CONFIG_MMU_GATHER_TABLE_FREE
 	pagetable_dtor(ptdesc);
+#endif
 
 #ifndef CONFIG_ARM_LPAE
 	/*
@@ -61,7 +65,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1

