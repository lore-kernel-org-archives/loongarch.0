Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6913618D65A;
	Tue,  1 Oct 2024 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727777585; cv=none; b=o3Rw9CbZ/h29R58c5VxMUL5TI0x6eA4sFrYirJcXbFGtOXbRmkLFe5g9s9rQRIFoov0oBiujHS+cHbdPh6xBgG3fODud/cWm8WWFJnjE7WfJUBlTzhaK5AEzi7DHvh6+goJw1+4IWuW+D6AhbL5bZpwmwPvDznumtN2Zg/pkX9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727777585; c=relaxed/simple;
	bh=S2QNkiNDX9hochvJg5dHvSR1anTUf+BSH20bSbq+6ak=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=JmMxgrvYi4E+cK/RjucIduPaT/qMO+MmBbGcjox2P1leG+gVZTvMjcjpXXKQSc++yBaPLs5V6b1l2JZzkAvX3WHO9ahPXXgnTqhZTlwSFcicqEuQzIJu1Wfi383E7e4BhRy9Ucr76mfvkX7qOiyoknRdlV8REtFTmQlVrPaFIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q2hFW572; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q2hFW572"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF27C4CEC6;
	Tue,  1 Oct 2024 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727777585;
	bh=S2QNkiNDX9hochvJg5dHvSR1anTUf+BSH20bSbq+6ak=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=Q2hFW572bF6HvI0dUXgsovkiZuUoTaTyxlGPI4UYPEcwcEsjIXrYRbkVdsapJNBok
	 5DlZhfwgLVL6N9HXG4JgOt/+o1esNr6udCk2SSWy7RtZti7Z5sn2shAB/9NHPJhEeK
	 s34LwrXmiSl1najqSH8PTo+aJ4OvXgiPHk08rfDs=
Subject: Patch "Revert "LoongArch: KVM: Invalidate guest steal time address on vCPU reset"" has been added to the 6.10-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,gregkh@linuxfoundation.org,kernel@xen0n.name,loongarch@lists.linux.dev,maobibo@loongson.cn,pbonzini@redhat.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Oct 2024 12:13:02 +0200
In-Reply-To: <20241001085521.102817-1-chenhuacai@loongson.cn>
Message-ID: <2024100101-elbow-growing-2aa4@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    Revert "LoongArch: KVM: Invalidate guest steal time address on vCPU reset"

to the 6.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-loongarch-kvm-invalidate-guest-steal-time-address-on-vcpu-reset.patch
and it can be found in the queue-6.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From chenhuacai@loongson.cn  Tue Oct  1 12:11:38 2024
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Tue,  1 Oct 2024 16:55:21 +0800
Subject: Revert "LoongArch: KVM: Invalidate guest steal time address on vCPU reset"
To: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <20241001085521.102817-1-chenhuacai@loongson.cn>

From: Huacai Chen <chenhuacai@loongson.cn>

This reverts commit 05969a6944713f159e8f28be2388500174521818 which is
commit 4956e07f05e239b274d042618a250c9fa3e92629 upstream.

LoongArch's PV steal time support is add after 6.10, so 6.10.y doesn't
need this fix.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/loongarch/include/asm/kvm_vcpu.h |    1 +
 arch/loongarch/kvm/timer.c            |    7 +++++++
 arch/loongarch/kvm/vcpu.c             |    2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

--- a/arch/loongarch/include/asm/kvm_vcpu.h
+++ b/arch/loongarch/include/asm/kvm_vcpu.h
@@ -76,6 +76,7 @@ static inline void kvm_restore_lasx(stru
 #endif
 
 void kvm_init_timer(struct kvm_vcpu *vcpu, unsigned long hz);
+void kvm_reset_timer(struct kvm_vcpu *vcpu);
 void kvm_save_timer(struct kvm_vcpu *vcpu);
 void kvm_restore_timer(struct kvm_vcpu *vcpu);
 
--- a/arch/loongarch/kvm/timer.c
+++ b/arch/loongarch/kvm/timer.c
@@ -188,3 +188,10 @@ void kvm_save_timer(struct kvm_vcpu *vcp
 	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_ESTAT);
 	preempt_enable();
 }
+
+void kvm_reset_timer(struct kvm_vcpu *vcpu)
+{
+	write_gcsr_timercfg(0);
+	kvm_write_sw_gcsr(vcpu->arch.csr, LOONGARCH_CSR_TCFG, 0);
+	hrtimer_cancel(&vcpu->arch.swtimer);
+}
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -572,7 +572,7 @@ static int kvm_set_one_reg(struct kvm_vc
 				vcpu->kvm->arch.time_offset = (signed long)(v - drdtime());
 			break;
 		case KVM_REG_LOONGARCH_VCPU_RESET:
-			vcpu->arch.st.guest_addr = 0;
+			kvm_reset_timer(vcpu);
 			memset(&vcpu->arch.irq_pending, 0, sizeof(vcpu->arch.irq_pending));
 			memset(&vcpu->arch.irq_clear, 0, sizeof(vcpu->arch.irq_clear));
 			break;


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.10/net-stmmac-dwmac-loongson-init-ref-and-ptp-clocks-ra.patch
queue-6.10/revert-loongarch-kvm-invalidate-guest-steal-time-address-on-vcpu-reset.patch
