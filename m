Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5624C4A33F7
	for <loongarch@lists.linux.dev>; Tue,  5 May 2026 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004101; cv=pass; b=u/wrcBK+J7lxRLpWJIN7mQBPFczIXpo8NFlwTgg8/fqCJyIPS79UFHr27bCkLlsgf2OXnGR9jHSg6oH3rh4x1YjbxUP72IkjK7SLUUtu5R/85LIsvbyVdsZRwALeSblNbvf6OPjXlqcjFX9ZhG/NdauHRt8R/q0yjvUQunMEbzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004101; c=relaxed/simple;
	bh=f+ypqmN+lQj0IF/Oa+7CTxDcYQldd91C7IUoR3r3pGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUzFElBRXCXNCeMwiupFLrXkh4eJ/UB2klUvS7vFIEPFB7+cEmtZNLe1UnyExf5+0JNYrasgwghBPlRPWYH/6oUATVolGuZr7kCiyrl1q77Qa9pXe7lWHP/NrGuxyk9h4Rmtr+DgTwvgceyWIIKTn86/VkcAdUtcYqgF6mmclVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e7R/Prfa; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e7R/Prfa"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bc264a50e7fso380459366b.0
        for <loongarch@lists.linux.dev>; Tue, 05 May 2026 11:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778004098; cv=none;
        d=google.com; s=arc-20240605;
        b=R+x1wJui+7WXsq3J5griBDNjB4am787SExUGo/yhKrhBSxKLAj6bVIYBwkHrmwGckh
         tyiKrQDNOL+5Q0yhEi7wTOKWeeg6VZcRRjBmpGTBceI0+l1eqPxfTSWtGKkOHbiyZ3yO
         R4TN+W/DKtVPGfp4wU8X+jasxlBBJXuRvh4iO1F2mLC/vJG6ClZ+LmFP/rUz0Tdp1Up+
         BmY2nmQFXsBZWu2Oqnx3kCr4gLDDXO318VTcHQt8tVeI2ozr+u09k9FNLAixiguhXvr8
         wIY2Rcxhrz+Y9f4SsK9A/NdhqAeSgHK4RxRNn6NN773upUjZ/FyJ+yIcZ/yoEzEZ6B1n
         GOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=;
        fh=whMjY38h//kQyyseIq61aiq7bx5PEguYXN0XSfvtR+o=;
        b=X5T8mVXAe79Z8JGe/Mz4e3iH3/ZyC5mKwqdGfp9KwDtOeUbbnYG8QbqP2gXb4Q28n8
         LLAziMoyuI6ytpvdFGnJAkIW1VDo6GMBQVOD0DbXR+C/gJsS9iPAJAb5hu1ZEy4Hv2cX
         RrZuItCypcGvQ93ShFFgiWPhsikAgP3H5GoGkYBBEdTbw0kaeyWKX0O9Oc3/NTMY6YmM
         Cylq3NFkl3KCsRbSZ5ywLVR2O212ZXPsioeNUNHSVYGB4JQ5CaiWWxJnd9FpCbKG06Xp
         tfm0blwtyNORlwMiz0pn48nTQ1ff0ORs4Hy6qy+0ptETEDkaTx82BMmlR8Y+RCHHT4dr
         5MHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778004098; x=1778608898; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=;
        b=e7R/PrfaihO3PbKCrn8WUr/zYlSzOoJYFupknPCGAMCai3fPDc0BDfYyKARqGOOvZT
         46To5aWEgxvn0Mw1IUHdjEy6RwUKIdLox6NpVjC6aFOi802chZNTLej26L9Z72rFckbJ
         pwqD/bieP09XmYqEgZVTWLjiFatTePKd2HFWQVyO46vGUaLMn9q403pg291MRD+KpC/q
         nLiTanQkUPyA+x3DZ2sqk2dJHAJaDA/O3t8/4V9tMFcCr845oGoI3qe7s6j9xRvHxmEm
         hmskoeZx/mdXm8eh85O6Xx0hK3TwTI9wgs9y5sTKzCDPb2v57p0/KErxftejJTNu1H3Q
         X+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004098; x=1778608898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=;
        b=BVkC+Z8KJQht/AeXrSM/D+s+CTNyAHWYT+bnom5m2J9S7kxVnyCAZyDB9aTguuAE4n
         n1t2XmXzAS4aAWnCISVCfIlNtLdxwK3QfGpSTquys5FqfLnVRj8q0BIkVfT9CfsdRzwf
         75HQpy5fB8GM5Pbpn3FMAWrTcS72wfZkk2WJHJix/od35Hep79aWV+PoPyas0Er8TGok
         yzdd5AfW8AsTM5SQpHTRGPs15iwr3jq0ssiJxipfxO3+RqoFnbFeHl3PUMjCrXdGiyG4
         jgRSu2YAl7gONqQCFYYmD3rEC+u7PJjwF/n3t2/4ZlM8Yxw6CV5J81ZjQ0MJ/GSdJjO1
         VDPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/6bpzRpKMNqmm86flzIvrOxGM4uNS1UEXonACXI4oq94thhkdisLkRBB46vvZX0jhW2G7d/tke3Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf+Hjo6sfjKO9S+wL+1rpZjrNt16Vh1HDPL9pyV6wQONz0wDl4
	2dH+zV4lQYtuUbCfbrDnSd97E3+ow4T/M6Rf4/fsnVjqEMhGpWY9WDY1A7HrurzkTkxEBuUD+9x
	cdvzAR7LGI49oCMrINZMBWFzCj5MCoq61U27vRhUi
X-Gm-Gg: AeBDievS7YLZEKpCJDwR5XiWubUWK0dEFEWm8QA/86Kkxtjy8cDqA1o2mcyRO1Ru1wz
	1LTlznMvE+bQ0I6UF2nRJkSNZpdZivBK/D/rURW3zCsq06lQgiRSjcqsyVVkHMpXvUHV9lbM2Z5
	CFDcZfg80FfZ9eizLYD+e0U8S9d94HB2xCdt8W0mTGdJ+xZKctkZvnTBZxpyy1f18tXoPGwjkZM
	Z/xr88C2u4zHaIibaNX3bMT1SW++icnvSW0B68dLiUyvRhKwi3P/IqdeluM4OcbZza4RUubo6lu
	m5u4gH4AAUFbjNQX0+hbLGw/Zss7xd0U8nr/IUhazJjRvg0GhcRkl8D3ELSODWnBaHVlJNDcQ30
	/q+kvAh5hNg5Sf1xfa5sDooQPFg==
X-Received: by 2002:a17:906:9f87:b0:ba7:cc67:488b with SMTP id
 a640c23a62f3a-bbffab33111mr887380266b.5.1778004097049; Tue, 05 May 2026
 11:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
 <20260504231048.1184273-1-jthoughton@google.com> <afohshVlK9YcBk-f@google.com>
In-Reply-To: <afohshVlK9YcBk-f@google.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 5 May 2026 11:01:00 -0700
X-Gm-Features: AVHnY4J0Tr074uKX9gnTkNPmv46TNeS2NEyt9u-k5f94BeNvCS-2m8Zf89eFVRE
Message-ID: <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
To: Sean Christopherson <seanjc@google.com>
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	shahuang@redhat.com, stable@vger.kernel.org, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 10:05=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Mon, May 04, 2026, James Houghton wrote:
> > On Mon, May 4, 2026 at 3:42=E2=80=AFPM James Houghton <jthoughton@googl=
e.com> wrote:
> > >
> > > kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> > > concurrently in the event that the KVM's `mm` is __mmput() at the
> > > same time that last reference to the KVM is being dropped.
> > >
> > > T1              T2
> > > KVM_CREATE_VM
> > >                 Get VM file from T1
> > > close VM
> > > exit_mm()       close VM
> > >
> > > T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all()=
,
> > >     with only the KVM srcu read lock held.
> > >
> > > T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
> > >     kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> > >     again, with only the KVM srcu read lock held.
> > >
> > > This leads to a potential double-free of
> > > kvm->arch.kvm_mmu_free_memory_cache and now with NV
> > > kvm->arch.nested_mmus.
>
> ...
>
> > >  void kvm_uninit_stage2_mmu(struct kvm *kvm)
> > >  {
> > > -       kvm_free_stage2_pgd(&kvm->arch.mmu);
> > > +       lockdep_assert_held_write(&kvm->mmu_lock);
> >
> > *facepalm*.... this doesn't account for the other callers of
> > kvm_uninit_stage2_mmu(). They will get lockdep warnings.
> >
> > I've attached a diff to the bottom of this reply that *does* deal with =
them.
> > :( Sorry.
>
> ...
>
> > > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > > index 883b6c1008fb..977598bff5e6 100644
> > > --- a/arch/arm64/kvm/nested.c
> > > +++ b/arch/arm64/kvm/nested.c
> > > @@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kv=
m)
> > >  {
> > >         int i;
> > >
> > > +       guard(write_lock)(&kvm->mmu_lock);
> > > +
> > >         for (i =3D 0; i < kvm->arch.nested_mmus_size; i++) {
> > >                 struct kvm_s2_mmu *mmu =3D &kvm->arch.nested_mmus[i];
> > >
> > >                 if (!WARN_ON(atomic_read(&mmu->refcnt)))
> > > -                       kvm_free_stage2_pgd(mmu);
> > > +                       kvm_free_stage2_pgd_locked(mmu);
> > >         }
> > >         kvfree(kvm->arch.nested_mmus);
> > >         kvm->arch.nested_mmus =3D NULL;
> > > --
> > > 2.54.0.545.g6539524ca2-goog
> >
> > And here is the diff that should fix this patch. (Sorry!!)
>
> There are more issues.  kvm->arch.mmu.split_page_cache can be freed by
> kvm_arch_commit_memory_region(), which holds slots_lock and slots_arch_lo=
ck,
> but not mmu_lock.

Thanks. I also noticed that kvm->arch.mmu.split_page_cache is
documented as being protected by kvm->slots_lock; we should be holding
it here. But we cannot take it here because we are already holding the
KVM srcu lock.

> IMO, the handling of kvm->arch.mmu.split_page_cache should be reworked.  =
I don't
> entirely get the motivation for aggressively freeing the cache.  The cach=
e will
> only be filled if KVM actually does eager page splitting, so it's not lik=
e KVM is
> burning pages for setups that will never use the cache.
>
> Maybe I'm underestimating how many pages arm64 needs in the worst case sc=
enario?
> (I can't follow the math, too many macros).  But if KVM is configuring th=
e cache
> with a capacity that's _so_ high that the "wasted" memory is problematic,=
 then we
> probably should we revisit the capacity and algorithm.  E.g. if KVM is sp=
litting
> from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this on ar=
m64), then
> we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.

I'm not sure I've fully understood the point you're making, but I
*think* we can just drop the
    kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
line from kvm_uninit_stage2_mmu(). It will get freed when the VM is
destroyed anyway.

So I'm thinking of splitting this patch into two (unless someone tells
me otherwise):

1. Drop the kvm_mmu_free_memory_cache() from kvm_uninit_stage2_mmu()
    Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty
logging is enabled")

2. Grab the MMU write lock around the kvfree(nested_mmus) bit in
kvm_arch_flush_shadow_all(); do the kvfree() without holding the the
lock.
    Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested
Stage-2 mmu structures")
