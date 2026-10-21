Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571502;
	b=r2wgbMwYr96dDRm/vKZc9zjNtpYPsDnlZ8PhtlSTdHrm9jtOUqlz+1yVLVxww0pml3L+
	 PzV/ZIcbwtjxbQXDBGsmlbjAuimPozbeZRk7RLOvHRd0YQxu1cAF1LdNfgUwpkODxL0wY
	 6vGhtvQyL8NCRooQizhSHhcxpskBMC79Rbp32q1OKS/Ogi6vvuAKK6r7UOqpogzbQF2M/
	 ChfZs1mvdDT5g/sN/AG3aYQ5A4VzZgO7nbaeKqpmH70FO3tiSeUF4UbVsjuat8DVKrgjf
	 GnrUnVY3NoKhwLcDTgHSc4IWzBfE9977pHFJZi/CAnXTUBgy2MDh6E92/tzooZa0BqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
	b=iiMLTohnWraQLq5LXx43zPW+SG7hibs8vHYfoWugfMLNL/QMLmo69WE3F7/7TOur6883
	 bqYRMytJ72JArbKMdFDKw03f+83L5zPc8OhsZY1O6UTiKJl/7uiCtjqOYUJ6Xxmac9aVC
	 xwv4YEGjRScqJL1bY73s5JY4WZDxK/x/6usVv5vEa8MncnFPX1HyWEKYHZpNZnhRFu9Fv
	 0Q+aQrR5nAqizgMxcfUL72tcwcaDrY9tPXwRPfxqg2NpC6kFTf7vcLoAFd3Qs0R4iXXJ0
	 UqtL7Q5DMAhcb5/NMvWvwMWWMAyZudKtZ+ymum0Y3qPpHVqWKp2zHmGFSaQmDTuyA/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GV8AbPFw;
	arc=none smtp.remote-ip=74.125.228.6
Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBBE606A319
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 08:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBBE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GV8AbPFw
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cd613507bd1so29560a12.0
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571502; x=1793176302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
        b=GV8AbPFwfkDfmE4o0Cj3SP62QOPrFStHX3bDrt79t0IViXXaG9+UkO7PdzXl5chHYG
         nzr8mzyxtm+SuyknIKoCUAb0DJPn6ZvJ+dxWINzNiz80o/AwqmXDKIq0kNBuE9XfxsqZ
         ifzWK6kQmsxfiH+v/jlO325hJx53l/JAsUsld2318A3GfuBXGhaqRT2Sy+TP4OwLYSLh
         4gdz560AyI6WGlzb5OERsCTeMrbCya5SUu95dewKagx58e5BRep0pBz46g7kaHVZpERN
         n5x54GtlBeZ8X3hiOacGNtI5cOijUJy+J4Bkh1HvscsElWcHiD24KiNVcQyNXjaG3wWA
         NYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571502; x=1793176302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
        b=0pa1i72v2XV8egzAaTYs9t/lfP7MNe8ufPi3y8aOnZPmjM+vE8TJ5B7iYcJXxLWUK/
         faO1FBnoB7ZodJKwcD+hEUL83krpZ8ys0Bc+Vds7UJPsr+TKCGFTgKfLQBhGUcFanxtv
         0qzKfDfvwpas4xpvGmNgGy1Pi8ygB8/4QNhuOmyU6l4jcEqaecUQpAYT1XgYm/zwJV2M
         k2ZA+HLashEMcG+7ziqQnNOz5votWieTscU/oxtdX2Yh1UPtEqhI8dN4jg7kMelsr0VR
         ArA5993aB8WPPdorJeVtQnA3F6nfEOsFNy24iL5NWeYzvIkYgVsAMcgXwwxHq1BtWn/0
         xT3w==
X-Forwarded-Encrypted: i=1; AKwUvBz/6W1Z3MBqK/ulv/SfkkLt2y+cx/IMPasgPZH5XeHDgI6rNSp9N6/qXa7YKZBeiqcBdqKfICQI0I4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKGmsZZfHfs2IblS32ard/8SYm26l7IZqwFhCgW48DxNmwO9cpL
	ZaiIKoAHyRcAkAjbfx6PHHWL17Rx4ORYi6KlvtsQbh+sM01Uoie/Q3vC
X-Gm-Gg: AYBFou3kYS3scimphDEj5p3yDoaq551vMw90UiMcMufVUeLJYZyYKOIKwXfknR/Otvw
	/yccXGwONyo5PgLJkDbHze30XkvX19E1wC93/W38NIUpuRiF68KmtWXqEbwZ3xgeJuZ6ixTBRJV
	oyMhb72xnXi1dULT42Pc/Uwxf3xQOopbDiRyMbOU3xA6RNsSqfVf/i/TG9SKspwbwtI09hafTM/
	MifTEd4p6PpvHhD2N6DJk7RjqxCl4yW4hIZiiha0QHo+GjzTTFHhVJz6Fn/OdZvp0Vjclm5kYFp
	xikTkhKlP192jvzYsGYPFIAyEFQgHC4XWp5y053fmHqIeOsAb0sf/IUonBCMQAA+TiSJpLKAnn1
	h+4UDVKKWqYwkcmUGp0eGRkjgct1YpgQV0c98975/tlRqg8pro/m0QHRgclU5wTgJGvCeEcu1+s
	4ngmwhpv6rdJVIP9eFywzW63ose6S4xlFbk+h0TYEjNNnvH/8RBT22VUaxAg19M53wklojg8wBQ
	pjvXL+1RIXpvTyP8tgNtp8FzcHRr27xEtHqiWXDzxovA2PGawhaaPY4gVkk6ZhUsrjzC3npLtzS
	GeRhNlgCscfrSw==
X-Received: by 2002:a05:6a00:2d12:b0:882:e366:d99f with SMTP id d2e1a72fcca58-8a089d871famr1118755b3a.51.1792571501524;
        Wed, 21 Oct 2026 01:31:41 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:39 -0700 (PDT)
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
Subject: [PATCH v9 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Wed, 21 Oct 2026 16:30:08 +0800
Message-ID: <20261021083011.2170525-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
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
index 40e6e0aa2f8d..67dbcfda6f49 100644
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
index a450092a80fb..ab1432241432 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1221,6 +1221,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
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
@@ -2854,6 +2869,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

