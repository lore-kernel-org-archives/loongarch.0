Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402FEC15C
	for <loongarch@lists.linux.dev>; Fri, 19 Jun 2026 07:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781853136; cv=none; b=rrVVU3mr2L5rvbqYhUsrnC+bWAY2ZreXygv0IrjEyypYuwcEE/G+i15Unb3koHfh/TGCVFNL0gfLamj2rusDAJBKaL0X36xyKjTlMG/EMEdUu0DbdCQw+J3X7AFultxXkz7Fs2M3Og+Zk+dJhOb8Kn+kNnUInsf/urjqXHZpcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781853136; c=relaxed/simple;
	bh=DiekofQVYvCukyRjCvyVe6tIF6nIGIFhK5rCaEa3vmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nj0OFL+L26+cPuinUK9rHV5OfpsEjo7Z0I7XC49Kv9Yj3J5XzpC8FHin+rC3H9cBynmx0Sd/Zwqn7mLwfVTMTydMKYSdLz1XgD/EEeHfcnZUiw8v7noTeN5diHt66FDDkaWB60YfkrDmsvgR5TFq4n7Wk8LcSaRa1hKqPb4KH6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXrEm8QR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXrEm8QR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81951F01558
	for <loongarch@lists.linux.dev>; Fri, 19 Jun 2026 07:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781853134;
	bh=UtU9BCkDjxUDqCG46JeB6s5YGK8j023LidHGsEj6sJM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iXrEm8QRCs6Qkh7dU6VCtwlm6/9mLNENNpDVexb6zmKTJ8YBes/z2hUfkW/seGmYJ
	 mXQJ3xEXFyXy396COefD1IpqkKg5cnRzufDFxCL6n9RxaljGVLFWz/DA01ElKLMyJc
	 mp57Wpgn3tMjNfHWbI8IXUJRrAjqsvma9UsEDiUBBbTCxof9dKG+nprBucL+0tVg46
	 oaHwx77njp7KqsiXgcCTp60xAQkzkn6ynKVqcArVRwG/Y9Xk4uLasAEOpjvwaOP9JT
	 olnw9055JOjFi88oYx+TyPAmV+bjlC4BzLYc9Pp//dtmJRJORYXggCiftspHXtCyWr
	 /on1f8VQfPYkA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69765eae45dso37863a12.3
        for <loongarch@lists.linux.dev>; Fri, 19 Jun 2026 00:12:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qRJrBCn8DEDIvs3DK5IUvzjwg3VDKwdpYIABY1BIWHYI6Ye5UGE7p9iwgsBg85lqK0JMG2GaFlN0=@lists.linux.dev
X-Gm-Message-State: AOJu0YypkINeoIcTPU+UlM+3AtwbbLNF/tG6hNbvGrZHirCVnjp8MJW2
	8Rtxh3x3xxFX2q+pAOjImgi/05MJyOcx+hglTjxaMsr/ANsODoxwXINd8e5TGMuiHVOUGz2h4y+
	BOjvpF+1Wn0HIwuDSLg/sMLrE8hnEe9A=
X-Received: by 2002:a05:6402:50d4:b0:687:2181:90ab with SMTP id
 4fb4d7f45d1cf-6970f5d21d3mr1259859a12.14.1781853133555; Fri, 19 Jun 2026
 00:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616115530.4012675-1-zhoubinbin@loongson.cn>
In-Reply-To: <20260616115530.4012675-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 19 Jun 2026 15:12:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6yHuEkhrozoN23T8fTDPpS9gkHwsk1sW8g2=UpnbQE-w@mail.gmail.com>
X-Gm-Features: AVVi8CfDGBomIlR_8aUDwCWUm2KnTjvI8c7UIE3hs15GA5GVX74CtY7A21Rv0hw
Message-ID: <CAAhV-H6yHuEkhrozoN23T8fTDPpS9gkHwsk1sW8g2=UpnbQE-w@mail.gmail.com>
Subject: Re: [PATCH] mfd: ls2kbmc: Fix iomem pointer handling in video mode parsing
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Chong Qiao <qiaochong@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	jeffbai@aosc.io, kexybiscuit@aosc.io, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Tue, Jun 16, 2026 at 7:56=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Use pointers annotated with the __iomem marker for all iomem map calls,
> and creates a local copy of the mapped IO memory for future access in
> the code. memcpy_fromio() and memcpy_toio() are used to read/write data
> from/to mapped IO memory
>
> Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver=
")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603021730.Yy3QXYTw-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202606120639.WG6eb8VU-lkp@i=
ntel.com/
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mfd/ls2k-bmc-core.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe..c40b1a7c4ea4 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -427,14 +427,21 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_pla=
tform_data *pd)
>  {
> -       char *mode;
> +       void *buf __free(kfree) =3D NULL;
> +       void __iomem *base;
>         int depth, ret;
> +       char *mode;
>
>         /* The last 16M of PCI BAR0 is used to store the resolution strin=
g. */
> -       mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + S=
Z_16M, SZ_16M);
> -       if (!mode)
> +       base =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + S=
Z_16M, SZ_16M);
> +       if (!base)
> +               return -ENOMEM;
> +
> +       buf =3D kmalloc(SZ_16M, GFP_KERNEL);
> +       if (!buf)
>                 return -ENOMEM;
>
> +       mode =3D (char *)buf;
I think you miss "memcpy_fromio(buf, base, SZ_16M)" here.

Huacai

>         /* The resolution field starts with the flag "video=3D". */
>         if (!strncmp(mode, "video=3D", 6))
>                 mode =3D mode + 6;
>
> base-commit: b07f7904e0523170856876e4412be852377d492a
> --
> 2.52.0
>
