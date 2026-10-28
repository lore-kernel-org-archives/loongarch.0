Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214187;
	b=XGMyPIQyY5EaoTh8DQPgd81JJDHytnUuXuAIqsFBXwbCQoByltHiY9dGGZHpRLmlfM4w
	 i9Vx5+Tdnp7IZuw6aVQ/sXr4jGXV9j+mDX8Di+NzB2379cvr0x4YuFRxfkr7Ukstn4/zj
	 o4oiPXyLxRUIFZiBs+c67qRMskRsqDQgIN2HzhURcZYJNUg2TUHzPgvmByRkR3zyiR4/r
	 TmZeS8OpcjUGjcvRk6gclOj5cKEKWhgNsiLDEw+/sx14d2fQma1HWFnwntQT+rUm73Que
	 iMsdiWWqkWIAcvz5+TPQLkOyyyKXxw3YHKOctaZlYbGp2YQZuhFy5ABznTIhKy2XrUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=kQihi39MSjxZBPCKWC1v+KxEdPYKoJ3DWZvMHVb+Z7E=;
	b=26QXxTdjRfJadloJq0AstRxi5QaISAWsebD7K36uUG2NJK0ZOtGW2fEtJXfbuFrphJ9r
	 j627GOFbosyBTmsLOPkSJOS8tZWYnpQQGmndwzyzjV8LpN9aLUtG3V9U3/fQJy40uCKxV
	 M3zkdW99/BdIda5nBTS8tpNqEHqfURB4q+YgUmduYOryp9uAjxBSPlG6Jz+DENtEEisGX
	 T2Tf+e4WI/1ZJIklV4gup8a3bG8FnLvVYYzlvxLjlaTyF2q3remkgLurHevTEwRXhC55C
	 kICOPZ6iIdX1TA8lXd90raVYTIi0w+4z4k/alD1TosAVGXGg0dr20PvKyT1YbMRakKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BlWup/VL";
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503B060A2637
	for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 19:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 503B060A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BlWup/VL
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so1602305a12.0
        for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214186; x=1793818986; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kQihi39MSjxZBPCKWC1v+KxEdPYKoJ3DWZvMHVb+Z7E=;
        b=BlWup/VLAMZTBY9hUjArVhRqlTUQcTwbiUTYErkk1Kxvn+jLw5sqPgDaYeVfnjCSR6
         AUCP4Ra6k6kB0fyxXFrOm4HBLA1PyBljpfisp5kp2CuKflXsbEKwv+U+C4Cm9oxeahdP
         3b9g/gNX1/KgsGxgcxGpP1ML2eBVjDiPZ3wfoXCQRoXsmR1b70Ib6yM5lItA9hmNifTU
         65h7X80zrRjmyd6F8c0VKgWYkpV2zSRPgStgRts+5lm+/1K/KPeITjmLKZ6/vRH3fU39
         nPqX6Sw9aDIHbOJQnrzN5/Eoc8nPdb5vvQ3XcX2YAq/Xgh0MJu460sGOUjBkKWGINHgc
         Mn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214186; x=1793818986;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kQihi39MSjxZBPCKWC1v+KxEdPYKoJ3DWZvMHVb+Z7E=;
        b=nI/yuNNqaKZhPUMAWHlbonsJXc7YcHf8HsU5HodJXscgDsfKxOcOuuI88hWeWSpOKZ
         hF/fgf0okRfIkrmnKWk/bMLIxE0PliTZPewc985wrfUyvywjoKs+dsSmNwR3MiNIzxZj
         oF3+D2w3S0iBy2O4lQrFFGjIXeEfvVRn9NCmDF8LGoeQT2adit2PzNkBOyVnt96auSFE
         sN6TcJeO8U0oXMctrbVPbDVwvls1RdvmY28MBVEWXZWXtmaV8ofrHiWosX8g0JUp6g8R
         3uSYarFSnpXmrKLudGQ9U193lmcpNmhxIt3Y7kkB+tKwfD93u8UgTP5qY0c8/C6fezyb
         UFTw==
X-Forwarded-Encrypted: i=1; AKwUvBzXMfB5Np8e+MD6+zWFGSD+ReB78ugY8ICzpgN8NZXpLzLmPcCtVteZ3gasI+0v5fP0jl6RXoQkCac=@lists.linux.dev
X-Gm-Message-State: AFq9FYI6D87s4kzPcRq6InwfTNUqjpyTMjbmVoi6AQIzUAZD/ov4Xzjl
	8/4sS/EXbZCsfrDvgC1iQaaJl85P6P+Txvyo6ioWsAl2wNG90NBH1NepoAu57mrGiRuaT0r4u4c
	oP0lD3w==
X-Received: from pgx20.prod.google.com ([2002:a63:1754:0:b0:cd4:ef82:4e33])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a120:b0:3e1:5816:8749
 with SMTP id adf61e73a8af0-3e9023eda44mr2865201637.38.1793214185450; Wed, 28
 Oct 2026 12:03:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:55 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-4-seanjc@google.com>
Subject: [PATCH 3/7] KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Explicitly force an IPI when invoking kvm_vcpu_kick() directly instead of
relying on kvm_arch_vcpu_should_kick() to unconditionally return 1/true.
This will allow dropping kvm_arch_vcpu_should_kick() in favor of
kvm_request_needs_ipi().

No functional change intended (1 || 1 == true).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 13 ++++++++++++-
 arch/powerpc/kvm/book3s.c          |  4 ++--
 arch/powerpc/kvm/book3s_pr.c       |  2 +-
 arch/powerpc/kvm/booke.c           |  6 +++---
 arch/powerpc/kvm/e500_emulate.c    |  2 +-
 arch/powerpc/kvm/powerpc.c         |  2 +-
 6 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 169ea6a7fbad..bbe7378ad0ef 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -30,6 +30,17 @@
 #endif
 #include <asm/inst.h>
 
+/*
+ * TODO: For unknown reasons, KVM PPC has historically ignored vcpu->mode when
+ *       determining if kicking a vCPU needs an IPI.  Either document why that
+ *       behavior is necessary, or drop this helper and the @force param from
+ *       __kvm_vcpu_kick().
+ */
+static inline void kvmppc_vcpu_kick(struct kvm_vcpu *vcpu)
+{
+	__kvm_vcpu_kick(vcpu, false, true);
+}
+
 /*
  * KVMPPC_INST_SW_BREAKPOINT is debug Instruction
  * for supporting software breakpoint.
@@ -598,7 +609,7 @@ static inline void kvmppc_clear_host_ipi(int cpu)
 
 static inline void kvmppc_fast_vcpu_kick(struct kvm_vcpu *vcpu)
 {
-	kvm_vcpu_kick(vcpu);
+	kvmppc_vcpu_kick(vcpu);
 }
 
 static inline bool kvm_hv_mode_active(void)		{ return false; }
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 2efbe05caed7..dce53c5a3868 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -260,7 +260,7 @@ void kvmppc_core_queue_external(struct kvm_vcpu *vcpu,
 	 * external interrupts for the guest just before entering
 	 * the guest.  That is OK even if userspace did do a
 	 * KVM_INTERRUPT_SET on a pseries guest vcpu, because the
-	 * caller (kvm_vcpu_ioctl_interrupt) does a kvm_vcpu_kick()
+	 * caller (kvm_vcpu_ioctl_interrupt) does a kvmppc_vcpu_kick()
 	 * which ends up doing a smp_send_reschedule(), which will
 	 * pull the guest all the way out to the host, meaning that
 	 * we will call kvmppc_core_prepare_to_enter() before entering
@@ -827,7 +827,7 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 void kvmppc_decrementer_func(struct kvm_vcpu *vcpu)
 {
 	kvmppc_core_queue_dec(vcpu);
-	kvm_vcpu_kick(vcpu);
+	kvmppc_vcpu_kick(vcpu);
 }
 
 int kvmppc_core_vcpu_create(struct kvm_vcpu *vcpu)
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index ecfb88bf6464..1894968f2c25 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -2066,7 +2066,7 @@ static struct kvmppc_ops kvm_ops_pr = {
 	.emulate_op = kvmppc_core_emulate_op_pr,
 	.emulate_mtspr = kvmppc_core_emulate_mtspr_pr,
 	.emulate_mfspr = kvmppc_core_emulate_mfspr_pr,
-	.fast_vcpu_kick = kvm_vcpu_kick,
+	.fast_vcpu_kick = kvmppc_vcpu_kick,
 	.arch_vm_ioctl  = kvm_arch_vm_ioctl_pr,
 #ifdef CONFIG_PPC_BOOK3S_64
 	.hcall_implemented = kvmppc_hcall_impl_pr,
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 13ad4cf5fa71..fd7f24a68b31 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -650,7 +650,7 @@ static void kvmppc_watchdog_func(struct timer_list *t)
 	if (new_tsr & TSR_WIS) {
 		smp_wmb();
 		kvm_make_request(KVM_REQ_PENDING_TIMER, vcpu);
-		kvm_vcpu_kick(vcpu);
+		kvmppc_vcpu_kick(vcpu);
 	}
 
 	/*
@@ -661,7 +661,7 @@ static void kvmppc_watchdog_func(struct timer_list *t)
 	    vcpu->arch.watchdog_enabled) {
 		smp_wmb();
 		kvm_make_request(KVM_REQ_WATCHDOG, vcpu);
-		kvm_vcpu_kick(vcpu);
+		kvmppc_vcpu_kick(vcpu);
 	}
 
 	/*
@@ -1872,7 +1872,7 @@ void kvmppc_set_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits)
 	set_bits(tsr_bits, &vcpu->arch.tsr);
 	smp_wmb();
 	kvm_make_request(KVM_REQ_PENDING_TIMER, vcpu);
-	kvm_vcpu_kick(vcpu);
+	kvmppc_vcpu_kick(vcpu);
 }
 
 void kvmppc_clr_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits)
diff --git a/arch/powerpc/kvm/e500_emulate.c b/arch/powerpc/kvm/e500_emulate.c
index 051102d50c31..10cd6b4ab456 100644
--- a/arch/powerpc/kvm/e500_emulate.c
+++ b/arch/powerpc/kvm/e500_emulate.c
@@ -75,7 +75,7 @@ static int kvmppc_e500_emul_msgsnd(struct kvm_vcpu *vcpu, int rb)
 		int cpir = cvcpu->arch.shared->pir;
 		if ((param & PPC_DBELL_MSG_BRDCAST) || (cpir == pir)) {
 			set_bit(prio, &cvcpu->arch.pending_exceptions);
-			kvm_vcpu_kick(cvcpu);
+			kvmppc_vcpu_kick(cvcpu);
 		}
 	}
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9194cf492d1c..09c94b849185 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1903,7 +1903,7 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
 
 	kvmppc_core_queue_external(vcpu, irq);
 
-	kvm_vcpu_kick(vcpu);
+	kvmppc_vcpu_kick(vcpu);
 
 	return 0;
 }
-- 
2.56.0.313.g2479322e68-goog

