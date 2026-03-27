Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDE13A0B2B
	for <loongarch@lists.linux.dev>; Fri, 27 Mar 2026 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601241; cv=none; b=OpLWzzUuBp3D48IhQ7M/+WamPKvrOM32QYBezrBdBoXSgP6gT1QSFoQs3P86cu++h5WW0plH51HCr/a2DRZ60jaqczj332HvoidP9fsrID8Gx1aq/7vVBtBXneqEi5+O+291gz1WTfqilJoWwyBdG/CYvvbRS7hcQ1iKuFCyZ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601241; c=relaxed/simple;
	bh=TdagGWkVKdOB2FB7rtgDLzTRoWcGbugJNdmrD6BKscc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fMbi6JjhchfXTOGdib6vcDr9Y7N3u/dB4Ja7s5TjJsakPY4mPPjvA9bR5wveFoNSSuBymmKeoSAdjmw0UUuOYd/R1PKuOXDGl7LbhSwg4x8s6CnQ3wmPvk4GM2BZx1EfMORespTBiJaX9udT96G/Gd09jNa4u90fB0A+pIgPLCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8Bx08AURMZp_DofAA--.30160S3;
	Fri, 27 Mar 2026 16:47:16 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJAx18ANRMZpFLReAA--.34869S2;
	Fri, 27 Mar 2026 16:47:15 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH for 6.12] Revert "LoongArch: Add machine_kexec_mask_interrupts() implementation"
Date: Fri, 27 Mar 2026 16:47:01 +0800
Message-ID: <20260327084701.2692699-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx18ANRMZpFLReAA--.34869S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw4xGr1DCF17JrW5Gw4DGFX_yoW8JFWkpF
	WfAw1DJr45WwsIvF1kJ3s7WF15G34DG3y2qa4rKF1fW3WqkwnYq3WkAr1vqFyjyrWYqryS
	9rZYqa4IqF1UJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=

This reverts commit 429bf3f04c24a1590ed18cd7bf802cf63f937a0f.

6.12.78 bakported "kexec: Consolidate machine_kexec_mask_interrupts()
implementation" so the arch-specific implementation is redundant.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/machine_kexec.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index 19bd763263d3..8ef4e4595d61 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -136,28 +136,6 @@ void kexec_reboot(void)
 	BUG();
 }
 
-static void machine_kexec_mask_interrupts(void)
-{
-	unsigned int i;
-	struct irq_desc *desc;
-
-	for_each_irq_desc(i, desc) {
-		struct irq_chip *chip;
-
-		chip = irq_desc_get_chip(desc);
-		if (!chip)
-			continue;
-
-		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
-			chip->irq_eoi(&desc->irq_data);
-
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
-	}
-}
 
 #ifdef CONFIG_SMP
 static void kexec_shutdown_secondary(void *regs)
-- 
2.52.0

