Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88397212637
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584848; cv=none; b=LZ5QTHIP94NIwxJBKV75xTTaaEukJ+hHiKm8SjZokjDV+Knn0K7E94IhUxu8JCB5CoYgGJwIE6Dk6EuwLVdC7OXkGfmIJlz9saQfvAW34r+njvUoAtDjfjG3TYlOdU1BLIwSzElN/KpzZMePISTs1Z0kujsLjYGQwDo209+e7TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584848; c=relaxed/simple;
	bh=8dGNSdkZyds89DzrI//tIWXaU4bIHqe2OXPOvN+ci/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=paRPmBZXpQyIhFKJVSUOnzOYICjfDqpfkLi3lsH4eS1FhwnRTyPak6doxML6x/vZDpbNlAYy2KCgudAJRTIh3dr0c2mNwXbXowxXWGKmj21LCEEupSf6yLTNEpd8Jbzvrcueua0a24j33jYIpJwPAa5GbNbPguPhBcTlXcLOjGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0gWtMUo/; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0gWtMUo/"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e2913beeddaso635563276.0
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584844; x=1729189644; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ojyPU0tzKIRRbswoqL6JjpEgqRgu1FFXpokE5rqa8U0=;
        b=0gWtMUo/b5IbcwZqxRyfuddT6frjeAtrNEtKBGgmUdlOjXY9d6sRPl490AaZZllmvY
         jwavSc6vorU3VuQRRn+KJu11dqV9T6MPKz03rBQXDCbEDLHGbHHBZLK6s5OTxn3caA3U
         0Ox558tvK3gpZnHxmTpEpujtPmtdtpvpjp25pkgul/Wi8h7cEOJA391ADD6Op9QCRx2k
         Bx4uB9JeqWIgxTq70L44WZzI02nW1ljveYKzDYhSOUcev0zpeXf2YpW2yH7lOq6alVuY
         MAMnBQzCOHkxM7q0XxNv7/Jaxf4tyScsTuq0akusoXUrrhq/UofNoRALnXbfHiLVRTGN
         5GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584844; x=1729189644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojyPU0tzKIRRbswoqL6JjpEgqRgu1FFXpokE5rqa8U0=;
        b=IRpdTFDuf8wBDPPE9TxxVcNj3SGG3DAVaT2KGPaUz9XOC9uR4CBCPk1yUqnP9nQZh3
         /fLu9XI8FWqoRwlV5AOqx6rEEJ+Ao9thYmRFK4DYqT/V4bd4vEKFQ5wTHgCRS0yDDsSb
         DFwmsvjnXidcbSFg5TslyaTlUEdnZ9eMOnqk85E3Iq6sB9UaIX1jkf7jZ6B5uWVX1ze6
         SPbPfWZseJ95MrZ1RHni4LP5T9eksHePahpoeqqCKsXrwotmjw7xZniPJN2UtriW2Hjw
         WbelIZAKvQ+MSU1upp1RAZUt3ttHzeOadnWOuamYHjNXQDtU/hjOzEkYaMuFi53igbGn
         2sEw==
X-Forwarded-Encrypted: i=1; AJvYcCXalqBqHxTf1naYJyJmplzHt86aSHJ4E+bmVi3V9FTGt0SJPlcdu2EfWIFxLCvXYixL6R2IFpN/7UA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLDReHM5eECfxyH//ZZ6jtehGi0MVECjEqyUv5wib2xu31nOQ6
	I4sYrX85InaFrtNWoS/QijggnSVpIb6NMeR7bPDCeTOHJWIbJg8MW4+Ta0z0HXeHj6DJ9sgpC1H
	neQ==
X-Google-Smtp-Source: AGHT+IHEyKrdGSoNbMWcRNiKhgC/jPgVf/TjauaPCrq7yqhpXyuJQagleroMC0w40O7lZsOojHLr7EwrZqI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:6805:0:b0:e20:cfc2:a326 with SMTP id
 3f1490d57ef6-e29184333b9mr26276.6.1728584844184; Thu, 10 Oct 2024 11:27:24
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:14 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-73-seanjc@google.com>
Subject: [PATCH v13 72/85] KVM: MIPS: Use kvm_faultin_pfn() to map pfns into
 the guest
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

Convert MIPS to kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 69463ab24d97..d2c3b6b41f18 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -557,6 +557,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	bool writeable;
 	unsigned long prot_bits;
 	unsigned long mmu_seq;
+	struct page *page;
 
 	/* Try the fast path to handle old / clean pages */
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -578,7 +579,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	mmu_seq = kvm->mmu_invalidate_seq;
 	/*
 	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads
-	 * in gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
+	 * in kvm_faultin_pfn() (which calls get_user_pages()), so that we don't
 	 * risk the page we get a reference to getting unmapped before we have a
 	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
 	 *
@@ -590,7 +591,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	smp_rmb();
 
 	/* Slow path - ask KVM core whether we can access this GPA */
-	pfn = gfn_to_pfn_prot(kvm, gfn, write_fault, &writeable);
+	pfn = kvm_faultin_pfn(vcpu, gfn, write_fault, &writeable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		err = -EFAULT;
 		goto out;
@@ -602,10 +603,10 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 		/*
 		 * This can happen when mappings are changed asynchronously, but
 		 * also synchronously if a COW is triggered by
-		 * gfn_to_pfn_prot().
+		 * kvm_faultin_pfn().
 		 */
 		spin_unlock(&kvm->mmu_lock);
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		goto retry;
 	}
 
@@ -632,10 +633,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	if (out_buddy)
 		*out_buddy = *ptep_buddy(ptep);
 
-	if (writeable)
-		kvm_set_pfn_dirty(pfn);
-	kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, false, writeable);
 	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
-- 
2.47.0.rc1.288.g06298d1525-goog

