Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735A32D248D
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765269009; cv=none; b=MLTKmefdX+cnbslzm5RE+LPvMf17W+misG1phqTdJcfCNBodZSvKsi+m6+VQwRmEk1SX9NDS/nKAYQBnRLVvRFOOkFn5vRsSAS9f/IcT19sw9SnrBxiAkCKEaf7XeK07vnHGxX+UFD+LBfEDl8Zd4k2hEG/YylyJmn6mvzSzRd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765269009; c=relaxed/simple;
	bh=JWWO5Kfi2AYy6NIxKtUOfJuvBQDcbwm75fD21tb4Ht4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jp+qOqHMhEXwgg7MPD6KiEGNwLwMtyrxtPXrVi4OclZfVSzjxNQd+sJ47vpGlEm6F8njfDLEAx5jvB5eiJYZv6lY7yD4+iL9ivMNR19su5PYvdgF+TpkgZKZtq0v0/hnw4Vj6hGHgOrNEuP7BYEUbif0jhyXFc7xzNuxb8YUM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXHLis3H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXHLis3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FF4C4CEF5
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765269009;
	bh=JWWO5Kfi2AYy6NIxKtUOfJuvBQDcbwm75fD21tb4Ht4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SXHLis3HLC6PA1n9YxGTQax72hW7YWM9x2yh4QdqMk9YtScyEQujVYSXs8ZXdHiAC
	 w2tUm3S+v7Dvp0TjzlD2d8n4aDuziNVlyDaXDDX/eoxm8rVGEJ+15IItEFaAYmHyqz
	 7ntdsl84mt0l1GfnARcWyBx4gr6Z8d5If8QJP367u7aOhV7hWx8dpc/+DSZgov5Sx2
	 3kU9Jtj5UKs/nLHf2DsuH+dq+cXFLPV74/JjahNRN6nrOV6TG4Dg4yuK713x0l5bvh
	 ZeNa2TQvq8gZuXSTDhrb6G+ZLdzdxxP7PjEIDZp8vL4tThpYLG4AU5bvvjgx84IG8v
	 8/fB8Ff47x0oQ==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6495e5265c9so494354a12.0
        for <loongarch@lists.linux.dev>; Tue, 09 Dec 2025 00:30:08 -0800 (PST)
X-Gm-Message-State: AOJu0YyqQj4ejEO2KcjkcEESUEYpPz0/R4XZEUzHc2gyfw2uJBXECgy9
	N3fQ+V74mDylQXOYyUzvjFXY1QcmDVw3q93Exihpc9m3ZIsEGgI3pex/iJVIYGVHxBIwrlYYRlO
	fvb9X67acfeVpqmUj0BAE7xl0dYcsMvw=
X-Google-Smtp-Source: AGHT+IEQi4eiBBwM1gFfbhNOroigtkoQAazp8Ax0lhxUMv8UrKmiZhovhwPXZh+4PZ0scS1vvAGB8WdpS9uOWpcmnmQ=
X-Received: by 2002:a05:6402:34cf:b0:640:36d9:54fe with SMTP id
 4fb4d7f45d1cf-6491adfd928mr7616313a12.24.1765269007590; Tue, 09 Dec 2025
 00:30:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209061809.15994-1-yangtiezhu@loongson.cn>
In-Reply-To: <20251209061809.15994-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Dec 2025 16:30:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6zjWXjjuoOkRov4886E82QRH=3NnkhP2e4hroSJr1UXg@mail.gmail.com>
X-Gm-Features: AQt7F2ruS5P_cNJ0krP9R-KUwApYqmwrYmEOcYS_bCic5sLlKmcvAc_OTkhdJoo
Message-ID: <CAAhV-H6zjWXjjuoOkRov4886E82QRH=3NnkhP2e4hroSJr1UXg@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Remove unnecessary checks in bt_address()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Tue, Dec 9, 2025 at 2:18=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
> According to the following function definitions, __kernel_text_address()
> already checks __module_text_address(), so it should remove the check of
> __module_text_address() in bt_address() at least.
>
> int __kernel_text_address(unsigned long addr)
> {
>         if (kernel_text_address(addr))
>                 return 1;
>         ...
>         return 0;
> }
>
> int kernel_text_address(unsigned long addr)
> {
>         bool no_rcu;
>         int ret =3D 1;
>         ...
>         if (is_module_text_address(addr))
>                 goto out;
>         ...
>         return ret;
> }
>
> bool is_module_text_address(unsigned long addr)
> {
>         guard(rcu)();
>         return __module_text_address(addr) !=3D NULL;
> }
>
> Furthermore, since it returns ra at the end of bt_address() and check it
> with __kernel_text_address() after calling bt_address(), so it can remove
> the check of __kernel_text_address() in bt_address() too.
>
> Just remove unnecessary checks, no functional changes intended.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/unwind_orc.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index 0d5fa64a2225..3919dbd04c21 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -360,12 +360,6 @@ static inline unsigned long bt_address(unsigned long=
 ra)
>  {
>         extern unsigned long eentry;
>
> -       if (__kernel_text_address(ra))
> -               return ra;
> -
> -       if (__module_text_address(ra))
> -               return ra;
I think the correct way is to remove the __module_text_address()
condition but keep the __kernel_text_address() condition. Then return
0 at the end of this function, and remove the __kernel_text_address()
condition out of this function.


Huacai

> -
>         if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
>                 unsigned long func;
>                 unsigned long type =3D (ra - eentry) / VECSIZE;
> --
> 2.42.0
>
