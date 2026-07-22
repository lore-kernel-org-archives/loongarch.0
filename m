Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EAE442129
	for <loongarch@lists.linux.dev>; Wed, 22 Jul 2026 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719401; cv=none; b=EGVHL12qObyfoseGCN94mQxzd/4yThtSX4MRNYzWG2P1/K20kZvIpEdAV+YFIVerAKX2ZL9ytYwHRT67dpFzhZ/2PEjbEF+NqSTwdeIuTztZMTQAiQiMNiOrKK4MRQsmbtSfpeFd1NQHKsoAnhvb8Csvy1tAdxwwDvNR4ZmBx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719401; c=relaxed/simple;
	bh=fBEeqmACQDY5WIY0T8WlkdCTwAlasa8DmUujb9gNHaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FK2nq4+A0fdlduLghU09MFvVHWxnWA7hFgty+Y17L2CspD80tAzHa0FLX+PN+glTINp44d0pvU0l/rRtNWMCJq1ArbmJANPygudhxjMa8pQU3e8uX1RQi/v+vaz3OHiO6KAj3x7EH6O089lr5YLEFdsPpmOjgRaTDgREpyG/K80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxVegeqGBq_P4FAA--.236S3;
	Wed, 22 Jul 2026 19:23:10 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxEuQcqGBqew4VAA--.45648S2;
	Wed, 22 Jul 2026 19:23:09 +0800 (CST)
From: Kanglong Wang <wangkanglong@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Move jump_label_init() before parse_early_param()
Date: Wed, 22 Jul 2026 19:23:08 +0800
Message-Id: <20260722112308.9120-1-wangkanglong@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxEuQcqGBqew4VAA--.45648S2
X-CM-SenderInfo: 5zdqwyxdqjz0tqj6z05rqj20fqof0/1tbiAQEQAmpgRM8HAgABsX
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4DZw1UWw4DWr4ftryfZrc_yoW8Xr47p3
	48Zr95G3y8GFZ7Ja45A34rurs8u3s7G3y2qaya9a48AF17Ar4UAF10qrZIvF1vq3yvyF4F
	v3WrtFn29ayUG3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jnUUUUUUUU=

When enabling CONFIG_MEM_ALLOC_PROFILING=y and
CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y, then diabling memory
profiling by adding the boot parameter 'sysctl.vm.mem_profiling=0', will
cause the kernel failed to boot.

After analysis, this is because jump_label_init() must be called before
parse_early_param(), early param handlers may modify static keys by
static_branch_enable/disable().

Fix this by moving jump_label_init() before parse_early_param(). The
solution is similar to other architectures.

Cc: <stable@vger.kernel.org>
Signed-off-by: Kanglong Wang <wangkanglong@loongson.cn>
---
 arch/loongarch/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index eaebb52bd36e..deeff4a1b411 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -603,6 +603,7 @@ void __init setup_arch(char **cmdline_p)
 	memblock_init();
 	pagetable_init();
 	bootcmdline_init(cmdline_p);
+	jump_label_init(); /* Initialise the static keys for parse_early_param */
 	parse_early_param();
 	reserve_initrd_mem();
 
@@ -610,7 +611,6 @@ void __init setup_arch(char **cmdline_p)
 	arch_mem_init(cmdline_p);
 
 	resource_init();
-	jump_label_init(); /* Initialise the static keys for paravirtualization */
 
 #ifdef CONFIG_SMP
 	plat_smp_setup();
-- 
2.20.1

