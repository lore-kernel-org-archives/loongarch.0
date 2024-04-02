Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9863D3A5
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712044765; cv=none; b=I0Z1q9c4/pbeRqPk0IN0lq395def9wQ95bEYO4riiZiXz4MtrfMGL1Viz52SjRUpc/LmY0fAAGesh5TahY/8433uI8GWecBn5BiKRFgAmDkCYIya3zSpjLFUws0Klgi4Qt5agPP3dc/aS/F1Fp7HnFp+7qfoXv1RrI8/cwqkDvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712044765; c=relaxed/simple;
	bh=RjzY/TrHpPzgQXWVOSSQ3iE3+KepvtFf5tjgeWxzioU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJ7UhkQTTKMLJkErydXcpPPDYMVKyJTSGSzQNoK1ahfAeQ6vWntUsHCSQwnMAA0aFhrVlAszuO1RF7X3BC910BLrkj4C69/i+JU1fkf20EaU4fcRKt1Mff2BMDOK+Ks/+Weqn4audQP8L9XmN5REpwpC9NrWvsuYv+FVJDL2qAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8DxvuvZugtmtT8iAA--.13025S3;
	Tue, 02 Apr 2024 15:59:21 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxPs_WugtmEaRxAA--.22839S3;
	Tue, 02 Apr 2024 15:59:21 +0800 (CST)
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
Subject: [PATCH v1 5/5] LoongArch: dts: Add PWM support to Loongson-2K2000
Date: Tue,  2 Apr 2024 15:59:06 +0800
Message-ID: <7214b933ce85f9d030828e9efab7fbeb57eb712b.1711953223.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:AQAAf8CxPs_WugtmEaRxAA--.22839S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFW8ZFyxAFW8CFWxAF1UArc_yoW8Kw48pa
	sru3yUKrW0gF1Ikwn8XFy8KFZ3Zr95CF9rWFnrAFyUJ34DKw4jva18GFyxXF1xWr4UX34a
	vFnakryjgFZrXwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j3GYdUUUUU=

The module is supported, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k2000.dtsi | 60 ++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index 605efaba7292..278cbc27d19b 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -126,6 +126,66 @@ msi: msi-controller@1fe01140 {
 			interrupt-parent = <&eiointc>;
 		};
 
+		pwm@100a0000 {
+			compatible = "loongson,ls2k2000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x100a0000 0x0 0x10>;
+			interrupt-parent = <&pic>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_MISC_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@100a0100 {
+			compatible = "loongson,ls2k2000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x100a0100 0x0 0x10>;
+			interrupt-parent = <&pic>;
+			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_MISC_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@100a0200 {
+			compatible = "loongson,ls2k2000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x100a0200 0x0 0x10>;
+			interrupt-parent = <&pic>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_MISC_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@100a0300 {
+			compatible = "loongson,ls2k2000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x100a0300 0x0 0x10>;
+			interrupt-parent = <&pic>;
+			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_MISC_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@100a0400 {
+			compatible = "loongson,ls2k2000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x100a0400 0x0 0x10>;
+			interrupt-parent = <&pic>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_MISC_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@100a0500 {
+			compatible = "loongson,ls2k2000-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x100a0500 0x0 0x10>;
+			interrupt-parent = <&pic>;
+			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_MISC_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		rtc0: rtc@100d0100 {
 			compatible = "loongson,ls2k2000-rtc", "loongson,ls7a-rtc";
 			reg = <0x0 0x100d0100 0x0 0x100>;
-- 
2.43.0

