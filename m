Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3EE1DF254
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980273; cv=none; b=cBngmTOBEIxCeXuI6vnnpQU+7lPTiPhxwzt67G9F2cQbWGu9g1MCB0hGPmzZZfSKfGXMUzjRvCZMSGcWzatANyRjcFZDaQ88i8VPulxdJ3F35xLPUEglGRWYpFFRU1KH37gk/9zS4FJYeDwN6euccILDw5Tn9iHJxDCU8b+Im1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980273; c=relaxed/simple;
	bh=o32NYSL5oP89MnyU43/Lrt7hcO0vsyjmOnag53iPYE8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MljQS0Yzx/P1nrHLMHBYoI0u7NzTX78Wot21wgcqoS8zz4F4tkZEXSvQIpaaKquABKtl7E3qKAn8RE53e6XLHkY2UfdZ8t3sTWVkNrvLH370VlPOQQeq7/E5G2gLQSxF9hytsfkmLumgBBLCBL9DdPJmWdjVRDo7wZjbX/CyWzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ExcDrhb; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ExcDrhb"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so2996506b3a.3
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980271; x=1765585071; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=704FSrHxrLR1ctx2c3pAZj/r3vJEFglglFSFFl0Rh7E=;
        b=4ExcDrhbJhCIT7Pcwr3DRKcfTReggBkvfcR5e6Amzr4XGbVWlrE6jNdTcC4uknk3xW
         xKLgvaP4chznucOXLRkJV9+jBYqa8kXpDCdVuJ6nSmM1a/5H9s+bhAmfTqt2W4Zj56bv
         /I0rq1fwMVvuKd/VndIcHPJ5kYszzDYGrRICH1j4e+EOdC1ZWhTtWsw51c0atD0AcDq1
         i7udCCzfRE/OOhmaDrPZmRAgf5Xl1VIseD5nWEKzzt0MDa8f2sZDI2U5xAfl6ht4i/Yz
         tgiuNuyZnP4idXdnulWYEMn7KBIkkZ2P4ugtBFZklc7dFFp9dQ9H9dT88cVPoDzrXDhn
         ho/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980271; x=1765585071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=704FSrHxrLR1ctx2c3pAZj/r3vJEFglglFSFFl0Rh7E=;
        b=WLKeq6goL+kAcoM67b+Yhd0mK+5hWFCO8NN+QkS6uzS7nLWQ/1+XRLb3xQ5a045yRP
         ek5bRHb7qPZv4AOKE/I0BaTDSTaE+enf0nJYU6XmD4YnCby0x47kz9PdlJLq6jidkXIq
         466L7EIDKas4Sre/h8Tus1z9nsQpju3p/jC9INqMBbOfwEfXwa8yjRmhT5m3IhlEwM8J
         vU5c1tqFVMC5d3piNbq2r3Tm8B1EUD8SyP7uuLJo4cpBenlRjRNg2H8NWjAh6NROmDZM
         WhTP4hl0zFnytp19DC/glOhrPKrqG0idnsDC/nlmu8PFFkdpWbVysIGpLYR2clrFmTm2
         ZHeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk0hLy5FFb8inb4FPUw4fqXY/hYaxwH6PmAXuHTkhZToKgO7kyqQWK77oediCbdYJVpdeb+R3fEzY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxujy8+xeOhZPKW+d4AtREiZFU6eEsCvk8b9TF5+Jfzv3oq7mk
	VfWNpKyoLF2zEOV2iggfmbdKKX0Xrp0waUL+TKqcs3ngmrTSLjzsX2imBHYbQtGoBPVkNScPiI6
	77YlDUA==
X-Google-Smtp-Source: AGHT+IH7A1gUOgKFKJnzRngtLUVtNHZRNw8i6EgWRT3b89IXq+CAXu6n1GyBnJNQ7qWDwlQy81DLJeMmjzQ=
X-Received: from pfnr5.prod.google.com ([2002:aa7:8445:0:b0:7dd:8bba:639e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2347:b0:7e8:4471:8da
 with SMTP id d2e1a72fcca58-7e8c8924252mr849439b3a.59.1764980270980; Fri, 05
 Dec 2025 16:17:50 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:16:48 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-13-seanjc@google.com>
Subject: [PATCH v6 12/44] perf/x86/intel: Support PERF_PMU_CAP_MEDIATED_VPMU
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

From: Kan Liang <kan.liang@linux.intel.com>

Apply the PERF_PMU_CAP_MEDIATED_VPMU for Intel core PMU. It only indicates
that the perf side of core PMU is ready to support the mediated vPMU.
Besides the capability, the hypervisor, a.k.a. KVM, still needs to check
the PMU version and other PMU features/capabilities to decide whether to
enable support mediated vPMUs.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: massage changelog]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/intel/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index fe65be0b9d9c..5d53da858714 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5319,6 +5319,8 @@ static void intel_pmu_check_hybrid_pmus(struct x86_hybrid_pmu *pmu)
 	else
 		pmu->intel_ctrl &= ~GLOBAL_CTRL_EN_PERF_METRICS;
 
+	pmu->pmu.capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 	intel_pmu_check_event_constraints(pmu->event_constraints,
 					  pmu->cntr_mask64,
 					  pmu->fixed_cntr_mask64,
@@ -6936,6 +6938,9 @@ __init int intel_pmu_init(void)
 			pr_cont(" AnyThread deprecated, ");
 	}
 
+	/* The perf side of core PMU is ready to support the mediated vPMU. */
+	x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 	/*
 	 * Many features on and after V6 require dynamic constraint,
 	 * e.g., Arch PEBS, ACR.
-- 
2.52.0.223.gf5cc29aaa4-goog

