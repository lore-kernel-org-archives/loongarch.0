Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777D51925AB
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 02:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735524918; cv=none; b=EmFs8ZN8jG+blDsQYuGjViKLVmNECaBAQv7aC/wFcWj+d3/SEyG/X9YUtRR8rXIs/MSZzoNAV0i5eAp5Z6g3tVQaI6/oX0oCABrc6lfXvSixM3B2aHylFOPHPuxTLo96JtV2rlkkBw7/lYbr/6aIqghwiBZmd/cvt0Ug8Uh7QzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735524918; c=relaxed/simple;
	bh=Jqafyd9zY8TjYcsVNU4K5eexBduGf+gVBhzywrz8rEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ok265QMJB1T0SQjFwZF1BVhjLGkFCR+7n7oDXNJAQkx9jmwDsqzGJkSzOGCzwsNDx0KCttKa16gSrrOJPS3ZdI8QQbBRCeHKQHNISSkqThrW6Wl6D2zBRb6x8yHUMgQxAUiYwuf7/Ig2wQhryI77mdsvYfmcDkglYxPBvwrtVC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8CxMK8pAnJnpaVbAA--.25041S3;
	Mon, 30 Dec 2024 10:15:05 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMCx3sUpAnJnslANAA--.59268S2;
	Mon, 30 Dec 2024 10:15:05 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@linutronix.de
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH V2] irqchip/loongarch-avec:Add multi-nodes topology support
Date: Mon, 30 Dec 2024 10:15:03 +0800
Message-Id: <20241230021503.14012-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx3sUpAnJnslANAA--.59268S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFy3CF17Jr1xJw48Xr13GFX_yoW8try7pF
	W5Xasxtr4UKa4xur9xK34DXryfAF4xKrW7ta47Ka1fWFWDCryDury0qF98ZFy8u395Z3WF
	vr48JFWUu3W5ZacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=

avecintc_init() enables the Advanced Interrupt Controller (AVEC) of
the boot CPU node, but nothing enables the AVEC on secondary nodes.

Move the enablement to the CPU hotplug callback so that secondary
nodes get the AVEC enabled too. In theory enabling it once per node
would be sufficient, but redundant enabling does no hard, so keep the
code simple and do it unconditionally.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 0f6e465dd309..988d3e02ac54 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -56,6 +56,15 @@ struct avecintc_data {
 	unsigned int		moving;
 };
 
+static inline void avecintc_enable(void)
+{
+	u64 value;
+
+	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
+	value |= IOCSR_MISC_FUNC_AVEC_EN;
+	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
+}
+
 static inline void avecintc_ack_irq(struct irq_data *d)
 {
 }
@@ -127,6 +136,8 @@ static int avecintc_cpu_online(unsigned int cpu)
 
 	guard(raw_spinlock)(&loongarch_avec.lock);
 
+	avecintc_enable();
+
 	irq_matrix_online(loongarch_avec.vector_matrix);
 
 	pending_list_init(cpu);
@@ -339,7 +350,6 @@ static int __init irq_matrix_init(void)
 static int __init avecintc_init(struct irq_domain *parent)
 {
 	int ret, parent_irq;
-	unsigned long value;
 
 	raw_spin_lock_init(&loongarch_avec.lock);
 
@@ -378,14 +388,13 @@ static int __init avecintc_init(struct irq_domain *parent)
 				  "irqchip/loongarch/avecintc:starting",
 				  avecintc_cpu_online, avecintc_cpu_offline);
 #endif
-	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
-	value |= IOCSR_MISC_FUNC_AVEC_EN;
-	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
+	avecintc_enable();
 
 	return ret;
 
 out_remove_domain:
 	irq_domain_remove(loongarch_avec.domain);
+	loongarch_avec.domain = NULL;
 out_free_handle:
 	irq_domain_free_fwnode(loongarch_avec.fwnode);
 out:
-- 
2.20.1

