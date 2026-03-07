Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50C030BF69
	for <loongarch@lists.linux.dev>; Sat,  7 Mar 2026 03:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772853941; cv=none; b=FUPuzr5IXC0fObtpJJLOYQFxUhMw60GpN7LcvgYx/6xJacfodtfN74ZaAcikVU64eZuspXDVghh1HW/4EnXJR9eBZqhKEOIwf2Fq6vdLfE5ppV298I1yGGNo42El7Fb2N41aY3+MicDzJL1K4fIMT+1UpZERvJ6t1CDyGA1BFr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772853941; c=relaxed/simple;
	bh=+zavlZAcI3vqcaccCnPJtVeS9jrVg0d/AQOQW8OdM8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEkcxQCZ3TOD5CqyzPaRAp5UiwU5JBd2jdyaM0nxJQyk4grDYQsZK9WGIn4AF4+OgDJ7cGbaIjAMxz5rl6ftnZxScR3v5bapuoFspl7dLICxYu+AdbUjOFnjRxF2mjD9212Xa/3q5Tu5nb7Eh6YBp7en6AnGYtK+gRQxcz1AMvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8BxmsKsmqtpEWcYAA--.7533S3;
	Sat, 07 Mar 2026 11:25:32 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx2+ClmqtpI+BPAA--.21248S4;
	Sat, 07 Mar 2026 11:25:32 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 2/6] dmaengine: loongson: loongson2-apb: Convert to dmaenginem_async_device_register()
Date: Sat,  7 Mar 2026 11:25:11 +0800
Message-ID: <c56e67ecde38e9a3bda5f88ea3fc20b97a5cba6c.1772853681.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772853681.git.zhoubinbin@loongson.cn>
References: <cover.1772853681.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx2+ClmqtpI+BPAA--.21248S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGmqbKIYXAAAsR
X-Coremail-Antispam: 1Uk129KBj93XoW7WF4xZw4xKw1xKr43uw4rWFX_yoW8WFy5pa
	s3Ca4fGrW0qF429ws8JrWUZFy3KFy3XayxZay7Jw1UC3sxJ340gF18JFyxXF4UArW8Kaya
	qa4vkayruF4UCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

Use the dmaenginem_async_device_register() helper function to simplify
the probe routine.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/dma/loongson/loongson2-apb-dma.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-dma.c b/drivers/dma/loongson/loongson2-apb-dma.c
index fc7d9f4a96ec..2d16842e1658 100644
--- a/drivers/dma/loongson/loongson2-apb-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-dma.c
@@ -650,21 +650,19 @@ static int ls2x_dma_probe(struct platform_device *pdev)
 	ddev->dst_addr_widths = LDMA_SLAVE_BUSWIDTHS;
 	ddev->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
 
-	ret = dma_async_device_register(&priv->ddev);
+	ret = dmaenginem_async_device_register(&priv->ddev);
 	if (ret < 0)
 		goto disable_clk;
 
 	ret = of_dma_controller_register(dev->of_node, of_dma_xlate_by_chan_id, priv);
 	if (ret < 0)
-		goto unregister_dmac;
+		goto disable_clk;
 
 	platform_set_drvdata(pdev, priv);
 
 	dev_info(dev, "Loongson LS2X APB DMA driver registered successfully.\n");
 	return 0;
 
-unregister_dmac:
-	dma_async_device_unregister(&priv->ddev);
 disable_clk:
 	clk_disable_unprepare(priv->dma_clk);
 
@@ -680,7 +678,6 @@ static void ls2x_dma_remove(struct platform_device *pdev)
 	struct ls2x_dma_priv *priv = platform_get_drvdata(pdev);
 
 	of_dma_controller_free(pdev->dev.of_node);
-	dma_async_device_unregister(&priv->ddev);
 	clk_disable_unprepare(priv->dma_clk);
 }
 
-- 
2.52.0

