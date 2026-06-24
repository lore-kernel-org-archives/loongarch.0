Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6843C9893
	for <loongarch@lists.linux.dev>; Wed, 24 Jun 2026 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311800; cv=none; b=V7WKjhk+AL2rAyKlew/RbjlXK+s0+HYfCidpnramAhCAsKwoqg+ycGXbBlNIiFKyFU0z/jvgpwRyePyQVJbhQf3SrrF6HaDTNAs2ncnql/eJwqDV/6kQusYpIlTgt0ut/lfsnTGgoP1H6/h3xXVV3EsjTToegMan90CifnKI6GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311800; c=relaxed/simple;
	bh=W/J/fmy15OjagZBCNoM/5DSsWkHgYwqWIDXHoCiXrEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VD8PIPrjjCj9E2pywSvc5DDYsUgUDLaJgJhVvYxUAO/1K+cFSoOPUPKnBhJWfZ2bLaK0cHl7okDCeomXMJa4hqMjrrbwemuiwJj1HyuzDJExcQiCMVDkkTTxjNZ5wqbPbqid5gJKMVX9hv+2MooJZ2VZUfo2QaWA4EmFDbeibIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Io86Dp0A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io86Dp0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA171F00ADB
	for <loongarch@lists.linux.dev>; Wed, 24 Jun 2026 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782311796;
	bh=ZJ4hmcoDjKpxTsnLm9oiLveMAXZJ6DTqZ2wnJgkiicE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Io86Dp0AJWOFd9x+SECRCZeoRUwZ0yNqZXIveBmY7ygyy4/ClotJA5Kiad+lGykVK
	 cG5XjdyytAxIqMbY50ggqIu3pgfXM77spIC1Po8m4JNufJa2AVKkMiqFazZKGLLUfB
	 pyiZR2FuKyboirUrR2vYWI1V5Lz4WYn94bS70bVEVsmH6w6NVPx3wVMjDomRz3B/tw
	 +gl886iFBf8lHYz2/dfmn5SQKZOYLvm4TkQtaB7xD2cn3EsVno5xUk1/5Cbd746gWS
	 4ggMhoIbDjb58rcOrhbqkcPEpb4Y+kl5dkIelgwVUNSy0FiJ15J2EuhKNryxokUeLJ
	 uZ8C9gIm9ujDw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6977dc206afso209680a12.1
        for <loongarch@lists.linux.dev>; Wed, 24 Jun 2026 07:36:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoWo0WHqn3tDyQCd99ean6wpKtPsu5aCm0rI4qQdrD8Xw1qBNAU37h6epgw6TpMGjTDYmJAcozfNYM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZKq3hzK34TJjnSVoDx+Y4RbiwsR/cVsM/0g0NEGCaqQGvqMGn
	zyz4C2+reKh7qqDj7ytBGIVc5FeXerIbNXXWI59qXnwYVu8p6MSeKv1l/v7Wnmoy9RdlI4Vn+81
	/emD85YXw4IG0Pi2sJ3O9DmA8gIZW2M4=
X-Received: by 2002:a05:6402:26c6:b0:695:572a:7aa8 with SMTP id
 4fb4d7f45d1cf-697f3adf4b0mr1805472a12.20.1782311795391; Wed, 24 Jun 2026
 07:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624085550.1508771-1-zhoubinbin@loongson.cn>
In-Reply-To: <20260624085550.1508771-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 24 Jun 2026 22:36:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5kVdDa-3R2qt+QQNxBKMBKCTKemTm78rYiTe4+aE0HWA@mail.gmail.com>
X-Gm-Features: AVVi8Ce423rNRfJVtb8rz5NXxlf3ClfuOHqu_i-uHL3aKUd8v6XfTOAzzco9ja0
Message-ID: <CAAhV-H5kVdDa-3R2qt+QQNxBKMBKCTKemTm78rYiTe4+aE0HWA@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: ls2kbmc: mfd: ls2kbmc: Fix iomem pointer handling
 in video mode parsing
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Chong Qiao <qiaochong@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	jeffbai@aosc.io, kexybiscuit@aosc.io, zhuyunfei@loongson.cn, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Jun 24, 2026 at 4:56=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
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
> V2:
>  - Add the missing memcpy_fromio();
>  - Drop the unnecessary `buf` variable.
>
> Link to V1:
> https://lore.kernel.org/all/20260616115530.4012675-1-zhoubinbin@loongson.=
cn/
>
>  drivers/mfd/ls2k-bmc-core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe..1312812860c0 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -427,14 +427,20 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_pla=
tform_data *pd)
>  {
> -       char *mode;
> +       char *mode __free(kfree) =3D NULL;
> +       void __iomem *base;
>         int depth, ret;
>
>         /* The last 16M of PCI BAR0 is used to store the resolution strin=
g. */
> -       mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + S=
Z_16M, SZ_16M);
> +       base =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + S=
Z_16M, SZ_16M);
> +       if (!base)
> +               return -ENOMEM;
> +
> +       mode =3D kmalloc(SZ_16M, GFP_KERNEL);
>         if (!mode)
>                 return -ENOMEM;
>
> +       memcpy_fromio(mode, base, SZ_16M);
>         /* The resolution field starts with the flag "video=3D". */
>         if (!strncmp(mode, "video=3D", 6))
>                 mode =3D mode + 6;
>
> base-commit: c454531af72e0df811600601413bb8d3d039ed08
> --
> 2.52.0
>
