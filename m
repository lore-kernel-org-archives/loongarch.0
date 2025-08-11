Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1D2DE216
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918639; cv=none; b=NjU4R/hd6rpRg9RkZXZ232gLDNc6bgCRGM51V3mqAVtTPSLo8UW1Ec9oN2PYaZc3Rm/PkRu4WL7KwWUlCyY71kXuKZ2AmC0u1UEyi4kzXcWxLo7/ky1lRDfy51hMytRCczCsqogyNk1B4kwflXM6Xeng+jKRT4T+ET3xIpz+YJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918639; c=relaxed/simple;
	bh=qgiFgOcVQXWTGIRCbQoEhTYzqdR5N9C4EvffGMFhE5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpDE/SP2Ir6KPUTIuSFm/BJeyFeTW/QUiDkR6O9uVswZY47mu7ah2d3d9NdYyQrmv7LGZslWMCubpi/++6TUozTycodrLA1v3Nkol2T5xRUxCZ4qHWRUdpTh994daypGvfYHEywVnwhuCaegCyqi/Y0jKM/b9MU2qX3/m38XomA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHX8X8Fx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHX8X8Fx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EECBC4CEF4
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754918639;
	bh=qgiFgOcVQXWTGIRCbQoEhTYzqdR5N9C4EvffGMFhE5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dHX8X8FxRvXYg7SrO6IcgrHFrVBd5Kcg5FwGEzOMBqR3innNp7fCOFatzncojxRMN
	 3AyNiWvTE9nc7ctTNbNSMyr0vJ1bWA8HLbpj/FrYVJy/xuCFnQygz+bZiSmligh+sO
	 QTp1kMjb1DEmTaJ7m+9plbYW9dWWqFJsL8H+kZXLMr3YUCchq9xDL8fG1S1tuNTUMe
	 g63l8QpFeFVXPBx9Rk0V9sGDcPPnu1PAa/PO2AbUbe7fJgBlZ+QrBCxW8GZFV3dhJ3
	 A43gEGlh5iPpXsKW4rHNKRjCyd8i87Avn2m/p+lgeywGKZ4RPEDtNNomA6k1NavUib
	 zex0xSf7nHqSg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so7213094a12.1
        for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 06:23:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4suYO7UekvlEKogqkgVGa8Vd0JEw07wd/4RUba5hw/LSDVJDLoN5F+kFqMKFdKYVlrNOoiDjVCik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw91n8fV7uQrFnqZ9m5oJoKWsnS3GgShztKcC0sR6yzoP/ysrkP
	y0eck0w4PiEtvsPnQ9+3nqlpSEBB4EhBayaDtjO2lbmsl8FV1JMDFGpjHyKxUlvcUe7RUt2UlD4
	iVWxQfllDs8pEfEgDMLG8pch6kgPIGJc=
X-Google-Smtp-Source: AGHT+IEwPZmVJxGErxtMADzHG5ZKBMlwpyeCW7XAoFqsWMIw1vhq77iCTww5rxF1FZhFeLBmY+eKinW5W4ziEFaiSPQ=
X-Received: by 2002:a05:6402:2810:b0:615:a62a:feca with SMTP id
 4fb4d7f45d1cf-617e2e9deb2mr11169446a12.31.1754918637640; Mon, 11 Aug 2025
 06:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811025544.458422-1-gaosong@loongson.cn> <c5f2a6d5-d793-94f0-8d8c-5cc5b7d142b8@loongson.cn>
In-Reply-To: <c5f2a6d5-d793-94f0-8d8c-5cc5b7d142b8@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Aug 2025 21:23:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5BAN68S5uYkSKwnU2yatoz-w5aGFak-ivMWwJkeZLjWg@mail.gmail.com>
X-Gm-Features: Ac12FXwAoH8eZu_Cf7UICJqcENtPWalKUmtqvPNMcKnoFClpfpbXngmWg0Ud3-I
Message-ID: <CAAhV-H5BAN68S5uYkSKwnU2yatoz-w5aGFak-ivMWwJkeZLjWg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: KVM: Use kvm_get_vcpu_by_id() instead of kvm_get_vcpu()
To: Bibo Mao <maobibo@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>, zhaotianrui@loongson.cn, lixianglai@loongson.cn, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 6:53=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2025/8/11 =E4=B8=8A=E5=8D=8810:55, Song Gao wrote:
> > Use kvm_get_vcpu() may can't get vcpu context, use kvm_get_vcpu_by_id()
> > instead of kvm_get_vcpu().
> >
> > Signed-off-by: Song Gao <gaosong@loongson.cn>
> > ---
> >   arch/loongarch/kvm/intc/eiointc.c | 5 ++++-
> >   arch/loongarch/kvm/intc/ipi.c     | 2 +-
> >   2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/int=
c/eiointc.c
> > index a3a12af9ecbf..5180da91d2e6 100644
> > --- a/arch/loongarch/kvm/intc/eiointc.c
> > +++ b/arch/loongarch/kvm/intc/eiointc.c
> > @@ -45,7 +45,10 @@ static void eiointc_update_irq(struct loongarch_eioi=
ntc *s, int irq, int level)
> >       }
> >
> >       cpu =3D s->sw_coremap[irq];
> > -     vcpu =3D kvm_get_vcpu(s->kvm, cpu);
> > +     vcpu =3D kvm_get_vcpu_by_id(s->kvm, cpu);
> > +     if (unlikely(vcpu =3D=3D NULL)) {
> > +             return;
> > +     }
> Brace {} is unnecessary with kernel coding style :), just something like
> this:
>         if (unlikely(vcpu =3D=3D NULL))
>                 return;
>
> The other looks good to me.
Maybe add a print statement the same as kvm_ipi_regs_access()?

Huacai

>
> Regards
> Bibo Mao
> >       if (level) {
> >               /* if not enable return false */
> >               if (!test_bit(irq, (unsigned long *)s->enable.reg_u32))
> > diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ip=
i.c
> > index e658d5b37c04..0348a83a7ed7 100644
> > --- a/arch/loongarch/kvm/intc/ipi.c
> > +++ b/arch/loongarch/kvm/intc/ipi.c
> > @@ -298,7 +298,7 @@ static int kvm_ipi_regs_access(struct kvm_device *d=
ev,
> >       cpu =3D (attr->attr >> 16) & 0x3ff;
> >       addr =3D attr->attr & 0xff;
> >
> > -     vcpu =3D kvm_get_vcpu(dev->kvm, cpu);
> > +     vcpu =3D kvm_get_vcpu_by_id(dev->kvm, cpu);
> >       if (unlikely(vcpu =3D=3D NULL)) {
> >               kvm_err("%s: invalid target cpu: %d\n", __func__, cpu);
> >               return -EINVAL;
> >
>
