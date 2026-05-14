Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB473C4544
	for <loongarch@lists.linux.dev>; Thu, 14 May 2026 06:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778740111; cv=none; b=BBk7kuQnL1g+FH5QxKisouiErij0wRMcvjIdmGgk+pdvcx+JcCgYV2/o05CV6aOSyJbqQhWGP9XNNvrw+ZkxPy2XI1m93I9Jd2UZnjqNerXB5+N72Va2MwZt4OVQuMAv/HTX+RwwoMnrgLtzDtLePAeWqFxRUOptYo79wQVwPaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778740111; c=relaxed/simple;
	bh=1Z45y6YkvajUY4vScnh8VyWtFxSWdQ8zz7hnto/hpgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9BqRBKcJQLW/p0161Aw4+Z944D9vHtnH+PgqYhGZL8NKzvVTOCQzzK8sVFxSCbA/dOhuyGiYQthfov9ydT6CgDRS1UNU/TRPheCi55DCpg4BNz6uCMcZXwKrSfXoUv792FgocXj3uTimpldZW5N7eZjCScT3E+kqTWnRWMQlps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxFOiKawVqSbwJAA--.23517S3;
	Thu, 14 May 2026 14:28:26 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCxfcKJawVqIQqCAA--.48503S3;
	Thu, 14 May 2026 14:28:26 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] LoongArch: KVM: Check irq validility in kvm_vcpu_ioctl_interrupt()
Date: Thu, 14 May 2026 14:28:20 +0800
Message-Id: <20260514062824.1378373-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260514062824.1378373-1-maobibo@loongson.cn>
References: <20260514062824.1378373-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxfcKJawVqIQqCAA--.48503S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Function kvm_vcpu_ioctl_interrupt() can be called from userspace, here
add irq validility cheking in kvm_vcpu_ioctl_interrupt(). Also add
msgint feature checking if irq number is INT_AVEC.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/interrupt.c |  5 -----
 arch/loongarch/kvm/vcpu.c      | 22 +++++++++++++++-------
 2 files changed, 15 insertions(+), 12 deletions(-)

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
index e28084c49e68..dc2a1f56650b 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1487,15 +1487,23 @@ void kvm_lose_fpu(struct kvm_vcpu *vcpu)
 int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
 {
 	int intr = (int)irq->irq;
+	int vector;
 
-	if (intr > 0)
-		kvm_queue_irq(vcpu, intr);
-	else if (intr < 0)
-		kvm_dequeue_irq(vcpu, -intr);
-	else {
-		kvm_err("%s: invalid interrupt ioctl %d\n", __func__, irq->irq);
+	vector = intr;
+	if (intr < 0)
+		vector = -intr;
+
+	if (vector >= EXCCODE_INT_NUM)
 		return -EINVAL;
-	}
+
+	if (!kvm_guest_has_msgint(&vcpu->arch) && (vector == INT_AVEC))
+		return -EINVAL;
+
+	/* Clear irq function with intr == 0 is missing... */
+	if (intr >= 0)
+		kvm_queue_irq(vcpu, vector);
+	else
+		kvm_dequeue_irq(vcpu, vector);
 
 	kvm_vcpu_kick(vcpu);
 
-- 
2.39.3

