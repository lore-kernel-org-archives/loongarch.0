Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214185;
	b=OFRkVEG4DXCDQjkn+ME2B7yQON915qwSeBp/emh8bFKAfYc5klADHNWcyFCpdiMJgbZy
	 N8Jyf5lVnOhUlhJajPd0+9l7rXXfNXfTizCzU4q7t/LSuolKO3LyHDBkEMMTorbfl7Id/
	 f9QsHsWnTuBmFwCfcqLeiEMMnYvtKE/0TAxdeCSlBK3BWd8fkKZkbXXOvEwJRRrWYn7Kn
	 fzDvm7SzxXHRfxYseQOAH18vJZiXzUHorP5XedULFvZuMRkhDUKNlzDuhFC0X3ZGW1egc
	 wl8VAV3b/oiDnd1S8SRx+9ZdcMhrR1JAQOpGUtUqcBY0qmTLkITgAmaAO/2rgyaL3BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=ua8GfkfDrHDUR8px+Sy19+vmLzFSWzTq6VAHh+SakiE=;
	b=WkNGw96DUhllTXHLKhXsH/vGMiV0e04ozrXPVG2PEp4i5XaoY3L9hVwebZm7WjgsK4ar
	 9OgF+vGYvigk/NTRR3PVqa8/GMHU3toID7Go2i6cJPm8CfasdWUjpUQ3Lczpa7BpZEHyQ
	 QAB7B2XgqnHoK5MBy8L8B63UG3qnz21Gw07EK7/OLcrbcWmGIudtEDoB+C3nSRrTP/03B
	 SXAMEWY2ynL/klZBRwFpyk6r28OomKVegi49i6X4kgmIQOZr0AGhjP16gCaaKG4UdYQnw
	 ZqmjPPSuAA+PC2kp/DtpxCkiOjxtASA1RKz6PuELl6mwq9s9a21FD0DAuzNMLL4jT5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ChVpqnYU;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE2560A261B
	for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 19:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE2560A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ChVpqnYU
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so1072076a91.2
        for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214184; x=1793818984; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ua8GfkfDrHDUR8px+Sy19+vmLzFSWzTq6VAHh+SakiE=;
        b=ChVpqnYUSObtNDjP3gsn7w89mdeVXz7wWV+pEyn5Rr+WJ/Dk5PV4j/T0+BQMd5dTPm
         dh8t611rVk2ak4bWR0byyCyVoAFZIUsgFwdu5m9KXfpG+9Cidg7C8Jm9agYmZtLdGTjB
         3B/kePNLyfRwv7IqqY+Jhso2GfdpRgHsk7xZb72Hcgyq0crirl6KtNqgUGLynPovPUnV
         GPhj//trdUoYHvjgVdAt8ByUv+9rtnxcGz1+2OqDBBbhnLSxV3+0fTOHncNnUJR3a7F3
         tDt6RSYHVWyGZFNFX5XwOucuq0IxH+RDrN23r63L3+XPRgQycpofawOrNOsBfNdxSwKU
         6Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214184; x=1793818984;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ua8GfkfDrHDUR8px+Sy19+vmLzFSWzTq6VAHh+SakiE=;
        b=OS1Gnj64zO2FcCLJEAxvg7EnXkpICdryZgdwRtn8Vy5jTCOtTtisx2ZOrxFNKHqWgo
         DPYFARw8PW4aVFcti8lNxynQjrEhQ8XX+iG6YbR/XNKhYRQs3LFv1jHNTSLqWTbPCUbi
         m9gxdoScQ79WCEJ4o5DRBhnImIBBV2A8ICfKO1O4i1c2DCL86TCticSiMVqTpnAi8ge9
         VYcxIddQbgNc03p5k68C07wD8M4d9WDHsP9Ov7K6ymx6THxMzySIB7m4KBDfcqHw8HKM
         2ULZ73CHWi0bPMhaD6i/TExYYjQQWuNuwsEwLmaeDGGgjQAidAreWZi9HWdhLyutd/if
         j2iQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdNDtYT3VWzUCIgD8uurdZC/U9i+0IPHh1m1EOZ+HzOjxswQKoi9Jv0e5zWVYFOOZbtC5aTMbHUQw=@lists.linux.dev
X-Gm-Message-State: AFq9FYIsUz8DK1ZhFDZ4IDMY8vEGqbIwYMPEOpxIpifkBRK91Bp5njoI
	DK+PlZiFuofLonTV5K42QIKwh0se1IX5su2UW/NkccRVncsS7QtBT5lPn2nMwmvfimxqPH81E5Y
	YnjehRg==
X-Received: from pjbov14.prod.google.com ([2002:a17:90b:258e:b0:3a8:d9d:78ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224f:b0:3a0:b312:1fbe
 with SMTP id 98e67ed59e1d1-3ae580a7ac7mr2187674a91.23.1793214184152; Wed, 28
 Oct 2026 12:03:04 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:54 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-3-seanjc@google.com>
Subject: [PATCH 2/7] KVM: Add a @force param to __kvm_vcpu_kick() for PPC
 backwards compatibility
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Plumb in a @force param to __kvm_vcpu_kick() to force an IPI without
checking kvm_arch_vcpu_should_kick().  The param will be used to drop
kvm_arch_vcpu_should_kick() in favor of kvm_request_needs_ipi() without
regressing PPC, which for unknown reasons unconditionally blasts an IPI
in a variety of kvm_vcpu_kick() flows.

No functional change intended (nothing yet passes in @force=true).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  6 +++---
 virt/kvm/kvm_main.c      | 10 +++++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910a..3b9844c3906d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1570,11 +1570,11 @@ void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu);
 
 #ifndef CONFIG_S390
-void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait);
+void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force);
 
 static inline void kvm_vcpu_kick(struct kvm_vcpu *vcpu)
 {
-	__kvm_vcpu_kick(vcpu, false);
+	__kvm_vcpu_kick(vcpu, false, false);
 }
 #endif
 
@@ -2315,7 +2315,7 @@ static __always_inline void kvm_make_request(int req, struct kvm_vcpu *vcpu)
 static inline void kvm_make_request_and_kick(int req, struct kvm_vcpu *vcpu)
 {
 	kvm_make_request(req, vcpu);
-	__kvm_vcpu_kick(vcpu, req & KVM_REQUEST_WAIT);
+	__kvm_vcpu_kick(vcpu, req & KVM_REQUEST_WAIT, false);
 }
 #endif
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f140..67addb9e48a7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3908,7 +3908,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_wake_up);
 /*
  * Kick a sleeping VCPU, or a guest VCPU in guest mode, into host kernel mode.
  */
-void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait)
+void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force)
 {
 	int me, cpu;
 
@@ -3933,9 +3933,13 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait)
 	 * after kvm_arch_vcpu_should_kick(), which could result in sending an
 	 * IPI to the previous pCPU.  But, that's ok because the purpose of the
 	 * IPI is to force the vCPU to leave IN_GUEST_MODE, and migrating the
-	 * vCPU also requires it to leave IN_GUEST_MODE.
+	 * vCPU also requires it to leave IN_GUEST_MODE
+	 *
+	 * Note #2, do NOT check if an IPI is needed if @force is true, as the
+	 * check also modifies vcpu->mode and KVM PPC needs to avoid that side
+	 * effect for unknown historical reasons.
 	 */
-	if (kvm_arch_vcpu_should_kick(vcpu)) {
+	if (force || kvm_arch_vcpu_should_kick(vcpu)) {
 		cpu = READ_ONCE(vcpu->cpu);
 		if (cpu != me && (unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
 			/*
-- 
2.56.0.313.g2479322e68-goog

