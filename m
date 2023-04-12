Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099BF2F24
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 09:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76EDC433EF
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681290626;
	bh=hyVbbzJyEG6USpdJG12mUbsOeh8q8qaFJiQZtjNKzPE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sJsQXGLJYAqAcrE45jIdzjsNfOghmuxBAoK3mVtcla5KrNHw4GwqiUUcRGdrgAHrx
	 GX1deZR6YzNezExixR8c7ZKCd7X4tpy3fExvVoIBt49bi0n+/L/jP7Kw333bIZ28wL
	 zD7UWE8jYsf3RPnKRhFyqfFZXFo531ZbIZm+OO7yZejcdIWox6yROrN6M8+HTZz/Rw
	 rqhLXpJ4evLxUcMM1+o9pbZdaoLmsxGfzpGbRcsuzpj1bfYYDDK+nWLYrazAdXovss
	 qoE+MaqK/WsWjIEMCUqiqJyqkM9IgNJBEgcVnwrw+jwoLdmEDJUaVr2tOKOog2fs4k
	 rWhPZXWuzZyrQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-502739add9dso5280385a12.0
        for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 02:10:26 -0700 (PDT)
X-Gm-Message-State: AAQBX9cypWyunOGMFqQXm0Gd97A3SCnHC6YRNBMJCwfILY7s5O6yTDVX
	wwSLejgir96VMVz9CXgiR/SPon77A33J+C30vdo=
X-Google-Smtp-Source: AKy350YtE7qf6eFxjV4mb3hxQYtsrdDcDFBk0PBoNnwZkYGGsuSNaEiIh9pzT7h43liB7JjWhTTLw+Twt6FSz3viOZk=
X-Received: by 2002:a50:f693:0:b0:504:9200:8c88 with SMTP id
 d19-20020a50f693000000b0050492008c88mr851500edn.1.1681290624953; Wed, 12 Apr
 2023 02:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230412025525.116668-1-lienze@kylinos.cn> <d5f906aa-2fcd-90c0-09dc-df1d8f0cd643@xen0n.name>
In-Reply-To: <d5f906aa-2fcd-90c0-09dc-df1d8f0cd643@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 12 Apr 2023 17:10:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4dfqa6TmUa=UTjEWd091Tj_CQKBgXoAVOMpPeTCs7q+g@mail.gmail.com>
Message-ID: <CAAhV-H4dfqa6TmUa=UTjEWd091Tj_CQKBgXoAVOMpPeTCs7q+g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Use VALEN instead of hard code in comments
To: WANG Xuerui <kernel@xen0n.name>
Cc: Enze Li <lienze@kylinos.cn>, loongarch@lists.linux.dev, enze.li@gmx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Wed, Apr 12, 2023 at 5:08=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 2023/4/12 10:55, Enze Li wrote:
> > Refer to the online documentation[1] for Loongson, use the accurate
> > VALEN in comments to avoid misleading others.
>
> Reworded some Chinglish for you:
>
> Subject: LoongArch: Replace hard-coded values in comments with VALEN
>
> According to LoongArch documentation [1], CSR.PGDL and CSR.PGDH are
> concerned with the VA's MSB which is VALEN-1 instead of always being 47.
> Fix comments to avoid misleading others.
>
> >
> > [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-E=
N.html#page-global-directory-base-address-for-lower-half-address-space
>
> Nit: add a colon after [1]. (i.e. "[1]: xxxxx")
>
> >
> > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > ---
> >   arch/loongarch/include/asm/loongarch.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/in=
clude/asm/loongarch.h
> > index 65b7dcdea16d..a182a1579148 100644
> > --- a/arch/loongarch/include/asm/loongarch.h
> > +++ b/arch/loongarch/include/asm/loongarch.h
> > @@ -423,9 +423,9 @@ static __always_inline void iocsr_write64(u64 val, =
u32 reg)
> >   #define  CSR_ASID_ASID_WIDTH                10
> >   #define  CSR_ASID_ASID                      (_ULCAST_(0x3ff) << CSR_A=
SID_ASID_SHIFT)
> >
> > -#define LOONGARCH_CSR_PGDL           0x19    /* Page table base addres=
s when VA[47] =3D 0 */
> > +#define LOONGARCH_CSR_PGDL           0x19    /* Page table base addres=
s when VA[VALEN-1] =3D 0 */
> >
> > -#define LOONGARCH_CSR_PGDH           0x1a    /* Page table base addres=
s when VA[47] =3D 1 */
> > +#define LOONGARCH_CSR_PGDH           0x1a    /* Page table base addres=
s when VA[VALEN-1] =3D 1 */
> >
> >   #define LOONGARCH_CSR_PGD           0x1b    /* Page table base */
> >
> >
> > base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece
>
> Change itself is trivial enough, thanks!
>
> With the nits addressed: (Huacai may apply the suggestion while applying
> to loongarch-next, so you won't have to resend v2)
>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
