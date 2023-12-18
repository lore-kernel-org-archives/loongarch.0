Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11721FD9
	for <loongarch@lists.linux.dev>; Mon, 18 Dec 2023 01:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.176])
	by gateway (Coremail) with SMTP id _____8CxhfAKpn9lXOYBAA--.9990S3;
	Mon, 18 Dec 2023 09:53:14 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.176])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx3+EEpn9l0l8JAA--.45072S4;
	Mon, 18 Dec 2023 09:53:12 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v5 6/7] LoongArch: dts: DeviceTree for Loongson-2K2000
Date: Mon, 18 Dec 2023 09:53:00 +0800
Message-Id: <f62d0b6df04144404b0d657bce39a8f25b931c3a.1702862779.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1702862778.git.zhoubinbin@loongson.cn>
References: <cover.1702862778.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx3+EEpn9l0l8JAA--.45072S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3JrWfKFyDJFyUZF45KFWUJrc_yoWDGF4fpF
	y7Ca1DWF40qF1jk3y5AFWUtF1DJ3sYkF95Ww1kAFW8GrWktr1qv3yxKFyfGFyfGrWDX34j
	qrnYv34UKFnrJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY
	6Fy7McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=

Add DeviceTree file for Loongson-2K2000 processor, which integrates two
64-bit triple emission superscalar LA364 processor cores.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/Makefile              |   3 +-
 .../boot/dts/loongson-2k2000-ref.dts          |  73 ++++
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 311 ++++++++++++++++++
 3 files changed, 386 insertions(+), 1 deletion(-)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k2000-ref.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k2000.dtsi

diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index dc0782315bed..c019d6676f7e 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 dtb-$(CONFIG_MACH_LOONGSON64)	= loongson-2k0500-ref.dtb \
-				  loongson-2k1000-ref.dtb
+				  loongson-2k1000-ref.dtb \
+				  loongson-2k2000-ref.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
diff --git a/arch/loongarch/boot/dts/loongson-2k2000-ref.dts b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
new file mode 100644
index 000000000000..ac6b370800fa
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson-2k2000-ref.dts
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+/dts-v1/;
+
+#include "loongson-2k2000.dtsi"
+
+/ {
+	compatible = "loongson,ls2k2000-ref", "loongson,ls2k2000";
+	model = "Loongson-2K2000 Reference Board";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		bootargs = "console=ttyS0,115200";
+	};
+
+	memory@200000 {
+		device_type = "memory";
+		reg = <0x0 0x00200000 0x0 0x0ee00000>,
+		      <0x0 0x90000000 0x0 0x70000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x2000000>;
+			linux,cma-default;
+		};
+	};
+};
+
+&sata {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&rtc0 {
+	status = "okay";
+};
+
+&xhci0 {
+	status = "okay";
+};
+
+&xhci1 {
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
new file mode 100644
index 000000000000..fdc14e4ec9f0
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu0: cpu@1 {
+			compatible = "loongson,la364";
+			device_type = "cpu";
+			reg = <0x0>;
+			clocks = <&cpu_clk>;
+		};
+
+		cpu1: cpu@2 {
+			compatible = "loongson,la364";
+			device_type = "cpu";
+			reg = <0x1>;
+			clocks = <&cpu_clk>;
+		};
+	};
+
+	cpu_clk: cpu-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1400000000>;
+	};
+
+	cpuintc: interrupt-controller {
+		compatible = "loongson,cpu-interrupt-controller";
+		#interrupt-cells = <1>;
+		interrupt-controller;
+	};
+
+	bus@10000000 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x10000000 0x0 0x10000000 0x0 0x10000000>,
+			 <0x0 0x02000000 0x0 0x02000000 0x0 0x02000000>,
+			 <0x0 0x40000000 0x0 0x40000000 0x0 0x40000000>,
+			 <0xfe 0x0 0xfe 0x0 0x0 0x40000000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		pmc: power-management@100d0000 {
+			compatible = "loongson,ls2k2000-pmc", "loongson,ls2k0500-pmc", "syscon";
+			reg = <0x0 0x100d0000 0x0 0x58>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <47>;
+			loongson,suspend-address = <0x0 0x1c000500>;
+
+			syscon-reboot {
+				compatible = "syscon-reboot";
+				offset = <0x30>;
+				mask = <0x1>;
+			};
+
+			syscon-poweroff {
+				compatible = "syscon-poweroff";
+				regmap = <&pmc>;
+				offset = <0x14>;
+				mask = <0x3c00>;
+				value = <0x3c00>;
+			};
+		};
+
+		liointc: interrupt-controller@1fe01400 {
+			compatible = "loongson,liointc-1.0";
+			reg = <0x0 0x1fe01400 0x0 0x64>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+			interrupt-names = "int0";
+			loongson,parent_int_map = <0xffffffff>, /* int0 */
+						  <0x00000000>, /* int1 */
+						  <0x00000000>, /* int2 */
+						  <0x00000000>; /* int3 */
+		};
+
+		eiointc: interrupt-controller@1fe01600 {
+			compatible = "loongson,ls2k2000-eiointc";
+			reg = <0x0 0x1fe01600 0x0 0xea00>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&cpuintc>;
+			interrupts = <3>;
+		};
+
+		pic: interrupt-controller@10000000 {
+			compatible = "loongson,pch-pic-1.0";
+			reg = <0x0 0x10000000 0x0 0x400>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			loongson,pic-base-vec = <0>;
+			interrupt-parent = <&eiointc>;
+		};
+
+		msi: msi-controller@1fe01140 {
+			compatible = "loongson,pch-msi-1.0";
+			reg = <0x0 0x1fe01140 0x0 0x8>;
+			msi-controller;
+			loongson,msi-base-vec = <64>;
+			loongson,msi-num-vecs = <192>;
+			interrupt-parent = <&eiointc>;
+		};
+
+		rtc0: rtc@100d0100 {
+			compatible = "loongson,ls2k2000-rtc", "loongson,ls7a-rtc";
+			reg = <0x0 0x100d0100 0x0 0x100>;
+			interrupt-parent = <&pic>;
+			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart0: serial@1fe001e0 {
+			compatible = "ns16550a";
+			reg = <0x0 0x1fe001e0 0x0 0x10>;
+			clock-frequency = <100000000>;
+			interrupt-parent = <&liointc>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		pcie@1a000000 {
+			compatible = "loongson,ls2k-pci";
+			reg = <0x0 0x1a000000 0x0 0x02000000>,
+			      <0xfe 0x0 0x0 0x20000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			bus-range = <0x0 0xff>;
+			ranges = <0x01000000 0x0 0x00008000 0x0 0x18400000 0x0 0x00008000>,
+				 <0x02000000 0x0 0x60000000 0x0 0x60000000 0x0 0x20000000>;
+
+			gmac0: ethernet@3,0 {
+				reg = <0x1800 0x0 0x0 0x0 0x0>;
+				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			gmac1: ethernet@3,1 {
+				reg = <0x1900 0x0 0x0 0x0 0x0>;
+				interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			gmac2: ethernet@3,2 {
+				reg = <0x1a00 0x0 0x0 0x0 0x0>;
+				interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			xhci0: usb@4,0 {
+				reg = <0x2000 0x0 0x0 0x0 0x0>;
+				interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			xhci1: usb@19,0 {
+				reg = <0xc800 0x0 0x0 0x0 0x0>;
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			display@6,1 {
+				reg = <0x3100 0x0 0x0 0x0 0x0>;
+				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			hda@7,0 {
+				reg = <0x3800 0x0 0x0 0x0 0x0>;
+				interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			sata: sata@8,0 {
+				reg = <0x4000 0x0 0x0 0x0 0x0>;
+				interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			pcie@9,0 {
+				reg = <0x4800 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x0 0x0 0x0 0x0>;
+				interrupt-map = <0x0 0x0 0x0 0x0 &pic 32 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
+			};
+
+			pcie@a,0 {
+				reg = <0x5000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x0 0x0 0x0 0x0>;
+				interrupt-map = <0x0 0x0 0x0 0x0 &pic 33 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
+			};
+
+			pcie@b,0 {
+				reg = <0x5800 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x0 0x0 0x0 0x0>;
+				interrupt-map = <0x0 0x0 0x0 0x0 &pic 34 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
+			};
+
+			pcie@c,0 {
+				reg = <0x6000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x0 0x0 0x0 0x0>;
+				interrupt-map = <0x0 0x0 0x0 0x0 &pic 35 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
+			};
+
+			pcie@d,0 {
+				reg = <0x6800 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x0 0x0 0x0 0x0>;
+				interrupt-map = <0x0 0x0 0x0 0x0 &pic 36 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
+			};
+
+			pcie@e,0 {
+				reg = <0x7000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x0 0x0 0x0 0x0>;
+				interrupt-map = <0x0 0x0 0x0 0x0 &pic 37 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
+			};
+
+			pcie@f,0 {
+				reg = <0x7800 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x0 0x0 0x0 0x0>;
+				interrupt-map = <0x0 0x0 0x0 0x0 &pic 40 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
+			};
+
+			pcie@10,0 {
+				reg = <0x8000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x0 0x0 0x0 0x0>;
+				interrupt-map = <0x0 0x0 0x0 0x0 &pic 30 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
+			};
+		};
+	};
+};
-- 
2.39.3

