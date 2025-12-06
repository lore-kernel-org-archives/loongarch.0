Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A431F4180
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980277; cv=none; b=fdfFbX1HxFtVhTDUExj3eSgyIksaO0OHi7Xu7iDOfJkxU+r6wbnVpTHHZBxZZ6Ix/ehQZymMc28Miii1pyBiFCA7mhkyL2O0ALCkFGN5L3pv1oyaWtrIMhPzm9wEeovBLk334QFUv7p1+4A2YlShMUIXnwD0VvN7hKjOXEm2pWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980277; c=relaxed/simple;
	bh=kkGqe6G69RBgrV2U1NfzL4MrQRt1WC2zdHXtUBZdM0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CWBFd47HjzgaGqhuh5Am3ha9hNjQLjY7L8TX7WlRt1Q5V4pcd53GdUKroVTYxz19Q3BseN5DdqbuYroy5PcfR94Jdv2UJ5jRA9aFk1Usq09pt9loPJDYS4Grub6E81AJFkpRKoTXbNV/A3yBLu6CPx5pfycG4tgiTefgSfbe4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FvrPWsvl; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FvrPWsvl"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-343bf6ded5cso4769531a91.0
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980274; x=1765585074; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eqIotjgCjEUdnt2WiVnuNRmRS2dnPuXPiOvBLci8ppE=;
        b=FvrPWsvlF1A37A1F1MXSG1YL1iw4HcSe9AST6LOAk22TN8y/q9v6ELsQL72eKaPxwF
         fO88p641Rl3VRCnK8JTG7cnD9xqyfx8PuoJT97WbQJ1qONOHtIG94OOKUrw8dJjO+swU
         SQ9mb28lW/QwK/Je1J/V3Vs6m2TedZz7G3YGUt9/FBsIzi0vBthZq9VaKl54JtCZ9g1/
         5hmRSClkwK3N292v8jTf0Ooj3e2VzevTDkOR/6KP/bKSQVnd+5WLzVaXfZkHfZwoQQYM
         tnH1xXp9SWSr984xC3X9vGUACPOhQ9SA2NOqgcMkuznn49qnTHAGfTEwD3dH4Bc9iw4O
         etpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980274; x=1765585074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqIotjgCjEUdnt2WiVnuNRmRS2dnPuXPiOvBLci8ppE=;
        b=dfqaMAlrjJMQqa95jedQbL28voe3gZ4IS//qbN4mCv7MIHNP/oyZriftoVImgKrS66
         BYzENC4Ts2sy9MmY9qufLiW61WL5FIwEymXKn9v2tMQxbPbeX+egq9hRBUnrZgLeHo5y
         RXrmNB+oJhYrbz/a8LTqoKHRZMoN8tAgM5IJHq8SzsaZkFX3JX7js2qOO9piXS92RMPn
         /h2uJTx1BjQYGBuOF2WbxmNuWwDrnZMahfVyH97hJlWIhi4esCbVkk6SrHTLCACaE6M2
         83aoIXIKqFzg5qvFbtsVhYfVCodCXJC/G2bh/ABOLBY5bMSQXaADi7fWTsUjknxs4xio
         IKeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIPDWEWHF0+kgGnsydHNxuqiN0h2jFPxpDU7jJcwd7YlHg7rkL8cNaMSWhMKyoNQXk8MBZr199zW4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTGko1VUHKBoo+un6+b5DmDwl6lJUCPomK3aa2pVOl1gjj8eEO
	DjUIXr+Fq+Iad3Rgszf1I0EM3fVTpUhM9FKxrFoZQGrJdX6JxqXWQf85Xrv26xblO3i84TZgZIH
	mZ2C+TQ==
X-Google-Smtp-Source: AGHT+IEouBZxtWhTrY4lnM9VAu4F3ROpN1DG3BfY+U/j8YLDQib06swOT26j4RpeJbHBlGNlXEC9N5U6nuk=
X-Received: from pjps10.prod.google.com ([2002:a17:90a:a10a:b0:340:99d8:c874])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3fc4:b0:32e:7270:9499
 with SMTP id 98e67ed59e1d1-349a2383216mr737832a91.0.1764980274477; Fri, 05
 Dec 2025 16:17:54 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:16:50 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-15-seanjc@google.com>
Subject: [PATCH v6 14/44] KVM: Add a simplified wrapper for registering perf callbacks
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

Add a parameter-less API for registering perf callbacks in anticipation of
introducing another x86-only parameter for handling mediated PMU PMIs.

No functional change intended.

Acked-by: Anup Patel <anup@brainfault.org>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c      |  2 +-
 arch/loongarch/kvm/main.c |  2 +-
 arch/riscv/kvm/main.c     |  2 +-
 arch/x86/kvm/x86.c        |  2 +-
 include/linux/kvm_host.h  | 11 +++++++++--
 virt/kvm/kvm_main.c       |  5 +++--
 6 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 97627638e802..153166ca626a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2357,7 +2357,7 @@ static int __init init_subsystems(void)
 	if (err)
 		goto out;
 
-	kvm_register_perf_callbacks(NULL);
+	kvm_register_perf_callbacks();
 
 out:
 	if (err)
diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 80ea63d465b8..f62326fe29fa 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -394,7 +394,7 @@ static int kvm_loongarch_env_init(void)
 	}
 
 	kvm_init_gcsr_flag();
-	kvm_register_perf_callbacks(NULL);
+	kvm_register_perf_callbacks();
 
 	/* Register LoongArch IPI interrupt controller interface. */
 	ret = kvm_loongarch_register_ipi_device();
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 45536af521f0..0f3fe3986fc0 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -174,7 +174,7 @@ static int __init riscv_kvm_init(void)
 
 	kvm_riscv_setup_vendor_features();
 
-	kvm_register_perf_callbacks(NULL);
+	kvm_register_perf_callbacks();
 
 	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (rc) {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0c6d899d53dd..1b2827cecf38 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10107,7 +10107,7 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
 #endif
 
-	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
+	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr, NULL);
 
 	if (IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_mmu_enabled)
 		kvm_caps.supported_vm_types |= BIT(KVM_X86_SW_PROTECTED_VM);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d93f75b05ae2..8e410d1a63df 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1749,10 +1749,17 @@ static inline bool kvm_arch_intc_initialized(struct kvm *kvm)
 #ifdef CONFIG_GUEST_PERF_EVENTS
 unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
 
-void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void));
+void __kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void),
+				   void (*mediated_pmi_handler)(void));
+
+static inline void kvm_register_perf_callbacks(void)
+{
+	__kvm_register_perf_callbacks(NULL, NULL);
+}
+
 void kvm_unregister_perf_callbacks(void);
 #else
-static inline void kvm_register_perf_callbacks(void *ign) {}
+static inline void kvm_register_perf_callbacks(void) {}
 static inline void kvm_unregister_perf_callbacks(void) {}
 #endif /* CONFIG_GUEST_PERF_EVENTS */
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4954cbbb05e8..16b24da9cda5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6474,10 +6474,11 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.handle_mediated_pmi	= NULL,
 };
 
-void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void))
+void __kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void),
+				   void (*mediated_pmi_handler)(void))
 {
 	kvm_guest_cbs.handle_intel_pt_intr = pt_intr_handler;
-	kvm_guest_cbs.handle_mediated_pmi = NULL;
+	kvm_guest_cbs.handle_mediated_pmi = mediated_pmi_handler;
 
 	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 }
-- 
2.52.0.223.gf5cc29aaa4-goog

