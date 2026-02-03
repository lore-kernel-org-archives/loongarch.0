Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3312345CCE
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122751; cv=none; b=Hu+YzcLikEwroI161lfAUhrhxrWufTiCNEfNYUqxTSLkZkyqLri5dV9MrXIrUn2QLvle8qSRij6xTisNp1KAmeqIa6gfXc10SK0iAzM3iorzHMZVCiXKBvl6MDwYQ0hHbwBArunFGy3im0AvFzHeOkLjwhhQdhASwjoVSM1KNUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122751; c=relaxed/simple;
	bh=HNfl+ZrVI6Imgnr5EyfuZXV9todIgL+lDA2rpp3/IvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pj4fgCQ/uC8y3xNNOUXXQFvMgUAyP8abPRYoDIGXARUwmOTy8hSWsYxwdyuJSOzhqAErHXhA2kuRHNOJ2Lw4vP3/NVivE8eaLJddJMSnb0yqrHHryTF+xgdmHnToQYg5ez/ewl1/yT7EjTbDlJURq/XbsAYsgSnzs/dGsy58AME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8DxecL37YFp2F0PAA--.49342S3;
	Tue, 03 Feb 2026 20:45:43 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJDxzsLk7YFp3Bc_AA--.51803S5;
	Tue, 03 Feb 2026 20:45:43 +0800 (CST)
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
Subject: [PATCH v11 3/4] irqchip/loongarch-avec.c: return IRQ_SET_MASK_OK_DONE when keep affinity
Date: Tue,  3 Feb 2026 20:45:20 +0800
Message-ID: <20260203124522.2288900-4-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260203124522.2288900-1-zhangtianyang@loongson.cn>
References: <20260203124522.2288900-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxzsLk7YFp3Bc_AA--.51803S5
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw1DGr4UZFWDtF1DZFW7WrX_yoW8ury5pa
	yUCa4qyrs8tF18Wa1DWaykZFy7Cr95CrWUt3WSk343Zr98G3yqgr13ta4F9FyrCws5Cw1j
	vrsIqrWUX3WDAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

Interrupt redirection support requires a new redirect-domain, which will
appear as a child domain of avecintc. For each interrupt source, avecintc-domain
only provides the CPU/interrupt vector, while redirect-domain provides other
operations to synchronize interrupt affinity information among multiple cores.

When modifying the affinity of an interrupt associated with redirect-domain,
if the avecintc domain detects that the actual interrupt affinity has not changed,
then redirect-domain does not need to perform any operations.

To achieve the above purpose, when it is detected in avecintc_set_affinity()
that the current affinity remains valid, the return value is modified to
IRQ_SET_MASK_OK_DONE.

However, this introduces some compatibility issues, such as the new return
value causing msi_domain_set_affinity() to no longer perform irq_chip_write_msi_msg().
  1) When redirect exist in the system, the msg_address and msg_data no longer
change after the allocation phase, so it does not actually require updating the
MSI message info.
  2) When only avecintc exists in the system, the irq_domain_activate_irq
interface will be responsible for the initial configuration of the MSI message,
which is unconditional. After that, if unnecessary, no modification to the MSI
message is alse correctly.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 70aa34439370..7bdf3f678db4 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -99,7 +99,7 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
 			return -EBUSY;
 
 		if (cpu_online(adata->cpu) && cpumask_test_cpu(adata->cpu, dest))
-			return 0;
+			return IRQ_SET_MASK_OK_DONE;
 
 		cpumask_and(&intersect_mask, dest, cpu_online_mask);
 
-- 
2.41.0

