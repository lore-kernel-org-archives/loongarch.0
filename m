Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27C67172F
	for <loongarch@lists.linux.dev>; Tue, 26 Mar 2024 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711455098; cv=none; b=uygbHHDVXI1V0vfATis3tSztYCCxdpTdbYZYCjs+5T4GWAXi3CgayXAeYiXhqz4bNqSeRaRjK+w7nUZ7AnQs2CIMeZ5JBDIXNiToQ3Y30FR8HcVGEY17TRl0L+AGxDLZpZrP41q8+qjh6LyLz4gyJibmx8pabmLoM49iJR6tSLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711455098; c=relaxed/simple;
	bh=5m4BnN7yVidmxnCnJgX/ChA9bEUto3lM71CJzMUOCf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXSTuvE/k7yRWVKUS9fRe7NWvQC0j53Rs8lQDrjFd2L8LG/ax0MQPkjIGbyPJIBd51Q5a5K5A+XGpJGTrjRuyC8k51lY1B10++Z4cQ0N+x/8lC1LohrI7ZSGzP599sOSkWh4zl5tu7TNd1Zpbjp84y6yJCmO0NlRMpXi7tc+Srw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxK+l3uwJmBl0eAA--.53037S3;
	Tue, 26 Mar 2024 20:11:35 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxTs1zuwJm8eVoAA--.8693S5;
	Tue, 26 Mar 2024 20:11:34 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 3/3] irqchip: Set CPU affinity only on SMP machines for LoongArch
Date: Tue, 26 Mar 2024 20:11:30 +0800
Message-ID: <20240326121130.16622-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240326121130.16622-1-yangtiezhu@loongson.cn>
References: <20240326121130.16622-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxTs1zuwJm8eVoAA--.8693S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WrW3WrW8Zr4UAr1UJFWUGFX_yoW8Gw4fpr
	WUCFn0vr43Ja4UWr9YkayDJryakr9IqrW7taya9a97ZFZ8Ja1DWF4rAF9xZF10k3y8GF12
	gFs7WFW8ua15JwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU4AhLUUUUU

According to the code comment of "struct irq_chip" in include/linux/irq.h,
the member "irq_set_affinity" is to set the CPU affinity on SMP machines,
so define and call eiointc_set_irq_affinity() only under CONFIG_SMP.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index b64cbe3052e8..4f5e6d21d77d 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -59,6 +59,7 @@ static int cpu_to_eio_node(int cpu)
 	return cpu_logical_map(cpu) / CORES_PER_EIO_NODE;
 }
 
+#ifdef CONFIG_SMP
 static void eiointc_set_irq_route(int pos, unsigned int cpu, unsigned int mnode, nodemask_t *node_map)
 {
 	int i, node, cpu_node, route_node;
@@ -126,6 +127,7 @@ static int eiointc_set_irq_affinity(struct irq_data *d, const struct cpumask *af
 
 	return IRQ_SET_MASK_OK;
 }
+#endif
 
 static int eiointc_index(int node)
 {
@@ -238,7 +240,9 @@ static struct irq_chip eiointc_irq_chip = {
 	.irq_ack		= eiointc_ack_irq,
 	.irq_mask		= eiointc_mask_irq,
 	.irq_unmask		= eiointc_unmask_irq,
+#ifdef CONFIG_SMP
 	.irq_set_affinity	= eiointc_set_irq_affinity,
+#endif
 };
 
 static int eiointc_domain_alloc(struct irq_domain *domain, unsigned int virq,
-- 
2.42.0

