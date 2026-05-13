Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C16357CF6
	for <loongarch@lists.linux.dev>; Wed, 13 May 2026 01:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778635767; cv=none; b=PO6DXOrtSq38mKvd6iYRt2s8DXtOixd4IKVB94+wJv2B2aPRRf8TMtQgadN18mjR2tRFVMYbMaA5RWzwg1imkFkDeOtEWkD/kVpnUEJPSDFl7H2Cf9ISaJuAYpaLp7kGrGoDXbtBNrqZzyJLht0SDqq9PTLhKTDQvLOD8zfn71w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778635767; c=relaxed/simple;
	bh=0kmaxOqIGxPb1i2rjhYF4aBoqCyPEQj4G7p5CqQAk3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXjPRsi2vPIzwz+oNhEjW6ZZEEztJJBIlUz+GeGKDRn9Q+Axa65X2TchKwKFvfqqnWbpfzjDou7W4tG1Y7VtRJTD3iVEPtW4nXtxih1lhfMq137sW+51G9Hg+e2zYtj3oqufNvJaR2f7sK5LZslSXspbs5jPKN3yhkxhtZb2DnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8DxEvDu0wNqGVgJAA--.28588S3;
	Wed, 13 May 2026 09:29:18 +0800 (CST)
Received: from localhost.cn (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJCxOMHJ0wNqr7eAAA--.34539S5;
	Wed, 13 May 2026 09:29:18 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	maobibo@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v12 3/4] irqchip/loongarch-avec: Return IRQ_SET_MASK_OK_DONE when keep affinity
Date: Wed, 13 May 2026 09:28:34 +0800
Message-ID: <20260513012839.2856463-4-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260513012839.2856463-1-zhangtianyang@loongson.cn>
References: <20260513012839.2856463-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMHJ0wNqr7eAAA--.34539S5
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryUGrWUtw1kGrWxZFWDAwc_yoW8uF15pF
	WUCFyUArs8tF4UWF1qgaykZFy5CFyrG3y7K3WSkw17Zr98W3yqgr1aqa4ruFyrGws5Cw1j
	vr4aqFWUW3WDZagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

Interrupt redirection support requires a new redirect domain, which will
appear as a child domain of avecintc domain. For each interrupt source,
avecintc domain only provides the CPU/interrupt vectors, while redirect
domain provides other operations to synchronize the interrupt affinity
information among multiple cores.

When modifying the affinity of an interrupt associated with the redirect
domain, if the avecintc domain detects that the actual interrupt affinity
hasn't been changed, then the redirect domain doesn't need to perform any
operations.

To achieve the above purpose, in avecintc_set_affinity() when the current
affinity remains valid, then return value is set to IRQ_SET_MASK_OK_DONE.

This doesn't introduce any compatibility issues, even if the new return
value causing msi_domain_set_affinity() to no longer perform the call to
irq_chip_write_msi_msg().

1) When both avecintc and redirect exist in the system, the msg_address
and msg_data no longer change after the allocation phase, so it does not
actually require updating the MSI message info.

2) When only avecintc exists in the system, the irq_domain_activate_irq()
interface will be responsible for the initial configuration of the MSI
message info, which is unconditional. After that, if unnecessary, there
is no modification to the MSI message info.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 2817339e1080..4896ff7637c4 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -101,7 +101,7 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
 			return -EBUSY;
 
 		if (cpu_online(adata->cpu) && cpumask_test_cpu(adata->cpu, dest))
-			return 0;
+			return IRQ_SET_MASK_OK_DONE;
 
 		cpumask_and(&intersect_mask, dest, cpu_online_mask);
 
-- 
2.20.1

