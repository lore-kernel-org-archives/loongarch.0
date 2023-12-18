Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0261FDB
	for <loongarch@lists.linux.dev>; Mon, 18 Dec 2023 01:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.176])
	by gateway (Coremail) with SMTP id _____8DxBOsKpn9lZeYBAA--.6083S3;
	Mon, 18 Dec 2023 09:53:14 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.176])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx3+EEpn9l0l8JAA--.45072S5;
	Mon, 18 Dec 2023 09:53:14 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v5 7/7] LoongArch: Parsing CPU-related information from DTS
Date: Mon, 18 Dec 2023 09:53:01 +0800
Message-Id: <d2c8b83725527b8a7e7541da46aa8f137a87982f.1702862779.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1702862778.git.zhoubinbin@loongson.cn>
References: <cover.1702862778.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx3+EEpn9l0l8JAA--.45072S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryrtFyrurW8XrykGFykZwc_yoW8Zw45pF
	Z7CFWrKrZ8GFn3G3Z3tryqyr9Ivrs5Ga1xXFW29FWDCFnxKr1vqr4v9rnrtF1xZFWrW34r
	XFWrGFWqgF4UArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY
	6Fy7McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIeHqUUUUU

Generally, we can get cpu-related information, such as model name, from
/proc/cpuinfo. for DT-based systems, we need to parse the relevant
information from DTS.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
---
 arch/loongarch/kernel/env.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 6b3bfb0092e6..3264b2f07388 100644
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
@@ -34,9 +37,38 @@ void __init init_environ(void)
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
-	int cpu;
+	struct device_node *root;
+	int cpu, ret;
+	char *model;
+
+	/* Parsing cpuname from DTS model property */
+	root = of_find_node_by_path("/");
+	ret = of_property_read_string(root, "model", (const char **)&model);
+	of_node_put(root);
+	if (!ret)
+		loongson_sysconf.cpuname = strsep(&model, " ");
 
 	if (loongson_sysconf.cpuname && !strncmp(loongson_sysconf.cpuname, "Loongson", 8)) {
 		for (cpu = 0; cpu < NR_CPUS; cpu++)
-- 
2.39.3

