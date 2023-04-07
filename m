Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00621FA9
	for <loongarch@lists.linux.dev>; Fri,  7 Apr 2023 08:35:09 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8DxXNq81S9ks8cXAA--.25432S3;
	Fri, 07 Apr 2023 16:35:08 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxGL2t1S9kKRwYAA--.21995S5;
	Fri, 07 Apr 2023 16:35:07 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	loongson-kernel@lists.loongnix.cn,
	stable@vger.kernel.org
Subject: [PATCH V3 3/5] irqchip/loongson-eiointc: Fix registration of syscore_ops
Date: Fri,  7 Apr 2023 16:34:51 +0800
Message-Id: <20230407083453.6305-4-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230407083453.6305-1-lvjianmin@loongson.cn>
References: <20230407083453.6305-1-lvjianmin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxGL2t1S9kKRwYAA--.21995S5
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZFW7XFyrJF1kWrWDJFWrZrb_yoW8Xw13p3
	y8Ca4jgr4rWa48Cr9IqFyDZFy5Awn5ZrW7JFWrJayavF98Gwn8CF1FyF1q9FWqkw4DGF1j
	9F40qr4UCa15Aw7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8EeHDUUUUU==

When support suspend/resume for loongson-eiointc, the syscore_ops
is registered twice in dual-bridges machines where there are two
eiointc IRQ domains. Repeated registration of an same syscore_ops
broke syscore_ops_list. Also, cpuhp_setup_state_nocalls is only
needed to call for once. So the patch will corret them.

Fixes: a90335c2dfb4 ("irqchip/loongson-eiointc: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index d16ed64feb3d..90181c42840b 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -422,10 +422,12 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 	parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
 	irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
 
-	register_syscore_ops(&eiointc_syscore_ops);
-	cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_LOONGARCH_STARTING,
+	if (nr_pics == 1) {
+		register_syscore_ops(&eiointc_syscore_ops);
+		cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_LOONGARCH_STARTING,
 				  "irqchip/loongarch/intc:starting",
 				  eiointc_router_init, NULL);
+	}
 
 	if (cpu_has_flatmode)
 		node = cpu_to_node(acpi_eiointc->node * CORES_PER_EIO_NODE);
-- 
2.31.1

