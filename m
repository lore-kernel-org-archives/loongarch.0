Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E48205AB9
	for <loongarch@lists.linux.dev>; Sat, 21 Jun 2025 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750511066; cv=none; b=hnw5x9LURy5PDOwLtiRKak9fZHkZq+KOvHWKxBVm8D4ygC9m143ew9BSG/KNg6FBYnkHgUgYFKJYG5lMO6QE1CHhDyqXtNza0F8+4WzJi8bcicGiNgTHO2z4y5xmRlWw6rXI7RMgJexF2T4a3RAkJC+IrzTf5k0MaZOHhg4N4OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750511066; c=relaxed/simple;
	bh=6QweQXZQALbbMOaee2zdfPr5OeodNyxqG/Scf710cxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOI4psvhqtJbgx6xZ9388Wg9vAr8w7U4mBX7pytb8zDDCIasr+8EATHAD545GBdGeLQGSIEVctt2x8eU/DDc75lBRzR2zSiWCdVokwBwohLndz95RPIYnRn6a8E/ef4Vv19yVKOSLQHho/6FjtkLpohDpa8qS/U7UuaNIH/ohvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnnenCXF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnnenCXF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1C7C4CEED
	for <loongarch@lists.linux.dev>; Sat, 21 Jun 2025 13:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750511066;
	bh=6QweQXZQALbbMOaee2zdfPr5OeodNyxqG/Scf710cxs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TnnenCXFW7vJf31aTnnfEPGIEs+iB7gwSJD9CNB5PkWHBg36P4o+/B7bmH0uple71
	 D8diICfZ9o5SHR4v3LXcLuMTv5brc6XHNy1x09RJtnO2kWeOhq0e2qGQw8nk0G2aW5
	 gaJC3j+yhAtIU8Psio7gCpV8jOVsbXWA+Oy0rgmzkXhNV/riGlnHIe32+5Zyq7IDua
	 G8bkMIDQiHb2nt+qe1FSI9VzlsLco03TODaOKcQ/2JcP2SdkRGOAglQpMdv9t/fWCL
	 XidDV5PURr77Wv5Sk8/K4vL2k+GCxXzQaYaMjUL74DhcmpBwwNI2NdZw4xU8TF44UC
	 0wK506ekmZWGA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so5387078a12.3
        for <loongarch@lists.linux.dev>; Sat, 21 Jun 2025 06:04:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8nux2ZGpwU6I5IJvtvbJBFSoMTV07ZjEqP1g/91RZMVWBXAwB7YNMW0SS9MCzT7p5TcqxzSn10bQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRDC/T+1HXAcG7DqCNmBnubxxPrMOLqDT97oTl7x0X9u/zQkLI
	cjI/XcbPoPEo65PMCMZH1HCCkpA6yJ1cbmAOsEQYw854lPNMh561wSoAxuTd3bMQbMYhnYz0Xee
	LkcLxJojzuR/AEMEkbMfKl6l0ILschhw=
X-Google-Smtp-Source: AGHT+IGQRBL7DB8zJkZfP/u9p4DyAOzBJCLKNF0rZHsbTnJjr7rxQP9EqSolOu/bt3jwR6t+h1VwdsfN9OfxeHg6ay4=
X-Received: by 2002:a05:6402:254a:b0:606:f836:c656 with SMTP id
 4fb4d7f45d1cf-60a1d167667mr6466277a12.19.1750511064924; Sat, 21 Jun 2025
 06:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611014651.3042734-1-maobibo@loongson.cn> <20250611015145.3042884-1-maobibo@loongson.cn>
 <CAAhV-H6Eru5e6+_i+4DY9qwshibY43hjbS-QC-fhLD04-4mOGw@mail.gmail.com> <20250621122059.6caf299a@pumpkin>
In-Reply-To: <20250621122059.6caf299a@pumpkin>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 21 Jun 2025 21:04:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Wnk7j1ukDLT+KZ6+tJuxMFv5qG-YGsJsXfB=2-eC=Ow@mail.gmail.com>
X-Gm-Features: AX0GCFvQ5gbsr-dpIjkLorh1D2lUieAd7aI8t2hGmm4nmDBKryyUuUy3Dz3kdjk
Message-ID: <CAAhV-H7Wnk7j1ukDLT+KZ6+tJuxMFv5qG-YGsJsXfB=2-eC=Ow@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] LoongArch: KVM: INTC: Add address alignment check
To: David Laight <david.laight.linux@gmail.com>
Cc: Bibo Mao <maobibo@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Xianglai Li <lixianglai@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, David,

On Sat, Jun 21, 2025 at 7:21=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 19 Jun 2025 16:47:22 +0800
> Huacai Chen <chenhuacai@kernel.org> wrote:
>
> > Hi, Bibo,
> >
> > On Wed, Jun 11, 2025 at 9:51=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> =
wrote:
> > >
> > > IOCSR instruction supports 1/2/4/8 bytes access, the address should
> > > be naturally aligned with its access size. Here address alignment
> > > check is added in eiointc kernel emulation.
> > >
> > > At the same time len must be 1/2/4/8 bytes from iocsr exit emulation
> > > function kvm_emu_iocsr(), remove the default case in switch case
> > > statements.
> > Robust code doesn't depend its callers do things right, so I suggest
> > keeping the default case, which means we just add the alignment check
> > here.
>
> kernel code generally relies on callers to DTRT - except for values
> that come from userspace.
>
> Otherwise you get unreadable and slow code that continuously checks
> for things that can't happen.
Generally you are right - but this patch is not the case.

Adding a "default" case here doesn't make code slower or unreadable,
and the code becomes more robust.

Huacai

>
>         David
>
> >
> > And I think this patch should also Cc stable and add a Fixes tag.
> >
> >
> > Huacai
> >
> > >
> > > Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> > > ---
> > >  arch/loongarch/kvm/intc/eiointc.c | 21 +++++++++++++--------
> > >  1 file changed, 13 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/i=
ntc/eiointc.c
> > > index 8b0d9376eb54..4e9d12300cc4 100644
> > > --- a/arch/loongarch/kvm/intc/eiointc.c
> > > +++ b/arch/loongarch/kvm/intc/eiointc.c
> > > @@ -311,6 +311,12 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcp=
u,
> > >                 return -EINVAL;
> > >         }
> > >
> > > +       /* len must be 1/2/4/8 from function kvm_emu_iocsr() */
> > > +       if (addr & (len - 1)) {
> > > +               kvm_err("%s: eiointc not aligned addr %llx len %d\n",=
 __func__, addr, len);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > >         vcpu->stat.eiointc_read_exits++;
> > >         spin_lock_irqsave(&eiointc->lock, flags);
> > >         switch (len) {
> > > @@ -323,12 +329,9 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcp=
u,
> > >         case 4:
> > >                 ret =3D loongarch_eiointc_readl(vcpu, eiointc, addr, =
val);
> > >                 break;
> > > -       case 8:
> > > +       default:
> > >                 ret =3D loongarch_eiointc_readq(vcpu, eiointc, addr, =
val);
> > >                 break;
> > > -       default:
> > > -               WARN_ONCE(1, "%s: Abnormal address access: addr 0x%ll=
x, size %d\n",
> > > -                                               __func__, addr, len);
> > >         }
> > >         spin_unlock_irqrestore(&eiointc->lock, flags);
> > >
> > > @@ -682,6 +685,11 @@ static int kvm_eiointc_write(struct kvm_vcpu *vc=
pu,
> > >                 return -EINVAL;
> > >         }
> > >
> > > +       if (addr & (len - 1)) {
> > > +               kvm_err("%s: eiointc not aligned addr %llx len %d\n",=
 __func__, addr, len);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > >         vcpu->stat.eiointc_write_exits++;
> > >         spin_lock_irqsave(&eiointc->lock, flags);
> > >         switch (len) {
> > > @@ -694,12 +702,9 @@ static int kvm_eiointc_write(struct kvm_vcpu *vc=
pu,
> > >         case 4:
> > >                 ret =3D loongarch_eiointc_writel(vcpu, eiointc, addr,=
 val);
> > >                 break;
> > > -       case 8:
> > > +       default:
> > >                 ret =3D loongarch_eiointc_writeq(vcpu, eiointc, addr,=
 val);
> > >                 break;
> > > -       default:
> > > -               WARN_ONCE(1, "%s: Abnormal address access: addr 0x%ll=
x, size %d\n",
> > > -                                               __func__, addr, len);
> > >         }
> > >         spin_unlock_irqrestore(&eiointc->lock, flags);
> > >
> > > --
> > > 2.39.3
> > >
> >
>
