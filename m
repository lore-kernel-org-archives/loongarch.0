Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F967210C24
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584844; cv=none; b=EVFxKAntqyJJl64RB1aVxcOl1+Di50XILFbMLMzSjlMbKYqR/4lQp+VDLqNxXD2GwSQjUT3hlxiGmpbRGukGjz1PIU4TK3zo04LjpV/T4OKy7da8BR+kGPUFKoAlzye0qfJsPCSkWSyhPHpz7PD7dWqwmukWxsKhBMOdLokVl0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584844; c=relaxed/simple;
	bh=TVe3szAAU/4RHYDireJVG9Y8gE1GRTl7yNXWTsweF6A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rIyZehZzXJxgDlA9Zl0y0PiBDu17EioGyU5sHRxqpMMFI7sXhr6532g1rcjQ1tfTkuW9gp5LsGsy5B6bWTlEouOiFXUbNw+guAFz2LSs2ldRfwBuIR27DYoBVtCwshIdAgPxWe0TUxV2i8JK3bg3pf0GNhyim3ttogrQwZvpXhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3pDBStDu; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3pDBStDu"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e321d26b38so29286887b3.2
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584841; x=1729189641; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KbunjaDKwfDzESX7bCyZnVXI4Jj60WAsli6cgjlK44o=;
        b=3pDBStDuTAW5A67QOERGDq01uS+2Q64n7/YfxZvqPpgNJakUojNp7SZcl1rOm+7+gw
         RG9JzKVr6iATnDEL2Henl3Gnv717nz49VZaCQa+jTVkAJNcrwVHWt5X2JYlX2Puuz+tz
         ms994MJBkmqPzhDJIdVkesD+CpcN3r+CnpoxhmhNIr3Ht4VcPYrajCR1P0v9vsPPZQhO
         Kh5XnNz+VprSRuwupYgWbwfeVFLZOawG/r76Luntc43KU/OTlZjRbTpKx29gJYb42C2B
         W9oh8ZWgt4/29C07NjxJuOMHxUP0SZC+Mb5VvbDxSuO2BQ6OTWo7gOFIRwZ/EUGht6pD
         AcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584841; x=1729189641;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbunjaDKwfDzESX7bCyZnVXI4Jj60WAsli6cgjlK44o=;
        b=hJZ8fHpzzcl1o8nA4wacP3pf+9lbtbxtZvcZEyDVd7Aq3abz2EYb0qXiKaR60+P03Z
         3WSWvXJBmXzbX5eE5iONyiTxrQTASNCpL8AMNqSAmD6zBUrPmoPweKpFDbyQKWHPVEn1
         JRI5RZWDEgDXV9wT7SoT0BEMqwElSH2sgnXB40hwaqsINeqxQpq2vdZBqDojzIwlprWm
         aZOVkTG8Wp9MIllNr4ek7oK8N3RxzGb4xWjNYIYtj0eCrwSjAyPMz0bYUlRHeT5S9da5
         ZR/IMy60hFBK7LQrB5+sgQKuUCFDjwhVdzNCAZwXW0v0PcFhbb7b8oYb1uzEoDh/SyvL
         63yA==
X-Forwarded-Encrypted: i=1; AJvYcCUs2WwD2DKk+xOcLz+gve3HEexvTfhw1ysDIS4DNBXe9fTMRzky8Bj079refRkNrbZLSVR9F5CKBis=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPK5413g/2tTDdQgx46DgHbOMQpe0W+2cfhfW3+pK0pYjwO9vb
	+j1KN3lioUz9YRYedhZZFsWlc2q3uCL8sltEsLVXhC0qV14z8J+VAt6Lpn7pFKff91Bn32EOQGf
	9nw==
X-Google-Smtp-Source: AGHT+IEbamZE/KJDJ4kw63fZFZN0PThnG54xKd82AQ09AwFkx3KIodEPvEqsDBHZyT6DCHkY/GuTD4px7aQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:6c05:0:b0:e24:c3eb:ad03 with SMTP id
 3f1490d57ef6-e28fe540170mr1289276.10.1728584839383; Thu, 10 Oct 2024 11:27:19
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:12 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-71-seanjc@google.com>
Subject: [PATCH v13 70/85] KVM: MIPS: Mark "struct page" pfns accessed only in
 "slow" page fault path
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"

Mark pages accessed only in the slow page fault path in order to remove
an unnecessary user of kvm_pfn_to_refcounted_page().  Marking pages
accessed in the primary MMU during KVM page fault handling isn't harmful,
but it's largely pointless and likely a waste of a cycles since the
primary MMU will call into KVM via mmu_notifiers when aging pages.  I.e.
KVM participates in a "pull" model, so there's no need to also "push"
updates.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 4da9ce4eb54d..f1e4b618ec6d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -484,8 +484,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	struct kvm *kvm = vcpu->kvm;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	pte_t *ptep;
-	kvm_pfn_t pfn = 0;	/* silence bogus GCC warning */
-	bool pfn_valid = false;
 	int ret = 0;
 
 	spin_lock(&kvm->mmu_lock);
@@ -498,12 +496,9 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	}
 
 	/* Track access to pages marked old */
-	if (!pte_young(*ptep)) {
+	if (!pte_young(*ptep))
 		set_pte(ptep, pte_mkyoung(*ptep));
-		pfn = pte_pfn(*ptep);
-		pfn_valid = true;
-		/* call kvm_set_pfn_accessed() after unlock */
-	}
+
 	if (write_fault && !pte_dirty(*ptep)) {
 		if (!pte_write(*ptep)) {
 			ret = -EFAULT;
@@ -512,7 +507,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 		/* Track dirtying of writeable pages */
 		set_pte(ptep, pte_mkdirty(*ptep));
-		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
 	}
 
@@ -523,8 +517,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 out:
 	spin_unlock(&kvm->mmu_lock);
-	if (pfn_valid)
-		kvm_set_pfn_accessed(pfn);
 	return ret;
 }
 
-- 
2.47.0.rc1.288.g06298d1525-goog

