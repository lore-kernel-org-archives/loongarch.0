Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D650B817
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 13:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F09FC341C8;
	Tue, 26 Jul 2022 13:04:11 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Fix shared cache size calculation
Date: Tue, 26 Jul 2022 21:04:40 +0800
Message-Id: <20220726130440.3997832-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current calculation of shared cache size is from the node (die) scope,
but we hope 'lscpu' to show the shared cache size of the whole package
for multi-die chips (e.g., Loongson-3C5000L, which contains 4 dies in
one package). So fix it by multiplying nodes_per_package.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/cacheinfo.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/cacheinfo.c b/arch/loongarch/kernel/cacheinfo.c
index b38f5489d094..4662b06269f4 100644
--- a/arch/loongarch/kernel/cacheinfo.c
+++ b/arch/loongarch/kernel/cacheinfo.c
@@ -4,8 +4,9 @@
  *
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
-#include <asm/cpu-info.h>
 #include <linux/cacheinfo.h>
+#include <asm/bootinfo.h>
+#include <asm/cpu-info.h>
 
 /* Populates leaf and increments to next leaf */
 #define populate_cache(cache, leaf, c_level, c_type)		\
@@ -17,6 +18,8 @@ do {								\
 	leaf->ways_of_associativity = c->cache.ways;		\
 	leaf->size = c->cache.linesz * c->cache.sets *		\
 		c->cache.ways;					\
+	if (leaf->level > 2)					\
+		leaf->size *= nodes_per_package;		\
 	leaf++;							\
 } while (0)
 
@@ -95,11 +98,15 @@ static void cache_cpumap_setup(unsigned int cpu)
 
 int populate_cache_leaves(unsigned int cpu)
 {
-	int level = 1;
+	int level = 1, nodes_per_package = 1;
 	struct cpuinfo_loongarch *c = &current_cpu_data;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
 
+	if (loongson_sysconf.nr_nodes > 1)
+		nodes_per_package = loongson_sysconf.cores_per_package
+					/ loongson_sysconf.cores_per_node;
+
 	if (c->icache.waysize) {
 		populate_cache(dcache, this_leaf, level, CACHE_TYPE_DATA);
 		populate_cache(icache, this_leaf, level++, CACHE_TYPE_INST);
-- 
2.31.1

