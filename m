Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F6A367B90
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784259209; cv=none; b=KwFAhM+45Gc+B+DL/IRKlOvfo0TpWfuQAdaFioq6mmbJ9gGXnGL+wGpzIQUlElaC0URKiTuKfQ+emEGycGTjkHXDXIf8H1CcKc6BkC7PgOUwG5WIcWmXVR5weJZkz2hcy9NbZaFC3gUVuYBbD1vGCzDRD0Em5arLcdaZeUZkeog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784259209; c=relaxed/simple;
	bh=fRDWC3Hc+XEUebBylZAOw0u/iRsn4rqaU/q/RJMqsGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=th3k/GiheSoxCRSFIlhE3HlVewffKEPOLn0JcKrf24AOkxCZWb4RMxJX7dzgqFosr5dVThic+lmqhc5aIgn8+C+MMHevOqzyihnYvqHVTSMMGB1/2VdJ1TXM5ohSc+bIZBIE793lNxY2l2cn0NlTW+DMqd8DsMt2khb71yDNlwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs0ID5ES; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs0ID5ES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D921F000E9
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 03:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784259208;
	bh=uw6HonlBa/V9swRBxulEiHRoC+FSg7o2dOlYUFKGjcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gs0ID5ESv1we/DCuIBP2i2yY10c5nxkD2rvpWvuVNrfHNA+U2J0jHlH0PyKDHZ/qb
	 IXcO2/mxqo2xKVDGkyie+3GcQxVCz6mvNwZq7ByjUXA6rnWWOi2w4M2tuxwQdPcJC7
	 dF5pComhGK5WRrYD8T81KxnEtzICbEXFS26HqHSVJe/DYZLnAXxIiDiBOnr4x8yPAi
	 EzS22kh+LYAJkuX23/7UZkibqnN06l8RfYqwmAjdh9y7G6pbj6RyqDGD/0dQY4GQFN
	 v9levCMmDahyb0IssUPhISUa0TsSWYB9sbxRKbuM1Hi+FI38Zj+etTS+f1hdqmJPOz
	 4+vzMhy37ZVLQ==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so4220171a12.1
        for <loongarch@lists.linux.dev>; Thu, 16 Jul 2026 20:33:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqwGXrUvNGaQBJ1nS8hT1mRXDWBwJXur9A1CEfJ/arLhlBXvctrvQC8Q46eO95WwW7KoJKMhX97in0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXRR6RrnTht2fPwn7uhhmOsjLoLdY5+nsfH1e0JtAUWbpUagew
	x41vxmbPJX77+pENC4QjKHZLDGF+Fw6wEDNyQZn7hNgnLR4tRe28NhkJreL90gh2+6QpSxYdKer
	PFWQyRk7AYDyhfGeXaMt+tZazqZ998MA=
X-Received: by 2002:a05:6402:44db:b0:69c:30dd:deec with SMTP id
 4fb4d7f45d1cf-69e6528acf6mr146101a12.17.1784259207067; Thu, 16 Jul 2026
 20:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717023712.1989650-1-husong@kylinos.cn>
In-Reply-To: <20260717023712.1989650-1-husong@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 17 Jul 2026 11:33:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5sgnvth4_uKSrz0U+0gPOWMT7E5YODyNVVzHq_Y+cgmw@mail.gmail.com>
X-Gm-Features: AUfX_mww3Mt4EWMeIrU4O0nCo90ev5WJ0RyWn4Vr0U1wHryL9jqbAUwk0aYwRKw
Message-ID: <CAAhV-H5sgnvth4_uKSrz0U+0gPOWMT7E5YODyNVVzHq_Y+cgmw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: warn when per-CPU TLB vector allocation fails
To: Song Hu <husong@kylinos.cn>
Cc: kernel@xen0n.name, yangtiezhu@loongson.cn, jiaxun.yang@flygoat.com, 
	arnd@arndb.de, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Song,

On Fri, Jul 17, 2026 at 10:38=E2=80=AFAM Song Hu <husong@kylinos.cn> wrote:
>
> On a secondary CPU, setup_tlb_handler() allocates a NUMA-local page
> for the per-CPU TLB exception vectors and silently returns if the
> allocation fails.  The CPU keeps running on the shared vectors that
> configure_exception_vector() installed earlier in per_cpu_trap_init(),
> losing NUMA locality with nothing logged.  Warn so the fallback is
> observable.
>
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  arch/loongarch/mm/tlb.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
> index aaf7d685cc2a..e5220653279c 100644
> --- a/arch/loongarch/mm/tlb.c
> +++ b/arch/loongarch/mm/tlb.c
> @@ -297,8 +297,11 @@ static void setup_tlb_handler(int cpu)
>                         return;
>
>                 page =3D alloc_pages_node(cpu_to_node(cpu), GFP_ATOMIC, g=
et_order(vec_sz));
> -               if (!page)
> +               if (!page) {
> +                       pr_warn("CPU%d: TLB vector allocation failed; "
> +                               "using shared vectors\n", cpu);
>                         return;
> +               }
A warning usually make users nervous, this failure completely doesn't
hurt anything, why you want to shout loudly here?

Huacai

>
>                 addr =3D page_address(page);
>                 pcpu_handlers[cpu] =3D (unsigned long)addr;
> --
> 2.43.0
>
