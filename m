Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2565A301010
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005270; cv=none; b=mXrpLA54/3uuEqVxchWfiVciKDXMvErxlD+/ujiuhaFcL0wIA7KJBaYEn5hwpI5rxglulCKlwN++Zu7UMqRcwWwulXhHb5mVOA7DKzDAtllvkNhrKnUXM/iCLi4cChiYRjvP/qV+HWuMfg+3sj2l26HugrTTNb6d1STZ9jNd56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005270; c=relaxed/simple;
	bh=g/kIP5yqVLJXoPca4XORKQNMpxmth6eHefekPvm6YYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TS3VaTnKL8A1Ek1Kb7wvFZ1kL4QxY1IhgjQkIGv1NWY0yVc4uSXdapoxCOGngy6ztn0fdGzdpnDbNXLNQ4tVoIjeR5DMV+o+TiJ/EPGRr5BEjyY/EU10IkusbtaAvGxVYzjHcUlSCEO+qYLE79/5kcrZ0an+K+a1Xgs0a1h+ZtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8Cx68KRp55p7P0UAA--.63942S3;
	Wed, 25 Feb 2026 15:41:05 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCxGOCIp55pFMRKAA--.9627S5;
	Wed, 25 Feb 2026 15:41:04 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-mips@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 3/6] dmaengine: loongson: loongson2-apb: Convert to devm_clk_get_enabled()
Date: Wed, 25 Feb 2026 15:40:41 +0800
Message-ID: <8c45d9ed1b5bede8488207c88ec3a80ed0bdbcd0.1771989596.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771989595.git.zhoubinbin@loongson.cn>
References: <cover.1771989595.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOCIp55pFMRKAA--.9627S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEJCGmejz8BkAAAsX
X-Coremail-Antispam: 1Uk129KBj93XoW7WF43AFW5Jr1UZw4xuw4Dtrc_yoW8KF4fpF
	Z3AayfKrW0vF1agwn8Jr4UZ3WYyryfJay3Xa17Jws7A3sxArykXF1xJFyIvF45AFW09a4f
	Xa4vqFWrCF4xGrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0lPfDUUUUU==

Use the devm_clk_get_enabled() helper function to simplify the probe
routine.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/dma/loongson/loongson2-apb-dma.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-dma.c b/drivers/dma/loongson/loongson2-apb-dma.c
index 2d16842e1658..adddfafc2f1c 100644
--- a/drivers/dma/loongson/loongson2-apb-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-dma.c
@@ -616,17 +616,13 @@ static int ls2x_dma_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->regs),
 				     "devm_platform_ioremap_resource failed.\n");
 
-	priv->dma_clk = devm_clk_get(&pdev->dev, NULL);
+	priv->dma_clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(priv->dma_clk))
-		return dev_err_probe(dev, PTR_ERR(priv->dma_clk), "devm_clk_get failed.\n");
-
-	ret = clk_prepare_enable(priv->dma_clk);
-	if (ret)
-		return dev_err_probe(dev, ret, "clk_prepare_enable failed.\n");
+		return dev_err_probe(dev, PTR_ERR(priv->dma_clk), "Couldn't start the clock.\n");
 
 	ret = ls2x_dma_chan_init(pdev, priv);
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ddev = &priv->ddev;
 	ddev->dev = dev;
@@ -652,21 +648,16 @@ static int ls2x_dma_probe(struct platform_device *pdev)
 
 	ret = dmaenginem_async_device_register(&priv->ddev);
 	if (ret < 0)
-		goto disable_clk;
+		return dev_err_probe(dev, ret, "Failed to register DMA engine device.\n");
 
 	ret = of_dma_controller_register(dev->of_node, of_dma_xlate_by_chan_id, priv);
 	if (ret < 0)
-		goto disable_clk;
+		return dev_err_probe(dev, ret, "Failed to register dma controller.\n");
 
 	platform_set_drvdata(pdev, priv);
 
 	dev_info(dev, "Loongson LS2X APB DMA driver registered successfully.\n");
 	return 0;
-
-disable_clk:
-	clk_disable_unprepare(priv->dma_clk);
-
-	return ret;
 }
 
 /*
@@ -675,10 +666,7 @@ static int ls2x_dma_probe(struct platform_device *pdev)
  */
 static void ls2x_dma_remove(struct platform_device *pdev)
 {
-	struct ls2x_dma_priv *priv = platform_get_drvdata(pdev);
-
 	of_dma_controller_free(pdev->dev.of_node);
-	clk_disable_unprepare(priv->dma_clk);
 }
 
 static const struct of_device_id ls2x_dma_of_match_table[] = {
-- 
2.52.0

