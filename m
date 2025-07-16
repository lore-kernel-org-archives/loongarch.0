Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6739C288C38
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 07:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752649381; cv=none; b=b8WzM2asn7GjjYR8rohHlRhNDglGemUBAS2+2juFSydUWawJXf0ANHlWL7iTONQUjJij5H9NLzRvVSv9wNIg5SBd89iZtsNYLtrg5losm9VRwLu05sOW1AqEkNI+f1KNYdnm3k8ZBYJfkfdGDUI/F3fv+a7UP8i2XDCph/MqbCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752649381; c=relaxed/simple;
	bh=DmqZcAxfQVMx/Qh61ftQl1PHhCXpW/e1LuJ3OrvirSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQEsZD7SX55XKC4a2A/VAzcIheS8j+Bcwgu5SRdF4RwlJ+orqOWS2RJP6g8N68NHN08fcRpayM/c9b/Yd9CWt9+FP9/SJzRAWeKYZiShgXQS9z+sARxEl1nMuoOfQDHVnI3AFwZUjEUQCHMhKmHHKlEq/Hsmq/2cZqDZFxTJIqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8BxlmmeTndoJwMrAQ--.23605S3;
	Wed, 16 Jul 2025 15:02:54 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJCxocKbTndoBnYZAA--.5577S3;
	Wed, 16 Jul 2025 15:02:54 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/3] LoongArch: dts: Add sdio controller support to Loongson-2K1000
Date: Wed, 16 Jul 2025 15:02:42 +0800
Message-ID: <20250716070243.3846100-2-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250716070243.3846100-1-zhoubinbin@loongson.cn>
References: <20250716070243.3846100-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxocKbTndoBnYZAA--.5577S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr1rXw4kuw4DCrWkZw4xGrX_yoW5WFWUpw
	nrurs0qrs2grya9F15KFWUWr1xAa4kArn7WrnIkrW7G39Fgw12vr48GF9YqF1xWayrJayf
	XrZ3GryUGFyruwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8vD
	73UUUUU==

The Loongson-2K1000 integrates one SDIO controller for SD storage cards
and SDIO cards.

The module is supported now, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k1000-ref.dts          | 13 ++++++++++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 24 ++++++++++++++-----
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
index 78ea995abf1c..b190407a4843 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
@@ -48,6 +48,19 @@ fan0: pwm-fan {
 	};
 };
 
+&apbdma1 {
+	status = "okay";
+};
+
+&mmc {
+	status = "okay";
+
+	pinctrl-0 = <&sdio_pins_default>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	cd-gpios = <&gpio0 22 GPIO_ACTIVE_LOW>;
+};
+
 &gmac0 {
 	status = "okay";
 
diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index 1da3beb00f0e..4c0817c4dbb0 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -187,14 +187,14 @@ gpio0: gpio@1fe00500 {
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
-				     <>,
-				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 IRQ_TYPE_NONE>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_NONE>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
 				     <26 IRQ_TYPE_LEVEL_HIGH>,
@@ -209,13 +209,13 @@ gpio0: gpio@1fe00500 {
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
-				     <>,
+				     <0 IRQ_TYPE_NONE>,
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
-				     <>,
-				     <>,
+				     <0 IRQ_TYPE_NONE>,
+				     <0 IRQ_TYPE_NONE>,
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
 				     <27 IRQ_TYPE_LEVEL_HIGH>,
@@ -256,7 +256,7 @@ dma-controller@1fe00c00 {
 			status = "disabled";
 		};
 
-		dma-controller@1fe00c10 {
+		apbdma1: dma-controller@1fe00c10 {
 			compatible = "loongson,ls2k1000-apbdma";
 			reg = <0x0 0x1fe00c10 0x0 0x8>;
 			interrupt-parent = <&liointc1>;
@@ -405,6 +405,18 @@ i2s: i2s@1fe2d000 {
 			status = "disabled";
 		};
 
+		mmc: mmc@1fe2c000 {
+			compatible = "loongson,ls2k1000-mmc";
+			reg = <0 0x1fe2c000 0 0x68>,
+			      <0 0x1fe00438 0 0x8>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			dmas = <&apbdma1 0>;
+			dma-names = "rx-tx";
+			status = "disabled";
+		};
+
 		spi0: spi@1fff0220 {
 			compatible = "loongson,ls2k1000-spi";
 			reg = <0x0 0x1fff0220 0x0 0x10>;
-- 
2.47.3

