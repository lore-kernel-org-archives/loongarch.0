Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CDD20C468
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584834; cv=none; b=L1BfGo6dET1SEQYVbgcmCvlKT5WLJEM/PZiseEs+0VePFJTRA2RC+lec7jLpVb3zPgmwv+DOKLQwn/IGZjXdkq07DWfPidmb8Ceu+SpIpwm2RpLWKv34mdu1vIsx03mD0gwGT6RNq04N2ehBIDofAqt2c6wYXzBUhWcRmhKX6T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584834; c=relaxed/simple;
	bh=Gq0ZEmsgjgD9l+p+SR2hvcEYSP8z96GfO+zPwvkDX5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hWGaUeAcW4WqYi3A1QNYq8NOdLJohopRrX7qv29TwgbRq3oLVGmBYAicMgzi+BnnYuNxOlSK0vsaLYZElfwZHXMT2xow/Ed03laIq33MacTo+Gfdq6RyajL4EXl8NQsoxunhhs1JEaCx2JoJMG7BCvXyXLk1B3n6gl8JCWTpVEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GPSfdsmo; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GPSfdsmo"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e290222fde4so1381826276.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584831; x=1729189631; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2XctyNuj5rmp2glWM4MaDBrVp36o24kp0nhTjUz4HGM=;
        b=GPSfdsmo4oCcQaXVyqqJovmSUVSYWZQTNHs+cy2mPt7tIgzm4XarQqlzcIJoDxtAoX
         mxzsFi83a/i0DVMflSMaVPPoFhJZVoml+cHqpyYSmy8/I5DbmurcAFrj0auNiG9fZwXZ
         34ilUCNnuFqNpA7S+IGbSGltyVBzLuXS2zS3bD4k1oODGdHNvsrRm6KMFqzeHp7GhCP8
         OPd4t0ylrMxlho5a8eA3sgZfFFQd/TmdyecAH5b6D0/OHqyeLXsn4pZHMC9s86y2IVll
         R/NdLi5YEfss0eXOETt0GZ9/0VaX2XjTojf/q+QtrNrOPCpmu+9kkRJtGwsXVmbNMgq8
         KWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584831; x=1729189631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XctyNuj5rmp2glWM4MaDBrVp36o24kp0nhTjUz4HGM=;
        b=OQJ07bzhi0UAAqqOg84T6WjjC/gT3jArnUHj4T+aF/Xx3fl1hM3om9vWRuHvdShesH
         7ZOS9ePR1rDYo8XnX9o5n6eHljoS004AcjSm4tY2l0xXRDhhWIKBeFTVa5smWEMytarp
         EPI7IDQwul8ZJK6o9i2Jtz/MRqCyTOcLr8cUbuXF0oZ5O2lYOU8tPaMLioXhhS+7ykzY
         +IWEPFsQ9drNfP/y5DSA2um9ZsLXd+Bf4C9JEOJW/D1GiUtvRN/xqimGH2bWAFD3gMNW
         FZtoLe/R5+Dqmct3oyGjjFT1IaUs+Pm5WxSfN2fks8BOlZmStwncuW45vXVZZIGFlb6n
         96SA==
X-Forwarded-Encrypted: i=1; AJvYcCU76xmsUghEEGhZ48dtWpGtgXTCRdLTS4Dzog1VWbtHDjHVnk6FBg6tVvUN8/uQlOtDl6LND9gC66M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRN3BHb6ubJbe1MAkPkr4Sva7pT6ApZpoC1E5hKV6BigOCdz+M
	Z2/BbUU9mNhIELAMkQ96Pe4HnT09jradlz0w2vZsiwTLkTxPn3hrRw6GSWW+oNV+syV5+/ay8lw
	jwQ==
X-Google-Smtp-Source: AGHT+IHdtHq1a5g5QmW1TlBMuTKUOZ7R4d6aOVSlzi7r2JK/pfzCqaKRixPsJw6iRhPElP6sWQ73LfqmPps=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:d353:0:b0:e28:e74f:4cb with SMTP id
 3f1490d57ef6-e28fe0df614mr96115276.0.1728584831124; Thu, 10 Oct 2024 11:27:11
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:08 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-67-seanjc@google.com>
Subject: [PATCH v13 66/85] KVM: LoongArch: Mark "struct page" pfns accessed
 only in "slow" page fault path
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

Mark pages accessed only in the slow path, before dropping mmu_lock when
faulting in guest memory so that LoongArch can convert to
kvm_release_faultin_page() without tripping its lockdep assertion on
mmu_lock being held.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index cc2a5f289b14..ed43504c5c7e 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -552,12 +552,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 {
 	int ret = 0;
-	kvm_pfn_t pfn = 0;
 	kvm_pte_t *ptep, changed, new;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *slot;
-	struct page *page;
 
 	spin_lock(&kvm->mmu_lock);
 
@@ -570,8 +568,6 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 
 	/* Track access to pages marked old */
 	new = kvm_pte_mkyoung(*ptep);
-	/* call kvm_set_pfn_accessed() after unlock */
-
 	if (write && !kvm_pte_dirty(new)) {
 		if (!kvm_pte_write(new)) {
 			ret = -EFAULT;
@@ -595,23 +591,11 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 	}
 
 	changed = new ^ (*ptep);
-	if (changed) {
+	if (changed)
 		kvm_set_pte(ptep, new);
-		pfn = kvm_pte_pfn(new);
-		page = kvm_pfn_to_refcounted_page(pfn);
-		if (page)
-			get_page(page);
-	}
+
 	spin_unlock(&kvm->mmu_lock);
 
-	if (changed) {
-		if (kvm_pte_young(changed))
-			kvm_set_pfn_accessed(pfn);
-
-		if (page)
-			put_page(page);
-	}
-
 	if (kvm_pte_dirty(changed))
 		mark_page_dirty(kvm, gfn);
 
-- 
2.47.0.rc1.288.g06298d1525-goog

