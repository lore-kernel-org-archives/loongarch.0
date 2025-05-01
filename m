Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D12223182E
	for <loongarch@lists.linux.dev>; Thu,  1 May 2025 04:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746074661; cv=none; b=JteR+g/ZaHuV5u4JKCgYKowWCZUW3fjuJCx5EXm6DC19Q1rDnnOnGdLOyfpk629/ycyQyC3eZjqdeNhhb+gz2XpXl0hBRslx4BK3w6e18wWG97KGnkfUdjietEV/82W5dmnacc6MpEwqn83PtU/LxZ96TUMJPKDYNGtq/WfSa2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746074661; c=relaxed/simple;
	bh=SyCJ/reSUubb99ctTUvB3WbQtd7pVrDCg1rAbj9qt2w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dy7+Do92VQKUn3b8aNFRpQmu/9YMR5ibNYmxucmIwTqDplK9SlO+5qdcwXeLGbxym1/QElYmy3vYkHBmya+nx3DrJMJqnVQTyvdJLoSOPs7pyyRC4auegz8zoU3i+bQpoTSMaNzc2VHMUDiVonza3PEaVHib6r9koRFyi1BaK9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XKM99spk; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XKM99spk"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0446B25EBB;
	Thu,  1 May 2025 06:44:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmODMxWgfTDT; Thu,  1 May 2025 06:44:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746074657; bh=SyCJ/reSUubb99ctTUvB3WbQtd7pVrDCg1rAbj9qt2w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XKM99spkhBhPCynmOdVdf9G+Lmh/EuEEpVdKg0awDdnw7Pj/ZHQj31UUzMvB5mXoz
	 b/akOQW9mp2V4p/ObraYvPs3Wrfo5Umu8509GZ/RJFj8wxNG9OXrtfMBlqB9Y6NSlD
	 VnTfgjE7NpatwtkRz+cNz26quTHmN3dWaEfKOBAxhwj6G+d7SX4rUFN1uhidWY50UP
	 2jpgHyyWT1FfrL0GdnDR6l9fSZRPfUKzYoVLC1pYSqB8cpWUiEyj4yfx/jT2KSVPll
	 84YQgHzMFrpe/b+7T/uCCfo6SJU5nwnp1jE54AM+Bfkn+2gACdhWgF8oGIwsR7yyz3
	 8GdhNH2ac1z8g==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yao Zi <ziyao@disroot.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH 3/4] LoongArch: dts: Add initial SoC devicetree for Loongson 2K0300
Date: Thu,  1 May 2025 04:42:39 +0000
Message-ID: <20250501044239.9404-5-ziyao@disroot.org>
In-Reply-To: <20250501044239.9404-2-ziyao@disroot.org>
References: <20250501044239.9404-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC devicetree for 2K0300 SoC, which features one LA264 dual-issue
core and targets embedded market. Only CPU core, legacy interrupt
controllers and UARTs are defined for now.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/boot/dts/loongson-2k0300.dtsi | 197 +++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi

diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
new file mode 100644
index 000000000000..6991a368ff94
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Loongson Technology Corporation Limited
+ * Copyright (C) 2025 Yao Zi <ziyao@disroot.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "loongson,ls2k0300";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		serial9 = &uart9;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "loongson,la264";
+			reg = <0>;
+			device_type = "cpu";
+			clocks = <&cpu_clk>;
+		};
+
+	};
+
+	cpuintc: interrupt-controller {
+		compatible = "loongson,cpu-interrupt-controller";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
+
+	cpu_clk: clock-1000m {
+		compatible = "fixed-clock";
+		clock-frequency = <1000000000>;
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x10000000 0x00 0x10000000 0x0 0x10000000>,
+			 <0x00 0x02000000 0x00 0x02000000 0x0 0x04000000>,
+			 <0x00 0x40000000 0x00 0x40000000 0x0 0x40000000>;
+
+		liointc0: interrupt-controller@16001400{
+			compatible = "loongson,liointc-2.0";
+			reg = <0x0 0x16001400 0x0 0x40>,
+			      <0x0 0x16001040 0x0 0x8>;
+			reg-names = "main", "isr0";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+			interrupt-names = "int0";
+
+			loongson,parent_int_map = <0xffffffff>, /* int0 */
+						  <0x00000000>, /* int1 */
+						  <0x00000000>, /* int2 */
+						  <0x00000000>; /* int3 */
+		};
+
+		liointc1: interrupt-controller@16001440 {
+			compatible = "loongson,liointc-2.0";
+			reg = <0x0 0x16001440 0x0 0x40>,
+			      <0x0 0x16001048 0x0 0x8>;
+			reg-names = "main", "isr0";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <4>;
+			interrupt-names = "int2";
+
+			loongson,parent_int_map = <0x00000000>, /* int0 */
+						  <0x00000000>, /* int1 */
+						  <0xffffffff>, /* int2 */
+						  <0x00000000>; /* int3 */
+		};
+
+		uart0: serial@16100000 {
+			compatible = "ns16550a";
+			reg = <0 0x16100000 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart1: serial@16100400 {
+			compatible = "ns16550a";
+			reg = <0 0x16100400 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart2: serial@16100800 {
+			compatible = "ns16550a";
+			reg = <0 0x16100800 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart3: serial@16100c00 {
+			compatible = "ns16550a";
+			reg = <0 0x16100c00 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart4: serial@16101000 {
+			compatible = "ns16550a";
+			reg = <0 0x16101000 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart5: serial@16101400 {
+			compatible = "ns16550a";
+			reg = <0 0x16101400 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart6: serial@16101800 {
+			compatible = "ns16550a";
+			reg = <0 0x16101800 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart7: serial@16101c00 {
+			compatible = "ns16550a";
+			reg = <0 0x16101c00 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart8: serial@16102000 {
+			compatible = "ns16550a";
+			reg = <0 0x16102000 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		uart9: serial@16102400 {
+			compatible = "ns16550a";
+			reg = <0 0x16102400 0 0x10>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+			status = "disabled";
+		};
+
+		isa@16400000 {
+			compatible = "isa";
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges = <1 0x0 0x0 0x16400000 0x4000>;
+		};
+	};
+};
-- 
2.49.0

