Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA372E972B
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027004; cv=none; b=AAUwqKv/Wbcath3BQ2siqMuzVE04PINPc1+coogmrciwDY8bkFDrgJ9cHJwQMIs7S9rvATIxzNVMu4NK+K6ayfGWP8+2gKBa1v5BtBv2vpIo0GOqiDDGqViV1fomMhpVMtWa3nkwdJi6pt6MM9OdyIhFqA6kEeF/ulklXIO+meo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027004; c=relaxed/simple;
	bh=GKuq4Y0gBuz525UuGhkpfPzhCEh8g3SnfEx18wS+Qz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDMYpnj/3d1fLiS4jpqN+MWx1MGGprHeEqrYDYPyrNAJrQCoRGdkeII+OBEHIT8OwbGLpxWLCIgBob5SQWQbN0Do98bOHojVmgiQXAum3QjZjSL0yQdgd/KAcPqQiNn+i0LzOdBQO51aPWAg/q/l+hxo2Fxi2o7laQlywF94tq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.42])
	by gateway (Coremail) with SMTP id _____8Dx98H0d4BpoO8OAA--.36138S3;
	Mon, 02 Feb 2026 18:09:56 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.42])
	by front1 (Coremail) with SMTP id qMiowJBxxuLvd4BpXCU+AA--.28296S2;
	Mon, 02 Feb 2026 18:09:55 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Add HOTPLUG_SMT implementation
Date: Mon,  2 Feb 2026 18:09:43 +0800
Message-ID: <20260202100943.1805885-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxxuLvd4BpXCU+AA--.28296S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWFWfAw15uF4UJryfuryDArc_yoW5XrW8pr
	ykAF9rKrWfurn5Za45Aa4xWry5Xas2ka1agayrKFyrCFZxAry8XrW0qF9xWFyUGw45Kayr
	uFs3Cr4FkF48JwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

For benchmarking or debugging purpose, we usually want to control SMT
via boot parameter and sysfs knobs. So add HOTPLUG_SMT implementation.

1. Boot parameters:

nosmt:		Disable SMT, can be enabled via sysfs knobs.
nosmt=force:	Disable SMT, cannot be enabled via sysfs knobs.

2. Runtime sysfs controls:

Write "on", "off", "forceoff" or the number of SMT threads (1, 2, ...)
to /sys/devices/system/cpu/smt/control.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/loongarch/Kconfig                          |  1 +
 arch/loongarch/kernel/smp.c                     | 13 +++++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1058f2a6d6a8..a3a023bf3cf9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4580,7 +4580,7 @@ Kernel parameters
 	nosmt		[KNL,MIPS,PPC,EARLY] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
 
-			[KNL,X86,PPC,S390] Disable symmetric multithreading (SMT).
+			[KNL,LOONGARCH,X86,PPC,S390] Disable symmetric multithreading (SMT).
 			nosmt=force: Force disable SMT, cannot be undone
 				     via the sysfs control file.
 
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index bf5a5beab366..36dbc62cb2a9 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -186,6 +186,7 @@ config LOONGARCH
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_TIF_NOHZ
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN
+	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_FORCED_THREADING
 	select IRQ_LOONGARCH_CPU
 	select LOCK_MM_AND_FIND_VMA
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 8b2fcb3fb874..64a048f1b880 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -365,16 +365,29 @@ void __init loongson_smp_setup(void)
 void __init loongson_prepare_cpus(unsigned int max_cpus)
 {
 	int i = 0;
+	int threads_per_core = 0;
 
 	parse_acpi_topology();
 	cpu_data[0].global_id = cpu_logical_map(0);
 
+	if (!pptt_enabled)
+		threads_per_core = 1;
+	else {
+		for_each_possible_cpu(i) {
+			if (cpu_to_node(i) != 0)
+				continue;
+			if (cpus_are_siblings(0, i))
+				threads_per_core++;
+		}
+	}
+
 	for (i = 0; i < loongson_sysconf.nr_cpus; i++) {
 		set_cpu_present(i, true);
 		csr_mail_send(0, __cpu_logical_map[i], 0);
 	}
 
 	per_cpu(cpu_state, smp_processor_id()) = CPU_ONLINE;
+	cpu_smt_set_num_threads(threads_per_core, threads_per_core);
 }
 
 /*
-- 
2.47.3

