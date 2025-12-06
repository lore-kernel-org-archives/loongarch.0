Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBAB2E9730
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980306; cv=none; b=TYjfGu6hUUqy5IjglGaxGjZmS5GVtJHpJIERru4PSZ1uhYqhK4FTf6iEdyPaZz3wE6TMR0hIQ5hywgtJAs/q/l4pAoWbxxntjgu9i0eAvZwAkQO4uFiivJjPSztPm8LgidNAZ8lmznpYGkRn0aUlnpykCeeDiFUcmKpzQyjc+LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980306; c=relaxed/simple;
	bh=zwC31PtY1144Zbq3uDzlYjGhLN8hSauVy0aZ0f/WAwM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=edU9AefR6zQzVHLmnwfLgDxAFopqffsppnb0TVRLnMUbLeiWEUgyg3YUjMdwI/aE9b/05cb7unzIWlQ+iS5UWoAP9RYy4HMNbPOK7EkecXb0f2PojqK3FQimCfFxuKTqQ/l6sECRvEdciDdiHHeNK1lcx/wD7F3E2HSljAHPxAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=fail (0-bit key) header.d=google.com header.i=@google.com header.b=QwBB1Lw3 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=google.com header.i=@google.com header.b="QwBB1Lw3"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7d5564057d0so7138822b3a.0
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980303; x=1765585103; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vcjFml1Ocn5W+9fhtxvlQ/X0kii0S1Hbwc7mdgCzQH4=;
        b=QwBB1Lw3hAcrppRIt3lnO1heB5Ymbwt0nsJgLEaKtF7eLuaMeTaLsgArH9m34Hv4Qt
         dqQyQSV/Vjl4NTqnnJd+g/wiMfIFLqVmDxa6Nx+98jhKLj1uoHi+ozv/OfQt46vZr/pE
         dTq4VoHHkXkJw4+dEfvA0sE1mu3VLI5Mu5DFn+2k2KE2ZsmIbd4HDEXLDX/nVGItYyWA
         cuDVgim7FlFOYzc4Eyf+awhNfmTFJAOU/WMaGTsF1RSsCA+3Sguc+grC6cvdIR4QT8wP
         Ga1+ONJWttFEOsZCzUy0PSD3IJGbc36gxorU2N0Fx1PtaztjwgEqIfm7gV0WocC7Cx+C
         uv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980303; x=1765585103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcjFml1Ocn5W+9fhtxvlQ/X0kii0S1Hbwc7mdgCzQH4=;
        b=EOdAM1ett2E/RzNdwYqfHRyRjBxeu1TXHVjmvCqlmE6fTvWBy5XBCMHpj021OCAXrm
         s/YbNE32GW/eeLiraH1fSU5NvhumMT7mZZsW/k664BzWUe/G9ZSRBUl9jgfj5HjZNslh
         bolsE8x/P2POEAYPYQcFHyJomhl+eWXlqJFMXqXbrN4x4YJpo1f6fWZU4aITnevn9vZV
         9s3MQLhHGmnqeHqTkbIZ96lngKyYxrFAzITaqaa/7lMProaxs297AtmTDo3zXfSnSKuk
         zMhIhrWRm2Fg5pU6Gzc78OGCkDxZFw6mZGR+ZZ80OBtAsEsBMtu5W138XrAMDvPF1NQN
         bAcg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Rqkogy0abS8a75LajFNB52m8f7jWtT64BM+ib+wgySnozI27GL3l1NkG6XrmkKh5v9hOJrBw0P4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLi3gPXDJj/xekcryZ0hA6z3iyu8+vx0FrjTLHzodO1MPje1dF
	IPUQjSCd5M//6zNmMxx3Qyv08w533JoQV+oBpYJl59LDWEOksoeDtpsDrBwK3FClKPIqTgfPKgx
	facYCpg==
X-Google-Smtp-Source: AGHT+IEi41vT7k5Y8TL0eorj0ILiZzn3n1cXKu+mvARIF/KTkqiX2XdS9wsUu8uQeqy5b+ge2DTi5IOhdXM=
X-Received: from pfmm14.prod.google.com ([2002:a05:6a00:248e:b0:7dd:8bba:63ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2ea0:b0:7a9:8770:ce5a
 with SMTP id d2e1a72fcca58-7e8c3628897mr847803b3a.20.1764980303025; Fri, 05
 Dec 2025 16:18:23 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:17:04 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-29-seanjc@google.com>
Subject: [PATCH v6 28/44] KVM: x86/pmu: Disallow emulation in the fastpath if
 mediated PMCs are active
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't handle exits in the fastpath if emulation is required, i.e. if an
instruction needs to be skipped, the mediated PMU is enabled, and one or
more PMCs is counting instructions.  With the mediated PMU, KVM's cache of
PMU state is inconsistent with respect to hardware until KVM exits the
inner run loop (when the mediated PMU is "put").

Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.h | 10 ++++++++++
 arch/x86/kvm/x86.c |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 25b583da9ee2..0925246731cb 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -234,6 +234,16 @@ static inline bool pmc_is_globally_enabled(struct kvm_pmc *pmc)
 	return test_bit(pmc->idx, (unsigned long *)&pmu->global_ctrl);
 }
 
+static inline bool kvm_pmu_is_fastpath_emulation_allowed(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	return !kvm_vcpu_has_mediated_pmu(vcpu) ||
+	       !bitmap_intersects(pmu->pmc_counting_instructions,
+				  (unsigned long *)&pmu->global_ctrl,
+				  X86_PMC_IDX_MAX);
+}
+
 void kvm_pmu_deliver_pmi(struct kvm_vcpu *vcpu);
 void kvm_pmu_handle_event(struct kvm_vcpu *vcpu);
 int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned pmc, u64 *data);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 589a309259f4..4683df775b0a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2215,6 +2215,9 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_invd);
 
 fastpath_t handle_fastpath_invd(struct kvm_vcpu *vcpu)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	if (!kvm_emulate_invd(vcpu))
 		return EXIT_FASTPATH_EXIT_USERSPACE;
 
@@ -2271,6 +2274,9 @@ static inline bool kvm_vcpu_exit_request(struct kvm_vcpu *vcpu)
 
 static fastpath_t __handle_fastpath_wrmsr(struct kvm_vcpu *vcpu, u32 msr, u64 data)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	switch (msr) {
 	case APIC_BASE_MSR + (APIC_ICR >> 4):
 		if (!lapic_in_kernel(vcpu) || !apic_x2apic_mode(vcpu->arch.apic) ||
@@ -11714,6 +11720,9 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_halt);
 
 fastpath_t handle_fastpath_hlt(struct kvm_vcpu *vcpu)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	if (!kvm_emulate_halt(vcpu))
 		return EXIT_FASTPATH_EXIT_USERSPACE;
 
-- 
2.52.0.223.gf5cc29aaa4-goog

