Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9DE17B436
	for <loongarch@lists.linux.dev>; Thu, 15 Aug 2024 07:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706150; cv=none; b=OzF7uoO6l4q9bLoZn+H/1p0aW4rAFFWz5bSl1IAkwCo57Baqd8DBRIhP+APCL0VqVS4++rdstoYS8ycs/mHd5OySEaSO1sSOy1cabLwZPZ9Ki/oztSb+tPyjyR2xIG/8sBTZznNnkNmpBIxKkL+top5Hp7jSL7JUDStkS8/l3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706150; c=relaxed/simple;
	bh=XwxX7wfC039v3HPoXz/Mn4ccT8GfN0n6+e/njz3hac8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JmdSKmaBCLOmvcmmtquCmNUNO22TzinDV4Yz5en2ZjlUuxBOBR54o1ZeEFme07jmoRAZMes4VOaJwdUF18mPVfQs0nRK/oNs3jNXw1nDr3OrIvGudfQlxVQldO3YqmIZStqP/po5fPdJtN1AMGkUfI/JLggusRIJPkOd3D/8oy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Dxi+oiq71mo4sUAA--.49241S3;
	Thu, 15 Aug 2024 15:15:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxG2chq71mlesUAA--.1465S4;
	Thu, 15 Aug 2024 15:15:46 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] LoongArch: KVM: Invalid guest steal time address on vCPU reset
Date: Thu, 15 Aug 2024 15:15:45 +0800
Message-Id: <20240815071545.925867-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240815071545.925867-1-maobibo@loongson.cn>
References: <20240815071545.925867-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxG2chq71mlesUAA--.1465S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

If paravirt steal time feature is enabled, there is percpu gpa address
passed from guest vcpu and host modified guest memory space with this gpa
address. When vcpu is reset normally, it will notify host and invalidate
gpa address.

However if VM is crashed and VMM reboots VM forcely, vcpu reboot
notification callback will not be called in VM, host needs invalid the
gpa address, else host will modify guest memory during VM reboots. Here it
is invalidated from vCPU KVM_REG_LOONGARCH_VCPU_RESET ioctl interface.

Also funciton kvm_reset_timer() is removed at vCPU reset stage, since SW
emulated timer is only used in vCPU block state. When vCPU is removed
from block waiting queue, kvm_restore_timer() is called and SW timer
is cancelled. And timer register is cleared at VMM when vCPU is reset.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/kvm_vcpu.h | 1 -
 arch/loongarch/kvm/timer.c            | 7 -------
 arch/loongarch/kvm/vcpu.c             | 2 +-
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/loongarch/include/asm/kvm_vcpu.h b/arch/loongarch/include/asm/kvm_vcpu.h
index c416cb7125c0..86570084e05a 100644
--- a/arch/loongarch/include/asm/kvm_vcpu.h
+++ b/arch/loongarch/include/asm/kvm_vcpu.h
@@ -76,7 +76,6 @@ static inline void kvm_restore_lasx(struct loongarch_fpu *fpu) { }
 #endif
 
 void kvm_init_timer(struct kvm_vcpu *vcpu, unsigned long hz);
-void kvm_reset_timer(struct kvm_vcpu *vcpu);
 void kvm_save_timer(struct kvm_vcpu *vcpu);
 void kvm_restore_timer(struct kvm_vcpu *vcpu);
 
diff --git a/arch/loongarch/kvm/timer.c b/arch/loongarch/kvm/timer.c
index bcc6b6d063d9..74a4b5c272d6 100644
--- a/arch/loongarch/kvm/timer.c
+++ b/arch/loongarch/kvm/timer.c
@@ -188,10 +188,3 @@ void kvm_save_timer(struct kvm_vcpu *vcpu)
 	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_ESTAT);
 	preempt_enable();
 }
-
-void kvm_reset_timer(struct kvm_vcpu *vcpu)
-{
-	write_gcsr_timercfg(0);
-	kvm_write_sw_gcsr(vcpu->arch.csr, LOONGARCH_CSR_TCFG, 0);
-	hrtimer_cancel(&vcpu->arch.swtimer);
-}
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 16756ffb55e8..6905283f535b 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -647,7 +647,7 @@ static int kvm_set_one_reg(struct kvm_vcpu *vcpu,
 				vcpu->kvm->arch.time_offset = (signed long)(v - drdtime());
 			break;
 		case KVM_REG_LOONGARCH_VCPU_RESET:
-			kvm_reset_timer(vcpu);
+			vcpu->arch.st.guest_addr = 0;
 			memset(&vcpu->arch.irq_pending, 0, sizeof(vcpu->arch.irq_pending));
 			memset(&vcpu->arch.irq_clear, 0, sizeof(vcpu->arch.irq_clear));
 			break;
-- 
2.39.3

