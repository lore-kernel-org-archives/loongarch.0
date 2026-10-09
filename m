Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C124908DB
	for <loongarch@lists.linux.dev>; Fri,  9 Oct 2026 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537599; cv=none; b=lhjSigYdNoscj5/ZXUYN6wj2SYH7ST7QHS2bQU+OBDbKvZ5k2xOrQRmYc3HGoOxcC6o0muX/G4WKypPr54/KDxvv9Jfg2y3Puegs98Znf2BsHBe/c8DM95gps85eG8plvf27/CjWrsFqoHCCIUWcOAI2MvlgmWc5foZCM4lZ9+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537599; c=relaxed/simple;
	bh=RrmSgPHKHAdzmxCRAIhKbaIJU533FITIFc6uetIdek8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyVEm4nUFJcTtpAtzzBjEWF1Kg36woGDXARRtGwoW2BsJWSrbG8xt+UxYGb4aVG3m1mquEvmcra4TWKgH+7QbKZccojfijx0+s64GX5f/mEOzTZ8IOAPcdZvudpuMPo9wpbNTskQjxZJKtGkpaWm7laqyWTmdeX3FsdCLrKaA/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8Bx79K8schqahUUAA--.59022S3;
	Fri, 09 Oct 2026 17:19:56 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJDxBc22schqA2cqAA--.61825S3;
	Fri, 09 Oct 2026 17:19:56 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 1/3] dt-bindings: dma: loongson: Add Loongson-2 DMA mux request IDs
Date: Fri,  9 Oct 2026 17:19:32 +0800
Message-ID: <e61992f8e86c69305f984da676092019c0210649.1791535540.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1791535540.git.zhoubinbin@loongson.cn>
References: <cover.1791535540.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc22schqA2cqAA--.61825S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEPCGrIW3oFpgAAsk
X-Coremail-Antispam: 1Uk129KBj93XoWxGw13Ww18CFWrWF4rCFWxAFc_yoW5AF4fp3
	sIkF9akFy0yFWfC3yrKF1rKr13Xrn8Ary7Jay7Zrs7Zan7Jw1Yqr13Ga1YvrWUWF4fZrWx
	XrykWw47WasxXrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUzku4UUUUU

Add DT binding constants for the Loongson-2 DMA mux.

The header defines the peripheral request IDs used in the DMA specifier
<request channel flags> for Loongson-2K0300, covering UART0-9, I2C0-3,
SPI2/3, I2S, ADC and CAN0-3. It also documents the channel-pair semantics
for peripherals that use paired DMA channels.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                                   |  1 +
 .../dt-bindings/dma/loongson,ls2k-dmamux.h    | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 42f5165019ee..172dde21275f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15354,6 +15354,7 @@ F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
 F:	drivers/dma/loongson/loongson2-apb-dma.c
+F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
 
 LOONGSON LS2X I2C DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
diff --git a/include/dt-bindings/dma/loongson,ls2k-dmamux.h b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
new file mode 100644
index 000000000000..1e2907ab069d
--- /dev/null
+++ b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Loongson-2 SoC DMA Mux dt-bindings
+ *
+ * DMA specifier format:
+ *   dmas = <&dma_mux <request> <channel> <flags>>;
+ *
+ * The <channel> cell selects a physical CMC DMA channel (0-7)
+ * For peripherals using channel pairs (UART, I2C, SPI2/3, I2S),
+ * the channel number selects the pair: 0/1 -> pair 0, 2/3 -> pair 1,
+ * 4/5 -> pair 2, 6/7 -> pair 3.
+ *
+ * Copyright (C) 2026 Loongson Technology Corporation Limited
+ */
+
+#ifndef _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
+#define _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
+
+/* UART controllers */
+#define LS2K0300_DMA_UART0		0
+#define LS2K0300_DMA_UART1		1
+#define LS2K0300_DMA_UART2		2
+#define LS2K0300_DMA_UART3		3
+#define LS2K0300_DMA_UART4		4
+#define LS2K0300_DMA_UART5		5
+#define LS2K0300_DMA_UART6		6
+#define LS2K0300_DMA_UART7		7
+#define LS2K0300_DMA_UART8		8
+#define LS2K0300_DMA_UART9		9
+
+/* I2C controllers */
+#define LS2K0300_DMA_I2C0		10
+#define LS2K0300_DMA_I2C1		11
+#define LS2K0300_DMA_I2C2		12
+#define LS2K0300_DMA_I2C3		13
+
+/* SPI controllers (IO mode) */
+#define LS2K0300_DMA_SPI2		14
+#define LS2K0300_DMA_SPI3		15
+
+/* I2S controller */
+#define LS2K0300_DMA_I2S		16
+
+/* ADC controller */
+#define LS2K0300_DMA_ADC		17
+
+/* CAN-FD controllers */
+#define LS2K0300_DMA_CAN0		18
+#define LS2K0300_DMA_CAN1		19
+#define LS2K0300_DMA_CAN2		20
+#define LS2K0300_DMA_CAN3		21
+
+#endif /* _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H */
-- 
2.52.0

