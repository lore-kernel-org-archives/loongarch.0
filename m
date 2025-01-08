Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46491AA781
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 07:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319638; cv=none; b=Tss0Frzb0S24GCDYKMFQ42AB21OhBuFbVCeACI3jN5uZ7qDXKXowI2xQLIXJTQNxlOHmCn0tbv3RClHsDYcy9C6DH36damZzPg+nj6dPnfh2XqJ1Y1f5MJ2NYuQGu6qpg4CoKfgMC+bfjz3i/7EUyWl7RSMJQ0hIun5UxwCs3l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319638; c=relaxed/simple;
	bh=8PYWh2+orWwYf6986S1qPEzSyDMn0jEmjPeP/Gs1msM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FfWOM1nJQSk5fGPymjdhb2AHGUK50R/hRXUyZjfADWYtwaIJD7RowH63VvkBkB44DaCGCz84rZLXQMvxCOwlRlMYnpazob8ZGmq7CHQudkHVK1qy36SWvOxwxNzvhjXSXGiTdX5zTxDKOAaFoHpLTnOAjo4mkKH2qSTcMCsrGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dRngHIH8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dRngHIH8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21669fd5c7cso246560965ad.3
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 23:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319635; x=1736924435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3ajwCEJzuBWHLhfIS3uOIg9mbtSga1CIaOnP3nLDr0=;
        b=dRngHIH8Bl/gRF1ojOEbR+wt0hlayCB7WWGenLNH543F9tMUsiboKtVH+esChhzQ8l
         izthpQ8VeiL08Tzs2joxVogHDwZMYXTRT37oBi+zFDdUkgMVJprXvvahDNoB0/zt3i2b
         cAahma+gsrSAyVpC2zB0VT2Aw+ST6ii4+wAYg2gcTbFHUlx5hDvdNFsxGM2xAcRRU3da
         rLFZgZUDYyRBKNaRZo2DGp5WTId/icvYQMME3Z5FHtx5Rs5ewbarkH6+m0Rd3GJPRX8U
         OBVdsj/2Upg2Bh+pAik+VXKpEMlgTTDD/7VXpgGLiZCb/gUzL3pNInT7Cvom304t8w0G
         koCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319635; x=1736924435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3ajwCEJzuBWHLhfIS3uOIg9mbtSga1CIaOnP3nLDr0=;
        b=G4BcGlomEEJb44TBMvgQzi57RnswADuFOYXNNOl9BWW/fVTIF3yrr5VoEV/9gBvtt6
         Q44z+TnEiUmQSK/4N/s4Keh33YKgXG6MNnOFav+5mGSd/YCx3OYT0ZiCjOHS5Q+JPbhi
         IhWIkHXsOWWaNZENd6heuzxLC5Q9ldsRCqMzHO2C7I8RACBqAl1LrCI6gB5EPksSpkSC
         DRfS508oSRP7reWOfmwAVHliS+fLBItcX8yKHDwRQ5veqoJ7Vt1WmOxxPPmSS/6o8Xpn
         R4xcL2DMtfjMmoX4DHhTwXUFxaF9bS4XCHqUTaKKJx0L6zBtXFLU6lVEB53eVhW9oaav
         4Otg==
X-Forwarded-Encrypted: i=1; AJvYcCWs625WLZdusq0G7kkOG6iU5G2zKpodjLXun2W4GZDP9dlu5hjbntZrVOQehS8YvRyQWWiNehdV0YM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxN3M0SlGrIgRb572j/crpz6yB3H+3+yw6zBFiLpQlsgpELHm7F
	9VT1dXDNHCy8vqdLC8dbRK5RzBaNFCvgMH5PkxGc/Or47o/jlltn1A/xQxGCquA=
X-Gm-Gg: ASbGncv8wjf9VKqQgTPNMDQ5Py7XJ9XYzZ7pa1X5Z66r5vbi4y7PJIGR4dvMuxU2P2B
	L1hjOgxnW/vpV4GtbsnG+1ic1ENeitz6zcwIP62OcyQ5Fuxz6Ow2PqM5b/nceghUvNWD02CXW03
	pAva3rfpWnlm7iIdnnkNP9SwShndJ5JX9yzcIF/t3GTkW3iIDLoajfuNCKnrOTWhlZI1s7GiHiQ
	JXnf2msgwRbfh7ozQe04EpOHvaA6mGP1WRzqWVEeAG6M/Cqhk6cmKmgtzHnVjVES3E8IJFWXoGR
	oaSY/LytGwi+Kur6riIj9WFSw8A=
X-Google-Smtp-Source: AGHT+IFQatZJEh1vMaYN2M2lTtxd4TB3DgwS5fDlIHVUeP0cQjVCzCSP2sGAFE7qJT7hKS5hKn1bKA==
X-Received: by 2002:a17:902:d4d2:b0:215:9642:4d6d with SMTP id d9443c01a7336-21a83f55157mr23731385ad.17.1736319635015;
        Tue, 07 Jan 2025 23:00:35 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:00:34 -0800 (PST)
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
Subject: [PATCH v5 05/17] arm64: pgtable: use mmu gather to free p4d level page table
Date: Wed,  8 Jan 2025 14:57:21 +0800
Message-Id: <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
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

Like other levels of page tables, also use mmu gather mechanism to free
p4d level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/pgalloc.h |  1 -
 arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 2965f5a7e39e3..1b4509d3382c6 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #else
 static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
 {
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed2..445282cde9afb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 }
 #endif
 
+#if CONFIG_PGTABLE_LEVELS > 4
+static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
+
+	if (!pgtable_l5_enabled())
+		return;
+
+	pagetable_p4d_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
+}
+#endif
+
 #endif
-- 
2.20.1

