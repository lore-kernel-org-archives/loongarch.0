Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CB12EE262
	for <loongarch@lists.linux.dev>; Tue,  9 Jun 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996010; cv=none; b=KqoKeHHWmr3/leBwUZ9lHlP9H0rt3dXKkVkkjMe12cqW7XnUjvclo9dhnFQbvBovA2eddZGdwK9w1ewYO2DtgfpJj7J1rFyM8bAr8glu3VaKMjV+7KdRhbq0E3DCVNIextUvgsSKd229uWV7SeOb+42M1obK/mfMJPj1ZVDJYH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996010; c=relaxed/simple;
	bh=5gZC6T2JXbuAgHcQsotTCrBQZO69LrNxUv122F/zekQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bgVuJDwe19RacmL3s8Nsc/EQmyYu3jN3DErlyXgStLoWQvGdW183NoMlVuQFyKWkQTrCM57rfWZZbEx01LYcRw0qgWmeer0N5Usl3NdwLm4EWsTGRW1qvankOM/L4AiusLJFX2Ru8+zA+pVW52D+vjISd09lkcPR48htXnGMxrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8CxRXin1ydqdzESAA--.24143S3;
	Tue, 09 Jun 2026 17:06:47 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJCxOMGk1ydqKKOgAA--.28652S3;
	Tue, 09 Jun 2026 17:06:46 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
To: Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] LoongArch: dts: i2c: Add clocks and clock-frequency properties to 2K0500
Date: Tue,  9 Jun 2026 17:05:41 +0800
Message-Id: <20260609090543.1462-2-wanghongliang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260609090543.1462-1-wanghongliang@loongson.cn>
References: <20260609090543.1462-1-wanghongliang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMGk1ydqKKOgAA--.28652S3
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zw4fCw1UtrWfAr1rXF4kKrX_yoW8uw43pF
	9F93yDGr40qF43X3W5tFWUGrn3CF9ayF97WF17AFWUGwnxtr1DXr4rKFy7JFy5Ww4Yv39F
	qFn3Cas0vFsxZabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2
	AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07je
	byAUUUUU=

Add clocks and clock-frequency properties to i2c nodes.

Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k0500.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index 1b502064df11..992b1d0de9ec 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
@@ -405,6 +405,8 @@ uart0: serial@1ff40800 {
 		i2c0: i2c@1ff48000 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1ff48000 0x0 0x0800>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
 			interrupt-parent = <&eiointc>;
 			interrupts = <14>;
 			status = "disabled";
@@ -413,6 +415,8 @@ i2c0: i2c@1ff48000 {
 		i2c@1ff48800 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1ff48800 0x0 0x0800>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
 			interrupt-parent = <&eiointc>;
 			interrupts = <15>;
 			status = "disabled";
@@ -421,6 +425,8 @@ i2c@1ff48800 {
 		i2c@1ff49000 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1ff49000 0x0 0x0800>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
 			interrupt-parent = <&eiointc>;
 			interrupts = <16>;
 			status = "disabled";
@@ -429,6 +435,8 @@ i2c@1ff49000 {
 		i2c@1ff49800 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1ff49800 0x0 0x0800>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
 			interrupt-parent = <&eiointc>;
 			interrupts = <17>;
 			status = "disabled";
@@ -437,6 +445,8 @@ i2c@1ff49800 {
 		i2c@1ff4a000 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1ff4a000 0x0 0x0800>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
 			interrupt-parent = <&eiointc>;
 			interrupts = <18>;
 			status = "disabled";
@@ -445,6 +455,8 @@ i2c@1ff4a000 {
 		i2c@1ff4a800 {
 			compatible = "loongson,ls2k-i2c";
 			reg = <0x0 0x1ff4a800 0x0 0x0800>;
+			clock-frequency = <100000>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
 			interrupt-parent = <&eiointc>;
 			interrupts = <19>;
 			status = "disabled";
-- 
2.47.2

