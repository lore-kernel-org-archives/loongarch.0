Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6620D3FEC
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 06:11:50 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.112.76])
	by gateway (Coremail) with SMTP id _____8BxKuok_YtkZNwFAA--.12517S3;
	Fri, 16 Jun 2023 14:11:48 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.76])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxPMoh_YtkkfEcAA--.7503S3;
	Fri, 16 Jun 2023 14:11:47 +0800 (CST)
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
Subject: [PATCH 6/6] LoongArch: DeviceTree for Loongson-2K2000
Date: Fri, 16 Jun 2023 14:11:32 +0800
Message-Id: <977009099c38177c384fca5a0ee77ebbe50e3ea2.1686882123.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:AQAAf8AxPMoh_YtkkfEcAA--.7503S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWfXr1xZFykAFyfJFyfCr4Utrc_yoWDCFW5pF
	y2k3yDCr40qF15Kw45AF1qyF17Ga95CF95Gwn7AFW8ArWkKryjvw47tFyrGFn3GrWDXw1F
	qF9Yv348KF17JwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=

Add DeviceTree file for Loongson-2K2000 processor, which integrates two
64-bit triple emission superscalar LA364 processor cores.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/Makefile            |   3 +-
 arch/loongarch/boot/dts/loongson_2k2000.dts | 417 ++++++++++++++++++++
 2 files changed, 419 insertions(+), 1 deletion(-)
 create mode 100644 arch/loongarch/boot/dts/loongson_2k2000.dts

diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index c0464bb8e430..71af680bd30d 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 dtb-$(CONFIG_MACH_LOONGSON64)	= loongson_2k0500.dtb \
-				  loongson_2k1000.dtb
+				  loongson_2k1000.dtb \
+				  loongson_2k2000.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
diff --git a/arch/loongarch/boot/dts/loongson_2k2000.dts b/arch/loongarch/boot/dts/loongson_2k2000.dts
new file mode 100644
index 000000000000..19ed16677e6c
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson_2k2000.dts
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "LS2K2000 Reference Board";
+	compatible = "loongson,ls2k2000";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
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
+		model = "Loongson-2K2000";
+
+		cpu0: cpu@1 {
+			compatible = "loongson,la364";
+			device_type = "cpu";
+			reg = <0x0>;
+			clock-frequency = <1200000000>;	/* 1500 MHz */
+		};
+
+		cpu1: cpu@2 {
+			compatible = "loongson,la364";
+			device_type = "cpu";
+			reg = <0x1>;
+			clock-frequency = <1200000000>;	/* 1500 MHz */
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
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00200000 0x00000000 0x0ee00000>, /* 238 MB at 2 MB */
+		      <0x00000000 0x90000000 0x00000000 0x70000000>;
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
+	cpuintc: interrupt-controller {
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "loongson,cpu-interrupt-controller";
+	};
+
+	liointc: interrupt-controller@1fe01400 {
+		compatible = "loongson,liointc-2.0";
+		reg = <0 0x1fe01400 0 0x40>,
+		      <0 0x1fe01440 0 0x8>,
+		      <0 0x1fe01448 0 0x8>;
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
+	eiointc: interrupt-controller@1fe01600 {
+		compatible = "loongson,ls2k2000-eiointc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <3>;
+	};
+
+	pic: interrupt-controller@10000040 {
+		compatible = "loongson,pch-pic-1.0";
+		reg = <0x0 0x10000000 0x0 0x400>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		loongson,pic-base-vec = <0>;
+		interrupt-parent = <&eiointc>;
+	};
+
+	msi: interrupt-controller@1fe01140 {
+		compatible = "loongson,pch-msi-1.0";
+		reg = <0 0x1fe01140 0 0x8>;
+		interrupt-controller;
+		loongson,msi-base-vec = <64>;
+		loongson,msi-num-vecs = <192>;
+		interrupt-parent = <&eiointc>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0 0x10000000 0 0x10000000 0 0x10000000>,
+			 <0 0x2000000  0 0x2000000  0 0x2000000>,
+			 <0 0x40000000 0 0x40000000 0 0x40000000>,
+			 <0xfe 0x00000000 0xfe 0 0 0x40000000>;
+
+		pmc: acpi@100d0000 {
+			compatible = "syscon";
+			reg = <0x0 0x100d0000 0x0 0x58>;
+			interrupt-parent = <&pic>;
+			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			suspend-address = <0x1c000500>;
+		};
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
+		uart0: serial@1fe001e0 {
+			compatible = "ns16550a";
+			reg = <0 0x1fe001e0 0 0x10>;
+			clock-frequency = <100000000>;
+			interrupt-parent = <&liointc>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+		};
+
+		pcie@60000000 {
+			compatible = "loongson,ls2k-pci";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			msi-parent = <&msi>;
+
+			reg = <0 0x1a000000 0 0x02000000>,
+			      <0xfe 0x00000000 0 0x20000000>;
+
+			ranges = <0x02000000 0 0x60000000 0 0x60000000 0 0x20000000>,
+				 <0x01000000 0 0x00008000 0 0x18400000 0x0 0x8000>;
+
+			ethernet@3,0 {
+				compatible = "pci0014,7a13.0",
+					     "pci0014,7a13",
+					     "pciclass,020000",
+					     "pciclass,0200",
+					     "loongson, pci-gmac";
+
+				reg = <0x1800 0x0 0x0 0x0 0x0>;
+				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			ethernet@3,1 {
+				compatible = "pci0014,7a13.0",
+					     "pci0014,7a13",
+					     "pciclass,020000",
+					     "pciclass,0200",
+					     "loongson, pci-gmac";
+
+				reg = <0x1900 0x0 0x0 0x0 0x0>;
+				interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			ethernet@3,2 {
+				compatible = "pci0014,7a13.0",
+					     "pci0014,7a13",
+					     "pciclass,020000",
+					     "pciclass,0200",
+					     "loongson, pci-gmac";
+
+				reg = <0x1a00 0x0 0x0 0x0 0x0>;
+				interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			usb@4,0 {
+				compatible = "pci0014,7a44.0",
+					     "pci0014,7a44",
+					     "pciclass,0c0330",
+					     "pciclass,0c03";
+
+				reg = <0x2000 0x0 0x0 0x0 0x0>;
+				interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			usb@19,0 {
+				compatible = "pci0014,7a34.0",
+					     "pci0014,7a34",
+					     "pciclass,0c0330",
+					     "pciclass,0c03";
+
+				reg = <0xc800 0x0 0x0 0x0 0x0>;
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			dc@6,1 {
+				compatible = "pci0014,7a16.0",
+					     "pci0014,7a16",
+					     "pciclass,030000",
+					     "pciclass,0300";
+
+				reg = <0x3100 0x0 0x0 0x0 0x0>;
+				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
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
+				interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			sata@8,0 {
+				compatible = "pci0014,7a18.0",
+					     "pci0014,7a18",
+					     "pciclass,010601",
+					     "pciclass,0106";
+
+				reg = <0x4000 0x0 0x0 0x0 0x0>;
+				interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			pci_bridge@9,0 {
+				compatible = "pci0014,7a49.1",
+					     "pci0014,7a49",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x4800 0x0 0x0 0x0 0x0>;
+				interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 322 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@a,0 {
+				compatible = "pci0014,7a39.1",
+					     "pci0014,7a39",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x5000 0x0 0x0 0x0 0x0>;
+				interrupts = <33 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 33 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@b,0 {
+				compatible = "pci0014,7a39.1",
+					     "pci0014,7a39",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x5800 0x0 0x0 0x0 0x0>;
+				interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 34 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@c,0 {
+				compatible = "pci0014,7a39.1",
+					     "pci0014,7a39",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x6000 0x0 0x0 0x0 0x0>;
+				interrupts = <35 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 35 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@d,0 {
+				compatible = "pci0014,7a49.1",
+					     "pci0014,7a49",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x6800 0x0 0x0 0x0 0x0>;
+				interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 36 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@e,0 {
+				compatible = "pci0014,7a49.1",
+					     "pci0014,7a49",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x7000 0x0 0x0 0x0 0x0>;
+				interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 37 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@f,0 {
+				compatible = "pci0014,7a79.1",
+					     "pci0014,7a79",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x7800 0x0 0x0 0x0 0x0>;
+				interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 40 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			pci_bridge@10,0 {
+				compatible = "pci0014,7a39.1",
+					     "pci0014,7a39",
+					     "pciclass,060400",
+					     "pciclass,0604";
+
+				reg = <0x8000 0x0 0x0 0x0 0x0>;
+				interrupts = <30 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 30 IRQ_TYPE_LEVEL_HIGH>;
+				external-facing;
+			};
+
+			rio@18,0 {
+				compatible = "pci0014,7a1d.0",
+					     "pci0014,7a1d",
+					     "pciclass,068000",
+					     "pciclass,0680";
+
+				reg = <0xc000 0x0 0x0 0x0 0x0>;
+				interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+
+			rio@1b,0 {
+				compatible = "pci0014,7a1d.0",
+					     "pci0014,7a1d",
+					     "pciclass,068000",
+					     "pciclass,0680";
+
+				reg = <0xd800 0x0 0x0 0x0 0x0>;
+				interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+				status = "disabled";
+			};
+		};
+	};
+};
-- 
2.39.3

