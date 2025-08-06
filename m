Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517722DC355
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 19:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510313; cv=none; b=IPV4E+2QRGW0+KhDDXAx/wUixxGqVM3lb34nETfNlV7sCuMH9XSjYx/LiR+4lO871gKspElRB+KcaiQ4Z6JRd6J6iAF+R+J/m84j3ojlNsE14QvX1yPBadxvkWPXe7G23h/ZUu+tdaA85Fon7Jg0NbdkUTpyEFOcEYq9DZr1TO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510313; c=relaxed/simple;
	bh=1MpCULgJITNFp8BwtVBageH608sNes8/5DqfGMafEA8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RDx0FHu0o/LJhcldPaRYIIVA03Q7sGt4W+S78m4KMciu1ThIczyIRWKbcNxuFattepmwlxc4lgNF6yf80F5oEMTlY/bB1GV4gVq7x3XYnzOR4ZNS+e8VBuUVXYCwFoy47xm9zszdbO4rdv5XHTvtX+6IaGqmOdlI4Vh69NstV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BzD+ruux; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BzD+ruux"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2425e41424cso2209525ad.1
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 12:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510310; x=1755115110; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0x+D+og4ia0Wyj0NvWobUD8Pzlie97PfvMw2iXhJJfQ=;
        b=BzD+ruux4gtemo4ncMA2wkxEAGq4O/YLOfElBF+1uIaLxi9WFtkxV0t03bALsTdJ60
         dA5QK4KJDpsH0mvbV9ekbAsXtJxyzVELUC2J5Sqo/2twSE/DctnEHeB+TZ6MTQv5U3oy
         Ts/+FJK7T8JAjuOmel1pPF3zYHo4TFuEmjtpT7kqp+TtFYg+RzIChEKAKLoNVLGFgGEM
         uZM++LIGGiH8fdFknDCQk+rV3v6xpeJTRhB5jyL2L+eT+8A9mN8XsoSIizd/uCHI7KEi
         8ae0xcLkXZnxupN9bC4HelKrXa0HbLhCjMhoKzzZ767M/xLbR00iXU1csSDoZosHfzM+
         0YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510310; x=1755115110;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x+D+og4ia0Wyj0NvWobUD8Pzlie97PfvMw2iXhJJfQ=;
        b=DaxAollHle9UrTer/Ss57jZi4HrH7X/19mrl1F3APbfDH5uP5xxp7eM152MQKM9qBN
         Kz3RW7sUjxhGS2LzN53zp1DdH0VRwUJ6iWQjn85/ifOzQLIsPmR4z/z/fsuuEZ6PlR4r
         sm2+HHiH/ue9BVkZHeF5oUlfx/DdUDbTMBJ5lQSMKt1GaJxRgr/+Gn/FB9zgiNtjx5gW
         7sxsM0sAIMzCv77+BSGI31CQmVAmM2qLPKQ9LLuhMmKBZyzEZ+87JgAH93Ya7rcXYFPl
         Nz6NzkpHjWQlZNySc9jzWX74dw42SwuoaJC7pIkRXwMU+C8FT2oWB2UoSAbvVe9WUrPk
         uHew==
X-Forwarded-Encrypted: i=1; AJvYcCV0AFSmfAaVkPEurS7A6zI4DXjBAjds3Z23TgW4uj+uyBLxQ/DqB4h+VDziBF0IvcXI70rxPqVLFuM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6GrZyG6fXIZpI5RygQCIrQJ9reCbx2W7SQU9GpR4kkdtJYeah
	iBvlr5RqsXBU7cWo3Dwikfx5e4l1jiZu9EeIr62teFzm7/Xq7BXJX6ykGe6DLwhXHBrwTO09GZv
	X11HXng==
X-Google-Smtp-Source: AGHT+IHACZSLEKXNmtK1WJ2A5Z4mKbWmXm0xD8HleVhgcyjfcmK2gM+EKW1OlQ2W16ylb8rulTtPFwBYIyI=
X-Received: from pjoa3.prod.google.com ([2002:a17:90a:8c03:b0:312:14e5:174b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:98d:b0:225:abd2:5e4b
 with SMTP id d9443c01a7336-242b19acfe4mr5266535ad.16.1754510310549; Wed, 06
 Aug 2025 12:58:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  6 Aug 2025 12:56:56 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-35-seanjc@google.com>
Subject: [PATCH v5 34/44] KVM: x86/pmu: Introduce eventsel_hw to prepare for
 pmu event filtering
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Mingwei Zhang <mizhang@google.com>

Introduce eventsel_hw and fixed_ctr_ctrl_hw to store the actual HW value in
PMU event selector MSRs. In mediated PMU checks events before allowing the
event values written to the PMU MSRs. However, to match the HW behavior,
when PMU event checks fails, KVM should allow guest to read the value back.

This essentially requires an extra variable to separate the guest requested
value from actual PMU MSR value. Note this only applies to event selectors.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 2 ++
 arch/x86/kvm/pmu.c              | 7 +++++--
 arch/x86/kvm/svm/pmu.c          | 1 +
 arch/x86/kvm/vmx/pmu_intel.c    | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b891bd92fc83..5512e33db14a 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -528,6 +528,7 @@ struct kvm_pmc {
 	 */
 	u64 emulated_counter;
 	u64 eventsel;
+	u64 eventsel_hw;
 	struct perf_event *perf_event;
 	struct kvm_vcpu *vcpu;
 	/*
@@ -556,6 +557,7 @@ struct kvm_pmu {
 	unsigned nr_arch_fixed_counters;
 	unsigned available_event_types;
 	u64 fixed_ctr_ctrl;
+	u64 fixed_ctr_ctrl_hw;
 	u64 fixed_ctr_ctrl_rsvd;
 	u64 global_ctrl;
 	u64 global_status;
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 082d2905882b..e39ae37f0280 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -890,11 +890,14 @@ static void kvm_pmu_reset(struct kvm_vcpu *vcpu)
 		pmc->counter = 0;
 		pmc->emulated_counter = 0;
 
-		if (pmc_is_gp(pmc))
+		if (pmc_is_gp(pmc)) {
 			pmc->eventsel = 0;
+			pmc->eventsel_hw = 0;
+		}
 	}
 
-	pmu->fixed_ctr_ctrl = pmu->global_ctrl = pmu->global_status = 0;
+	pmu->fixed_ctr_ctrl = pmu->fixed_ctr_ctrl_hw = 0;
+	pmu->global_ctrl = pmu->global_status = 0;
 
 	kvm_pmu_call(reset)(vcpu);
 }
diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 9ffd44a5d474..9641ef5d0dd7 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -165,6 +165,7 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		data &= ~pmu->reserved_bits;
 		if (data != pmc->eventsel) {
 			pmc->eventsel = data;
+			pmc->eventsel_hw = data;
 			kvm_pmu_request_counter_reprogram(pmc);
 		}
 		return 0;
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 2bdddb95816e..6874c522577e 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -61,6 +61,7 @@ static void reprogram_fixed_counters(struct kvm_pmu *pmu, u64 data)
 	int i;
 
 	pmu->fixed_ctr_ctrl = data;
+	pmu->fixed_ctr_ctrl_hw = data;
 	for (i = 0; i < pmu->nr_arch_fixed_counters; i++) {
 		u8 new_ctrl = fixed_ctrl_field(data, i);
 		u8 old_ctrl = fixed_ctrl_field(old_fixed_ctr_ctrl, i);
@@ -430,6 +431,7 @@ static int intel_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 
 			if (data != pmc->eventsel) {
 				pmc->eventsel = data;
+				pmc->eventsel_hw = data;
 				kvm_pmu_request_counter_reprogram(pmc);
 			}
 			break;
-- 
2.50.1.565.gc32cd1483b-goog

