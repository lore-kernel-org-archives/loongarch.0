Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E71C84D7
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 07:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758179744; cv=none; b=AH6FfOFA2KQY4vKoc2wg6TgAIvYRK2MYtkID5J102uIWGFpnfK2vK7do+mSo/hqvaUz0HOojuGUeMP9ee9dsLCWTp01B/etkxDOZCXLOpUrAsw8W7ebD0cdwQ3ckBXlL8ZxMeGYDCZsrC1fzTyljOT/Te99ZSX6gJnj+dINe3jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758179744; c=relaxed/simple;
	bh=YJWGmcxxY1gIql8Hao36LDgD/kAfm6CgGJaAfxAqKcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptTunWZApUM+8c8KbNt2LO3TupGj8IKtZCU6VnqQrjwKVlHiN2OPqFLclm6pg7b1Ok3rU/LJMi7bqQDRzMhVAzuXM+BsvPB/H6wTs/vPEq/xpPmXHmdLydfzPZRUarW/T47mJE488iUu5vOU+qA8zSYjtIexdkfngfdZt+OFgis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPpcbnR6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPpcbnR6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB2BC4CEF1
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758179744;
	bh=YJWGmcxxY1gIql8Hao36LDgD/kAfm6CgGJaAfxAqKcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PPpcbnR66wAvb0B1MkCqO61DDQmR7ifchN70zZ+ioC+N0sesCZphJzq9+Bh/+uXsp
	 YW88JVwj4x4x69TPo+ZH2Bbfuzxs53Jg67uy37odD8jIYGpWCc/hlXy/TvDMYwKKHD
	 5bp69VVWrNdH1YULg8Q3v0W7Exc2CokSNIM1jsxfel3Tm8aCusPjrs77BNgNSLqTQ9
	 wSpccHWimB/MREWtBwkEP/tbXCJ3KTsXPsNfwx7c4RHptBhCM45I4nuHl+2sKjC5IK
	 MCgXK6EZEPniznXAFcr1e383ZH+x9fCTivbhnvnifuVJCwtHdmuIhxgfBSyuCATgvV
	 egrJEn7kwjE5w==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b211ccfda1dso49543066b.3
        for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 00:15:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3i1ibaBPVbfgWfR5RcPdjwtN0g0+IcwMyQdOW0aNwwT+Nv7wDEULixIj7AtPL1hI7S+7RW3Yn3cc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/huUYyA9M/meX/QYFIMVMth5OJkrtVf5rSDX/u//l8+y3CxvA
	/GnfBjpmITC2UB45w2wMfOF7sHErERx9TKBqBTmzMlF49l0JNqHuXLMQAN7qBb8b0Gsdd+6OVOc
	Bc5Ys55IGd9gq14myGqRGKjptz82yStc=
X-Google-Smtp-Source: AGHT+IEbhZFDraNN8yrP1PobnxrBa6/tsKMNjaIppNXmXzjNCMBhpZauHQilBroMp9GkPY1nxP0pB/nF//jYaJklLQw=
X-Received: by 2002:a17:907:7ba2:b0:b04:470b:64a5 with SMTP id
 a640c23a62f3a-b1bc02f66a8mr499575266b.36.1758179742558; Thu, 18 Sep 2025
 00:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918064448.91647-1-liu.yun@linux.dev> <20250918064448.91647-2-liu.yun@linux.dev>
In-Reply-To: <20250918064448.91647-2-liu.yun@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 18 Sep 2025 15:15:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6G7eMFCEiF9fijiyFELMKv5s1hUy=HK9iCU7RPrp2AJA@mail.gmail.com>
X-Gm-Features: AS18NWAnXWx8GNiJLJSyQ-Q1taD9N5IVADt9pXfyCjRGsxGgTvzfXt4T2Dgp3-M
Message-ID: <CAAhV-H6G7eMFCEiF9fijiyFELMKv5s1hUy=HK9iCU7RPrp2AJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] loongarch/env: fix missing NULL check after kstrdup()
To: Jackie Liu <liu.yun@linux.dev>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jackie,

Your partner has already sent a patch and be NAKed, don't you know?

https://lore.kernel.org/loongarch/5169d057-28c9-439c-a6b7-1138b4f79e65@xen0=
n.name/T/#t

Huacai

On Thu, Sep 18, 2025 at 2:45=E2=80=AFPM Jackie Liu <liu.yun@linux.dev> wrot=
e:
>
> From: Jackie Liu <liuyun01@kylinos.cn>
>
> The result of kstrdup() may be NULL when memory allocation fails.
> In init_cpu_fullname(), the return value was used directly by strsep()
> without validation, which could lead to NULL pointer dereference.
>
> Add a proper check for the kstrdup() result and return -ENOMEM when
> allocation fails.
>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>  arch/loongarch/kernel/env.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index c0a5dc9aeae2..b41a65ec45c3 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -49,6 +49,8 @@ static int __init init_cpu_fullname(void)
>         ret =3D of_property_read_string(root, "model", &model);
>         if (ret =3D=3D 0) {
>                 cpuname =3D kstrdup(model, GFP_KERNEL);
> +               if (!cpuname)
> +                       return -ENOMEM;
>                 loongson_sysconf.cpuname =3D strsep(&cpuname, " ");
>         }
>         of_node_put(root);
> --
> 2.51.0
>
