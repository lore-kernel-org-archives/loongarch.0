Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23546645
	for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 04:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C233CC433C1;
	Tue, 27 Sep 2022 04:56:46 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] irqchip: Make irqchip_init() usable on pure ACPI systems
Date: Tue, 27 Sep 2022 12:55:14 +0800
Message-Id: <20220927045514.2762299-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pure ACPI system (e.g., LoongArch) doesn't select OF and OF_IRQ, but it
still need irqchip_init(). So, change IRQCHIP dependency from OF_IRQ to
(OF_IRQ || ACPI_GENERIC_GSI), and guard of_irq_init() with CONFIG_OF_IRQ
in order to make irqchip_init() be usable on pure ACPI systems.

Without this patch we get such errors:

[    0.000000] NR_IRQS: 576, nr_irqs: 576, preallocated irqs: 16
[    0.000000] Kernel panic - not syncing: IPI IRQ mapping failed
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.0.0-rc6+ #2189
[    0.000000] Hardware name: Loongson Loongson-3A5000-7A1000-1w-CRB/Loongson-LS3A5000-7A1000-1w-CRB, BIOS vUDK2018-LoongArch-V2.0.pre-beta8 08/18/2022
[    0.000000] Stack : 0000000000000000 9000000000fa4388 900000000140c000 900000000140fb70
[    0.000000]         0000000000000000 900000000140fb70 90000000012f4aa0 900000000140fa98
[    0.000000]         900000000140fa0c 900000008140f9ff 0000000000000030 0000000000000005
[    0.000000]         900000000578f708 0000000004750000 0000000000000000 00000000ffffdfff
[    0.000000]         0000000000000000 0000000000000000 0000000000000030 000000000000002f
[    0.000000]         900000000141f000 0000000004750000 9000000001427348 00000000000000b0
[    0.000000]         90000000012f4aa0 0000000000000004 0000000000000000 9000000001020000
[    0.000000]         9000000005781b80 9000000005781ba9 0000000000000000 9000000001315e30
[    0.000000]         900000000129a3b0 9000000000222b64 0000000000000000 00000000000000b0
[    0.000000]         0000000000000004 0000000000000000 0000000000070000 0000000000000800
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000] [<9000000000222b64>] show_stack+0x24/0x124
[    0.000000] [<9000000000fa4388>] dump_stack_lvl+0x60/0x88
[    0.000000] [<9000000000f9965c>] panic+0x130/0x2f8
[    0.000000] [<9000000000fd4324>] init_IRQ+0xa8/0x240
[    0.000000] [<9000000000fd0b38>] start_kernel+0x488/0x5f0
[    0.000000] [<9000000000fb10c4>] kernel_entry+0xc4/0xc8
[    0.000000] 
[    0.000000] ---[ end Kernel panic - not syncing: IPI IRQ mapping failed ]---

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/Kconfig   | 2 +-
 drivers/irqchip/irqchip.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 66b9fa408bf2..93ad04d58f17 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -3,7 +3,7 @@ menu "IRQ chip support"
 
 config IRQCHIP
 	def_bool y
-	depends on OF_IRQ
+	depends on (OF_IRQ || ACPI_GENERIC_GSI)
 
 config ARM_GIC
 	bool
diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
index 3570f0a588c4..0014b32964e0 100644
--- a/drivers/irqchip/irqchip.c
+++ b/drivers/irqchip/irqchip.c
@@ -28,7 +28,9 @@ extern struct of_device_id __irqchip_of_table[];
 
 void __init irqchip_init(void)
 {
+#ifdef CONFIG_OF_IRQ
 	of_irq_init(__irqchip_of_table);
+#endif
 	acpi_probe_device_table(irqchip);
 }
 
-- 
2.31.1

