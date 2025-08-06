Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EEC2DE71D
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510317; cv=none; b=bstvqyf9QVpiZIlOdmhHGxMjcoPz4YF44FQ/Cec86cvIGyw8kDqEh3M2ZC1V2fRkukgNBc6QOrlhR5EwR5F6Ff7z5bGTJFnxVre5bJu4fGiw0URQMtNdPGY+I9aV43yqi6kbLygQCkWenOHmHGWspUw1Hgpixgbp8AFmDHZ8l6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510317; c=relaxed/simple;
	bh=QVIn0+kukbkiW0o85fHutqEBFnL/lbFRNdNnmVngsXM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nfKOcEyMNOAxpWmdaz41ntW6onv5KoFRaDnXR1mFJyY+u26wIPlTHNBUkhuq8NkGBlqRWQlhtdzTlRAoYgiGk3OmWXPJYHAhtSGVkltuSRk4bx6iQD5Pb5WWb4ywmz3EwWHjWLDZnrgvnhQaq25ctqPI45SRmJmJSIfF67Kp70o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SQjj3zaE; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQjj3zaE"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23fed1492f6so3159985ad.2
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510314; x=1755115114; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi5hsDnuks7nSFD8RayInQ9oz1eBhk4hTX7Cx/64BFI=;
        b=SQjj3zaEtE32K5xKvSZY6ZPeOfM//PgH0iBODSF6Ovq4uWOuBJg+oeWkEhZSetSmDB
         uREt9Ayu5GwMb+z9y+EWVcTwoqJ7BFMuymVv8kC9bUY83xSieesFP+wJ0kK1+DMgNA3x
         kn8KTga9dQ59V9P0Q0D4yCQYk+BmssbHLKyLeMQdbU+UBsYE/qRCB9T2VUXFwgPt8NmY
         nBj9KcaqvLI0Ot9JOh6zPRmILb8eL0WC0nmpi8KgGgMJTResRqWC0WWEbPrLUUoGHajZ
         6tkmg6q5pcjZVxQSfjHevjTNsCMmo05Ux0+iew8IBcIFBlBHRQAC7ttmGV9VVEvGUxUV
         2Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510314; x=1755115114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi5hsDnuks7nSFD8RayInQ9oz1eBhk4hTX7Cx/64BFI=;
        b=kBwCVOTAC4Lhu5A+BSnhXQsWRQ+Mgsi6EXUx0w9ppJsNlS63HoVxHIi8Hf6cK4rvNO
         XwV6UIs+/2mZjLaTvWSv6TBwxaiOdhBAr/zOEGV58vDQtSk+NHwqBE4bZmydOuQ511GA
         SD3MbLTdi3hvS2eR0jF2Epc80SmjQSO4PK9ODqFvqxqCIa4Vx5LD/WqOML8h8oBpt2bn
         yfBP259/ybheE1Yhrqcp+IJwAV+o1nVZgPVvdG1MZnZzUxc5d3em98F6KRLKpCYljmj3
         NGqxYLOdstSeE2h99og1jloNJu+bWrgEODXGtE9mjcmJZ/URlbEJ8VQlm2ik282SMNtj
         Vyqw==
X-Forwarded-Encrypted: i=1; AJvYcCWajPG2w2hSWOp0sjomY/Un50pqHiDcG8NxQZy1k1CknLKNtzdxKHLQQFr2QTarPPGRsR+klGLcnB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMXwR5qdQnzGoCn7zKf9ubm/m3OyTZGyO3d7GAwl98hMf8/V7Y
	jdyVOVA6JW5LhPop/BAPRcWZ/asbarlSPp30T5XVkhAavC4Mc6m7u8FGZW3F/K7P2szRK/ovYCI
	bMrtD1w==
X-Google-Smtp-Source: AGHT+IEJD5GH7UI5TAAlffejmtsOUdJu9B+mpPPWAxLwTCJvZJKLbNbFAds3hHNJ28h7v90ap7LjckKJrbQ=
X-Received: from plhl7.prod.google.com ([2002:a17:903:1207:b0:235:f4e3:ba29])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d581:b0:234:d7b2:2ac3
 with SMTP id d9443c01a7336-2429f2eea48mr59065095ad.20.1754510314065; Wed, 06
 Aug 2025 12:58:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  6 Aug 2025 12:56:58 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-37-seanjc@google.com>
Subject: [PATCH v5 36/44] KVM: x86/pmu: Always stuff GuestOnly=1,HostOnly=0
 for mediated PMCs on AMD
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

From: Sandipan Das <sandipan.das@amd.com>

On AMD platforms, there is no way to restore PerfCntrGlobalCtl at
VM-Entry or clear it at VM-Exit. Since the register states will be
restored before entering and saved after exiting guest context, the
counters can keep ticking and even overflow leading to chaos while
still in host context.

To avoid this, intecept event selectors, which is already done by mediated
PMU. In addition, always set the GuestOnly bit and clear the HostOnly bit
for PMU selectors on AMD. Doing so allows the counters run only in guest
context even if their enable bits are still set after VM exit and before
host/guest PMU context switch.

Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: massage shortlog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 9641ef5d0dd7..a5e70a4e7647 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -165,7 +165,8 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		data &= ~pmu->reserved_bits;
 		if (data != pmc->eventsel) {
 			pmc->eventsel = data;
-			pmc->eventsel_hw = data;
+			pmc->eventsel_hw = (data & ~AMD64_EVENTSEL_HOSTONLY) |
+					   AMD64_EVENTSEL_GUESTONLY;
 			kvm_pmu_request_counter_reprogram(pmc);
 		}
 		return 0;
-- 
2.50.1.565.gc32cd1483b-goog

