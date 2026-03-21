Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0F435A399
	for <loongarch@lists.linux.dev>; Sat, 21 Mar 2026 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774084855; cv=none; b=fiwQ2zHQeksS7ohDtyYHlWnC+E9fXDmJaW/HpP1VI+Nz+lz7Ug9Vp5BbtnFkQlQPzDfHH3pnNFRkzGyWvihs2erotLKXv/eUc8kOuiFYYqhGxMBKx7beTF8ZzwCaKN3j9VMQYNmQzWpwJnmzGF/oid9FkIZ+olbbRDv3nAUbrnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774084855; c=relaxed/simple;
	bh=qwCIjge7tgqU1rnbCpHv4DaFKFvWe3Z+9plP04qelXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWXKELtIsYp9ksTfOnaSa8SW2I8wPFfDH1jJxO5jmMqV4Slsef04u2x5juJo8FQNjjJrfOS3zBPx8hrT7fdN/Kgm4gDRZF8ceaKa0Wr4C9Ew9Hg09Bw+ZXrYmmD6VNjkQO8J1QxfRAxsgtMBwsnQ2woOTAAluoookVr1E2kbDpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.202])
	by APP-01 (Coremail) with SMTP id qwCowAA33mnjYr5p3aWyCg--.465S4;
	Sat, 21 Mar 2026 17:20:39 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v4 2/6] LoongArch: Override arch_dynirq_lower_bound to reserve LPC IRQs
Date: Sat, 21 Mar 2026 17:20:28 +0800
Message-ID: <20260321092032.3502701-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA33mnjYr5p3aWyCg--.465S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WryrCFyfXFW5ZrW5ZF4UXFb_yoW8WFy8pF
	ZF9F4qqr4rGrWUX3W5Aw1Fvr98Aa4kWw17u3ZFv34xZrnFqr1vgwn5XF93XFy0g39Ygayj
	9F1fuayYgFWDAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUQXo7UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Loongson 7A PCH chips all contain a LPC controller, which is used in
some devices to connect legacy ISA devices (e.g. 8259 PS/2 controller).

The LPC irqchip driver will register LPC interrupts at the fixed range
0~15, and the PCH PIC irqchip driver uses dynamic allocation. However the
LPC interrupt numbers are currently not exempted from dynamic allocation.

The currently setup work by accident because the LPC interrupt controller
is the first consumer of PIC interrupt controller, and the PIC interrupt
number is allocated after LPC interrupts are registered. Such setup is
fragile and will stop to work when the LPC irqchip driver is reworked.

Override arch_dynirq_lower_bound() to reserve LPC interrupts from dynamic
allocation, to prevent interrupt number collision and allow rework of the
LPC irqchip driver.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/loongarch/kernel/irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/irq.c b/arch/loongarch/kernel/irq.c
index 80946cafaec1b..7bf68a7a5f4b3 100644
--- a/arch/loongarch/kernel/irq.c
+++ b/arch/loongarch/kernel/irq.c
@@ -11,6 +11,7 @@
 #include <linux/irqchip.h>
 #include <linux/kernel_stat.h>
 #include <linux/proc_fs.h>
+#include <linux/minmax.h>
 #include <linux/mm.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
@@ -99,6 +100,11 @@ int __init arch_probe_nr_irqs(void)
 	return NR_IRQS_LEGACY;
 }
 
+unsigned int arch_dynirq_lower_bound(unsigned int from)
+{
+	return MAX(from, NR_IRQS_LEGACY);
+}
+
 void __init init_IRQ(void)
 {
 	int i;
-- 
2.52.0

