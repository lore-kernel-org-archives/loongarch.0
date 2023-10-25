Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4261CAB2
	for <loongarch@lists.linux.dev>; Wed, 25 Oct 2023 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4L25iin"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9becde9ea7bso189393766b.0
        for <loongarch@lists.linux.dev>; Wed, 25 Oct 2023 06:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698239734; x=1698844534; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9RaUlU1nxCqKDcemUMCbFBahiSg15h6A7+woT7EpFjA=;
        b=K4L25iinXCR+UZPaIWmUAuIiOfTGdTpsQNvdfRPBCkMS7HJHUmGlPoEIvw03IURV89
         92e6VgC7vjLpvsM2cBzErKWb+Obebn0AHBh576ptP9TMDm8q2iPG8DgsxyETklybgWnh
         KxZ/O/hFjdQIAdI2Rwdt2I2xYVR9JvHuWyVXPmRyVrU13AR1nNRHUl39L4bzAMeO2zaA
         GjBAloU94Pe51ESSnCu9xB2E3EUL9ftxm4Aj5HL108tTtkfy51wP5p7114s2gBLhs7CV
         u15/iCOvqZa+pptR7E50IxKCjwCDWo6pMN4OiRxeD+osc8HwoCRUNM8oScNjSMEZ+WIz
         AM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698239734; x=1698844534;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RaUlU1nxCqKDcemUMCbFBahiSg15h6A7+woT7EpFjA=;
        b=tXOaypvq6c8quGk7H3+W0gRKWHaEfr1MeWo10vqwkmtF1d9BII3GoefkRfsJLT5q2o
         L7U/g/TwbIZSO7/JArUyKU4CbQwG6uMT/1fyHrWjoGVq1wIW1cAMwZsKhKNiScJyRED3
         nGhEG9GNn93WybMQAit/eG298AQR/KCeOBgBkLXAy4HwFhB3AZNcMLFvLPADPcF6Cypp
         Cf6eUQS4H83+mxeBVyHMcakSV1mDc082VxOt7bMRs7eAQSJpxVmE0mL79GR8DP0QyTmd
         LZinOc1DD1H7wljYd1SP0NVpa7ahqjSToOJ0oGTdXGXKmnlqCFAJ7bHFmrbtRKzTztyE
         cbwQ==
X-Gm-Message-State: AOJu0YxRXcPgys3MNBRlaRMuhHnRkSos4l6OnTbeW39vcv3V/sCOWTWu
	0/j4+z5F5+EX6sX5WDiUQ+m4/OPwM4sY/cUYf9s=
X-Google-Smtp-Source: AGHT+IGf0RFhqVSBCtZWMVshUEqDHl2Mhw5MfY0Igi6bPLXi+zIldIN36bhKyeMs64sCzHBPAcBSh0Gu0kSB2/0dvw8=
X-Received: by 2002:a17:906:fe06:b0:9a9:f042:deb9 with SMTP id
 wy6-20020a170906fe0600b009a9f042deb9mr14576255ejb.19.1698239733182; Wed, 25
 Oct 2023 06:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Liam Ni <zhiguangni01@gmail.com>
Date: Wed, 25 Oct 2023 21:15:21 +0800
Message-ID: <CACZJ9cUggCs1E_E_CKJzK=TVN9v+s=tegsHV_8NczsPB5OhW5w@mail.gmail.com>
Subject: [PATCH V7] NUMA: optimize detection of memory with no node id
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
+   if (!memblock_validate_numa_coverage(SZ_1M))
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
+   if (!memblock_validate_numa_coverage(SZ_1M))
        return -EINVAL;

    /* Finally register nodes. */
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 1c1072e3ca06..a94efe977539 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -120,6 +120,7 @@ int memblock_physmem_add(phys_addr_t base,
phys_addr_t size);
 void memblock_trim_memory(phys_addr_t align);
 bool memblock_overlaps_region(struct memblock_type *type,
                  phys_addr_t base, phys_addr_t size);
+bool memblock_validate_numa_coverage(unsigned long threshold_bytes);
 int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
diff --git a/mm/memblock.c b/mm/memblock.c
index 0863222af4a4..a1917aa331d6 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -734,6 +734,40 @@ int __init_memblock memblock_add(phys_addr_t
base, phys_addr_t size)
    return memblock_add_range(&memblock.memory, base, size, MAX_NUMNODES, 0);
 }

+/**
+ * memblock_validate_numa_coverage - check if amount of memory with
+ * no node ID assigned is less than a threshold
+ * @threshold_bytes: maximal number of bytes that can have unassigned node
+ * ID (in bytes).
+ *
+ * A buggy firmware may report memory that does not belong to any node.
+ * Check if amount of such memory is below @threshold_pages.
+ *
+ * Return: true on success, false on failure.
+ */
+bool __init_memblock memblock_validate_numa_coverage(unsigned long
threshold_bytes)
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
+   if ((nr_pages << PAGE_SHIFT) >= threshold_bytes) {
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
