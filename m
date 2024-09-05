Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E964199933
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725537769; cv=none; b=l5rhTevzUBftR6+CwBPVUN4q9cg18Y4sRRp4v88AuQ6g2kNZgFbjtLQR/xNOYOHMmXPZV4LWJvIJ/I1cCZXXDXHU+BAOS6yW9AJD8Zf6cFyvT5M6I0b/NBfwpLIF7ahStvOWEKZMZtm0mo4yvzZfOPh5jn9qXPbEniUiONihiuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725537769; c=relaxed/simple;
	bh=FdZ0jvcTm6qdRghVa6/rDEbrOM7BcTY2Fkhih/+By5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LiwE13DI3y1sfu3tFGRoKKRSeKmOVWXClyqD4lD3Uv6j0G6XVFjz1behjWVVSKtVYOvD2g2Rte7xhcV3/aITQdaNPv1d+ru3c3F0v7KsdhPQY6Uj+Z8tg7em0bI6/r+BnGlMprvzQUCTPhW78czyLGVAwpbU+c5M1ECRtz/BRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWJClATM; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWJClATM"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f74e613a10so4971081fa.1
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725537766; x=1726142566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Owg9PN0820vhtvJ0PetsJXvFAPnMfxkZt3lB+CdO01o=;
        b=DWJClATM4AmOmuGdgm4AIvNztlwRZEUPMhP1Dxp2pGGi6bRd3bVhZO+dbNWTyCh6LD
         AZMXYl57pRegiS5EgkhLzsw+JjPWjxqGyfVhMAkglioVkckyAmIyijTU007ibtRTmhnS
         7t886pPdBXkl9JpcJblUjRXxjT715qrHbanBfTUpXV4BVaqe8RP8Dn6Tx9JErq/Xipws
         7ZgNgd3JFxmmh1wvUAGduOeOickCcST9ajwClGC7GuA46YB0yI9FdUTFcIElMrcKlra0
         L0pufl/Hfrbhf0d6s5tH+iF2L82xn0sqWVHQx9DXjsPc9a2ZBWXSS7wFZCxTWJv3Zcys
         UxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725537766; x=1726142566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Owg9PN0820vhtvJ0PetsJXvFAPnMfxkZt3lB+CdO01o=;
        b=XQxF49lROpwFGuSi4Tyzg3fm3KmkwM6NE/Hz0SNPsBZq6OzKOdHISRHWerjgIlB2Ui
         CaZoJhp+kg8evQJJo95OfjueN7dDdE7AffzkVtbFD2Gq1FULrhPL6RDXc21umDFz239V
         +IouPrH77CglROZ49btbI9dDDcMnWrw+PkOIfgmkaQaSx55DgEAOxKpQnolA8LIc1ULl
         yI24v+QLEtMRLvi6zXOUjBYFtrnVhJTifiptexUNpiHZIMbQXfybvHaHeVPCf9V9jrmA
         UrNOGTpvhEs86cu4mFKPoNctHJ/dV6LJjE98Du6ZaM/nkY+ODYQflzFvELyUv5k09wYT
         aDMQ==
X-Gm-Message-State: AOJu0Yw8SUQKiiPvSP0qtBg9npcbPejHKzIi9jOU7T64VM0GhWP0CDJ5
	ObhVegfC7xgudbFh3BI1r3YOzdIv8sHNbDti7KhGct8xy0/E2BZLT4yQD2kCXQRTJ5UoNn5931k
	OSYgviDNlAtY/cuP3NMgOEWzWjJinp1B6
X-Google-Smtp-Source: AGHT+IHgD4OUiyVVqxS4KDXz5elURqmJviRH2SJ6gh52cTLpIUJDTqqUL1SWQy4LxDBNIcW5+S+NVP0/ZwTjDgEFDQY=
X-Received: by 2002:a05:651c:220e:b0:2f3:e2fd:aae0 with SMTP id
 38308e7fff4ca-2f6105c4b9cmr230298991fa.6.1725537764712; Thu, 05 Sep 2024
 05:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905065438.802898-1-ubizjak@gmail.com> <CAAhV-H7LtPja5K6ZoEbNTgjwjEL_uj-V11Y6Vq9HqTu1+2YMHw@mail.gmail.com>
In-Reply-To: <CAAhV-H7LtPja5K6ZoEbNTgjwjEL_uj-V11Y6Vq9HqTu1+2YMHw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 5 Sep 2024 14:02:33 +0200
Message-ID: <CAFULd4Z4QzS0J_BztD7jDSNwoXM2vF9PWNX5eJBrQZsUbu-gJQ@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, Xi Ruoyao <xry111@xry111.site>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 1:47=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Uros,
>
> On Thu, Sep 5, 2024 at 2:54=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wr=
ote:
> >
> > _percpu_read() and _percpu_write() macros call __percpu_read()
> > and __percpu_write() static inline functions that result in a single
> > assembly instruction. Percpu infrastructure expects its leaf
> > definitions to encode the size of their percpu variable, so the patch
> > merges asm clauses from the static inline function into the
> > corresponding leaf macros.
> >
> > The secondary effect of this change is to avoid explicit __percpu
> > function arguments. Currently, __percpu macro is defined in
> > include/linux/compiler_types.h, but with proposed patch [1],
> > __percpu definition will need macros from include/asm-generic/percpu.h,
> > creating forward dependency loop.
> >
> > The proposed solution is the same as x86 architecture uses.

> > +#define _percpu_read(size, _pcp)                                      =
 \
> > +({                                                                    =
 \
> > +       unsigned long __pcp_ret;                                       =
 \
> > +                                                                      =
 \
> > +       __asm__ __volatile__(                                          =
 \
> > +               __pcpu_op_##size("ldx") "%[ret], $r21, %[ptr]   \n"    =
 \
> > +               : [ret] "=3D&r"(__pcp_ret)                             =
   \
> > +               : [ptr] "r"(&(_pcp))                                   =
 \
> > +               : "memory");                                           =
 \
> > +       (typeof(_pcp))__pcp_ret;                                       =
 \
> > +})
> > +
> > +#define __pcpu_cast_1(val)     (((unsigned long) val) & 0xff)
> If the input value is less than 0xff, then "& 0xff" is meaningless, if
> the input value is more than 0xff, this conversion still cannot give a
> correct result for the caller. So I think for all sizes it is enough
> to just use "((unsigned long) val)".

This part is used to force unsigned extension, otherwise the compiler
will use sign-extension of the possibly signed variable.

Uros.
