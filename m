Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D273630DEA4
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980338; cv=none; b=l6/QlMN/ulgyK+e0bYGJ48s8XZ/J7rvm3pI2c3ajmqkJDeRk7kH64AIIAZHepEEkiOUKYjW+S+Srkj66w7b3soWC04Zg1ugjlJw/SL887QlCDk3xglIrLR3JazT4iAGMoMT65ZG0pIxao1GsD9YaEq4LfUMkyfvnnhV2MTF+zUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980338; c=relaxed/simple;
	bh=gvtfcjIXj//cuiiuL7vddv/r8HozbH4yy9UU+z+mReQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lc/DUndgP00GL/qVFq+W5hNUlg0FXlP4UsqoZ13VUuAPaac517M2e2xEXMW13WGmMjDHE2lBkT864X2qkqA+lmynouQSt07y1f34P//nYi72vVVPQ9+zuyXKo0Ri+QKZe1elWT/98c1enNtnngfHqjkpv+IwrFmuQGtNtPHkuJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pROpRY+j; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pROpRY+j"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7b8ed43cd00so3149247b3a.2
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980335; x=1765585135; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dghHZC8C4J94U5X0EsLhdqx+qyyu5Gw9y0a71sLAgMI=;
        b=pROpRY+jk5sOWprrkqugpiMJbI4RSOxWycJZJmf5TCD01klvizQirhHL5MRHDM9y84
         hGWthGuBMFsFIpMGP4/6LzSicxqN5t7D38TlDrPGv/pOpnR/DkhZqdsLyq1rI2aQe5B5
         F5ZOoXRBrlVforlJDw1CnM3fUu5+zxCbuW5GZ72aoReO6Nx7Nhw9FGAc3RVDLodvrdHP
         FZtOdZBQSNOShUuMu9bcP+rbCiutHQ3T3OMoAM2eOo5GxTu56YxF2O1TJER4T7p7QPuk
         SO6bSQwjfWSYh0hmNPpCCyyI2RPm+bdYZ7PROnzS8ESwTlSylRKsp1utqPb0RtV2XDL4
         K6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980335; x=1765585135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dghHZC8C4J94U5X0EsLhdqx+qyyu5Gw9y0a71sLAgMI=;
        b=tbE9piokecMn+WOZDHwyoz1d29wh5AfivW4uJyNzrB6gKERxsdNcoB7Li9TwsYJr/O
         oHSHd16yQnb/iy/6EaJdELIWviAmptSWAR9Q9RlJ05kSCFz6Bosf/E9EVk2tKp65jCWD
         cfwH6OR5OSUM93/+7EE1NCjgv5gdG2J3N8FcQ+7zbc0WLlU1gchB5ASZVSFmeXBqKlfN
         X+i2fWFUWLyXQpmP6jT2sjjVomNz9tq+VLWiXxOcBS+hp8JqcntQkloYP2jSSQHaHi6I
         c//OcEq/iQwAVavNzMGw6jOlapT1uawVDkpVnrh4r28cwSrHm2iQki57q14GZOEc/lrJ
         5nDg==
X-Forwarded-Encrypted: i=1; AJvYcCX13GPDtcxfww8XBP+pPig2tUiSXI3HH3sWVnmV9o4Fz1WuC9JQxAoQIbesauj4jhrjNk8cwwM36jM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNkMlUZ7Z79iEDvjUFUNQbaL9AMR6q3PxwNVau7KzKmMLjm6Ox
	mBH/l7adBeGFl2ipiuvAlWK2mD8IHNjMh8471ORR1IKR05njSWpmuxeT9ommtNaZdADV90sCYWY
	q981DAQ==
X-Google-Smtp-Source: AGHT+IGiF/KlyKw3jh5Mhte5oVO+4hAY3tNIkOZ4DdyLYn/+Z0r5Rwc99w3eHOaoOE5Aq4b+oO/Y2gl+Kqw=
X-Received: from pgbcp9.prod.google.com ([2002:a05:6a02:4009:b0:b99:9560:3dc9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e290:b0:35b:c84f:c7b0
 with SMTP id adf61e73a8af0-36617e37e14mr1031726637.8.1764980334861; Fri, 05
 Dec 2025 16:18:54 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:17:20 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-45-seanjc@google.com>
Subject: [PATCH v6 44/44] KVM: VMX: Add mediated PMU support for CPUs without
 "save perf global ctrl"
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

Extend mediated PMU support for Intel CPUs without support for saving
PERF_GLOBAL_CONTROL into the guest VMCS field on VM-Exit, e.g. for Skylake
and its derivatives, as well as Icelake.  While supporting CPUs without
VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL isn't completely trivial, it's not that
complex either.  And not supporting such CPUs would mean not supporting 7+
years of Intel CPUs released in the past 10 years.

On VM-Exit, immediately propagate the saved PERF_GLOBAL_CTRL to the VMCS
as well as KVM's software cache so that KVM doesn't need to add full EXREG
tracking of PERF_GLOBAL_CTRL.  In practice, the vast majority of VM-Exits
won't trigger software writes to guest PERF_GLOBAL_CTRL, so deferring the
VMWRITE to the next VM-Enter would only delay the inevitable without
batching/avoiding VMWRITEs.

Note!  Take care to refresh VM_EXIT_MSR_STORE_COUNT on nested VM-Exit, as
it's unfortunately possible that KVM could recalculate MSR intercepts
while L2 is active, e.g. if userspace loads nested state and _then_ sets
PERF_CAPABILITIES.  Eating the VMWRITE on every nested VM-Exit is
unfortunate, but that's a pre-existing problem and can/should be solved
separately, e.g. modifying the number of auto-load entries while L2 is
active is also uncommon on modern CPUs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c    |  6 ++++-
 arch/x86/kvm/vmx/pmu_intel.c |  7 -----
 arch/x86/kvm/vmx/vmx.c       | 52 ++++++++++++++++++++++++++++++++----
 3 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 614b789ecf16..1ee1edc8419d 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5142,7 +5142,11 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 
 	kvm_nested_vmexit_handle_ibrs(vcpu);
 
-	/* Update any VMCS fields that might have changed while L2 ran */
+	/*
+	 * Update any VMCS fields that might have changed while vmcs02 was the
+	 * active VMCS.  The tracking is per-vCPU, not per-VMCS.
+	 */
+	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr);
 	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, vmx->msr_autoload.host.nr);
 	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, vmx->msr_autoload.guest.nr);
 	vmcs_write64(TSC_OFFSET, vcpu->arch.tsc_offset);
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 55249fa4db95..27eb76e6b6a0 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -777,13 +777,6 @@ static bool intel_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_
 	if (WARN_ON_ONCE(!cpu_has_load_perf_global_ctrl()))
 		return false;
 
-	/*
-	 * KVM doesn't yet support mediated PMU on CPUs without support for
-	 * saving PERF_GLOBAL_CTRL via a dedicated VMCS field.
-	 */
-	if (!cpu_has_save_perf_global_ctrl())
-		return false;
-
 	return true;
 }
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6a17cb90eaf4..ba1262c3e3ff 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1204,6 +1204,17 @@ static bool update_transition_efer(struct vcpu_vmx *vmx)
 	return true;
 }
 
+static void vmx_add_autostore_msr(struct vcpu_vmx *vmx, u32 msr)
+{
+	vmx_add_auto_msr(&vmx->msr_autostore, msr, 0, VM_EXIT_MSR_STORE_COUNT,
+			 vmx->vcpu.kvm);
+}
+
+static void vmx_remove_autostore_msr(struct vcpu_vmx *vmx, u32 msr)
+{
+	vmx_remove_auto_msr(&vmx->msr_autostore, msr, VM_EXIT_MSR_STORE_COUNT);
+}
+
 #ifdef CONFIG_X86_32
 /*
  * On 32-bit kernels, VM exits still load the FS and GS bases from the
@@ -4225,6 +4236,8 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
 
 static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
 {
+	u64 vm_exit_controls_bits = VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
+				    VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL;
 	bool has_mediated_pmu = kvm_vcpu_has_mediated_pmu(vcpu);
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
@@ -4234,12 +4247,19 @@ static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
 	if (!enable_mediated_pmu)
 		return;
 
+	if (!cpu_has_save_perf_global_ctrl()) {
+		vm_exit_controls_bits &= ~VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL;
+
+		if (has_mediated_pmu)
+			vmx_add_autostore_msr(vmx, MSR_CORE_PERF_GLOBAL_CTRL);
+		else
+			vmx_remove_autostore_msr(vmx, MSR_CORE_PERF_GLOBAL_CTRL);
+	}
+
 	vm_entry_controls_changebit(vmx, VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL,
 				    has_mediated_pmu);
 
-	vm_exit_controls_changebit(vmx, VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
-					VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL,
-				   has_mediated_pmu);
+	vm_exit_controls_changebit(vmx, vm_exit_controls_bits, has_mediated_pmu);
 
 	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
 		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PERFCTR0 + i,
@@ -7346,6 +7366,29 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *vmx)
 					      msrs[i].host);
 }
 
+static void vmx_refresh_guest_perf_global_control(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+
+	if (msr_write_intercepted(vmx, MSR_CORE_PERF_GLOBAL_CTRL))
+		return;
+
+	if (!cpu_has_save_perf_global_ctrl()) {
+		int slot = vmx_find_loadstore_msr_slot(&vmx->msr_autostore,
+						       MSR_CORE_PERF_GLOBAL_CTRL);
+
+		if (WARN_ON_ONCE(slot < 0))
+			return;
+
+		pmu->global_ctrl = vmx->msr_autostore.val[slot].value;
+		vmcs_write64(GUEST_IA32_PERF_GLOBAL_CTRL, pmu->global_ctrl);
+		return;
+	}
+
+	pmu->global_ctrl = vmcs_read64(GUEST_IA32_PERF_GLOBAL_CTRL);
+}
+
 static void vmx_update_hv_timer(struct kvm_vcpu *vcpu, bool force_immediate_exit)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
@@ -7631,8 +7674,7 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	vmx->loaded_vmcs->launched = 1;
 
-	if (!msr_write_intercepted(vmx, MSR_CORE_PERF_GLOBAL_CTRL))
-		vcpu_to_pmu(vcpu)->global_ctrl = vmcs_read64(GUEST_IA32_PERF_GLOBAL_CTRL);
+	vmx_refresh_guest_perf_global_control(vcpu);
 
 	vmx_recover_nmi_blocking(vmx);
 	vmx_complete_interrupts(vmx);
-- 
2.52.0.223.gf5cc29aaa4-goog

