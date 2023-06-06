Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08B01C29
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 07:40:01 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.41.186])
	by gateway (Coremail) with SMTP id _____8DxTuvN4n5kcAkAAA--.259S3;
	Tue, 06 Jun 2023 15:39:58 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.41.186])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxC8rM4n5kv_YBAA--.108S2;
	Tue, 06 Jun 2023 15:39:56 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	wanghongliang <wanghongliang@loongson.cn>
Subject: [PATCH v1] soc:loongson:add model and clock-frequency attribute parse.
Date: Tue,  6 Jun 2023 15:39:38 +0800
Message-Id: <20230606073938.556-1-wanghongliang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxC8rM4n5kv_YBAA--.108S2
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw45Ww1xAr1xuw45ZFy7Jwc_yoW8ArWfpF
	WkZFZ5Gr45GFn3u34rtry8ZryYyrn5Cr4Iga47KFW5CanrXrn8X3yjqFyq9ryxJayrXa4F
	gr95uw4vqa15JagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jjWlkUUUUU=

From: wanghongliang <wanghongliang@loongson.cn>

This patch add the parse of model and clock-frequency attribute,
which come from the cpus device_node in device tree and show as
Model Name and CPU MHz in /proc/cpuinfo.

device tree:

cpus {
	...
	model = "Loongson-LS2K1000";

	cpu0: cpu@0 {
		...
		clock-frequency = <1000000000>;
	};
};

/proc/cpuinfo:

Model Name              : Loongson-LS2K1000
CPU MHz                 : 1000.00

Signed-off-by: wanghongliang <wanghongliang@loongson.cn>
---
 arch/loongarch/kernel/smp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index ed167e244cda..8644fb9119ec 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -30,6 +30,7 @@
 #include <asm/processor.h>
 #include <asm/setup.h>
 #include <asm/time.h>
+#include <asm/bootinfo.h>
 
 int __cpu_number_map[NR_CPUS];   /* Map physical to logical */
 EXPORT_SYMBOL(__cpu_number_map);
@@ -186,6 +187,14 @@ static void __init fdt_smp_setup(void)
 #ifdef CONFIG_OF
 	unsigned int cpu, cpuid;
 	struct device_node *node = NULL;
+	const void *prop = NULL;
+
+	node = of_find_node_by_path("/cpus");
+	if (node) {
+		prop = of_get_property(node, "model", NULL);
+		if (prop)
+			loongson_sysconf.cpuname = (const char *)prop;
+	}
 
 	for_each_of_cpu_node(node) {
 		if (!of_device_is_available(node))
@@ -202,6 +211,10 @@ static void __init fdt_smp_setup(void)
 			cpu = cpumask_next_zero(-1, cpu_present_mask);
 		}
 
+		prop = of_get_property(node, "clock-frequency", NULL);
+		if (prop)
+			cpu_clock_freq = be32_to_cpup(prop);
+
 		num_processors++;
 		set_cpu_possible(cpu, true);
 		set_cpu_present(cpu, true);
-- 
2.31.1

