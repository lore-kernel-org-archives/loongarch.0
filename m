Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97B82451F0
	for <loongarch@lists.linux.dev>; Wed, 24 Sep 2025 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758695406; cv=none; b=uBfaR18+IvdT+ifOXHpOvl1lYwrf3hNLlACFD+WlWqG6btOwXfm3RSakPNmsWo6i/luBdysFn5CuXKAC942S24v8zZi0AbX7aEdvjAhDWYfXBWRsAEwxgDZag5pbIRQz7kcueRyAc+kotagAsJc8z0OreihOfX4zYysE5uEbu8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758695406; c=relaxed/simple;
	bh=j2ZunSF58XuFmp6stuTo1f2NpJfd2g1LJ3l8mvi/7mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvpgdki/aT+gRZ8TAJnQRSSl2zR2R9rwPf5VJF2mnHr1VF1EaL8yZq6XoC4tE49fJFsgoHzjukd+FNmrFErYuMoVaeyYmzyMgUvLhAd9HTIzdjPAW3dZAfa0fRjv4S6Yz2P09Hr+zzrTkFKuzF794g8R7erPriQzy1PuRKg3E+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8BxE9Dij9NoofYNAA--.29473S3;
	Wed, 24 Sep 2025 14:29:54 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowJAxVOTbj9NogKyqAA--.21497S4;
	Wed, 24 Sep 2025 14:29:53 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Haowei Zheng <zhenghaowei@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v5 2/3] serial: 8250: Add Loongson uart driver support
Date: Wed, 24 Sep 2025 14:29:37 +0800
Message-ID: <9823e7afe713450e210dab9dba6fa18683dc1fe0.1758676290.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1758676290.git.zhoubinbin@loongson.cn>
References: <cover.1758676290.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxVOTbj9NogKyqAA--.21497S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGjTiCgAowAAs-
X-Coremail-Antispam: 1Uk129KBj93XoW3Xry8XF17AF48WryfKw1xZwc_yoWfKFWxpF
	n0k390yrWjgF4093y8Ar4YkF45Z3ZFkasrtFZrG345Kr98t3ykXryFkasFyr4jyryDJFy7
	ZFWDCFWUCF4UX3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

Add the driver for on-chip UART used on Loongson family chips.

The hardware is similar to 8250, but there are the following
differences:
 - Some chips (such as Loongson-2K2000) have added a fractional division
   register to obtain the required baud rate accurately, so the
   {get,set}_divisor callback is overridden.
 - Due to hardware defects, quirk handling is required for
   UART_MCR/UART_MSR.

Co-developed-by: Haowei Zheng <zhenghaowei@loongson.cn>
Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/tty/serial/8250/8250_loongson.c | 202 ++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c     |   8 +
 drivers/tty/serial/8250/Kconfig         |  10 ++
 drivers/tty/serial/8250/Makefile        |   1 +
 include/uapi/linux/serial_core.h        |   1 +
 5 files changed, 222 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_loongson.c

diff --git a/drivers/tty/serial/8250/8250_loongson.c b/drivers/tty/serial/8250/8250_loongson.c
new file mode 100644
index 000000000000..a114b4e6d5c3
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_loongson.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Serial Port driver for Loongson family chips
+ *
+ * Copyright (C) 2020-2025 Loongson Technology Corporation Limited
+ */
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/mod_devicetable.h>
+#include <linux/reset.h>
+
+#include "8250.h"
+
+/* Divisor Latch Fraction Register */
+#define LOONGSON_UART_DLF		0x2
+
+/* Flags */
+#define LOONGSON_UART_HAS_FRAC		BIT(0)
+#define LOONGSON_UART_QUIRK_MCR		BIT(1)
+#define LOONGSON_UART_QUIRK_MSR		BIT(2)
+
+#define LS2K0500_UART_FLAG	(LOONGSON_UART_QUIRK_MCR | LOONGSON_UART_QUIRK_MSR)
+#define LS2K1500_UART_FLAG	(LOONGSON_UART_HAS_FRAC | LOONGSON_UART_QUIRK_MCR)
+
+struct loongson_uart_data {
+	int line;
+	int mcr_invert;
+	int msr_invert;
+	struct reset_control *rst;
+};
+
+static unsigned int serial_fixup(struct uart_port *p, unsigned int offset, unsigned int val)
+{
+	struct loongson_uart_data *ddata = p->private_data;
+
+	if (offset == UART_MCR)
+		val ^= ddata->mcr_invert;
+
+	if (offset == UART_MSR)
+		val ^= ddata->msr_invert;
+
+	return val;
+}
+
+static u32 loongson_serial_in(struct uart_port *p, unsigned int offset)
+{
+	unsigned int val;
+
+	val = readb(p->membase + (offset << p->regshift));
+
+	return serial_fixup(p, offset, val);
+}
+
+static void loongson_serial_out(struct uart_port *p, unsigned int offset, unsigned int value)
+{
+	offset <<= p->regshift;
+	writeb(serial_fixup(p, offset, value), p->membase + offset);
+}
+
+static unsigned int loongson_frac_get_divisor(struct uart_port *port, unsigned int baud,
+					      unsigned int *frac)
+{
+	unsigned int quot;
+
+	quot = DIV_ROUND_CLOSEST((port->uartclk << 4), baud);
+	*frac = FIELD_GET(GENMASK(7, 0), quot);
+
+	return FIELD_GET(GENMASK(15, 8), quot);
+}
+
+static void loongson_frac_set_divisor(struct uart_port *port, unsigned int baud,
+				      unsigned int quot, unsigned int quot_frac)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+
+	serial_port_out(port, UART_LCR, up->lcr | UART_LCR_DLAB);
+	serial_dl_write(up, quot);
+	serial_port_out(port, LOONGSON_UART_DLF, quot_frac);
+}
+
+static int loongson_uart_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct uart_8250_port uart = {};
+	struct loongson_uart_data *ddata;
+	struct resource *res;
+	unsigned int flags;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	uart.port.irq = platform_get_irq(pdev, 0);
+	if (uart.port.irq < 0)
+		return -EINVAL;
+
+	device_property_read_u32(dev, "clock-frequency", &uart.port.uartclk);
+
+	spin_lock_init(&uart.port.lock);
+	uart.port.flags = UPF_SHARE_IRQ | UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_IOREMAP;
+	uart.port.iotype = UPIO_MEM;
+	uart.port.regshift = 0;
+	uart.port.dev = dev;
+	uart.port.type = PORT_LOONGSON;
+	uart.port.private_data = ddata;
+
+	uart.port.mapbase = res->start;
+	uart.port.mapsize = resource_size(res);
+	uart.port.serial_in = loongson_serial_in;
+	uart.port.serial_out = loongson_serial_out;
+
+	flags = (uintptr_t)device_get_match_data(dev);
+
+	if (flags & LOONGSON_UART_HAS_FRAC) {
+		uart.port.get_divisor = loongson_frac_get_divisor;
+		uart.port.set_divisor = loongson_frac_set_divisor;
+	}
+
+	if (flags & LOONGSON_UART_QUIRK_MCR)
+		ddata->mcr_invert |= (UART_MCR_RTS | UART_MCR_DTR);
+
+	if (flags & LOONGSON_UART_QUIRK_MSR)
+		ddata->msr_invert |= (UART_MSR_CTS | UART_MSR_DSR);
+
+	ddata->rst = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(ddata->rst))
+		return PTR_ERR(ddata->rst);
+
+	ret = reset_control_deassert(ddata->rst);
+	if (ret)
+		return ret;
+
+	ret = serial8250_register_8250_port(&uart);
+	if (ret < 0) {
+		reset_control_assert(ddata->rst);
+		return ret;
+	}
+
+	ddata->line = ret;
+	platform_set_drvdata(pdev, ddata);
+
+	return 0;
+}
+
+static void loongson_uart_remove(struct platform_device *pdev)
+{
+	struct loongson_uart_data *ddata = platform_get_drvdata(pdev);
+
+	serial8250_unregister_port(ddata->line);
+	reset_control_assert(ddata->rst);
+}
+
+static int loongson_uart_suspend(struct device *dev)
+{
+	struct loongson_uart_data *ddata = dev_get_drvdata(dev);
+
+	serial8250_suspend_port(ddata->line);
+
+	return 0;
+}
+
+static int loongson_uart_resume(struct device *dev)
+{
+	struct loongson_uart_data *data = dev_get_drvdata(dev);
+
+	serial8250_resume_port(data->line);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(loongson_uart_pm_ops, loongson_uart_suspend,
+				loongson_uart_resume);
+
+static const struct of_device_id loongson_uart_of_ids[] = {
+	{ .compatible = "loongson,ls2k0500-uart", .data = (void *)LS2K0500_UART_FLAG },
+	{ .compatible = "loongson,ls2k1500-uart", .data = (void *)LS2K1500_UART_FLAG },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, loongson_uart_of_ids);
+
+static struct platform_driver loongson_uart_driver = {
+	.probe = loongson_uart_probe,
+	.remove = loongson_uart_remove,
+	.driver = {
+		.name = "loongson-uart",
+		.pm = pm_ptr(&loongson_uart_pm_ops),
+		.of_match_table = loongson_uart_of_ids,
+	},
+};
+
+module_platform_driver(loongson_uart_driver);
+
+MODULE_DESCRIPTION("Loongson UART driver");
+MODULE_AUTHOR("Loongson Technology Corporation Limited.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 719faf92aa8a..53efe841656f 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -310,6 +310,14 @@ static const struct serial8250_config uart_config[] = {
 		.rxtrig_bytes	= {1, 8, 16, 30},
 		.flags		= UART_CAP_FIFO | UART_CAP_AFE,
 	},
+	[PORT_LOONGSON] = {
+		.name		= "Loongson",
+		.fifo_size	= 16,
+		.tx_loadsz	= 16,
+		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10,
+		.rxtrig_bytes   = {1, 4, 8, 14},
+		.flags		= UART_CAP_FIFO,
+	},
 };
 
 /* Uart divisor latch read */
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index f64ef0819cd4..98236b3bec10 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -468,6 +468,16 @@ config SERIAL_8250_OMAP_TTYO_FIXUP
 	  not booting kernel because the serial console remains silent in case
 	  they forgot to update the command line.
 
+config SERIAL_8250_LOONGSON
+	tristate "Loongson 8250 based serial port"
+	depends on SERIAL_8250
+	depends on LOONGARCH || COMPILE_TEST
+	help
+	  If you have a machine based on LoongArch CPU you can enable
+	  its onboard serial ports by enabling this option. The option
+	  is applicable to both devicetree and ACPI, say Y to this option.
+	  If unsure, say N.
+
 config SERIAL_8250_LPC18XX
 	tristate "NXP LPC18xx/43xx serial port support"
 	depends on SERIAL_8250 && OF && (ARCH_LPC18XX || COMPILE_TEST)
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 513a0941c284..e318a3240789 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_SERIAL_8250_HP300)		+= 8250_hp300.o
 obj-$(CONFIG_SERIAL_8250_HUB6)		+= 8250_hub6.o
 obj-$(CONFIG_SERIAL_8250_INGENIC)	+= 8250_ingenic.o
 obj-$(CONFIG_SERIAL_8250_IOC3)		+= 8250_ioc3.o
+obj-$(CONFIG_SERIAL_8250_LOONGSON)	+= 8250_loongson.o
 obj-$(CONFIG_SERIAL_8250_LPC18XX)	+= 8250_lpc18xx.o
 obj-$(CONFIG_SERIAL_8250_LPSS)		+= 8250_lpss.o
 obj-$(CONFIG_SERIAL_8250_MEN_MCB)	+= 8250_men_mcb.o
diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
index 9c007a106330..607cf060a72a 100644
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@ -31,6 +31,7 @@
 #define PORT_ALTR_16550_F128 28 /* Altera 16550 UART with 128 FIFOs */
 #define PORT_RT2880	29	/* Ralink RT2880 internal UART */
 #define PORT_16550A_FSL64 30	/* Freescale 16550 UART with 64 FIFOs */
+#define PORT_LOONGSON	31	/* Loongson 16550 UART */
 
 /*
  * ARM specific type numbers.  These are not currently guaranteed
-- 
2.47.3

