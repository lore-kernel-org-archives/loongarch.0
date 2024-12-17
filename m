Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477F51714B2
	for <loongarch@lists.linux.dev>; Tue, 17 Dec 2024 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421149; cv=none; b=pA8vYdnZBX5bUkKstG8ZCq+iO4VaNjXu3GDNj4qcPL4x6/CmJEnsQOzThztQhS+i8bpYTBi8kT7uiubt7q9Jy6oMUzD9Lc14oE6KK50kZorpWTS58O0Mapk1y/U6F2huaQQWjVthNKaWLYZ/3jvTS4j2WgNtEqgYisTAl1GBip8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421149; c=relaxed/simple;
	bh=lZaSCDinLNbXyNw5XItSecUxZgUaVwU+bIj/T/SAgRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q8bnNUEmdEBkz9OPiZEjNEA48sjATIjclOcPXvRn92n/sRxP3W+Y682PLkrb8703XfmRzbb+y9MzdXmXY6Yc989PqMqNnN6ujLe/Ulo7ghKec3rfUqGTieg8vsRxNSyYroElK6/G/0Jg/Pgkb8hbecDob9Lxj28YQiBpLruNRlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.7])
	by gateway (Coremail) with SMTP id _____8AxbeKZKmFn1bFXAA--.39474S3;
	Tue, 17 Dec 2024 15:39:05 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.7])
	by front1 (Coremail) with SMTP id qMiowMBxnseTKmFnxQUAAA--.26S2;
	Tue, 17 Dec 2024 15:39:03 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	Chao Li <lichao@loongson.cn>,
	Juxin Gao <gaojuxin@loongson.cn>
Subject: [PATCH] LoongArch: Correct the cacheinfo sharing information
Date: Tue, 17 Dec 2024 15:38:54 +0800
Message-ID: <20241217073854.3346051-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxnseTKmFnxQUAAA--.26S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw4xCr1fZF1rGrW7Zr4DZFc_yoW8Xw17pr
	W2yrZ8KrWrurn3G3yYqa1xWryxG3ykGFsFq3WakFyrA3ZIvrykXrs5ta9xAF9rZ395GFWI
	qF45JF4SgF4UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

SMT cores and their sibling cores share the same L1 and L2 private
caches (of course last level cache is also shared), so correct the
cacheinfo sharing information to let shared_cpu_map correctly reflect
this relationship.

Below is the output of "lscpu" on Loongson-3A6000 (4 cores, 8 threads).

1. Before patch:

  L1d:                    512 KiB (8 instances)
  L1i:                    512 KiB (8 instances)
  L2:                     2 MiB (8 instances)
  L3:                     16 MiB (1 instance)

2. After patch:

  L1d:                    256 KiB (4 instances)
  L1i:                    256 KiB (4 instances)
  L2:                     1 MiB (4 instances)
  L3:                     16 MiB (1 instance)

Reported-by: Chao Li <lichao@loongson.cn>
Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/cacheinfo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/loongarch/kernel/cacheinfo.c b/arch/loongarch/kernel/cacheinfo.c
index c7988f757281..0d28228d0a8a 100644
--- a/arch/loongarch/kernel/cacheinfo.c
+++ b/arch/loongarch/kernel/cacheinfo.c
@@ -51,6 +51,12 @@ static void cache_cpumap_setup(unsigned int cpu)
 				continue;
 
 			sib_leaf = sib_cpu_ci->info_list + index;
+			/* SMT cores share all caches */
+			if (cpus_are_siblings(i, cpu)) {
+				cpumask_set_cpu(cpu, &sib_leaf->shared_cpu_map);
+				cpumask_set_cpu(i, &this_leaf->shared_cpu_map);
+			}
+			/* Node's cores share shared caches */
 			if (cache_leaves_are_shared(this_leaf, sib_leaf)) {
 				cpumask_set_cpu(cpu, &sib_leaf->shared_cpu_map);
 				cpumask_set_cpu(i, &this_leaf->shared_cpu_map);
-- 
2.43.5

