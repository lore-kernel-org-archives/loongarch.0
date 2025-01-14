Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B2D236A85
	for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 12:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736859201; cv=none; b=TadaZj3leSmUqUZWSgsFCc/IXpzEhKZbmw6UzfdJLRLiO4AAAXeqoE3qVIYjuEh4eBAA3HvqMPGSvJQtRkl3+9HmIawiTMMSDJpMry6HR+XE6LD7LGLWq4VKPM4oY2neNWUHSrUUWSxEcbGYWpPhYnv3a5ysDUW5Z33accH6+lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736859201; c=relaxed/simple;
	bh=c4/hILBrFjjcIwY2WJ+4Y19FRIoTpjKzIsfIQB+t6GA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6iMSQPSkZb7OrTih4CYtV++jhVJi5tQ6oVx8VDR4ZtuRuvhnZc1p+38dK9o8Q+Ls16bQx88JV83gaICzHqWpMfMTJ4yE0/xm9yWBUSgskwvqS7+d+Cv1rqw4BIdpKCVkfDnBsLqtXSNeQEqjaLjX9nW0ILLb3zNtgPrULho4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1gTaFrD; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1gTaFrD"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so7691180a12.2
        for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 04:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736859195; x=1737463995; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58YRhhAWOxecN/NnS0PaSbopKQHlTjf7bl863HnP150=;
        b=b1gTaFrDBN5JcoG9S9+brWr1iZ2BoFGUVEWQShQcp4LnRVJiOq2MWrPSoGN9cfGPXD
         A/0NQVoKOJzScfQq7QbsItA0QieLP40rKf0K8lV+xTdQDGcIQuh/MyuUTyvy5aTgxtL7
         BYUeTAtL4B8CHb0Cfa/RTFmPtTJZHP3/ZCoMgR1oqEiTqVwBVzpXPNqlre889vXQ2O5l
         nyEA8GdHBU6lYziSJg2cNH64+3fuh3L0E93KsKPn9EK2+Fy7MXfIuKN2arKjh0RceAdG
         I2FJ9jchwmIUePJ3g9qNkA3t3ePnJNXxsCH50pbrm4bhL3IBD0DhngQvevhnzvF5jHYt
         M+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736859195; x=1737463995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58YRhhAWOxecN/NnS0PaSbopKQHlTjf7bl863HnP150=;
        b=M/Vyn3+7463q3etBQufcDWu758/ZYUIJwrId7Vn9PDLEAbOqCFBobzEGzFG6sV4pE7
         /JdzWS/lYr9dtg6j0QVIBpUlSlpZ8Dv9yx8BTQgjv6Hm1Bhv/DdExvR9PHFzBvSP1lkk
         iBBdteUsOHS50zGEcuKjglKyzW7jM9q1OF7BZszZdI7nZroQUyDiO2byixeZZUSHp7rV
         zbC5/424WAGYeYTsCy9SFRS2kOpxOmecUlb3/zK6T1QX2/PhJT+UKvIsVngCTlBmZmqN
         R7XMXHejeBpKX5D3znDUh/nPiJVHi6Jdd1RsfUYRK17Fc6BCXR7Wn6NZQpXNz9Oz2+Wl
         76HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXs3cvm5QloCcyLanK5un+uCHMbZafEQ52I+/6eiPduOyW5UP48/ejQeRQPqx2DzHqQAUmef9rAzc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNBRdMfTWMJuYatizvVTArYORKetBx0D2E4R/u0o/kYadVCpWz
	KWEvw++F6qPniikdGJCXSo6OqQMo5x5cgbdr+8gpTr/YvYIg41VAkranRHA/pRriGV8GBI2D4A3
	VUl5Sm6KItTf15C9w87KYJwU1SDs=
X-Gm-Gg: ASbGncuBI1Ehg718Vcx25xVgzts39FnWIXt1T2wTLKZm4AqOiEh96GBXRNPkX2cTBNq
	ww81RktLWQSiG239i39MOEA2GAbeP04PaG6PJ
X-Google-Smtp-Source: AGHT+IFAeT9rGs81+ma7oWrKwp7nETfmX0fYNUxmNBFROFMZRbXo6MVJ9ClUknjW12+94gVEobaY+33Njkg+dB2ZDoE=
X-Received: by 2002:a05:6402:530f:b0:5d1:2377:5af3 with SMTP id
 4fb4d7f45d1cf-5d972e00027mr56882740a12.5.1736859194633; Tue, 14 Jan 2025
 04:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250109113004.2473331-1-zhoubinbin@loongson.cn> <ba25dfc40e9ae91205d61c838e368490.sboyd@kernel.org>
In-Reply-To: <ba25dfc40e9ae91205d61c838e368490.sboyd@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 14 Jan 2025 20:53:02 +0800
X-Gm-Features: AbW1kva3LJGk4s8ei_nQCIk6VVREFoQwacKX90JhAswxvfIX_CoApACaTyLPiaE
Message-ID: <CAMpQs4JixuJOQyK1wXBX+Y_j27Cng0wBiX3NBpHmD_7byUtzmA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: clk-loongson2: Fix the number count of clk provider
To: Stephen Boyd <sboyd@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-clk@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, stable@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 2:50=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Binbin Zhou (2025-01-09 03:30:04)
> > diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
> > index 6bf51d5a49a1..9c240a2308f5 100644
> > --- a/drivers/clk/clk-loongson2.c
> > +++ b/drivers/clk/clk-loongson2.c
> > @@ -294,7 +294,7 @@ static int loongson2_clk_probe(struct platform_devi=
ce *pdev)
> >                 return -EINVAL;
> >
> >         for (p =3D data; p->name; p++)
> > -               clks_num++;
> > +               clks_num =3D max(clks_num, p->id + 1);
> >
> >         clp =3D devm_kzalloc(dev, struct_size(clp, clk_data.hws, clks_n=
um),
> >                            GFP_KERNEL);
> > @@ -309,6 +309,9 @@ static int loongson2_clk_probe(struct platform_devi=
ce *pdev)
> >         clp->clk_data.num =3D clks_num;
> >         clp->dev =3D dev;
> >
> > +       /* Avoid returning NULL for unused id */
> > +       memset_p((void **)&clp->clk_data.hws, ERR_PTR(-ENOENT), clks_nu=
m);
>
> This looks wrong. It's already an array of pointers, i.e. the type is
> 'struct clk_hw *[]' or 'struct clk_hw **' so we shouldn't need to take
> the address of it. Should it be
>
>         memset_p((void **)clkp->clk_data.hws, ERR_PTR(-ENOENT), clks_num)=
;

I'm very sorry, it was a cheap clerical error and I'll fix it right away.
>
> ? It's unfortunate that we have to cast here, but I guess this is the
> best way we can indicate that the type should be an array of pointers.

--=20
Thanks.
Binbin
