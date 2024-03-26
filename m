Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D726F4CDE7
	for <loongarch@lists.linux.dev>; Tue, 26 Mar 2024 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443684; cv=none; b=arDgJxknQadhYEpN9ra4MZaBGnxNsMdvPFu2qVX1Jrtkjd0SZzeK7O97LUqen3On4drnnTD/RiZ5F/AV1hoWuR4YNgP9xbDFpySy+2T9soWY5CIpPRYcgsv7KLWC0xt10OjL670WQPdDHWzhar8lUFuKjOIJHMFZHBESgAZaqr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443684; c=relaxed/simple;
	bh=1K4yPs9LX5ubduM5zyKqXEd/c7SvFbmm6vCBYMxT5U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQwDgxkg0SI4zLKunIze8UpXKyz+styGO/5/uJnZtiHzPIa6sgZ6afzK/UoUofjKuprNwqUJxOUYxdlQ8Iq2/lTz2tJLbuqWE3BP+QMpAYKlLm3qAGYdTKl0HC4Faa/iuNM+nwrUi3ItYJB8s3rplZ9pnTHZOgGRZCxdcHu38nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.198])
	by gateway (Coremail) with SMTP id _____8DxdfHfjgJmfk4eAA--.6000S3;
	Tue, 26 Mar 2024 17:01:19 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.198])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxVMzajgJmV7JoAA--.13451S3;
	Tue, 26 Mar 2024 17:01:19 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 1/8] dt-bindings: clock: add Loongson-2K expand clock index
Date: Tue, 26 Mar 2024 17:01:00 +0800
Message-ID: <0cfd237c2c7c1e4f89b6e5f7af0a64d306de1c8f.1710926402.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710926402.git.zhoubinbin@loongson.cn>
References: <cover.1710926402.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxVMzajgJmV7JoAA--.13451S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw4DGrWrCry7Cw4UCF4kuFX_yoW5Gry8pr
	48ZFW2gry7tF4xKw40qr15Kr43ur47Jw1UAF47ur4UXF17Aw18JwsruF4fJryUXF95GFyx
	Za1Duw40va9rXwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
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
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8qsjUUUUUU==

The Loongson-2K2000 has more clock indexs, such as clock gates.
This patch adds these clock indexes.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 include/dt-bindings/clock/loongson,ls2k-clk.h | 58 +++++++++++++------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt-bindings/clock/loongson,ls2k-clk.h
index 3bc4dfc193c2..59546c7a1c5e 100644
--- a/include/dt-bindings/clock/loongson,ls2k-clk.h
+++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
@@ -7,24 +7,44 @@
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
+
+#define LOONGSON2_CLK_END	35
 
 #endif
-- 
2.43.0

