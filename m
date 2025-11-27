Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B432E759
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247393; cv=none; b=CCTnVpb6oU/GPGDsny+WLaZiYXqmFNlCbHa2wDWDyszYg/Po6uSh6jwhqGt/vh6I8mHx06q+3mvPkwC9xC2qVfdZoVeEO7MgwcBmTyv9cHHDhqGdqXH0UdTq1+jhBJUkprIuicb++cwMqgaE0Zq5znBFf4QNMGQoADj3x0nF1Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247393; c=relaxed/simple;
	bh=fliHvQSlpA6hLG0hN/KAiqLH/+4phHi2bjnFx+2/PZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCwlo7+ucgZywDphYtM7h8esuiYoEn95+9eOE82v5HK2cEEsYqWwTf0sQR2rBLmnTPEnOuTmJ4DRRsdqmzozpWqRT6UIcUxD14xlx0h0bm1oGJTpkCc0JbJSscDpsvgnvNkgjrl2AL3EjOXK3C6MwNPJ9unnKiUXLeyLA99b+og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4NRO8pJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4NRO8pJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9286C4CEFB
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764247392;
	bh=fliHvQSlpA6hLG0hN/KAiqLH/+4phHi2bjnFx+2/PZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T4NRO8pJcuh9gad6vNizCplhq5TiwRhBIbBs84PKorLbZiOk7sWHwlbAdk9P4wlVl
	 v2aZdMk1+nPgYRPx7h9JZ2bcMdW+rKJgxJvEdXBF/t8dvdvqV1fVwW+B0KTcLT+nG8
	 yU2RPclGXStn3pC5ZvlfDGZjvRKKc/pit2TuVMaEvYJuWzU6rWTEmGKZK5bMHKSVqb
	 jysXliUjVXoe6yd0wLlWOZC41TA75LwvS6WVZl66cGWiNralfesihR17mFQJbSWb7v
	 99sc/eBYunSS7oLbMoTFgJt+lX6WpXN6Gu77EsKxTiFTZ88icVO6vU5rB5pV9iabfc
	 vJRUAsUeCtcEA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b73161849e1so179254066b.2
        for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 04:43:12 -0800 (PST)
X-Gm-Message-State: AOJu0Yyu+mb5rdfrspq3OEQlsY6qMiMEHz/M1ey0Rh0B5GWF4+htXr21
	amQjuBnf+KJT0z+UFiLczbxJ8KatzcPTiGinUGgj6PBgm220+ylN6mDrX+hvqgMjK7fI1LRAmJ9
	nPakyojREJY07IeC5HSRSAWusFuK3EJ8=
X-Google-Smtp-Source: AGHT+IGp3Hm6QbB3hl8MFsXb3rztK+7A031qllKdyY0aPx6mCfzEl9VXfusjGI88j1scEx57qz8zj9hAYCvZtPIXhDc=
X-Received: by 2002:a17:906:17cd:b0:b76:84d1:5dc9 with SMTP id
 a640c23a62f3a-b7684d1609cmr1604850766b.45.1764247391312; Thu, 27 Nov 2025
 04:43:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251125063507.32177-1-yangtiezhu@loongson.cn>
In-Reply-To: <20251125063507.32177-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 20:43:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4vqDGj7SMRhzKXtBL3sja_+0c5DzY8LjHS6sqvryEQWg@mail.gmail.com>
X-Gm-Features: AWmQ_bka7KEU2oZ0YdO9VYf12eCTgncenAjfN-YqYyah0zVJXeF4kV8AdHFaLOU
Message-ID: <CAAhV-H4vqDGj7SMRhzKXtBL3sja_+0c5DzY8LjHS6sqvryEQWg@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Use unsigned long for _end and _text
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Nov 25, 2025 at 2:35=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> It is better to use unsigned long rather than long for _end and _text
> to calculate the kernel length.
>
> Cc: stable@vger.kernel.org # v6.3+
> Fixes: e5f02b51fa0c ("LoongArch: Add support for kernel address space lay=
out randomization (KASLR)")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/relocate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/rel=
ocate.c
> index b5e2312a2fca..76abbb8d2931 100644
> --- a/arch/loongarch/kernel/relocate.c
> +++ b/arch/loongarch/kernel/relocate.c
> @@ -183,7 +183,7 @@ static inline void __init *determine_relocation_addre=
ss(void)
>         if (kaslr_disabled())
>                 return destination;
>
> -       kernel_length =3D (long)_end - (long)_text;
> +       kernel_length =3D (unsigned long)_end - (unsigned long)_text;
>
>         random_offset =3D get_random_boot() << 16;
>         random_offset &=3D (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1);
> @@ -232,7 +232,7 @@ unsigned long __init relocate_kernel(void)
>         early_memunmap(cmdline, COMMAND_LINE_SIZE);
>
>         if (random_offset) {
> -               kernel_length =3D (long)(_end) - (long)(_text);
> +               kernel_length =3D (unsigned long)(_end) - (unsigned long)=
(_text);
>
>                 /* Copy the kernel to it's new location */
>                 memcpy(location_new, _text, kernel_length);
> --
> 2.42.0
>
>
