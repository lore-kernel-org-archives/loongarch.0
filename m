Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21382BE632
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 19:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510309; cv=none; b=t2Tgi7mJWLwh6Ak0nux8bT9SQxpbQiaMZKdmtYafFTpNXLRVDqvrlgOUaUWp43IaLvCaU0cyKvXMysY5wkcUZf+tR9kAM6uLwBqv8r8bP9oBi8IZkDHVJwEt36oO/3ZRXo0jcDy6sVPS1lh54hfEe2jijJ2x2EExjpYWZx1RpYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510309; c=relaxed/simple;
	bh=ukS/hePPonycrg9r313f+paqDEVzP34VnPUrCOh2p4I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bYXpP/uHmXTV59ZgSjoVIIDfqGAulx4ezz5j0rBYO9T4yam8VPnhkPYBi7fqHHg/X5nsSYb7SHOtgL/L2a55nJNdsOxY089LTilD4uCpB8zAzCLijIckoSlpSfEf3APIogmebmXMpoohF/Tt1dCRVN+SdZihQOLf0xWs3BBGKu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uqtojkb0; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uqtojkb0"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-76bcf2cac36so317092b3a.0
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 12:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510304; x=1755115104; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aHvZdAUvNaaZFmbhTqFilDj1JXSRU8dLYlLgEZc/oCw=;
        b=uqtojkb0LTOG0Jn0B9hKo64qCJY0zEZMsvO62ndVkqCg9D61RklTBf73Y4ZZqt3fp4
         0TmjEiyFu5Asc2WpHAehrYYQ2po+jNKC8l6XYUHEGVSqQglFpeWF4lkI249xDkSdu+WU
         JtOa2eta/7Vl6FteFKfQYsMKnh6imC9L9BBu4Zjb1ztu6iFvdRkgtlvLkXynT2Unb7tn
         mcqZNgKuyHPqosv3EeJUR30z1AV1y2YdJMaf/e34lGQsRWFtCzccvYHDAqbTJyo3orsT
         j8Ca3v4EShudppGJ5aKHpmPZmUNZ79EY7QxWMc41hsFWgOKiurWsy8Aro+Zstb2pi59j
         10QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510304; x=1755115104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHvZdAUvNaaZFmbhTqFilDj1JXSRU8dLYlLgEZc/oCw=;
        b=MZYkS5o31PgU6zqixy8wSB6f5ZyT6Pp2WQoCabVPyVZ1xZPQFuBOMd0/7ey7JU3HtG
         kVQZU6SmCEs5c1KriUTS7MXY7xwqD9RPRotjUNL46PKJ0lIoOvrGaiKIRByq7D2tSGA5
         f0F6/xGu4Bq0pLpueXV9IduxeiW/xUGWTrbF7CSkGg5njybGvlLpXnGq+sztfU2ULuVi
         HAnXNa4B3phP5ae1KY1pPYEFiG7L36V1o2XsW4uL/365ekShXS39kzpHLBsiDZZFQNTq
         U4K2YQKwNRrz48xKb+uenJm0TpOWMPUNfRlNOkx0UoVGdUFkEW3/HsszpjjISvvAYGRo
         ipxA==
X-Forwarded-Encrypted: i=1; AJvYcCXg9NNRYxasGU6KSWs3O1Sl1rq+uZMN4FLpcde89peZ1kXV5G/qGKHKnYdDoeuqNR5rLEixvVE8Qok=@lists.linux.dev
X-Gm-Message-State: AOJu0YwG9jJJJuKn0SF4t2yjb6zCMumgSiPCQ0OVOcFtPEdn09FFZDj1
	9FzXVddrGd58jb30u1Oc/s0TNZFKVYL3115G6ZfsNrvZ+3J3jCQttHtP//Vn818JaLYJZoM6XaK
	EMgio9A==
X-Google-Smtp-Source: AGHT+IGfcxFcqE+WO40f0G1jJJ785vOiC3NUhX/6TGZEyq4CvV1J0auJAX6NhvanreP79iKSuzsragVBkJw=
X-Received: from pfvf15.prod.google.com ([2002:a05:6a00:1acf:b0:746:3162:8be1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:999f:b0:220:78b9:f849
 with SMTP id adf61e73a8af0-240331272admr5902393637.24.1754510303927; Wed, 06
 Aug 2025 12:58:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  6 Aug 2025 12:56:52 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-31-seanjc@google.com>
Subject: [PATCH v5 30/44] KVM: x86/pmu: Move initialization of valid PMCs
 bitmask to common x86
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

Move all initialization of all_valid_pmc_idx to common code, as the logic
is 100% common to Intel and AMD, and KVM heavily relies on Intel and AMD
having the same semantics.  E.g. the fact that AMD doesn't support fixed
counters doesn't allow KVM to use all_valid_pmc_idx[63:32] for other
purposes.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c           | 4 ++++
 arch/x86/kvm/svm/pmu.c       | 1 -
 arch/x86/kvm/vmx/pmu_intel.c | 5 -----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index a4fe0e76df79..4246e1d2cfcc 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -932,6 +932,10 @@ void kvm_pmu_refresh(struct kvm_vcpu *vcpu)
 		if (kvm_vcpu_has_mediated_pmu(vcpu))
 			kvm_pmu_call(write_global_ctrl)(pmu->global_ctrl);
 	}
+
+	bitmap_set(pmu->all_valid_pmc_idx, 0, pmu->nr_arch_gp_counters);
+	bitmap_set(pmu->all_valid_pmc_idx, KVM_FIXED_PMC_BASE_IDX,
+		   pmu->nr_arch_fixed_counters);
 }
 
 void kvm_pmu_init(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index b777c3743304..9ffd44a5d474 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -209,7 +209,6 @@ static void amd_pmu_refresh(struct kvm_vcpu *vcpu)
 	/* not applicable to AMD; but clean them to prevent any fall out */
 	pmu->counter_bitmask[KVM_PMC_FIXED] = 0;
 	pmu->nr_arch_fixed_counters = 0;
-	bitmap_set(pmu->all_valid_pmc_idx, 0, pmu->nr_arch_gp_counters);
 }
 
 static void amd_pmu_init(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 6352d029298c..1de94a39ca18 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -579,11 +579,6 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 		pmu->raw_event_mask |= (HSW_IN_TX|HSW_IN_TX_CHECKPOINTED);
 	}
 
-	bitmap_set(pmu->all_valid_pmc_idx,
-		0, pmu->nr_arch_gp_counters);
-	bitmap_set(pmu->all_valid_pmc_idx,
-		INTEL_PMC_MAX_GENERIC, pmu->nr_arch_fixed_counters);
-
 	perf_capabilities = vcpu_get_perf_capabilities(vcpu);
 	if (intel_pmu_lbr_is_compatible(vcpu) &&
 	    (perf_capabilities & PERF_CAP_LBR_FMT))
-- 
2.50.1.565.gc32cd1483b-goog

