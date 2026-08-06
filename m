Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A911B43786A
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008952; cv=none; b=UMcOQ+fem5OHzDSE3aoNxAjhu2BytonQIRAJ+JHi+Os4yVSXwzUNxBXM1JzMOcmEM4ZKP2Vt4BFAk/Kfw36RCmxQLpLd6cjDAojFOnhBcxRjxDJ5/QUOwFRPqGmiIyD9OI43KzKoBd9AS0XeN/bMSuHDH4BMw2+0ijpiR66+CbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008952; c=relaxed/simple;
	bh=PZZL/NWy6VBObnRhtunYLM2umAGqZc9M5rEhiePSLao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeSabil8QX/m+s5C6Vq59WOVYWlKnJW4MsKBZtQNNBH6T6885gZF1YSV6xZJ+Ng8nUDXrpaByWLvXoq83Web4UAz0NNFSQPCc3KTgeJ9WX8WkZj7HylWzmiLPMhrt4/Zi2ZrxKmuFCCkJHzlndrpYwkm9RmhEj57S1KjiQL27Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQaCcOLI; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQaCcOLI"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so1142914a12.0
        for <loongarch@lists.linux.dev>; Thu, 06 Aug 2026 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008948; x=1786613748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gF4E42dXY09sWBsDK5gTPPv7oygQNLJ0717q+HvJkA=;
        b=FQaCcOLIGVuvgdDi/x0PtGuYkOBKOc2affQvZo547UIrClp8I2vzQWM3G/S5WDRiF2
         R3Wd6ulSUDMEnoue8FVQZ9heEYZq9vo1wGRW4uHo4W/2MrkKAZX1/4dnEFwJcEseE7Dy
         iiNz3CIGEOO2mXhrtxaHfhxoq/4lYrbiZIMbgbDaH70B/m3HKdTR89Kryxrwi9L/OpkC
         ZJOYv8MYaQ+sF/Q3FjHTdZqOmycMwqzFgD0O7SFAHj2cWJL37JfpZTpHqF2PBbWIZX1e
         rW0mVZBspCQCzQ1WrNELyWppxpaJML5UgVAPdpsggR0vB47kr8dBZrX+GvjMURpBw30l
         FtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008948; x=1786613748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gF4E42dXY09sWBsDK5gTPPv7oygQNLJ0717q+HvJkA=;
        b=JMSiclPQGClY1iXQSVbk7cU/qyjVJyLGl0G61wSZkJVWPYzp2+M9xLvT5rbiisE6Wq
         10aO13sgUrXi49mvoEBrsDMstb0yntWHAnPp16/A6lMV/VM6HiPmVpqIYOZyGYbCcU3m
         a8+RjhBOMHydoeo51MCVap/7ZXQESHR8zdKs5zAHVC2WHtlBmLlNqWsJGnGBYuNW1PL4
         yf/jpL5jfLZ5SNIvVQwH+IY0V3Hp6IPUh07bgm6oZjAnWl3hyjU4hW1LBQZK3GqrsyBd
         dyFXwBMmOlf6nZl7ucNFzglC12mfXI3ocPUm+t5ncNljIT5e2iclaOCI+sgxnGKUabBm
         8+Aw==
X-Forwarded-Encrypted: i=1; AHgh+Rrq1KLdTT6JhhcGsptBkLpqEJ/1Ww0M+YSCER5w5eGS8KsCNkEaHa2yNC3kO6YBL0n5pw/0dzdQ+jI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRb+bd5gGbdRtHmr7kXwmMuooEOXYFFAiIlLg8knm0+jwLn/E1
	kaRcD5qZralgFf9fPyiRWdYEFhzzRJfaWTWQw8vfqOj2QuIPQMDgoycI
X-Gm-Gg: AR+sD12U4byUAcSfMXg1/jXJkYka+nR1+zyK/4Yesp3oKQNAf2zOmqekbwlQgDnkGjg
	EMeV0gxYz/2gB0HdDaYqKbaj1uxgR9LLcAIF33H1zeYPpU+xVfmhhCfCxj3N773E900DB/rwn5g
	VtKqVR4C3EjQqn8rHOOfVaHMJeppI4lvxeeNGhUfN7SOm1+vIQ1vOUaxhWFv8w5lrH4Nh4i3xRo
	/NZ+tOkc+5Knc9b48WTZzHyi2mD4zEcURQUpzA/+i0IEOcCidYqtrpTKnnMBEujRx5l3IqYP/WU
	SurhOcDRX2Dy7Vrxh7s5byIvuosBMPZA048/WinES4+4SVZCxZYU2YH+wF7pqO+EyRn19SrFAF5
	6G/wvmsg9Qcph83OTlUDtndBxMxfUevxJfNyMpT92C+pubIJRnfz5as9L8xAji1/YZpdKwcOUoH
	lIdRSOv0DfWwaiTXkGCflhIh8CuMc/1R1lkJtGmvL0i/7rZI7qFc6rjMeCrsbJZ0tY6qq969IDZ
	A==
X-Received: by 2002:a05:6a00:302a:b0:848:7443:f2de with SMTP id d2e1a72fcca58-84f2dff77cbmr16112920b3a.13.1786008947826;
        Thu, 06 Aug 2026 02:35:47 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:35:47 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 1/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Thu,  6 Aug 2026 17:35:12 +0800
Message-ID: <20260806093519.2907771-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory and /memreserve/ entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d62db9e776cf..b2fcf11fba2b 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 void reset_all_zones_managed_pages(void);
@@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_SCRATCH;
 }
 
+static inline bool memblock_is_nodump(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_NODUMP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..79231634c25b 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
 }
 
+/**
+ * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Mark the region as not to be included in crash dumps.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_NODUMP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2886,6 +2901,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

