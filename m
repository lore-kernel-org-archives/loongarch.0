Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072536F
	for <loongarch@lists.linux.dev>; Thu,  4 Aug 2022 02:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25112C433D6;
	Thu,  4 Aug 2022 02:54:26 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] irqchip/loongson-eiointc: Fix irq affinity setting
Date: Thu,  4 Aug 2022 10:54:21 +0800
Message-Id: <20220804025421.211958-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In multi-node case, csr_any_send() should set EIOINTC_REG_ENABLE of
the first core of target node, not the first core of the whole.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index 80d8ca6f2d46..317467857478 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -111,11 +111,15 @@ static int eiointc_set_irq_affinity(struct irq_data *d, const struct cpumask *af
 	regaddr = EIOINTC_REG_ENABLE + ((vector >> 5) << 2);
 
 	/* Mask target vector */
-	csr_any_send(regaddr, EIOINTC_ALL_ENABLE & (~BIT(vector & 0x1F)), 0x0, 0);
+	csr_any_send(regaddr, EIOINTC_ALL_ENABLE & (~BIT(vector & 0x1F)),
+			0x0, priv->node * CORES_PER_EIO_NODE);
+
 	/* Set route for target vector */
 	eiointc_set_irq_route(vector, cpu, priv->node, &priv->node_map);
+
 	/* Unmask target vector */
-	csr_any_send(regaddr, EIOINTC_ALL_ENABLE, 0x0, 0);
+	csr_any_send(regaddr, EIOINTC_ALL_ENABLE,
+			0x0, priv->node * CORES_PER_EIO_NODE);
 
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
 
-- 
2.31.1

