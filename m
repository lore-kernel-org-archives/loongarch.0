Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CD630171A
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980319; cv=none; b=B1zquNDQAcbXxZftQAYBK+o6AHJh26rvBgofYmdmXKmTGD/HmBPQ6hwSIdrfx4Gk64V4JBdsgaE1Oa2lCKsYpPt9fOMihdoRWqo4fpz2s/OJhPKY4uGqYpF4LNlqfXbBaoXGareTRXbLEYXBfEZWqmDhcmxQ4ppSceFWK6SNWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980319; c=relaxed/simple;
	bh=idLMRNHkxj+prEIBFHlo9xwnmQGyalobOpJXM4sezD0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kFMLJbJj8x/aNgQliccU3x3mCUHl8z6zpWhS9YZoPfhlN5zssK0CzO3HR3D5zxjSIebDDVL4UdKU+cjzTjjbiFYB7vrDE3MUjc5g5z+xv4uf9HY/Ll1GnjgwivUZY+0LJ0+qwf4o/FsAJLujlprU4VEEFKDwuFjHtAYJaPT/JqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KbCO+ZrK; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KbCO+ZrK"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34740cc80d5so5032129a91.0
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980317; x=1765585117; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M6M+TUCunGgZRp0HQ274P454YeO/pMlL0Ud7LaETHp4=;
        b=KbCO+ZrKDNZ+olrfKzu/sSBvBC9sziioAq3vkSpmlVx0X812AZZjZ5yB+1o826Cevv
         aCokMzkiBlwKLOwmllVixphY90G/q1v8464NxgRwYc0CiCr1ijMaHdfQm00dstzfsriF
         37kGtoWDzCeNiRKenzhSWG/QJBTRIawRADs6b+xtgwjqmqlAZQzh6CW4bAkzb11V1ahO
         LF/bBMWXyVr/Umqr7Avgu3j4Qqauv2HAYeq9/OFEfjj3g55BUbLUrLhPvfY8ib0VGlTL
         ssTA7/mYCRQ5MJSG2BWP1mEd+aMHMeIf80GHihphmqlhqBIB7pjT7pbRGPp+TNyKcIrs
         NbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980317; x=1765585117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6M+TUCunGgZRp0HQ274P454YeO/pMlL0Ud7LaETHp4=;
        b=BZYIkV4w8rRbURU+Ik+zzlOYiC0GSCnAqjsH898jpsFuWHSw5StzAGlGAoq6gPbDWo
         32uX/K7clDwXvN6PHaoN81mBC3AIbjyNACl7LfTo/OkMJtD04Id1pZAhRwZFVkbLqjTr
         eSCJ850fszz7Qv9ithuxAHV1nj2/davYQTaGgzzZcGGY6YMvULOJ0ChoNYJY0EQCbaYF
         IN0XE6OkisU7OemwSw4T3CQjf/J5BERbfITwbSfE2VOdK0uY6fzRH2lLHh0y/jkkkyIU
         +4SuzVtqVzWnHonb3GMjCQ8CLR5PNUMvEssenYkVlAh0vLrvfaDYjPB22Y6lM1lHh6FL
         ynsw==
X-Forwarded-Encrypted: i=1; AJvYcCVXRxWz+yC7xrNHPNXmHyM4Onk9OAhXgNP/p+tA31Orv1PtytgkFlDFOyNj0hDiGJzCG6t9UvWEpHM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9nElKmcDH7QOVrcmlidLjh1vk5oyQIUKDbtHP/weZLgBdgqLk
	dA1qjYRcl6K4IpDqyw113ygB2GkdWMTckbV83ML6VfFwYLf6ibiG1x5NsYLu1RXHvh6y+4bapSW
	VsbvLWA==
X-Google-Smtp-Source: AGHT+IH4rM0hrWDLcj1m7KmQfI0LQhMNTOrUf9WMiZFUwgaE9DsfO2YaBs29AIBYl4bKM4D6uGtnUb5M7G0=
X-Received: from pjbsb13.prod.google.com ([2002:a17:90b:50cd:b0:340:c0e9:24b6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c89:b0:343:6611:f21
 with SMTP id 98e67ed59e1d1-349a24e3b08mr610435a91.1.1764980317071; Fri, 05
 Dec 2025 16:18:37 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:17:11 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-36-seanjc@google.com>
Subject: [PATCH v6 35/44] KVM: VMX: Drop intermediate "guest" field from msr_autostore
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

Drop the intermediate "guest" field from vcpu_vmx.msr_autostore as the
value saved on VM-Exit isn't guaranteed to be the guest's value, it's
purely whatever is in hardware at the time of VM-Exit.  E.g. KVM's only
use of the store list at the momemnt is to snapshot TSC at VM-Exit, and
the value saved is always the raw TSC even if TSC-offseting and/or
TSC-scaling is enabled for the guest.

And unlike msr_autoload, there is no need differentiate between "on-entry"
and "on-exit".

No functional change intended.

Cc: Jim Mattson <jmattson@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 10 +++++-----
 arch/x86/kvm/vmx/vmx.c    |  2 +-
 arch/x86/kvm/vmx/vmx.h    |  4 +---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 729cc1f05ac8..486789dac515 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -1076,11 +1076,11 @@ static bool nested_vmx_get_vmexit_msr_value(struct kvm_vcpu *vcpu,
 	 * VM-exit in L0, use the more accurate value.
 	 */
 	if (msr_index == MSR_IA32_TSC) {
-		int i = vmx_find_loadstore_msr_slot(&vmx->msr_autostore.guest,
+		int i = vmx_find_loadstore_msr_slot(&vmx->msr_autostore,
 						    MSR_IA32_TSC);
 
 		if (i >= 0) {
-			u64 val = vmx->msr_autostore.guest.val[i].value;
+			u64 val = vmx->msr_autostore.val[i].value;
 
 			*data = kvm_read_l1_tsc(vcpu, val);
 			return true;
@@ -1167,7 +1167,7 @@ static void prepare_vmx_msr_autostore_list(struct kvm_vcpu *vcpu,
 					   u32 msr_index)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	struct vmx_msrs *autostore = &vmx->msr_autostore.guest;
+	struct vmx_msrs *autostore = &vmx->msr_autostore;
 	bool in_vmcs12_store_list;
 	int msr_autostore_slot;
 	bool in_autostore_list;
@@ -2366,7 +2366,7 @@ static void prepare_vmcs02_constant_state(struct vcpu_vmx *vmx)
 	 * addresses are constant (for vmcs02), the counts can change based
 	 * on L2's behavior, e.g. switching to/from long mode.
 	 */
-	vmcs_write64(VM_EXIT_MSR_STORE_ADDR, __pa(vmx->msr_autostore.guest.val));
+	vmcs_write64(VM_EXIT_MSR_STORE_ADDR, __pa(vmx->msr_autostore.val));
 	vmcs_write64(VM_EXIT_MSR_LOAD_ADDR, __pa(vmx->msr_autoload.host.val));
 	vmcs_write64(VM_ENTRY_MSR_LOAD_ADDR, __pa(vmx->msr_autoload.guest.val));
 
@@ -2704,7 +2704,7 @@ static void prepare_vmcs02_rare(struct vcpu_vmx *vmx, struct vmcs12 *vmcs12)
 	 */
 	prepare_vmx_msr_autostore_list(&vmx->vcpu, MSR_IA32_TSC);
 
-	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.guest.nr);
+	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr);
 	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, vmx->msr_autoload.host.nr);
 	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, vmx->msr_autoload.guest.nr);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 62ba2a2b9e98..23c92c41fd83 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6567,7 +6567,7 @@ void dump_vmcs(struct kvm_vcpu *vcpu)
 	if (vmcs_read32(VM_ENTRY_MSR_LOAD_COUNT) > 0)
 		vmx_dump_msrs("guest autoload", &vmx->msr_autoload.guest);
 	if (vmcs_read32(VM_EXIT_MSR_STORE_COUNT) > 0)
-		vmx_dump_msrs("guest autostore", &vmx->msr_autostore.guest);
+		vmx_dump_msrs("autostore", &vmx->msr_autostore);
 
 	if (vmentry_ctl & VM_ENTRY_LOAD_CET_STATE)
 		pr_err("S_CET = 0x%016lx, SSP = 0x%016lx, SSP TABLE = 0x%016lx\n",
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index d7a96c84371f..4ce653d729ca 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -245,9 +245,7 @@ struct vcpu_vmx {
 		struct vmx_msrs host;
 	} msr_autoload;
 
-	struct msr_autostore {
-		struct vmx_msrs guest;
-	} msr_autostore;
+	struct vmx_msrs msr_autostore;
 
 	struct {
 		int vm86_active;
-- 
2.52.0.223.gf5cc29aaa4-goog

