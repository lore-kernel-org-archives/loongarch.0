Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735DD423A93
	for <loongarch@lists.linux.dev>; Tue, 19 May 2026 09:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183795; cv=none; b=Sy5VUtIwlX9t2rn8aI9vBm8erBboSPvg/bsOdo1pqJB28GNKbMZRkiuHXOFuU2snBCK7bUZgdtArMnfI3F1UbkftgNGYdg58jEG7sZ/1yuOTSpamHX3XFHrQidQ0scWbl+1c2jX68AQEqJ27zUhS3DPzdBKv6nA6o/duUG9VsMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183795; c=relaxed/simple;
	bh=puOjYzOYbfWUquTwaY+4NvqFPP/PWHlenMePqy220Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P0mUaGx8FnCBmZF0mzkTFC1qNiYVYONKmxnuuAW0xbzOCeQLzctp8maJiX3gplfdbShoTQiosRLlNL8R9lLvEPNlvWMI6NLcdSgoL8ARhRi9v96KBG290YxgJm81MBu3wLkWiJzVTpQJoNg7XrfLfoyyzWXghtiNPVYSbzINQtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bx+HivMAxqYC0LAA--.8422S3;
	Tue, 19 May 2026 17:43:11 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAxHMKtMAxqjD6IAA--.61010S4;
	Tue, 19 May 2026 17:43:11 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] LoongArch: KVM: Check msgint feature in interrupt post
Date: Tue, 19 May 2026 17:43:04 +0800
Message-Id: <20260519094308.3983046-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260519094308.3983046-1-maobibo@loongson.cn>
References: <20260519094308.3983046-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxHMKtMAxqjD6IAA--.61010S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Interrupt AVEC is valid only if VM has msgint feature, and this feature
is checked in interrupt handling. Since interrupt handling is executing
in VM context switch, and it is hot path, here move the feature checking
in interrupt post rather than interrupt handling.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/interrupt.c |  5 -----
 arch/loongarch/kvm/vcpu.c      | 10 +++++-----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/kvm/interrupt.c b/arch/loongarch/kvm/interrupt.c
index a18c60dffbba..48dd56aa4dc5 100644
--- a/arch/loongarch/kvm/interrupt.c
+++ b/arch/loongarch/kvm/interrupt.c
@@ -36,8 +36,6 @@ static int kvm_irq_deliver(struct kvm_vcpu *vcpu, unsigned int priority)
 
 	switch (priority) {
 	case INT_AVEC:
-		if (!kvm_guest_has_msgint(&vcpu->arch))
-			break;
 		dmsintc_inject_irq(vcpu);
 		fallthrough;
 	case INT_TI:
@@ -75,9 +73,6 @@ static int kvm_irq_clear(struct kvm_vcpu *vcpu, unsigned int priority)
 
 	switch (priority) {
 	case INT_AVEC:
-		if (!kvm_guest_has_msgint(&vcpu->arch))
-			break;
-		fallthrough;
 	case INT_TI:
 	case INT_IPI:
 	case INT_SWI0:
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 673977a25138..c6bcad1dd9e2 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1495,14 +1495,14 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
 	if (vector >= EXCCODE_INT_NUM)
 		return -EINVAL;
 
-	if (intr > 0)
+	if (!kvm_guest_has_msgint(&vcpu->arch) && (vector == INT_AVEC))
+		return -EINVAL;
+
+	/* Clear irq function with intr == 0 is missing... */
+	if (intr >= 0)
 		kvm_queue_irq(vcpu, intr);
 	else if (intr < 0)
 		kvm_dequeue_irq(vcpu, -intr);
-	else {
-		kvm_err("%s: invalid interrupt ioctl %d\n", __func__, irq->irq);
-		return -EINVAL;
-	}
 
 	kvm_vcpu_kick(vcpu);
 
-- 
2.39.3

