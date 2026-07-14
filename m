Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E42448CF1
	for <loongarch@lists.linux.dev>; Tue, 14 Jul 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031890; cv=none; b=CLmw6IJGzSB18sinDw01nmcGv+JpHmB39+fKUaOdccCwgMTIYtJrcu45cSHhZXMm2/QBRv2w0ERPTlVV34GWZ1VRJlPdo0vkrkOpv7+43As6OzYtTQm9U6kFalUnhEcL8E7mV4NGcghTNmGvN6balzXH/jRIRpYlTTEAEN41Fbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031890; c=relaxed/simple;
	bh=W8ZEAAsctvhMV/lSd+JvSOmw5u89I0PFAnjWYkoST5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PApSZZcWmte8avCzylG7a8jtbKH3vXuM34PTpTy65D5rHOcwYLnagWt6h+F5v2MgwOi4P23UF6JfrYaahOK7YN9v/kao7Q/tqR9CNU/4iy+MLt4+4jlfbiQR2zENhhWXK2jsGHtb1RitIjDQH1mfgG2RzHXT3v1H2eOBK4D8+FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f50091e67f7e11f1aa26b74ffac11d73-20260714
X-CID-CACHE: Type:Local,Time:202607142005+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a529a0cb-0ae0-487c-b705-fb5807ec727e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:cba8596f62e32872ce6a6c719d677505,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f50091e67f7e11f1aa26b74ffac11d73-20260714
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 53178156; Tue, 14 Jul 2026 20:24:27 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Liupu Wang <wangliupu@loongson.cn>,
	loongarch@lists.linux.dev
Subject: [PATCH 02/16] irqchip/loongarch-ir: fix redirect free and alloc leaks
Date: Tue, 14 Jul 2026 20:23:37 +0800
Message-Id: <20260714122351.3274006-3-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

redirect_irde_free() ignores its irde argument and always frees
redirect_descs (node 0). Multi-node teardown therefore leaks non-zero
nodes.

On the alloc path, a failed redirect_table_alloc() after
irq_domain_alloc_irqs_parent() returns without freeing parent IRQs.
A mid-loop gpid allocation failure also leaks the current item (chip_data
is not set yet) and never releases the bitmap region obtained from
bitmap_find_free_region().

Free &irde->ird_table and &irde->inv_queue, free parent IRQs on table
alloc failure, kfree(item) on gpid failure, and release the full bitmap
region on the error path.

Fixes: 71619266e0a2 ("irqchip/loongarch-ir: Add IR (interrupt redirection) irqchip support")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-loongarch-ir.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongarch-ir.c b/drivers/irqchip/irq-loongarch-ir.c
index 21c649a89a70..695dfef6570a 100644
--- a/drivers/irqchip/irq-loongarch-ir.c
+++ b/drivers/irqchip/irq-loongarch-ir.c
@@ -219,6 +219,20 @@ static int redirect_table_alloc(int node, u32 nr_irqs)
 	return index;
 }
 
+static void redirect_table_free_region(int node, int index, u32 nr_irqs)
+{
+	struct redirect_table *ird_table = &redirect_descs[node].ird_table;
+	int order = 0;
+
+	if (nr_irqs > 1) {
+		nr_irqs = __roundup_pow_of_two(nr_irqs);
+		order = ilog2(nr_irqs);
+	}
+
+	guard(raw_spinlock_irqsave)(&ird_table->lock);
+	bitmap_release_region(ird_table->bitmap, index, order);
+}
+
 static void redirect_table_free(struct redirect_item *item)
 {
 	struct redirect_table *ird_table = &item->irde->ird_table;
@@ -324,6 +338,7 @@ static int redirect_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	index = redirect_table_alloc(node, nr_irqs);
 	if (index < 0) {
 		pr_err("Alloc redirect table entry failed\n");
+		irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 		return -EINVAL;
 	}
 
@@ -347,6 +362,7 @@ static int redirect_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		item->gpid = kzalloc_node(sizeof(*item->gpid), GFP_KERNEL, node);
 		if (!item->gpid) {
 			pr_err("Alloc redirect GPID failed\n");
+			kfree(item);
 			goto out_free_resources;
 		}
 		item->index = index + i;
@@ -361,6 +377,7 @@ static int redirect_domain_alloc(struct irq_domain *domain, unsigned int virq,
 
 out_free_resources:
 	redirect_free_resources(domain, virq, nr_irqs);
+	redirect_table_free_region(node, index, nr_irqs);
 	irq_domain_free_irqs_common(domain, virq, nr_irqs);
 
 	return -ENOMEM;
@@ -436,8 +453,8 @@ static void redirect_irde_cfg(struct redirect_desc *irde)
 
 static void __init redirect_irde_free(struct redirect_desc *irde)
 {
-	struct redirect_table *ird_table = &redirect_descs->ird_table;
-	struct redirect_queue *inv_queue = &redirect_descs->inv_queue;
+	struct redirect_table *ird_table = &irde->ird_table;
+	struct redirect_queue *inv_queue = &irde->inv_queue;
 
 	if (ird_table->table) {
 		folio_put(virt_to_folio(ird_table->table));
-- 
2.25.1

