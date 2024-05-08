Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D362B45C14
	for <loongarch@lists.linux.dev>; Wed,  8 May 2024 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715156974; cv=none; b=aguqOliFtPARG3P/NFVpD1W4RfDoqmnOuIxcNXr10Uc3H7bOTpi8bPa/nauIS1rrunANkEnvZJFWL7flwlpIYG4GPcCE5Q4JGaoHITGoN5kJ30XIDw3fopL1aDASh/seOf7I0TO3UKDzlF0ghVD1gyU+wBpYW+cAfUGRlgU09oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715156974; c=relaxed/simple;
	bh=plhsD/4kcTD28SZL1ovKLLfnXvY8Jj8qaFpPPzJDySo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aiGGZIU9hBd7ehiajRjQQyOUAtW+1ESS/O8G915iryJBggC7WKn8+GjzyJt9O/hUQ8zhZ4jH1LSjS6AXg3lAGgYKdv7SrGS4pM5blpnV5oYHLxrtwfc/SCji08MGdNumH33tWUL3NCxHVq/O0MJ5vI2TNwR4J7gxx0gkrZKtc0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8AxaOnpNztmt0kJAA--.12583S3;
	Wed, 08 May 2024 16:29:29 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxrlfmNztmvWUVAA--.36694S3;
	Wed, 08 May 2024 16:29:29 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 1/2] LoongArch: dts: Add new supported device nodes to Loongson-2K0500
Date: Wed,  8 May 2024 16:29:10 +0800
Message-ID: <d0b25dedb43c000faad5b86cd0512dc6498e7839.1715156107.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1715156107.git.zhoubinbin@loongson.cn>
References: <cover.1715156107.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxrlfmNztmvWUVAA--.36694S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr43Cw47Cr1fZF45ZrWkuFX_yoWrWw13pa
	sFk39rGrW0vF1a9w45tFy8tF1kuF95CF97XwsrCFWUGrsaqFyjvr48tFyfXFWrWr4fX342
	vFnYv34jkFnrZwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0dgAUUUUU=

By now, more Loongson-2K0500 related drivers are supported, such as
clock controller, thermal controller, and dma controller.
Now we add these device nodes to the Loongson-2K0500 dts file.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k0500-ref.dts          |  4 +
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 81 ++++++++++++++++++-
 2 files changed, 82 insertions(+), 3 deletions(-)

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
index 444779c21034..14345093631a 100644
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
@@ -35,6 +37,22 @@ cpuintc: interrupt-controller {
 		interrupt-controller;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&tsensor 0>;
+
+			trips {
+				cpu-crit {
+					temperature = <85000>;
+					hysteresis = <5000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	bus@10000000 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x10000000 0x0 0x10000000 0x0 0x10000000>,
@@ -52,6 +70,55 @@ isa@16400000 {
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
@@ -139,6 +206,14 @@ ohci0: usb@1f058000 {
 			status = "disabled";
 		};
 
+		tsensor: thermal-sensor@1fe11500 {
+			compatible = "loongson,ls2k0500-thermal", "loongson,ls2k1000-thermal";
+			reg = <0x0 0x1fe11500 0x0 0x30>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		uart0: serial@1ff40800 {
 			compatible = "ns16550a";
 			reg = <0x0 0x1ff40800 0x0 0x10>;
-- 
2.43.0

