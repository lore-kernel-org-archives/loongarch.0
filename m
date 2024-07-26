Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2818D4B0
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038098; cv=none; b=ov8kex+5BJUTAlCTGyjrowF5DbKAPHYlgmiejoX10kFiWMkzJQC8u3H8C2BYqLMLOYqmTTUD7AITHTLOOTzgok5VWs9Ci2sDHx0LWVdnmp/3xuN0hM0UkiS4Gmak4RgdyhJReeiy1wZdsnC/IqbFyMKmG2B1eocyzyQZ0URY1lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038098; c=relaxed/simple;
	bh=J5mfIOqDdF2lEfMBx8mMJA3dTUdwpj862NVDKPV0UK0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XPlYqJ6LtOC361fF0YrwjGkien4kgcA63ftrNDKC6QnegrvsMcXGVWytQ/vzPlRjmLymg+ZL5OC+ae0Cf9Meui+rhmboXkgqDgcxM7NCncwGVPqAxvKP/1gDppydC34+ishwOawsQUDkOIl5L88UN5ZmYxbIch27HLxxepbIGPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Kpfrq80; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Kpfrq80"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-70d24aead3eso1479619b3a.0
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038097; x=1722642897; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=T3Tq4gPotkzFIpSFFawcUtCGWBlTwHcibbE0IfTBXb4=;
        b=1Kpfrq80WRWALtG0+QzScDFGvttioOToA3t3uYHQerPN91jdTKQrr0FFSSS9YWNpkW
         o5+Sm8r7xhIdTq+W3rwoIIcsVH1zIprKB121rIEz41I64W+xl0kHXv1MMaQ3oZVsC5vM
         Se8MT+A0ZhjB7TG8wiDFzGd1hDuAIEALrJn/Uq6hxpYUdf4ICpruwjrZ86MlZ0U4JU9C
         2R2NQlwjd35U9tfWP8/9xWTI1UHEyTb2LMLehJnsqAOZVTqPCXuU1VTAwEVY5FqRGA37
         WcJWRcvt372JJPD1R7yTt3wNlZO2Fw+JhWtn3jDZLprFoKra1M8Z6mRccMD/v+GkIKVj
         y0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038097; x=1722642897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3Tq4gPotkzFIpSFFawcUtCGWBlTwHcibbE0IfTBXb4=;
        b=AHdhp+sYpBkzKNgld/pv74Wbnc9wr7LtU18eglk6BylBLa2DzIahuYyWbwiVNm4gdz
         W7ungGpUvrUu4HPabeL/75S7C0Apr2AQl2ELmGCiEuP2f8aPYkLXdGzX/6mfR28xv3SN
         PhFRipBYfy7Tty10CvXGKQxWXl4dJjJLrEqUhMuX4X2K3i25PccuFoSZqp3mvRrPbA3S
         H6r4Vd2CCENG8kLTYuQT3jmctT0WdvRiN7GxhOmzDVmeu8XnT0caga1FLG+BMsCdvfLj
         FCGdisnfCHsQ1v4SwUI89VXB3uFxJ7i/f+Cx847+UjHs5CSE3k7RRwMhwWkIzmugdb7t
         ZnnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzgCeJx6xYPWAjl0gu/yoA4F1UDKue0CklHIyi6skjHtD2v/s2iIz5O3+bSfyNbdtry80iNAzyXjn879uuzKGI2Uc+TGldfddP
X-Gm-Message-State: AOJu0Yzg9CtwpOOEQairWKKEjmvQUMaC5t1iW/RanZdaP0Mxsxebbjja
	JkOqe2DvdxBCEX4+kcRpUyFSFHIUaOkhaiev7DVLBBRaR1IIHOMZJP3YCAeu5w3aES4dCEUFNcA
	6Jw==
X-Google-Smtp-Source: AGHT+IExCpdv69na3gU93uhAEfGJO0DgmCPrxQU8TmhxNm9ObFOOTchJQQycuTaWmcpCMOvBszJjylffDDY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d99:b0:70d:2b2a:60f7 with SMTP id
 d2e1a72fcca58-70ece928763mr9066b3a.0.1722038096309; Fri, 26 Jul 2024 16:54:56
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:16 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-68-seanjc@google.com>
Subject: [PATCH v12 67/84] KVM: LoongArch: Use kvm_faultin_pfn() to map pfns
 into the guest
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Convert LoongArch to kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 230cafa178d7..83e4376deabb 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -780,6 +780,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *memslot;
 	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
+	struct page *page;
 
 	/* Try the fast path to handle old / clean pages */
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -807,7 +808,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	mmu_seq = kvm->mmu_invalidate_seq;
 	/*
 	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads in
-	 * gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
+	 * kvm_faultin_pfn() (which calls get_user_pages()), so that we don't
 	 * risk the page we get a reference to getting unmapped before we have a
 	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
 	 *
@@ -819,7 +820,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	smp_rmb();
 
 	/* Slow path - ask KVM core whether we can access this GPA */
-	pfn = gfn_to_pfn_prot(kvm, gfn, write, &writeable);
+	pfn = kvm_faultin_pfn(vcpu, gfn, write, &writeable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		err = -EFAULT;
 		goto out;
@@ -831,10 +832,10 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 		/*
 		 * This can happen when mappings are changed asynchronously, but
 		 * also synchronously if a COW is triggered by
-		 * gfn_to_pfn_prot().
+		 * kvm_faultin_pfn().
 		 */
 		spin_unlock(&kvm->mmu_lock);
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		if (retry_no > 100) {
 			retry_no = 0;
 			schedule();
@@ -900,10 +901,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 		++kvm->stat.pages;
 	kvm_set_pte(ptep, new_pte);
 
-	if (writeable)
-		kvm_set_pfn_dirty(pfn);
-	kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, false, writeable);
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
-- 
2.46.0.rc1.232.g9752f9e123-goog

