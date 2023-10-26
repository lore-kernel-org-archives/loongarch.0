Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6F446A6
	for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 02:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwcSnJz7"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5aa7172bafdso357392a12.1
        for <loongarch@lists.linux.dev>; Wed, 25 Oct 2023 19:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698285819; x=1698890619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5Aqv6dlA0H+Btg56Nn64Q5cxiHM9wUKXyXUnjiSU3A=;
        b=CwcSnJz74zNeOQ4hnKGiXvHv1vtZQ1NELABSsKnb4hROS+mhkbKb824041I5ntoZdL
         FgRUWNuduixWSaq4G6YJZQvrsmQo38nYmVY1QVA4I8qA2cCdSgQ9UNquGq2k3fMNlFTd
         r16Y0FbOUqGDLGnF6JL83W08LZuEGUIhOS9W4YDcwPrPVKGtfuYeKLTdGvMXAI0qbikj
         m/+xsVoWQdLKtVW3vuuo+MZi8CCTMqBAn8m8qnspAWuoq45mdVOtkL2M83CVs3plewtJ
         4Z7UBRV1tpWkdOXPfiR1ttgD5QJQAbDeHpeviYRIJdiiHWVXgT3IN4sr3Z813V9WSlR7
         nEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698285819; x=1698890619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5Aqv6dlA0H+Btg56Nn64Q5cxiHM9wUKXyXUnjiSU3A=;
        b=w3ETVTEhxVCsrEsoLyNH6WWH9Aljsi+s2jP6uR2Fn6reDYnGnziOVly1rBbX13Jqkz
         /PwcwQbK0PW7Z24hsrYJaatV8lDPFPCnErbSS9psxefiVY2qY3eDh3KJP9BnUeKUE4KZ
         ni5Bw/TNJ4rcTUX23qtdZ+BEbXgowuslBT2iW/7S5F3rzbvUXttpdYt5Tm0Mmt6LZleW
         xvHNdj2H/5bgm+ihimNm4hJIzQkEKiLIYD0vsKwEr0Do7aCgec9qV7J6E5KO6q78u1dJ
         LZm1nZH0fHPKohShDC9W51wMW3m/pkBz6ClM8jq3mNj7BHZ58jNTbSSYb7z+tBZC/vas
         w7DA==
X-Gm-Message-State: AOJu0YzW6DI1ZgAOI2OgY4dTkZbGzEuX4DUTxA3jxXgt0FH6QKsu/L/E
	4HRb+IWFVvJS8zhwJpfRi+g=
X-Google-Smtp-Source: AGHT+IHtZOR273U91ceyKReQ/5kBhO+DzSBKVAs+uLU758ZOC3HkSK5KXuOScCLjzVRRYYvpCqf6LQ==
X-Received: by 2002:a17:90b:4a4e:b0:27c:f9e7:30fd with SMTP id lb14-20020a17090b4a4e00b0027cf9e730fdmr13993763pjb.7.1698285818787;
        Wed, 25 Oct 2023 19:03:38 -0700 (PDT)
Received: from localhost.localdomain ([180.169.121.82])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a1a1600b0027d0d4d4128sm597371pjk.25.2023.10.25.19.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 19:03:38 -0700 (PDT)
From: Liam Ni <zhiguangni01@gmail.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	rppt@kernel.org
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	maobibo@loongson.cn,
	chenfeiyang@loongson.cn,
	zhiguangni01@gmail.com,
	zhoubinbin@loongson.cn
Subject: [RESEND PATCH V7] NUMA: optimize detection of memory with no node id assigned by firmware
Date: Thu, 26 Oct 2023 10:03:29 +0800
Message-Id: <20231026020329.327329-1-zhiguangni01@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sanity check that makes sure the nodes cover all memory loops over
numa_meminfo to count the pages that have node id assigned by the firmware,
then loops again over memblock.memory to find the total amount of memory
and in the end checks that the difference between the total memory and
memory that covered by nodes is less than some threshold. Worse, the loop
over numa_meminfo calls __absent_pages_in_range() that also partially
traverses memblock.memory.

It's much simpler and more efficient to have a single traversal of
memblock.memory that verifies that amount of memory not covered by nodes is
less than a threshold.

Introduce memblock_validate_numa_coverage() that does exactly that and use
it instead of numa_meminfo_cover_memory().

Signed-off-by: Liam Ni <zhiguangni01@gmail.com>
---
 arch/loongarch/kernel/numa.c | 28 +---------------------------
 arch/x86/mm/numa.c           | 34 ++--------------------------------
 include/linux/memblock.h     |  1 +
 mm/memblock.c                | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 59 deletions(-)

diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index cb00804826f7..0e69679bfc8d 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -226,32 +226,6 @@ static void __init node_mem_init(unsigned int node)
 
 #ifdef CONFIG_ACPI_NUMA
 
-/*
- * Sanity check to catch more bad NUMA configurations (they are amazingly
- * common).  Make sure the nodes cover all memory.
- */
-static bool __init numa_meminfo_cover_memory(const struct numa_meminfo *mi)
-{
-	int i;
-	u64 numaram, biosram;
-
-	numaram = 0;
-	for (i = 0; i < mi->nr_blks; i++) {
-		u64 s = mi->blk[i].start >> PAGE_SHIFT;
-		u64 e = mi->blk[i].end >> PAGE_SHIFT;
-
-		numaram += e - s;
-		numaram -= __absent_pages_in_range(mi->blk[i].nid, s, e);
-		if ((s64)numaram < 0)
-			numaram = 0;
-	}
-	max_pfn = max_low_pfn;
-	biosram = max_pfn - absent_pages_in_range(0, max_pfn);
-
-	BUG_ON((s64)(biosram - numaram) >= (1 << (20 - PAGE_SHIFT)));
-	return true;
-}
-
 static void __init add_node_intersection(u32 node, u64 start, u64 size, u32 type)
 {
 	static unsigned long num_physpages;
@@ -396,7 +370,7 @@ int __init init_numa_memory(void)
 		return -EINVAL;
 
 	init_node_memblock();
-	if (numa_meminfo_cover_memory(&numa_meminfo) == false)
+	if (!memblock_validate_numa_coverage(SZ_1M))
 		return -EINVAL;
 
 	for_each_node_mask(node, node_possible_map) {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 2aadb2019b4f..4079c9edaa93 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -447,37 +447,6 @@ int __node_distance(int from, int to)
 }
 EXPORT_SYMBOL(__node_distance);
 
-/*
- * Sanity check to catch more bad NUMA configurations (they are amazingly
- * common).  Make sure the nodes cover all memory.
- */
-static bool __init numa_meminfo_cover_memory(const struct numa_meminfo *mi)
-{
-	u64 numaram, e820ram;
-	int i;
-
-	numaram = 0;
-	for (i = 0; i < mi->nr_blks; i++) {
-		u64 s = mi->blk[i].start >> PAGE_SHIFT;
-		u64 e = mi->blk[i].end >> PAGE_SHIFT;
-		numaram += e - s;
-		numaram -= __absent_pages_in_range(mi->blk[i].nid, s, e);
-		if ((s64)numaram < 0)
-			numaram = 0;
-	}
-
-	e820ram = max_pfn - absent_pages_in_range(0, max_pfn);
-
-	/* We seem to lose 3 pages somewhere. Allow 1M of slack. */
-	if ((s64)(e820ram - numaram) >= (1 << (20 - PAGE_SHIFT))) {
-		printk(KERN_ERR "NUMA: nodes only cover %LuMB of your %LuMB e820 RAM. Not used.\n",
-		       (numaram << PAGE_SHIFT) >> 20,
-		       (e820ram << PAGE_SHIFT) >> 20);
-		return false;
-	}
-	return true;
-}
-
 /*
  * Mark all currently memblock-reserved physical memory (which covers the
  * kernel's own memory ranges) as hot-unswappable.
@@ -583,7 +552,8 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
 			return -EINVAL;
 		}
 	}
-	if (!numa_meminfo_cover_memory(mi))
+
+	if (!memblock_validate_numa_coverage(SZ_1M))
 		return -EINVAL;
 
 	/* Finally register nodes. */
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 1c1072e3ca06..a94efe977539 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -120,6 +120,7 @@ int memblock_physmem_add(phys_addr_t base, phys_addr_t size);
 void memblock_trim_memory(phys_addr_t align);
 bool memblock_overlaps_region(struct memblock_type *type,
 			      phys_addr_t base, phys_addr_t size);
+bool memblock_validate_numa_coverage(unsigned long threshold_bytes);
 int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
diff --git a/mm/memblock.c b/mm/memblock.c
index 0863222af4a4..397d61c4896a 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -734,6 +734,40 @@ int __init_memblock memblock_add(phys_addr_t base, phys_addr_t size)
 	return memblock_add_range(&memblock.memory, base, size, MAX_NUMNODES, 0);
 }
 
+/**
+ * memblock_validate_numa_coverage - check if amount of memory with
+ * no node ID assigned is less than a threshold
+ * @threshold_bytes: maximal number of pages that can have unassigned node
+ * ID (in bytes).
+ *
+ * A buggy firmware may report memory that does not belong to any node.
+ * Check if amount of such memory is below @threshold_bytes.
+ *
+ * Return: true on success, false on failure.
+ */
+bool __init_memblock memblock_validate_numa_coverage(unsigned long threshold_bytes)
+{
+	unsigned long nr_pages = 0;
+	unsigned long start_pfn, end_pfn, mem_size_mb;
+	int nid, i;
+
+	/* calculate lose page */
+	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
+		if (nid == NUMA_NO_NODE)
+			nr_pages += end_pfn - start_pfn;
+	}
+
+	if ((nr_pages << PAGE_SHIFT) >= threshold_bytes) {
+		mem_size_mb = memblock_phys_mem_size() >> 20;
+		pr_err("NUMA: no nodes coverage for %luMB of %luMB RAM\n",
+		       (nr_pages << PAGE_SHIFT) >> 20, mem_size_mb);
+		return false;
+	}
+
+	return true;
+}
+
+
 /**
  * memblock_isolate_range - isolate given range into disjoint memblocks
  * @type: memblock type to isolate range for
-- 
2.25.1

