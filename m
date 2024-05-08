Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07704596B
	for <loongarch@lists.linux.dev>; Wed,  8 May 2024 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715156974; cv=none; b=j+wDMCUZ2I4XZGDU/WarJ9/S+TrWXXUFEX7bPS6oB2uBw7X0m1j7raSR+CN1Htf7rPxRotCgLGKbbuqX4zpvzXZJmhmJv3UicT8EmsL5mjd8f6+beZn5P7kISv9xbL+0ZuFAR53CkL3opAUfph/jd0hjnMg19jnkAsatmprZaRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715156974; c=relaxed/simple;
	bh=mm+c/N642LvutLNJcJDi4vQqK0YCFW3AbDALd0DP900=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTi6dTPbLsUaPIxSIIOy636bPv4PlOlS+of5MN73iHiSV8cg3igVh+F8SW1+3gO82CzdBWIKwyV/kgPyby9pqXDmWXxHAOsvJIIpeeLSXddUwMN/j/OUzJiItcIqDMCn1bSb3IbZllnfBTSRqye7JuCYTtGXez2HQmdq1ApGXPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8BxeOnqNztmv0kJAA--.12607S3;
	Wed, 08 May 2024 16:29:30 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxrlfmNztmvWUVAA--.36694S4;
	Wed, 08 May 2024 16:29:30 +0800 (CST)
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
Subject: [PATCH v1 2/2] LoongArch: dts: Add new supported device nodes to Loongson-2K2000
Date: Wed,  8 May 2024 16:29:11 +0800
Message-ID: <d2a7f3d5a0ec68de43d760fbd6e0e4e4bbafbc10.1715156107.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:AQAAf8CxrlfmNztmvWUVAA--.36694S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw47Ww1UXr18JF4xCF4rJFc_yoW5Cw4kpa
	srua17Kr409F1xu345tryUJF1kZFZ5CFnrWanIkFWUCrsIq34qqr48tF93tF18Wr4fX3yj
	qrn5G34jkF4DZabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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

By now, more Loongson-2K2000 related drivers are supported, such as
clock controller and thermal controller.
Now we add these device nodes to the Loongson-2K2000 dts file.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../boot/dts/loongson-2k2000-ref.dts          |  4 ++
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 44 +++++++++++++++++--
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k2000-ref.dts b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
index 74b99bd234cc..52daf41d7af4 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
@@ -39,6 +39,10 @@ linux,cma {
 	};
 };
 
+&clk {
+	status = "okay";
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index 9eab2d02cbe8..4e717f5bad45 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/loongson,ls2k-clk.h>
 
 / {
 	#address-cells = <2>;
@@ -19,21 +20,22 @@ cpu0: cpu@1 {
 			compatible = "loongson,la364";
 			device_type = "cpu";
 			reg = <0x0>;
-			clocks = <&cpu_clk>;
+			clocks = <&clk LOONGSON2_NODE_CLK>;
 		};
 
 		cpu1: cpu@2 {
 			compatible = "loongson,la364";
 			device_type = "cpu";
 			reg = <0x1>;
-			clocks = <&cpu_clk>;
+			clocks = <&clk LOONGSON2_NODE_CLK>;
 		};
 	};
 
-	cpu_clk: cpu-clk {
+	ref_100m: clock-ref-100m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <1400000000>;
+		clock-frequency = <100000000>;
+		clock-output-names = "ref_100m";
 	};
 
 	cpuintc: interrupt-controller {
@@ -42,6 +44,22 @@ cpuintc: interrupt-controller {
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
@@ -58,6 +76,15 @@ isa@18400000 {
 			ranges = <1 0x0 0x0 0x18400000 0x4000>;
 		};
 
+		clk: clock-controller@10010480 {
+			compatible = "loongson,ls2k2000-clk";
+			reg = <0x0 0x10010480 0x0 0x100>;
+			#clock-cells = <1>;
+			clocks = <&ref_100m>;
+			clock-names = "ref_100m";
+			status = "disabled";
+		};
+
 		pmc: power-management@100d0000 {
 			compatible = "loongson,ls2k2000-pmc", "loongson,ls2k0500-pmc", "syscon";
 			reg = <0x0 0x100d0000 0x0 0x58>;
@@ -80,6 +107,15 @@ syscon-poweroff {
 			};
 		};
 
+		tsensor: thermal-sensor@1fe01460 {
+			compatible = "loongson,ls2k2000-thermal";
+			reg = <0x0 0x1fe01460 0x0 0x30>,
+			      <0x0 0x1fe0019c 0x0 0x4>;
+			interrupt-parent = <&liointc>;
+			interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		liointc: interrupt-controller@1fe01400 {
 			compatible = "loongson,liointc-1.0";
 			reg = <0x0 0x1fe01400 0x0 0x64>;
-- 
2.43.0

