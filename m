Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAD5285C8B
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772522296; cv=none; b=VnH4+Up0EA1SwRAKu0aGBu8a2DtAzm+kosicR8QC0YFexfzbIm7j8c2BrXRPMWwIbUrHHgWoiOf8J6sBTF5AH8x3ckOplBHnFSWhOI6PGOqvId7c0CWbApUTfNR8bKvVKd4p8PCKMfjEPyyybKXEAvcxmvlTzTUSaw3oGnG2uLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772522296; c=relaxed/simple;
	bh=byBKUW0x2IsXhu04e1WoNba4SmnQ+2gbd+40x0R8t6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGWXmiBuWWkBo2MvuKDu6chHurNdsgyuxO7xsfs/i3igT+gCRbxhRHe+cenquryiwu9zo6c6GJfHPyXrLg51we3Gme38J8nwIHHZsnHYi9++3HM+CR/EE3LilsBKK796lq2Xb428u8xteWhofsEFNcIo9/K+TDb3W3Pl92cOfww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSiH4dJF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSiH4dJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B496C2BCB1
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 07:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772522296;
	bh=byBKUW0x2IsXhu04e1WoNba4SmnQ+2gbd+40x0R8t6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SSiH4dJFZskqDgygr02tEbf/PmGCYr3cbrlR38cgbhHNdrANYNncJAkDvt5cihwk3
	 xJu3mWbx1qqnCt6HLtorYWR8MAY81208QRc0byUzxBFv634fcQiDXzcuVrKXglkAfO
	 8+L6YxxdH6CJyV+Cj9qTEdMtOFuwzccBxdWA13aiVJ1Og299yXo+nYn7J7a0Bu8e4G
	 SzWlzxbf78FX7O89I+GjTwuwfavpxGHcQ2SxmEPx4/gOzuT19oj138+ewh/Zw+BxmM
	 E61mLT13P/EbuEvXdaEB++wTkwUjJ/16Dwmr1NMZeuS1t5oJsKSjl9ZIxVjfmI5AoR
	 HZj4MOsRqmz5Q==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so389061a12.1
        for <loongarch@lists.linux.dev>; Mon, 02 Mar 2026 23:18:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVazY0ztEfjRnZ1N7/MvER0xtX8Mtu6cUmPFC8Btl0bFKSDituaQydy53ki0ZZ4UimyQM+9mQAEWKU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yynn1y1GY9jx8wve4wjuPnrFMYJHSjcUHwKyCNAnnmCxUOlRkZH
	Cgbiy7EJ6th2GSIGQag0tLMmgt+m5tD9obc8WMgr+6RoEKCpLdXCrRCRiBDZU7b55bhf8U+DLt0
	DXDRE3E4xEzIxX+hcnu44Al5b24CnzXk=
X-Received: by 2002:a17:907:847:b0:b8f:99c2:1a99 with SMTP id
 a640c23a62f3a-b937636cdf3mr895673766b.9.1772522294672; Mon, 02 Mar 2026
 23:18:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303070642.2785715-1-zhoubinbin@loongson.cn>
In-Reply-To: <20260303070642.2785715-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 3 Mar 2026 15:18:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6zGpe6hOsv2EmjVp0aOgSHKp4L4q=kYgQrkZJ=LRm5Xg@mail.gmail.com>
X-Gm-Features: AaiRm52eAIZuLtci_5CaB99XMkBd1OxhEYe2uMbV7mIpKfmmovGtvjGqcpAaUmg
Message-ID: <CAAhV-H6zGpe6hOsv2EmjVp0aOgSHKp4L4q=kYgQrkZJ=LRm5Xg@mail.gmail.com>
Subject: Re: [PATCH] soc: loongson: loongson2_guts: Use of_root instead of own reference
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:07=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> There is already a global of_root reference. Use that instead of getting
> one on our own. We don't need to care about the reference count either
> this way.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  drivers/soc/loongson/loongson2_guts.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson=
/loongson2_guts.c
> index 16913c3ef65c..d32ec0748b12 100644
> --- a/drivers/soc/loongson/loongson2_guts.c
> +++ b/drivers/soc/loongson/loongson2_guts.c
> @@ -92,7 +92,7 @@ static u32 loongson2_guts_get_svr(void)
>
>  static int loongson2_guts_probe(struct platform_device *pdev)
>  {
> -       struct device_node *root, *np =3D pdev->dev.of_node;
> +       struct device_node *np =3D pdev->dev.of_node;
>         struct device *dev =3D &pdev->dev;
>         const struct loongson2_soc_die_attr *soc_die;
>         const char *machine;
> @@ -109,11 +109,8 @@ static int loongson2_guts_probe(struct platform_devi=
ce *pdev)
>         if (IS_ERR(guts->regs))
>                 return PTR_ERR(guts->regs);
>
> -       /* Register soc device */
> -       root =3D of_find_node_by_path("/");
> -       if (of_property_read_string(root, "model", &machine))
> -               of_property_read_string_index(root, "compatible", 0, &mac=
hine);
> -       of_node_put(root);
> +       if (of_property_read_string(of_root, "model", &machine))
> +               of_property_read_string_index(of_root, "compatible", 0, &=
machine);
>         if (machine) {
>                 soc_dev_attr.machine =3D devm_kstrdup(dev, machine, GFP_K=
ERNEL);
>                 if (!soc_dev_attr.machine)
>
> base-commit: 862ad12fb14cdad9c647100fbc16f7d8171b4470
> --
> 2.52.0
>
