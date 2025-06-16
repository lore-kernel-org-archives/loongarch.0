Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9D2777E9
	for <loongarch@lists.linux.dev>; Mon, 16 Jun 2025 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081219; cv=none; b=Qpza6Z+WGGstbDNydCvdXDuuoa6KB96dHIWM7MYJX7XDCRB75O34b8W6OXq802RJn9J1lCDSRh69rwdYt8soLPIcxl1VHKHxS1VgkO8UuZrwg1a51v9m8fdjreLYDyJf9DSXI3VNUyK3vHvRQepENJ4Q0hmJFeBfEB6x96V9iP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081219; c=relaxed/simple;
	bh=uGkzcwgTLa9uZZKVQ9eiHG2DD4vNankdU5erSvLSnqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoIi3l5Ea/rXo0AdkRJ/dwXmnxchu7dIckvf1U78zRLhi3JSQ/CYhymFoxaaxfOIm4lsJn0zG6A+OmhYNbzISxsB4Dp4gkBpc7MUpsCCy7lhLj8XW9YnToBEyaUqgWrW4BSmM/tCyRp82Af9vU+yCW3SOBmOvwNjSO7rldxFb+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+ivli9d; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+ivli9d"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acbb85ce788so778229366b.3
        for <loongarch@lists.linux.dev>; Mon, 16 Jun 2025 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750081216; x=1750686016; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXMgtgBREAhqXs7fPljpPs2zj+1GZVJ1mU2+Ly3eGIo=;
        b=K+ivli9dN2cQnqteYB1XQNBrxtMdz353ZpF4IZJGeqyu3i80zjsThPvLKyYCIFBBtM
         8mM3oUVAcDP+tiCf764woz8wZhoM+eHYThuhCZqZ4cRSdoSkECy7+sa77r8juefJemvm
         lW3kCwrwpPTICzlpAlBqK4NTsc2oMy1r1UCYECHHhPCKOryMiiAUJcnplFj6/kyd72xW
         wf0tmzRbMbTnjuyLbj8+C6WZDg3GNvZED871/GJP6uthrpH7hXNQIk47W2QZPitA3AAv
         X24aia0RHQj2lOVJf/Rn3p8KDSwrK3dQnqYODoIzfoLFM8vGuGhVEqVmYdqDqt+66lr4
         0SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750081216; x=1750686016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXMgtgBREAhqXs7fPljpPs2zj+1GZVJ1mU2+Ly3eGIo=;
        b=HAyOM5Qmwe9M0Uht3hnd8WMIEreY6adovI1EPdL5ZTmjc+MrZoqG/vRtFTyjBCUbXo
         acsYNDBMjO9p79ajHwE6yVwrwNOcgCfc2S+MmODqtakTl8gVlc0f6jgqG/+0ZNmOqMeZ
         o9LvN0BDqns8MvGEpAvrxuu+ahYjpvxDmurug9jbALC5XyAVtbyE6UfLq14SgP9UChV3
         muje8o0EYMCYskKAUwMsoTdHGhYgKBNPlQ8Xdsdz5CxjJY9KiOUiM2izJioLvyYtwgUE
         lnHVZDb9JMW84AKg8J1w6o3z17fhLxTDWdy+rQ2O4Of2KJIEiKfpl12Loa6lJO4cRNHr
         4oRA==
X-Forwarded-Encrypted: i=1; AJvYcCXU8uAoN7+eZssj1RejWXHk39b0exNBIg7joYpU06SPOkP6w3fSjCQLELdKjetsKDY7tvyS0or0yc8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxirhuOM7eGsArqAdPG0w42MmnrG55tFvt9pAE1dX07pCIsr2yD
	YrpDIf/fFYLR3Igc75vjQAJUfTySOGQpzQMxF7N4NCJO5EYvvnIGF2D16bWayiX02mEDMYLTwRX
	3CzCbvEmV7wc1sCzt2iabsvbLGFC9uaA=
X-Gm-Gg: ASbGncumUKZBo8Ccjdm+uHk6OBnEKsibW/HJQBNWwzUfm1MdXK6R/QMeGK4GX2n1E1l
	tLAGL+BSjFCsG/JU7rmtZP7v8wjhh830qonzcKrlPzCbKRUZlJlBhiKlY6O9RYkaJ2c8JyyGI+K
	1QXAsDgNG2cI6ItQGpuDLyV/r4lvaiwTU8iiQeuQgTQh2B1bEdyIed
X-Google-Smtp-Source: AGHT+IFWcSeGsCAQdrj9adUAYNl9kSrg2eu/sNtevQzb0bfBo8T+7z6o2AHoej+CvXD3n4jGSQ9PhQvNTEOaBCCOiIc=
X-Received: by 2002:a17:907:6d20:b0:ad8:9b5d:2c1c with SMTP id
 a640c23a62f3a-adfad39e4bdmr977791466b.19.1750081215406; Mon, 16 Jun 2025
 06:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749731531.git.zhoubinbin@loongson.cn> <aEzFPdYEvbkaH_B5@mail.minyard.net>
 <CAMpQs4L66sXLdj6+ebMXcwq4i+XVi+AmwBbQSx0-EuULNJ5XeQ@mail.gmail.com>
 <aEzqbLHSB6phFNox@mail.minyard.net> <CAMpQs4L82x=OhLQJb96ZC4YfT_ZhHcU+zks2r0HMU0Y2fjwsbg@mail.gmail.com>
 <aE2AR8rj9OEM8TcB@mail.minyard.net> <CAMpQs4+5hapiYv_M4px0XkcXiCd7cCpyb55APKt+uh1iBaor3Q@mail.gmail.com>
 <aFAZOH7ymTVmTduw@mail.minyard.net>
In-Reply-To: <aFAZOH7ymTVmTduw@mail.minyard.net>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 16 Jun 2025 21:40:02 +0800
X-Gm-Features: AX0GCFvN86tQcGX_sGWSk_1_sCrY5QQ_l18kVipW3iUYoXYYIOd2f_cWFVyOMk4
Message-ID: <CAMpQs4Ld67ot5xaRPjQT2Yq5Nt3N-9qvd3U75Z5fcPrQ16Ve-A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] LoongArch: Add Loongson-2K BMC support
To: corey@minyard.net
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io, 
	kexybiscuit@aosc.io, wangyao@lemote.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 9:16=E2=80=AFPM Corey Minyard <corey@minyard.net> w=
rote:
>
> On Mon, Jun 16, 2025 at 03:35:56PM +0800, Binbin Zhou wrote:
> > Hi Corey:
> >
> > Thanks  for your detailed review.
> >
> > On Sat, Jun 14, 2025 at 9:59=E2=80=AFPM Corey Minyard <corey@minyard.ne=
t> wrote:
> > >
> > > On Sat, Jun 14, 2025 at 01:25:17PM +0800, Binbin Zhou wrote:
> > > > Hi Corey:
> > > >
> > > > Thanks for your detailed suggestions.
> > > >
> > > > On Sat, Jun 14, 2025 at 11:20=E2=80=AFAM Corey Minyard <corey@minya=
rd.net> wrote:
> > > > >
> > > > > On Sat, Jun 14, 2025 at 10:50:37AM +0800, Binbin Zhou wrote:
> > > > > > Hi Corey:
> > > > > >
> > > > > > On Sat, Jun 14, 2025 at 8:41=E2=80=AFAM Corey Minyard <corey@mi=
nyard.net> wrote:
> > > > > > >
> > > > > > > On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> > > > > > > > Hi all:
> > > > > > > >
> > > > > > > > This patch set introduces the Loongson-2K BMC.
> > > > > > > >
> > > > > > > > It is a PCIe device present on servers similar to the Loong=
son-3 CPUs.
> > > > > > > > And it is a multifunctional device (MFD), such as display a=
s a sub-function
> > > > > > > > of it.
> > > > > > >
> > > > > > > I've asked this before, but I haven't gotten a answer, I don'=
t think.
> > > > > > >
> > > > > > > Is this really a multi-function device?  Is there (or will th=
ere be)
> > > > > > > another driver that uses the MFD code?
> > > > > >
> > > > > > I am very sorry, I may have overlooked your previous question.
> > > > > >
> > > > > > And I also may not have a thorough understanding of multifuncti=
on devices.
> > > > > >
> > > > > > The Loongson-2K BMC device provides two functions: display and =
IPMI.
> > > > > > For display, we pass the simplefb_platform_data parameter and r=
egister
> > > > > > the simpledrm device, as shown in patch-1.
> > > > > >
> > > > > > Therefore, I think this should be considered a multifunction de=
vice.
> > > > >
> > > > > Ok, that's clear, thank you.
> > > > >
> > > > > However, that's not really very clear from the patches you have
> > > > > provided.  Particularly, the "bmc" in the name from patch 1 makes=
 one
> > > > > think that it's only a bmc.
> > > > >
> > > > > The "bmc" name is also a little confusing; the devices with a "bm=
c" in
> > > > > the name are all the BMC side, but you are doing a host side devi=
ce.
> > > > >
> > > > > If you look at most of the other MFDs, they have a "core" section=
 then
> > > > > various other parts that use the core.  And possibly parts in oth=
er
> > > > > directories for individual functions.  I think you need to do the=
 same
> > > > > design.  Have a "core" section that both the display and bmc use,=
 then a
> > > > > separate display and bmc driver.
> > > >
> > > > If it can be reconstructed in this way, it should be clearer.
> > > >
> > > > However, there is a key point in my mind: if the display and IPMI a=
re
> > > > separated into two parts, they should at least be able to be probed
> > > > separately, but in fact they belong to the same PCI-E device, just
> > > > allocated different resource intervals.
> > > >
> > > > static struct pci_device_id ls2k_bmc_devices[] =3D {
> > > >        { PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
> > > >        { }
> > > > };
> > > > MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
> > > >
> > > > I'm not sure if my understanding is correct?
> > >
> > > You are already doing this, it appears.  I spent a little time to lea=
rn
> > > how this works.  You are using the standard frame buffer driver, so n=
o
> > > special driver is required there (per earlier discussions).  And you =
are
> > > registering it all as an MFD device, so the display buffer and IPMI
> > > interface will pick it up there.
> > >
> > > So from a design point of view this all looks good.
> > >
> > > The IPMI interface needs to be separately selectable from the main mf=
d
> > > device in the Kconfigs.  Add an IPMI_LS2K config in the IPMI section
> > > that enables the IPMI interface and selects MFD_LS2K_BMC.  And both
> > > configs need to be tristate, not bool, so they can be modules.
> >
> > I tried rewriting Kconfig as follows:
> >
> > IPMI Kconfig:
> >
> > config IPMI_LS2K
> >        bool 'Loongson-2K IPMI interface'
> >        depends on LOONGARCH
> >        select MFD_LS2K_BMC_CORE
> >        help
> >          Provides a driver for Loongson-2K IPMI interfaces.
> >
> > MFD Kconfig:
> >
> > config MFD_LS2K_BMC_CORE
> >         bool "Loongson-2K Board Management Controller Support"
> >         select MFD_CORE
> >
> >
> > However, `tristate` does not seem to work.
> > On the IPMI side, in order to better reuse code, our driver is not
> > actually a completely independent driver; it is part of `ipmi_si`.
>
> Ah, yes, that is true.  The trouble with the above is it will select
> MFD_LS2K_BMC_CORE as "y" even if ipmi_si is a module.  And that will
> force MFD_CORE to be "y" as well.  At least I think it works that way.
> Anyway, that's not terrible, but it would be nice to have the core code
> as a module if possible.
>
> Another issue is you don't have help text on MFD_LS2K_BMC_CORE code.
> You probably want to mention there that it enables the display on
> the BMC.

Of course, I will add some information about BMC in the help text.

Finally, I would like to thanks you again for taking the time to
review my patch. I have benefited greatly from it.
>
> -corey
>
> >
> > diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_=
si_intf.c
> > index 7fe891783a37..c13d5132fffc 100644
> > --- a/drivers/char/ipmi/ipmi_si_intf.c
> > +++ b/drivers/char/ipmi/ipmi_si_intf.c
> > @@ -2120,6 +2120,8 @@ static int __init init_ipmi_si(void)
> >
> >         ipmi_si_pci_init();
> >
> > +       ipmi_si_ls2k_init();
> > +
> >         ipmi_si_parisc_init();
> >
> >         mutex_lock(&smi_infos_lock);
> > @@ -2334,6 +2335,8 @@ static void cleanup_ipmi_si(void)
> >
> >         ipmi_si_pci_shutdown();
> >
> > +       ipmi_si_ls2k_shutdown();
> > +
> >         ipmi_si_parisc_shutdown();
> >
> >         ipmi_si_platform_shutdown();
> >
> >
> > Therefore, it seems that we can only use `bool` here, otherwise an
> > error will occur during compilation, as seen in the V3 patchset[1]:
> >
> > [1]: https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
> >
> > >
> > > I don't know if you want to make the display part so it can be enable=
d
> > > separately, I'm not sure how you would do that.  But that's not my
> > > concern, really.
> > >
> > > Thanks,
> > >
> > > -corey
> > >
> > > >
> > > > >
> > > > > That way, you can use the display without the IPMI interface, or =
the
> > > > > IPMI interface without the display.
> > > > >
> > > > > I would like to see:
> > > > >
> > > > > * A core mfd device named ls2k-core.c that has the core functions=
.
> > > > >   It would have its own config item (MFD_LS2K) that would be
> > > > >   selected if either the display or IPMI device is enabled.
> > > > >
> > > > > * A separate display device in its own file with its own config i=
tem.
> > > > >   This isn't my area, so I'm not sure where this should go.
> > > > >
> > > > > * The IPMI device in the ipmi directory named ipmi_ls2k.c, again
> > > > >   with it's own config item (IPMI_LS2K).
> > > > >
> > > > > Does that make sense?  I don't want to make things too hard, but =
that's
> > > > > the way pretty much everything else is done on MFDs.
> > > > >
> > > > > Thanks,
> > > > >
> > > > > -corey
> > > > >
> > > > > >
> > > > > > >
> > > > > > > If nothing else is going to use this, then it's really not a
> > > > > > > multi-function device and all the code can go into the IPMI d=
irectory.
> > > > > > > That simplifies maintenance.
> > > > > > >
> > > > > > > If it is a multi-function device, then I want two separate Kc=
onfig
> > > > > > > items, one for the MFD and one for the IPMI portion.  That wa=
y it's
> > > > > > > ready and you don't have to bother about the IPMI portion whe=
n
> > > > > > > adding the other device.
> > > > > > >
> > > > > > > All else looks good, I think.
> > > > > > >
> > > > > > > -corey
> > > > > > >
> > > > > > > >
> > > > > > > > For IPMI, according to the existing design, we use software=
 simulation to
> > > > > > > > implement the KCS interface registers: Stauts/Command/Data_=
Out/Data_In.
> > > > > > > >
> > > > > > > > Also since both host side and BMC side read and write kcs s=
tatus, we use
> > > > > > > > fifo pointer to ensure data consistency.
> > > > > > > >
> > > > > > > > For the display, based on simpledrm, the resolution is read=
 from a fixed
> > > > > > > > position in the BMC since the hardware does not support aut=
o-detection
> > > > > > > > of the resolution. Of course, we will try to support multip=
le
> > > > > > > > resolutions later, through a vbios-like approach.
> > > > > > > >
> > > > > > > > Especially, for the BMC reset function, since the display w=
ill be
> > > > > > > > disconnected when BMC reset, we made a special treatment of=
 re-push.
> > > > > > > >
> > > > > > > > Based on this, I will present it in four patches:
> > > > > > > > patch-1: BMC device PCI resource allocation.
> > > > > > > > patch-2: BMC reset function support
> > > > > > > > patch-3: IPMI implementation
> > > > > > > >
> > > > > > > > Thanks.
> > > > > > > >
> > > > > > > > -------
> > > > > > > > V4:
> > > > > > > > - Add Reviewed-by tag;
> > > > > > > > - Change the order of the patches.
> > > > > > > > Patch (1/3):
> > > > > > > >   - Fix build warning by lkp: Kconfig tristate -> bool
> > > > > > > >     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp=
@intel.com/
> > > > > > > >  - Update commit message;
> > > > > > > >  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfi=
g and
> > > > > > > >    Makefile.
> > > > > > > > Patch (2/3):
> > > > > > > >   - Remove unnecessary newlines;
> > > > > > > >   - Rename ls2k_bmc_check_pcie_connected() to
> > > > > > > >     ls2k_bmc_pcie_is_connected();
> > > > > > > >   - Update comment message.
> > > > > > > > Patch (3/3):
> > > > > > > >   - Remove unnecessary newlines.
> > > > > > > >
> > > > > > > > Link to V3:
> > > > > > > > https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin=
@loongson.cn/
> > > > > > > >
> > > > > > > > V3:
> > > > > > > > Patch (1/3):
> > > > > > > >  - Drop "MFD" in title and comment;
> > > > > > > >  - Fromatting code;
> > > > > > > >  - Add clearer comments.
> > > > > > > > Patch (2/3):
> > > > > > > >  - Rebase linux-ipmi/next tree;
> > > > > > > >  - Use readx()/writex() to read and write IPMI data instead=
 of structure
> > > > > > > >    pointer references;
> > > > > > > >  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
> > > > > > > >  - Drop unused output.
> > > > > > > > Patch (3/3):
> > > > > > > >  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2=
k_bmc_pdata_initial();
> > > > > > > >  - Add clearer comments.
> > > > > > > >  - Use proper multi-line commentary as per the Coding Style=
 documentation;
> > > > > > > >  - Define all magic numbers.
> > > > > > > >
> > > > > > > > Link to V2:
> > > > > > > > https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin=
@loongson.cn/
> > > > > > > >
> > > > > > > > V2:
> > > > > > > > - Drop ls2kdrm, use simpledrm instead.
> > > > > > > > Patch (1/3):
> > > > > > > >  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
> > > > > > > >  - Add resolution fetching due to replacing the original di=
splay
> > > > > > > >    solution with simpledrm;
> > > > > > > >  - Add aperture_remove_conflicting_devices() to avoid efifb
> > > > > > > >    conflict with simpledrm.
> > > > > > > > Patch (3/3):
> > > > > > > >  - This part of the function, moved from the original ls2kd=
rm to mfd;
> > > > > > > >  - Use set_console to implement the Re-push display functio=
n.
> > > > > > > >
> > > > > > > > Link to V1:
> > > > > > > > https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin=
@loongson.cn/
> > > > > > > >
> > > > > > > > Binbin Zhou (3):
> > > > > > > >   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > > > > > > >   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > > > > > > >   ipmi: Add Loongson-2K BMC support
> > > > > > > >
> > > > > > > >  drivers/char/ipmi/Makefile       |   1 +
> > > > > > > >  drivers/char/ipmi/ipmi_si.h      |   7 +
> > > > > > > >  drivers/char/ipmi/ipmi_si_intf.c |   3 +
> > > > > > > >  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
> > > > > > > >  drivers/mfd/Kconfig              |  12 +
> > > > > > > >  drivers/mfd/Makefile             |   2 +
> > > > > > > >  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++=
++++++++++++
> > > > > > > >  7 files changed, 699 insertions(+)
> > > > > > > >  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> > > > > > > >  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> > > > > > > >
> > > > > > > >
> > > > > > > > base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> > > > > > > > --
> > > > > > > > 2.47.1
> > > > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Thanks.
> > > > > > Binbin
> > > >
> > > > --
> > > > Thanks.
> > > > Binbin
> >
> > --
> > Thanks.
> > Binbin

--=20
Thanks.
Binbin
