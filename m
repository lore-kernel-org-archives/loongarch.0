Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107713B05AB
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131430; cv=none; b=MjrL6iFr1l15Pzcop25gbyrR/m3dE4pflWnyqQLPfKAN5MuqUkfTDFRlLfBc9o0gISC9NAarr/eB2u8JgSTzLYuRcUiQsYMgdb3iUj/blWAlm6x6XAgm1U2WWlElhwgbCmIKg1Nrw+Po8/njfp316xstEXCWil0UQFrDnKQVBsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131430; c=relaxed/simple;
	bh=xaYAGKNR5teVXSTbMIqN33NUXwD6fmITNKM3gCe5N4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeejbnMuDHM572i0qmncr94nE7B8fG2ceG7Stym6ShMY9W9bA8uU+F+X7nsxPGZFBV/ZxLkfuvcwu5DTg/sdOMHQM8EOBncfpc/ZZl4/WEc9U2rXpe28RJUYw3yxDJsxF+vfhBp4coi2rSZ46XhsJQxFq4EuJPKu5DlnGBIo1mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQJr1DOu; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQJr1DOu"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so349925a12.1
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 23:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131428; x=1792736228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=EQJr1DOurWQ73NFIltsDKpV3W4If+thUx33JY9cZyRwfiCNO00dFsLe+XJW/V+Z0B8
         usOVhIATlYGa4Q7kcbCi7SoxUC9IwMGIC7wTWug/EQTmhhDVqh/F2lXiTuumv65QwXOz
         wcW99waJfk6IXTKiE0WPLRxq+M2RwOUc5jh3oJ0d5TkTofdN+024zYLwmys0N1puWqu2
         ATkkw5juydPlojRYIL5JAZcmVzkCFipMqIk+TgiaQUERCdU72kcxyhkVkmXcuj8LvVKw
         EYURWTE52hr8qKSczGwfRgfo75QWfV2y1amJsau2YetVecEaLBG4pBTTwWijzJwj7crw
         3SnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131428; x=1792736228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=MmbJJH1Z3zsCidND+7kr2sg37XC4DK4458cqKzmoW/F3giwgTIPzvNhb/s6cOGlExl
         EPEn8dsHuCmDfbcEf/PKcYLEObRGXcV1ciPf+xiRSu5QBe8fxqN0pmrKXN4EMt3lDUg8
         yMMk4Bfy1iUEvMgARsQ8W76bdmhQ4uNPSkoT+Kc0s6BFzqAJaLh8Fy0H4UDzys4v0TYt
         ia9qAEaoZZdFnu5VWj3z5uUv36SrDiXyyMGm8+ru62HUGajFRo7RX0kyrQ4y5voDIUGO
         7b9p/KybsssaMzGAjDtd8tW7sGPJtGtfwAusHTOf1Bxhy0ItW6UZlSQwOIfbPzjpEgPB
         RViA==
X-Forwarded-Encrypted: i=1; AKwUvBw4tDXUE+woRtM5BsPRRzW+AZB59MpHeE2oCTFH0Ko/dFCkc2zWt2ebTdLypZb6hKUeu278f6bKwZ8=@lists.linux.dev
X-Gm-Message-State: AFq9FYLFaJe7KBh0zjCkm5gDRXeLv2s0N+CoApBamCHDBxiDZahZ70IM
	zf1kJHsKRhl5htFn7uPdKYumoGoqN9y80CRlJclLwVV+ckUHbzfUMFGU
X-Gm-Gg: AYBFou0+PK2xGOdrjxwOhGko8xOz0SY4/LqEFcRk/1pEJFi5JPiwEeat6Va5Ebsct9k
	zTQyHuyUs9xbr5URryAzv+s2NniLCyZ5meIf1tdHipFoYsHo3VDSmeEK7qRY2kQ40cccBsSoWOB
	y2UsbWCJJkUkDe6exmXIFT8nWU/z5a/ylVfIXoXY04iDqgMAcoSpeOO9zO++3iGhr3CQ8ONvB2U
	Hc0km8GEXC7Z7GlFimQunRgVMDzFS9e0S2MzXpYOPqbT9uWiWR/USs71IkWAOCY1Zm+igW45N0j
	aipJDMaR5fV55Ii12jUhGo/01NhpvgUM9V3PZBNgp/HJad5lyBSlUXbrHt3sBaI8r3UuTe1JwzB
	z+BS4I/jgJgkd0Uu1eB5OjkZ1XdJlq2cfDUpCze7VhluOdTALD/kBSmSMlp26NlML6J0+cxpS9H
	uh5TSg8E6Qm4Vs+ye4I/l7hSkMFMS9Br1eqMcCDIzfRawwYq3XCf6onH+IrE1kR57sOPltb5SCr
	q0kpKEe8L8=
X-Received: by 2002:a05:6a00:3404:b0:881:4b47:f31a with SMTP id d2e1a72fcca58-897c6539ee1mr20053354b3a.11.1792131428281;
        Thu, 15 Oct 2026 23:17:08 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:07 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [RESEND PATCH v8 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Fri, 16 Oct 2026 14:15:46 +0800
Message-ID: <20261016061549.4181390-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
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
patches wire this up for /reserved-memory entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index ea288cf21400..04fbdff2b808 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * know is good to use. It is the only memory that allocations may happen from
  * in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_NOPRSRV	= 0x40,	/* memory with no KHO preservations */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_noprsrv(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -305,6 +309,11 @@ static inline bool memblock_is_kho_noprsrv(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_NOPRSRV;
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
index cbb172fbf06a..31c89bd64036 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_NOPRSRV);
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
@@ -2880,6 +2895,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

