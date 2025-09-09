Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9479E25228D
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757411637; cv=none; b=kOb30qn4VHkUgkjawOrkL9kfOQfUis7jMXmPJFbu7VIbBYfQ2zzLqL7/ypjOza6BX7aPLtg8x8cXAAvif0RBJFdY6fKG3uJ9306BB1TtbpqBZvSt9dr6wXPMYZu6dmBkhzIahPjD09sdlN5YTsInm+UO4e7BYWilhKn6jTp/4NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757411637; c=relaxed/simple;
	bh=jddvsvw7DK9PN8pRakOPEzf8iaNd0mlQfX3YALv7OyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EYcFmZgXkzCG2qnvcpWHvnAVQ7cydULeqWB4fZE23E5epuqzjTH1pQUJgJJWTtuTpT5SiOEfPTqC3lI6ZHugnEcs4AC1LbyasRkWkf/6vFq9eFZBU9UYh2ClAcBdUQMracwQqCLC3CthkQiAOvjh5979vGlLcU5w58kGPrK6uW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8Cxrr8y+b9oplIIAA--.16745S3;
	Tue, 09 Sep 2025 17:53:54 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJAx_8Eu+b9oVfGJAA--.41496S2;
	Tue, 09 Sep 2025 17:53:53 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Allow specify SIMD width via kernel parameters
Date: Tue,  9 Sep 2025 17:53:39 +0800
Message-ID: <20250909095339.4083769-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx_8Eu+b9oVfGJAA--.41496S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF4xGr4xWry5urW7Cw1fKrX_yoW8KF4UpF
	4qyw4fGr409Fnaga9xJr409r93XFs7C3y7ZFW7Gw4YyFn5ZryDXw1vy3sxXFnxW34fWw1f
	uFs5AF1Y9a1kt3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0byZUUUUU=

For power saving or debugging purpose, we usually want to limit the SIMD
(LSX/LASX) usage on a rich feature platform. So allow specify SIMD width
via kernel parameters "simd=".

Allowed values of "simd=" are any integers, and recommended values are:
0:		Disable all SIMD features;
128:		Enable at most 128bit SIMD features;
256:		Enable at most 256bit SIMD features;
-1(default):	Enable as many as possible SIMD features automatically.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/cpu-probe.c | 46 +++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index fedaa67cde41..cbfce2872d71 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -52,6 +52,48 @@ static inline void cpu_set_fpu_fcsr_mask(struct cpuinfo_loongarch *c)
 	c->fpu_mask = ~(fcsr0 ^ fcsr1) & ~mask;
 }
 
+/* simd = -1/0/128/256 */
+static unsigned int simd = -1U;
+
+static int __init cpu_setup_simd(char *str)
+{
+	get_option(&str, &simd);
+	pr_info("Set SIMD width = %u\n", simd);
+
+	return 0;
+}
+
+early_param("simd", cpu_setup_simd);
+
+static int __init cpu_final_simd(void)
+{
+	struct cpuinfo_loongarch *c = &cpu_data[0];
+
+	if (simd < 128) {
+		c->options &= ~LOONGARCH_CPU_LSX;
+		elf_hwcap &= ~HWCAP_LOONGARCH_LSX;
+	}
+
+	if (simd < 256) {
+		c->options &= ~LOONGARCH_CPU_LASX;
+		elf_hwcap &= ~HWCAP_LOONGARCH_LASX;
+	}
+
+	simd = 0;
+
+	if (c->options & LOONGARCH_CPU_LSX)
+		simd = 128;
+
+	if (c->options & LOONGARCH_CPU_LASX)
+		simd = 256;
+
+	pr_info("Final SIMD width = %u\n", simd);
+
+	return 0;
+}
+
+arch_initcall(cpu_final_simd);
+
 static inline void set_elf_platform(int cpu, const char *plat)
 {
 	if (cpu == 0)
@@ -134,13 +176,13 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 		elf_hwcap |= HWCAP_LOONGARCH_FPU;
 	}
 #ifdef CONFIG_CPU_HAS_LSX
-	if (config & CPUCFG2_LSX) {
+	if ((config & CPUCFG2_LSX) && (simd >= 128)) {
 		c->options |= LOONGARCH_CPU_LSX;
 		elf_hwcap |= HWCAP_LOONGARCH_LSX;
 	}
 #endif
 #ifdef CONFIG_CPU_HAS_LASX
-	if (config & CPUCFG2_LASX) {
+	if ((config & CPUCFG2_LASX) && (simd >= 256)) {
 		c->options |= LOONGARCH_CPU_LASX;
 		elf_hwcap |= HWCAP_LOONGARCH_LASX;
 	}
-- 
2.47.3

