Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE59C20B1E2
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584830; cv=none; b=qg8QP3zBvWMT9WB9Yk2DDWnh2SbC313bsuISk+BrrBh959/Mou8+zvvrmgRAVG9fLHjAT+xzle2Gg4CPL4PKdbkJ6bxE1ISpcB+LvkaAypstFmRLsonvXe5M+kto1Vo4WrinOHlbEZouNnu3FvnObsQR8y4jZH8XfwXzz4W/bE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584830; c=relaxed/simple;
	bh=2hWIRT2fMV5KiR0O+VosZUqCujtj2BkFwotH6/Eh4cU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sSyq6jZxmPCESjYWutrINhSsqx4Lq9ZDFCSLqIQfk0RUUMcTxOwjjBxcHpIvJIatVcqqD/FbB05fJlL/rEX0HK1vNJyfTzIBYwNnDClcle+kj+7ccZKBi86GCWdxl8OM/Z3E47I6ZOdCDm35F8RU39gaZ8SsB1JuViqHYcPrV/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IAW8PuMP; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IAW8PuMP"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6d9e31e66eeso26625107b3.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584827; x=1729189627; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dJnHBDyCwUFZKgDYTVV2s9CsyA2Ll45yxWv/Qp8Ijpw=;
        b=IAW8PuMPYp5R60FMPrNoUtjko9aD3XIYassd9VxD9bP3sThT/xLytCv7ixo/swcdb8
         DUT31pO9enOTCnptzDmJ4bFhFzqkYpK0MRUKMvhdQKS6car3T0aUOP2ABH8NK3fNKJvM
         thGl+CG0vMp09ZeJLHwnF23cksPrugIsOOaL8aU5iSBUXEwZvzi6V1GEloKR3tywB2lc
         NeG2jtQYi75w7Ccz1Ozgb41ZdBnaKbevOiw40HUxHtUfZE1VbNpjDPj3KQW8A9sOKbBn
         MEE3zBNWgocI349IvCW39CajNFlBGPyUWqPXUyntOTpTRV+9MzwKsyROGkj7fn1OwGIF
         xqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584827; x=1729189627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJnHBDyCwUFZKgDYTVV2s9CsyA2Ll45yxWv/Qp8Ijpw=;
        b=Qwx3W+krc6Fx+dS/4YhaNPM1SoRcO2VJ+zx2NsY/3WZfPCOUvTYznGiU2q8eC7ReiK
         U0+mARTDsbbS8RrRb0Hjdib8pfJE1TdjvCJq41PEJVVxZbt+eB1duqg87PKpwCYGShEE
         e0Eb/HjrsD81Iadi3E+/DaefFz1ovl6vAtCM2YOmawGi+NKXurZ1ih6o6KUTQQX074OH
         czYUUpiSLvwSrUwgi3DzCVwnBlhBrkZoJvx7lZArsjcftykKeTUVKhX4BkgCNwSkdnbR
         dTJerkAgepLdvmbppOJYLKRej1BwdTjHbwtoEgslNB4LSzVL3BqPuBDIYAJONnJLrlr8
         5VIg==
X-Forwarded-Encrypted: i=1; AJvYcCXH7IPVnRhK5UmHFcLm7L4K0vEuRQfEU6RUd3VZvIaXGiAQhyhWcoczIsrz2XEXe5jsh3+wqvwUd9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMUDLaUe+jHtnkTO9AnJT7dBpCEqbMCkh5qjPdqZLRJFJsq3sQ
	OGbft7hhJOsjQbTTYj8Zovk7c1V+pgvZhdt45TmQ4QgJH4GktsijoB83T6fZl2gwkfqV0eRm7xG
	d6Q==
X-Google-Smtp-Source: AGHT+IE3wQG+AmAWHFVOEkWtTHcZkQX/AbMzk25RszCXWWBD0mfEZbS2aMxfU1imj+f8RQ2cZBD1mpHhlQw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:a07:0:b0:e28:ef8f:7423 with SMTP id
 3f1490d57ef6-e28fe355de0mr48920276.4.1728584827639; Thu, 10 Oct 2024 11:27:07
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:06 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-65-seanjc@google.com>
Subject: [PATCH v13 64/85] KVM: PPC: Use kvm_faultin_pfn() to handle page
 faults on Book3s PR
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

Convert Book3S PR to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_book3s.h |  2 +-
 arch/powerpc/kvm/book3s.c             |  7 ++++---
 arch/powerpc/kvm/book3s_32_mmu_host.c |  7 ++++---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 10 +++++-----
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 3d289dbe3982..e1ff291ba891 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -235,7 +235,7 @@ extern void kvmppc_set_bat(struct kvm_vcpu *vcpu, struct kvmppc_bat *bat,
 extern void kvmppc_giveup_ext(struct kvm_vcpu *vcpu, ulong msr);
 extern int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu);
 extern kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa,
-			bool writing, bool *writable);
+			bool writing, bool *writable, struct page **page);
 extern void kvmppc_add_revmap_chain(struct kvm *kvm, struct revmap_entry *rev,
 			unsigned long *rmap, long pte_index, int realmode);
 extern void kvmppc_update_dirty_map(const struct kvm_memory_slot *memslot,
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index ff6c38373957..d79c5d1098c0 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -422,7 +422,7 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
 EXPORT_SYMBOL_GPL(kvmppc_core_prepare_to_enter);
 
 kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa, bool writing,
-			bool *writable)
+			    bool *writable, struct page **page)
 {
 	ulong mp_pa = vcpu->arch.magic_page_pa & KVM_PAM;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
@@ -437,13 +437,14 @@ kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa, bool writing,
 		kvm_pfn_t pfn;
 
 		pfn = (kvm_pfn_t)virt_to_phys((void*)shared_page) >> PAGE_SHIFT;
-		get_page(pfn_to_page(pfn));
+		*page = pfn_to_page(pfn);
+		get_page(*page);
 		if (writable)
 			*writable = true;
 		return pfn;
 	}
 
-	return gfn_to_pfn_prot(vcpu->kvm, gfn, writing, writable);
+	return kvm_faultin_pfn(vcpu, gfn, writing, writable, page);
 }
 EXPORT_SYMBOL_GPL(kvmppc_gpa_to_pfn);
 
diff --git a/arch/powerpc/kvm/book3s_32_mmu_host.c b/arch/powerpc/kvm/book3s_32_mmu_host.c
index 4b3a8d80cfa3..5b7212edbb13 100644
--- a/arch/powerpc/kvm/book3s_32_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_32_mmu_host.c
@@ -130,6 +130,7 @@ extern char etext[];
 int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 			bool iswrite)
 {
+	struct page *page;
 	kvm_pfn_t hpaddr;
 	u64 vpn;
 	u64 vsid;
@@ -145,7 +146,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	bool writable;
 
 	/* Get host physical address for gpa */
-	hpaddr = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable);
+	hpaddr = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable, &page);
 	if (is_error_noslot_pfn(hpaddr)) {
 		printk(KERN_INFO "Couldn't get guest page for gpa %lx!\n",
 				 orig_pte->raddr);
@@ -232,7 +233,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	pte = kvmppc_mmu_hpte_cache_next(vcpu);
 	if (!pte) {
-		kvm_release_pfn_clean(hpaddr >> PAGE_SHIFT);
+		kvm_release_page_unused(page);
 		r = -EAGAIN;
 		goto out;
 	}
@@ -250,7 +251,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	kvmppc_mmu_hpte_cache_map(vcpu, pte);
 
-	kvm_release_pfn_clean(hpaddr >> PAGE_SHIFT);
+	kvm_release_page_clean(page);
 out:
 	return r;
 }
diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index d0e4f7bbdc3d..be20aee6fd7d 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -88,13 +88,14 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	struct hpte_cache *cpte;
 	unsigned long gfn = orig_pte->raddr >> PAGE_SHIFT;
 	unsigned long pfn;
+	struct page *page;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
 	smp_rmb();
 
 	/* Get host physical address for gpa */
-	pfn = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable);
+	pfn = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		printk(KERN_INFO "Couldn't get guest page for gpa %lx!\n",
 		       orig_pte->raddr);
@@ -199,10 +200,9 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	}
 
 out_unlock:
-	if (!orig_pte->may_write || !writable)
-		kvm_release_pfn_clean(pfn);
-	else
-		kvm_release_pfn_dirty(pfn);
+	/* FIXME: Don't unconditionally pass unused=false. */
+	kvm_release_faultin_page(kvm, page, false,
+				 orig_pte->may_write && writable);
 	spin_unlock(&kvm->mmu_lock);
 	if (cpte)
 		kvmppc_mmu_hpte_cache_free(cpte);
-- 
2.47.0.rc1.288.g06298d1525-goog

