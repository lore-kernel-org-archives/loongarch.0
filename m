Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EB41AD3F1
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 07:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866376; cv=none; b=TVPkns/ow1SjfZRiQmJ9aY6HIsNOzheqE8+XjOCKgPbWJoAv+Uob8X+EXH9GKru8RlTkCjn6EB2n0z1+Y7BAVXLXXxUthkSVxmwwnqEhFh4H0vvt74I3x09QfYdIwFunefAdWI8aCp5bkraDAlRfpOcEU+5nj9b2JlVyWO/iPmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866376; c=relaxed/simple;
	bh=1kmYK5zH1cNYmpEbbOHXVJUqNE8qTtSE0nuvjR/eXd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLI6iTL9PU6RVZUKs8VPfJm9EnTYpqDFkq0za+Pa8gt9njW4p3xJXZmMOJFIcex6VULWdHS/dGYQAFYh3a4V6+MSZ4tVQhA3vcuAq9CVUfof//QzufjZdbRxlPxqlhiabskADwm/Es4UB2RZfDqtFx2ftzOs2jDrbAtvVopOJvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.147])
	by gateway (Coremail) with SMTP id _____8AxbeqCod5m+JgCAA--.6119S3;
	Mon, 09 Sep 2024 15:19:30 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.147])
	by front1 (Coremail) with SMTP id qMiowMCxodZ+od5mqyoCAA--.12416S3;
	Mon, 09 Sep 2024 15:19:30 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	linux-sound@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 1/8] ASoC: loongson: Use BIT() macro
Date: Mon,  9 Sep 2024 15:19:05 +0800
Message-ID: <ccca555c96f18c0ecf5f1544c82945ba651d105f.1725844530.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1725844530.git.zhoubinbin@loongson.cn>
References: <cover.1725844530.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxodZ+od5mqyoCAA--.12416S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAryfKr45trWDuw1rurW7trc_yoW5CF1rpr
	sxZFZYgr45Jr4xCwn3tryrtw17J3yrXFyIqFsxWwsFqrs7Zw40vryfXFs3JFy2vr97G3yU
	ZF97A3y09a9xGrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

Where applicable, use BIT() macro instead of shift operation to improve
readability.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_dma.c | 10 +++++-----
 sound/soc/loongson/loongson_i2s.h | 24 ++++++++++++------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index 0238f88bc674..20e4a0641340 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -17,11 +17,11 @@
 #include "loongson_i2s.h"
 
 /* DMA dma_order Register */
-#define DMA_ORDER_STOP          (1 << 4) /* DMA stop */
-#define DMA_ORDER_START         (1 << 3) /* DMA start */
-#define DMA_ORDER_ASK_VALID     (1 << 2) /* DMA ask valid flag */
-#define DMA_ORDER_AXI_UNCO      (1 << 1) /* Uncache access */
-#define DMA_ORDER_ADDR_64       (1 << 0) /* 64bits address support */
+#define DMA_ORDER_STOP          BIT(4) /* DMA stop */
+#define DMA_ORDER_START         BIT(3) /* DMA start */
+#define DMA_ORDER_ASK_VALID     BIT(2) /* DMA ask valid flag */
+#define DMA_ORDER_AXI_UNCO      BIT(1) /* Uncache access */
+#define DMA_ORDER_ADDR_64       BIT(0) /* 64bits address support */
 
 #define DMA_ORDER_ASK_MASK      (~0x1fUL) /* Ask addr mask */
 #define DMA_ORDER_CTRL_MASK     (0x0fUL)  /* Control mask  */
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index 89492eebf834..c8052a762c1b 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -27,18 +27,18 @@
 #define LS_I2S_RX_ORDER 0x110 /* RX DMA Order */
 
 /* Loongson I2S Control Register */
-#define I2S_CTRL_MCLK_READY	(1 << 16) /* MCLK ready */
-#define I2S_CTRL_MASTER		(1 << 15) /* Master mode */
-#define I2S_CTRL_MSB		(1 << 14) /* MSB bit order */
-#define I2S_CTRL_RX_EN		(1 << 13) /* RX enable */
-#define I2S_CTRL_TX_EN		(1 << 12) /* TX enable */
-#define I2S_CTRL_RX_DMA_EN	(1 << 11) /* DMA RX enable */
-#define I2S_CTRL_CLK_READY	(1 << 8)  /* BCLK ready */
-#define I2S_CTRL_TX_DMA_EN	(1 << 7)  /* DMA TX enable */
-#define I2S_CTRL_RESET		(1 << 4)  /* Controller soft reset */
-#define I2S_CTRL_MCLK_EN	(1 << 3)  /* Enable MCLK */
-#define I2S_CTRL_RX_INT_EN	(1 << 1)  /* RX interrupt enable */
-#define I2S_CTRL_TX_INT_EN	(1 << 0)  /* TX interrupt enable */
+#define I2S_CTRL_MCLK_READY	BIT(16) /* MCLK ready */
+#define I2S_CTRL_MASTER		BIT(15) /* Master mode */
+#define I2S_CTRL_MSB		BIT(14) /* MSB bit order */
+#define I2S_CTRL_RX_EN		BIT(13) /* RX enable */
+#define I2S_CTRL_TX_EN		BIT(12) /* TX enable */
+#define I2S_CTRL_RX_DMA_EN	BIT(11) /* DMA RX enable */
+#define I2S_CTRL_CLK_READY	BIT(8)  /* BCLK ready */
+#define I2S_CTRL_TX_DMA_EN	BIT(7)  /* DMA TX enable */
+#define I2S_CTRL_RESET		BIT(4)  /* Controller soft reset */
+#define I2S_CTRL_MCLK_EN	BIT(3)  /* Enable MCLK */
+#define I2S_CTRL_RX_INT_EN	BIT(1)  /* RX interrupt enable */
+#define I2S_CTRL_TX_INT_EN	BIT(0)  /* TX interrupt enable */
 
 #define LS_I2S_DRVNAME		"loongson-i2s"
 
-- 
2.43.5

