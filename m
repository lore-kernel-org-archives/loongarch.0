Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701562942D
	for <loongarch@lists.linux.dev>; Wed, 22 May 2024 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716342029; cv=none; b=FC/w82Cduu4F9xEebGYtTUtovJ3hXLHH0A9mPgHCscVtnN1/DIMszizqIwftWF2+UN8ihi8tzd4A0hF1s5b14NoA9Y2TUm4ybujoSIvpY051BJb6IWiy81HKcXRfC89X7CKupMDYMFJ3R7PAVdKNylv797LmscG+YAg+HHHp614=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716342029; c=relaxed/simple;
	bh=SxCNJ06vwtbyrQkZd4xB8bnO3JXPErYFa83rg1Usdig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mfHAVBaxqgos9kADg6ZKV6/qeYaS8yo1QvH5RdZsveIO954rN3dUc+C0n0RSIdNjYRcZezSjLrfi2Xn5kd7V3jT8j3zOxSaJ5rIYkIGvyP4mhYmd8Cj0FN6oo6ckGbyqo4Himq5l7jZ1VCzuMOWuFMW8lepOjrcAvJy9fIg8zbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ucE0zHR4; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ucE0zHR4"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6256bc244b7so5338267b3.1
        for <loongarch@lists.linux.dev>; Tue, 21 May 2024 18:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342025; x=1716946825; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9/Jh3NT05cAP4Dr5P4AOID5+N71m8JBqExCgFsAlL8M=;
        b=ucE0zHR4mokcQP1nZiK5UPzQMWxWtcTM8GybyfUfattJ1069ivqlyIDaEcS3UktLV4
         1PU+YVWMPnKRd1RBg8bxdZs4Y9an4rRouEqs7ENKo8J2euH2UMRMCq+MU75GBeqU9Drl
         peI17MGmMSQNGaBucYT4O8MYBRs9AbBh7INsYb94UWXxfpnyfSoBZiC8Lcrh48IP9i8C
         +B1JqyVP3A3YRJUAwKimuHHg2JkNRCo3T9cPHzJHHfj6eHpCFD/4XRP7fhTaIAbg1TPd
         XHZ4igwcU6oCe3zKpClzMBChvSokX0EYF+gqgLac5h4878PyapaguZUUMvycUA/za70J
         vs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342025; x=1716946825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/Jh3NT05cAP4Dr5P4AOID5+N71m8JBqExCgFsAlL8M=;
        b=IoJ7NX5oLy1xJVYU6cSXorviuSRsV4HWP4gmzkQ0Nc6FtKU/fEMCXn239UQjnp8HGa
         SmUWkSxwtcwCTrOJ2LSNomgPINSmVCh5ZfcATP0gqz3eP+ZUbfFOgCurG4CIo1AAwb7r
         q0a2T9+gM/nkpCE5PWi2lTYBxhfMknqSWRRuzTK1BPA15DpaZu5gwoOXxqk5Cmw2dOzv
         JLzIrXl5Xss1EhRv7frC9zmcgNjp4BpvsWGnlQZ5rxrWCnYqN5YyNS54yFFDsYvfyopa
         5p4qMMTR+LVclZnHZ0YHATWtg3/FyRNUbvaGHDH0JEYNe7BoIYkzWG50T/9fWlcyjmGJ
         KTRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqEXmi9owZz7i1UaFEv3yB8QfDDl3NbH9oVZGnlnuVdaYYkAenJfuqCBtwcfU4wu21d17YL/oSjdfa1hgLIMTIOy2v4fseAkMt
X-Gm-Message-State: AOJu0YwC2LQhM5QMrjgqwT9nB5Fchny0f4O0sRT+IJ+8Ak2LED/9PMWb
	9zGuPSe3PrHab1JZ/E6bfiuDs6Sm/ZADqbRymGFVlPc9duQ7CHrYO9CRYEdAcz1o0A4bxchNqUq
	+1w==
X-Google-Smtp-Source: AGHT+IFb4ojjFIBjH/g1gqSAZtGdXjScECyPQCKxtonXS1wS1/Q6Sfuh8cMohHl5GHkfuJ7096x7AKNuxdo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:100f:b0:dda:c4ec:7db5 with SMTP id
 3f1490d57ef6-df4e10405f6mr210549276.4.1716342025422; Tue, 21 May 2024
 18:40:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 May 2024 18:40:12 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-6-seanjc@google.com>
Subject: [PATCH v2 5/6] KVM: x86: Unconditionally set l1tf_flush_l1d during
 vCPU load
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Always set l1tf_flush_l1d during kvm_arch_vcpu_load() instead of setting
it only when the vCPU is being scheduled back in.  The flag is processed
only when VM-Enter is imminent, and KVM obviously needs to load the vCPU
before VM-Enter, so attempting to precisely set l1tf_flush_l1d provides no
meaningful value.  I.e. the flag _will_ be set either way, it's simply a
matter of when.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 59aa772af755..60fea297f91f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5006,12 +5006,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 
-	if (vcpu->scheduled_out) {
-		vcpu->arch.l1tf_flush_l1d = true;
-		if (pmu->version && unlikely(pmu->event_count)) {
-			pmu->need_cleanup = true;
-			kvm_make_request(KVM_REQ_PMU, vcpu);
-		}
+	vcpu->arch.l1tf_flush_l1d = true;
+
+	if (vcpu->scheduled_out && pmu->version && pmu->event_count) {
+		pmu->need_cleanup = true;
+		kvm_make_request(KVM_REQ_PMU, vcpu);
 	}
 
 	/* Address WBINVD may be executed by guest */
-- 
2.45.0.215.g3402c0e53f-goog

