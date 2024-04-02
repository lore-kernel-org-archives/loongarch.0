Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B133D39B
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712044765; cv=none; b=Arqv+xHGZRqyqalKhFbHzIKqIErOeuD71X7MoWvfjN/H22HexAlS6zriyUB0IJKiu04JyLMJFmfjIPdwtBVbWVXAmDEURaQKU4AMQupJPBnvxnbmJB1LJvgAD8Trpd2H+PMeuMdSMTHb4o1JKHycxFguGB2Ze6o2Hr21ogVTgGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712044765; c=relaxed/simple;
	bh=bIvaVP5mEwLDbQhrF48dhvb7ahdaKVsPHjP7AQ1HTOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HcSEJJt/DdHC8k5ghHKmSzwt4lJPSJSS/9MFB7qPBnL11HI+rAzHCFIp1ytBM9Q1U1roQMw95RlMBQSuqZNX3TCnccW8CbmtfQQ9KFR5HtUKy605fY39eZjVX5RNxJHqcKgBgGYhMpMNQ0m9MoPj46b1GNOR+fKNb5/tv5mqBK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8Bx3+vYugtmrT8iAA--.13037S3;
	Tue, 02 Apr 2024 15:59:20 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxPs_WugtmEaRxAA--.22839S2;
	Tue, 02 Apr 2024 15:59:18 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 4/5] LoongArch: dts: Add PWM support to Loongson-2K1000
Date: Tue,  2 Apr 2024 15:59:05 +0800
Message-ID: <cf9585343fbf245719edbc9ff1d3eddbbf34698f.1711953223.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711953223.git.zhoubinbin@loongson.cn>
References: <cover.1711953223.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxPs_WugtmEaRxAA--.22839S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw15KFy8tw43Gw1xurW3urX_yoW5Cw1fpa
	sF93yDKrWv9F12gwn8tFy8Ars5ZF95GF97WanxCFyUGrZIgw1jvr18tF93XF4kWr45X34F
	grn5Kry2gF1UXabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0lPfDUUUUU==

The module is supported, enable it.
Also, add the pwm-fan and cooling-maps associated with it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k1000-ref.dts          | 24 +++++++++++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 42 ++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
index ed4d32434041..a7cd3912f30d 100644
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
+		pwms = <&pwm1 1 100000 0>;
+		#cooling-cells = <2>;
+	};
 };
 
 &gmac0 {
@@ -97,6 +105,22 @@ spidev@0 {
 	};
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
index 49a70f8c3cab..0ebaace3214b 100644
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
@@ -316,6 +316,46 @@ i2c3: i2c@1fe21800 {
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
2.43.0

