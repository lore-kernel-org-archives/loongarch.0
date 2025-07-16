Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1299B2877CD
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 07:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752649381; cv=none; b=ijX3gyVdFZM57ATGX0nvNLC6evK/hm3Tfi8o3yBCGCsrrW6SRYqDRU67mNsMOytNrXw9nEN9bEara3k3Xxyw+tzsv5HIKLTgzumRH75AluI5rMmYqJANfE6f4pCOWzoP6VBUf/6tfqj/OYdcLaeFJTLaoZBCd5GkCUALvbghbhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752649381; c=relaxed/simple;
	bh=GCKKAHT8nvCv0KPNNDAz30JdKfq/+8ro4VZQ7/wqI00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cB06ZrH2ub9HoRYuBgF1j4SwGspyH+61YvTHPTEVUBpHQxljXxqGxJcdg/orKs4F8fZn34GSCCkz+tF5i4liG3eQ/zrm4ZqD5fQIbzVbZRoDkPLCDkYyJF9qksMlaGSYDj5OTXgge028EzRghPuSx945gS3Izg4W/jhPWkeXtyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8CxG6ydTndoIQMrAQ--.48344S3;
	Wed, 16 Jul 2025 15:02:53 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJCxocKbTndoBnYZAA--.5577S2;
	Wed, 16 Jul 2025 15:02:52 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/3] LoongArch: dts: Add sdio controller support to Loongson-2K0500
Date: Wed, 16 Jul 2025 15:02:41 +0800
Message-ID: <20250716070243.3846100-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxocKbTndoBnYZAA--.5577S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr4rtr18Cw4xJFW3Gw48uFX_yoW5Gr15pa
	sF9rZrGrW0gF13trn8KFy8KF1ruF95CF9rXanrCFWUGws2qa4UZr18Jas3XF4Ygw4fX342
	qFn5t342kF4DZabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8HSoJUUUUU==

The Loongson-2K0500 integrates two SDIO controllers for SD storage cards
and SDIO cards, supporting SD storage card boot.

The module is supported now, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k0500-ref.dts          |  9 ++++++
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 28 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
index a34734a6c3ce..018ed904352a 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
@@ -41,6 +41,15 @@ linux,cma {
 	};
 };
 
+&apbdma3 {
+	status = "okay";
+};
+
+&mmc0 {
+	status = "okay";
+	bus-width = <4>;
+};
+
 &gmac0 {
 	status = "okay";
 
diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index 760c60eebb89..588ebc3bded4 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
@@ -104,7 +104,7 @@ dma-controller@1fe10c10 {
 			status = "disabled";
 		};
 
-		dma-controller@1fe10c20 {
+		apbdma2: dma-controller@1fe10c20 {
 			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
 			reg = <0 0x1fe10c20 0 0x8>;
 			interrupt-parent = <&eiointc>;
@@ -114,7 +114,7 @@ dma-controller@1fe10c20 {
 			status = "disabled";
 		};
 
-		dma-controller@1fe10c30 {
+		apbdma3: dma-controller@1fe10c30 {
 			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
 			reg = <0 0x1fe10c30 0 0x8>;
 			interrupt-parent = <&eiointc>;
@@ -437,6 +437,30 @@ i2c@1ff4a800 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@1ff64000 {
+			compatible = "loongson,ls2k0500-mmc";
+			reg = <0 0x1ff64000 0 0x2000>,
+			      <0 0x1fe10100 0 0x4>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <57>;
+			dmas = <&apbdma3 0>;
+			dma-names = "rx-tx";
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			status = "disabled";
+		};
+
+		mmc@1ff66000 {
+			compatible = "loongson,ls2k0500-mmc";
+			reg = <0 0x1ff66000 0 0x2000>,
+			      <0 0x1fe10100 0 0x4>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <58>;
+			dmas = <&apbdma2 0>;
+			dma-names = "rx-tx";
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			status = "disabled";
+		};
+
 		pmc: power-management@1ff6c000 {
 			compatible = "loongson,ls2k0500-pmc", "syscon";
 			reg = <0x0 0x1ff6c000 0x0 0x58>;

base-commit: f2443cbbf457c432b3ac295b7abb9a9cb5c94e3b
-- 
2.47.3

