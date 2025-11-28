Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC430305E2D
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322563; cv=none; b=VrhcowqeqAkxN0Ges0SmyI4x7m9JRrj+o27yOwTdFRNSJm/pj3s2ToRy0lh62NE33sp7i8emsZTRWSR0bVS6pMbfwQZQ8Cj/q+qHcpmeATT0moCGjQSZKAY1HV08DHFGf95M5SNeZ+a6KR9WuFX6ZK+Bi5cBMIuZyeyO+Kf6LP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322563; c=relaxed/simple;
	bh=pX474aXD6ixPIpIVrAhMvFxXS0vaXyAVl4RUUhzVnJc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xr/nT6DBfdeHcpfN7HeFFGw09nXvl7qy5OS9Wma/+0WwoF27bAkgjXnUmgetP93M4mKiqqcoPe/qUIzAlpFfpNVSS1FcvHumrUco2/QGVpIUnkM3UBTh2w0YXvpmSF5OtzNaO80RNCkNB76raGe6nzrfQiNWK11y8QLb0JXVyQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8Bx1tDvbClpRw8pAA--.22932S3;
	Fri, 28 Nov 2025 17:35:43 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by front1 (Coremail) with SMTP id qMiowJCx2sDtbClpo+xBAQ--.23356S5;
	Fri, 28 Nov 2025 17:35:43 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] LongArch: KVM: Add irqfd set dintc msi
Date: Fri, 28 Nov 2025 17:11:24 +0800
Message-Id: <20251128091125.2720148-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20251128091125.2720148-1-gaosong@loongson.cn>
References: <20251128091125.2720148-1-gaosong@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx2sDtbClpo+xBAQ--.23356S5
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Add irqfd choice dintc to set msi irq by the msg_addr and
implement dintc set msi irq.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 arch/loongarch/include/asm/kvm_dintc.h |  1 +
 arch/loongarch/kvm/intc/dintc.c        |  6 ++++++
 arch/loongarch/kvm/irqfd.c             | 28 +++++++++++++++++++++++++-
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/kvm_dintc.h b/arch/loongarch/include/asm/kvm_dintc.h
index d980d39c0344..f87fb802a7bf 100644
--- a/arch/loongarch/include/asm/kvm_dintc.h
+++ b/arch/loongarch/include/asm/kvm_dintc.h
@@ -11,6 +11,7 @@ struct loongarch_dintc  {
 	struct kvm *kvm;
 	uint64_t msg_addr_base;
 	uint64_t msg_addr_size;
+	uint32_t cpu_mask;
 };
 
 struct dintc_state {
diff --git a/arch/loongarch/kvm/intc/dintc.c b/arch/loongarch/kvm/intc/dintc.c
index d30616ded1b1..ae0d61e2b8f0 100644
--- a/arch/loongarch/kvm/intc/dintc.c
+++ b/arch/loongarch/kvm/intc/dintc.c
@@ -15,6 +15,7 @@ static int kvm_dintc_ctrl_access(struct kvm_device *dev,
 	void __user *data;
 	struct loongarch_dintc *s = dev->kvm->arch.dintc;
 	u64 tmp;
+	u32 cpu_bit;
 
 	data = (void __user *)attr->addr;
 	switch (addr) {
@@ -30,6 +31,11 @@ static int kvm_dintc_ctrl_access(struct kvm_device *dev,
 				s->msg_addr_base = tmp;
 			else
 				return  -EFAULT;
+			s->msg_addr_base = tmp;
+			cpu_bit = find_first_bit((unsigned long *)&(s->msg_addr_base), 64)
+						- AVEC_CPU_SHIFT;
+			cpu_bit = min(cpu_bit, AVEC_CPU_BIT);
+			s->cpu_mask = GENMASK(cpu_bit - 1, 0) & AVEC_CPU_MASK;
 		}
 		break;
 	case KVM_DEV_LOONGARCH_DINTC_MSG_ADDR_SIZE:
diff --git a/arch/loongarch/kvm/irqfd.c b/arch/loongarch/kvm/irqfd.c
index 9a39627aecf0..fdcce472abb1 100644
--- a/arch/loongarch/kvm/irqfd.c
+++ b/arch/loongarch/kvm/irqfd.c
@@ -6,6 +6,7 @@
 #include <linux/kvm_host.h>
 #include <trace/events/kvm.h>
 #include <asm/kvm_pch_pic.h>
+#include <asm/kvm_vcpu.h>
 
 static int kvm_set_pic_irq(struct kvm_kernel_irq_routing_entry *e,
 		struct kvm *kvm, int irq_source_id, int level, bool line_status)
@@ -16,6 +17,22 @@ static int kvm_set_pic_irq(struct kvm_kernel_irq_routing_entry *e,
 	return 0;
 }
 
+static int kvm_dintc_set_msi_irq(struct kvm *kvm, u32 addr, int data, int level)
+{
+	unsigned int virq, dest;
+	struct kvm_vcpu *vcpu;
+
+	virq = (addr >> AVEC_VIRQ_SHIFT) & AVEC_VIRQ_MASK;
+	dest = (addr >> AVEC_CPU_SHIFT) & kvm->arch.dintc->cpu_mask;
+	if (dest > KVM_MAX_VCPUS)
+		return -EINVAL;
+	vcpu = kvm_get_vcpu_by_cpuid(kvm, dest);
+	if (!vcpu)
+		return -EINVAL;
+	return kvm_loongarch_deliver_msi_to_vcpu(kvm, vcpu, virq, level);
+}
+
+
 /*
  * kvm_set_msi: inject the MSI corresponding to the
  * MSI routing entry
@@ -26,10 +43,19 @@ static int kvm_set_pic_irq(struct kvm_kernel_irq_routing_entry *e,
 int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
 		struct kvm *kvm, int irq_source_id, int level, bool line_status)
 {
+	u64 msg_addr;
+
 	if (!level)
 		return -1;
 
-	pch_msi_set_irq(kvm, e->msi.data, level);
+	msg_addr = (((u64)e->msi.address_hi) << 32) | e->msi.address_lo;
+	if (cpu_has_msgint && kvm->arch.dintc &&
+		msg_addr >= kvm->arch.dintc->msg_addr_base &&
+		msg_addr < (kvm->arch.dintc->msg_addr_base  + kvm->arch.dintc->msg_addr_size)) {
+		return kvm_dintc_set_msi_irq(kvm, msg_addr, e->msi.data, level);
+	} else if (msg_addr == 0) {
+		pch_msi_set_irq(kvm, e->msi.data, level);
+	}
 
 	return 0;
 }
-- 
2.39.3

