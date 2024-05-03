Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA59158852
	for <loongarch@lists.linux.dev>; Fri,  3 May 2024 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760263; cv=none; b=jDxeRF3jHCCV2XkETwzSsyXqPuCOhdHeXMstyRchigQzQxvq62QPhAah3Ikyp7pRUNYwMDehkBRXZL5k9dfnNJ5mHdVzIFCPPtAIi8lW4MBgUUoK42DYRie8GgP9lNI3EW4w/h2Z1u43I5LFNiT9EhKxZR3UzaoLOPaF8hwZa7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760263; c=relaxed/simple;
	bh=SbR2pYdcwP7d8d0EllRiVsBDfxgWnwUD2Dl29PJc+BQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i2a/IOz+FW4+WxzRqgtHEmMhkQQUyNr3FJuN2f1sbuMt5ybwHjBR/G1XPg0v7VIjf+wcJFMLefo7F8cnCimRfRsQazGbFq+8pbhVZys2lfdv3p/Lj/9ZzIgMgoUzGCO26ktEBlipndLRJhLYdtrYGL7pQ6yVj0d4gfwPHJ9q5M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iuhDseaJ; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iuhDseaJ"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de468af2b73so18439519276.0
        for <loongarch@lists.linux.dev>; Fri, 03 May 2024 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760260; x=1715365060; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gxJS1crzpielwDie8rL3hx1PCStQKnU+yTalK3ZSiI0=;
        b=iuhDseaJrDPx9+uxmaiu7sRIse+WgaU4HwXTH7dZeSqnvu0h00U9Zmnc0udoBTt/Ke
         DTfbmnB5BswfA9rju/Yh+UV2+q3a7G9dVcHmAk6zzG1WkdQ0wa0RFE5HmqNfuXtVrpwA
         x2PsXtMVhTAeQ8NsRipnqdeBWp1W+ZU4/TezBPml0xtwBh6Qohm23733YNDJOP379YO0
         XcgEarGWTgNPTMyqfnKGwMGZBYglbaHCjlGyjp8jrhjSWrgjxZ+AbhZXXZkeSNnkePJw
         IqoVxd8oCtiVP80gxpgDspRSvGat4EYRO3bV7EIKNH+z1/w/KX52MdwtC10wfEFb6ncQ
         5qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760260; x=1715365060;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxJS1crzpielwDie8rL3hx1PCStQKnU+yTalK3ZSiI0=;
        b=PvdZfolU+SCBhvGJrPx1IG333izVr+RXSTv+e3J/2wN6kV6Vy//8iL+JfZ/KeJtUmB
         EmaqMo4Ig2i6xKwUMoYJd1N0UwvOjCPAPi58gV5E5vsb9oo3cZTIoEPyC451G8QW6wnp
         AFQOVXPi7Xc4SQvxI9KqdvR7HLylg30Swf37dis/7AuBdA9eB517JxZ6O7tkUUXS3JrF
         qLmllj5HDc3kpYuP51GAG6AsKY8EzxZDlEk3EUIDtPUdllDp+MNEtIrWQLE3MEb550uL
         rl3yXYQej7KAnd0v6p2L0oGqCyb7HmSjnsM8t8DhbPB5375mgwOAvYr1dnuJzHL4Fqy3
         6Ctg==
X-Forwarded-Encrypted: i=1; AJvYcCW/dSkLsjHb4osCoLDp9HnQQZbrojE/HT2SveiBg3OdiGPYdTM47lRSVaCJW2eLesG6bDsSWYxbnUhi6riw3Dw8X6ogvsDO30O2
X-Gm-Message-State: AOJu0Yy6IGozcUzXGz5vjIWIVGyugOsIVEziyqnYSMI9fo+aJwNRHcLy
	5dpftB5YVNbmi+uXmI8zMMtxXb/g9ISLTRBcRPLhUCczs679koAFXGJxqB4NoVGcZl0ATnewPOv
	l6yHZeXD3VQ==
X-Google-Smtp-Source: AGHT+IFV8XW0q6Vc+/y+/ULmmUgE0pK+amRiYPmJG0lNXqT19q15J8nIrLHDkebqo9zBkflGqNFe7OG5YJeiaQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6902:1023:b0:dd9:1db5:8348 with SMTP
 id x3-20020a056902102300b00dd91db58348mr1087385ybt.8.1714760260354; Fri, 03
 May 2024 11:17:40 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:32 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-2-dmatlack@google.com>
Subject: [PATCH v3 1/3] KVM: Introduce vcpu->wants_to_run
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce vcpu->wants_to_run to indicate when a vCPU is in its core run
loop, i.e. when the vCPU is running the KVM_RUN ioctl and immediate_exit
was not set.

Replace all references to vcpu->run->immediate_exit with
!vcpu->wants_to_run to avoid TOCTOU races with userspace. For example, a
malicious userspace could invoked KVM_RUN with immediate_exit=true and
then after KVM reads it to set wants_to_run=false, flip it to false.
This would result in the vCPU running in KVM_RUN with
wants_to_run=false. This wouldn't cause any real bugs today but is a
dangerous landmine.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/arm64/kvm/arm.c       | 2 +-
 arch/loongarch/kvm/vcpu.c  | 2 +-
 arch/mips/kvm/mips.c       | 2 +-
 arch/powerpc/kvm/powerpc.c | 2 +-
 arch/riscv/kvm/vcpu.c      | 2 +-
 arch/s390/kvm/kvm-s390.c   | 2 +-
 arch/x86/kvm/x86.c         | 4 ++--
 include/linux/kvm_host.h   | 1 +
 virt/kvm/kvm_main.c        | 3 +++
 9 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c4a0a35e02c7..c587e5d9396e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -986,7 +986,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	vcpu_load(vcpu);
 
-	if (run->immediate_exit) {
+	if (!vcpu->wants_to_run) {
 		ret = -EINTR;
 		goto out;
 	}
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 3a8779065f73..847ef54f3a84 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1163,7 +1163,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			kvm_complete_iocsr_read(vcpu, run);
 	}
 
-	if (run->immediate_exit)
+	if (!vcpu->wants_to_run)
 		return r;
 
 	/* Clear exit_reason */
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 231ac052b506..f1a99962027a 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -436,7 +436,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		vcpu->mmio_needed = 0;
 	}
 
-	if (vcpu->run->immediate_exit)
+	if (!vcpu->wants_to_run)
 		goto out;
 
 	lose_fpu(1);
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index d32abe7fe6ab..961aadc71de2 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1852,7 +1852,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	kvm_sigset_activate(vcpu);
 
-	if (run->immediate_exit)
+	if (!vcpu->wants_to_run)
 		r = -EINTR;
 	else
 		r = kvmppc_vcpu_run(vcpu);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..3d8349470ee6 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -711,7 +711,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		return ret;
 	}
 
-	if (run->immediate_exit) {
+	if (!vcpu->wants_to_run) {
 		kvm_vcpu_srcu_read_unlock(vcpu);
 		return -EINTR;
 	}
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 5147b943a864..b1ea25aacbf9 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5033,7 +5033,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	if (vcpu->kvm->arch.pv.dumping)
 		return -EINVAL;
 
-	if (kvm_run->immediate_exit)
+	if (!vcpu->wants_to_run)
 		return -EINTR;
 
 	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2d2619d3eee4..f70ae1558684 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11396,7 +11396,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	kvm_vcpu_srcu_read_lock(vcpu);
 	if (unlikely(vcpu->arch.mp_state == KVM_MP_STATE_UNINITIALIZED)) {
-		if (kvm_run->immediate_exit) {
+		if (!vcpu->wants_to_run) {
 			r = -EINTR;
 			goto out;
 		}
@@ -11474,7 +11474,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		WARN_ON_ONCE(vcpu->mmio_needed);
 	}
 
-	if (kvm_run->immediate_exit) {
+	if (!vcpu->wants_to_run) {
 		r = -EINTR;
 		goto out;
 	}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index afbc99264ffa..f9b9ce0c3cd9 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -380,6 +380,7 @@ struct kvm_vcpu {
 		bool dy_eligible;
 	} spin_loop;
 #endif
+	bool wants_to_run;
 	bool preempted;
 	bool ready;
 	struct kvm_vcpu_arch arch;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 38b498669ef9..bdea5b978f80 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4425,7 +4425,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				synchronize_rcu();
 			put_pid(oldpid);
 		}
+		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
+		vcpu->wants_to_run = false;
+
 		trace_kvm_userspace_exit(vcpu->run->exit_reason, r);
 		break;
 	}
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

