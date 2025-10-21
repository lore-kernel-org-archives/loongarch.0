Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6003A34677F
	for <loongarch@lists.linux.dev>; Tue, 21 Oct 2025 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064616; cv=none; b=rVl4JzEILMv8oKhvVH3xs8PWEYTyUB1QSxrjCZfc3aL072NZQ5GuV9uL+Srk0Rltj7BXnquTjjYls6EHXDRfBwwS94UH1Okadk3W5YmDZ9bgfSoFHvYYlTsQwUep45OcPR82bwJDABNl/Gu6453UPBAyHTFAUkVe21L3sWYGMvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064616; c=relaxed/simple;
	bh=V8VPj9cMcUrASFrIP3Xcl8Z1vzjTesRqQ0IhhfznT5E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GIghT9P8tUxbbqMkLWXNZHLE46oI5W9bVepL4DHDrPKQOk23MqA4/dtGcSmzO7LPV4Ch52KaYsBT7gBj5zHd/uvTGXi6yGIiy5QM61J6yKT0g6NP1rO3LW1qaQc7zZg4edCrEVgg4DPZLwDN8DqW+wXgBT4JK+TX8rJRPNWpIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WbfFBzi1; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WbfFBzi1"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b552f91033cso8706937a12.1
        for <loongarch@lists.linux.dev>; Tue, 21 Oct 2025 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761064614; x=1761669414; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/IdadGFev8EMGQWIIqEHXt78w+GzasFDdOM6t/N/dU=;
        b=WbfFBzi18LB/7g2eIfm1Xl0X7EVE+FRcp1WzoygSf/m+1OhJwO7yQshdZ09k8Sc3qt
         Riol8TW0BV0jxkxCh098Th4MGJtPputvK0UpPqUOW3Lvh1FxImoYW3A87znRIMFmgs5X
         fEzf8oqIXd+pFFkF0yWu423sIp1T/5PlZFutkiBozUbtpW3Th/0slblOlWE+7hJsXEaa
         1Wo+eFmuvDq7MhjT0Fv+74eksfqrqKk4JLDwDzcf5zasBn21ZYZ7lVmSE487AsykEsby
         2S/Glf7xKDjyrCyhlw6YMCjkDLhjFcaPs2r9sVWDmGak1nNlu9gT6cWp6jvjvG3NNmr4
         Fxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761064614; x=1761669414;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/IdadGFev8EMGQWIIqEHXt78w+GzasFDdOM6t/N/dU=;
        b=dVoBaW4/ufUwfOoTmiEwq202XOcHe3VVWN+2pMyz8LAZqWyh2+QjbOcB1J9/U75CVL
         N2fT9gJGZ4T7mwUVpFN/8GnZXMHc+V3QfWokoi0U8F0KuDwe8UbN5cZKf+bVI04I0EPU
         YEmrxNmCSTO/6nhEXaF07Dz2CYqcXAM6tAgQXB+jcXEMpz82i1fdlCFbQ/5szFJ34OGb
         qbcN4h6xgarxHOjXGr5oApuLJwSNsaIDE7nB+Cnmc5HQ9XrXmnaIMeBMNiFKsaBJL1CX
         KUubhEOJyVEqAJRNiZqzv/PKXl18kSAXIsOM5mSS/mCZV1aoeLenLEQ81b5zKaQuEgll
         ofEw==
X-Forwarded-Encrypted: i=1; AJvYcCU7U4AMPXtjJVBuM+3+IpXZfrQQjsC35DB8psUtXbedF2pW9LL3zG/Tx75BA6M9K+irtlRpTlIYxvM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJIP2hzqS4UdkO/aD/bSUZHjutOtmrfRnOficDH20PX9CD17eC
	azvMtLVtUu1WW6RMc77YhRUBwHL+S/sW71jypFYakzXo4//ejBMIcsLIgvbX5SSaneMRx/8RqCE
	jyQLvDA==
X-Google-Smtp-Source: AGHT+IES6ELYoVnXS8by0geR6jOr+Qyair+TP7lX0bGCC8OGD3dU25vj5A6KyxRj4XG+s9p6uoHaw2v+jQs=
X-Received: from pjbnk17.prod.google.com ([2002:a17:90b:1951:b0:32e:ca6a:7ca9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d0b:b0:32b:7220:8536
 with SMTP id adf61e73a8af0-334a856d5bbmr22480858637.16.1761064613440; Tue, 21
 Oct 2025 09:36:53 -0700 (PDT)
Date: Tue, 21 Oct 2025 09:36:52 -0700
In-Reply-To: <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-5-seanjc@google.com>
 <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com>
Message-ID: <aPe2pDYSpVFxDRWv@google.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 21, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 18d69d48bc55..ba5cca825a7f 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -5014,6 +5014,65 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >  	return min(range->size, end - range->gpa);
> >  }
> >  
> > +int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> > +{
> > +	struct kvm_page_fault fault = {
> > +		.addr = gfn_to_gpa(gfn),
> > +		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
> > +		.prefetch = true,
> > +		.is_tdp = true,
> > +		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
> > +
> > +		.max_level = PG_LEVEL_4K,
> > +		.req_level = PG_LEVEL_4K,
> > +		.goal_level = PG_LEVEL_4K,
> > +		.is_private = true,
> > +
> > +		.gfn = gfn,
> > +		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
> > +		.pfn = pfn,
> > +		.map_writable = true,
> > +	};
> > +	struct kvm *kvm = vcpu->kvm;
> > +	int r;
> > +
> > +	lockdep_assert_held(&kvm->slots_lock);
> Do we need to assert that filemap_invalidate_lock() is held as well?

Hrm, a lockdep assertion would be nice to have, but it's obviously not strictly
necessary, and I'm not sure it's worth the cost.  To safely assert, KVM would need
to first assert that the file refcount is elevated, e.g. to guard against
guest_memfd _really_ screwing up and not grabbing a reference to the underlying
file.

E.g. it'd have to be something like this:

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 94d7f32a03b6..5d46b2ac0292 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5014,6 +5014,18 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
        return min(range->size, end - range->gpa);
 }
 
+static void kvm_assert_gmem_invalidate_lock_held(struct kvm_memory_slot *slot)
+{
+#ifdef CONFIG_PROVE_LOCKING
+       if (WARN_ON_ONCE(!kvm_slot_has_gmem(slot)) ||
+           WARN_ON_ONCE(!slot->gmem.file) ||
+           WARN_ON_ONCE(!file_count(slot->gmem.file)))
+               return;
+
+       lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
+#endif
+}
+
 int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
 {
        struct kvm_page_fault fault = {
@@ -5038,6 +5050,8 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
 
        lockdep_assert_held(&kvm->slots_lock);
 
+       kvm_assert_gmem_invalidate_lock_held(fault.slot);
+
        if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
                return -EIO;
--

Which I suppose isn't that terrible?
