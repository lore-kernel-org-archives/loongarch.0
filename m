Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264272E174B
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510327; cv=none; b=Eqj2DuV3JBKLo/CGwoLnvvxAkzoHxg/0BOrzSj1GDN6M8Dk6AMjRd1gkDbJPd6jOYHLwA3CMVaXcZuwO627v7abVn2BYigac9d5oMUQY2XWBYRUnOMl2S834l5ZvFUBarpOKv7ognt76jzR24105upeATWq126Nn1FUQpp6cq4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510327; c=relaxed/simple;
	bh=mktiJzkM34N6Zf3/nCj8gPSMPc22J/Q3PSgyAnIfDJg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BqA1qbteb7Eil2N/rya3qdHrSoKfcE4xL056pa0T5Vk92ybso/hsSrTV2iGEfoUFisML9qOuIwibeutjxLeAiqiaz42zPNgT7FzH+1dLv9pv1koi+OZAhYxpUcsGTLhWCAHTQTai3YEzqMBgDXCRrX2ZxPDWu1Ozfhp1otR2ZVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hHGSnOd+; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hHGSnOd+"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so240451a12.3
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 12:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510324; x=1755115124; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aIwiS3b08lZbnfZBzBRHsRLYuS/hl5WgYmD0pyHBLVw=;
        b=hHGSnOd+j/SOegJZTXk2aSb2Y09L9Jy3ja6FOFQc93ixxwvBVvr8mUeC5nSpSE02on
         C4PE4ADG7aOhkIyI/pLvL/nqD/jRtUf6NsSaLmHB4aZdzQHLLWU/oUj0/jOBTtIJwUCs
         ZcjegzI2639dZop7MmzRkn/8PIR48ZzwXB5gutK3skS0Gxn911etSQQnnlTZzxl7b2xl
         VI8EBqLUq17trBGDM/rV7mJp01oe8sVJLewK6DhEma5vMwp2ixuUzNLzxiP+eFVXnRop
         ca1xSm3JPoLac8h5m9WWtmivP7+264Hkt5l5UNzes5ibBbbTcvcl7xfYKfBMtsysT7Kp
         V5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510324; x=1755115124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIwiS3b08lZbnfZBzBRHsRLYuS/hl5WgYmD0pyHBLVw=;
        b=RHtO/m8cDsYRpvDVOoohYASbtPKQyQprNavQp4EMl58NAlBZQ2tcgUJTML+FLVezdZ
         UC2bQ+fWm/1LMX0MGpv4OAIgC9fn614ndhI7Az9t/h8OxJJMDfwD0+yRX+XDsRxyrn8R
         Wq3Si8nqXtwWQ8py5S5szgTTVjxlYcTK7ly6kihvd+YabCTBVvEVu13mss/m9b8RffXX
         rh2d4ReeF6ZN9eB9DaMQEHsHIl92pXz3zo5M7uUKQem3udtkM13kl9gZjENU+2DjzaAp
         X3zN1NDUyewQk0NxA3gaGRJKftnDL9u8Fwv1PNO/t6yuzSKIm6GLqOw1xxezM/JINwdP
         zZNA==
X-Forwarded-Encrypted: i=1; AJvYcCV3PfLezuenHunuwz41ymW3zBQO3j/w7k9HK8sqcBbMdJYBO4HVdD4LeZKLqhtdK7sEFBvGjIZKuZ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQSvPQcmLAMZb0cUKQfkvo1O0fT9mnehzUIqpeFEwdwbkAzlGN
	rR7XT1IchOAw2O28bkbXpiBnBKYGlNBXgflQIvRuaJJwRKqPYwQJxP3pCVYH1v9RUtVuDcj4LII
	+Lctkiw==
X-Google-Smtp-Source: AGHT+IEQR+T9dam/zfnLIV/i5izf3PHRRWb6ka2239rbCk7AqXY3VxMNYGaiVe7zhD28m3tT7rq7DHc261E=
X-Received: from pjzd15.prod.google.com ([2002:a17:90a:e28f:b0:312:151d:c818])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f645:b0:240:150e:57ba
 with SMTP id d9443c01a7336-242a0a90e7amr55806795ad.3.1754510324526; Wed, 06
 Aug 2025 12:58:44 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  6 Aug 2025 12:57:04 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-43-seanjc@google.com>
Subject: [PATCH v5 42/44] KVM: nSVM: Disable PMU MSR interception as
 appropriate while running L2
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

Add MSRs that might be passed through to L1 when running with a mediated
PMU to the nested SVM's set of to-be-merged MSR indices, i.e. disable
interception of PMU MSRs when running L2 if both KVM (L0) and L1 disable
interception.  There is no need for KVM to interpose on such MSR accesses,
e.g. if L1 exposes a mediated PMU (or equivalent) to L2.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index b7fd2e869998..de2b9db2d0ba 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -194,7 +194,7 @@ void recalc_intercepts(struct vcpu_svm *svm)
  * Hardcode the capacity of the array based on the maximum number of _offsets_.
  * MSRs are batched together, so there are fewer offsets than MSRs.
  */
-static int nested_svm_msrpm_merge_offsets[7] __ro_after_init;
+static int nested_svm_msrpm_merge_offsets[10] __ro_after_init;
 static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
 typedef unsigned long nsvm_msrpm_merge_t;
 
@@ -222,6 +222,22 @@ int __init nested_svm_init_msrpm_merge_offsets(void)
 		MSR_IA32_LASTBRANCHTOIP,
 		MSR_IA32_LASTINTFROMIP,
 		MSR_IA32_LASTINTTOIP,
+
+		MSR_K7_PERFCTR0,
+		MSR_K7_PERFCTR1,
+		MSR_K7_PERFCTR2,
+		MSR_K7_PERFCTR3,
+		MSR_F15H_PERF_CTR0,
+		MSR_F15H_PERF_CTR1,
+		MSR_F15H_PERF_CTR2,
+		MSR_F15H_PERF_CTR3,
+		MSR_F15H_PERF_CTR4,
+		MSR_F15H_PERF_CTR5,
+
+		MSR_AMD64_PERF_CNTR_GLOBAL_CTL,
+		MSR_AMD64_PERF_CNTR_GLOBAL_STATUS,
+		MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR,
+		MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_SET,
 	};
 	int i, j;
 
-- 
2.50.1.565.gc32cd1483b-goog

