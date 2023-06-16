Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083637C
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 06:11:06 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.112.76])
	by gateway (Coremail) with SMTP id _____8CxvOr4_ItkEdwFAA--.12475S3;
	Fri, 16 Jun 2023 14:11:04 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.76])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxReTv_ItkFPEcAA--.17020S6;
	Fri, 16 Jun 2023 14:11:03 +0800 (CST)
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
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 4/6] LoongArch: DeviceTree for Loongson-2K0500
Date: Fri, 16 Jun 2023 14:10:41 +0800
Message-Id: <c7087046a725e7a2cfde788185112c150e216f1b.1686882123.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1686882123.git.zhoubinbin@loongson.cn>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxReTv_ItkFPEcAA--.17020S6
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtw18Jw1kuF18Zw1DKF1UCFX_yoW3CFy8pF
	y7C3yDWr40vF1Ykw4UJFyUtFnxGa95CFykWwn7AFW8Ar92qryqqr4xtFyrJF1rGrWDX342
	qFsYv34jkFnrJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jqRRiUUUUU=

Add DeviceTree file for Loongson-2K0500 processor, which integrates one
64-bit dual emission superscalar LA264 processor core.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/Makefile            |   2 +
 arch/loongarch/boot/dts/loongson_2k0500.dts | 311 ++++++++++++++++++++
 2 files changed, 313 insertions(+)
 create mode 100644 arch/loongarch/boot/dts/loongson_2k0500.dts

diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index 1e24cdb5180a..0e5ed373b1b4 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+dtb-$(CONFIG_MACH_LOONGSON64)	= loongson_2k0500.dtb
+
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
diff --git a/arch/loongarch/boot/dts/loongson_2k0500.dts b/arch/loongarch/boot/dts/loongson_2k0500.dts
new file mode 100644
index 000000000000..4f58f7b06445
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson_2k0500.dts
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "LS2K0500 Reference Board";
+	compatible = "loongson,ls2k0500";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		serial0 = &cpu_uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		bootargs = "earlycon";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		model = "Loongson-2K0500";
+
+		cpu0: cpu@0 {
+			compatible = "loongson,la264";
+			device_type = "cpu";
+			reg = <0x0>;
+			clock-frequency = <500000000>;	/* 500MHz */
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+			};
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x00200000 0x00000000 0x0ee00000>, /* 238 MB at 2 MB */
+		      <0x00000000 0x90000000 0x00000000 0x60000000>;
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
+			size = <0x00000000 0x02000000>;
+			linux,cma-default;
+		};
+	};
+
+	ref_100m: clock-ref-100m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "ref_100m";
+	};
+
+	cpuintc: interrupt-controller {
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "loongson,cpu-interrupt-controller";
+	};
+
+	liointc0: interrupt-controller@1fe11400 {
+		compatible = "loongson,liointc-2.0";
+		reg = <0 0x1fe11400 0 0x40>,
+		      <0 0x1fe11040 0 0x8>;
+		reg-names = "main", "isr0";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+		interrupt-names = "int0";
+		loongson,parent_int_map = <0xffffffff>, /* int0 */
+					  <0x00000000>, /* int1 */
+					  <0x00000000>, /* int2 */
+					  <0x00000000>; /* int3 */
+	};
+
+	liointc1: interrupt-controller@1fe11440 {
+		compatible = "loongson,liointc-2.0";
+		reg = <0 0x1fe11440 0 0x40>,
+		      <0 0x1fe11048 0 0x8>;
+		reg-names = "main", "isr0";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <4>;
+		interrupt-names = "int2";
+
+		loongson,parent_int_map = <0x00000000>, /* int0 */
+					  <0x00000000>, /* int1 */
+					  <0xffffffff>, /* int2 */
+					  <0x00000000>; /* int3 */
+	};
+
+	eiointc: interrupt-controller@1fe11600 {
+		compatible = "loongson,ls2k0500-eiointc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <3>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0 0x10000000 0 0x10000000 0 0x10000000>,
+			 <0 0x2000000  0 0x2000000  0 0x2000000>,
+			 <0 0x20000000 0 0x20000000 0 0x10000000>,
+			 <0 0x40000000 0 0x40000000 0 0x40000000>,
+			 <0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
+
+		reboot {
+			compatible = "syscon-reboot";
+			regmap = <&pmc>;
+			offset = <0x30>;
+			mask = <0x1>;
+		};
+
+		poweroff {
+			compatible = "syscon-poweroff";
+			regmap = <&pmc>;
+			offset = <0x14>;
+			mask = <0x3c00>;
+			value = <0x3c00>;
+		};
+
+		gmac0: ethernet@1f020000 {
+			compatible = "snps,dwmac-3.70a";
+			reg = <0 0x1f020000 0 0x10000>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			mac-address = [ 64 48 48 48 48 60 ];/* [>mac 64:48:48:48:48:60 <]*/
+			phy-mode = "rgmii";
+			bus_id = <0x0>;
+		};
+
+		gmac1: ethernet@1f030000 {
+			compatible = "snps,dwmac-3.70a";
+			reg = <0 0x1f030000 0 0x10000>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			mac-address = [ 64 48 48 48 48 61 ];/* [>mac 64:48:48:48:48:61 <]*/
+			phy-mode = "rgmii";
+			bus_id = <0x1>;
+		};
+
+		sata@1f040000 {
+			compatible = "snps,spear-ahci";
+			reg = <0 0x1f040000 0 0x10000>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <75>;
+		};
+
+		ehci@1f050000 {
+			compatible = "generic-ehci";
+			reg = <0 0x1f050000 0 0x8000>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <71>;
+		};
+
+		ohci@1f058000 {
+			compatible = "generic-ohci";
+			reg = <0 0x1f058000 0 0x8000>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <72>;
+		};
+
+		clk: clock-controller@1fe10400 {
+			compatible = "loongson,ls2k-clk";
+			reg = <0 0x1fe00400 0 0x30>;
+			#clock-cells = <1>;
+			clocks = <&ref_100m>;
+			clock-names = "ref_100m";
+			status = "disabled";
+		};
+
+		cpu_uart0: serial@1ff40800 {
+			compatible = "ns16550a";
+			reg = <0 0x1ff40800 0 0x10>;
+			clock-frequency = <100000000>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <2>;
+			no-loopback-test;
+		};
+
+		i2c@1ff48000 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0 0x1ff48000 0 0x0800>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <14>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			eeprom@57 {
+				compatible = "atmel,24c16";
+				reg = <0x57>;
+				pagesize = <16>;
+			};
+		};
+
+		i2c@1ff48800 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0 0x1ff48800 0 0x0800>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <15>;
+			status = "disabled";
+		};
+
+		i2c@1ff49000 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0 0x1ff49000 0 0x0800>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <16>;
+			status = "disabled";
+		};
+
+		i2c@1ff49800 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0 0x1ff49800 0 0x0800>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <17>;
+			status = "disabled";
+		};
+
+		pixi2c@1ff4a000 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0 0x1ff4a000 0 0x0800>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <18>;
+			status = "disabled";
+		};
+
+		pixi2c@1ff4a800 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0 0x1ff4a800 0 0x0800>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <19>;
+			status = "disabled";
+		};
+
+		pmc: acpi@1ff6c000 {
+			compatible = "syscon";
+			reg = <0x0 0x1ff6c000 0x0 0x58>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <56>;
+			suspend-address = <0x1c000500>;
+		};
+
+		pcie@16800000 {
+			compatible = "loongson,ls2k-pci";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			reg = <0 0x1a000000 0 0x02000000>,
+			      <0xfe 0x00000000 0 0x20000000>;
+
+			ranges = <0x02000000 0 0x40000000 0 0x40000000 0 0x40000000>,
+				 <0x01000000 0 0x00004000 0 0x16404000 0x0 0x4000>;
+
+			pci_bridge@0,0 {
+				compatible = "pci0014,1a05.1",
+					     "pci0014,1a05",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x0000 0x0 0x0 0x0 0x0>;
+				interrupts = <81>;
+				interrupt-parent = <&eiointc>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &eiointc 81>;
+			};
+
+			pci_bridge@1,0 {
+				compatible = "pci0014,1a05.1",
+					     "pci0014,1a05",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x0800 0x0 0x0 0x0 0x0>;
+				interrupts = <82>;
+				interrupt-parent = <&eiointc>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &eiointc 82>;
+			};
+		};
+	};
+};
-- 
2.39.3

