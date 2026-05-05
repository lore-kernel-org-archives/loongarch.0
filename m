Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9BB3AE1B9
	for <loongarch@lists.linux.dev>; Tue,  5 May 2026 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778000721; cv=none; b=ED6YOXCbam19M1uU3u0wBekczrkeH3Tp2z3YV0wJQxpKFm4rqN9bMiLXH78jJL24qkfbh1p/teM7dRDDb5Q0dB0RCcMMoVE+7PAwlRPK3wLF8MyZXfUYsjNbcoa0UHhojBtK0yd2p3OmQEcb6Tu9EgXlrHKds+nrzBclkYCfwKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778000721; c=relaxed/simple;
	bh=LlXGiT8km7O3+s8Me6WlqDhDtU9jqmDQ3ztOup/45zg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nt07LqCDqV3SNiC1sasCHjXV1bV5KbAlRfoBvSP0zWcTjlYNiAZu0QD/yUQO1a7+DQWHadbK7AXqu7NytMf85HAqzzVWB97cZTANVoEgqOz9Seu+kOH8hpqYthHqO93BzV328vMExvvH6BPnLSNmE/aolgWniU0WKBy5z33idGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UoONguXk; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UoONguXk"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso1437559b3a.3
        for <loongarch@lists.linux.dev>; Tue, 05 May 2026 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778000718; x=1778605518; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3ZWo/jJEgMHbppCM8fWNjqKfThN79PtinobDbAzSRU=;
        b=UoONguXkG2Fw5pMdG0qhE6hzzRRh/Q3sn7TOZXoipoI6veJ8032oVNOpCiXUIuEZoi
         RD4O7Acxwul40/AHEOPmMTkZtZtKp/G+kai+m5IZVqsya+ZD5FNYBfsKWTEp4hr6s6fq
         kw8Nhr+heo3tpoVFV53JlShHsSHS9GAon3V7qfaVaG93pvu8dao73z3VaggNWLhOvSTE
         K53ezCYzW/EvNV6/qaSVefFWU5cFPG5+No9prb1SOm2rzN7PKiE0VsBcbAxyRL82iekv
         AWEMxhYF+01y0jyzFmUjhR7lLSdLexxhts2UhTHIzOiN7jGCHAfkdusRz/juJAZMEFq0
         1xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000718; x=1778605518;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m3ZWo/jJEgMHbppCM8fWNjqKfThN79PtinobDbAzSRU=;
        b=nKnG0dB/1E4CjTPnB+sVHCynUeUJJ4V2BDMNrKYyzzUE9IIV8+pWW0cBr2ejLULWn2
         4A1eIUTAZJUhXY2rsuE6NJ/hhEfdcvNd2zcVuQfLkAofnuUSylqk8YP+n5WYLVMnHbWQ
         UTauPnumaQQDYW85km4MYz/VbQXsFLxVlagPhMxFKkLzZlaKBN/gpOZasO9wL6/b8tBY
         LsoSsLc7pF9pUdJY5dQnHO4DOouumo1rPIEWxiysMFIAp9kwWmuNynsT1lO8+JL6zCXK
         WTpoiaMRucCAuYgT4KbUevU5P/7otqnjLNTmzxJa539BINcNImL01q9fQ/QvBCjwEkzR
         cvsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gQTFHDZ6tqLgHSkbyZggsPYEA5V0dDgmx78kJ5NxUHOJjm9W0W/26IZNof7AntbUSA5oYbCB2NN4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9UPn2RNoSJrm2kJwCz+PQTeoOlvO/3w7O9lTJdX2dSH/pxRhy
	ZkiLxfXbf1i/5yl5MzlgY8T1RnfqsTPIsi2Burta3WkYc4QrQpdWM/TCuI4STZQ4ykZOFGDjeEv
	6pv9VMQ==
X-Received: from pfblm11.prod.google.com ([2002:a05:6a00:3c8b:b0:82c:e899:f089])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:368c:b0:82c:e1a3:986f
 with SMTP id d2e1a72fcca58-839247bfb7bmr3652379b3a.43.1778000717292; Tue, 05
 May 2026 10:05:17 -0700 (PDT)
Date: Tue, 5 May 2026 10:05:15 -0700
In-Reply-To: <20260504231048.1184273-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com> <20260504231048.1184273-1-jthoughton@google.com>
Message-ID: <afohshVlK9YcBk-f@google.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	shahuang@redhat.com, stable@vger.kernel.org, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026, James Houghton wrote:
> On Mon, May 4, 2026 at 3:42=E2=80=AFPM James Houghton <jthoughton@google.=
com> wrote:
> >
> > kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> > concurrently in the event that the KVM's `mm` is __mmput() at the
> > same time that last reference to the KVM is being dropped.
> >
> > T1              T2
> > KVM_CREATE_VM
> >                 Get VM file from T1
> > close VM
> > exit_mm()       close VM
> >
> > T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> >     with only the KVM srcu read lock held.
> >
> > T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
> >     kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> >     again, with only the KVM srcu read lock held.
> >
> > This leads to a potential double-free of
> > kvm->arch.kvm_mmu_free_memory_cache and now with NV
> > kvm->arch.nested_mmus.

...

> >  void kvm_uninit_stage2_mmu(struct kvm *kvm)
> >  {
> > -       kvm_free_stage2_pgd(&kvm->arch.mmu);
> > +       lockdep_assert_held_write(&kvm->mmu_lock);
>=20
> *facepalm*.... this doesn't account for the other callers of
> kvm_uninit_stage2_mmu(). They will get lockdep warnings.
>=20
> I've attached a diff to the bottom of this reply that *does* deal with th=
em.
> :( Sorry.

...

> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index 883b6c1008fb..977598bff5e6 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
> >  {
> >         int i;
> >
> > +       guard(write_lock)(&kvm->mmu_lock);
> > +
> >         for (i =3D 0; i < kvm->arch.nested_mmus_size; i++) {
> >                 struct kvm_s2_mmu *mmu =3D &kvm->arch.nested_mmus[i];
> >
> >                 if (!WARN_ON(atomic_read(&mmu->refcnt)))
> > -                       kvm_free_stage2_pgd(mmu);
> > +                       kvm_free_stage2_pgd_locked(mmu);
> >         }
> >         kvfree(kvm->arch.nested_mmus);
> >         kvm->arch.nested_mmus =3D NULL;
> > --
> > 2.54.0.545.g6539524ca2-goog
>=20
> And here is the diff that should fix this patch. (Sorry!!)

There are more issues.  kvm->arch.mmu.split_page_cache can be freed by
kvm_arch_commit_memory_region(), which holds slots_lock and slots_arch_lock=
,
but not mmu_lock.

IMO, the handling of kvm->arch.mmu.split_page_cache should be reworked.  I =
don't
entirely get the motivation for aggressively freeing the cache.  The cache =
will
only be filled if KVM actually does eager page splitting, so it's not like =
KVM is
burning pages for setups that will never use the cache.

Maybe I'm underestimating how many pages arm64 needs in the worst case scen=
ario?
(I can't follow the math, too many macros).  But if KVM is configuring the =
cache
with a capacity that's _so_ high that the "wasted" memory is problematic, t=
hen we
probably should we revisit the capacity and algorithm.  E.g. if KVM is spli=
tting
from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this on arm6=
4), then
we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.
