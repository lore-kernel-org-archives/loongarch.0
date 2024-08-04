Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19DA125AC
	for <loongarch@lists.linux.dev>; Sun,  4 Aug 2024 06:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722753525; cv=none; b=ROAGXUnCmdWeTvjEBw4/UwUCCmnt9cXDaFHwogSvIZ5W9bLhYg0sU7SLqfjl9CIncLEkLGcdf/KTs5U5XwUD1YgKO1EOBJZH31b2uyNCNfxkyjZ35nKclR6mvXl2oVOpzkZckK+bh6porzM+tCBH5CheFwaOfRqR63IqihZ4agE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722753525; c=relaxed/simple;
	bh=u4eTnty3R3Uj+xeYbUHoU9749kBEhGCxQnpjqsF4gFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZla82A/+dk55DD4L5ucusMlnbjdT37WndxoO4B9tXHCB6VtIvqlovwExxHCEzilFLcd7n+xwZ9uyfQEk8oXQHVP9ECaSBOvgTdel8hcOzGJMQ1Cx/qQ35Yt60TevgF/r454dQU8EaFB882IuO2GRmiHrXo+zTW56vmBg4JfaDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.4.132])
	by gateway (Coremail) with SMTP id _____8BxKuryIa9m7GsHAA--.25642S3;
	Sun, 04 Aug 2024 14:38:42 +0800 (CST)
Received: from haword-linux.loongson.cn (unknown [10.20.4.132])
	by front1 (Coremail) with SMTP id qMiowMAxYeHuIa9mVqcCAA--.14675S4;
	Sun, 04 Aug 2024 14:38:42 +0800 (CST)
From: zhenghaowei@loongson.cn
To: zhenghaowei@loongson.cn,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	p.zabel@pengutronix.de
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v2 3/3] LoongArch: dts: Update UART driver to Loongson-2K0500, Loongson-2K1000 and Loongson-2K2000.
Date: Sun,  4 Aug 2024 14:38:34 +0800
Message-ID: <20240804063834.70022-3-zhenghaowei@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240804063834.70022-1-zhenghaowei@loongson.cn>
References: <20240804063834.70022-1-zhenghaowei@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxYeHuIa9mVqcCAA--.14675S4
X-CM-SenderInfo: x2kh0w5kdr4v3l6o00pqjv00gofq/1tbiAgETBGauHZgENgADso
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw1xKF13Xr4DKF4kGF1Utwc_yoW5Jr4xp3
	9I9ws7Gr4Igr1fur9rtFWUXr4DAF95CFnFganxArWUArZIqw1jvr4rJF9IqF1UX3yrX3y0
	qrn5Gry29F4UZabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lw4CEc2x0rVAKj4
	xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8AOz7UUUUU=
	=

From: Haowei Zheng <zhenghaowei@loongson.cn>

Change to use the Loongson UART driver by default.

Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k0500.dtsi | 6 +++++-
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 6 +++++-
 arch/loongarch/boot/dts/loongson-2k2000.dtsi | 5 ++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index 3b38ff8853a7..aba6c0991b36 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
@@ -220,12 +220,16 @@ tsensor: thermal-sensor@1fe11500 {
 		};
 
 		uart0: serial@1ff40800 {
-			compatible = "ns16550a";
+			compatible = "loongson,ls7a-uart";
 			reg = <0x0 0x1ff40800 0x0 0x10>;
 			clock-frequency = <100000000>;
 			interrupt-parent = <&eiointc>;
 			interrupts = <2>;
 			no-loopback-test;
+			rts-invert;
+			dtr-invert;
+			cts-invert;
+			dsr-invert;
 			status = "disabled";
 		};
 
diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index 92180140eb56..44c57d2e5dc2 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -297,12 +297,16 @@ dma-controller@1fe00c40 {
 		};
 
 		uart0: serial@1fe20000 {
-			compatible = "ns16550a";
+			compatible = "loongson,ls7a-uart";
 			reg = <0x0 0x1fe20000 0x0 0x10>;
 			clock-frequency = <125000000>;
 			interrupt-parent = <&liointc0>;
 			interrupts = <0x0 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
+			rts-invert;
+			dtr-invert;
+			cts-invert;
+			dsr-invert;
 			status = "disabled";
 		};
 
diff --git a/arch/loongarch/boot/dts/loongson-2k2000.dtsi b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
index 0953c5707825..394494aaa242 100644
--- a/arch/loongarch/boot/dts/loongson-2k2000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k2000.dtsi
@@ -174,12 +174,15 @@ rtc0: rtc@100d0100 {
 		};
 
 		uart0: serial@1fe001e0 {
-			compatible = "ns16550a";
+			compatible = "loongson,ls7a-uart";
 			reg = <0x0 0x1fe001e0 0x0 0x10>;
 			clock-frequency = <100000000>;
 			interrupt-parent = <&liointc>;
 			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
+			fractional-division;
+			rts-invert;
+			dtr-invert;
 			status = "disabled";
 		};
 
-- 
2.43.0

