Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37AF192B72
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 07:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520065; cv=none; b=VkvbEYUXsmhov+Nbs+2mpdlTPe1NCso2iQOgy5qjd79nOnS0o74MnRZNwa0sEas0tkx6b2x6Ncapy1Q903I3BBAApchhssbe8JmGrhTmzmZClUhEFt/hPnvUCM84FNLT6qDz+GxpoIK54pgusETsGzUI85SN7J84FaZV3vFJMXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520065; c=relaxed/simple;
	bh=MF3Y0CzgDsFpC7wFl5LNuW07mCgfBqWYRf36whn2acA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVLZcPrNyn8031Y2IOwsL3xEe60n3G8gs7vXyZRkq2SnUXLBvb891SnwVUjjRNiya+Tzj/8o7DjqKiSM0ldaaRWCaluRjOJETYd4eE8JpBJtrzNMBi3BY6A/1MNuchusgLzUHN20B51hM9o0ENyPGSzxzh8WdB1SRW/XrGc19ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.71])
	by gateway (Coremail) with SMTP id _____8Cxd+m9WNlmMRsrAA--.16496S3;
	Thu, 05 Sep 2024 15:07:41 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.71])
	by front1 (Coremail) with SMTP id qMiowMAx3ty7WNlmfMQEAA--.23872S2;
	Thu, 05 Sep 2024 15:07:40 +0800 (CST)
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
Subject: [PATCH v1 10/10] LoongArch: dts: Add I2S support to Loongson-2K2000
Date: Thu,  5 Sep 2024 15:07:38 +0800
Message-ID: <2c488201cd704d312bd9586e7bccea0179ad920f.1725518229.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMAx3ty7WNlmfMQEAA--.23872S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWrJryDCF1fXrWDWr47Jrc_yoW8CFWUpF
	Zru3yDJr4FqF42ka15JFWUJr1rJF9YkF93W3ZIy3y8Gw4qgw1jvr48tF92vF1xWrZ5X3y2
	qrnYkryjka1UJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzCJPUUUUU=

The module is supported, enable it.

Not all Loongson-2K2000 development boards have an i2s interface, here
is an example of adding one:

sound {
	compatible = "loongson,ls-audio-card";
	model = "Loongson-ASoC";
	mclk-fs = <512>;

	cpu {
		sound-dai = <&i2s>;
	};

	codec {
		sound-dai = <&es8323>;
	};
};

&i2c1 {
	status = "okay";
	#address-cells = <1>;
	#size-cells = <0>;

	es8323:es8323@10 {
		compatible = "everest,es8323";
		reg = <0x10>;
		#sound-dai-cells = <0>;
	};
};

&i2s {
	status = "okay";

	clock-frequency = <175000000>;
	#sound-dai-cells = <0>;
 };

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k2000.dtsi | 22 ++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index 0953c5707825..b4ff55a33e90 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -173,6 +173,22 @@ rtc0: rtc@100d0100 {
 			status = "disabled";
 		};
 
+		i2c@1fe00120 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0x0 0x1fe00120 0x0 0x8>;
+			interrupt-parent = <&liointc>;
+			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c@1fe00130 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0x0 0x1fe00130 0x0 0x8>;
+			interrupt-parent = <&liointc>;
+			interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		uart0: serial@1fe001e0 {
 			compatible = "ns16550a";
 			reg = <0x0 0x1fe001e0 0x0 0x10>;
@@ -243,9 +259,11 @@ display@6,1 {
 				status = "disabled";
 			};
 
-			hda@7,0 {
+			i2s@7,0 {
 				reg = <0x3800 0x0 0x0 0x0 0x0>;
-				interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <78 IRQ_TYPE_LEVEL_HIGH>,
+					     <79 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx", "rx";
 				interrupt-parent = <&pic>;
 				status = "disabled";
 			};
-- 
2.43.5

