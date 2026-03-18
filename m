Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126423A7F6C
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842440; cv=none; b=hWgpsjiOi/7WDBtSCqpP7JoYWlSJMHgrZGr+qT4gofFLRxCqkfbbyDv2zg+q0V4bZUMhDa0kio99I0CxAsKR+s/qvXkHIxXSCOkUq3zd6ezD5S2+Xo5TOm+4fsjZm38Xm1e3A6X7nIkHvw44MWYQ38/Qw5k7PhjsYAaNHjZ8+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842440; c=relaxed/simple;
	bh=JcTtPIVHlYH9D1S+gm7/gfZXJIbPMLmTXvPzxYwmmx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3RhGgs3ofIg5O4BgiMRsoCozu2cVg1Vudg61VIkmn/uWTotXpH9es6GxPiDcEKOCUi2SpIX80PAbI0vIcV0/fOv3tiPZ+KquZMyEZX41KvWoBlNkzq2bZNhpFnNwCajB69ihSmx3xEak5IArCBVI5yqxtE9tI79CjB/pDUztM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Llh5rzFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Llh5rzFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF031C2BCAF
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773842439;
	bh=JcTtPIVHlYH9D1S+gm7/gfZXJIbPMLmTXvPzxYwmmx8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Llh5rzFtrQbGxzCkFLYYI5KVzGgNydMK43palfPrDn1l4sy6Kyif++0DU5ixGR5mC
	 k2qioFUf51I57N+aJqD9zYENY7SMvPxvbKUlKKLQdLp3Gj4IMRbufQIppexttve0Zf
	 xL5SnslIBUBPF0fsrsihGPGj7BhHqxXYeb1PmJQOroqvLEDRFdcEbHff7M7cO9+j3O
	 LtG/V+dQ9AFjbpJe+mWxtUlpd7qS+ZNE6/dD24GmL0vR0tRMwr07ZiSDMmfBScgh2l
	 ifsoz6Uj9MKjTQwjN1DIZu0CjclrbeojYyoqPmEVPvF7a+4Ytn5bNm9rIcswuUDCOU
	 R/6tR9VPxqNqw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-664f8bef4e7so5267436a12.3
        for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 07:00:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YznIHxHGGOpVz/XtSxHcEURxHUZd9bvERZJuzlWjlOKnDf2sHkP
	MHKdBLsDI+k2YFxmxHjHLavOjcbgPBgqBpsCV9+jRUs1f5zmgnm8Cbjnm2Qd/VOBISVvoTCxHdf
	/tdAIh/486MgDOKEDrIQKcM4aa/H4Za4=
X-Received: by 2002:a17:907:b023:b0:b97:c719:14d4 with SMTP id
 a640c23a62f3a-b97f4976b2dmr154680366b.29.1773842438125; Wed, 18 Mar 2026
 07:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318110848.2779003-1-lijun01@kylinos.cn>
In-Reply-To: <20260318110848.2779003-1-lijun01@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Mar 2026 22:00:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ZSRCoduH2ohTY_81tSBkRFrQjnbYVHg+n13KMZKAy2Q@mail.gmail.com>
X-Gm-Features: AaiRm518po3nny9U__V7NgaWW3WVQz6_dj_T98cVckCkb-N7SfNZqvfsA5iQf7A
Message-ID: <CAAhV-H5ZSRCoduH2ohTY_81tSBkRFrQjnbYVHg+n13KMZKAy2Q@mail.gmail.com>
Subject: Re: [PATCH] Loongarch: env: fix missing NULL checks for kstrdup
To: Li Jun <lijun01@kylinos.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jun,

On Wed, Mar 18, 2026 at 7:09=E2=80=AFPM Li Jun <lijun01@kylinos.cn> wrote:
>
> Fixes potential kernel oops during early boot when memory
> allocation fails while parsing CPU model from device tree.
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  arch/loongarch/kernel/env.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 841206fde3ab..8d331e4f1c9a 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -49,6 +49,8 @@ static int __init init_cpu_fullname(void)
>         ret =3D of_property_read_string(root, "model", &model);
>         if (ret =3D=3D 0) {
>                 cpuname =3D kstrdup(model, GFP_KERNEL);
> +               if (!cpuname)
> +                       return -ENOMEM;
Missing a "of_node_put(root)" in the error path.

Huacai

>                 loongson_sysconf.cpuname =3D strsep(&cpuname, " ");
>         }
>         of_node_put(root);
> --
> 2.25.1
>
>
