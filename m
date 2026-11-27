Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770527;
	b=PsbgMMkotTzeuKONDhb/+Fhz+ZCwzwFQyqh9cLjfU7vkhqPBXNulLG/n56Byvrh2vqXz
	 vMfe0CmDB7rokuBPsRWSO0WGlYSnNOTk3J7tHf66w0PBpffGaTCoBqF9qCwGCFSr8QzHc
	 7zDoceo4+DeqBap/Jcacb8P0PkGAgt0awCKIKKCTNaFkCqU42xafFSmKqpON/K0rK2l3w
	 IT2kb1EA7+8Hlz46Q/Ce6QH+SxVm4CnFKPszE8461B3z/JoyvdlaQ5IgwJbu8/ZA/lJ2Q
	 o/T92YG4A7N2VNz1lxfU1PhKUExWj0cI/2wC4RrqCJWUV5axBr/M6MIX6Mv01QPHHKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=;
	b=10Won8cNdIoUsd8qQCFCnP90YKs0kPS9/Dbw7hHb6Hcn8cATqPs6aUkYezFhYyn6099/
	 /d73ccnAGjvpNCaDaOREVzP3GC48gyOLFRdHDTTbwVdTyUs4QUIkXzdP0Zy04MgB0aT7m
	 0x+cQXejGpnm5eUN0K/hCzquRUa8/KeNKZY0yxO6PKwD+Wpta2tSdHc6aKJSjg2+q1ML9
	 JeA6atGv/cr8sbYcI64Ee5TIqPSgVSoMh2+5F/KqgtlYRxuQBri7Io3UJgBlrvFSG26rA
	 6ek6cuPYz5I96Cin/fUgPjMlrI3EbJL0OTzoPINwieqCRZdR3gaF1rcp4kyWQ+d+MJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SMKHCCrW;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70170606A324
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 09:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70170606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SMKHCCrW
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2f06c2c371aso21136525ad.1
        for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 01:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770526; x=1796375326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=;
        b=SMKHCCrWYoDCASnCUagv/9aP0g1h2JpiTE+s5C3LIzwaUiE9VDOnS+ydyeevJpeBSR
         DtPHcznQOEU58/aaHDfgkyu05ympxSLtEXovR2ABjLrr2HRzIumbMxAtBpbllOak5ox3
         QKL7C4aP8SJ+3juQ0rZOg5niOFOJ8XB6xYg3I+Ji484u05EdRhAGqRYRMSVxGflwu6Eh
         QIzbwvEWCY3Lqy9+WizCQttefbqayOn2jU1OMyeVdp4LE6tsGeMZIW77s+5NTmMzZ1/b
         MGr7rpHEc3nrbFN1+b8pvKsNd3mYv/pGsyc8XZ4FSEUHS3s5ZjcBJVD8gVZgUVq9+9dG
         Q3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770526; x=1796375326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=;
        b=qNcbL11G/hhzxuo4jZGNOtcuIk73WlmXuKU7Kro2rP9Ws4lS8lRkZfiCpdoecf2uPD
         3IPqn+YRdv+xa/vKmZhUeCBkEJfkET6JWWDGGtvoO0IZ3v4qOJlXp1a3nLsgoArTFW4O
         aK59lqB3reoJUqxu7/IKDNl4huvliZFU8qMnWWjfKNNP/EYKQ+2KouUhWM01g0GJcBiJ
         g5Eh+JPK/EjNtroPYdCYjIav3P210Wb1u2w64MqzCz8mNtVV7HqmVBISsq2nafCNN2st
         JT9lKFfcUVK/qPQ+0I7nukF99IWXVQnGL8EEbpyneg5H/89c+JK1flerRRrjszG2saZV
         ismQ==
X-Forwarded-Encrypted: i=1; AL+hErGGGXkfOlg0+hmdVvP2CUFCAfJf5OM/GrhcVGuaJOBhMQckuHk1Hx+axzykX9vEggWc4xMFIF2DyF4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZSS9GtgySxzBGVqQKEd7hmCkBMsW168asjoOaJJw+NA0K5Sss
	eqBb9raI75yIErw3kscA6NnQO6CuEa3X/Ija8otFyhlBptQHizSwfTl4
X-Gm-Gg: AZFdTZfz8xEytDwVa5yggXyDjcwi6mIDUlO0IOvFZUgHS4yaAYLs0csGCTOE9GIZS+H
	XcBV07GtaEMLx+0Fj9JGYOJaTISSvzUa4x4KjapW0XAjtpeiAPxcLNW1QeA/vOE8E9rI47SSa2b
	5XETlqMmpK3CciC7FJ9yvwo9dW+uEUeMqUGRJvo0fv6Tw+yXYbnbI5S5b1V8+0n2BEOwLhVZeX2
	RRE22E3h1yPF61UE20Xrg6FQhKjLlDVQ56BtTm6YA+29DZ2N3gmUFzPUikZwTPJHZ8PN3UznGGl
	ZwFCSosPpXC/wrfRsLM/RlYEgUc96DXdSV1rEwbQ2eCYEKFCoVpfrXVtFBLE03G5g1VAAOLtadP
	FZiTQxu9ktqvXcW3qJu63bSCDYu5wbLxyCfs6IrJozOvCwpGC9YF0ew6znTzbDb4BHnT/JgLYeI
	F0Kh2xOx3VThtvljgfu120+O7pLRJEEUtCK/C45zH0OXoMh1TDErGuOhLu5X0GSWZkY8dLN58Gd
	dkGoWyLMwFYxGVXZJAI84Lo6wzaW+F+z6t+vkIAJHvnYrGi1WNl6yAbBlAMhtPLIlAR1TcZD9Au
	u17B86jt77rLsUkVFOMz3Sd9wrN6j9NISyGXNGPivQ==
X-Received: by 2002:a05:6a21:8982:b0:3e2:4350:1528 with SMTP id adf61e73a8af0-4014a274c36mr23147815637.7.1795770525740;
        Fri, 27 Nov 2026 01:08:45 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:45 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Fri, 27 Nov 2026 17:07:20 +0800
Message-ID: <20261127090723.741253-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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
index 0f466fcfc719..e3ee7f60ec97 100644
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
@@ -2864,6 +2879,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

