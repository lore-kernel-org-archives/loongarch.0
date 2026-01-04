Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0599E2C0F9A
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 06:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767508956; cv=none; b=MqkQ7S42skT1f+3ifT2EvWFV+hJ72GV12/TayDIcguuIpQApdHHnf1y+IBvn3HjSZJgHBbV0UqbwhIhFvWYzXPMPLf0n1UxhQ/2xXy8erV78BiMVt6p7uQ0M3fdmk0EnLo9HvJeKIvblHLUKBA7/ewMxBBxKmGy0JgR9coD7tnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767508956; c=relaxed/simple;
	bh=2UojR5IUdDw9NxinGgY3OXI30fXwdfd03mlAsNWPFc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THZzZVYKRO9hJnb0o2iBnwYkNPPuDpfwHK+1r535hux7HCvxw92obfZKw1u8NHOWg9W3rUv+g/1q2cgGUcLZS+bo1tSV/lcGXQUkU3NjJsx840xdiUl2MoiMVEqBvw/vLJTt11BjxjGt0eByuxazOxkBwPYt1CvPP/dQcRkdjMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8Dx98G8C1pp6VIFAA--.4310S3;
	Sun, 04 Jan 2026 14:42:04 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJBxSeC4C1pplDUMAA--.28219S3;
	Sun, 04 Jan 2026 14:42:03 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Yao Zi <me@ziyao.cc>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 5/9] LoongArch: dts: Describe PCI sideband IRQ through interrupt-extended
Date: Sun,  4 Jan 2026 14:41:50 +0800
Message-ID: <3355cbf0e2250fb26afd880015ded12b85dc7fd1.1767505859.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767505859.git.zhoubinbin@loongson.cn>
References: <cover.1767505859.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeC4C1pplDUMAA--.28219S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgERCGlaARoAcgAAsA
X-Coremail-Antispam: 1Uk129KBj93XoW3XF1UCF43Xw4kAF45Zr4kXwc_yoW7CF4xpF
	W7Ca1DXr4Dtrn8K3WUAF4jvr1kJ3s5CFn3urykC3y8GFyDK3W0vr4xGF929F1Sg3yrXay2
	qrnYk345Ka45GwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsZqXUUUUU

From: Yao Zi <me@ziyao.cc>

SoC integrated peripherals on LS2K1000 and LS2K2000 could be discovered
as PCI devices, but require sideband interrupts to function, which are
previously described by interrupts and interrupt-parent properties.

However, pci/pci-device.yaml allows interrupts property to only specify
PCI INTx interrupts, not sideband ones. Convert these devices to use
interrupt-extended property, which describes sideband interrupts used by
PCI devices since dt-schema commit e6ea659d2baa ("schemas: pci-device:
Allow interrupts-extended for sideband interrupts"), eliminating
dtbs_check warnings.

Fixes: 30a5532a3206 ("LoongArch: dts: DeviceTree for Loongson-2K1000")
Signed-off-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 25 ++++++---------
 arch/loongarch/boot/dts/loongson-2k2000.dtsi | 32 ++++++++------------
 2 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index 60ab425f793f..eee06b84951c 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -437,54 +437,47 @@ pcie@1a000000 {
 
 			gmac0: ethernet@3,0 {
 				reg = <0x1800 0x0 0x0 0x0 0x0>;
-				interrupt-parent = <&liointc0>;
-				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
-					     <13 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&liointc0 12 IRQ_TYPE_LEVEL_HIGH>,
+						      <&liointc0 13 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
 				status = "disabled";
 			};
 
 			gmac1: ethernet@3,1 {
 				reg = <0x1900 0x0 0x0 0x0 0x0>;
-				interrupt-parent = <&liointc0>;
-				interrupts = <14 IRQ_TYPE_LEVEL_HIGH>,
-					     <15 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&liointc0 14 IRQ_TYPE_LEVEL_HIGH>,
+						      <&liointc0 15 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
 				status = "disabled";
 			};
 
 			ehci0: usb@4,1 {
 				reg = <0x2100 0x0 0x0 0x0 0x0>;
-				interrupt-parent = <&liointc1>;
-				interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&liointc1 18 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			ohci0: usb@4,2 {
 				reg = <0x2200 0x0 0x0 0x0 0x0>;
-				interrupt-parent = <&liointc1>;
-				interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&liointc1 19 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			display@6,0 {
 				reg = <0x3000 0x0 0x0 0x0 0x0>;
-				interrupt-parent = <&liointc0>;
-				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&liointc0 28 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			hda@7,0 {
 				reg = <0x3800 0x0 0x0 0x0 0x0>;
-				interrupt-parent = <&liointc0>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&liointc0 4 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			sata: sata@8,0 {
 				reg = <0x4000 0x0 0x0 0x0 0x0>;
-				interrupt-parent = <&liointc0>;
-				interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&liointc0 19 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index 6c77b86ee06c..87c45f1f7cc7 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -291,65 +291,57 @@ pcie@1a000000 {
 
 			gmac0: ethernet@3,0 {
 				reg = <0x1800 0x0 0x0 0x0 0x0>;
-				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
-					     <13 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&pic 12 IRQ_TYPE_LEVEL_HIGH>,
+						      <&pic 13 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
-				interrupt-parent = <&pic>;
 				status = "disabled";
 			};
 
 			gmac1: ethernet@3,1 {
 				reg = <0x1900 0x0 0x0 0x0 0x0>;
-				interrupts = <14 IRQ_TYPE_LEVEL_HIGH>,
-					     <15 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&pic 14 IRQ_TYPE_LEVEL_HIGH>,
+						      <&pic 15 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
-				interrupt-parent = <&pic>;
 				status = "disabled";
 			};
 
 			gmac2: ethernet@3,2 {
 				reg = <0x1a00 0x0 0x0 0x0 0x0>;
-				interrupts = <17 IRQ_TYPE_LEVEL_HIGH>,
-					     <18 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&pic 17 IRQ_TYPE_LEVEL_HIGH>,
+						      <&pic 18 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
-				interrupt-parent = <&pic>;
 				status = "disabled";
 			};
 
 			xhci0: usb@4,0 {
 				reg = <0x2000 0x0 0x0 0x0 0x0>;
-				interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-parent = <&pic>;
+				interrupts-extended = <&pic 48 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			xhci1: usb@19,0 {
 				reg = <0xc800 0x0 0x0 0x0 0x0>;
-				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-parent = <&pic>;
+				interrupts-extended = <&pic 22 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			display@6,1 {
 				reg = <0x3100 0x0 0x0 0x0 0x0>;
-				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-parent = <&pic>;
+				interrupts-extended = <&pic 28 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			i2s@7,0 {
 				reg = <0x3800 0x0 0x0 0x0 0x0>;
-				interrupts = <78 IRQ_TYPE_LEVEL_HIGH>,
-					     <79 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&pic 78 IRQ_TYPE_LEVEL_HIGH>,
+						      <&pic 79 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "tx", "rx";
-				interrupt-parent = <&pic>;
 				status = "disabled";
 			};
 
 			sata: sata@8,0 {
 				reg = <0x4000 0x0 0x0 0x0 0x0>;
-				interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-parent = <&pic>;
+				interrupts-extended = <&pic 16 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
-- 
2.47.3

