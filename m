Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521C823AD
	for <loongarch@lists.linux.dev>; Sat, 11 Jan 2025 02:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736563037; cv=none; b=JtXJQ+ctII5MLYy0pnKRb18BY61Z8VNOzGEYLG2rqQBkhdACDUA3/4oGlYiw/soLvpb45EMSZcCG2d3/2ZMq1TlIzXxLiOkMNZG3Mx8ssIG3LmnezD3vJFA64bUv71XL6rUHJIo4BsbNErcodgEEoaw70a19k3a/D7I3MDlM3As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736563037; c=relaxed/simple;
	bh=dVC+wsndEO777N/Fod5SBHu72GjUOrn5ggSIXAd/e1M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Goj7Q+OC96VZyKw5ZUYCFy0yp1jUyLJ7tUDj2twgse2nu3CblG+a3kRFqt8cigs854MOpTuuRGEIUP/vfGnE3mLBwkeMQcfuMyXnewSHT89MUWMUsLyc9SU6MfprNDqnUDwjyFqh1rHXotI8hgavfcf5294F/yJFDwjXK7f93rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8AxQK1S2YFnBnFhAA--.20751S3;
	Sat, 11 Jan 2025 10:37:06 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMBxXcdR2YFnPCQdAA--.54434S2;
	Sat, 11 Jan 2025 10:37:05 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@linutronix.de
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH V3] irqchip/loongarch-avec:Add multi-nodes topology support
Date: Sat, 11 Jan 2025 10:37:04 +0800
Message-Id: <20250111023704.17285-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXcdR2YFnPCQdAA--.54434S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFy3CF17Jr1xJw48ZFy3KFX_yoW8ZFyDpF
	W5Xa4Dtr4UKa4xWr9xK34DXry3ZF4xKrW7ta4xGa1fXFWDCryUury0qr98ZFy8u3ykZ3WF
	9r48JFyUu3W5Z3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

avecintc_init() enables the Advanced Interrupt Controller (AVEC) of
the boot CPU node, but nothing enables the AVEC on secondary nodes.

Move the enablement to the CPU hotplug callback so that secondary
nodes get the AVEC enabled too. In theory enabling it once per node
would be sufficient, but redundant enabling does no hard, so keep the
code simple and do it unconditionally.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 0f6e465dd309..80e55955a29f 100644
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
 
@@ -378,9 +388,7 @@ static int __init avecintc_init(struct irq_domain *parent)
 				  "irqchip/loongarch/avecintc:starting",
 				  avecintc_cpu_online, avecintc_cpu_offline);
 #endif
-	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
-	value |= IOCSR_MISC_FUNC_AVEC_EN;
-	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
+	avecintc_enable();
 
 	return ret;
 
-- 
2.20.1

