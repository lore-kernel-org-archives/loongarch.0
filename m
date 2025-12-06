Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB54D2BEC45
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980288; cv=none; b=CfYApu3+hIBs1ujUByvDkq4iprkpwJBTrNEyKgDS5zgWdO5erJpEpKq3B8r2LqAdihJdjjvC/qka0hxwNsRo4gSJz30r5IZtq1l1SnmyDgUaXY3GBLI/97zqto4hm/veSD5TNH+j2kiTsez8CMkBH7XpTe/6XAg9XDAb4l3CTzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980288; c=relaxed/simple;
	bh=+5rvOQQEmWi8zXJY9jqrXtHF9NbwN3EkEXKXWn4uwVo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r5wZk7ePlyIHI8kP2MxWEq4BumAjKfaUuZAmHj0y6K+ZlbiS+kazB3d9GpyUhQdftR6pimocq0ej3SZ7d3XT0vLE+yIEWfcXGOaJBHTOqOMVsGsYz/+fUgfWGjtuyM/IkOeMCdW1Mt1gX8dCh83grzsvD+C1Y7TwSOpMwl5M9a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BzaxTixu; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BzaxTixu"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7c7957d978aso2757186b3a.1
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980285; x=1765585085; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Updb/Jfn2dAHBrhkdzkPSsR6YWK/TllPUiDQA+O1aSA=;
        b=BzaxTixu4TDlmF8mkBOqYp0xE3B6bQiH9Tv0xIxJtPfduo7tYOfHAJfx74Y5uMJ7ek
         cZEy+XTcf/cKbU0/qOyfJAi0sfDK6sBZIg/ZfSP7Sd1Q0gLHQHi7N9dE7+BBxJWTRe86
         JLEaRKuIvhoTweIWfYvu2a8rV7pj54A4dxgva11YR3Xhnj/HwbCK/qHPFKTy4ziyj6TS
         GDqVDsBl32wx6Ss234rdWtWdDT3nKRFMmP5Mitp5JUMRDfKQ7ZHhtVMxtJVXsx5ns44t
         VS4yzoUlxEDDgwNBawFT7F8/RqkedKinCfxoe1QTDs25D1facF08fj2zfZLdaNowLuM5
         4Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980285; x=1765585085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Updb/Jfn2dAHBrhkdzkPSsR6YWK/TllPUiDQA+O1aSA=;
        b=fV0sUjK/7fxKJLpvC/xvqiWlln4TRrCKaisbrjBFf90T2tphCI79qVRmg8hXujykRK
         gJgJRJOI2tYr50rzd+gULd1aDMyrr8WSPZxbCLRq9NiR5Zg3JqzhgPlq0Yz+9IT+RA1u
         PGOqzUz3mksDSw70kWs1/y3bBG7Ez2ZTNOr+lD+2f6Akl+azaWvyLmpBSUHYtvQ433PN
         UtaEHwUxXZwHDcngHkdNA1s0DQ0XgvUIMZj8mqC6uYhEe1giY2Oc1csIeED+7Eksn/cA
         pKvkesI3Pb6RmlNdl2DV1IRul0aaiFeP4dfb9yd8P319svkj30zvFqeIR9cPDVznHr7g
         N5cw==
X-Forwarded-Encrypted: i=1; AJvYcCUeIYgEtl6QZNHyh8klYkU9WF+L7sdSjgdRUdRyjd93KlsCh9HEo0bCYzC1bMJJD60jodOhLne+Yz8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw530RjII38Lexe9wtsgZOY7RikcfZ3pZWCZ17y9rOL0Ks+YCsw
	1KJ06dxVAejnBcH59ImmRSqZFlus3eSriy+4pEvCLBD4t1qGCnjU9u9gL0SWa8dEP7HcaTs8e6t
	khdTGTg==
X-Google-Smtp-Source: AGHT+IGmx8a/eJZmORgvkEWVhn/uP5dbhmnIbP0XRDK0XcrnLs6A3LdHJHErdqkr+RZXqUaApvjJvO7ayAk=
X-Received: from pgbdp3.prod.google.com ([2002:a05:6a02:f03:b0:bc8:5648:d6bf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8187:b0:366:1a2c:6f91
 with SMTP id adf61e73a8af0-3661a2c7805mr309067637.4.1764980284548; Fri, 05
 Dec 2025 16:18:04 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:16:55 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-20-seanjc@google.com>
Subject: [PATCH v6 19/44] KVM: x86/pmu: Register PMI handler for mediated vPMU
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

From: Xiong Zhang <xiong.y.zhang@linux.intel.com>

Register a dedicated PMI handler with perf's callback when mediated PMU
support is enabled.  Perf routes PMIs that arrive while guest context is
loaded to the provided callback, by modifying the CPU's LVTPC to point at
a dedicated mediated PMI IRQ vector.

WARN upon receipt of a mediated PMI if there is no active vCPU, or if the
vCPU doesn't have a mediated PMU.  Even if a PMI manages to skid past
VM-Exit, it should never be delayed all the way beyond unloading the vCPU.
And while running vCPUs without a mediated PMU, the LVTPC should never be
wired up to the mediated PMI IRQ vector, i.e. should always be routed
through perf's NMI handler.

Signed-off-by: Xiong Zhang <xiong.y.zhang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 10 ++++++++++
 arch/x86/kvm/pmu.h |  2 ++
 arch/x86/kvm/x86.c |  3 ++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 0de0af5c6e4f..b3dde9a836ea 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -159,6 +159,16 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 		perf_get_hw_event_config(PERF_COUNT_HW_BRANCH_INSTRUCTIONS);
 }
 
+void kvm_handle_guest_mediated_pmi(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (WARN_ON_ONCE(!vcpu || !kvm_vcpu_has_mediated_pmu(vcpu)))
+		return;
+
+	kvm_make_request(KVM_REQ_PMI, vcpu);
+}
+
 static inline void __kvm_perf_overflow(struct kvm_pmc *pmc, bool in_pmi)
 {
 	struct kvm_pmu *pmu = pmc_to_pmu(pmc);
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index a5c7c026b919..9849c2bb720d 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -46,6 +46,8 @@ struct kvm_pmu_ops {
 
 void kvm_pmu_ops_update(const struct kvm_pmu_ops *pmu_ops);
 
+void kvm_handle_guest_mediated_pmi(void);
+
 static inline bool kvm_pmu_has_perf_global_ctrl(struct kvm_pmu *pmu)
 {
 	/*
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fb3a5e861553..1623afddff3b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10111,7 +10111,8 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
 #endif
 
-	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr, NULL);
+	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr,
+				      enable_mediated_pmu ? kvm_handle_guest_mediated_pmi : NULL);
 
 	if (IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_mmu_enabled)
 		kvm_caps.supported_vm_types |= BIT(KVM_X86_SW_PROTECTED_VM);
-- 
2.52.0.223.gf5cc29aaa4-goog

