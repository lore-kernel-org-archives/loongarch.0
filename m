Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80C17D7
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 03:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261C8C4339B
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 03:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678071687;
	bh=qS9KqK3sQ/cWLrmiBP+ByBRqWpgp6Bt97op4y5jbV8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hgzUqDNMdPvAuWZdSa2aK4Rz2NnTYONE01oqgpYlpo9FwEf0QoQLbJMEy8Tou6s2d
	 WXIJANabfH1c0xe2zJl7UaT3e1GZOzKrupvxWGP672PLj4FwMkbtWVCud17doQRQkl
	 Qa8E8W+auT9qyL5KU9A3m+EAfT6sBgo9SP9m0Mgtc17/un2HU7q1PpgIc/l3KBu1h1
	 lnQ7hvEKDfvVOSTHHQVoeDvcxYS0FUcphsMlF3qwJa720qwZg3C5dD6z+alb+rrIII
	 y9anMeCggK6UZdV3TTpAisyu7KN6FhRQRCLsUWJ5g6J1kLYPoouSYGHhr/jBx9Fijm
	 RER51U45etKgA==
Received: by mail-ed1-f52.google.com with SMTP id cy23so32708527edb.12
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 19:01:27 -0800 (PST)
X-Gm-Message-State: AO0yUKVX5CAUIXLzVPiXRss2dE5PKweIuCaOsXbBS+Wk3+ZrrgeMuG5K
	izFao5j72DkLWxUBlsZrsC90PsbSO6xr+erZCs8=
X-Google-Smtp-Source: AK7set9rPITqsdTecIWxvyoghDbDqzdFkN/3ZX0xna7NAthjEF96lZLNo/v6UiTh6rI3bvJHkPAZSTbIoVd2EaxMX+k=
X-Received: by 2002:a50:9357:0:b0:4aa:a4f1:3edc with SMTP id
 n23-20020a509357000000b004aaa4f13edcmr5012559eda.7.1678071685389; Sun, 05 Mar
 2023 19:01:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230306025308.248987-1-dzm91@hust.edu.cn>
In-Reply-To: <20230306025308.248987-1-dzm91@hust.edu.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 6 Mar 2023 11:01:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4jW3cJbtoL1gMZ=i7zy1fc4A4q0DqMYPQ-fGc7aHMmog@mail.gmail.com>
Message-ID: <CAAhV-H4jW3cJbtoL1gMZ=i7zy1fc4A4q0DqMYPQ-fGc7aHMmog@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: loongson: fix memory leak in loongson2_guts_probe
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Mon, Mar 6, 2023 at 10:55=E2=80=AFAM Dongliang Mu <dzm91@hust.edu.cn> wr=
ote:
>
> drivers/soc/loongson/loongson2_guts.c:150 loongson2_guts_probe()
> warn: 'guts->regs' from ioremap() not released on lines: 131,135,139,143.
>
> Fix this by modifying ioremap to devm_ioremap.
>
> Note that, this patch is not tested due to the loongson architecture.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> v1->v2: instead of modifying error handling code, directly change
> ioremap to devm_ioremap.
>  drivers/soc/loongson/loongson2_guts.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson=
/loongson2_guts.c
> index bace4bc8e03b..a053e3fdae09 100644
> --- a/drivers/soc/loongson/loongson2_guts.c
> +++ b/drivers/soc/loongson/loongson2_guts.c
> @@ -107,7 +107,7 @@ static int loongson2_guts_probe(struct platform_devic=
e *pdev)
>         guts->little_endian =3D of_property_read_bool(np, "little-endian"=
);
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       guts->regs =3D ioremap(res->start, res->end - res->start + 1);
> +       guts->regs =3D devm_ioremap(dev, res->start, res->end - res->star=
t + 1);
>         if (IS_ERR(guts->regs))
>                 return PTR_ERR(guts->regs);
>
> --
> 2.39.2
>
>
