Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE8C33C9
	for <loongarch@lists.linux.dev>; Mon, 14 Oct 2024 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728887613; cv=none; b=JbLKdy3TxLxyXlqFJ19XcCJVXhy4NajKq2rt9e2jsFy3XZAF3VGEeqLxnmbp28Mqyx/0v7y83sEBW+dghrihFo/nOJXPL9DakwVJzLife6zbyfJ/GGz51vld0KupjhPCAQXXNccWtybDNHq91mZgrkGYYkSLOeDSDXEZL3Ds6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728887613; c=relaxed/simple;
	bh=ATFJB2+9v9R3OXCyxBrZXx1J0y4hgsTiPnESDstLL6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dzjPK4VT6fOSkUYZaemKBEP4JQ7g8iv4uqeibr2FKzd2ir0xvbNmSkRVhdNffqj/zokhJ31+R2JlON6kJpBGeAI4NP6BCApkV/Axn5wS3fWy1D24qmCJ1IQzGafVX5iVeKHmIfGgAuaqU8VRdhZmE/9bKVujV4wWHHc9Tob5ANs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8BxFOk5uwxnR0caAA--.39437S3;
	Mon, 14 Oct 2024 14:33:29 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMBxXuQ4uwxn09AoAA--.2444S2;
	Mon, 14 Oct 2024 14:33:28 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lixianglai@loongson.cn,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH] LoongArch: Fix cpu hotplug issue
Date: Mon, 14 Oct 2024 14:33:28 +0800
Message-Id: <20241014063328.1216497-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXuQ4uwxn09AoAA--.2444S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

On LoongArch system, there are two places to set cpu numa node. One
is in arch specified function smp_prepare_boot_cpu(), the other is
in generic function early_numa_node_init(). The latter will overwrite
the numa node information.

However for hot-added cpu, cpu_logical_map() fails to its physical
cpuid at beginning since it is not enabled in ACPI MADT table. So
function early_cpu_to_node() also fails to get its numa node for
hot-added cpu, and generic function early_numa_node_init() will
overwrite incorrect numa node.

Here static array __cpu_to_node and api set_early_cpu_to_node()
is added, so that early_cpu_to_node is consistent with function
cpu_to_node() for hot-added cpu.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/numa.h |  2 ++
 arch/loongarch/kernel/numa.c      | 10 +++++++++-
 arch/loongarch/kernel/smp.c       |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/numa.h b/arch/loongarch/include/asm/numa.h
index b5f9de9f102e..e8e6fcfb006a 100644
--- a/arch/loongarch/include/asm/numa.h
+++ b/arch/loongarch/include/asm/numa.h
@@ -50,6 +50,7 @@ static inline void set_cpuid_to_node(int cpuid, s16 node)
 }
 
 extern int early_cpu_to_node(int cpu);
+extern void set_early_cpu_to_node(int cpu, s16 node);
 
 #else
 
@@ -57,6 +58,7 @@ static inline void early_numa_add_cpu(int cpuid, s16 node)	{ }
 static inline void numa_add_cpu(unsigned int cpu)		{ }
 static inline void numa_remove_cpu(unsigned int cpu)		{ }
 static inline void set_cpuid_to_node(int cpuid, s16 node)	{ }
+static inline void set_early_cpu_to_node(int cpu, s16 node)	{ }
 
 static inline int early_cpu_to_node(int cpu)
 {
diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 84fe7f854820..62508aace644 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -34,6 +34,9 @@ static struct numa_meminfo numa_meminfo;
 cpumask_t cpus_on_node[MAX_NUMNODES];
 cpumask_t phys_cpus_on_node[MAX_NUMNODES];
 EXPORT_SYMBOL(cpus_on_node);
+static s16 __cpu_to_node[NR_CPUS] = {
+	[0 ... CONFIG_NR_CPUS - 1] = NUMA_NO_NODE
+};
 
 /*
  * apicid, cpu, node mappings
@@ -117,11 +120,16 @@ int early_cpu_to_node(int cpu)
 	int physid = cpu_logical_map(cpu);
 
 	if (physid < 0)
-		return NUMA_NO_NODE;
+		return __cpu_to_node[cpu];
 
 	return __cpuid_to_node[physid];
 }
 
+void set_early_cpu_to_node(int cpu, s16 node)
+{
+	__cpu_to_node[cpu] = node;
+}
+
 void __init early_numa_add_cpu(int cpuid, s16 node)
 {
 	int cpu = __cpu_number_map[cpuid];
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 9afc2d8b3414..998668be858c 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -512,6 +512,7 @@ void __init smp_prepare_boot_cpu(void)
 			set_cpu_numa_node(cpu, node);
 		else {
 			set_cpu_numa_node(cpu, rr_node);
+			set_early_cpu_to_node(cpu, rr_node);
 			rr_node = next_node_in(rr_node, node_online_map);
 		}
 	}

base-commit: 6485cf5ea253d40d507cd71253c9568c5470cd27
-- 
2.39.3

