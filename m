Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8209F238C1B
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 03:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734087; cv=none; b=T9hGYu/OPIKDbi3ATh3LyLCv0oSQPENbPSNcpmHvudH1rVZ4p+/D1Lldx3/FQRyc4NCSi+cyHeAKcMmVfcCLwjsalCgE2Pfd1Sp2eJSU4dlWv1WYU877HsPRwNH6/ghDHF7NWGePqIGuyicm3+kodKywhrkMSnHEVYppkVXIG9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734087; c=relaxed/simple;
	bh=PpHY91uC6qS2wzc2kIKvhJjsJ0LcH5h48gz1zsAHYro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gq3dhFmGCzoSuPZqOUbCyjjhVRyVZRDcNH+23wxQ8qOtD++A2A9Gt3eqPpLypO2xlfd7Vj/Jx/1hQy++25cN4PfIzyMlTjuPusk9w+hkQxe3+QSAqpFPyRj4iPoumcIfXeWNI9rTKQs9vPrxj166mweFMcb2CX/WLLIUmgqjl64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8AxRNB_tC9pS5MqAA--.25326S3;
	Wed, 03 Dec 2025 11:54:39 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJBxpeRvtC9pdtVEAQ--.50913S6;
	Wed, 03 Dec 2025 11:54:38 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	akpm@linux-foundation.org,
	willy@infradead.org,
	david@redhat.com,
	linmag7@gmail.com,
	thuth@redhat.com,
	maobibo@loongson.cn,
	apopple@nvidia.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v7 4/5] irqchip/loongarch-avec.c:return IRQ_SET_MASK_OK_DONE when keep affinity
Date: Wed,  3 Dec 2025 11:54:20 +0800
Message-ID: <20251203035422.32205-5-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20251203035422.32205-1-zhangtianyang@loongson.cn>
References: <20251203035422.32205-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeRvtC9pdtVEAQ--.50913S6
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4UCF4rKF4fAryfuryrXwc_yoW8CF4rpF
	WUCa4qyr4ktFyUWF4DWa18ZFy5Cr95W3y7K3WfC343ZrZ8G3yqgr1Yy34F9FyrCws5C3W2
	qrsFqrW5ua45AagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY
	6Fy7McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxUcQ6JUUUUU

When it is detected in avecintc_set_affinity that the current affinity
remains valid, the return value is modified to IRQ_SET_MASK_OK_DONE.

After the introduction of redirect-domain, for each interrupt source,
avecintc-domain only provides the CPU/interrupt vector, while redirect-domain
provides other operations to synchronize interrupt affinity information
among multiple cores. The original intention is to notify the cascaded
redirect_set_affinity that multi-core synchronization is not required.

However, this introduces some compatibility issues, such as the new return
value causing msi_domain_set_affinity to no longer perform irq_chip_write_msi_msg.
  1) When redirect exist in the system, the msi msg_address and msg_data no
longer changes after the allocation phase, so it does not actually require updating
the MSI message info.
  2) When only avecintc exists in the system, the irq_domain_activate_irq
interface will be responsible for the initial configuration of the MSI message,
which is unconditional. After that, if unnecessary, no modification to the MSI
message is alse correctly.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 514ad8dedc46..ac8c423e411e 100644
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

