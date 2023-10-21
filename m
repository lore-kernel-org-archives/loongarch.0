Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02A64C8D
	for <loongarch@lists.linux.dev>; Sat, 21 Oct 2023 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZNjA3YD"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so277337666b.3
        for <loongarch@lists.linux.dev>; Sat, 21 Oct 2023 06:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697894132; x=1698498932; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A4ojW8MhOkGMt4rZFKfvqTzl9hsgFK5wHWRIWJqgdLo=;
        b=EZNjA3YD2YHojHkdZkJgY+T4jFViUHVb1J1S6XRIUwiUhNmtRmFGorKikww66bR1y2
         6LkBSLqWHrNZ2qY22nWrUQGWtEKk9vVHtE01ga/IS1QDin39IQ3Ib8QBMx/1tuRrfAiL
         0D3zN/uLsxZllwQ5RYHSCQcuswsALQXGtqfrtTOYMHmR99A96ntIyoU+dZbackMpcX18
         l3hBxspzFyPvGfFtAgpYLdqeB86SA/lLMzQ8oc0pnEa5R7PzsUNY5gqJTlC/AWRIU894
         vZXk7VHT9u/YzdKLwr6xBVCelqYT7eTfbt9AFBo+9Wt10uuuiBFSHWVrKS1UQYXdjfIX
         EfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697894132; x=1698498932;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4ojW8MhOkGMt4rZFKfvqTzl9hsgFK5wHWRIWJqgdLo=;
        b=tFYAOUam2QD+RAU0I08Q11pvKepY1/wAvk4J3qQTRrv13RUweHjWYk5wdgOmuPFTm6
         SiT7tM6s3a4Cjm/hw+2rmrbjrF+UE4qrTyLEW4oJY77q6Njru+lISUudA0hX57mnuHA0
         47s/LbpMebdorAhFNiC+goDVhOiO+DOoH1iDdz0oMEsSBQmBe/+/umHw+inj+QkdxbG1
         mPd6RXi0VtBURlMp2gdoV0KY+vlBLYHqX4ed0L6RKq8Xkkim5zniYpxaeIEQVgAv31Io
         42yczJu26FW2nNic/AhUABCDHDMBfa6HUYcSPSjcEyF1pCcmjNFatRHFIcs8mBR9Xa7f
         5feQ==
X-Gm-Message-State: AOJu0Yw9xyMeOCNsAsCX1ecRm/RBoI9CIfVt+yXHTPyQ1jGtPYu/S6CM
	klOaWium+YWMKd9m77PPyxg+szeqzysxLLhL5kA=
X-Google-Smtp-Source: AGHT+IFoFNN2vZXrdO/ozDp8lvS7xbWE01Ti8oHMgJBNaHnMtWvFGLqUvKa1chGI1bavLM08v2K9U9DDFNMT3m1qMbA=
X-Received: by 2002:a17:907:9445:b0:9bd:d405:4e80 with SMTP id
 dl5-20020a170907944500b009bdd4054e80mr3260573ejc.46.1697894131611; Sat, 21
 Oct 2023 06:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Liam Ni <zhiguangni01@gmail.com>
Date: Sat, 21 Oct 2023 21:15:20 +0800
Message-ID: <CACZJ9cUzd-33v3B_DckkCrMzX=bHdABT1Hy0235uKrSJc0NN3Q@mail.gmail.com>
Subject: [PATCH V6] NUMA: optimize detection of memory with no node id
 assigned by firmware
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, 
	Dave Hansen <dave.hansen@linux.intel.com>, luto@kernel.org, peterz@infradead.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, maobibo@loongson.cn, 
	chenfeiyang@loongson.cn, Zhiguang Ni <zhiguangni01@gmail.com>, zhoubinbin@loongson.cn
Content-Type: text/plain; charset="UTF-8"

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
index cb00804826f7..84e1b046ab52 100644
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
-   int i;
-   u64 numaram, biosram;
-
-   numaram = 0;
-   for (i = 0; i < mi->nr_blks; i++) {
-       u64 s = mi->blk[i].start >> PAGE_SHIFT;
-       u64 e = mi->blk[i].end >> PAGE_SHIFT;
-
-       numaram += e - s;
-       numaram -= __absent_pages_in_range(mi->blk[i].nid, s, e);
-       if ((s64)numaram < 0)
-           numaram = 0;
-   }
-   max_pfn = max_low_pfn;
-   biosram = max_pfn - absent_pages_in_range(0, max_pfn);
-
-   BUG_ON((s64)(biosram - numaram) >= (1 << (20 - PAGE_SHIFT)));
-   return true;
-}
-
 static void __init add_node_intersection(u32 node, u64 start, u64
size, u32 type)
 {
    static unsigned long num_physpages;
@@ -396,7 +370,7 @@ int __init init_numa_memory(void)
        return -EINVAL;

    init_node_memblock();
-   if (numa_meminfo_cover_memory(&numa_meminfo) == false)
+   if (!memblock_validate_numa_coverage(SZ_1M >> PAGE_SIZE))
        return -EINVAL;

    for_each_node_mask(node, node_possible_map) {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 2aadb2019b4f..39772d551924 100644
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
-   u64 numaram, e820ram;
-   int i;
-
-   numaram = 0;
-   for (i = 0; i < mi->nr_blks; i++) {
-       u64 s = mi->blk[i].start >> PAGE_SHIFT;
-       u64 e = mi->blk[i].end >> PAGE_SHIFT;
-       numaram += e - s;
-       numaram -= __absent_pages_in_range(mi->blk[i].nid, s, e);
-       if ((s64)numaram < 0)
-           numaram = 0;
-   }
-
-   e820ram = max_pfn - absent_pages_in_range(0, max_pfn);
-
-   /* We seem to lose 3 pages somewhere. Allow 1M of slack. */
-   if ((s64)(e820ram - numaram) >= (1 << (20 - PAGE_SHIFT))) {
-       printk(KERN_ERR "NUMA: nodes only cover %LuMB of your %LuMB
e820 RAM. Not used.\n",
-              (numaram << PAGE_SHIFT) >> 20,
-              (e820ram << PAGE_SHIFT) >> 20);
-       return false;
-   }
-   return true;
-}
-
 /*
  * Mark all currently memblock-reserved physical memory (which covers the
  * kernel's own memory ranges) as hot-unswappable.
@@ -583,7 +552,8 @@ static int __init numa_register_memblks(struct
numa_meminfo *mi)
            return -EINVAL;
        }
    }
-   if (!numa_meminfo_cover_memory(mi))
+
+   if (!memblock_validate_numa_coverage(SZ_1M >> PAGE_SIZE))
        return -EINVAL;

    /* Finally register nodes. */
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 1c1072e3ca06..727242f4b54a 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -120,6 +120,7 @@ int memblock_physmem_add(phys_addr_t base,
phys_addr_t size);
 void memblock_trim_memory(phys_addr_t align);
 bool memblock_overlaps_region(struct memblock_type *type,
                  phys_addr_t base, phys_addr_t size);
+bool memblock_validate_numa_coverage(const u64 threshold_pages);
 int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
diff --git a/mm/memblock.c b/mm/memblock.c
index 0863222af4a4..ebea0c204eaa 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -734,6 +734,40 @@ int __init_memblock memblock_add(phys_addr_t
base, phys_addr_t size)
    return memblock_add_range(&memblock.memory, base, size, MAX_NUMNODES, 0);
 }

+/**
+ * memblock_validate_numa_coverage - check if amount of memory with
+ * no node ID assigned is less than a threshold
+ * @threshold_pages: maximal number of pages that can have unassigned node
+ * ID (in pages).
+ *
+ * A buggy firmware may report memory that does not belong to any node.
+ * Check if amount of such memory is below @threshold_pages.
+ *
+ * Return: true on success, false on failure.
+ */
+bool __init_memblock memblock_validate_numa_coverage(const u64 threshold_pages)
+{
+   unsigned long nr_pages = 0;
+   unsigned long start_pfn, end_pfn, mem_size_mb;
+   int nid, i;
+
+   /* calculate lose page */
+   for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
+       if (nid == NUMA_NO_NODE)
+           nr_pages += end_pfn - start_pfn;
+   }
+
+   if (nr_pages >= threshold_pages) {
+       mem_size_mb = memblock_phys_mem_size() >> 20;
+       pr_err("NUMA: no nodes coverage for %luMB of %luMB RAM\n",
+              (nr_pages << PAGE_SHIFT) >> 20, mem_size_mb);
+       return false;
+   }
+
+   return true;
+}
+
+
 /**
  * memblock_isolate_range - isolate given range into disjoint memblocks
  * @type: memblock type to isolate range for
-- 
2.25.1
