Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53ED184
	for <loongarch@lists.linux.dev>; Mon,  5 Dec 2022 04:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B86C433D6;
	Mon,  5 Dec 2022 04:50:13 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	kernel test robot <lkp@intel.com>,
	Peibao Liu <liupeibao@loongson.cn>
Subject: [PATCH] irqchip: loongarch-cpu: Fix a missing prototype warning
Date: Mon,  5 Dec 2022 12:47:08 +0800
Message-Id: <20221205044708.2054022-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1, Rename loongarch_cpu_irq_of_init() to cpuintc_of_init() in order to
   keep the same style as the ACPI version.
2, Fix a missing prototype warning by adding a "static" modifier.

Fixes: 855d4ca4bdb366aab3d4 ("irqchip: loongarch-cpu: add DT support")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Peibao Liu <liupeibao@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongarch-cpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-loongarch-cpu.c
index 00a47c011ec7..9d8f2c406043 100644
--- a/drivers/irqchip/irq-loongarch-cpu.c
+++ b/drivers/irqchip/irq-loongarch-cpu.c
@@ -93,7 +93,7 @@ static const struct irq_domain_ops loongarch_cpu_intc_irq_domain_ops = {
 };
 
 #ifdef CONFIG_OF
-int __init loongarch_cpu_irq_of_init(struct device_node *of_node,
+static int __init cpuintc_of_init(struct device_node *of_node,
 				struct device_node *parent)
 {
 	cpuintc_handle = of_node_to_fwnode(of_node);
@@ -107,8 +107,7 @@ int __init loongarch_cpu_irq_of_init(struct device_node *of_node,
 
 	return 0;
 }
-IRQCHIP_DECLARE(cpu_intc, "loongson,cpu-interrupt-controller",
-					loongarch_cpu_irq_of_init);
+IRQCHIP_DECLARE(cpu_intc, "loongson,cpu-interrupt-controller", cpuintc_of_init);
 #endif
 
 static int __init liointc_parse_madt(union acpi_subtable_headers *header,
-- 
2.31.1

