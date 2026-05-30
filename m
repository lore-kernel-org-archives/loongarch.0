Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCAD25CC57
	for <loongarch@lists.linux.dev>; Sat, 30 May 2026 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780124537; cv=none; b=ilKh/iMQTWCubpKoWfJcQwnuDgDHASTIv+rMpuymiR41Sf6bwTKeY9J4Wy/luJWqUqhcDoT+mat5ddkA3DSNVJlDoXuZRpdv3eQwPhvl9uOezvSeB4coIUURj27lmv0Wh6MXbUnsoAJEtsjph0rU1eSyIQ0tK8VthAf9oZbhsAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780124537; c=relaxed/simple;
	bh=XUVa/e31V+M4wXnA0Ye25O+mAHy8RkkVi0lYanFC4B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdLfuvDiThDNqLEJdjL6CdzEyAlPM0xQSvTN93wtokMq8HlX/eejF/2H/aIipcuXDnkMuIMNVg1Dt58TMoKJxhP3oyN0k8xr7eHbylVV+z8vEOpvELiv2im9XgudI7ZkLk9fRe3oCrSSOalakveYqGPxYt2Pk8UgbHaLVAmO4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnuUOL+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnuUOL+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5281F00899
	for <loongarch@lists.linux.dev>; Sat, 30 May 2026 07:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780124536;
	bh=WYUUekz3ah0PjeSfGY4gTaBWBaVYFU3X5F54Wity180=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XnuUOL+PtxOyjBxzjFZo8tUbMnhIqRWIwiMJaQzTTkpYU6EHhtIUQxMduxVCK38pQ
	 fioYkw+IHytIP4d3XA1G3uQehqkxTnM0JhikV9EfTr76fOsgDEX9m6H3qxFCO+7plT
	 kfJAS0ubTsEr/Cm+5JyvMsolG0Ep9q1Gx1PvwqkQLuKttBzBBOim8whblYWWq5VgzQ
	 JubGH/F0gYI/3L7k18NuOCFVFlZh6wK8cJwFmv5fKDR8RA8M4WcxjyZtjZXgQIYsqm
	 15AMEDoRIl3xFvYP8h2RImKtU9q3G9h00SvkM+14Sxcy4pBD7Pp3XRw/i0T8JBYrjX
	 Z5oUQedAK6QnQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-beab79b0978so83560466b.0
        for <loongarch@lists.linux.dev>; Sat, 30 May 2026 00:02:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9w/amMBw/gY+DfKKusvUbOtMRnTfIWbYzsjZeYo6DjTk88Y/eebaZR2gRz298jkx0TggvYimJIwtY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf5+UIajgeS707dHZu6oavSnI8rg3+6Y3EofTRgzD/TMJ2UFJw
	J/d7BeSS0f8qY9SNEUlzjHG9KDzRnglmTjWi7GJd/LwwwWLDQDefnNnwKsGtQMi/nCVPegMB2iu
	P6FaG18OOPe1zIJ4ohkFiEr5FBLf+2vc=
X-Received: by 2002:a17:907:980b:b0:bd1:77c4:acc9 with SMTP id
 a640c23a62f3a-be9a78d0eefmr315522266b.16.1780124534748; Sat, 30 May 2026
 00:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529140559.1775511-1-chenhuacai@loongson.cn>
 <CAFEAcA_Li+07XNfE+GpvZOzwJReqbG=x8nz=kMrQy5vqkReEUQ@mail.gmail.com> <CAFEAcA9-RixpW9Br1_3vhSsBY8KTwpcCMPar39pNX+c_vAPgrw@mail.gmail.com>
In-Reply-To: <CAFEAcA9-RixpW9Br1_3vhSsBY8KTwpcCMPar39pNX+c_vAPgrw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 30 May 2026 15:02:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5G-JAkjoTJCK8iHDWxFpFhfNgvr=R9WmoKP2QRoS6GSA@mail.gmail.com>
X-Gm-Features: AVHnY4L57gN6gVx36Qj5wur7_kvw8ntqm4_at-GQJkbHHXQrEMNeLTY_Eojjj6M
Message-ID: <CAAhV-H5G-JAkjoTJCK8iHDWxFpFhfNgvr=R9WmoKP2QRoS6GSA@mail.gmail.com>
Subject: Re: [PATCH] fw_cfg: Add support for LoongArch architecture
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Gabriel Somlo <somlo@cmu.edu>, 
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, loongarch@lists.linux.dev, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Peter,

On Sat, May 30, 2026 at 1:53=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Fri, 29 May 2026 at 16:52, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Fri, 29 May 2026 at 15:42, Huacai Chen <chenhuacai@loongson.cn> wrot=
e:
> > >
> > > Qemu fw_cfg support was missing for LoongArch, which made some functi=
ons
> > > unusable in virtual machines. So add the missing LoongArch defines.
> > >
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > ---
> > >  drivers/firmware/Kconfig       | 2 +-
> > >  drivers/firmware/qemu_fw_cfg.c | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> > > index bbd2155d8483..9ec747716389 100644
> > > --- a/drivers/firmware/Kconfig
> > > +++ b/drivers/firmware/Kconfig
> > > @@ -121,7 +121,7 @@ config RASPBERRYPI_FIRMWARE
> > >
> > >  config FW_CFG_SYSFS
> > >         tristate "QEMU fw_cfg device support in sysfs"
> > > -       depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || RI=
SCV || SPARC || X86)
> > > +       depends on SYSFS && (ARM || ARM64 || LOONGARCH || PARISC || P=
PC_PMAC || RISCV || SPARC || X86)
> > >         depends on HAS_IOPORT_MAP
> > >         default n
> > >         help
> > > diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_f=
w_cfg.c
> > > index 87a5421bc7d5..0c51a9df589f 100644
> > > --- a/drivers/firmware/qemu_fw_cfg.c
> > > +++ b/drivers/firmware/qemu_fw_cfg.c
> > > @@ -211,7 +211,7 @@ static void fw_cfg_io_cleanup(void)
> > >
> > >  /* arch-specific ctrl & data register offsets are not available in A=
CPI, DT */
> > >  #if !(defined(FW_CFG_CTRL_OFF) && defined(FW_CFG_DATA_OFF))
> > > -# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG=
_RISCV))
> > > +# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG=
_LOONGARCH) || defined(CONFIG_RISCV))
> > >  #  define FW_CFG_CTRL_OFF 0x08
> > >  #  define FW_CFG_DATA_OFF 0x00
> > >  #  define FW_CFG_DMA_OFF 0x10
> >
> > On the QEMU specification side we could probably nail this down
> > to "x86, sun, ppc, parisc have funny register layouts for
> > legacy reasons and all others have the 8-bytes-apart layout",
> > which might help to avoid having all this architecture-specific
> > ifdeffery changing for each new architecture, if that's
> > something people care about.
>
> I sent this QEMU patchset proposing that (and cleaning
> up some of the implementation to make it less likely that
> we add fw_cfg to any new board types with different layouts
> from the arm/riscv/loongarch "standard" one):
>
> https://lore.kernel.org/qemu-devel/20260529174639.451353-1-peter.maydell@=
linaro.org/
Thank you for your effort.

Huacai

>
> -- PMM
