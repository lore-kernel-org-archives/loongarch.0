Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E58C13B
	for <loongarch@lists.linux.dev>; Mon,  1 Apr 2024 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711959870; cv=none; b=STWeccPcYLLjB11Ub/unAHj0WMvvwI3MNXYgreJ901CMz+qEQq6aizlVAuP46qpbmjRUMio+2KouEYT42FXNgz3o2LnQPrmwLwrrA1saPaMvH2ZlOU9efo+yZ/JLE4RsVirWydK8Q9EVp3sRfKwz72d+/bFGCd6XVmQIVa/y2Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711959870; c=relaxed/simple;
	bh=GYww9kfeJ+eyr66yRrqRxz1t/y/ClPyRquMn7a5xRJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvVlxfZy/syYHQ092B/x1wQuNLv/QoH2VxqhLnCb/bayLRe0R0Pl0ejess2YMJGSdT+n4p6m0Oq4IS6N70TTz08J9zfkOj9nmbZsbzdFnHu5DLgetHj/4KpFuJZp/Qtp+X15mdXE5hxMPvl4hihQAgjDn7qnAKfgWQy/nYT9dhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8Dx6ug6bwpm_+ghAA--.58039S3;
	Mon, 01 Apr 2024 16:24:26 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxGBI0bwpmFydwAA--.10364S5;
	Mon, 01 Apr 2024 16:24:26 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 7/8] LoongArch: dts: Add clock support to Loongson-2K0500
Date: Mon,  1 Apr 2024 16:24:19 +0800
Message-ID: <f238faa4600dc2b6d6b4904a65904fe41190abda.1711504700.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711504700.git.zhoubinbin@loongson.cn>
References: <cover.1711504700.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxGBI0bwpmFydwAA--.10364S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw47Kry3Kry3GFy8Cw1UCFX_yoW5Cw1kpa
	sF9rZrGrW09F1S9rZ8tFy8KFn5uF95CF97X3ZrCFWUGrsaqFyjvr48JFyfXF4rGr4fX34j
	qF1Fv34jkF4DZabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=

The module is supported, enable it.
Also, add the dma node associated with it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k0500-ref.dts          |  4 ++
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 57 ++++++++++++++++++-
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
index 8aefb0c12672..62dad6297e82 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
@@ -41,6 +41,10 @@ linux,cma {
 	};
 };
 
+&clk {
+	status = "okay";
+};
+
 &gmac0 {
 	status = "okay";
 
diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index 444779c21034..413b83366367 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/loongson,ls2k-clk.h>
 
 / {
 	#address-cells = <2>;
@@ -19,14 +20,15 @@ cpu0: cpu@0 {
 			compatible = "loongson,la264";
 			device_type = "cpu";
 			reg = <0x0>;
-			clocks = <&cpu_clk>;
+			clocks = <&clk LOONGSON2_NODE_CLK>;
 		};
 	};
 
-	cpu_clk: cpu-clk {
+	ref_100m: clock-ref-100m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <500000000>;
+		clock-frequency = <100000000>;
+		clock-output-names = "ref_100m";
 	};
 
 	cpuintc: interrupt-controller {
@@ -52,6 +54,55 @@ isa@16400000 {
 			ranges = <1 0x0 0x0 0x16400000 0x4000>;
 		};
 
+		clk: clock-controller@1fe10400 {
+			compatible = "loongson,ls2k0500-clk";
+			reg = <0x0 0x1fe10400 0x0 0x2c>;
+			#clock-cells = <1>;
+			clocks = <&ref_100m>;
+			clock-names = "ref_100m";
+			status = "disabled";
+		};
+
+		dma-controller@1fe10c00 {
+			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
+			reg = <0 0x1fe10c00 0 0x8>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <67>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#dma-cells = <1>;
+			status = "disabled";
+		};
+
+		dma-controller@1fe10c10 {
+			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
+			reg = <0 0x1fe10c10 0 0x8>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <68>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#dma-cells = <1>;
+			status = "disabled";
+		};
+
+		dma-controller@1fe10c20 {
+			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
+			reg = <0 0x1fe10c20 0 0x8>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <69>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#dma-cells = <1>;
+			status = "disabled";
+		};
+
+		dma-controller@1fe10c30 {
+			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
+			reg = <0 0x1fe10c30 0 0x8>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <70>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#dma-cells = <1>;
+			status = "disabled";
+		};
+
 		liointc0: interrupt-controller@1fe11400 {
 			compatible = "loongson,liointc-2.0";
 			reg = <0x0 0x1fe11400 0x0 0x40>,
-- 
2.43.0

