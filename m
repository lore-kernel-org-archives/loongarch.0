Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4D53D0D0
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712044747; cv=none; b=oH8CU/gVgXMEMlm0UZNKZslt732CRhMy8En6iqxYS826EEQKDibNfb7Uj8U1CaaYVOnrbb8iftDviMjtEtoEmpNUcbZz0F4m/mDAI3Y4Qw+g8d6ZspM6w5mpkDfYHrB7vcBAwXwFDS4P4f2IOQBaRX1dR4JZT2pd5YXFccL+/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712044747; c=relaxed/simple;
	bh=UgmIAAI93EZJTtg+aK3e6ZZ+M8Jue3lfJ/8p2/tBVqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVuYP+aMJrAOPWBJDrwcPPV0o03QGCXD7PRfoUqMgGefTO8tXIXbZNp52vdFKA3v7JIlh6UnCJ+iCD4uZqEpi/90qHHfAc7oZYwhqH42T6762bC8oIafXIxzfehVHixpNDp7+lQfHN96cRj86SzmgWR/VipJoclLMEKGNAPPxbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8BxVfHGugtmcz8iAA--.13747S3;
	Tue, 02 Apr 2024 15:59:02 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxSRK7ugtmzqNxAA--.12573S5;
	Tue, 02 Apr 2024 15:59:01 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 3/5] LoongArch: dts: Add PWM support to Loongson-2K0500
Date: Tue,  2 Apr 2024 15:58:40 +0800
Message-ID: <b1c34d8b86efe99c4eaa428e5130e9aecd01eb52.1711953223.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711953223.git.zhoubinbin@loongson.cn>
References: <cover.1711953223.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxSRK7ugtmzqNxAA--.12573S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Jr4fWr4rXF48Jry7Kw18CrX_yoW8Jr4xpa
	sF939xGr40gF1xKws8JFy8Krs3uFyFkFnrWanrAFyUGrsIq3yjvr18JFyfXF4rWrs5X342
	qrn5C347KFWUWabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

The module is supported, enable it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k0500.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
index 413b83366367..86e86a267779 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
@@ -148,6 +148,26 @@ eiointc: interrupt-controller@1fe11600 {
 			interrupts = <3>;
 		};
 
+		pwm@1ff5c000 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c000 0x0 0x10>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <20>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm@1ff5c010 {
+			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
+			reg = <0x0 0x1ff5c010 0x0 0x10>;
+			interrupt-parent = <&eiointc>;
+			interrupts = <21>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		gmac0: ethernet@1f020000 {
 			compatible = "snps,dwmac-3.70a";
 			reg = <0x0 0x1f020000 0x0 0x10000>;
-- 
2.43.0

