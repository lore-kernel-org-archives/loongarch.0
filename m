Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE959AD2A
	for <loongarch@lists.linux.dev>; Wed, 23 Aug 2023 09:55:16 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8AxDOuC1+Vksi4bAA--.50164S3;
	Wed, 23 Aug 2023 17:55:14 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLCN81+VkOz1hAA--.21192S5;
	Wed, 23 Aug 2023 17:55:13 +0800 (CST)
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
Subject: [PATCH v4 7/7] LoongArch: Parsing CPU-related information from DTS
Date: Wed, 23 Aug 2023 17:55:06 +0800
Message-Id: <d6d3695e7bb942c93db03f95a78a519a6a670a96.1692783907.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1692783907.git.zhoubinbin@loongson.cn>
References: <cover.1692783907.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxLCN81+VkOz1hAA--.21192S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryrtFyrurW8XrykGFykZwc_yoW8ZF48pF
	Z7CFWrKrZ5CFn3G3Wftryjyryavrs5Ga17XFW29FWUCFnxKrnYqr4v9rnrtF18ZFWrWa4r
	XFWrGFWqgF4UArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jsSdgUUUUU=

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

