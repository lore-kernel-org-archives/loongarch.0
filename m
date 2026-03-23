Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC75287257
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774234580; cv=none; b=sLh56Wo61HxXujjuaOeTGr1k7Tv6D3zyYp2P52kncbfz3fQY3ZU6nhVoo/Ik1erQDF8+mBvkpxr++1zAfb96EtYjEYzo3tgsKPOTWl4s7ScxrB3PvggWziF0yRCq8rliOz6ekY8PvQkIyqn6d03m/nkYiG0L4lazRmG7+neXvNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774234580; c=relaxed/simple;
	bh=CYX3G3ifnOGdRTffmuHm0LU74ney0de1dwmKeDVPgFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LGwECVumHkrzgv9LPqJJfhphO8wOHHB7nPd8G+vVVwyAK8MpxxmI8ZscAspQAFJ7qtaVll8UaSXxCC5ZLdKNtBEDh2FmV7+H95vHMfa6ALws0W1nR7v5h0ep+F9BOQt9sGk1t5g59/5cCbhEikiAKwpe+cQOXrzawYqhSvfgwrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Cx58HRq8Bpn6YdAA--.7528S3;
	Mon, 23 Mar 2026 10:56:17 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxbcLOq8Bpcg5bAA--.40805S4;
	Mon, 23 Mar 2026 10:56:16 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 2/4] LoongArch: KVM: Move host CSR_EENTRY save and restore in context switch
Date: Mon, 23 Mar 2026 10:56:11 +0800
Message-Id: <20260323025613.3260876-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260323025613.3260876-1-maobibo@loongson.cn>
References: <20260323025613.3260876-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxbcLOq8Bpcg5bAA--.40805S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

CSR register LOONGARCH_CSR_EENTRY is shared between host cpu and guest
vCPU, KVM need save and restore LOONGARCH_CSR_EENTRY register. Here move
CSR register LOONGARCH_CSR_EENTRY saving in context switch function,
rather than VM enter entry.

At most time VM enter/exit is much more frequent than vCPU thread context
switch.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 028eb3d5a33b..e82b2c84ce17 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -319,7 +319,6 @@ static int kvm_pre_enter_guest(struct kvm_vcpu *vcpu)
 		 * and it may also clear KVM_REQ_TLB_FLUSH_GPA pending bit
 		 */
 		kvm_late_check_requests(vcpu);
-		vcpu->arch.host_eentry = csr_read64(LOONGARCH_CSR_EENTRY);
 		/* Clear KVM_LARCH_SWCSR_LATEST as CSR will change when enter guest */
 		vcpu->arch.aux_inuse &= ~KVM_LARCH_SWCSR_LATEST;
 
@@ -1624,9 +1623,11 @@ static int _kvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	 * If not, any old guest state from this vCPU will have been clobbered.
 	 */
 	context = per_cpu_ptr(vcpu->kvm->arch.vmcs, cpu);
-	if (migrated || (context->last_vcpu != vcpu))
+	if (migrated || (context->last_vcpu != vcpu)) {
 		vcpu->arch.aux_inuse &= ~KVM_LARCH_HWCSR_USABLE;
-	context->last_vcpu = vcpu;
+		context->last_vcpu = vcpu;
+		vcpu->arch.host_eentry = csr_read64(LOONGARCH_CSR_EENTRY);
+	}
 
 	/* Restore timer state regardless */
 	kvm_restore_timer(vcpu);
-- 
2.39.3

