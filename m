Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298AC7C
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 06:11:48 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.112.76])
	by gateway (Coremail) with SMTP id _____8AxEekj_YtkXNwFAA--.10489S3;
	Fri, 16 Jun 2023 14:11:47 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.76])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxPMoh_YtkkfEcAA--.7503S2;
	Fri, 16 Jun 2023 14:11:46 +0800 (CST)
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
Subject: [PATCH 5/6] LoongArch: DeviceTree for Loongson-2K1000
Date: Fri, 16 Jun 2023 14:11:31 +0800
Message-Id: <99bdbfc66604b4700e3e22e28c3d27ef7c9c9af7.1686882123.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:AQAAf8AxPMoh_YtkkfEcAA--.7503S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfXr1xZFykJrWfZF1rZFy3KFX_yoW8GrWrWo
	W7AFs5trW8K345Zw4kXw13K3W7Crs7KF42grWqvFn3Gw1rtw42ya4kZw4Ygw1j9rWrtryD
	Z34S9a45GwsFvr4kl-sFpf9Il3svdjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYt7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6rWY6Fy7McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=

Add DeviceTree file for Loongson-2K1000 processor, which integrates two
64-bit dual emission superscalar LA264 processor cores.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/Makefile            |   3 +-
 arch/loongarch/boot/dts/loongson_2k1000.dts | 565 ++++++++++++++++++++
 2 files changed, 567 insertions(+), 1 deletion(-)
 create mode 100644 arch/loongarch/boot/dts/loongson_2k1000.dts

diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index 0e5ed373b1b4..c0464bb8e430 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-dtb-$(CONFIG_MACH_LOONGSON64)	= loongson_2k0500.dtb
+dtb-$(CONFIG_MACH_LOONGSON64)	= loongson_2k0500.dtb \
+				  loongson_2k1000.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
diff --git a/arch/loongarch/boot/dts/loongson_2k1000.dts b/arch/loongarch/boot/dts/loongson_2k1000.dts
new file mode 100644
index 000000000000..9fd9d400d97f
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson_2k1000.dts
@@ -0,0 +1,565 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/loongson,ls2k-clk.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "LS2K1000 Reference Board";
+	compatible = "loongson,ls2k1000";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
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
+		model = "Loongson-2K1000";
+
+		cpu0: cpu@0 {
+			compatible = "loongson,la264";
+			device_type = "cpu";
+			reg= <0x0>;
+			clock-frequency = <1000000000>;	/*1000 MHz*/
+		};
+
+		cpu1: cpu@1 {
+			compatible = "loongson,la264";
+			device_type = "cpu";
+			reg = <0x1>;
+			clock-frequency = <1000000000>;	/*1000 MHz*/
+		};
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
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x00200000 0x00000000 0x06e00000>,
+		      <0x00000000 0x08000000 0x00000000 0x07000000>,
+		      <0x00000000 0x90000000 0x00000001 0xe0000000>;
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
+	memalloc@0 {
+		compatible = "loongson,ls-memalloc";
+		reg = <0 0x90000000 0 0x20000000>;
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
+		reg = <0 0x1fe01400 0 0x40>,
+		      <0 0x1fe01040 0 0x8>,
+		      <0 0x1fe01140 0 0x8>;
+		reg-names = "main", "isr0", "isr1";
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
+		reg = <0 0x1fe01440 0 0x40>,
+		      <0 0x1fe01048 0 0x8>,
+		      <0 0x1fe01148 0 0x8>;
+		reg-names = "main", "isr0", "isr1";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <3>;
+		interrupt-names = "int1";
+		loongson,parent_int_map = <0x00000000>, /* int0 */
+					  <0xffffffff>, /* int1 */
+					  <0x00000000>, /* int2 */
+					  <0x00000000>; /* int3 */
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0 0x10000000 0 0x10000000 0 0x10000000>,
+			 <0 0x2000000 0 0x2000000 0 0x2000000>,
+			 <0 0x20000000 0 0x20000000 0 0x10000000>,
+			 <0 0x40000000 0 0x40000000 0 0x40000000>,
+			 <0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
+
+		dma-coherent;
+
+		reboot {
+			compatible ="syscon-reboot";
+			regmap = <&pmc>;
+			offset = <0x30>;
+			mask = <0x1>;
+		};
+
+		poweroff {
+			compatible ="syscon-poweroff";
+			regmap = <&pmc>;
+			offset = <0x14>;
+			mask = <0x3c00>;
+			value = <0x3c00>;
+		};
+
+		chipid@1fe00000 {
+			compatible = "loongson,ls2k-chipid";
+			reg = <0 0x1fe00000 0 0x3ffc>;
+			little-endian;
+		};
+
+		pctrl: pinctrl@1fe00420 {
+			compatible = "loongson,ls2k-pinctrl";
+			reg = <0 0x1fe00420 0 0x18>;
+
+			sdio_pins_default: sdio-pins {
+				sdio-pinmux {
+					groups = "sdio";
+					function = "sdio";
+				};
+				sdio-det-pinmux {
+					groups = "pwm2";
+					function = "gpio";
+				};
+			};
+
+			pwm1_pins_default: pwm1-pins {
+				pinmux {
+					groups = "pwm1";
+					function = "pwm1";
+				};
+			};
+
+			pwm0_pins_default: pwm0-pins {
+				pinmux {
+					groups = "pwm0";
+					function = "pwm0";
+				};
+			};
+
+			i2c1_pins_default: i2c1-pins {
+				pinmux {
+					groups = "i2c1";
+					function = "i2c1";
+				};
+			};
+
+			i2c0_pins_default: i2c0-pins {
+				pinmux {
+					groups = "i2c0";
+					function = "i2c0";
+				};
+			};
+
+			nand_pins_default: nand-pins {
+				pinmux {
+					groups = "nand";
+					function = "nand";
+				};
+			};
+
+			hda_pins_default: hda-pins {
+				grp0-pinmux {
+					groups = "hda";
+					function = "hda";
+				};
+				grp1-pinmux {
+					groups = "i2s";
+					function = "gpio";
+				};
+			};
+		};
+
+		clk: clock-controller@1fe00480 {
+			compatible = "loongson,ls2k-clk";
+			reg = <0 0x1fe00480 0 0x58>;
+			#clock-cells = <1>;
+			clocks = <&ref_100m>;
+			clock-names = "ref_100m";
+		};
+
+		gpio0: gpio@1fe00500 {
+			compatible = "loongson,ls2k-gpio", "syscon";
+			reg = <0 0x1fe00500 0 0x38>;
+			ngpios = <64>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			interrupt-parent = <&liointc1>;
+			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>,
+				     <29 IRQ_TYPE_LEVEL_HIGH>,
+				     <30 IRQ_TYPE_LEVEL_HIGH>,
+				     <30 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <>,
+				     <>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cpu_uart0: serial@1fe20000 {
+			compatible = "ns16550a";
+			reg = <0 0x1fe20000 0 0x10>;
+			clock-frequency = <125000000>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+		};
+
+		i2c2: i2c@1fe21000 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0 0x1fe21000 0 0x8>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			eeprom@57{
+				compatible = "atmel,24c16";
+				reg = <0x57>;
+				pagesize = <16>;
+			};
+		};
+
+		i2c3: i2c@1fe21800 {
+			compatible = "loongson,ls2k-i2c";
+			reg = <0 0x1fe21800 0 0x8>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			codec@1a {
+				compatible = "codec_uda1342";
+				reg = <0x1a>;
+			};
+		};
+
+		pmc: acpi@1fe27000 {
+			compatible = "syscon";
+			reg = <0x0 0x1fe27000 0x0 0x58>;
+			interrupt-parent = <&liointc1>;
+			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+			suspend-address = <0x1c000500>;
+		};
+
+		pcie@60000000 {
+			compatible = "loongson,ls2k-pci";
+			device_type = "pci";
+			#size-cells = <2>;
+			#address-cells = <3>;
+
+			reg = <0 0x1a000000 0 0x02000000>,
+			      <0xfe 0x00000000 0 0x20000000>;
+			ranges = <0x01000000 0x0 0x00008000 0x0 0x18008000 0x0 0x00008000>,
+				 <0x02000000 0x0 0x60000000 0x0 0x60000000 0x0 0x20000000>; /* mem */
+
+			ethernet@3,0 {
+				compatible = "pci0014,7a03.0",
+					     "pci0014,7a03",
+					     "pciclass,020000",
+					     "pciclass,0200",
+					     "loongson, pci-gmac";
+
+				reg = <0x1800 0x0 0x0 0x0 0x0>;
+				interrupt-parent = <&liointc0>;
+				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
+					     <13 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "macirq", "eth_lpi";
+
+				phy-mode = "rgmii";
+				phy-handle = <&phy0>;
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					compatible = "snps,dwmac-mdio";
+					phy0: ethernet-phy@0 {
+						reg = <0>;
+					};
+				};
+			};
+
+			ethernet@3,1 {
+				compatible = "pci0014,7a03.0",
+					     "pci0014,7a03",
+					     "pciclass,020000",
+					     "pciclass,0200",
+					     "loongson, pci-gmac";
+
+				reg = <0x1900 0x0 0x0 0x0 0x0>;
+				interrupt-parent = <&liointc0>;
+				interrupts = <14 IRQ_TYPE_LEVEL_HIGH>,
+					     <15 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "macirq", "eth_lpi";
+
+				phy-mode = "rgmii";
+				phy-handle = <&phy1>;
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					compatible = "snps,dwmac-mdio";
+					phy1: ethernet-phy@1 {
+						reg = <16>;
+					};
+				};
+			};
+
+			ehci@4,1 {
+				compatible = "pci0014,7a14.0",
+					     "pci0014,7a14",
+					     "pciclass,0c0320",
+					     "pciclass,0c03";
+
+				reg = <0x2100 0x0 0x0 0x0 0x0>;
+				interrupt-parent = <&liointc1>;
+				interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			ohci@4,2 {
+				compatible = "pci0014,7a24.0",
+					     "pci0014,7a24",
+					     "pciclass,0c0310",
+					     "pciclass,0c03";
+
+				reg = <0x2200 0x0 0x0 0x0 0x0>;
+				interrupt-parent = <&liointc1>;
+				interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			dc@6,0 {
+				compatible = "pci0014,7a06.0",
+					     "pci0014,7a06",
+					     "pciclass,030000",
+					     "pciclass,0300";
+
+				reg = <0x3000 0x0 0x0 0x0 0x0>;
+				interrupt-parent = <&liointc0>;
+				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			hda@7,0 {
+				compatible = "pci0014,7a07.0",
+					     "pci0014,7a07",
+					     "pciclass,040300",
+					     "pciclass,0403";
+
+				reg = <0x3800 0x0 0x0 0x0 0x0>;
+				interrupt-parent = <&liointc0>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			sata@8,0 {
+				compatible = "pci0014,7a08.0",
+					     "pci0014,7a08",
+					     "pciclass,010601",
+					     "pciclass,0106";
+
+				reg = <0x4000 0x0 0x0 0x0 0x0>;
+				interrupt-parent = <&liointc0>;
+				interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			pci_bridge@9,0 {
+				compatible = "pci0014,7a19.1",
+					     "pci0014,7a19",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x4800 0x0 0x0 0x0 0x0>;
+				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&liointc1>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 0 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@a,0 {
+				compatible = "pci0014,7a09.1",
+					     "pci0014,7a09",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x5000 0x0 0x0 0x0 0x0>;
+				interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&liointc1>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 1 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@b,0 {
+				compatible = "pci0014,7a09.1",
+					     "pci0014,7a09",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x5800 0x0 0x0 0x0 0x0>;
+				interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&liointc1>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 2 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@c,0 {
+				compatible = "pci0014,7a09.1",
+					     "pci0014,7a09",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x6000 0x0 0x0 0x0 0x0>;
+				interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&liointc1>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 3 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@d,0 {
+				compatible = "pci0014,7a19.1",
+					     "pci0014,7a19",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x6800 0x0 0x0 0x0 0x0>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&liointc1>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 4 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@e,0 {
+				compatible = "pci0014,7a09.1",
+					     "pci0014,7a09",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x7000 0x0 0x0 0x0 0x0>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&liointc1>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 5 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+		};
+	};
+};
-- 
2.39.3

