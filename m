Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F35B1A9B2A
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 07:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319624; cv=none; b=tZRp1Q2PpBNvZrMqVy4TlNh6S2sHz6j88eVXF3oCjA8k8EkZN57QY41YLRDNyTUMvmMp/fRds8ezsvFoWLK4Z7t2PdrhulEgwl0L2jBB86zBZT+ndtnJ0Q5RYpjP5OK5Z4buvl6xwdHJGq9j80mO0xycBUSEOBxMozuQugrUNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319624; c=relaxed/simple;
	bh=e3kN1Di5Fcouv11d71USulaPcPOxTFiQrC41b2k4smg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uLjgXgZrWNOOnaqiGVCCc5GSQm/EWxkiVHofrwptdPD1BNHODzDLEgNxGwxPjyITuQ4J5188GgP9XoDyWiugOi6ZmxlJ0NgxBWf1DeZlSSXE7LJfEUbQSTGUVjpk2antDs8xonctQ7YYgIG2KplJoAUjVR7j3+vHE2lW4YjHckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jRbWaBVP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jRbWaBVP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21649a7bcdcso234368255ad.1
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 23:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319620; x=1736924420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cYfjcYM2i48jLO7NuvQJ4j04U6+7fBnrQjgIuvbLyg=;
        b=jRbWaBVPlshiHnwfF8uuy2Y+f9VLxL1rfkSGSkuJ+A8LY9eaCu/cKjK3pxAqkwMypC
         XQSyZ7elU6R8Jd6Uxk0HiYDYybuqYuVdbj+mVXyZvvP0Wz4bLh2pkIXW0bPTOQ6G0XVS
         D9R+BeqltvXJQGwlPtZYhqQcm8UVSdK+g96OQZt+mPaeBYQ125q1x+mKsvL3WRunVWM2
         THx4N94ZdPBHDSXjfcuDkjyj9JqhBrNStWxvJy5dwLkn5aIYHoizW6V0khkqlC0T+5fc
         vRpnqKvSNNxMrGcBCcf48hnArvVc4idtXGYObtEcYOjFFepLGdyvg+vKOQSwo8hLescR
         NI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319620; x=1736924420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cYfjcYM2i48jLO7NuvQJ4j04U6+7fBnrQjgIuvbLyg=;
        b=TQio9p5CuYemnmIorG8LPnGq/eeuLYkLN5E1f8wD7ayBD4rXbDHSldsRjw4HBXTCMj
         sR4Sg4dWbQy12lMQySSVYglEXxp7JM3C0UwGCQdr2KOtGqrnlNLLQFqp6lkpWnvJkRGI
         PfBwi6gfn7PfcBeTIg5+udb6fi+GiAIpYskaORdhJTgUQiwPxwfc68U26PnHMFXWWr5/
         /+XmxdaOSUcVkQ3PBaXrmPy0uK7k92S0kcyHWHQDXOl215NS93GHJpzSEfi+a+eUNAPZ
         Q7dIoICyvXsK0A0H4W3BLskJzDzlF8CA0NiAlsXPjKlo946+iD6YUMPXaMCcsRNHTQV7
         KRJw==
X-Forwarded-Encrypted: i=1; AJvYcCUiNGSZhq2aiwcYY+n61Cir3/+xy3L28sMjzZWJm/fSZ6IAhC1pNHsLs5JFBnXZUcD0a2Iv8w5/TyI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUdbZki3Vj2t0gbFAXVl836A+QAEinMpYk7vOIhT8agmSqOwDB
	ZfEqlzEyGZwWjiG+pNeApVx1RA4O42qSGEDrY9GEil7HKBTCM0VGQj84NxT1zpE=
X-Gm-Gg: ASbGncsisdM/BDv8ScmyFGqcXRxZFgy8F8COL0GdvmBTQy4chzxogJneFwj7wcciFsP
	w5GBwKBuuPpz8+N6ZKUCIgQA1DeSXG44IxbrMnpPPH1h7ZOQKu6lYfgKNWll110+VIIUEXsoPg/
	17MBRkqVtdnwEuphd7RW61nqzn5IDFW4kRe+WtDrx3YMQ8oRpyjIgXsZaoP9/emb5fx7oiapwXG
	B9kO5MfbLf5gkBzV2ZvxjwVXvgWPBQRB9/ftR0ImAfHjegrhiSYCIbPrlGgO7ZMKJT98RBSWCzm
	xrSHy3dyCpDNkYeIlgfmgOc3H0w=
X-Google-Smtp-Source: AGHT+IExFPt1bVFS1B+HfK/rni8xCakw0mpYmNpiHCGWtvviMVtfvk5MaDovSIdy5xSOdSeWSopXEQ==
X-Received: by 2002:a17:903:2311:b0:210:fce4:11ec with SMTP id d9443c01a7336-21a83f42687mr30246255ad.1.1736319619595;
        Tue, 07 Jan 2025 23:00:19 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:00:19 -0800 (PST)
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
Subject: [PATCH v5 04/17] mm: pgtable: add statistics for P4D level page table
Date: Wed,  8 Jan 2025 14:57:20 +0800
Message-Id: <d55fe3c286305aae84457da9e1066df99b3de125.1736317725.git.zhengqi.arch@bytedance.com>
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

Like other levels of page tables, add statistics for P4D level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/riscv/include/asm/pgalloc.h |  6 +++++-
 arch/x86/mm/pgtable.c            |  3 +++
 include/asm-generic/pgalloc.h    |  2 ++
 include/linux/mm.h               | 16 ++++++++++++++++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 551d614d3369c..3466fbe2e508d 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled) {
+		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
+
+		pagetable_p4d_dtor(ptdesc);
 		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+	}
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 69a357b15974a..3d6e84da45b24 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -94,6 +94,9 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 #if CONFIG_PGTABLE_LEVELS > 4
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
+
+	pagetable_p4d_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
 	paravirt_tlb_remove_table(tlb, virt_to_page(p4d));
 }
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 59131629ac9cc..bb482eeca0c3e 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -230,6 +230,7 @@ static inline p4d_t *__p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long
 	if (!ptdesc)
 		return NULL;
 
+	pagetable_p4d_ctor(ptdesc);
 	return ptdesc_address(ptdesc);
 }
 #define __p4d_alloc_one(...)	alloc_hooks(__p4d_alloc_one_noprof(__VA_ARGS__))
@@ -247,6 +248,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
 	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
+	pagetable_p4d_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c49bc7b764535..5d82f42ddd5cc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3175,6 +3175,22 @@ static inline void pagetable_pud_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+}
+
+static inline void pagetable_p4d_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 extern void __init pagecache_init(void);
 extern void free_initmem(void);
 
-- 
2.20.1

