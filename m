Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59146279917
	for <loongarch@lists.linux.dev>; Mon, 26 Jan 2026 06:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769409796; cv=none; b=IY5Pj0DXsTuChEt09jUGSGIKlN00/zcUCrjGyk8gfvJeF206LMG0f1WmcbaiNN8+iWiNSNEHxvXHbr7wf277HsMJB/vtG6fESwqHUnYy2dnl4xn+VnVMDQKYXh1yWyG8JqvmdhYEdg20viXHF3YI/eeh57V+fsz3W5/v7Io6cKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769409796; c=relaxed/simple;
	bh=Pv1j8yCqOUew2FNGuU/vYjitA5r9UxzS1Zm9DLHMrNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOXOhUqHskU24aqv/VZpdPFShTkVzo/DLH8A9iis39TWj34XbSxgwW0HoAs6yOU6meVkki7LSzofZ5gOsR9KSkcwybGJSHHt8fJd8ljRFFPEIAIrn8BIZ9kYVQxs3XQIdGTdjV4tUV2sAnS2XrOMHzOoq7anm5gYh6YmKGpgleI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.42])
	by gateway (Coremail) with SMTP id _____8AxisL7DHdpKqAMAA--.41111S3;
	Mon, 26 Jan 2026 14:43:07 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.42])
	by front1 (Coremail) with SMTP id qMiowJBxSeD1DHdpfYkxAA--.33376S3;
	Mon, 26 Jan 2026 14:43:06 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/2] LoongArch: dts: loongson-2k1000: Add nand controller support
Date: Mon, 26 Jan 2026 14:42:52 +0800
Message-ID: <6d8c6f7af710321d41007ae4fea5703d24e5a36f.1769409559.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <51f52f21c3ce84dbb5b6b100186807adf146dde0.1769409559.git.zhoubinbin@loongson.cn>
References: <51f52f21c3ce84dbb5b6b100186807adf146dde0.1769409559.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeD1DHdpfYkxAA--.33376S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGl3Ah0AlwAAsO
X-Coremail-Antispam: 1Uk129KBj93XoWxJrWxKFy5Wry3ZFWxZrW8GrX_yoW8urW8pa
	sF9wsxKrZ29ryIgrnxJryUtr45ZF95JF97WanxuFyUG39Iv34jvr18tF9aqF4DXF4ft34F
	gFn5G34xKF4DuabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjOJ5UUUUU=

The module is supported, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k1000-ref.dts          | 22 +++++++++++++++++++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 13 ++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
index d9a452ada5d7..51b8e53cb608 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
@@ -48,6 +48,28 @@ fan0: pwm-fan {
 	};
 };
 
+&apbdma0 {
+	status = "okay";
+};
+
+&nand {
+	status = "okay";
+
+	pinctrl-0 = <&nand_pins_default>;
+	pinctrl-names = "default";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	nand@0 {
+		reg = <0>;
+		label = "ls2k1000-nand";
+		nand-use-soft-ecc-engine;
+		nand-ecc-algo = "bch";
+		nand-ecc-strength = <8>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
 &apbdma1 {
 	status = "okay";
 };
diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index be4f7d119660..ab6a55937e9e 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -248,7 +248,7 @@ tsensor: thermal-sensor@1fe01500 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		dma-controller@1fe00c00 {
+		apbdma0: dma-controller@1fe00c00 {
 			compatible = "loongson,ls2k1000-apbdma";
 			reg = <0x0 0x1fe00c00 0x0 0x8>;
 			interrupt-parent = <&liointc1>;
@@ -364,6 +364,17 @@ pwm@1fe22030 {
 			status = "disabled";
 		};
 
+		nand: nand-controller@1fe26000 {
+			compatible = "loongson,ls2k1000-nand-controller";
+			reg = <0 0x1fe26000 0 0x24>,
+			      <0 0x1fe26040 0 0x4>,
+			      <0 0x1fe00438 0 0x8>;
+			reg-names = "nand", "nand-dma", "dma-config";
+			dmas = <&apbdma0 0>;
+			dma-names = "rxtx";
+			status = "disabled";
+		};
+
 		pmc: power-management@1fe27000 {
 			compatible = "loongson,ls2k1000-pmc", "loongson,ls2k0500-pmc", "syscon";
 			reg = <0x0 0x1fe27000 0x0 0x58>;
-- 
2.47.3

