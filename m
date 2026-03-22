Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772EE29B8CF
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 06:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774159379; cv=none; b=soelBr3vOUPecGNWhh4lB8ptsaf5VpevilFqyPEajf0/iho1XSH4z9ASX9ee4ydayUxXDQrvguE46GLQeQKY8yr+tOxn6PBRsVk5caSa6PHNDc6oQJG8mr6jAqwkSW4O40TkwhzTNYaLVtxBrHH4TqeeiUB0vbm+z9krB0d+MoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774159379; c=relaxed/simple;
	bh=Y16L4YWfMtrtEeDwZHUWJGXpVi/Sysz16cUHYqp+wtE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Vk6JL9nOQguQ3Ws87p+y2EwNJ9oQqezuplGigNeFgyNxxlvTDMc8MR71AiE/eW9/3pqfCFYWLohaOBwmh4ZPYwPk83uxnaddkba2mOGM807WYp5TU3At8BuGzcZV8q8vrz69w3YtgU0Mh9DJwHKIPSOoajtX3zArH8WsEfmXwBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ag6YcsI3; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ag6YcsI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774159375; bh=AFRhODcyolPF+/xi57Usj9+pP7A9X3Ey62Q+xbQxuRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ag6YcsI3iIg2KZrVnoMjSwVWk94Qv/KykWACkwzukqr+p099b3myn7pSHENbY+9LQ
	 JbFkx27Mhm7AQ2wZGJqfeNlRpmTm+WIlDMNTUd5jtyQ2jy+BiKp6UWCoMKGl99qKCv
	 7fzpcj3tr3th32tE5LUV1QSizQ9YPcs560XWWbJM=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id B100A4A; Sun, 22 Mar 2026 14:02:49 +0800
X-QQ-mid: xmsmtpt1774159372tee2dm8ec
Message-ID: <tencent_6034EC6B5DDA04A0956AEDECE445442AE406@qq.com>
X-QQ-XMAILINFO: MuMd8wcAiX0qCTYxO+T5kobr0Siz7f5NvRFLqAmK3DJIOnl9i8Yo0W6TOgSmhG
	 u8aKrbyeHcMuhGIsTF91d/fiYAzJocSUtr84x/n2wPMmKMiS09DpsBqb5iarolXm/PdzDHuXXOOu
	 V3fYZQAJjgdWVTSX+fVfwGk0JpZpKz14hsJ10IPmZCaluoMoiRyIUeb0vV5HI/DqFVgTJTRP5zFL
	 u5jtxo7U25hWpLnibUsByGkB8gz2olgUuIMYmrunBCiFabJW0vaVS05SLOXiadHWWAreLS8Va/E9
	 +ue7OGUvyFRZKa1OSx9uwV5ZnslLuxQrn3UtQ1hnQ0kt5ePuqIAWRO7PZuJYZXAtw7zJT3Dno/lN
	 RWI37z/Fd28LSTvj/EMK0b+LByrvD8ODdjXU8HFz4zeER0KKhX205GXA7DkaAVKl1oVAo7LXmssG
	 Ou8b09goBtRzS7Qm56bFcEB3dmg6BXjHt90k9ycD7+QCAVaNJwYPBTPT1b2pX7Y3EaQrT+aqYc8r
	 /yxrMmuglMuEIR2mOUTbDyrFOrMB4vcDdEwlsZdY95k5iRYqhVh7nsZ1TtkeSZ7cUthJqoe7BqLC
	 uv24M3Yq0mLIveVtN3RQgwgCg1a5QrPYvsjfYk8eouihuudLLnM3yY+71xT6t7VGb6bfVcMf+ced
	 IbqzD7KO5c2hixMnM9Cp74JTr2umAIDnwqm/m29ZqxJmvORTfoS5a6zIBABZjf8mdbx9rrhjp8ei
	 y4jq9VJZ/JIqrZ6/5ptPibgMLfOpiw7N++k5cfMJBj/qn1+r6SxDJU4pXFNj42+G4/XXZUaXd5pQ
	 Mbm6BsGqj9JU7aqxVxVZgwnFsj4wtCshTpdtz8TtfjksyJqjfmSU17n9uQtVVwe0wLTOfskrAsNE
	 blH0nlHGtk0CTUSvFR26DSTrlxSrOTtPIBfnR0D4lcEx2LbqTpQ3KE5nwnTXm2sm36gNfZQDEeRy
	 LIQMMDRf10gvDjOzzIL4b8mRc36rUp3TnGc7iyATrwsQ505Cc7Q4vPg4zUcnmxeN6M4Dg/k7ymN3
	 G2dpYXeQlEfrzSZg20w34mrOOVF9M=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH v3 2/2] loongarch: boot: dts: Add Loongson-2K0300 support
Date: Sun, 22 Mar 2026 14:02:46 +0800
X-OQ-MSGID: <20260322060246.1375569-3-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322060246.1375569-1-wjjsn@qq.com>
References: <20260322060246.1375569-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: wjjsn <wjjsn@qq.com>
---
 .../bindings/loongarch/loongson.yaml          |  2 +-
 arch/loongarch/boot/dts/Makefile              |  2 +-
 .../boot/dts/loongson-2k0300-ref.dts          | 34 +++++++
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 95 +++++++++++++++++++
 4 files changed, 131 insertions(+), 2 deletions(-)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300-ref.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi

diff --git a/Documentation/devicetree/bindings/loongarch/loongson.yaml b/Documentation/devicetree/bindings/loongarch/loongson.yaml
index 8bea8b9f75b1..8e0a917ffc01 100644
--- a/Documentation/devicetree/bindings/loongarch/loongson.yaml
+++ b/Documentation/devicetree/bindings/loongarch/loongson.yaml
@@ -16,7 +16,7 @@ properties:
     oneOf:
       - description: Loongson-2K0300 processor based boards
         items:
-          - const: loongson,99pi
+          - const: loongson,ls2k0300-ref
           - const: loongson,ls2k0300
       - description: Loongson-2K0500 processor based boards
         items:
diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index 15d5e14fe418..4a096608cfad 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-dtb-y = loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
+dtb-y = loongson-2k0300-ref.dtb loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
diff --git a/arch/loongarch/boot/dts/loongson-2k0300-ref.dts b/arch/loongarch/boot/dts/loongson-2k0300-ref.dts
new file mode 100644
index 000000000000..f85d2caa94b0
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson-2k0300-ref.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+/dts-v1/;
+
+#include "loongson-2k0300.dtsi"
+
+/ {
+	compatible = "loongson,ls2k0300-ref", "loongson,ls2k0300";
+	model = "Loongson-2K0300 Reference Board";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@200000 {
+		device_type = "memory";
+		reg = <0x0 0x00200000 0x0 0x0ee00000>,
+			  <0x0 0x90000000 0x0 0x10000000>;
+	};
+
+};
+
+
+&uart0 {
+	status = "okay";
+};
+
diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
new file mode 100644
index 000000000000..91062b388e77
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	interrupt-parent = <&cpuintc>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "loongson,la264";
+			device_type = "cpu";
+			reg = <0x0>;
+			clocks = <&clk LS2K0300_CLK_NODE_DIV>;
+		};
+	};
+
+	ref_120m: clock-ref-120m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "ref_120m";
+	};
+
+	cpuintc: interrupt-controller {
+		compatible = "loongson,cpu-interrupt-controller";
+		#interrupt-cells = <1>;
+		interrupt-controller;
+	};
+
+	liointc0: interrupt-controller@16001400 {
+		compatible = "loongson,liointc-2.0";
+		reg = <0x0 0x16001400 0x0 0x40>,
+				<0x0 0x16001040 0x0 0x8>;
+		reg-names = "main", "isr0";
+
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+		interrupt-names = "int0";
+
+		loongson,parent_int_map = <0xffffffff>, /* int0 */
+						<0x00000000>, /* int1 */
+						<0x00000000>, /* int2 */
+						<0x00000000>; /* int3 */
+	};
+	liointc1: interrupt-controller@16001440 {
+		compatible = "loongson,liointc-2.0";
+		reg = <0x0 0x16001440 0x0 0x40>,
+				<0x0 0x16001048 0x0 0x8>;
+		reg-names = "main", "isr0";
+
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <4>;
+		interrupt-names = "int2";
+
+		loongson,parent_int_map = <0x00000000>, /* int0 */
+						<0x00000000>, /* int1 */
+						<0xffffffff>, /* int2 */
+						<0x00000000>; /* int3 */
+	};
+	clk: clock-controller@16000400 {
+		compatible = "loongson,ls2k0300-clk";
+		reg = <0x0 0x16000400 0x0 0x2c>;
+		#clock-cells = <1>;
+		clocks = <&ref_120m>;
+		clock-names = "ref_120m";
+	};
+
+	uart0: serial@16100000 {
+		compatible = "ns16550a";
+		reg = <0x0 0x16100000 0x0 0x10>;
+		clocks = <&clk LS2K0300_CLK_APB_GATE>;
+		interrupt-parent = <&liointc0>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+		no-loopback-test;
+		status = "disabled";
+	};
+};
-- 
2.43.0

