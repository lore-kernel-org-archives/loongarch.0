Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7497F1F0E47
	for <loongarch@lists.linux.dev>; Tue, 15 Apr 2025 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701697; cv=none; b=Sbce27QSZGOOGcH5MxDoSOM1CRHhCqd/NwRiwtOayTj5SOhTmF7UbCMtEQPnO/8f/YVbul8eeG8CZb6weaq2Kb66FUuHDLUoWKmlRlLnvl2sjfBj+Mc00GetiHdw+od0AeDRD+3+WANY+k0bWIoXeqrPQNrKbewPgnabZQ0Xf/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701697; c=relaxed/simple;
	bh=RsQCaFvgcwZRaW8RJuvNkxNwJma63Jxod+DUeoQ2AZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A2//rYOaZtEDV0AlgsEO3As42dyvb4KyrZ/pu8Dw2MR0D88/5yNDJ5kZZaXneGuGd/TzFzbm0Uw0EeTpCeNgsD06tNCOI8ML1CNVf8UtlWkDM3tzLjrbAR5URb6wDoJdvLzjz+QmlBGEzjdqhOf3ZLmz5OrGRayQhdPcFqS6sX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.238])
	by gateway (Coremail) with SMTP id _____8AxquD9CP5nwY69AA--.10446S3;
	Tue, 15 Apr 2025 15:21:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.238])
	by front1 (Coremail) with SMTP id qMiowMBxHBv2CP5nAXuCAA--.2089S2;
	Tue, 15 Apr 2025 15:21:32 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH V2] LoongArch: Introduce the numa_memblks conversion
Date: Tue, 15 Apr 2025 15:21:18 +0800
Message-ID: <20250415072118.3774454-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxHBv2CP5nAXuCAA--.2089S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3KryUur4rCF1DGw47Ar1fAFc_yoWDKFyfpr
	Wqkrs5Gr45Gr1kWa4xt348uryDGwn7Wa9Iqa42kF9IvF12vrykZr48trsIvF98K3ykZF10
	van5G3W3WF48J3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsdb1UUUUU

Commit 87482708210ff3333a ("mm: introduce numa_memblks") has moved
numa_memblks from x86 to the generic code, but LoongArch was left out
of this conversion.

This patch introduces the generic numa_memblks for LoongArch.

In detail:
1. Enable NUMA_MEMBLKS (but disable NUMA_EMU) in Kconfig;
2. Use generic definition for numa_memblk and numa_meminfo;
3. Use generic implementation for numa_add_memblk() and its friends;
4. Use generic implementation for numa_set_distance() and its friends;
5. Use generic implementation for memory_add_physaddr_to_nid() and its
   friends.

Note: Disable NUMA_EMU because it needs more efforts and no obvious
demand now.

Tested-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig                 |   1 +
 arch/loongarch/include/asm/numa.h      |  14 ----
 arch/loongarch/include/asm/sparsemem.h |   5 --
 arch/loongarch/include/asm/topology.h  |   7 +-
 arch/loongarch/kernel/acpi.c           |  11 ---
 arch/loongarch/kernel/numa.c           | 108 +++----------------------
 arch/loongarch/mm/init.c               |   8 --
 mm/Kconfig                             |   1 +
 8 files changed, 16 insertions(+), 139 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 067c0b994648..fff3621b2eb1 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -186,6 +186,7 @@ config LOONGARCH
 	select MODULES_USE_ELF_RELA if MODULES
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
+	select NUMA_MEMBLKS if NUMA
 	select OF
 	select OF_EARLY_FLATTREE
 	select PCI
diff --git a/arch/loongarch/include/asm/numa.h b/arch/loongarch/include/asm/numa.h
index b5f9de9f102e..bbf9f70bd25f 100644
--- a/arch/loongarch/include/asm/numa.h
+++ b/arch/loongarch/include/asm/numa.h
@@ -22,20 +22,6 @@ extern int numa_off;
 extern s16 __cpuid_to_node[CONFIG_NR_CPUS];
 extern nodemask_t numa_nodes_parsed __initdata;
 
-struct numa_memblk {
-	u64			start;
-	u64			end;
-	int			nid;
-};
-
-#define NR_NODE_MEMBLKS		(MAX_NUMNODES*2)
-struct numa_meminfo {
-	int			nr_blks;
-	struct numa_memblk	blk[NR_NODE_MEMBLKS];
-};
-
-extern int __init numa_add_memblk(int nodeid, u64 start, u64 end);
-
 extern void __init early_numa_add_cpu(int cpuid, s16 node);
 extern void numa_add_cpu(unsigned int cpu);
 extern void numa_remove_cpu(unsigned int cpu);
diff --git a/arch/loongarch/include/asm/sparsemem.h b/arch/loongarch/include/asm/sparsemem.h
index 8d4af6aff8a8..4501efac1a87 100644
--- a/arch/loongarch/include/asm/sparsemem.h
+++ b/arch/loongarch/include/asm/sparsemem.h
@@ -21,11 +21,6 @@
 #define VMEMMAP_SIZE	0	/* 1, For FLATMEM; 2, For SPARSEMEM without VMEMMAP. */
 #endif
 
-#ifdef CONFIG_MEMORY_HOTPLUG
-int memory_add_physaddr_to_nid(u64 addr);
-#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
-#endif
-
 #define INIT_MEMBLOCK_RESERVED_REGIONS	(INIT_MEMBLOCK_REGIONS + NR_CPUS)
 
 #endif /* _LOONGARCH_SPARSEMEM_H */
diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/include/asm/topology.h
index 50273c9187d0..8d2efd7f7c43 100644
--- a/arch/loongarch/include/asm/topology.h
+++ b/arch/loongarch/include/asm/topology.h
@@ -19,11 +19,8 @@ extern int pcibus_to_node(struct pci_bus *);
 
 #define cpumask_of_pcibus(bus)	(cpu_online_mask)
 
-extern unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
-
-void numa_set_distance(int from, int to, int distance);
-
-#define node_distance(from, to)	(node_distances[(from)][(to)])
+int __node_distance(int from, int to);
+#define node_distance(from, to) __node_distance(from, to)
 
 #else
 #define pcibus_to_node(bus)	0
diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index 1120ac2824f6..49112b77da46 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -249,17 +249,6 @@ static __init int setup_node(int pxm)
 	return acpi_map_pxm_to_node(pxm);
 }
 
-void __init numa_set_distance(int from, int to, int distance)
-{
-	if ((u8)distance != distance || (from == to && distance != LOCAL_DISTANCE)) {
-		pr_warn_once("Warning: invalid distance parameter, from=%d to=%d distance=%d\n",
-				from, to, distance);
-		return;
-	}
-
-	node_distances[from][to] = distance;
-}
-
 /* Callback for Proximity Domain -> CPUID mapping */
 void __init
 acpi_numa_processor_affinity_init(struct acpi_srat_cpu_affinity *pa)
diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 30a72fd528c0..d6e73e8f9c0b 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -11,6 +11,7 @@
 #include <linux/mmzone.h>
 #include <linux/export.h>
 #include <linux/nodemask.h>
+#include <linux/numa_memblks.h>
 #include <linux/swap.h>
 #include <linux/memblock.h>
 #include <linux/pfn.h>
@@ -27,10 +28,6 @@
 #include <asm/time.h>
 
 int numa_off;
-unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
-EXPORT_SYMBOL(node_distances);
-
-static struct numa_meminfo numa_meminfo;
 cpumask_t cpus_on_node[MAX_NUMNODES];
 cpumask_t phys_cpus_on_node[MAX_NUMNODES];
 EXPORT_SYMBOL(cpus_on_node);
@@ -43,8 +40,6 @@ s16 __cpuid_to_node[CONFIG_NR_CPUS] = {
 };
 EXPORT_SYMBOL(__cpuid_to_node);
 
-nodemask_t numa_nodes_parsed __initdata;
-
 #ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
@@ -145,48 +140,6 @@ void numa_remove_cpu(unsigned int cpu)
 	cpumask_clear_cpu(cpu, &cpus_on_node[nid]);
 }
 
-static int __init numa_add_memblk_to(int nid, u64 start, u64 end,
-				     struct numa_meminfo *mi)
-{
-	/* ignore zero length blks */
-	if (start == end)
-		return 0;
-
-	/* whine about and ignore invalid blks */
-	if (start > end || nid < 0 || nid >= MAX_NUMNODES) {
-		pr_warn("NUMA: Warning: invalid memblk node %d [mem %#010Lx-%#010Lx]\n",
-			   nid, start, end - 1);
-		return 0;
-	}
-
-	if (mi->nr_blks >= NR_NODE_MEMBLKS) {
-		pr_err("NUMA: too many memblk ranges\n");
-		return -EINVAL;
-	}
-
-	mi->blk[mi->nr_blks].start = PFN_ALIGN(start);
-	mi->blk[mi->nr_blks].end = PFN_ALIGN(end - PAGE_SIZE + 1);
-	mi->blk[mi->nr_blks].nid = nid;
-	mi->nr_blks++;
-	return 0;
-}
-
-/**
- * numa_add_memblk - Add one numa_memblk to numa_meminfo
- * @nid: NUMA node ID of the new memblk
- * @start: Start address of the new memblk
- * @end: End address of the new memblk
- *
- * Add a new memblk to the default numa_meminfo.
- *
- * RETURNS:
- * 0 on success, -errno on failure.
- */
-int __init numa_add_memblk(int nid, u64 start, u64 end)
-{
-	return numa_add_memblk_to(nid, start, end, &numa_meminfo);
-}
-
 static void __init node_mem_init(unsigned int node)
 {
 	unsigned long start_pfn, end_pfn;
@@ -205,18 +158,6 @@ static void __init node_mem_init(unsigned int node)
 
 #ifdef CONFIG_ACPI_NUMA
 
-static void __init add_node_intersection(u32 node, u64 start, u64 size, u32 type)
-{
-	static unsigned long num_physpages;
-
-	num_physpages += (size >> PAGE_SHIFT);
-	pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx Bytes\n",
-		node, type, start, size);
-	pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
-		start >> PAGE_SHIFT, (start + size) >> PAGE_SHIFT, num_physpages);
-	memblock_set_node(start, size, &memblock.memory, node);
-}
-
 /*
  * add_numamem_region
  *
@@ -228,28 +169,21 @@ static void __init add_node_intersection(u32 node, u64 start, u64 size, u32 type
  */
 static void __init add_numamem_region(u64 start, u64 end, u32 type)
 {
-	u32 i;
-	u64 ofs = start;
+	u32 node = pa_to_nid(start);
+	u64 size = end - start;
+	static unsigned long num_physpages;
 
 	if (start >= end) {
 		pr_debug("Invalid region: %016llx-%016llx\n", start, end);
 		return;
 	}
 
-	for (i = 0; i < numa_meminfo.nr_blks; i++) {
-		struct numa_memblk *mb = &numa_meminfo.blk[i];
-
-		if (ofs > mb->end)
-			continue;
-
-		if (end > mb->end) {
-			add_node_intersection(mb->nid, ofs, mb->end - ofs, type);
-			ofs = mb->end;
-		} else {
-			add_node_intersection(mb->nid, ofs, end - ofs, type);
-			break;
-		}
-	}
+	num_physpages += (size >> PAGE_SHIFT);
+	pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx Bytes\n",
+		node, type, start, size);
+	pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
+		start >> PAGE_SHIFT, end >> PAGE_SHIFT, num_physpages);
+	memblock_set_node(start, size, &memblock.memory, node);
 }
 
 static void __init init_node_memblock(void)
@@ -291,24 +225,6 @@ static void __init init_node_memblock(void)
 	}
 }
 
-static void __init numa_default_distance(void)
-{
-	int row, col;
-
-	for (row = 0; row < MAX_NUMNODES; row++)
-		for (col = 0; col < MAX_NUMNODES; col++) {
-			if (col == row)
-				node_distances[row][col] = LOCAL_DISTANCE;
-			else
-				/* We assume that one node per package here!
-				 *
-				 * A SLIT should be used for multiple nodes
-				 * per package to override default setting.
-				 */
-				node_distances[row][col] = REMOTE_DISTANCE;
-	}
-}
-
 /*
  * fake_numa_init() - For Non-ACPI systems
  * Return: 0 on success, -errno on failure.
@@ -333,11 +249,11 @@ int __init init_numa_memory(void)
 	for (i = 0; i < NR_CPUS; i++)
 		set_cpuid_to_node(i, NUMA_NO_NODE);
 
-	numa_default_distance();
+	numa_reset_distance();
 	nodes_clear(numa_nodes_parsed);
 	nodes_clear(node_possible_map);
 	nodes_clear(node_online_map);
-	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
+	WARN_ON(memblock_clear_hotplug(0, PHYS_ADDR_MAX));
 
 	/* Parse SRAT and SLIT if provided by firmware. */
 	ret = acpi_disabled ? fake_numa_init() : acpi_numa_init();
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 06f11d9e4ec1..c3e4586a7975 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -106,14 +106,6 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 		page += vmem_altmap_offset(altmap);
 	__remove_pages(start_pfn, nr_pages, altmap);
 }
-
-#ifdef CONFIG_NUMA
-int memory_add_physaddr_to_nid(u64 start)
-{
-	return pa_to_nid(start);
-}
-EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
-#endif
 #endif
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
diff --git a/mm/Kconfig b/mm/Kconfig
index e113f713b493..1472ce8a8784 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1317,6 +1317,7 @@ config NUMA_MEMBLKS
 config NUMA_EMU
 	bool "NUMA emulation"
 	depends on NUMA_MEMBLKS
+	depends on X86 || GENERIC_ARCH_NUMA
 	help
 	  Enable NUMA emulation. A flat machine will be split
 	  into virtual nodes when booted with "numa=fake=N", where N is the
-- 
2.47.1

