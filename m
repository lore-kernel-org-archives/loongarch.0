Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989107;
	b=FKAP5hF9J84XIMcp0kmeNWnwj8C6hjlFRDHlzXKIEl1AaVLQSWO8jk35YThTmYHEGJOi
	 kSR9J1LnaKZtaRjve8FNdMiAVxKU8FAt4KEVvekWKjI6Ldrw6BpVdxCIgOEgN6qC4CF7+
	 lrLXwRrIJCrf5OIJwjrUqNFM0Z2+s/5iKg06uS3RFqsjXUriV7yfR1Dw35cv4gxJG8hF7
	 MN6W+RaKLcf/ceyNehpKryzTvCWqNvNPPVm4vPx7cDX7tbzxJn63UqxobgKDNiyyzyADH
	 bmyYkQL58lkde6ua1y8stUgDJOuxenQ8sZVtech2etwAMbN9WTuF+hteZ7s8pnwfoYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989107;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=RxfFLbETcuxW2hF36Q+mEp1d3PXIqaOdJ0GDwfEkrjg=;
	b=GknxjWzgl+OiWwE2uUFtqaoSkNMcOIdU3IY/oNKD8OKh09UBl/o+wl1PXizqfh3qLLJN
	 ycmElsi+4Y1NqosmMJYl4QsVAyyKB9tUsm1OWPYfYapa/EgDLWHQSAcE58lcAuKPDO9zF
	 KovwSzMqIQ31r3rM0hbA7BYLA1QlmMZodBHRvIbnwLQp6MXqjWLdVrNgw9grV2WIY8ulE
	 S8sxIwBJlNLCK/uG0nKho55Rr0mebTjFdFrEJeGJ+jdWAsqHOo0U/LS3z94snglcSaDU0
	 Fu2PqEFvWWHcTGDGIPd0lffOKkKFjCFzI2bdUw1IlsT0SNDalQUUfJrokFr1UVzo6PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EF4606A31A
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 04:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EF4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8Cxf9Ox195qq10ZAA--.8137S3;
	Mon, 26 Oct 2026 12:31:45 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJCxf8+w195qvzgwAA--.37154S2;
	Mon, 26 Oct 2026 12:31:45 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 4/4] dmaengine: loongson: loongson2-apb-cmc-dma: Add pause/resume support
Date: Mon, 26 Oct 2026 12:31:38 +0800
Message-ID: <92800ae186112366116647ee4f50d4ba09249ef8.1792988985.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCxf8+w195qvzgwAA--.37154S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEMCGrexPwvAwAAsn
X-Coremail-Antispam: 1Uk129KBj93XoW3WryxKr4fCrykJFWfGw15Awc_yoWxCr4rpF
	y3Aa4FgFW5trWFvFn8ZFW8WF1UAryFq39rtFW7GwnxWrykZw1xur1fJ3W8uF47AFyDuF12
	qFZY9rs8GF1UCrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8l38UUUUUU==

Clients that run cyclic transfers sometimes need to stop the channel
temporarily and continue from the same position later. Without pause and
resume, such clients have to terminate and restart the transfer, which
loses the current position and can cause observable glitches or
duplicated data. In addition, advancing to the next scatterlist entry
while the client has requested a pause must not silently restart the
channel.

Provide pause/resume semantics that preserve the current hardware
position, and make scatterlist advancement honor the paused state so a
paused channel stays stopped until the client explicitly resumes it.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 94 +++++++++++++++++++-
 1 file changed, 90 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index c654e0572902..a4153ea85462 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -93,6 +93,7 @@ struct loongson2_cmc_dma_chan {
 	int irq;
 	u32 next_sg;
 	struct loongson2_cmc_dma_chan_reg chan_reg;
+	bool paused;
 };
 
 struct loongson2_cmc_dma_dev {
@@ -184,6 +185,8 @@ static void loongson2_cmc_dma_stop(struct loongson2_cmc_dma_chan *lchan)
 	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id, ccr);
 
 	loongson2_cmc_dma_irq_clear(lchan, LOONGSON2_CMCDMA_MASKI);
+
+	lchan->paused = false;
 }
 
 static int loongson2_cmc_dma_terminate_all(struct dma_chan *chan)
@@ -254,12 +257,13 @@ static void loongson2_cmc_dma_configure_next_sg(struct loongson2_cmc_dma_chan *l
 {
 	struct loongson2_cmc_dma_dev *lddev = lmdma_get_dev(lchan);
 	struct loongson2_cmc_dma_sg_req *sg_req;
+	bool keep_paused = lchan->paused;
 	u32 ccr, id = lchan->id;
 
 	if (lchan->next_sg == lchan->desc->num_sgs)
 		lchan->next_sg = 0;
 
-	/* Stop to update mem addr */
+	/* Stop to update mem addr (idempotent when already paused) */
 	ccr = loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CCR, id);
 	ccr &= ~LOONGSON2_CMCDMA_CCR_EN;
 	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, id, ccr);
@@ -268,9 +272,16 @@ static void loongson2_cmc_dma_configure_next_sg(struct loongson2_cmc_dma_chan *l
 	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CMAR, id, sg_req->chan_reg.cmar);
 	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CNDTR, id, sg_req->chan_reg.cndtr);
 
-	/* Start transition */
-	ccr |= LOONGSON2_CMCDMA_CCR_EN;
-	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, id, ccr);
+	/*
+	 * Only re-enable when the client has not paused the channel.
+	 * A paused cyclic channel still needs its CMAR/CNDTR advanced
+	 * so that resume() starts on the right scatterlist entry, but
+	 * the enable bit must stay clear until the client asks for it.
+	 */
+	if (!keep_paused) {
+		ccr |= LOONGSON2_CMCDMA_CCR_EN;
+		loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, id, ccr);
+	}
 }
 
 static void loongson2_cmc_dma_handle_chan_done(struct loongson2_cmc_dma_chan *lchan)
@@ -534,6 +545,13 @@ static enum dma_status loongson2_cmc_dma_tx_status(struct dma_chan *chan, dma_co
 			/* Active descriptor: compute residue from hardware progress */
 			state->residue = loongson2_cmc_dma_desc_residue(lchan, lchan->desc,
 									lchan->next_sg);
+			/*
+			 * A paused channel still has an active descriptor but is not making
+			 * progress. Report DMA_PAUSED so clients can distinguish it from a
+			 * running transfer.
+			 */
+			if (lchan->paused && status == DMA_IN_PROGRESS)
+				status = DMA_PAUSED;
 		} else if (vdesc) {
 			/* Queued descriptor not yet started: residue is the total length */
 			struct loongson2_cmc_dma_desc *ldesc = to_lmdma_desc(vdesc);
@@ -624,6 +642,72 @@ static int loongson2_cmc_dma_of_controller_register(struct loongson2_cmc_dma_dev
 	return of_dma_controller_register(dev->of_node, loongson2_cmc_dma_of_xlate, lddev);
 }
 
+/**
+ * loongson2_cmc_dma_pause() - Stop the channel without losing state
+ * @chan: DMA channel
+ *
+ * Clears CCR.EN so the controller stops issuing requests to the
+ * peripheral. CNDTR and CMAR keep their current values, so
+ * loongson2_cmc_dma_resume() can pick up exactly where the transfer
+ * left off. The channel remains in cyclic mode; only the enable bit is
+ * dropped, so a paused cyclic channel does not advance the write
+ * pointer until resumed.
+ *
+ * Return: 0 on success.
+ */
+static int loongson2_cmc_dma_pause(struct dma_chan *chan)
+{
+	struct loongson2_cmc_dma_chan *lchan = to_lmdma_chan(chan);
+	struct loongson2_cmc_dma_dev *lddev = lmdma_get_dev(lchan);
+	u32 ccr;
+
+	guard(spinlock_irqsave)(&lchan->vchan.lock);
+
+	if (lchan->paused || !lchan->desc)
+		return 0;
+
+	lchan->paused = true;
+
+	ccr = loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CCR, lchan->id);
+	ccr &= ~LOONGSON2_CMCDMA_CCR_EN;
+	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id, ccr);
+
+	return 0;
+}
+
+/**
+ * loongson2_cmc_dma_resume() - Restart a paused channel
+ * @chan: DMA channel
+ *
+ * Restores CCR.EN. CNDTR is left untouched, so the transfer continues
+ * from the exact word where the pause happened.
+ *
+ * Return: 0 on success.
+ */
+static int loongson2_cmc_dma_resume(struct dma_chan *chan)
+{
+	struct loongson2_cmc_dma_chan *lchan = to_lmdma_chan(chan);
+	struct loongson2_cmc_dma_dev *lddev = lmdma_get_dev(lchan);
+	u32 ccr;
+
+	guard(spinlock_irqsave)(&lchan->vchan.lock);
+
+	if (!lchan->paused)
+		return 0;
+
+	lchan->paused = false;
+
+	/* No descriptor: nothing left to run */
+	if (!lchan->desc)
+		return 0;
+
+	ccr = loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CCR, lchan->id);
+	ccr |= LOONGSON2_CMCDMA_CCR_EN;
+	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id, ccr);
+
+	return 0;
+}
+
 static int loongson2_cmc_dma_probe(struct platform_device *pdev)
 {
 	const struct loongson2_cmc_dma_config *config;
@@ -676,6 +760,8 @@ static int loongson2_cmc_dma_probe(struct platform_device *pdev)
 	ddev->device_synchronize = loongson2_cmc_dma_synchronize;
 	ddev->device_tx_status = loongson2_cmc_dma_tx_status;
 	ddev->device_terminate_all = loongson2_cmc_dma_terminate_all;
+	ddev->device_pause = loongson2_cmc_dma_pause;
+	ddev->device_resume = loongson2_cmc_dma_resume;
 
 	ddev->max_sg_burst = LOONSON2_CMCDMA_MAX_DATA_ITEMS;
 	ddev->src_addr_widths = LOONGSON2_CMCDMA_BUSWIDTHS;
-- 
2.52.0

