Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719DF185090
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 23:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038065; cv=none; b=R8VNJPn5vjrvLGTkR6lUFGEKiIIvuyOVrRlx6gYy2Kt1f0FYmhLgLLKpK3rlkSASXNMjZS8YlqdZ6vSOVJxKPC5Yv5xC+BHaRMlmd/XkrNbdt2MEfYtFNbR/891/237OuaaitxDttb6+xfiRHxZHdQQBUiPXR7XrAlE9/MJl87w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038065; c=relaxed/simple;
	bh=VbnqqafRlYMVLvo8/KpvTNYaOUVhm0RY4zV5HGgCgQE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KUzasNOEvDs00K7CopbuPlJaqZGIKNDHHKzv1zJPp3JB3q8UA5muRZ9G4p9e5IENpMqhGFl8PRoUBlzGx6AAJ/tj9DmbR6I4ZWWvBcew2pWnb/MWYfjovrnRUq/GHbeMMfo2uF7jWFma7HCgYw1q9+RE5Gj/9IGcpR1bjDRayxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MzUAcr/E; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MzUAcr/E"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e087ed145caso390532276.3
        for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 16:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038062; x=1722642862; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cHTm12hU98ihrn/4YhoQtTNxFr6qD1GrOX0sqy5dmrg=;
        b=MzUAcr/ENnFx1DJqm3gigwl6poEQsGaFLxnacGw4XBnXde3MC+8A7yVyN0FSO4RydK
         Wi/G+080xavM34zIirV7in+T+TxDFJU3ubLl/v1nqHD0DwpJrSR3Z878GgYToYk5B+hQ
         cQilcmLI7giwPb5g6Q19mHH8SaQx0S5hx8EdIrwloq3z/qs41xPscG4oi8vzQP7xmDT0
         hwCUlEaYD8shULSynnyeqU6wau04xg+RZCeEfPEIQqwmeBKSGqeOLhoPb/iXMj9NIdr+
         HiXbN2vYNRbRV1Piz7I++88G6mUMFlU/9pxfA8Vymk79pPQeY6e6AgY48ORgIc8v3PXs
         xZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038062; x=1722642862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHTm12hU98ihrn/4YhoQtTNxFr6qD1GrOX0sqy5dmrg=;
        b=f9vsG0FQY2L4252ez84mZCGFdINgnJxedPyAMqFrEf7iBAMv8/gBi29LvGozicgnrE
         1KjnF/Wnsy3PvoVP3xsUawszS5wGTiSVDhBmf3UskTk8MkvE3XR9Jh1f01n69nyOzqlL
         GN/P9JghJFGNMRKTKd5q/LWR2mEhoU6S1vdeLEY16w7QrGpswkBVh3rSIPLZ1lt+ONpC
         QiKAVoGah3Hw+7sxGuNfNEr11r3YfewAXyIm6LZWume6rYf5MvxHrUEAiaQn+TrSzpMr
         NlgytGHkWEnYw4QKGUk064HtJOITlpLt+T2pfOGqJsxbwAViIXqWwcn6rrEvKyNeJCAt
         BnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Pt99PrKSmLHQDAvfyYYhd1QekV8K+TScb4TsRwhVfWylkclJ0hFjyNpx+Vdk/dSBhutVsXu0nrtrH/0cTm+sdnUtpIyjzauK
X-Gm-Message-State: AOJu0YxZ1FvHBFM20obeLD3Kj9b1VmI4gPvJgMDlvM1aq/4pVOcS2cMC
	wJgj7NRaE9ClMvG6pIgX1g4BfdITYdovwfWKq7BfDb+WK0clem4NdzwTRVM63RinYBTA5SccWBB
	YGg==
X-Google-Smtp-Source: AGHT+IE591qeJqHACb7CkRANjpP2e5907DfMapi1wU/6IAMP+NJSB5aPgL5hiS9fj7k9JDiJNu7gQfM60rI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1005:b0:e0b:f93:fe8c with SMTP id
 3f1490d57ef6-e0b5427fa67mr79886276.0.1722038062601; Fri, 26 Jul 2024 16:54:22
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:00 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-52-seanjc@google.com>
Subject: [PATCH v12 51/84] KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
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

Mark the underlying page as dirty in kvmppc_e500_ref_setup()'s sole
caller, kvmppc_e500_shadow_map(), which will allow converting e500 to
__kvm_faultin_pfn() + kvm_release_faultin_page() without having to do
a weird dance between ref_setup() and shadow_map().

Opportunistically drop the redundant kvm_set_pfn_accessed(), as
shadow_map() puts the page via kvm_release_pfn_clean().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index c664fdec75b1..5c2adfd19e12 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -242,7 +242,7 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
 }
 
-static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
+static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
 					 kvm_pfn_t pfn, unsigned int wimg)
 {
@@ -252,11 +252,7 @@ static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
 
-	/* Mark the page accessed */
-	kvm_set_pfn_accessed(pfn);
-
-	if (tlbe_is_writable(gtlbe))
-		kvm_set_pfn_dirty(pfn);
+	return tlbe_is_writable(gtlbe);
 }
 
 static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
@@ -337,6 +333,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	unsigned int wimg = 0;
 	pgd_t *pgdir;
 	unsigned long flags;
+	bool writable = false;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
@@ -490,7 +487,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			goto out;
 		}
 	}
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	if (writable)
+		kvm_set_pfn_dirty(pfn);
 
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
-- 
2.46.0.rc1.232.g9752f9e123-goog

