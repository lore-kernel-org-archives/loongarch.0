Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930CE7F
	for <loongarch@lists.linux.dev>; Wed,  3 Aug 2022 04:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C763C433C1;
	Wed,  3 Aug 2022 04:27:25 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 1/2] irqchip/loongson-eiointc: Check hwirq overflow
Date: Wed,  3 Aug 2022 12:27:27 +0800
Message-Id: <20220803042728.3230346-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check hwirq overflow when allocate irq in eiointc domain.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index 80d8ca6f2d46..f8060e58ee06 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -241,8 +241,11 @@ static int eiointc_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	struct eiointc *priv = domain->host_data;
 
 	ret = irq_domain_translate_onecell(domain, arg, &hwirq, &type);
-	if (ret)
-		return ret;
+	if (ret < 0)
+		return -EINVAL;
+
+	if (hwirq >= IOCSR_EXTIOI_VECTOR_NUM)
+		return -EINVAL;
 
 	for (i = 0; i < nr_irqs; i++) {
 		irq_domain_set_info(domain, virq + i, hwirq + i, &eiointc_irq_chip,
-- 
2.31.1

