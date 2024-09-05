Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619C5188A37
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520056; cv=none; b=YxdldZyeFExra/yRyf1vQsCsYkkzJAvd8G6Ry6fLxlMqxe4v4lXKeqmPFeyWCsb/seWfRNifbRbVBEP2dqW+sUW3BS926SFlIDmY2dX2DosvIlk5YS6tfJ5nB9R7V9iXL1b7XQpV5TUEPsB0aqTb8E/CJz9x1SF/TTvAHII8kjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520056; c=relaxed/simple;
	bh=kvECuzNV2lAaWFEHINyazo7DSpunYfNvVEjFErJoZuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfDxmVly4fs//hY+XEWEsPgkW0DksNT7GA7yZoDy8H+wxIIjjuoNjp2+WEt74rPXGYab6IPHHDoFx8zgWCXKAeQoMCiMARe8PNBT6vtcza2RFSjzkZ46MVdLt1wwglS7yliJKTuX7VovcI7FGig0A/BnPiL76k90wIEGbS27pjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.71])
	by gateway (Coremail) with SMTP id _____8AxGuq0WNlmGBsrAA--.18050S3;
	Thu, 05 Sep 2024 15:07:32 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.71])
	by front1 (Coremail) with SMTP id qMiowMAxG9yrWNlmcMQEAA--.5106S3;
	Thu, 05 Sep 2024 15:07:31 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 09/10] LoongArch: dts: Add I2S support to Loongson-2K1000
Date: Thu,  5 Sep 2024 15:07:22 +0800
Message-ID: <226f850ad459b44de0d89a7f4a2a4d07ee03b707.1725518229.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1725518229.git.zhoubinbin@loongson.cn>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxG9yrWNlmcMQEAA--.5106S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWrJryDCF1fJrW7tw4rtFc_yoW8tr43p3
	ZFvw4DGrWFqF429as8JFyUJr1rZas5AF97uanxCry7G39Iq3Wjqr48tF93ZF1jgr4fX3y2
	qFs5t347CF1qqwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzCJPUUUUU=

The module is supported, enable it.

Not all Loongson-2K1000 development boards have an i2s interface, here
is an example of adding one:

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

