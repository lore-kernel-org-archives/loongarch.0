Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44F833FD
	for <loongarch@lists.linux.dev>; Thu,  8 May 2025 07:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746687774; cv=none; b=aMBtPMlaPEoBJhCdsjxWAY1wOBGfYeFyo2JNHzUxLA+/qJqIOxuUvS42JoH5nLOUc22G1m1IbCIuu1iOI+ZOHGicHvJZViZcBm81inQQApYz1Xy2VzhlFkVKhuMa1DtKilN+QyjFQPNrO8P4Ef/4n36c2NXb2RamRSGIT7Ovw/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746687774; c=relaxed/simple;
	bh=PViuhnJxLGB3fWTySH+ZorDPr5tu7EgTAvfuafSYYaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVGG6JNq/ULSh5mOdGKOXJ8uCQHpD/YRsdhzu6Z8LRWx6XpCGsDWeX+8MN8v7hmScazJebkHJONFiMd7tD9YWyxBvm9L0mV0ZVWlZTKhzZUSlRzrlD8LdCM1C0i0QpKD3w0zdhVNhQlgmnS2H2ixWFATnZD0L6JPwmpiM71LPSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8Bx63EXVxxoXGXZAA--.28842S3;
	Thu, 08 May 2025 15:02:47 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMBxLscWVxxo6nO8AA--.25269S3;
	Thu, 08 May 2025 15:02:47 +0800 (CST)
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
Subject: [PATCH v1 1/3] LoongArch: dts: Add PWM support to Loongson-2K0500
Date: Thu,  8 May 2025 15:02:34 +0800
Message-ID: <29ec8dd0a1c6ba24caada8e48867180e41553d0f.1746684614.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMBxLscWVxxo6nO8AA--.25269S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj97XoW5Ww4xGF45Kr1xAw4xKr4rp5X_ArW7uoZIya
	n5tr1rGa47Ca1vqry3Gw1j9rs8WF4akrWayF1fJr45Jw4xJas7Ca13uFy7urW8tryDZ342
	9an8A3y3ArWkl-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3
	svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIY
	CTnIWjp_UUUYU7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcI
	k0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK
	021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl
	6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrV
	ACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8
	JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2Z2-UUUUU

The module is supported, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k0500.dtsi | 160 +++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index 3b38ff8853a7..760c60eebb89 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
@@ -169,6 +169,166 @@ eiointc: interrupt-controller@1fe11600 {
 			interrupts = <3>;
 		};
 
+		pwm@1ff5c000 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c000 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c010 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c010 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c020 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c020 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c030 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c030 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c040 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c040 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c050 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c050 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c060 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c060 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c070 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c070 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c080 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c080 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c090 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c090 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c0a0 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c0a0 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c0b0 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c0b0 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c0c0 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c0c0 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c0d0 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c0d0 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c0e0 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c0e0 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c0f0 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c0f0 0x0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		gmac0: ethernet@1f020000 {
 			compatible = "snps,dwmac-3.70a";
 			reg = <0x0 0x1f020000 0x0 0x10000>;
-- 
2.47.1

