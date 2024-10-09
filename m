Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4BA185B68
	for <loongarch@lists.linux.dev>; Wed,  9 Oct 2024 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460398; cv=none; b=QDMJnAjdoF1TpFUm8lZEJSVGm6kxeGH2AI2aZ3Gn/xm0iI0RE0RwwlYjDNXDBH9iDu2QpsNLdNlBLs9zJlgIbIidUcuhOf18qTxC4IigIJ4IKusQ978e6Uqj77IuaNgFjHdMdHytrskHb4rTXwHrwIdRkl6hktoe3G3GDC7cyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460398; c=relaxed/simple;
	bh=37auH5AZQRMmIctd6LDyBY5XNWvnXTh/fbk8ngbRvAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QULEhyoC28AurmeiwMKZoebdBeMavG/bpsfTd3QoMcu8fzdwO4oc7cz98EFLJlAawZ2n5q2pp44yGWkNtERDVvNO8X3K6/DCRL/+UxRMYHfRIfRQmZlsPlfLJP7COMcgArAgETv91qOwQgcNGmjU54t9ntS2zwX7aPo+IK0noYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8BxFHFqNgZn37IQAA--.23738S3;
	Wed, 09 Oct 2024 15:53:14 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMBxXuRnNgZn1hYhAA--.37420S2;
	Wed, 09 Oct 2024 15:53:13 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuming Fan <shumingf@realtek.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 8/9] LoongArch: dts: Add I2S support to Loongson-2K1000
Date: Wed,  9 Oct 2024 15:52:59 +0800
Message-ID: <0555797a830267d335c516e2e6cadbed73a0bcf3.1728459624.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1728459624.git.zhoubinbin@loongson.cn>
References: <cover.1728459624.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXuRnNgZn1hYhAA--.37420S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw45XryxXr47AF47ZF1kWFX_yoW8tr13p3
	ZFvw4kGrWFqF429as8JFyUJF1rZas5AF97uanIkry7G39Iq3Wjqr48tF93ZF1jqr4fX3y2
	qFs5t347CF1qqwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUm2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	ZF0_GryDMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwACjcxG6xCI17CEII8vrVW3JVW8Jr1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bYoGQUUUUU=

The module is supported, adding it.

Not all Loongson-2K1000 boards have an i2s interface, here is an example
of enabling it:

sound {
	compatible = "loongson,ls-audio-card";
	model = "Loongson-ASoC";
	mclk-fs = <512>;

	cpu {
		sound-dai = <&i2s>;
	};

	codec {
		sound-dai = <&uda1342>;
	};
};

&apbdma2 {
	status = "okay";
};

&apbdma3 {
	status = "okay";
};

&i2c3 {
	status = "okay";

	pinctrl-0 = <&i2c1_pins_default>;
	pinctrl-names = "default";

	#address-cells = <1>;
	#size-cells = <0>;

	uda1342: codec@1a {
		compatible = "nxp,uda1342";
		reg = <0x1a>;
		#sound-dai-cells = <0>;
	};
};

&i2s {
	status = "okay";

	pinctrl-0 = <&hda_pins_default>;
	pinctrl-names = "default";
};

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index 92180140eb56..8dff2aa52417 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -266,7 +266,7 @@ dma-controller@1fe00c10 {
 			status = "disabled";
 		};
 
-		dma-controller@1fe00c20 {
+		apbdma2: dma-controller@1fe00c20 {
 			compatible = "loongson,ls2k1000-apbdma";
 			reg = <0x0 0x1fe00c20 0x0 0x8>;
 			interrupt-parent = <&liointc1>;
@@ -276,7 +276,7 @@ dma-controller@1fe00c20 {
 			status = "disabled";
 		};
 
-		dma-controller@1fe00c30 {
+		apbdma3: dma-controller@1fe00c30 {
 			compatible = "loongson,ls2k1000-apbdma";
 			reg = <0x0 0x1fe00c30 0x0 0x8>;
 			interrupt-parent = <&liointc1>;
@@ -352,6 +352,19 @@ rtc0: rtc@1fe27800 {
 			status = "disabled";
 		};
 
+		i2s: i2s@1fe2d000 {
+			compatible = "loongson,ls2k1000-i2s";
+			reg = <0 0x1fe2d000 0 0x14>,
+			      <0 0x1fe00438 0 0x8>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			dmas = <&apbdma2 0>, <&apbdma3 0>;
+			dma-names = "tx", "rx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		spi0: spi@1fff0220 {
 			compatible = "loongson,ls2k1000-spi";
 			reg = <0x0 0x1fff0220 0x0 0x10>;
-- 
2.43.5

