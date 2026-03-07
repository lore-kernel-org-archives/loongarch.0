Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98F830DD00
	for <loongarch@lists.linux.dev>; Sat,  7 Mar 2026 03:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772853949; cv=none; b=Yg9Yqcm7iCIPzUVsNjQAVnOR640zgzPz1oBdrGPtF+N8aPfpRfUQJm0Dnqhk/18ZQWOUK/l+v4ka4c3uN5uHjDxQQkRG/bXYvERzIbmoIrKNy9pckemfSgLpIe24zWnWn48RoipGFHNnEd1YMokdsni/UUV9ElfUrlrr0ixsqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772853949; c=relaxed/simple;
	bh=TCsPH4Gdw7qML4MzziVbvIQ4Nxmgn6A6FoTmPCuon1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovPSqt3AbKOCifP1obRzFoLGcJfPqkkSKDc5wSNYa9M9qKsdl3xiASjp4dOmjiNXiX71e7qC/eLOy7AfsuqjmdAs/AQ4+K87dCLEh++M3AoUuc7kngtRnYlTXoQYcjw2XPzZGSTfk13t3vJir0tuW8HQdCKAs1/PMZjbzolq42Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8CxJMG6mqtpLWcYAA--.25713S3;
	Sat, 07 Mar 2026 11:25:46 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJDxD8O4mqtpK+BPAA--.21629S2;
	Sat, 07 Mar 2026 11:25:45 +0800 (CST)
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
Subject: [PATCH v4 4/6] dmaengine: loongson: loongson2-apb: Simplify locking with guard() and scoped_guard()
Date: Sat,  7 Mar 2026 11:25:35 +0800
Message-ID: <fb59bb25e5c4fcb84d9aa7b351285fa8d02ea8cb.1772853681.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJDxD8O4mqtpK+BPAA--.21629S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGmqbKIYXQAAsQ
X-Coremail-Antispam: 1Uk129KBj93XoWxXw1kur1DKw47Zry5Cw4rJFc_yoWrCr18pF
	WUGFZ3Kr4UJ3s8WFn8Gws5WF4UAFsxKFy7WrWUG39rtwn8JrnFkw1fJ3s0vF4DXF97uF9a
	qa90q34fAF15CwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Use guard() and scoped_guard() infrastructure instead of explicitly
acquiring and releasing spinlocks to simplify the code and ensure that
all locks are released properly.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

