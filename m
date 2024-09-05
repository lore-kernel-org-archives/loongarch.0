Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBBE19CC2E
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540398; cv=none; b=Od4hJKHSiiLxcl/Z3GDEKObJ9OJVHHYlEoX5lDtMEjdgM8lBSi22U2WIurxnehXQvL6SbH7fxX4U3El8VXw2k7x5qyvI/HyMKe91PEhCCKk2wHFJxjLJwLnv+CeFekQfQhEx4PAZfiKGZ63KMDOEUMvE0nfwkEJa/qI3D9tlrlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540398; c=relaxed/simple;
	bh=tsy3aKztKoMdnRoNlk4OsNhbjbtbnTCAJolm+ReCOX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTnHKF59snJFsmeFLbg8cwx5Ptvu1AbMz3CP7WmSkJcUA42JQVTdAh19Oz892kbFDUmE85mH9j8Ynw2m4D0z0uKj+A/sXvdjkBQOoRhpl9FmRLRL+tYGRINvcsKXf8jBO1uilfLj1aStNrwLkxMI6Hs9ewBkPhtCv2FtPeMdrCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLNfBK/7; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLNfBK/7"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f502086419so10250681fa.3
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725540394; x=1726145194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGTp8TAmCD1hKDADwdDk6+QN7IQWNfgm+wMD3F/LVm4=;
        b=MLNfBK/7YB3h9QNq5SXQxDL+KjXPabgI4IZtsWSGLNh0fXRcmN+GFC7Pt9JKh7dqgT
         ECKARW+kVS06JYQBi5WMCP1Il8+s/krDCe4Mr+tmOnl64KveRMzPnX5UsEeRipqVLaHu
         gmsL3MhAa+gWL2jSqyUG2G+zXOXQUPQiXdIgxcPPPYhqogwWmoBi7zMTP64p3Ku9ifmT
         wdeiIvz+7H0v07hEcIqtWfytYkp9B6cj81jeX4nfSzN7E+6mS1NFxDx9diCIS3y3lJAi
         ZPnfihGBy8bYeiKqczV1vufTcZjNfHaTKNmAZ9FCAeUDt4FCoPeMPbUSZ+kUkNbsiKr7
         GHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540394; x=1726145194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGTp8TAmCD1hKDADwdDk6+QN7IQWNfgm+wMD3F/LVm4=;
        b=oan/0HYqxmhy1m0H8gYYBX7inciP9OoQ4UtqpGVIB8gkyyUmJOhX2AVfPBF/yT3lwX
         tdh/ODl4WPx9kw/YPyL6S48OE53NzOnPrPPua2the0AiZIbdGYadRVUaI8FP5LaiOTot
         1FrNtOu3LN8cyuYBSoQBwlUNqOW78B/FxWXOEVxPoBay6C61hEQ2FAllT6J2XPmH4XUf
         36E/1ejlUQmXw8JsA202fLKiBvLY/OI/qPYy23nZqeTC9kVEVhyEaUiyKkhTImp0UDM/
         Xlr4yXp8QymyXnabHat7ZR1r2GZaXVAwa1Kw3VKnEEEHYUk3DIcWd6jhtyMhxbEVw0Y8
         y/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVWcJCVaDYGCOVVuDg7xFjXbH3fsJpaXuiYrgAO4/2UYSYQZ6L5/Ohvj9s8bnHvNcnIXqmNse1LmCA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqgjZiPE3OvpXwIiN/Z2ogLo9yZ5oi81IR4Mdl/3roGfPGRjlO
	TgyUhm6xTLHEbpZsuO9C1twpO1cD9E1PDhmywNlTGoQTuYJXgxHe4FVz/rdi7Pzxq4mwDws2Zl2
	9gZCvkmeIZFb5jRi1HD/epVJJxwg=
X-Google-Smtp-Source: AGHT+IF7bvh0ZDmvjwBjc2Uwx4AItUuySYgh4nJMg336oNf7Ilf34tyu/XPYlcueqzXZVMwnqvs3UBZ6iPTAt0K06A4=
X-Received: by 2002:a2e:b8c4:0:b0:2f4:f255:4fd2 with SMTP id
 38308e7fff4ca-2f64446e111mr80799021fa.39.1725540394225; Thu, 05 Sep 2024
 05:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905065438.802898-1-ubizjak@gmail.com> <CAAhV-H7LtPja5K6ZoEbNTgjwjEL_uj-V11Y6Vq9HqTu1+2YMHw@mail.gmail.com>
 <CAFULd4Z4QzS0J_BztD7jDSNwoXM2vF9PWNX5eJBrQZsUbu-gJQ@mail.gmail.com>
 <361bf35ccf308d2fbce14f69f156cb42eef0f095.camel@xry111.site> <CAFULd4ZqD2L=B5YfKjGR4s0mOM-fABb5+83Z5KfmX0YRaxWw-A@mail.gmail.com>
In-Reply-To: <CAFULd4ZqD2L=B5YfKjGR4s0mOM-fABb5+83Z5KfmX0YRaxWw-A@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 5 Sep 2024 14:46:22 +0200
Message-ID: <CAFULd4b9pV2Rpb+X8gTsDdePtcAppmh7jDVcXBQsk39sicRbhw@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 2:16=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> On Thu, Sep 5, 2024 at 2:09=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wro=
te:
> >
> > On Thu, 2024-09-05 at 14:02 +0200, Uros Bizjak wrote:
> > > > If the input value is less than 0xff, then "& 0xff" is meaningless,=
 if
> > > > the input value is more than 0xff, this conversion still cannot giv=
e a
> > > > correct result for the caller. So I think for all sizes it is enoug=
h
> > > > to just use "((unsigned long) val)".
> > >
> > > This part is used to force unsigned extension, otherwise the compiler
> > > will use sign-extension of the possibly signed variable.
> >
> > It's not relevant.  For example when size is 2 __pcpu_op_##size("stx")
> > is expanded to stx.h, and stx.h only stores the lower 16 bits of a
> > register into MEM[r21 + ptr], the high bits are ignored anyway.
> >
> > Thus we can just have
> >
> > +#define _percpu_write(size, _pcp, _val)                               =
         \
> > +do {                                                                  =
 \
> > +       if (0) {                                                       =
 \
> > +               typeof(_pcp) pto_tmp__;                                =
 \
> > +               pto_tmp__ =3D (_val);                                  =
   \
> > +               (void)pto_tmp__;                                       =
 \
> > +       }                                                              =
 \
> > +       __asm__ __volatile__(                                          =
 \
> > +               __pcpu_op_##size("stx") "%[val], $r21, %[ptr]   \n"    =
 \
> > +               :                                                      =
 \
> > +               : [val] "r"(_val), [ptr] "r"(&(_pcp))           \
> > +               : "memory");                                           =
 \
> > +} while (0)
>
> Nice, the less code, the better. If it works for loongson target, then
> we don't need this paranoia.
>
> I just played safe and took the approach that x86 took.

Please note that the original code extended the value to a long type.
If the simplified macro works, then the usage of macros will result in
a better assembly code, where zero-extends will be omitted.

Uros.
