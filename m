Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D304364028
	for <loongarch@lists.linux.dev>; Tue, 23 Jun 2026 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208132; cv=pass; b=LpQK3X9KLHObl5BY6GTCiGulGicV7SDIuxZgiSPN4XVSlUCRgLKb1js1jW5OEfkhd93CvBfEBbN2Si2o0GHNGycNT7JJAcQI26Q3tcQ/5+GVSqzCouVGt7FpvdKiccXbxUxXJaxRQrU7gC/7C7hiWNqlbrj55H8Mq9ZOXSPY9TY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208132; c=relaxed/simple;
	bh=NLmaxRvrb8f6B4kDmC2+4UaQy7jxgH0g76S/agud8TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nl8v5XESMz3poI27EAuLdvEi01KPqEPJzFz1CkNyKE7XVmzSV2hOPu8dKrL5rygUUil/BuqRT4VNhNYUF5psJVYfaNhTZCfHz86m9o2hUPI5dM9+wcb7FVbf4BGR/6GOJteFDY6oEEhLUXSdCOpzmzWWamtyFTj6Sf+TbfjVkI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9ztgk16; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9ztgk16"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c0be5e548a4so494339566b.3
        for <loongarch@lists.linux.dev>; Tue, 23 Jun 2026 02:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782208129; cv=none;
        d=google.com; s=arc-20240605;
        b=UacG9XkVk9+OUke7NMIzj3VrLCZsCa+WyBJRk3WZi2SqDlcBcPbRYimkNFG0Vx8TJP
         U03x9F6YF/yVQIAR63Vx4+ix6TzpHcw3Aodtk+PsqXhtkOCXuZIvnjKqLu38Ic5Ife0+
         1aFqjeBuAfRtNRXA4ORU+phhRCad+QHt/Fb98vlvaZTzEIfBInIcU/M/h1+RoaJqhtJc
         Zc+bDqtvzKTcWUMMSzbj5Mrr2AIQihAI1M3hbIDexfYcmD2NnfDiFRn6O/nwUheF3+xt
         u+UkE55VK0Wk5G1iSz51IrSJy41sVCuk23DLsTT8iM5OlFlNEA9cnd3fA99ZfnuKFNb1
         d+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O53+Q1MVmA/KpV4iIXUxkf9eprZju0Xtb/deZnAD0vM=;
        fh=bChIw4EyvCY9h113csEmAMNGiq30Oura4AhqwgwGMnc=;
        b=guYfhICk0EvtdWStGSXl+M0tTh6TfKZYUCGcAP8BJ0gpBPZ1FSR5EO8CDmy2QFuMfk
         eXOSx0JErrySYli+YqCdtUDbMQv/mkPWBgoZCK+n/JKeUsX1H5a1E3e8ALdJq3Y0fGV0
         P5RBNjtJnyI4mBgB8nWtcrt1sPkDJyl0WS9Tk5pnGUzhT6C9j3gV+CYPeUWsECO40wbO
         uiPWmOhCFk3ViKedqTpz4kSV8Y707KsuEaPLYlzNCTMqW8wqGxB2JVSxW2vyBbGZooKw
         Pm1g2T+3I2VAtHjCSmVDUIykAjysF7P0IS4eXSQlVoEhudTLc8JZR02iEfkpoSLnMu6l
         cm2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782208129; x=1782812929; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O53+Q1MVmA/KpV4iIXUxkf9eprZju0Xtb/deZnAD0vM=;
        b=V9ztgk16L/aziuHFFPDGlZhZ/qpslATToLuO+S7KBUGNe5bCVXyTyr05I3edKAa5kC
         ttWqepT4U2eeTK4fulm4yl+i2AI/Mq/N+6CzquB904xFXs32if7kLZiJ8nTELP+cwNJ/
         0lEpi/XRG9lliQCNe7upFpuBZzbdMGRwawJUHMuoeIG5ZUtbggN7GxH0s4nikAFUHCxB
         7XBxNN3DDC/fcSnwJc9Q6Z/xAbRf5+M29SedVdZYUge2UMb8g5StaCVVBakXZDN/09Cw
         FaxmdouWtXuPJW9AQ4Bu3efVudRSyHho6zM314rEkjVL39/QbbzsB4ugQR+Zp1Siai+R
         L56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208129; x=1782812929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O53+Q1MVmA/KpV4iIXUxkf9eprZju0Xtb/deZnAD0vM=;
        b=bPDSjDuVs0EE7cpO+YbkZTI1U8StMjxT1hDUWITG/qG/ElyEGS8oUZlVGkjEUwouZ+
         WopN6jbTpC3vCZ6LX2M6H5OitdaNzAboFUpDitBA3AbmSvvTDKY+g0W+cFUv/Yt6x/XA
         EKiEXAX1wPan7ht5wz2vSkyGyLKBGqwpUyuPY+6GENQZGjN1IQ7XLRxOVQEbWyQn+iin
         KAU0jNmZQdhrt1w+v9NgTniX7ooMLUc9vMCOKruW3mSW/idkJKJofUC6CVwRdsPtFYG5
         pxASo6RZMl+dTXnlLpOaM3jSefHNvsF/XMAzPkoxD4FZpXeQyLaw03uvp2lrse4sntSX
         m5sA==
X-Forwarded-Encrypted: i=1; AFNElJ/ai2V93HMwco4OMZ6gpRrBUARzgDmJORrPjsKWgTvOsB3QLGWCso7Vz5V9nDXA1fAr7NbKFetZO9I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu5ccIvS4xlLts2+8k45iiztM+JjAodul88zkKg2AZOXEpPZr3
	4Rkj5hRM05TL1BFozz1MWcVceYQjy76Q/bZrYOXehJ+DWJRpGwtXFZ9kTBhpGMXCH7V6YaIrOHP
	GIH1sllrTHm6XfpS3+YOxnoZzQmXpD5ZV9e9/
X-Gm-Gg: AfdE7cnynFx6c7+6JjmPftZVixxboDxG1X0U9a2m8C9mFtLw8rh6hPzI6qMNJz2wOXS
	D8GvcRdturut7K4GAJy+g+kUPAbFJzV0XF6Y3QX3QG15a2id3Zd0p+m3oQRJlpYMWd7qJ+kTuHl
	aXrhhlCjCsnQ79DuYQx6xoefIdsugVER3itA5qp8wAOM6MpVtr94aKMc1byTFL9iG1fofkCQVCu
	sibyEV0srXNSEIucQ0k1qUqEoxv8hFBe/I2j90EOCCiPRkLbBeboQ1WaL+YGg2SWsv5AK+SD48=
X-Received: by 2002:a17:907:728f:b0:c0c:ab91:cf3 with SMTP id
 a640c23a62f3a-c108cdf8e0bmr96073466b.1.1782208129192; Tue, 23 Jun 2026
 02:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616115530.4012675-1-zhoubinbin@loongson.cn> <CAAhV-H6yHuEkhrozoN23T8fTDPpS9gkHwsk1sW8g2=UpnbQE-w@mail.gmail.com>
In-Reply-To: <CAAhV-H6yHuEkhrozoN23T8fTDPpS9gkHwsk1sW8g2=UpnbQE-w@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 23 Jun 2026 17:48:35 +0800
X-Gm-Features: AVVi8CeuoCmkHRVC5IxAmhdRgY3P8BMIoasHa0FgNjXMPQMj2RjKruSCktXgPf8
Message-ID: <CAMpQs4L79Bir2QfxFb65cQzFP17Uv5UzwHaDqFteNCHuTAC84A@mail.gmail.com>
Subject: Re: [PATCH] mfd: ls2kbmc: Fix iomem pointer handling in video mode parsing
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Chong Qiao <qiaochong@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	jeffbai@aosc.io, kexybiscuit@aosc.io, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 3:12=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Tue, Jun 16, 2026 at 7:56=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > Use pointers annotated with the __iomem marker for all iomem map calls,
> > and creates a local copy of the mapped IO memory for future access in
> > the code. memcpy_fromio() and memcpy_toio() are used to read/write data
> > from/to mapped IO memory
> >
> > Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driv=
er")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202603021730.Yy3QXYTw-lkp=
@intel.com/
> > Closes: https://lore.kernel.org/oe-kbuild-all/202606120639.WG6eb8VU-lkp=
@intel.com/
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/mfd/ls2k-bmc-core.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> > index 408056bfb2fe..c40b1a7c4ea4 100644
> > --- a/drivers/mfd/ls2k-bmc-core.c
> > +++ b/drivers/mfd/ls2k-bmc-core.c
> > @@ -427,14 +427,21 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *d=
data)
> >   */
> >  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_p=
latform_data *pd)
> >  {
> > -       char *mode;
> > +       void *buf __free(kfree) =3D NULL;
> > +       void __iomem *base;
> >         int depth, ret;
> > +       char *mode;
> >
> >         /* The last 16M of PCI BAR0 is used to store the resolution str=
ing. */
> > -       mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) +=
 SZ_16M, SZ_16M);
> > -       if (!mode)
> > +       base =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) +=
 SZ_16M, SZ_16M);
> > +       if (!base)
> > +               return -ENOMEM;
> > +
> > +       buf =3D kmalloc(SZ_16M, GFP_KERNEL);
> > +       if (!buf)
> >                 return -ENOMEM;
> >
> > +       mode =3D (char *)buf;
> I think you miss "memcpy_fromio(buf, base, SZ_16M)" here.

Yes, it was missed and will be added in the next version.
Also, `buf` and `mode` can be combined into a single variable.

` char *mode __free(kfree) =3D NULL;`
>
> Huacai
>
> >         /* The resolution field starts with the flag "video=3D". */
> >         if (!strncmp(mode, "video=3D", 6))
> >                 mode =3D mode + 6;
> >
> > base-commit: b07f7904e0523170856876e4412be852377d492a
> > --
> > 2.52.0
> >

--
Thanks.
Binbin
