Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C1B1DF75C
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005282; cv=none; b=V/bx+eEaZY2Po9xMMNqsinwzYse1HdS3lBhPs8BHWkndAsfyeVSfbIE5ETk7WGjF6Mu8BOj3GLbQQT09DenU93o3bfmGZ07SHprRFYxLcj/v+wG+IltRTBITQkN5Oa71vkyx720kJJvONlz7gLwWhpxpXT+d+PHqY+JmyuhDYMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005282; c=relaxed/simple;
	bh=JMcGBO+kzzGlu4FW4sh1mJr/orUqrk8YAj0uhQyJ5Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEjVzMCBoiHwXpCxRiiD5O+Gsy8mlHIQg3UNGoWg8MugO+AZGCAtRt5s/fGYmrkLa17eqbwv42wLp5mbYhTJJ7iMys2gPE2COz92K3RK1RLIAOytfcRwyXsY29OTESmKhSWQjv7MmiZ/u2LDrToP+cckH53aaMfElxigZILZay4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8Axw8Cfp55pEP4UAA--.5148S3;
	Wed, 25 Feb 2026 15:41:19 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJBxSeCep55pI8RKAA--.10141S2;
	Wed, 25 Feb 2026 15:41:19 +0800 (CST)
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
Subject: [PATCH v3 4/6] dmaengine: loongson: loongson2-apb: Simplify locking with guard() and scoped_guard()
Date: Wed, 25 Feb 2026 15:41:09 +0800
Message-ID: <004809811f510b067f1a3cda2155386db3b4275e.1771989596.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJBxSeCep55pI8RKAA--.10141S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEJCGmejyEBmQAAsD
X-Coremail-Antispam: 1Uk129KBj93XoWxXw1kur1DKw47Zry5Cw4rJFc_yoWrAFy7pF
	WUGFZ3Kr4UJ3s8WFn8Gws5WF4UAFsxKFy7WrWUG39rJ3s8JrnFkw1fJ3s0vF4DXF97uF9a
	qa90q34fAF15CwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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
	vE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0lPfDUUUUU==

Use guard() and scoped_guard() infrastructure instead of explicitly
acquiring and releasing spinlocks to simplify the code and ensure that
all locks are released properly.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/dma/loongson/loongson2-apb-dma.c | 62 +++++++++++-------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-dma.c b/drivers/dma/loongson/loongson2-apb-dma.c
index adddfafc2f1c..aceb069e71fc 100644
--- a/drivers/dma/loongson/loongson2-apb-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-dma.c
@@ -461,12 +461,11 @@ static int ls2x_dma_slave_config(struct dma_chan *chan,
 static void ls2x_dma_issue_pending(struct dma_chan *chan)
 {
 	struct ls2x_dma_chan *lchan = to_ldma_chan(chan);
-	unsigned long flags;
 
-	spin_lock_irqsave(&lchan->vchan.lock, flags);
+	guard(spinlock_irqsave)(&lchan->vchan.lock);
+
 	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc)
 		ls2x_dma_start_transfer(lchan);
-	spin_unlock_irqrestore(&lchan->vchan.lock, flags);
 }
 
 /*
@@ -478,19 +477,18 @@ static void ls2x_dma_issue_pending(struct dma_chan *chan)
 static int ls2x_dma_terminate_all(struct dma_chan *chan)
 {
 	struct ls2x_dma_chan *lchan = to_ldma_chan(chan);
-	unsigned long flags;
 	LIST_HEAD(head);
 
-	spin_lock_irqsave(&lchan->vchan.lock, flags);
-	/* Setting stop cmd */
-	ls2x_dma_write_cmd(lchan, LDMA_STOP);
-	if (lchan->desc) {
-		vchan_terminate_vdesc(&lchan->desc->vdesc);
-		lchan->desc = NULL;
-	}
+	scoped_guard(spinlock_irqsave, &lchan->vchan.lock) {
+		/* Setting stop cmd */
+		ls2x_dma_write_cmd(lchan, LDMA_STOP);
+		if (lchan->desc) {
+			vchan_terminate_vdesc(&lchan->desc->vdesc);
+			lchan->desc = NULL;
+		}
 
-	vchan_get_all_descriptors(&lchan->vchan, &head);
-	spin_unlock_irqrestore(&lchan->vchan.lock, flags);
+		vchan_get_all_descriptors(&lchan->vchan, &head);
+	}
 
 	vchan_dma_desc_free_list(&lchan->vchan, &head);
 	return 0;
@@ -511,14 +509,13 @@ static void ls2x_dma_synchronize(struct dma_chan *chan)
 static int ls2x_dma_pause(struct dma_chan *chan)
 {
 	struct ls2x_dma_chan *lchan = to_ldma_chan(chan);
-	unsigned long flags;
 
-	spin_lock_irqsave(&lchan->vchan.lock, flags);
+	guard(spinlock_irqsave)(&lchan->vchan.lock);
+
 	if (lchan->desc && lchan->desc->status == DMA_IN_PROGRESS) {
 		ls2x_dma_write_cmd(lchan, LDMA_STOP);
 		lchan->desc->status = DMA_PAUSED;
 	}
-	spin_unlock_irqrestore(&lchan->vchan.lock, flags);
 
 	return 0;
 }
@@ -526,14 +523,13 @@ static int ls2x_dma_pause(struct dma_chan *chan)
 static int ls2x_dma_resume(struct dma_chan *chan)
 {
 	struct ls2x_dma_chan *lchan = to_ldma_chan(chan);
-	unsigned long flags;
 
-	spin_lock_irqsave(&lchan->vchan.lock, flags);
+	guard(spinlock_irqsave)(&lchan->vchan.lock);
+
 	if (lchan->desc && lchan->desc->status == DMA_PAUSED) {
 		lchan->desc->status = DMA_IN_PROGRESS;
 		ls2x_dma_write_cmd(lchan, LDMA_START);
 	}
-	spin_unlock_irqrestore(&lchan->vchan.lock, flags);
 
 	return 0;
 }
@@ -550,22 +546,22 @@ static irqreturn_t ls2x_dma_isr(int irq, void *dev_id)
 	struct ls2x_dma_chan *lchan = dev_id;
 	struct ls2x_dma_desc *desc;
 
-	spin_lock(&lchan->vchan.lock);
-	desc = lchan->desc;
-	if (desc) {
-		if (desc->cyclic) {
-			vchan_cyclic_callback(&desc->vdesc);
-		} else {
-			desc->status = DMA_COMPLETE;
-			vchan_cookie_complete(&desc->vdesc);
-			ls2x_dma_start_transfer(lchan);
+	scoped_guard(spinlock, &lchan->vchan.lock) {
+		desc = lchan->desc;
+		if (desc) {
+			if (desc->cyclic) {
+				vchan_cyclic_callback(&desc->vdesc);
+			} else {
+				desc->status = DMA_COMPLETE;
+				vchan_cookie_complete(&desc->vdesc);
+				ls2x_dma_start_transfer(lchan);
+			}
+
+			/* ls2x_dma_start_transfer() updates lchan->desc */
+			if (!lchan->desc)
+				ls2x_dma_write_cmd(lchan, LDMA_STOP);
 		}
-
-		/* ls2x_dma_start_transfer() updates lchan->desc */
-		if (!lchan->desc)
-			ls2x_dma_write_cmd(lchan, LDMA_STOP);
 	}
-	spin_unlock(&lchan->vchan.lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.52.0

