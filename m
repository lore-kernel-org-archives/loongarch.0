Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71CE1A2632
	for <loongarch@lists.linux.dev>; Sat, 21 Jun 2025 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750504864; cv=none; b=QgRpEr4r4nZxQ6azEQuxvsNc9b7dHiCQ7PV+rdjF4s6m/qdBXsYbq/9++3yvpF011a/sfBi/XnnlJOvNrekoWk5y/nFLo5MEeWY5xiZTzu+CkbQmJ5eDRcAq1mE2Iv8GoDd7JIMlrpfflLOhJ4K/NEdSHd+D41o5oGio9ecGlPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750504864; c=relaxed/simple;
	bh=NR5ZXDg0NMK7LZl7jdtTqHrpcosN3wt+H3ZvZL64uuA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tw88mVifjYqSe9LNoRjhhLstNTIC9zIA7KdiL3NL+vzOmtmM0/qeasFIWeIW9M9bHJT9cGEpsUyGEZNRmMePA78MEJd6oemzrJpmF1TQ11bfpopvmdWKr3ihr+Xj7kuxIaZ+ZRa8BnxeZGbkC8yLiEAx2PCvfkYbB964YVnjxhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyXZ+iBD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyXZ+iBD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so29797295e9.1
        for <loongarch@lists.linux.dev>; Sat, 21 Jun 2025 04:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504861; x=1751109661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVtHXMoHrZpItcZ9JNMwabBUxiaMZC31W4Vj2gMNddg=;
        b=cyXZ+iBDe3oNThfN/jgkfh5sN09tufDqQo3iuzC67cukWAvJtAWusrh21pokyv4f0B
         NN8+1fg8i5xlx3pdyBQh4uFpmdQylnx37kK9tIsn9CDac2M5KwHKUAoYPCtX9VY4hIlu
         yiY0i61q8F0QFEODOaXtC6so2AyYgOoIrU+/TT+bbIe79sqJGQ9krqDaKmfmyIEJyUtR
         W0c00ztswOK230J5+5jMwAS2K/yJVsevN15HzqXO1FULt813LK11DQUGzrn9ApZznQzW
         bYjbPGYMiTXAtf862rxb0K/hyQzlAxcJSBZir/VwBSbnPstbZ87IBRzu5QMmNr+Q7ybc
         7a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504861; x=1751109661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVtHXMoHrZpItcZ9JNMwabBUxiaMZC31W4Vj2gMNddg=;
        b=v90fFOLvXvQ6afP+Utmsb1JzZMxT1Zg3+rkwPETXDxqmGcC4bLBc01BU/ROCvZ8LV4
         ixfnfd8hhwNEfCJCaFJqfZcViPgSOhZEkxIfhQmDbJs6SU8rUsCPxw/FmRoTVankobjw
         hUluY3kMkRZniOt9gpOv6ZlQII0pXhbLSaLu1sRc693tXW1OvOGA8bFi8IFzKuSDE7bu
         IIIQVq9+AcnWzLpV3vkcTqLYhIVp6nPsfADe1Y8cbd//st1ZkeUzfOdgjlpyxit2jw4U
         Y87KjjV9jakGA4+roKUatjOJrjF3CvafZl7yIKRC99giJs3ZrQDUMCKVBIAkJrbO9iUy
         vMGw==
X-Forwarded-Encrypted: i=1; AJvYcCUBdzvn7HKcZiAeUndlgiKgt3lV69PtWmAGbNk6gO5x3rgVf+oqJT9Z0QKxpEkbL0WnGRwg7JYsTK4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3d1k4guLRZRRetmml+5sd8ClVSJzFTYbICzbqesjNSO0dIOp6
	usaB3NTRSyN5XpAXm+FU3L3r8p/jGOP2PGrHFsFY2MWZVi9NscAshwr1
X-Gm-Gg: ASbGncsNkrIBXMWE/aM8jUFNhI8LYhzcTPseZAToGw7Kzvx0ouVMr/uxKZdhY42+h6R
	G6fQPkgG19XicYQBG4cIe3QCfrJEse2XxWWlglrif0v+IHMi19kkjK/W0awnmXjd6kqXvCDiKVL
	r4fKmDJ6OaVwmj2+LSyVMU488GCpAO7PCbIEYImS7Yc73pygp4co0Nmnd26I2jMKZ45sEi9PxcY
	o6lY4Y66md+ZmUSjItCLsvTu16jIzyq84m+miQawPHLe4jZfPws3sXrf7J6Y/28CgSoz1+ugip6
	IuFD5+V7d3QQ/hSTI2Ki5Zk2o/lHB5yH23iqVeunvLN4q9wSg1nKMtwUQKqh7gsOzGZCRUp8wbU
	xDcvsfvQUCebyF9lbOO0U6yOm
X-Google-Smtp-Source: AGHT+IFjYknI/NeOW18++Rn42Mxx5swXjhEFW71pYEimDWbmXgcrBx4iFJVHTv3S7pkDar/TjlhEEA==
X-Received: by 2002:a05:600c:a48:b0:453:6b3a:6c06 with SMTP id 5b1f17b1804b1-4536b3a708amr19192415e9.29.1750504860877;
        Sat, 21 Jun 2025 04:21:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm86192885e9.12.2025.06.21.04.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:21:00 -0700 (PDT)
Date: Sat, 21 Jun 2025 12:20:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Bibo Mao <maobibo@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] LoongArch: KVM: INTC: Add address alignment
 check
Message-ID: <20250621122059.6caf299a@pumpkin>
In-Reply-To: <CAAhV-H6Eru5e6+_i+4DY9qwshibY43hjbS-QC-fhLD04-4mOGw@mail.gmail.com>
References: <20250611014651.3042734-1-maobibo@loongson.cn>
	<20250611015145.3042884-1-maobibo@loongson.cn>
	<CAAhV-H6Eru5e6+_i+4DY9qwshibY43hjbS-QC-fhLD04-4mOGw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Jun 2025 16:47:22 +0800
Huacai Chen <chenhuacai@kernel.org> wrote:

> Hi, Bibo,
>=20
> On Wed, Jun 11, 2025 at 9:51=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wr=
ote:
> >
> > IOCSR instruction supports 1/2/4/8 bytes access, the address should
> > be naturally aligned with its access size. Here address alignment
> > check is added in eiointc kernel emulation.
> >
> > At the same time len must be 1/2/4/8 bytes from iocsr exit emulation
> > function kvm_emu_iocsr(), remove the default case in switch case
> > statements. =20
> Robust code doesn't depend its callers do things right, so I suggest
> keeping the default case, which means we just add the alignment check
> here.

kernel code generally relies on callers to DTRT - except for values
that come from userspace.

Otherwise you get unreadable and slow code that continuously checks
for things that can't happen.

	David

>=20
> And I think this patch should also Cc stable and add a Fixes tag.
>=20
>=20
> Huacai
>=20
> >
> > Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> > ---
> >  arch/loongarch/kvm/intc/eiointc.c | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/int=
c/eiointc.c
> > index 8b0d9376eb54..4e9d12300cc4 100644
> > --- a/arch/loongarch/kvm/intc/eiointc.c
> > +++ b/arch/loongarch/kvm/intc/eiointc.c
> > @@ -311,6 +311,12 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
> >                 return -EINVAL;
> >         }
> >
> > +       /* len must be 1/2/4/8 from function kvm_emu_iocsr() */
> > +       if (addr & (len - 1)) {
> > +               kvm_err("%s: eiointc not aligned addr %llx len %d\n", _=
_func__, addr, len);
> > +               return -EINVAL;
> > +       }
> > +
> >         vcpu->stat.eiointc_read_exits++;
> >         spin_lock_irqsave(&eiointc->lock, flags);
> >         switch (len) {
> > @@ -323,12 +329,9 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
> >         case 4:
> >                 ret =3D loongarch_eiointc_readl(vcpu, eiointc, addr, va=
l);
> >                 break;
> > -       case 8:
> > +       default:
> >                 ret =3D loongarch_eiointc_readq(vcpu, eiointc, addr, va=
l);
> >                 break;
> > -       default:
> > -               WARN_ONCE(1, "%s: Abnormal address access: addr 0x%llx,=
 size %d\n",
> > -                                               __func__, addr, len);
> >         }
> >         spin_unlock_irqrestore(&eiointc->lock, flags);
> >
> > @@ -682,6 +685,11 @@ static int kvm_eiointc_write(struct kvm_vcpu *vcpu,
> >                 return -EINVAL;
> >         }
> >
> > +       if (addr & (len - 1)) {
> > +               kvm_err("%s: eiointc not aligned addr %llx len %d\n", _=
_func__, addr, len);
> > +               return -EINVAL;
> > +       }
> > +
> >         vcpu->stat.eiointc_write_exits++;
> >         spin_lock_irqsave(&eiointc->lock, flags);
> >         switch (len) {
> > @@ -694,12 +702,9 @@ static int kvm_eiointc_write(struct kvm_vcpu *vcpu,
> >         case 4:
> >                 ret =3D loongarch_eiointc_writel(vcpu, eiointc, addr, v=
al);
> >                 break;
> > -       case 8:
> > +       default:
> >                 ret =3D loongarch_eiointc_writeq(vcpu, eiointc, addr, v=
al);
> >                 break;
> > -       default:
> > -               WARN_ONCE(1, "%s: Abnormal address access: addr 0x%llx,=
 size %d\n",
> > -                                               __func__, addr, len);
> >         }
> >         spin_unlock_irqrestore(&eiointc->lock, flags);
> >
> > --
> > 2.39.3
> > =20
>=20

