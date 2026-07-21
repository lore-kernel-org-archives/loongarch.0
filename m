Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C53358B0
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 03:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784604276; cv=none; b=G8qrE75WzYWqqaHvJddEyLFSCV7ptilammdqYVJQGtbZ/OPdUx2djblzNSTzgQjNxoCeJHYGFYTk3D0G+9BEYJMsA1RGyzwQ6Xd/CuJb4nq2mxHukRTfFVu6V3bvC1tf6TM1fyopmmeuhhwv9WI7cxDIib5lBN+pt1XVhdEAOiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784604276; c=relaxed/simple;
	bh=u7V88qL4MHPWgjmotop7fqpYIkifBtTCcBRiL44e8PY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WfxmrpnUzZoL9DNhPctkEF+OQyXbBMbZMD/xAQt1u/Cr2wlSSf8I04UPvlYYMMuk9wIRSFyjbP4f/HnuMK9gakWsgi1ydfxYwTZ9ejr3NNZaTbX8GZhVkwNH+yf9hDFPVWlVVob2/jAjDD/EMM2UW2YKFC0M6Ms8O1xegazRv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbN3Ssot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbN3Ssot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E621F00A3E
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 03:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784604275;
	bh=MdvjVQmwItuxpYtjWgCDRGtiU+Mjk/JZfT19+7gUVmg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nbN3SsotnFbstIl8LPtvdArEhxV60Xmdh87sIyvdVLwFdZSM434hJQdBYvW+xFbsq
	 z0+kHZrvZI40bnC/0joktNxspdESAYLiqKsu8npKcTOQ159NqHnPyfxFPYGaVW4wWN
	 IddMDZdddyeovI8B1jU4xlZbL/SBPHKtjTo0IidHUWagFVw9VqMxcRqVbLDuIyljaA
	 igkLLrTrCLFPQtuSImxs7rd66A9EG2rxiFiQqKbiAdF7jRoy1yQ3wjc0wEqlO5k6zF
	 A9BFV9q72dNUn6lQ+8fb3Gu6flpfPIdbvMvS5grUZpBw0MZzu46BKu/D3j2X5uquKe
	 yjSkDHzCietFw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698ab9aae16so10069462a12.3
        for <loongarch@lists.linux.dev>; Mon, 20 Jul 2026 20:24:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpRGGxJKoyWwcNBnYEIn4wuQrwcyAn45vZxY6I7MKl2yKsA7pd5qSRlAL5sNf+GDXT28OJPi5iexBg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrpYxjuVNrt7ZUUgrC/B3xDCA0hasyK3gAYctTnrw8gppiRG7r
	0KhCmJwgbxyWxSvpZSqkz5E/TdyRnA7Vh06pqpU/druoFdQiN804ZMuWAo+hTzhw3IxEtZc5Oh9
	P4zttmB25pF3wzkjfuGmILP7v0n3290U=
X-Received: by 2002:a05:6402:518b:b0:69c:2fc9:7ff2 with SMTP id
 4fb4d7f45d1cf-69e652e1d45mr6424243a12.19.1784604274361; Mon, 20 Jul 2026
 20:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721025536.1484464-1-wangxuewen@kylinos.cn>
In-Reply-To: <20260721025536.1484464-1-wangxuewen@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 21 Jul 2026 11:24:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4QLa0Y8-MqUPV1cb1oG_kcNRhA06CiN7n_+ekxZVR=ew@mail.gmail.com>
X-Gm-Features: AUfX_mzr55LYNv-wow-Jsq7kgq9Yg5hbnnQkGLWTvl06VKROMOfJp2Fa3SSPOS4
Message-ID: <CAAhV-H4QLa0Y8-MqUPV1cb1oG_kcNRhA06CiN7n_+ekxZVR=ew@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: pci: add NULL check for map_bus return
 value in loongson_gpu_fixup_dma_hang
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Xuewen,

On Tue, Jul 21, 2026 at 10:56=E2=80=AFAM Xuewen Wang <wangxuewen@kylinos.cn=
> wrote:
>
> The map_bus() callback can return NULL when the target device does not
> exist (e.g. non-existent device hidden by FLAG_DEV_HIDDEN, or device > 0
> on internal bridges). All other callers in the kernel check the return
> value, but loongson_gpu_fixup_dma_hang() uses it directly, leading to a
> null pointer dereference via readw(base + PCI_DEVICE_ID).
>
> Add the missing NULL check to prevent the crash.
Have you really met the crash? Or just in your brain?

If you understand PCI fixup, you can know that map_bus() cannot get an
arbitrary input here. When the LS7A GPU exists, it is impossible that
DC doesn't exist.

Huacai

>
> Fixes: 95db0c9f526d ("LoongArch: Workaround LS2K/LS7A GPU DMA hang bug")
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
>  arch/loongarch/pci/pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
> index f33c7ea1443d..3cd89b0224e3 100644
> --- a/arch/loongarch/pci/pci.c
> +++ b/arch/loongarch/pci/pci.c
> @@ -115,6 +115,11 @@ static void loongson_gpu_fixup_dma_hang(struct pci_d=
ev *pdev, bool on)
>         static u32 crtc_status[CRTC_NUM_MAX] =3D { 0 };
>
>         base =3D pdev->bus->ops->map_bus(pdev->bus, pdev->devfn + 1, 0);
> +       if (!base) {
> +               pci_dbg(pdev, "cannot map config space for devfn %02x.%d\=
n",
> +                       PCI_SLOT(pdev->devfn + 1), PCI_FUNC(pdev->devfn +=
 1));
> +               return;
> +       }
>         device =3D readw(base + PCI_DEVICE_ID);
>
>         regbase =3D ioremap(readq(base + PCI_BASE_ADDRESS_0) & ~0xffull, =
SZ_64K);
> --
> 2.25.1
>
