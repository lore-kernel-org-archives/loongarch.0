Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F2912C497
	for <loongarch@lists.linux.dev>; Thu,  9 May 2024 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715235514; cv=none; b=ZnxZS45rz4ED05rf5kL4TCkyfEF4ayE29Km6tM2WYURTFMwExrywrWAaTrAAzJPfG3tVysZBS5ELal3BuIYMASv8xw+CH2kcmA1oJrDsxD8JWxL1Y356OEeLBiG/msIraFqyeS11tjBPphBs/iuRJeU1yO8y5Xv2DMg91CvMw+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715235514; c=relaxed/simple;
	bh=rIrCo6rqpJH2eSg+mIfiRkw7t38+cNqZPzTAqmQzm70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0sw/5P1C7ZJC2xZO/p2hIkVoyzVmGPQcc10dNUH7wiUTm15NPzGnTXNSJJc9V4rt00qRfCEm1fxJXWAxk/HKfJ+/jnUe1SmDVNd29hoI4oNjq3jkQZlt5c5LyjiuMb3tqrr6LdSjTFELi/jGyv5FMCgVXzZZkZO0CYFhOcsjAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8Ax6umwajxmr9UJAA--.13768S3;
	Thu, 09 May 2024 14:18:24 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxT1WqajxmycoWAA--.26766S4;
	Thu, 09 May 2024 14:18:23 +0800 (CST)
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
Subject: [PATCH v2 2/3] LoongArch: dts: Add new supported device nodes to Loongson-2K0500
Date: Thu,  9 May 2024 14:18:05 +0800
Message-ID: <44c3bcd02598894f838e7c6dd205a139fd388ff8.1715222938.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1715222938.git.zhoubinbin@loongson.cn>
References: <cover.1715222938.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxT1WqajxmycoWAA--.26766S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr43Cw47Cr1fZrWDtF47GFX_yoWrJFWxpa
	sFk39rGrW0vF1a93y5tFy8tF4kuF95CF97WwsrCFWUGrsaqFyjvr48KFyrXFyrCr4fZ342
	vFnYv34jkFnrXwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

By now, more Loongson-2K0500 related drivers are supported, such as
clock controller, thermal controller, and dma controller.
Now we add these device nodes to the Loongson-2K0500 dts file.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k0500.dtsi | 85 +++++++++++++++++++-
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index 08531812ed5f..b78240ae9084 100644
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
@@ -35,6 +37,28 @@ cpuintc: interrupt-controller {
 		interrupt-controller;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&tsensor 0>;
+
+			trips {
+				cpu-alert {
+					temperature = <33000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
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
@@ -52,6 +75,54 @@ isa@16400000 {
 			ranges = <1 0x0 0x0 0x16400000 0x4000>;
 		};
 
+		clk: clock-controller@1fe10400 {
+			compatible = "loongson,ls2k0500-clk";
+			reg = <0x0 0x1fe10400 0x0 0x2c>;
+			#clock-cells = <1>;
+			clocks = <&ref_100m>;
+			clock-names = "ref_100m";
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
@@ -299,6 +370,14 @@ ohci0: usb@1f058000 {
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

