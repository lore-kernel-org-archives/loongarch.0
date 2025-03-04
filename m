Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD59F1F76CA
	for <loongarch@lists.linux.dev>; Tue,  4 Mar 2025 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741087642; cv=none; b=uIIhe474RPHMpw22XT0JftymHJ/FDd2daJAQB0b4LYR4OzUhvuZDy1q7cGKS5X1HPj1p2xt4CuVo+QZeTAfG+CI8YqHrlJQybIbNsl21h9Zv2p6bp2CwNTmhcB2qqAHRGuhXMUsWDwdSsB77MvvwR6AesDIoZylu1WXGZb3mY8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741087642; c=relaxed/simple;
	bh=hiIB1N+s1XFxEywNqs8B9ezlzbJTEbWPLwCvwYFYtFE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WHdlIOBj3m3tYAjuBHWUypiFvK/z31qDQUXorvgiiZAoNPURQJt5EiZdjgrGOkaWCBEGys4dvdlOQ01WLI2eNbIHNn7WAmr4Uln+0DNtQ+yAPam34yUjI2DsRh51+lAKSNac/bSEykfekGh3HUmhLXRNjh3BXc320/J7xp7b8Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Ax3eKM48ZnCguKAA--.183S3;
	Tue, 04 Mar 2025 19:27:08 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxH+WM48ZnhII1AA--.2682S2;
	Tue, 04 Mar 2025 19:27:08 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: mm: Set max_pfn with the PFN of the last page
Date: Tue,  4 Mar 2025 19:27:08 +0800
Message-Id: <20250304112708.1810033-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+WM48ZnhII1AA--.2682S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

The current max_pfn equals to zero. In this case, it caused users cannot
get some page information through /proc such as kpagecount. The following
message is displayed by stress-ng test suite with the command
"stress-ng --verbose --physpage 1 -t 1".

 # stress-ng --verbose --physpage 1 -t 1
 stress-ng: error: [1691] physpage: cannot read page count for address 0x134ac000 in /proc/kpagecount, errno=22 (Invalid argument)
 stress-ng: error: [1691] physpage: cannot read page count for address 0x7ffff207c3a8 in /proc/kpagecount, errno=22 (Invalid argument)
 stress-ng: error: [1691] physpage: cannot read page count for address 0x134b0000 in /proc/kpagecount, errno=22 (Invalid argument)
 ...

After applying this patch, the kernel can pass the test.
 # stress-ng --verbose --physpage 1 -t 1
 stress-ng: debug: [1701] physpage: [1701] started (instance 0 on CPU 3)
 stress-ng: debug: [1701] physpage: [1701] exited (instance 0 on CPU 3)
 stress-ng: debug: [1700] physpage: [1701] terminated (success)

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kernel/numa.c  | 2 +-
 arch/loongarch/kernel/setup.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 84fe7f854820..002dbe62b329 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -356,7 +356,7 @@ int __init init_numa_memory(void)
 		node_mem_init(node);
 		node_set_online(node);
 	}
-	max_low_pfn = PHYS_PFN(memblock_end_of_DRAM());
+	max_low_pfn = max_pfn = PHYS_PFN(memblock_end_of_DRAM());
 
 	setup_nr_node_ids();
 	loongson_sysconf.nr_nodes = nr_node_ids;
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index edcfdfcad7d2..ab8c9336d8f5 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -294,7 +294,7 @@ static void __init fdt_setup(void)
 	early_init_dt_scan(fdt_pointer, __pa(fdt_pointer));
 	early_init_fdt_reserve_self();
 
-	max_low_pfn = PFN_PHYS(memblock_end_of_DRAM());
+	max_low_pfn = max_pfn = PFN_PHYS(memblock_end_of_DRAM());
 #endif
 }
 
-- 
2.39.3

