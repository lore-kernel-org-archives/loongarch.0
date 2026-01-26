Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590E9274B58
	for <loongarch@lists.linux.dev>; Mon, 26 Jan 2026 06:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769409796; cv=none; b=b2DZ/n6ovmI9huq3Bch4/PR0n/uYuLzc6dul0ijPyxiD26LrsVz3n8nXMNtOC5ttGhO2b/8C46Q3JhSZRcky7uA9CXryqhJDKoetysA0hZXsrx8GF9IcwDj13EekIq6KEqzxB1Yy/1+m00l7ZUTcb02+pJM5iSyK/sNdYCSScDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769409796; c=relaxed/simple;
	bh=IFZXVhELqh6euRdJ0SdQC1mjqur1ikIWQS6M7F2IRBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4oubul8XVuIlkZitD3vp2e4Z0d/Zmy5DmDwcq9zX4KmZvhBOGYFBXEykuSxaOL5jZVMEW9uEDqH/1YICOJLcpikKtZpkc/ZCj3geWPDkI8blNtZZEeRhexgeZqgn8z78MxkuRYPEjxf4SeQZbvhKrlK1yDJjnVW7mwyba4Y110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.42])
	by gateway (Coremail) with SMTP id _____8DxOML6DHdpJqAMAA--.41429S3;
	Mon, 26 Jan 2026 14:43:06 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.42])
	by front1 (Coremail) with SMTP id qMiowJBxSeD1DHdpfYkxAA--.33376S2;
	Mon, 26 Jan 2026 14:43:02 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/2] LoongArch: dts: loongson-2k0500: Add nand controller support
Date: Mon, 26 Jan 2026 14:42:51 +0800
Message-ID: <51f52f21c3ce84dbb5b6b100186807adf146dde0.1769409559.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeD1DHdpfYkxAA--.33376S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQETCGl1sLkGuQABsw
X-Coremail-Antispam: 1Uk129KBj93XoW7tF47ZFyrtF47CFykArWfXrc_yoW8Zw4Dpa
	sFv39xGrsa9F1xKrsxtry8Kr13uF95GF9rWa9xCryUGrsFv34jvr18tF93XF4Yqr4Fq3yj
	qFyFg342kF4DAabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

The module is supported, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k0500-ref.dts          | 19 +++++++++++++++++++
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 12 +++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
index 018ed904352a..7ace54c84244 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
@@ -41,6 +41,25 @@ linux,cma {
 	};
 };
 
+&apbdma0 {
+	status = "okay";
+};
+
+&nand {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	nand@0 {
+		reg = <0>;
+		label = "ls2k0500-nand";
+		nand-use-soft-ecc-engine;
+		nand-ecc-algo = "bch";
+		nand-ecc-strength = <8>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
 &apbdma3 {
 	status = "okay";
 };
diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index e759fae77dcf..1b502064df11 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
@@ -84,7 +84,7 @@ clk: clock-controller@1fe10400 {
 			clock-names = "ref_100m";
 		};
 
-		dma-controller@1fe10c00 {
+		apbdma0: dma-controller@1fe10c00 {
 			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
 			reg = <0 0x1fe10c00 0 0x8>;
 			interrupt-parent = <&eiointc>;
@@ -172,6 +172,16 @@ eiointc: interrupt-controller@1fe11600 {
 			interrupts = <3>;
 		};
 
+		nand: nand-controller@1ff58000 {
+			compatible = "loongson,ls2k0500-nand-controller";
+			reg = <0 0x1ff58000 0 0x24>,
+			      <0 0x1ff58040 0 0x4>;
+			reg-names = "nand", "nand-dma";
+			dmas = <&apbdma0 0>;
+			dma-names = "rxtx";
+			status = "disabled";
+		};
+
 		pwm@1ff5c000 {
 			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
 			reg = <0x0 0x1ff5c000 0x0 0x10>;

base-commit: a8ebb63508504cb09b216ee6680a16d04dc5d2d5
-- 
2.47.3

