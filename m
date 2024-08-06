Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5451BD013
	for <loongarch@lists.linux.dev>; Tue,  6 Aug 2024 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722932726; cv=none; b=Lc25ghAewCOGP+nazzp4a3gt/NTOF5QHDfgT7UWQrrbKz1ouu1GPXz3s2SnDLAAGkVdZc4l84aKKfguAjFDroP81WBBlHJsHViQI6HqQZoJassvZWMdH1pvwQzFSLec/eJdB3Xgnotp6336MgYTRnOVmyg+1+p75KPlw022zwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722932726; c=relaxed/simple;
	bh=k7zHAEEEUxyRomVtvnM2viO2YFKTnrtBHjiLIBw6Z38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZIXTPlasAI4cMi+a3SJN+llQQ7PSGVYP63koRlq7+e4dzUn1VBnJ88Lk1uNfqjmjWy1p+79AwHz7Jno/9bLAe8kFpbIelRxeXNXyA5gVcn0GAHfmuOPZPhLnWVGYu0zIevL18dkRvRJwDMzofqdAs35+Te1Y+/UE5Wbj4Hn0FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yI3Iaswv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yI3Iaswv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-368313809a4so3707652f8f.0
        for <loongarch@lists.linux.dev>; Tue, 06 Aug 2024 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722932721; x=1723537521; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mJJmve+UBZqWHPzqvXAkYx9wHC1+4s/jebXaeWpKSm4=;
        b=yI3IaswvtxdLELnbfzCUcQEOihCI+kf/j3YCT5+SfNEBQW8CX/gej1qPzlzjIIfnce
         Z5T6ajBzUNhby53o60CV3Uz/dYUTFr6UR5W0fGUo5RT+tg6zW1aLXZMpcIdHQLOH3KbO
         d1iHF3amTSUepvsUNxgF/mLIS7NvL0SlOf7zxzXFqJEiOV8Jx30ZrItyLHNAmSUI+aIc
         q7KRglHwVmw2tfNd9f8QxmuUm1tWDhglgLCSaTeMmAi5VEf45VZMF4cKY+/HZ0mzdodX
         sQCAtXVwT1NDzFxYZrddLynMAqdyq+wlLLIdFKYM/BUoepFkBsblSHKwKvxiNeEiWrCL
         ydGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722932721; x=1723537521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJJmve+UBZqWHPzqvXAkYx9wHC1+4s/jebXaeWpKSm4=;
        b=u7W7QK9EehbpawwSbUE6BrWb/wlHA0A/dfTx2m+g2gWmrfTRrQT8Oq3J0yE+q4Rhq9
         Ha5hZ+YE/v4Row0oX876v8LcyBGX2yr7WF9Og/TtLCFAWQdos0baPtr2IescVJ1feHsB
         7q2sBUMwYhGeB7LbDDI3Jvi+g0izKmA0PY36LRdDOdJKi6tgvEg5MibDWU5vvV/vD3km
         bK0RFa0QS//S4q7SSU4RKZKELk7maXaTKcXqU2wmGNhYfOS54+XCwyT3e1mx/U2p6zn+
         QfG4tiAyNcPmQftSTbwMOKscMfauAl5gS4rp+aax+GbRmPQgVAa01aqTsX6os1uVXgob
         VobQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtGRS/uayWZ45an3zdVrymCX/egZiLkQvQosG7nrGsIDdkaoMhJNqVQGrQriBmVHfwMGK4eF8xi7UQ2MyiK6Kb5P7JSgVUCkVO
X-Gm-Message-State: AOJu0Yzx+ES8fR5UJWT7wuNs1we02U6j4J6gMEFZbYPLASdx+5/ROdI+
	M1xWcAg+bqOyrNzbYtDttBkZ2axLfJ7yc3JPfR1XgHEgqdAKx/lpS5/o66G01zS3Mbm356jGPBO
	h9DFHYyQTV+OySitGZNxnypbEC82Tjg0Gz4Hn
X-Google-Smtp-Source: AGHT+IEuJVBQVgvvzdKoA/IljQMVSQQCy4ILUfIi4PfR2IcPP3crNOUdNiIGa90I2U+SlhluocGZ2/3ZifLac4nEAJY=
X-Received: by 2002:a05:6000:1151:b0:362:2af4:43cc with SMTP id
 ffacd0b85a97d-36bbbe5be99mr9354068f8f.19.1722932721184; Tue, 06 Aug 2024
 01:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev>
In-Reply-To: <ZrFfgzRbiqT-Zi2O@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 6 Aug 2024 09:24:43 +0100
Message-ID: <CA+EHjTxZwDOeC94Y1otxcp-mcwUZA=TpQp4pav-E8Xvb2MA64Q@mail.gmail.com>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
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
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Tue, 6 Aug 2024 at 00:26, Oliver Upton <oliver.upton@linux.dev> wrote:
>
> [+cc Fuad]
>
> Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
> the page as dirty out of the critical section") that restructuring
> around the MMU lock was helpful for reuse (presumably for pKVM), but I
> lack the context there.

That was for some refactoring I'd done later on for mem_aborts in
pKVM. That said, I didn't know at the time that there might be a race
with some filesystems. I'll keep this in mind for the pKVM code we
have for now, and when upstreaming.

Thanks,
/fuad

> On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> > Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> > page/folio dirty after it has been written back can make some filesystems
> > unhappy (backing KVM guests will such filesystem files is uncommon, and
>
> typo: s/will/with/
>
> > the race is minuscule, hence the lack of complaints).  See the link below
> > for details.
> >
> > This will also allow converting arm64 to kvm_release_faultin_page(), which
> > requires that mmu_lock be held (for the aforementioned reason).
> >
> > Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/mmu.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 22ee37360c4e..ce13c3d884d5 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >       }
> >
> >  out_unlock:
> > +     if (writable && !ret)
> > +             kvm_set_pfn_dirty(pfn);
>
> I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
> a reference.
>
> > +     else
> > +             kvm_release_pfn_clean(pfn);
> > +
> >       read_unlock(&kvm->mmu_lock);
> >
> >       /* Mark the page dirty only if the fault is handled successfully */
> > -     if (writable && !ret) {
> > -             kvm_set_pfn_dirty(pfn);
> > +     if (writable && !ret)
> >               mark_page_dirty_in_slot(kvm, memslot, gfn);
> > -     }
> >
> > -     kvm_release_pfn_clean(pfn);
> >       return ret != -EAGAIN ? ret : 0;
> >  }
> >
> > --
> > 2.46.0.rc1.232.g9752f9e123-goog
> >
>
> --
> Thanks,
> Oliver
>
