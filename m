Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989095;
	b=SQOSxhcs12/6QgyBne53u/+0x6b0uBbMUiZX79lBV7t1kV2hnGovy0/N3C4l5GmhQ4Dq
	 Cszoy9W5EROtkvxvnYreXAJc05uclUsQKHfLpCG8mfcbj44Nw43c6qYYq+0XB4OqIkABg
	 NImkoPZcbp+eyRklexsaXWa6RpViYcxPFPj/qHDs4O6dR73hrasP73w36DGF3IExJcaEQ
	 lsT02CLKFYH0Q0N/1aRA7Qw687mceXBaE8hJhRxyi1hv8irZ1+cAIkyU8gWGirmAvHzyL
	 HP1W9QZcpoypIUlAo+wqfCELfrtMaTvtmFR4uZ/6bPVZlKPDW0JbDh+sMJHjy2nzC1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989095;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=oOIA3tRZyVmZrugavHeyiSBGGloQmcKyysbHi8eIt6I=;
	b=qtnj3/20AxiLthpcbfNhK/ZWdRrIeIqJs+DOdyWTGDTNB2mPJkC5s1WvrOy7lRxapbWL
	 CXNwlcTeqm2KbqAsNWeGwRSxi5ymMeZR9pW11RgEg9Eh8eo3P3ZjQ+RRBS82g4+xG9H8N
	 XDY/o2ooSVfirjlVNuIfaRtH+sE87y9zJvQDL3kft30bZBiLm2PR0Pa4AMOMTQNDfU5Y6
	 amUPzns9huo2quAQ1vgQKQ+548PQqorfiRrsPBPiPjvAQLVcH1YW7Hzem+fvEW0XsRTp2
	 3KgzBUxY6+HUs0aYWJKfzPzlApc0XoXVWbaIdRf6jkyDy1H/hpiQeUZ+JzD7ZXx5q3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22BD606A322
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 04:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A22BD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8DxpvCl195qeV0ZAA--.8391S3;
	Mon, 26 Oct 2026 12:31:33 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAxlMyh195qoTgwAA--.8141S5;
	Mon, 26 Oct 2026 12:31:32 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] dmaengine: loongson: loongson2-apb-cmc-dma: Program CNDTR when advancing sg
Date: Mon, 26 Oct 2026 12:31:22 +0800
Message-ID: <dcb49d67055cc41af3bd68cce01c05e73a7c2787.1792988985.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792988985.git.zhoubinbin@loongson.cn>
References: <cover.1792988985.git.zhoubinbin@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxlMyh195qoTgwAA--.8141S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEMCGrexPwu8AAAsV
X-Coremail-Antispam: 1Uk129KBj93XoW7WF4fZr43KF4rGr4UKF4kGrX_yoW8GrW3pF
	ZxZ34UWFZ8tF4av3Z8uFy8WFy5AF9IyFZF9ay2vw1ku3s3Zw1Uuw15CFy8XF4UAryrXFy2
	vFWkurW7GF1DCFbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8
	CztUUUUU=

When configure_next_sg() moves to the next scatterlist entry it updates
CMAR but leaves CNDTR at the value left over from the previous entry.
The controller therefore keeps using a stale transfer count, so the
hardware does not move the amount of data the descriptor describes.

Program CNDTR together with CMAR so software and hardware progress stay
in sync.

Cc: stable@vger.kernel.org
Fixes: 1c0028e725f1 ("dmaengine: loongson: New driver for the Loongson Multi-Channel DMA controller")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 8b8d530d60c3..c654e0572902 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -266,6 +266,7 @@ static void loongson2_cmc_dma_configure_next_sg(struct loongson2_cmc_dma_chan *l
 
 	sg_req = &lchan->desc->sg_req[lchan->next_sg];
 	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CMAR, id, sg_req->chan_reg.cmar);
+	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CNDTR, id, sg_req->chan_reg.cndtr);
 
 	/* Start transition */
 	ccr |= LOONGSON2_CMCDMA_CCR_EN;
-- 
2.52.0

