Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A737CBE71
	for <loongarch@lists.linux.dev>; Tue, 15 Aug 2023 08:51:25 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.245])
	by gateway (Coremail) with SMTP id _____8DxBfGMPNtkjrIYAA--.50947S3;
	Tue, 15 Aug 2023 16:51:24 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxviOHPNtkGQhbAA--.51617S5;
	Tue, 15 Aug 2023 16:51:23 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 7/7] LoongArch: Parsing CPU-related information from DTS
Date: Tue, 15 Aug 2023 16:51:13 +0800
Message-Id: <44e4a47851575bc9ae583cf8c6d2f63ef05b10bd.1692088166.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1692088166.git.zhoubinbin@loongson.cn>
References: <cover.1692088166.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxviOHPNtkGQhbAA--.51617S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryrtFyrurW8XrykGFykZwc_yoW8ZF48pF
	Z7CFWrKrZ5CFn3G3Wftryjyryavrs5Ga17XFW29FWUCFnxKrnYqr4v9rnrtF18ZFWrWa4r
	XFWrGFWqgF4UArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBlb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0aLvJUUUUU==

Generally, we can get cpu-related information, such as model name, from
/proc/cpuinfo. for DT-based systems, we need to parse the relevant
information from DTS.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
---
 arch/loongarch/kernel/env.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 6b3bfb0092e6..0191fe20b535 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -5,13 +5,16 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/efi.h>
 #include <linux/export.h>
 #include <linux/memblock.h>
+#include <linux/of_clk.h>
 #include <asm/early_ioremap.h>
 #include <asm/bootinfo.h>
 #include <asm/loongson.h>
 #include <asm/setup.h>
+#include <asm/time.h>
 
 u64 efi_system_table;
 struct loongson_system_configuration loongson_sysconf;
@@ -34,9 +37,39 @@ void __init init_environ(void)
 	efi_system_table = fw_arg2;
 }
 
+static int __init fdt_cpu_clk_init(void)
+{
+	struct clk *clk;
+	struct device_node *np;
+
+	np = of_get_cpu_node(0, NULL);
+	if (!np)
+		return -ENODEV;
+
+	clk = of_clk_get(np, 0);
+	if (IS_ERR(clk))
+		return -ENODEV;
+
+	cpu_clock_freq = clk_get_rate(clk);
+	clk_put(clk);
+
+	return 0;
+}
+late_initcall(fdt_cpu_clk_init);
+
 static int __init init_cpu_fullname(void)
 {
 	int cpu;
+	char *prop;
+	struct device_node *root;
+
+	/* Parsing cpuname from DTS model property */
+	root = of_find_node_by_path("/");
+	if (root) {
+		of_property_read_string(root, "model", (const char **)&prop);
+		if (prop)
+			loongson_sysconf.cpuname = strsep(&prop, " ");
+	}
 
 	if (loongson_sysconf.cpuname && !strncmp(loongson_sysconf.cpuname, "Loongson", 8)) {
 		for (cpu = 0; cpu < NR_CPUS; cpu++)
-- 
2.39.3

