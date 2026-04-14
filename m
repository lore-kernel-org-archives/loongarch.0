Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497D02E8B81
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 07:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151401; cv=none; b=L4htpsCnr5dFWOaZzk7aRSASCLOspMxn+5iAFDxWKAO+Yq9vuHCeVlUIITpzxfVAHHpRYjOmzKzqeilAALAR7T0eWpfYRaiMXxT2FqR+3O54AXlgVTZ248GPiFonT+2HNv25MGNU1+yVT3RMc6/kUstzVrom2B8eUWPweoUa0WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151401; c=relaxed/simple;
	bh=m9vLfXkwAGNcbtz4PWLItZyVz3fDONiH0jAW58kcJVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F2IzE4zeoMtab1e3DX0rHHVdWHRox1ycUtpGhVhLZrfmsD0oZv1OD8BjqdzqWa+w3VpOcVPzVkaXVqKBZMMgeQMAdS1OqLUOPHa/gxNgUxWD9IwaRz2U4hJlRmh2gJVjuNuJ/FW2HU7MbC4+bJWZVwmljdcqPez/8+NzayRNBZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Dx8epk691p8WkAAA--.2095S3;
	Tue, 14 Apr 2026 15:23:16 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCxfcJi691pErxsAA--.8539S3;
	Tue, 14 Apr 2026 15:23:16 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] LoongArch: KVM: Move AVEC interrupt injection in switch loop
Date: Tue, 14 Apr 2026 15:23:11 +0800
Message-Id: <20260414072313.3801110-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260414072313.3801110-1-maobibo@loongson.cn>
References: <20260414072313.3801110-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxfcJi691pErxsAA--.8539S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

When AVEC interrupt controller is emulated in user space, AVEC interrupt
is injected by software like SIP0/IPI interrupt. Here move AVEC
interrupt injection in switch loop.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/interrupt.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/kvm/interrupt.c b/arch/loongarch/kvm/interrupt.c
index fb704f4c8ac5..f67dddfec7d0 100644
--- a/arch/loongarch/kvm/interrupt.c
+++ b/arch/loongarch/kvm/interrupt.c
@@ -32,12 +32,11 @@ static int kvm_irq_deliver(struct kvm_vcpu *vcpu, unsigned int priority)
 	if (priority < EXCCODE_INT_NUM)
 		irq = priority_to_irq[priority];
 
-	if (kvm_guest_has_msgint(&vcpu->arch) && (priority == INT_AVEC)) {
-		set_gcsr_estat(irq);
-		return 1;
-	}
-
 	switch (priority) {
+	case INT_AVEC:
+		if (!kvm_guest_has_msgint(&vcpu->arch))
+			break;
+		fallthrough;
 	case INT_TI:
 	case INT_IPI:
 	case INT_SWI0:
@@ -64,12 +63,11 @@ static int kvm_irq_clear(struct kvm_vcpu *vcpu, unsigned int priority)
 	if (priority < EXCCODE_INT_NUM)
 		irq = priority_to_irq[priority];
 
-	if (kvm_guest_has_msgint(&vcpu->arch) && (priority == INT_AVEC)) {
-		clear_gcsr_estat(irq);
-		return 1;
-	}
-
 	switch (priority) {
+	case INT_AVEC:
+		if (!kvm_guest_has_msgint(&vcpu->arch))
+			break;
+		fallthrough;
 	case INT_TI:
 	case INT_IPI:
 	case INT_SWI0:
-- 
2.39.3

