Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB71DEFF7
	for <loongarch@lists.linux.dev>; Thu, 20 Feb 2025 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740034358; cv=none; b=dFqkmGo1Oh1bL9ZhN9gWCLg81/72vcPjWsFZgwT6Es+DIXKk/MB+GxPwOFBdJSxYS57GvBlb7iPK4CT+6tp7NHbE6uLxkFdVRLRJaVNlq1VnueBc7VPiGX0LRosNxSudeSGs5TxVGqbEj6bXR2mfNEkfkmmfunSFOmaF/JvCVVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740034358; c=relaxed/simple;
	bh=CLw6zBsSsTnmlCQj0sWMWplnJ0ZrcCL2Ml/zvFulIgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMLTcu0HcSGEx0ZXzejXCwYncEZZA0mqDUni8iW7lrvKSfha1j1is4rP/XeG4YEf21GeqSKfPslFwvHLjwrhyuqME8q9DTBoZTpPCfM0i9or2EPsQjeGXL0bQFx77d8G4ctTGY01q092z2mMqKXpV5RCuLdt1l9rOhcfomKTarY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZyOrT2O; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZyOrT2O"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so1069666a12.3
        for <loongarch@lists.linux.dev>; Wed, 19 Feb 2025 22:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740034354; x=1740639154; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZwJmuqge8q05o7ZYGvV/C+Qh4HzV3tp+xzKODDMrq4=;
        b=FZyOrT2Ok80qRtD0EGuNJ+6D2greXcUvyqUXoIPvfbwKWVS0db/KPUSIPCOQHx5VXi
         FRnU8lZ5xzBNrRDcYaQqpWYI0LAYnO+4cK7R5hHcPuLEgz4gSX7RgTeBZcclYBKUQ3Rb
         AaqUQYgi7s8a6QiYQkGRTJWXv2AVWKUc3k4kwhCCdvM/DNCOinN8G5aYYMnBVgOiEJKU
         ImJcU9dVBX3mHzQAjoI3ShzPs57fxsI9vGmVqA9MZoNbX8JgCsrwHqcG2ft0bqe3fQoX
         QwuTYswxNHI0g2xQ1JKdyc4jm2SJzjB2rUVj3iM9X14bOjOAlIXMzAaU1cel4icMzmCr
         hcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740034354; x=1740639154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZwJmuqge8q05o7ZYGvV/C+Qh4HzV3tp+xzKODDMrq4=;
        b=gCIMNuAsFqKMEKpHXjJZt+cksz+DuK1+RrQ2A5Gqc/JqpcTUmkzTHW+TVWoNj67Ud2
         WDPWPsau9O6kxeDm5VpA1hWX3ZIvSpHMhNSq8oYg4r0p0Slyz9vT7eYxo32giioBRSMP
         /MkVRajxt6G8z6dqBy8aeyS+ZaNnebU7J2p0nVvyUX5ZPq3FHntyAI4/1la3VMrNdwjq
         u2IVCo4T4ZwJ8sCoepEqpFoOKwcJ9htxjvIceX0TeGOAFSJsEZLy24lZW3/H+qwpBmS1
         1p0O522YFl6igp3KpkCSlE3zsGfFphmEhGptjCGB0bPyxuN5m5cMUKObgX/mugKEDTGh
         /hkg==
X-Forwarded-Encrypted: i=1; AJvYcCWzikIYaH6I7o6K2tXiedEXlmpbuziEjQNpmrIwev7Uzyfx9mxjTZZVtU66ROoSyCiCILJzW/YvpjU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywli64ZVBWOcApGBtLtqIuDbiWmBOEUU69XoRlUm4bThppbvQVX
	1CSfLmrmQgySfQLTz04c0QsLBCjBQXE20rNiPYXbXQFcLtTTmFJByDvjQIFeEQRb6Zc693ZOvqy
	AxP7gI/OhtXjZJTwV/JCXc+qfRag=
X-Gm-Gg: ASbGncuHfDR5SvE+2xUnPaMnMG9m8Ion38YciRjJhL7nOM4FZb9t7AHj0D6HzrFlpT9
	QHmk5JUgoT9zuOV5aRyKYY0uW2EU0cYHH6k0K9FbcLjz9GE0apwtXucQJ9eKbPJhnmrzTMY5/dg
	==
X-Google-Smtp-Source: AGHT+IE9NhBPo/KgScXg5dw2GxEMSOt/KhtyUuf5u5RRA747mzK+lscMf3gNz3OsIbmq9pavaAsFw7HsqmLj/dNMSyY=
X-Received: by 2002:a17:907:9907:b0:abb:b0c0:5b6b with SMTP id
 a640c23a62f3a-abbb0c05e77mr1094505466b.7.1740034354063; Wed, 19 Feb 2025
 22:52:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219032251.2592699-1-haoxiang_li2024@163.com>
In-Reply-To: <20250219032251.2592699-1-haoxiang_li2024@163.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 20 Feb 2025 14:52:21 +0800
X-Gm-Features: AWEUYZnMB3F8S_mLX4zU1TuBvbYqy__x9km_wAN_Md86gzNwXF_7GfgipeOyrLg
Message-ID: <CAMpQs4K5Xw4_M1TXTkc_zGaeuD2K_R6pO1PKyhOOJG_XvQuF9A@mail.gmail.com>
Subject: Re: [PATCH] drivers: loongson: Add check for devm_kstrdup()
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: zhuyinbo@loongson.cn, arnd@arndb.de, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Binbin Zhou <zhoubinbin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Haoxiang:

Please rewrite the patch title as "soc: loongson: loongson2_guts: Add
check for devm_kstrdup()",  and cc soc@kernel.org, because that is the
most appropriate list for this patch.

On Wed, Feb 19, 2025 at 11:23=E2=80=AFAM Haoxiang Li <haoxiang_li2024@163.c=
om> wrote:
>
> Add check for the return value of devm_kstrdup() in
> loongson2_guts_probe() to catch potential exception.
>
> Fixes: b82621ac8450 ("soc: loongson: add GUTS driver for loongson-2 platf=
orms")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/soc/loongson/loongson2_guts.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson=
/loongson2_guts.c
> index ae42e3a9127f..26212cfcf6b0 100644
> --- a/drivers/soc/loongson/loongson2_guts.c
> +++ b/drivers/soc/loongson/loongson2_guts.c
> @@ -117,6 +117,8 @@ static int loongson2_guts_probe(struct platform_devic=
e *pdev)
>         if (machine)
>                 soc_dev_attr.machine =3D devm_kstrdup(dev, machine, GFP_K=
ERNEL);
>
> +       if (!soc_dev_attr.machine)
> +               return -ENOMEM;

I think this exception check should follow directly after devm_kstrdup().
Otherwise the whole driver exits here when the =E2=80=9Cmachine" is empty,
which is not what we expect.

You can refer to:
https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/soc/fsl/guts.c#L2=
24

>         svr =3D loongson2_guts_get_svr();
>         soc_die =3D loongson2_soc_die_match(svr, loongson2_soc_die);
>         if (soc_die) {
> --
> 2.25.1
>
>
--
Thanks.
Binbin
