Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845811FD0
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 07:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3156EC4339B
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678693954;
	bh=u1HEe0QQErzVRLLo+70zrC2eWQ6H6hrEzlnHCwsOV44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VSE7bQK+79I8BHsSuzEW0+CxvTznAsmb6sxmomLyOchmmZl+AdirrUzgdy4zxOb5v
	 tde/CZl8TXEv8NcaA0gzXrZM9yILllULAP/1h+RG5K1R1cF3MDSK9Idx2SAg33SjvG
	 Npr08szVFezCyu+kgaOZj+AePx6DIldVijB6lC2/ml/A/t7YFnPV8CyYgRWJPaMy4F
	 JF0AJFeLdjH5YbHKlKOBbrVvIRSlhpATUewmIi5WDS3mZ2nMK/hKKmJJeWyqwR/EBR
	 DwWixlxOIZj+uGjPPUoqCshdScUmxPNbzej+dFg7zxIkREskKLmYKzbDXefyoAtZou
	 oTxDzIxP3tcaQ==
Received: by mail-ed1-f49.google.com with SMTP id k10so44788543edk.13
        for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 00:52:34 -0700 (PDT)
X-Gm-Message-State: AO0yUKU3Ga8j7TRllLRfTCxQR+RfnxCzjJVv2cQRnbtjMnSTFJnZDStN
	TaZjOCzNQWri59DYDGfUDlKhOQbKNO4unpUa/u8=
X-Google-Smtp-Source: AK7set9mutBWlOqLzfxMj5mhtc4t+GjjjaEUxOrmKyox1IyoDSQxEMSLY9yzVySTeeMcKpYiJCdzVFCFH5ZCsixqnPw=
X-Received: by 2002:a50:9f0b:0:b0:4fb:f19:883 with SMTP id b11-20020a509f0b000000b004fb0f190883mr2522311edf.1.1678693952469;
 Mon, 13 Mar 2023 00:52:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224033017.15653-1-lienze@kylinos.cn> <35f61f336d390c0117270fc4b5a0f842dd459083.camel@kylinos.cn>
In-Reply-To: <35f61f336d390c0117270fc4b5a0f842dd459083.camel@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 13 Mar 2023 15:52:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5nFj8U_cp3o0Q41OhFZN+K809A=TbGbw0c=CpQnBCa0g@mail.gmail.com>
Message-ID: <CAAhV-H5nFj8U_cp3o0Q41OhFZN+K809A=TbGbw0c=CpQnBCa0g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: use EXCCODE_INT_START instead of hard coded value
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, enze.li@gmx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Though EXCCODE_INT_START is 64, its meaning is not suitable in this case.

Huacai

On Mon, Mar 13, 2023 at 12:42=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>
> Hi Huacai,
>
> Kindly PING for this tiny patch. :)
>
> Thanks,
> Enze
>
> On Fri, 2023-02-24 at 11:30 +0800, Enze Li wrote:
> > The for loop in per_cpu_trap_init function use a hard coded length
> > while
> > setting default exception handler.  Use the proper define instead of
> > hard coded value.
> >
> > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > ---
> >  arch/loongarch/kernel/traps.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/kernel/traps.c
> > b/arch/loongarch/kernel/traps.c
> > index de8ebe20b666..7d5784eccf19 100644
> > --- a/arch/loongarch/kernel/traps.c
> > +++ b/arch/loongarch/kernel/traps.c
> > @@ -755,7 +755,7 @@ void per_cpu_trap_init(int cpu)
> >
> >       /* Initialise exception handlers */
> >       if (cpu =3D=3D 0)
> > -             for (i =3D 0; i < 64; i++)
> > +             for (i =3D 0; i < EXCCODE_INT_START; i++)
> >                       set_handler(i * VECSIZE, handle_reserved,
> > VECSIZE);
> >
> >       tlb_init(cpu);
> >
> > base-commit: 804f6d04b1adae9602edbd6410c0ba3a556964fe
>
