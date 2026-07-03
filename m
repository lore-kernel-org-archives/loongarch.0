Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994FC3B5E07
	for <loongarch@lists.linux.dev>; Fri,  3 Jul 2026 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071882; cv=pass; b=eYYgGNLVQQHR+4DDpXDMpwVmbH/cXiR5c1BeF2sFws6EvtI97K1mZdo6j6jZINldAm4HrQM6tY7BpNou1R/nLw+t7C4ZpM57PguDO33Tph3UjEjz7GusCGUDFWu1WfnXu1oyf5PyKPgG/q5qrpRWiuOqsD9VKow+SBJoX+xL1lU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071882; c=relaxed/simple;
	bh=7sIAUo3po6o9aVxVQCHnptw5lsTJSOYhvGLXwUl7+xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWzp5Vw7oyf0kLTIGUl0LgDLyjZOzoClLebBaek6XBHlEcLI0AyVjktPUnl+m/NDNiwFKE4BH9OmD+6auMq26bTAsV16MCzDot2bLrAx3pbH7jHCSIcf1Dug14rspUUgh2KrzNl4ZyzEwJ6Vi+s5zzB/6o8wyTKYab0dPmprR4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dU56DwJZ; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dU56DwJZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c12758e75afso49467266b.1
        for <loongarch@lists.linux.dev>; Fri, 03 Jul 2026 02:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783071879; cv=none;
        d=google.com; s=arc-20260327;
        b=IZboeYfYfVeZX+nHygFyycLYa67F40PIuC0uzpQgCWTgNQUoX/xRrHvUGi0ryQPEsO
         7k4iuibI5BNdEmI50t+vAA62Mo0A3B9tS16ADp8aq1TRIohZZPvOTXCElWJC17Ly/OHy
         Kpm/Lpz/fvCgXpf8JqV8XSmtgQ6N4pTJsrX2i79oeGf+Hu2H9mDSvrwqa3/UNxUmLFSR
         8OeWCMnPvSzWkv9mayj5c+yhTQQgwhOUWIWvgut0a46EeFPwP0w9770g/shp+SqaJj80
         y+Batat/PB/ObEl01eONa+4nL7HwrxM6kfsAiWJbraEl1StrwqxcnjWfeGzviO9VR4lz
         wnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AspTg5gdJ/Z0cY97MvETdbNMPbpYCq+xj01DQtrv+qY=;
        fh=Hwu04+C14jnMlO5CZ3p58Y0DlRmQqszUxRBtBALQKDs=;
        b=hKFnC9bgJxswGe4Q07YveL6ym/3ItfXPUoGf5TYs0/2UytO/8AE/YPmELCUNKZBd4F
         Tp533TWw3Yfs33hTr0v32EYkVZNqzg+pS/1BpB16vDVB6EW51ApGhPYBoreZHHdfjZoo
         Aq80yzJ+NxKhNqd+OK1xT/qy/M1Ba1wNannFFJ/uf59w4ZegZ0ztDKQEIINmlbqpQWBs
         mFQLQ/kvIkZVYwwsBc1J72gOqIUm5xPcX7qLcNKcn8rM9lFidoja5U9JN9ml2phyFScA
         wc0NsQdncDP8bxYqD34GdXo4Kks5hO+HntaGyZh8Gg/SFA4SYF3uyDCAtrBDSuOkx0qe
         +tiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783071879; x=1783676679; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AspTg5gdJ/Z0cY97MvETdbNMPbpYCq+xj01DQtrv+qY=;
        b=dU56DwJZCTdIUeG0OeKy23/ZVe5LvfhLVrmWt/kTG55H7C0UDFcbZkQt8pKaDoVheG
         ir18uxQjwxIABic1Cfvb5I789sbTxqbtibWxYY4mC9alnkPdN2ZZcF7ZCFxtGZ4eT+6i
         vwpCkUGAJQkSv8i4zKvmvIc+iJJ8bD2e7tvZ7CTyINxkMzEIOFQAG7pgNbOyvTLGE3Bg
         Bh/sBXRgf6kzLEvQ6NOV3XiB2fMAPzMl4JklWMzhmb6bbQlVmdn/9x+C2CmxO8EmVS88
         Za2qNvm/xdRrLahKtioQ/EOG3X6Zgek8NmKef6iNDzSVE7QLW754JfIcuPr+s7+4J3+s
         zVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783071879; x=1783676679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AspTg5gdJ/Z0cY97MvETdbNMPbpYCq+xj01DQtrv+qY=;
        b=hLatbwOYY5/Jh0MnmOTX2RMdNQmJ1K3E8/qO+IQj7cHaashGBMz/LPbCmLOGEji2gw
         uldJD4AjJKk1Pw3S2QHnjUFcXekaZkGecAFt5adSkWFs68T+iubU81JYEpN/myHAD6K8
         pvIgsDuM/q3CgI6jxPEcHku+d0/85Y8yRPUxTwqOlhIFS/9hmSf9O1TUZr6dpRmVPPk3
         aozYImdDNMhJxYAx/juRIcixkALTmlM3tkh12opQKmGM4Fbq16zM6qWT3e5NG955sEa2
         s5KFJno15qaSFYVxVwZ1m4nrc5Q5Lml88YfEtxWQ4JjrE1L42YFkok1c7e7Zc++3WDXd
         J80w==
X-Forwarded-Encrypted: i=1; AHgh+RrUM87aDuYaXa2Mws0Kmyh1XfwAaOYGsnKE9ovi5vpL/aDfs/2sasIbX4mi16qqt5GPTXkZif1BuLY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2oBgZs5lPCTL58BL4S3L34TJSIFvMDpxsA2wf4TXF6WMAjZxK
	yDxBMjNjJ2sjphwco9B5mDa1wZtd4h+P2uy6EpWzI3B7JDRbZSQoXCPQYhcxPO1OBIPXo289N9V
	vPtnH9OvGt7d6v6E8W9BsWaYguKiIdko=
X-Gm-Gg: AfdE7cn/HECUh5dwEytvw1jmw4MeHeBs5K5opyOtzoNgr7RKYBu29N3zbLa6bCjmCtZ
	mFz1SWJ3/xz4vDqe48rbnL6GZmQTaE520fGfaujvhFu93fG4r7LQM7hz8XGs2m5wg68Fux2Xauw
	55xugneNemVv4NzFYPRmcE9eRvHkuOowx+nGFMpNKiFXPvq86Pt01e0fNNUFNrcRQ+Z9srMpPr3
	zQStSe0bc420ElXPafdYgdB/5DqEwfc1qseoDpc5+CvRnmf99Xne015rZDHu2/dU/95hvQ=
X-Received: by 2002:a17:906:2504:b0:c12:655f:e27a with SMTP id
 a640c23a62f3a-c12ae431374mr390338466b.25.1783071878575; Fri, 03 Jul 2026
 02:44:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624085550.1508771-1-zhoubinbin@loongson.cn> <20260702155701.GY2108533@google.com>
In-Reply-To: <20260702155701.GY2108533@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 3 Jul 2026 17:44:24 +0800
X-Gm-Features: AVVi8CdBcu5BNz0DN_E2bcUdzFwDKEa6OijadhiGwMGQLSZoxmJPJsCP6RQmbO0
Message-ID: <CAMpQs4K4ngRWj3EO231OnUzb8iQWHtDJ4vwHCBKkVnf4KBXYbA@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: ls2kbmc: mfd: ls2kbmc: Fix iomem pointer handling
 in video mode parsing
To: Lee Jones <lee@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Corey Minyard <minyard@acm.org>, Chong Qiao <qiaochong@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, jeffbai@aosc.io, kexybiscuit@aosc.io, 
	zhuyunfei@loongson.cn, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee:

On Thu, Jul 2, 2026 at 11:57=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> Please consider these:
>
> /* Sashiko Automation: Issues Found (4 Findings) */
>
> On Wed, 24 Jun 2026, Binbin Zhou wrote:
>
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
> > V2:
> >  - Add the missing memcpy_fromio();
> >  - Drop the unnecessary `buf` variable.
> >
> > Link to V1:
> > https://lore.kernel.org/all/20260616115530.4012675-1-zhoubinbin@loongso=
n.cn/
> >
> >  drivers/mfd/ls2k-bmc-core.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> > index 408056bfb2fe..1312812860c0 100644
> > --- a/drivers/mfd/ls2k-bmc-core.c
> > +++ b/drivers/mfd/ls2k-bmc-core.c
> > @@ -427,14 +427,20 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *d=
data)
> >   */
> >  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_p=
latform_data *pd)
> >  {
> > -     char *mode;
> > +     char *mode __free(kfree) =3D NULL;
> > +     void __iomem *base;
> >       int depth, ret;
> >
> >       /* The last 16M of PCI BAR0 is used to store the resolution strin=
g. */
> > -     mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + S=
Z_16M, SZ_16M);
> > +     base =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + S=
Z_16M, SZ_16M);
> > +     if (!base)
> > +             return -ENOMEM;
> > +
> > +     mode =3D kmalloc(SZ_16M, GFP_KERNEL);
>
> [Severity: High]
> Will this 16MB allocation unconditionally fail on systems where
> KMALLOC_MAX_SIZE is smaller, such as 4MB with 4K pages?
>
> Even if successful, is it necessary to synchronously copy 16MB of device
> I/O memory just to read a short resolution string?

Emm,  indeed, `SZ_64` should be enough. I will also define the following ma=
cro:

/* The LS2K BMC display resolution string length store in PCI BAR0 */
#define LS2K_RESOLUTION_STR_LEN                SZ_64

>
>
> >       if (!mode)
> >               return -ENOMEM;
> >
> > +     memcpy_fromio(mode, base, SZ_16M);
>
> [Severity: High]
> This is a pre-existing issue, but since the buffer is now allocated on th=
e
> heap via kmalloc() and copied directly from device memory, will string
> functions like strncmp() and strsep() read out-of-bounds if the 16MB
> region lacks a null terminator byte?
>
>
> >       /* The resolution field starts with the flag "video=3D". */
> >       if (!strncmp(mode, "video=3D", 6))
> >               mode =3D mode + 6;
>
> [Severity: High]
> Since mode was declared with __free(kfree), will advancing the pointer
> here cause kfree() to be called with a mid-buffer pointer and crash the
> allocator when ls2k_bmc_parse_mode() returns?

Yes, I'll add a new variable `pos` and check the return value of
`strncmp()`, as follows:

        /* The resolution field starts with the flag "video=3D". */
        if (strncmp(mode, "video=3D", 6)) {
                dev_err(&pdev->dev, "Simpledrm resolution missing or
corrupt!\n");
                return -EINVAL;
        }

        pos =3D mode + 6;
        ret =3D kstrtoint(strsep(&pos, "x"), 10, &pd->width);
........
>
>
> >
> > base-commit: c454531af72e0df811600601413bb8d3d039ed08
> > --
> > 2.52.0
> >
>
> --
> Lee Jones

--
Thanks.
Binbin
