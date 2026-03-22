Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E502882BE
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774163892; cv=none; b=pi/hYT/L6dEEE+U21LkkxiUAqT/V8TzvH71+kqCI8+jNOaY7gEVApo+Kf/z+XEs0aO4aQ3oHIgKri3RMJz8agzC4EShO15xhNr4PYyo4hl4+MerCv+Qp5MOYx8Vfgyb2weS6ri9fFDuGkLMLVCyh7kIm2wqK2xmTEH+h0oS2gbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774163892; c=relaxed/simple;
	bh=ETAa+zoDGli4dn7UGo7cLCm63qPxyrvEbic3ImBVDwM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=AguX6lrZb1HBkpG3X5M3Jhn9Oym/HHnkijnzKmDzAt2PtlUrwlOY44ycReEqX9tOPFphgM4JFnNsYU0KhBBpsrmymR/11GdvxDNHOnjfDm2ZUmoWNgaAxYnaTCgUF092ykc09w45CioRZsaYtrE5vmGiwBGtVk8ZRgkgB2zQD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uXldl+dC; arc=none smtp.client-ip=203.205.221.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uXldl+dC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774163883; bh=DNS9wCp3A4Je/rz949TKpkUlrZHk7q2saW4PAyCKVYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uXldl+dC229dvddAjjLtXHNSAzzj3ucrtwInW9vD2OSpEpVX5L1XPVNzBeEPEBhbT
	 qF0gpNy/9uyUHJPzBHQHocrn7IsVqUT1nvFh57CIv1OqXI880CtC6TE9ZfM7n5SFXX
	 es1aBZor9RFn39zZ4e9oc6ek6V1/CC/LRgsuh7kU=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3A0B863C; Sun, 22 Mar 2026 15:14:32 +0800
X-QQ-mid: xmsmtpt1774163676tulsakzvd
Message-ID: <tencent_6C692FE25219A76D5F73D250006D543B6709@qq.com>
X-QQ-XMAILINFO: M2dBUVw0X9hn2VXb4sMvj1Tp6FeS+5H81pf2MtrNMTBCUx+cNuKW0RGirknRnX
	 yGfn1GPyhl8IZ+/qYjy0oKr75jQWhNnLwbutiU2k7ZFrAym9iZwGFtFGz/CG/CCBJP8uW1zWVE7W
	 Od7TZVDR7FJrzAiuGd+IOVJfU+M6HzVNnUboExDajs7AMYhovH/NHJr8R3PvHgTXiEs/33Mf0B2X
	 IYYxi4d6Hf75+vF238eXkxnH7NCX7oNzSq5rrYpUettebsYv+mwKJSuMO1Piy4Cy6o9yGHaMHPDo
	 A0RL80ewvAx4kpNbKZ9Lzy1I0WyH4ALTvJniwAY9fZJzmr570Bk5oStW1my+TA/0XuBgI7moCthF
	 MPo84qkc64IppMQqLCVp4lmVyerzGypsVFKnjiqmDvjm4DnmmdIAE0w6ho47aI39GAMv9Gqhl9uo
	 eWE9oqK/oYl0JaOXrIUgTYVMrPywvxFmSItFSMUFQbB7N/3+kIqj0eI7QO5XOB9y+Sv8ddDd8uzi
	 OMt3ZzFHJfDkYcBih2V3gIpob39LoG+9ZA8f9sHOFQj0mmEzu2NelxxQ5UsCITuuOp+Zv+ub/68a
	 0RfgT30P+f660hWzGbawH3cQDEIUpcvM5kyHKrpCIEwb/GXUC/GcQX4K/mM3f/QRtgjV4SJcd1sY
	 paXkkg4quUOMppiAgVJxp5NyMgUhAKb2ISrxyDImmDLLLHjoPer+XajvnDSnL3ZbeztMB615wzKZ
	 BKyEmub+rML+3ALu9dxkx6XiN37fiI6R8SqVKMmsJ75kKRsEnjJijkVRnGhtIDgpTQiuhWnJcYyV
	 7guTGhjgGzogyQGUEkahYwUumt2WW1CgCs/GQvy6Fa1dKU+3yMo67hkVUxK6crzQgSdxE7zYMcxW
	 qEWpsdp+RraQ8ORkNPgOUoVcjUR2DcHVknO6kT5UxjiXxj3OB7kkaKCv/3vB8h5Zr+N4AyXZ7i/q
	 7nqe+Qbcx4tuGCMq/VRZpeJO/3ylAWEILHQMcL7fRvF3K3HdB22wYxJ0a84QikhAJQALKmoF9s3H
	 KseCzssAwZPW48pQTX8j1RZ69m4RJyVZnD2Effu4eqkr42VOtLqKsD+1k2fOCD0BOWaurYkOzv/6
	 oxed0raDqu5mzFvhY=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wjjsn <2858482031@qq.com>
Subject: [PATCH v5 2/2] loongarch: boot: dts: Add Loongson-2K0300 support
Date: Sun, 22 Mar 2026 15:13:16 +0800
X-OQ-MSGID: <20260322071316.1537953-3-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322071316.1537953-1-wjjsn@qq.com>
References: <20260322071316.1537953-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wjjsn <2858482031@qq.com>

Signed-off-by: wjjsn <2858482031@qq.com>
---
 arch/loongarch/boot/dts/Makefile              |  2 +-
 .../boot/dts/loongson-2k0300-ref.dts          | 34 +++++++
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 94 +++++++++++++++++++
 3 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300-ref.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi

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
index 000000000000..a64b6b8a194d
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
@@ -0,0 +1,94 @@
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

