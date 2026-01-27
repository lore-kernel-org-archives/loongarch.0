Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D67934DB59
	for <loongarch@lists.linux.dev>; Tue, 27 Jan 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518293; cv=none; b=Q9fEQ/BiGo+duLJdWV2urq4zTooHdOtj2ubSfJupLiYfajq6KNK2RM/d0ezM41obPx8kTnCAxBMXAb+zs7h+QenBzdummpfjQnSvPFv/tExOIR5SzES1c8DA+f6QYNgPPwtRAIzvM2p2qUlemra5T/OSZs/IombsJLC50mY6AqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518293; c=relaxed/simple;
	bh=IdLW44VGZExsGvqUufz+gqPKgso8L+J5SayaiaaCZhY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uMv+6d7in6WOUiz3RF8fyLLd4bQnFMgdovwF471cmWYineX39Nbk9KHwPWhaSzZsuVXEPN/tfWWREM14TxN7nPtvsJJlq9d5aLlCO1uhjLHDqEu0UhGKuXKX1sUCBZDa4cIxzkcXabtvDLxyNX0n8gcJP2qzotd7LRMWRalP/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Cx58HOtHhpMB4NAA--.30802S3;
	Tue, 27 Jan 2026 20:51:26 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAxWcHMtHhpYpo0AA--.24006S4;
	Tue, 27 Jan 2026 20:51:26 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH v2 2/3] LoongArch: KVM: Move LASX capability check in LASX exception handler
Date: Tue, 27 Jan 2026 20:51:23 +0800
Message-Id: <20260127125124.3234252-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260127125124.3234252-1-maobibo@loongson.cn>
References: <20260127125124.3234252-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxWcHMtHhpYpo0AA--.24006S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Like FPU exception handler, check LASX capability in LASX exception
handler rather than function kvm_own_lasx(). LASX capability in function
kvm_guest_has_lasx() implies FPU and LSX capability, only checking
kvm_guest_has_lasx() is ok here.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/exit.c | 4 +++-
 arch/loongarch/kvm/vcpu.c | 3 ---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
index 76eec3f24953..74b427287e96 100644
--- a/arch/loongarch/kvm/exit.c
+++ b/arch/loongarch/kvm/exit.c
@@ -810,8 +810,10 @@ static int kvm_handle_lsx_disabled(struct kvm_vcpu *vcpu, int ecode)
  */
 static int kvm_handle_lasx_disabled(struct kvm_vcpu *vcpu, int ecode)
 {
-	if (kvm_own_lasx(vcpu))
+	if (!kvm_guest_has_lasx(&vcpu->arch))
 		kvm_queue_exception(vcpu, EXCCODE_INE, 0);
+	else
+		kvm_own_lasx(vcpu);
 
 	return RESUME_GUEST;
 }
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index aff295aa6b0b..d91a1160a309 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1391,9 +1391,6 @@ int kvm_own_lsx(struct kvm_vcpu *vcpu)
 /* Enable LASX and restore context */
 int kvm_own_lasx(struct kvm_vcpu *vcpu)
 {
-	if (!kvm_guest_has_fpu(&vcpu->arch) || !kvm_guest_has_lsx(&vcpu->arch) || !kvm_guest_has_lasx(&vcpu->arch))
-		return -EINVAL;
-
 	preempt_disable();
 
 	kvm_check_fcsr(vcpu, vcpu->arch.fpu.fcsr);
-- 
2.39.3

