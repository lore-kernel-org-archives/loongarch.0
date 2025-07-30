Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BDE287508
	for <loongarch@lists.linux.dev>; Wed, 30 Jul 2025 07:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753860340; cv=none; b=OEV4yieWzEoj5PCVCPz11Am7ILQPsSI2zXtBwNmVUu0vVhMqWC+JYvC5qmmY749VxdnuEJp28ouWUq3elnOHZz4JwmBtHnUgJPx19Fo6C0/nBU3h+EnyVobiH93WFhIejUaaDTLiMTKQ0yVU3B0OQ6AsBbabnuXtmfj9dxmJx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753860340; c=relaxed/simple;
	bh=Y9XFarX5wXXNKvJxA/fXi0azVyJUgSnXVji4kBRB5cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldwmxNNLc9AKJ5Oa07f+rSuuifhfMWkqnLidWWr5wjVMLbuEgJsOW97QyY4GOy5MtgBkJFjbxk+7GvRFhbTTvtOKm/iahOuxrmsx8DfENYKUbH3wc9Bg1vaiSXR4wJZhHXtt8pqRJ6OyzCnC0kI2RYfOxVWwW9QpAHsPxqvPjlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELLXMByr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELLXMByr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B79EC4CEF8
	for <loongarch@lists.linux.dev>; Wed, 30 Jul 2025 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753860340;
	bh=Y9XFarX5wXXNKvJxA/fXi0azVyJUgSnXVji4kBRB5cY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ELLXMByr4YAahWcnGSP/EQnA4R7r0vPw43xvouZpqmOezpZPXGHFBKXzqq/TiY2I7
	 RsZNO1pJPp24JOJgb7JIX/HdxUtc2KDJetSOoKhG0DA5ef1LiLKr1VaI7zQ3RoJPae
	 f6+QtWTETlB9RGLpaIwyh4D83VoLtkTBKt5yx0/ivwjmV8oOdNeIIO2ixxv5Ii12AD
	 4fcmZMYU2KAAZOa6S1e+s+YND4YvAK3XVJLCk+Voc3dsKWEdzIz7nPyJ+4zRVOIihy
	 uBWA7xW+RV12xBgDXpwtLkrGzU8uF9vwuP9mEeXDJvpK7faOdm2ymmGk/ry+Paf8TO
	 7wYLGw2KBYeTA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1072117566b.1
        for <loongarch@lists.linux.dev>; Wed, 30 Jul 2025 00:25:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8FWTXh7Jfi40TizVLQcAZo7uQzxG+0YbdX7R1e3PSiJIyF0vilyeCZHKcJFApZvOTqarf2ROu+jE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyFp/A8X9kZt5QqM1qv3T9W1MAhk8Zs0b4IC45iB/h1WYVjwfA
	gALO0Hzg3JKkol9i1Bt3gYqzLtc84h5KQ04LYIE5C0ul6bpIC/ihD2JFxVNdg5A32CsSISr0t/M
	dSgHobdUP9rm4uOxGLsDomZZnzvv8nWE=
X-Google-Smtp-Source: AGHT+IHfx8mKPIPw4DGi+8OUuv0oDgiPhPEzstduqNiwAErqxgRZHzgOO+heKkKMFkDBKwiWlU26BO4/PB4WCy6+M/I=
X-Received: by 2002:a17:907:7e9c:b0:adf:f8f4:2001 with SMTP id
 a640c23a62f3a-af8fda2a3bfmr257723566b.49.1753860338770; Wed, 30 Jul 2025
 00:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250725132651.1974717-1-guanwentao@uniontech.com> <fd349fb6-be25-440e-932e-b15b6daedeee@linux.dev>
In-Reply-To: <fd349fb6-be25-440e-932e-b15b6daedeee@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 30 Jul 2025 15:25:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5hbNS7_8v2zBjmOA+_M_My-7S3aN94S7QnvQq1adB5gA@mail.gmail.com>
X-Gm-Features: Ac12FXxAaXf0R9-BiE4dd9fMPQqf6n0QDcrY1yJ3z7UeSm5VQF8ZhoAYRGakRBQ
Message-ID: <CAAhV-H5hbNS7_8v2zBjmOA+_M_My-7S3aN94S7QnvQq1adB5gA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: vDSO: remove -nostdlib complier flag
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Wentao Guan <guanwentao@uniontech.com>, kernel@xen0n.name, xry111@xry111.site, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	wangyuli@uniontech.com, zhanjun@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 9:54=E2=80=AFAM Yanteng Si <si.yanteng@linux.dev> w=
rote:
>
> =E5=9C=A8 7/25/25 9:26 PM, Wentao Guan =E5=86=99=E9=81=93:
> > It is clear to remove the -nostdlib for ld, it is similar to commit
> > bdbf2038fbf4 ("MIPS: VDSO: remove -nostdlib compiler flag").
> >
> > Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> Since MIPS has removed this, we should remove it too. In fact, other arch=
itectures also use $(LD).
>
>        fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to li=
nk VDSO")
>        691efbedc60d ("arm64: vdso: use $(LD) instead of $(CC) to link VDS=
O")
>        2ff906994b6c ("MIPS: VDSO: Use $(LD) instead of $(CC) to link VDSO=
")
>        2b2a25845d53 ("s390/vdso: Use $(LD) instead of $(CC) to link vDSO"=
)
>
> If Huacai is willing to apply this patch, I suggest supplementing the com=
mit message.
It is better to send V2.

Huacai

>
>
> Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
>
> Thanks,
> Yanteng
> > ---
> >   arch/loongarch/vdso/Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefil=
e
> > index ccd2c5e135c6..d8316f993482 100644
> > --- a/arch/loongarch/vdso/Makefile
> > +++ b/arch/loongarch/vdso/Makefile
> > @@ -36,7 +36,7 @@ endif
> >
> >   # VDSO linker flags.
> >   ldflags-y :=3D -Bsymbolic --no-undefined -soname=3Dlinux-vdso.so.1 \
> > -     $(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared --build-id -T
> > +     $(filter -E%,$(KBUILD_CFLAGS)) -shared --build-id -T
> >
> >   #
> >   # Shared build commands.
>
