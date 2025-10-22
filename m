Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6308A2EBBA6
	for <loongarch@lists.linux.dev>; Wed, 22 Oct 2025 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761156774; cv=none; b=BLPTo0OIC6jgvIWnlTpN4JUEolylOsL9GG20EiBMO1ESO/Kwupd7/F+mSuB4nO8KSLG6YENElyaBZYDvl+V5q0kJrCOy/MU6UTOL8k8p38Qjyt0uChosLKrxcdCmXSc3/uN+MyBBrQtl1qrG/izGjaZJAR+aQIi4DqIlWaJndP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761156774; c=relaxed/simple;
	bh=UmH1svExxe3696H3/lrjYo2eB/zUc0gH+XKx1eKRj0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bg2RGhaaMXKIa6vKREMNaTxsgDrlZTg4gdA7Q/mV6hwOc35i7ffG2paw/NI5dJ39LrfAZykgI5VWESm0TL/xety+LNQEPXrGbjkRrCMVIzCQjt8WRfRauRqHaAm7FbHAdCeDDCAIUrawp0yXc4nql2PJFFmWFbXlGuyW8x1lEdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e/cYskuW; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e/cYskuW"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33d75897745so3562782a91.0
        for <loongarch@lists.linux.dev>; Wed, 22 Oct 2025 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761156771; x=1761761571; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V5F7t24lC7jgleOK3FW+MwSMdfYKm48DJa8i0z/06to=;
        b=e/cYskuWyIQpg3D27Z5FTQbBrRvwr7fyTOvcQy8QqegpR5QIDg1g96mnneYK9TJYTj
         y0C4NZhEhxtxlaj2o2CqiEeyKP8+1O2FFwscf30fo3t+5O3CMVWEhQ7Bh67gQYoVu/kZ
         RlUOV1IUpzBvHcoopGn8a2eJB8uFxZ29q85Tg4uJxaT2awEbycwD2BfQW3y73jlBTZj4
         UXLbHLFhjKgwe3dZe3lqz/3XoubWSBlbHt4T24EvPLKi9ukFqJ8qJYhs7CEZL3ubz9Vu
         QO3xYDhwIQM2IOtzjx4j9F6TvqJoqRjMLTWFf+noT3ILDj6RFtW2YW48k954QHfQtwwl
         h5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761156771; x=1761761571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5F7t24lC7jgleOK3FW+MwSMdfYKm48DJa8i0z/06to=;
        b=UbBJ/Us4gGLSWgChwfaI4r30WEHeTUSdciGcJ5TBZqxyaIy+9MZSb/3dhfh/BBkNJT
         IM1ZMo3DElkQf/I/n9Q4/XgnmxtlAhZPfmVEyseCENpHTADyhcdjSSZ/Ps+jdLvBlz8g
         rL2a+l+GD1S1Qg5b4dQGbeHNNg9EgK/1ODC0dE5eNbyJXmCb6WA1f59272n3Jw74k199
         TCDtU/1daK2+C+AyxI/ELmFF6055roDiJdIXHKxd8lcXHxrRPdsuZNmfVRVDPkQIgimg
         ipK4JBVkAA8b9/3rP02Ffg6UtGg58RCvf5NqgR66Fi69Yw+FUu/LITFeQby0va5qvmc1
         dTLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNBuKW5QZV8BEj1UzLm2ysKYOYgCZlANObbYZMX1inZCAWLqpLjgpMSk/E/yCRaBIWVxSpADtpChE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7tHvJAEAhfGCxeYLTu0Nk6CONQ08DQ7b2PRKzxDftQaPRmqTf
	YpUCeAfXz84Tdj/C4ecRs/XMcj9V6YNMfQc1v6BHByvPABU3/5dB4IcTnFSh4oNdmFd4e9I0hXd
	ShInWUQ==
X-Google-Smtp-Source: AGHT+IFAZr0wpbGx7b8wp6kFow05WwkzX+gl9q/tJGKoWGxIdF2WxHsL5OqcbuH+85tLuHrz8145UQS6wJM=
X-Received: from pjbnm19.prod.google.com ([2002:a17:90b:19d3:b0:33d:cdb9:9adf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f8d:b0:33b:be31:8193
 with SMTP id 98e67ed59e1d1-33bcf85d59dmr30647063a91.6.1761156768896; Wed, 22
 Oct 2025 11:12:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:12:47 -0700
In-Reply-To: <aPiQYBoDlUmrQxEw@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-5-seanjc@google.com>
 <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com> <aPe2pDYSpVFxDRWv@google.com> <aPiQYBoDlUmrQxEw@yzhao56-desk.sh.intel.com>
Message-ID: <aPken0s-0MfdSd5o@google.com>
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

On Wed, Oct 22, 2025, Yan Zhao wrote:
> On Tue, Oct 21, 2025 at 09:36:52AM -0700, Sean Christopherson wrote:
> > On Tue, Oct 21, 2025, Yan Zhao wrote:
> > > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > index 18d69d48bc55..ba5cca825a7f 100644
> > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > > @@ -5014,6 +5014,65 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> > > >  	return min(range->size, end - range->gpa);
> > > >  }
> > > >  
> > > > +int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> > > > +{
> > > > +	struct kvm_page_fault fault = {
> > > > +		.addr = gfn_to_gpa(gfn),
> > > > +		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
> > > > +		.prefetch = true,
> > > > +		.is_tdp = true,
> > > > +		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
> > > > +
> > > > +		.max_level = PG_LEVEL_4K,
> > > > +		.req_level = PG_LEVEL_4K,
> > > > +		.goal_level = PG_LEVEL_4K,
> > > > +		.is_private = true,
> > > > +
> > > > +		.gfn = gfn,
> > > > +		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
> > > > +		.pfn = pfn,
> > > > +		.map_writable = true,
> > > > +	};
> > > > +	struct kvm *kvm = vcpu->kvm;
> > > > +	int r;
> > > > +
> > > > +	lockdep_assert_held(&kvm->slots_lock);
> > > Do we need to assert that filemap_invalidate_lock() is held as well?
> > 
> > Hrm, a lockdep assertion would be nice to have, but it's obviously not strictly
> > necessary, and I'm not sure it's worth the cost.  To safely assert, KVM would need
> Not sure. Maybe just add a comment?
> But even with kvm_assert_gmem_invalidate_lock_held() and
> lockdep_assert_held(&kvm->slots_lock), it seems that
> kvm_tdp_mmu_map_private_pfn() still can't guarantee that the pfn is not stale.

At some point we have to assume correctness.  E.g. one could also argue that
holding every locking in the universe still doesn't ensure the pfn is fresh,
because theoretically guest_memfd could violate the locking scheme.

Aha!  And to further harden and document this code, this API can be gated on
CONFIG_KVM_GUEST_MEMFD=y, as pointed out by the amazing-as-always test bot:

https://lore.kernel.org/all/202510221928.ikBXHGCf-lkp@intel.com

We could go a step further and gate it on CONFIG_KVM_INTEL_TDX=y, but I don't
like that idea as I think it'd would be a net negative in terms of documenation,
compared to checking CONFIG_KVM_GUEST_MEMFD.  And in general I don't want to set
a precedent of ifdef-ing common x86 based on what vendor code _currently_ needs
an API.

> e.g., if hypothetically those locks were released and re-acquired after getting
> the pfn.
> 
> > to first assert that the file refcount is elevated, e.g. to guard against
> > guest_memfd _really_ screwing up and not grabbing a reference to the underlying
> > file.
> > 
> > E.g. it'd have to be something like this:
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 94d7f32a03b6..5d46b2ac0292 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -5014,6 +5014,18 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >         return min(range->size, end - range->gpa);
> >  }
> >  
> > +static void kvm_assert_gmem_invalidate_lock_held(struct kvm_memory_slot *slot)
> > +{
> > +#ifdef CONFIG_PROVE_LOCKING
> > +       if (WARN_ON_ONCE(!kvm_slot_has_gmem(slot)) ||
> > +           WARN_ON_ONCE(!slot->gmem.file) ||
> > +           WARN_ON_ONCE(!file_count(slot->gmem.file)))
> > +               return;
> > +
> > +       lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
> 	  lockdep_assert_held(&file_inode(slot->gmem.file)->i_mapping->invalidate_lock);
> > +#endif
> > +}
> > +
> >  int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> >  {
> >         struct kvm_page_fault fault = {
> > @@ -5038,6 +5050,8 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> >  
> >         lockdep_assert_held(&kvm->slots_lock);
> >  
> > +       kvm_assert_gmem_invalidate_lock_held(fault.slot);
> > +
> >         if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
> >                 return -EIO;
> > --
> > 
> > Which I suppose isn't that terrible?
> Is it good if we test is_page_fault_stale()? e.g.,

No, because it can only get false positives, e.g. if an mmu_notifier invalidation
on shared, non-guest_memfd memory.  Though a sanity check would be nice to have;
I believe we can simply do:

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c5734ca5c17d..440fd8f80397 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1273,6 +1273,8 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
        struct kvm_mmu_page *sp;
        int ret = RET_PF_RETRY;
 
+       KVM_MMU_WARN_ON(!root || root->role.invalid);
+
        kvm_mmu_hugepage_adjust(vcpu, fault);
 
        trace_kvm_mmu_spte_requested(fault);
