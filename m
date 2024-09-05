Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67075809
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548963; cv=none; b=T2HhhsFyTXTQmWpYJAU9pQNHRwJQaUu9Jtz/skuLC4nW1BT7s+JQNUJtmWYkChvNXHVLC18TmTxJANneEXyTd+VtNV8cdsnbKhxm/E6RpBC9iASjaU/32tOkabhg+UeTOhboqtGczxNwqY/vGswXT12Dfphx9tChKBCZY+MvRMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548963; c=relaxed/simple;
	bh=5At7AS88ojaHEpLfzwd+uuP1TygxmDDvrhAPPWk3d04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvYsMj8pQ/JPjTvw62AtxfLg0B0oWg2o0480PqUoiQLXZXubREUG9wmziawkwSLI19mDw9OMDeNTw5h3apHmpcao2FgM9dNxSXKvBnnSaqH8y+dE2yj3iJYoIO+RIjaFFOtE88xKV5XY8W9YxMFZtUFaETA5cXrDVF9teefo3Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INdbSe4D; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INdbSe4D"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f401c20b56so18057521fa.0
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725548960; x=1726153760; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0ecEHBuF4G0+dFN0O/ngX7lW/i8zn8XsUfg91/PKxw=;
        b=INdbSe4D3juBmTcVRQsEDOAY5m9/HBVavU0/Z3vm2FVZc7Uagnxodl5cbk8hM0h4jg
         /1OVi+nNLU3rVP6pNa5nP8VXQDC8kkpe/HO8czZnn4+O550/0Q1TRHi5G1PO3bXHTdrb
         FhlJ5tXONzyo15LQDTzEiPGU16eJ1JaxJpTPpC3DNLU8eCZ0oseQnV/HlxX0HoSosRzi
         hVPNUPa84Lcfy6P1FstttkPwM52gasXdwPS8gne+kmB85Fyqe55zx5vC1u5kNM7GL2E8
         lgGJukVgcNG2B0jr2sfTjMC0cVhZqf79giyJUGR22hBiFnNIaD6i9dXhuKsn+kVFTj5I
         uF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725548960; x=1726153760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0ecEHBuF4G0+dFN0O/ngX7lW/i8zn8XsUfg91/PKxw=;
        b=fnyDfBL3b3lSy+r0AJLqwnZIr4suFtfxY2O4adNh7/M5lmn6k6doF/XAeuFLE18ZOd
         oAqckT1wx5BTjf+sWfhYGuyYic+TNqWuH0kN6ggLA8GfA4nMP7uastthb5AFTOvVbwFl
         PZBsbgD0hcavxFwiPLl6WpQZ/aQNti4WwUL7pXzLHIFkBAvHKTbgpHIYHVAQzmuhbKCW
         b4XR5IowBJ1i3cF75ABFNnatQ2fqOSEFd59wXPYniHHBTGQe9kdb9jzhku1JnYXXk87n
         1GrZER+xLVQ2zS3lsEGxSJ8V/dSbOpnWc4TtjTRr9x0cGu1MhgoVoTfuDQ02752FVKiq
         Bchw==
X-Forwarded-Encrypted: i=1; AJvYcCWdQsxL3Mk1pKOB7hcPuYMkAsLJWbFu+Au5+fR1ZQtmYGwSBAj/Ki0xpyoIC8bnvIwiOHNH31zsjAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgRVQ+Gwkpb+8GYgGaoXMn5ZvzwCh49Pcm0xZULPCcxHg8v6a6
	BFDxQPJnBzMgQ3wYNvdVH+8g008/5n0R7ImibL8a5phMw7dOUHov7nQR0C1Xci6WShpjRAGINeE
	TTWOI/2KsigSRfcKFfVpOWUWcRSQ=
X-Google-Smtp-Source: AGHT+IESnECagBvZ42e0ZM60QicgffuZ7u2D+POegNCSLP0LNOf1FGPir6Ly6gtTXxMVUNhrP+TjXqIPSIDnhR0O9ug=
X-Received: by 2002:a2e:f09:0:b0:2f2:b5c6:ccca with SMTP id
 38308e7fff4ca-2f657d49ecfmr15631471fa.14.1725548959149; Thu, 05 Sep 2024
 08:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905065438.802898-1-ubizjak@gmail.com> <CAAhV-H7LtPja5K6ZoEbNTgjwjEL_uj-V11Y6Vq9HqTu1+2YMHw@mail.gmail.com>
 <CAFULd4Z4QzS0J_BztD7jDSNwoXM2vF9PWNX5eJBrQZsUbu-gJQ@mail.gmail.com>
 <361bf35ccf308d2fbce14f69f156cb42eef0f095.camel@xry111.site>
 <CAFULd4ZqD2L=B5YfKjGR4s0mOM-fABb5+83Z5KfmX0YRaxWw-A@mail.gmail.com>
 <CAFULd4b9pV2Rpb+X8gTsDdePtcAppmh7jDVcXBQsk39sicRbhw@mail.gmail.com> <CAAhV-H5eLXcAQ_GpEcO7rPZ2iJ7gqRxhXvGg=__p6+XcRK-gCQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5eLXcAQ_GpEcO7rPZ2iJ7gqRxhXvGg=__p6+XcRK-gCQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 5 Sep 2024 17:09:07 +0200
Message-ID: <CAFULd4bSHM9j11N8b3+V8N-pQTconan53THeme4p3UR3COCTLQ@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 5:04=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> On Thu, Sep 5, 2024 at 8:46=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wr=
ote:
> >
> > On Thu, Sep 5, 2024 at 2:16=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> =
wrote:
> > >
> > > On Thu, Sep 5, 2024 at 2:09=E2=80=AFPM Xi Ruoyao <xry111@xry111.site>=
 wrote:
> > > >
> > > > On Thu, 2024-09-05 at 14:02 +0200, Uros Bizjak wrote:
> > > > > > If the input value is less than 0xff, then "& 0xff" is meaningl=
ess, if
> > > > > > the input value is more than 0xff, this conversion still cannot=
 give a
> > > > > > correct result for the caller. So I think for all sizes it is e=
nough
> > > > > > to just use "((unsigned long) val)".
> > > > >
> > > > > This part is used to force unsigned extension, otherwise the comp=
iler
> > > > > will use sign-extension of the possibly signed variable.
> > > >
> > > > It's not relevant.  For example when size is 2 __pcpu_op_##size("st=
x")
> > > > is expanded to stx.h, and stx.h only stores the lower 16 bits of a
> > > > register into MEM[r21 + ptr], the high bits are ignored anyway.
> > > >
> > > > Thus we can just have
> > > >
> > > > +#define _percpu_write(size, _pcp, _val)                           =
             \
> > > > +do {                                                              =
     \
> > > > +       if (0) {                                                   =
     \
> > > > +               typeof(_pcp) pto_tmp__;                            =
     \
> > > > +               pto_tmp__ =3D (_val);                              =
       \
> > > > +               (void)pto_tmp__;                                   =
     \
> > > > +       }                                                          =
     \
> > > > +       __asm__ __volatile__(                                      =
     \
> > > > +               __pcpu_op_##size("stx") "%[val], $r21, %[ptr]   \n"=
     \
> > > > +               :                                                  =
     \
> > > > +               : [val] "r"(_val), [ptr] "r"(&(_pcp))           \
> > > > +               : "memory");                                       =
     \
> > > > +} while (0)
> > >
> > > Nice, the less code, the better. If it works for loongson target, the=
n
> > > we don't need this paranoia.
> > >
> > > I just played safe and took the approach that x86 took.
> >
> > Please note that the original code extended the value to a long type.
> > If the simplified macro works, then the usage of macros will result in
> > a better assembly code, where zero-extends will be omitted.
> OK, please send a simplified V4, remember to remove the if(0)
> checking, which is the same as V2, thanks.

Are you sure we want to remove type checking on _val ? I'd rather
leave the if(0) part, but remove forcing zero-extension.

Uros.
