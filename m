Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5CB944E
	for <loongarch@lists.linux.dev>; Mon,  1 Apr 2024 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711959863; cv=none; b=A3prSVmZDbr7Y+VMT3Jn4ACMQmwd6ySFmi3U7bmA2evh/DmxXTp4hjJX2Tc8gSTHSuRwLkle4szy58FGOUdinCqG3VkZ8PVq6D/oCZEzaxh+u1f47qCXkdLP2BNIWTxA8Ifm+wLBK5Sucm0isG5nFF4P7Fk9NDH+HbT3syzkJG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711959863; c=relaxed/simple;
	bh=a0y3zoTnkymLfZtqZ1BnSFu6c8HGJxsY8x8UBb8rmP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxQf9ET6fZDXBhNfkJcv7RYacQPCtacqa5GioEhQrkGErrtR2iLBS1vKuZ3jtzynaYAliAbt4mDhSpUmdG5mSYlQ+NfgKhaI0rpGoc8h+gF/OpC/YZhxEa/BQFBtxsO6OQOTCj7wTSMofXPPnyUOaZoQTyOUbIPfAaqr+CwPLp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8CxG+krbwpmx+ghAA--.59679S3;
	Mon, 01 Apr 2024 16:24:11 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxaRInbwpm_yZwAA--.10527S3;
	Mon, 01 Apr 2024 16:24:11 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/8] dt-bindings: clock: add Loongson-2K expand clock index
Date: Mon,  1 Apr 2024 16:23:53 +0800
Message-ID: <6c4eb239cbde62e7e1a8c647c945e128a0b78b2b.1711504700.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711504700.git.zhoubinbin@loongson.cn>
References: <cover.1711504700.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxaRInbwpm_yZwAA--.10527S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCFyxXw1rJryktw1ruF1Dtwc_yoW5GFyUpr
	48uFW2gry7tF4xKw40qr15Kr43ur47Jw1UAF47ur4UXF17Aw18JwnruF4fJryUXF95GFyx
	Aa1Duw40va9rXwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8qsjUUUUUU==

In the new Loongson-2K family of SoCs, more clock indexes are needed,
such as clock gates.
The patch adds these clock indexes

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/clock/loongson,ls2k-clk.h | 56 ++++++++++++-------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt-bindings/clock/loongson,ls2k-clk.h
index 3bc4dfc193c2..4e6811eca8c6 100644
--- a/include/dt-bindings/clock/loongson,ls2k-clk.h
+++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
@@ -7,24 +7,42 @@
 #ifndef __DT_BINDINGS_CLOCK_LOONGSON2_H
 #define __DT_BINDINGS_CLOCK_LOONGSON2_H
 
-#define LOONGSON2_REF_100M				0
-#define LOONGSON2_NODE_PLL				1
-#define LOONGSON2_DDR_PLL				2
-#define LOONGSON2_DC_PLL				3
-#define LOONGSON2_PIX0_PLL				4
-#define LOONGSON2_PIX1_PLL				5
-#define LOONGSON2_NODE_CLK				6
-#define LOONGSON2_HDA_CLK				7
-#define LOONGSON2_GPU_CLK				8
-#define LOONGSON2_DDR_CLK				9
-#define LOONGSON2_GMAC_CLK				10
-#define LOONGSON2_DC_CLK				11
-#define LOONGSON2_APB_CLK				12
-#define LOONGSON2_USB_CLK				13
-#define LOONGSON2_SATA_CLK				14
-#define LOONGSON2_PIX0_CLK				15
-#define LOONGSON2_PIX1_CLK				16
-#define LOONGSON2_BOOT_CLK				17
-#define LOONGSON2_CLK_END				18
+#define LOONGSON2_REF_100M	0
+#define LOONGSON2_NODE_PLL	1
+#define LOONGSON2_DDR_PLL	2
+#define LOONGSON2_DC_PLL	3
+#define LOONGSON2_PIX0_PLL	4
+#define LOONGSON2_PIX1_PLL	5
+#define LOONGSON2_NODE_CLK	6
+#define LOONGSON2_HDA_CLK	7
+#define LOONGSON2_GPU_CLK	8
+#define LOONGSON2_DDR_CLK	9
+#define LOONGSON2_GMAC_CLK	10
+#define LOONGSON2_DC_CLK	11
+#define LOONGSON2_APB_CLK	12
+#define LOONGSON2_USB_CLK	13
+#define LOONGSON2_SATA_CLK	14
+#define LOONGSON2_PIX0_CLK	15
+#define LOONGSON2_PIX1_CLK	16
+#define LOONGSON2_BOOT_CLK	17
+
+/* Loongson-2K2000 */
+#define LOONGSON2_OUT0_GATE	18
+#define LOONGSON2_GMAC_GATE	19
+#define LOONGSON2_RIO_GATE	20
+#define LOONGSON2_DC_GATE	21
+#define LOONGSON2_GPU_GATE	22
+#define LOONGSON2_DDR_GATE	23
+#define LOONGSON2_HDA_GATE	24
+#define LOONGSON2_NODE_GATE	25
+#define LOONGSON2_EMMC_GATE	26
+#define LOONGSON2_PIX0_GATE	27
+#define LOONGSON2_PIX1_GATE	28
+#define LOONGSON2_OUT0_CLK	29
+#define LOONGSON2_RIO_CLK	30
+#define LOONGSON2_EMMC_CLK	31
+#define LOONGSON2_DES_CLK	32
+#define LOONGSON2_I2S_CLK	33
+#define LOONGSON2_MISC_CLK	34
 
 #endif
-- 
2.43.0

