Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD07186E5C
	for <loongarch@lists.linux.dev>; Tue, 30 Jul 2024 19:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722366942; cv=none; b=GksDefR4PTd+E5kUVCApjTdGfSJGjg1Ap41TWEXfo24sLgFc10sJKtqSe0hfmmM1vlcao258rJEoLEZW0LjhrGqwK8sbBYU7sHKyVOeSXyss6igL0xLK+7On+SL0py/djL78b7/Tw9BboMlINDCi/nlK9GQLTWTwmtswZKTdOu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722366942; c=relaxed/simple;
	bh=PETnK4VwC/UhIxIqGvXyjWJId5AWW0Ewo3pA8BJW22I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C4WZXvxdSY0ETwECti6X0sQFZIJwu44efI+2SFKeNOkr/6fcCxuwEcY/KQxmnjVtr6Qs24qC1tF08GcLpKBs5zYuC0euxB9fMd+Df4bgNBIyOc7swaSmC4UdqjaCOcnZfEPxl5ws5elyuVrSI5ny3D18aU0Ca7LHeKoRETJAaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g8Iw38lb; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g8Iw38lb"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6648363b329so65826077b3.3
        for <loongarch@lists.linux.dev>; Tue, 30 Jul 2024 12:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722366940; x=1722971740; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ISzuCdCQ1ApBdrb/imzREuT+CY1/CgtGbhMTtqRUAc=;
        b=g8Iw38lbnnI16RmcI0R0UOo8uLK7cny/UGn82pDTiUSB7uMDED/8HtGiLpPmd9VRAr
         pshCLCPUfPnBvxgchnwiTNUvMA4yBnQ/xMgeVluTXl1dbHftv2aM1uvcTg2W53SExSaF
         HcJuXL/qxF3+nrKggDcT3fmmy65GMJxv6omGSjU+Oc6uHBsuZFC2aaihhZXGJB0TJE3R
         PB8OPncxSyeXklk1HIV26Hr0kefd/b7L1TSLiGnpGLLbXlIkMSOph6mHmETeLqMiWmJ+
         EjJCdpTAPdvgZpGVIQtDTlcvOvWbWgK3KCI/wUag6Ya4KpMtDWxmUHWKs4iw0PUkXMa0
         BGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722366940; x=1722971740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ISzuCdCQ1ApBdrb/imzREuT+CY1/CgtGbhMTtqRUAc=;
        b=cvzWfmwhXtbmSCDEPkKqvek3nzCIWxuL0yFQpg23WAXQ7NQgCsgiQJgcTg+jKHhpwU
         OLloy0U3iWrYLzFpHwtFGKp6m5Je5xMCuj8th4HNqkzv8E6y9RV3nGknG+mPlTj96kTI
         enKGoYUp109E2DkEBamqbMTCAu5lmj0NfnViGg7DAkf+HEGpRtbiErqGQ1ZUJVUeux41
         iw427HKGQLLPAmr+Dn/6OTqKhNismqL+u0ZEc/XI+RyMoUG2kNu7RuvyHLh3woMHJAde
         yEtCz3JplG149f4NSCq28JnsI3rDRmXbJhVMiLPTg60Hth7W0lJS6+A3xQ80AsIujTr0
         N4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXQOyt09PdW9TL4/wNj6bZztX7VO2MzWvDu7RDOB+eXC2oFn1jNHp6r1KopqdIQI3GMYkfUiQbGgK2hrU2K9/uaURlNWJ8JXbzd
X-Gm-Message-State: AOJu0YzM2Mtb9luyp4flMBL9JvsZCHrVFmKoFgj3DJrdMljd1V7ZgSei
	YHebxmqaylo0orGhc4Q9jui4kQeAinqGARZKiBxGDS4MrXAMdABqRIxwQGCA7RxuvNrRx8q+I43
	7HA==
X-Google-Smtp-Source: AGHT+IG9SmfuMb4gtd0Ao4BPZkLVByP1qx5TNQuKOL4wYDlOLmXqkqaZZiuA2JFi0z3WenSC5NZXiGCdyNk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2b8f:b0:e03:59e2:e82 with SMTP id
 3f1490d57ef6-e0b545a3f3dmr19046276.10.1722366939560; Tue, 30 Jul 2024
 12:15:39 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:15:38 -0700
In-Reply-To: <96df1dd5-cc31-4e84-84fd-ea75b4800be8@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-49-seanjc@google.com>
 <96df1dd5-cc31-4e84-84fd-ea75b4800be8@redhat.com>
Message-ID: <Zqk72jP1c8N0Pn1O@google.com>
Subject: Re: [PATCH v12 48/84] KVM: Move x86's API to release a faultin page
 to common KVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:51, Sean Christopherson wrote:
> > Move KVM x86's helper that "finishes" the faultin process to common KVM
> > so that the logic can be shared across all architectures.  Note, not all
> > architectures implement a fast page fault path, but the gist of the
> > comment applies to all architectures.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/x86/kvm/mmu/mmu.c   | 24 ++----------------------
> >   include/linux/kvm_host.h | 26 ++++++++++++++++++++++++++
> >   2 files changed, 28 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 95beb50748fc..2a0cfa225c8d 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4323,28 +4323,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> >   static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
> >   				      struct kvm_page_fault *fault, int r)
> >   {
> > -	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
> > -			    r == RET_PF_RETRY);
> > -
> > -	if (!fault->refcounted_page)
> > -		return;
> > -
> > -	/*
> > -	 * If the page that KVM got from the *primary MMU* is writable, and KVM
> > -	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
> > -	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
> > -	 * the GFN is write-protected.  Folios can't be safely marked dirty
> > -	 * outside of mmu_lock as doing so could race with writeback on the
> > -	 * folio.  As a result, KVM can't mark folios dirty in the fast page
> > -	 * fault handler, and so KVM must (somewhat) speculatively mark the
> > -	 * folio dirty if KVM could locklessly make the SPTE writable.
> > -	 */
> > -	if (r == RET_PF_RETRY)
> > -		kvm_release_page_unused(fault->refcounted_page);
> > -	else if (!fault->map_writable)
> > -		kvm_release_page_clean(fault->refcounted_page);
> > -	else
> > -		kvm_release_page_dirty(fault->refcounted_page);
> > +	kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
> > +				 r == RET_PF_RETRY, fault->map_writable);
> 
> Does it make sense to move RET_PF_* to common code, and avoid a bool
> argument here?

After this series, probably?  Especially if/when we make "struct kvm_page_fault"
a common structure and converge all arch code.  In this series, definitely not,
as it would require even more patches to convert other architectures, and it's
not clear that it would be a net win, at least not without even more massaging.
