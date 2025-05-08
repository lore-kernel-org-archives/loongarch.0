Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1045321577E
	for <loongarch@lists.linux.dev>; Thu,  8 May 2025 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746687776; cv=none; b=h2aBRfgCH6ODU3NkAKAFKm6GLwH3Cl/PdmnbS7MJh10zQPBQOaLAr8cFYdV33PI3U5CBbJd4/yqoCeLZBUbHQ0ASEYWUYeYjVKMoi7BdmwaRW6gyWG2obpP1hdJsTQ7ftBpJel5pXugBkm/Cyq7jPmuZTyFoERQsW8nqYFy+2LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746687776; c=relaxed/simple;
	bh=9oRaRzy2aSmIbHAYQgtO6PaQ7QBtOui0ux6SmGivGME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNOFGGgZ26JiLc0ZalbnV3Xl9/w6Mw+y4/+agFQgwFAqqubpYqtaQBZJvWTY/U7kX9CPW0duKDz1uHBz9CoyzB+JCfpJ8nEIyE45bTINgdtGGD81v5oJ8jxy2xFrJYTmeHdsloXCXKiD3tPWtxlX5+nqsKne3Y8+hhSmdaCS5hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8DxC3IZVxxoYmXZAA--.29003S3;
	Thu, 08 May 2025 15:02:49 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMBxLscWVxxo6nO8AA--.25269S4;
	Thu, 08 May 2025 15:02:48 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 2/3] LoongArch: dts: Add PWM support to Loongson-2K1000
Date: Thu,  8 May 2025 15:02:35 +0800
Message-ID: <97aca0bc6b4825bed800630d54f77befe4bec763.1746684614.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1746684614.git.zhoubinbin@loongson.cn>
References: <cover.1746684614.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxLscWVxxo6nO8AA--.25269S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw15uFyUtr1xuw18Ww45Arc_yoW5Cw4Dpa
	sF93yDKrW09F12gwn8JFy8Jrs5ZF95GF97WanxCFyUGrsIgw4jvr18tF93XF48Wr45X340
	grn5Kry2gF1DXabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

The module is supported, enable it.
Also, add the pwm-fan and cooling-maps associated with it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k1000-ref.dts          | 24 +++++++++++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 42 ++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
index 3514ea78f525..78ea995abf1c 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include "dt-bindings/thermal/thermal.h"
 #include "loongson-2k1000.dtsi"
 
 / {
@@ -38,6 +39,13 @@ linux,cma {
 			linux,cma-default;
 		};
 	};
+
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <255 153 85 25>;
+		pwms = <&pwm1 0 100000 0>;
+		#cooling-cells = <2>;
+	};
 };
 
 &gmac0 {
@@ -92,6 +100,22 @@ &spi0 {
 	#size-cells = <0>;
 };
 
+&pwm1 {
+	status = "okay";
+
+	pinctrl-0 = <&pwm1_pins_default>;
+	pinctrl-names = "default";
+};
+
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_alert>;
+			cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index 8dff2aa52417..1da3beb00f0e 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -68,7 +68,7 @@ i2c-gpio-1 {
 	};
 
 	thermal-zones {
-		cpu-thermal {
+		cpu_thermal: cpu-thermal {
 			polling-delay-passive = <1000>;
 			polling-delay = <5000>;
 			thermal-sensors = <&tsensor 0>;
@@ -322,6 +322,46 @@ i2c3: i2c@1fe21800 {
 			status = "disabled";
 		};
 
+		pwm@1fe22000 {
+			compatible = "loongson,ls2k1000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1fe22000 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@1fe22010 {
+			compatible = "loongson,ls2k1000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1fe22010 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1fe22020 {
+			compatible = "loongson,ls2k1000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1fe22020 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1fe22030 {
+			compatible = "loongson,ls2k1000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1fe22030 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		pmc: power-management@1fe27000 {
 			compatible = "loongson,ls2k1000-pmc", "loongson,ls2k0500-pmc", "syscon";
 			reg = <0x0 0x1fe27000 0x0 0x58>;
-- 
2.47.1

