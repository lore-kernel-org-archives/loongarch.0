Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060334408
	for <loongarch@lists.linux.dev>; Wed, 20 Jul 2022 10:51:40 +0000 (UTC)
Received: from localhost.localdomain.localdomain (unknown [10.2.5.46])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH9E13tdiwnUqAA--.39621S6;
	Wed, 20 Jul 2022 18:51:35 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Hanjun Guo <guohanjun@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V18 04/13] genirq/generic_chip: export irq_unmap_generic_chip
Date: Wed, 20 Jul 2022 18:51:23 +0800
Message-Id: <1658314292-35346-5-git-send-email-lvjianmin@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658314292-35346-1-git-send-email-lvjianmin@loongson.cn>
References: <1658314292-35346-1-git-send-email-lvjianmin@loongson.cn>
X-CM-TRANSID:AQAAf9DxH9E13tdiwnUqAA--.39621S6
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy8uFy5JrWrKFy7CFykZrb_yoW8Xw18pa
	yrWa47WrWkGr18ZFWUGF1kuryavrs7GFW2ya1SvF92yr18Jws2gFykWrnavF40934xuFWY
	yFs7tFy8ur1UWFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
	JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9
	-UUUUU=
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Some irq controllers have to re-implement a private version for
irq_generic_chip_ops, because they have a different xlate to translate
hwirq. Export irq_unmap_generic_chip for reusing in user defined
ops.

Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
---
 include/linux/irq.h       | 1 +
 kernel/irq/generic-chip.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 5053082..83a4574 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1121,6 +1121,7 @@ struct irq_domain_chip_generic {
 /* Setup functions for irq_chip_generic */
 int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
 			 irq_hw_number_t hw_irq);
+void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq);
 struct irq_chip_generic *
 irq_alloc_generic_chip(const char *name, int nr_ct, unsigned int irq_base,
 		       void __iomem *reg_base, irq_flow_handler_t handler);
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index f0862eb..c653cd3 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -431,7 +431,7 @@ int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
 	return 0;
 }
 
-static void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq)
+void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq)
 {
 	struct irq_data *data = irq_domain_get_irq_data(d, virq);
 	struct irq_domain_chip_generic *dgc = d->gc;
-- 
1.8.3.1

