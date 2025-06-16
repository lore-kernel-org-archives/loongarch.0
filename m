Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78D70800
	for <loongarch@lists.linux.dev>; Mon, 16 Jun 2025 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079810; cv=none; b=Wuvn+rspfRJb07fI4wmEpPFXThHscGaVbUMB/zd3qzz89tR1Z1SXYaR2n1tcjvlg+Gbfp6ixIgGue/lnFdo7cDxOE8F0MVp0TUCXSYpZJXEUcmnNDt6rjTDNH7NSok/Tsvp0ySjHZ2L2nVBL8Dnkzc4zpNpuDTjuXbxYwUp53Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079810; c=relaxed/simple;
	bh=I+j8rJQXrdtb9Dzvip8M7C1JE38LgbfaSiZPvrfcy1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIbaU+8V4TOsBpHxIPRPVbKTytVuRYUevZDV3oMe0dA2est8tF8Lzw8hUjgAI5JHhOpOjV3HJKs5ZNdlo7rtgP6zTWk9gFNonenYT2X0qQLnpgN6t8vYXgN7L6cOtI3/n/7b/J71rJ+lcJ3yUSEmOaBjbyAnlC6kEiUOhlxlUug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=SUt1Eny0; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="SUt1Eny0"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-60634f82c77so1181889eaf.1
        for <loongarch@lists.linux.dev>; Mon, 16 Jun 2025 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1750079808; x=1750684608; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8Mi39ikecLEPcXDBuglsUfBzlft6AswuDbqdWUZkjA=;
        b=SUt1Eny0v5DiCpJOWifAges3DEIp0TIqZ4xn+B1H0hIFt5+phTqEgM/nIccf0e5EmA
         c6CLtm4SMLB1YzwPEo88jP9rS9t/g0nL+LdxBn8ODjXjhFdR6tEK/ucLfCY9pB30OUvr
         1a1wr5O9mWIQowvaqEBgUSvWx4BD9N/g1pAIdcClEwK5oq8IOnqkbcptSRj+JLbD6+lM
         TxauaohUG3rmL0/gT/6fkjvKKbJKBlsiyr3xV8Jos9TqJZET7x1Vuo2e84k0c4w3LAk2
         8QQrXeNif8cmbPdqm2K/nj7jtozQTWfOtE+AgJqGZ2dFxSAPTak3b81v53i8QIUTepBu
         2bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079808; x=1750684608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8Mi39ikecLEPcXDBuglsUfBzlft6AswuDbqdWUZkjA=;
        b=UiKeF+7eX9/LYDmI8ojgUz9qhDloFj0rVPCwiYMWNcB2XhxM+B3BHJNwGwhMVHhbRm
         HtVd27hjiNgbiyHh5QQCEo8bLNDSFoqgs9Z1Qplqw/HR/3CtkEoR6Htp/7OGnUdcmePG
         7vQoU0c9O0vMdfTZZSDX8V+2hpQn5pOrjSkieX0fsV5oxOJIvw9KDMvkX7xDDUEduilH
         wsimcCRSJU/l6rzUvV7GCTVJOkbV5egfBZU3FiF/k+gl+WbeAqkVknfYO1VSQeN5roh4
         8zsulLo3iSMM5PMr4e4hYjQIhgO+XE2rL0kYK4Ni70SUpvdXOImHu82ZYsnWTb6+s9EB
         6+4w==
X-Forwarded-Encrypted: i=1; AJvYcCW85E22ySo5T9oIjmnDQW/IbiDbe423SUKzFZPvJzwZfPoQx1xIlrc324LPDGvZhGSAFWnzYOL6X7E=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv/aCjSP0pBSrt3elmwJ7vy8scFE2iPwDSCBupmInqEx0ZMEnD
	FYWwjgPBQ//6ThYtzYUmC6Qn3hdRffeVto42/YLAT6kXNlGbSpriK9JPa+F17QfMI1c=
X-Gm-Gg: ASbGncvxK28A/pMMtkyDVJ5yCEunIzO0PUISFnp6RvRJ3mj5HVU5q0ZQmHr2mYmCmJV
	/cw4XVEggZ/A1ZtiKbpzFHHqfagItYwGu3ob5oS2uKfNlJewmBQgvdDMvqgsrYWajSc3VnaHY0I
	Q8tUfUga7iw2p/OntlTR668KiTfJXvaJDYLfuR+gwoPOvN5Ci+5yM07mc6Kpre0R5lbHxu0GPxk
	il53PRQG5eyshx0WUN3lju+/a6309AhdXKI85LcP9sx+gafUZGk1813rcstIxpEOfKoKeDzTgD5
	0qP8x0XJKlJoYT7U77h7Pf+Dysh2zmBFUxPFbhRZLThvlBBEs8E1roBxBWvxbn2gog==
X-Google-Smtp-Source: AGHT+IGKy/mNiaFXndLyTZBnnPbROQUfmLOiXih77FnFhG9cVa1fUGcD/kvZyyBMCSrkSMPTiennPQ==
X-Received: by 2002:a05:6820:509:b0:610:f22b:2d5 with SMTP id 006d021491bc7-61110ed529bmr4664332eaf.1.1750079807714;
        Mon, 16 Jun 2025 06:16:47 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b1f6:e47c:c581:5063])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f0d5f6sm838230eaf.34.2025.06.16.06.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:16:46 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:16:40 -0500
From: Corey Minyard <corey@minyard.net>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com
Subject: Re: [PATCH v4 0/3] LoongArch: Add Loongson-2K BMC support
Message-ID: <aFAZOH7ymTVmTduw@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1749731531.git.zhoubinbin@loongson.cn>
 <aEzFPdYEvbkaH_B5@mail.minyard.net>
 <CAMpQs4L66sXLdj6+ebMXcwq4i+XVi+AmwBbQSx0-EuULNJ5XeQ@mail.gmail.com>
 <aEzqbLHSB6phFNox@mail.minyard.net>
 <CAMpQs4L82x=OhLQJb96ZC4YfT_ZhHcU+zks2r0HMU0Y2fjwsbg@mail.gmail.com>
 <aE2AR8rj9OEM8TcB@mail.minyard.net>
 <CAMpQs4+5hapiYv_M4px0XkcXiCd7cCpyb55APKt+uh1iBaor3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4+5hapiYv_M4px0XkcXiCd7cCpyb55APKt+uh1iBaor3Q@mail.gmail.com>

On Mon, Jun 16, 2025 at 03:35:56PM +0800, Binbin Zhou wrote:
> Hi Corey:
> 
> Thanks  for your detailed review.
> 
> On Sat, Jun 14, 2025 at 9:59 PM Corey Minyard <corey@minyard.net> wrote:
> >
> > On Sat, Jun 14, 2025 at 01:25:17PM +0800, Binbin Zhou wrote:
> > > Hi Corey:
> > >
> > > Thanks for your detailed suggestions.
> > >
> > > On Sat, Jun 14, 2025 at 11:20 AM Corey Minyard <corey@minyard.net> wrote:
> > > >
> > > > On Sat, Jun 14, 2025 at 10:50:37AM +0800, Binbin Zhou wrote:
> > > > > Hi Corey:
> > > > >
> > > > > On Sat, Jun 14, 2025 at 8:41 AM Corey Minyard <corey@minyard.net> wrote:
> > > > > >
> > > > > > On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> > > > > > > Hi all:
> > > > > > >
> > > > > > > This patch set introduces the Loongson-2K BMC.
> > > > > > >
> > > > > > > It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> > > > > > > And it is a multifunctional device (MFD), such as display as a sub-function
> > > > > > > of it.
> > > > > >
> > > > > > I've asked this before, but I haven't gotten a answer, I don't think.
> > > > > >
> > > > > > Is this really a multi-function device?  Is there (or will there be)
> > > > > > another driver that uses the MFD code?
> > > > >
> > > > > I am very sorry, I may have overlooked your previous question.
> > > > >
> > > > > And I also may not have a thorough understanding of multifunction devices.
> > > > >
> > > > > The Loongson-2K BMC device provides two functions: display and IPMI.
> > > > > For display, we pass the simplefb_platform_data parameter and register
> > > > > the simpledrm device, as shown in patch-1.
> > > > >
> > > > > Therefore, I think this should be considered a multifunction device.
> > > >
> > > > Ok, that's clear, thank you.
> > > >
> > > > However, that's not really very clear from the patches you have
> > > > provided.  Particularly, the "bmc" in the name from patch 1 makes one
> > > > think that it's only a bmc.
> > > >
> > > > The "bmc" name is also a little confusing; the devices with a "bmc" in
> > > > the name are all the BMC side, but you are doing a host side device.
> > > >
> > > > If you look at most of the other MFDs, they have a "core" section then
> > > > various other parts that use the core.  And possibly parts in other
> > > > directories for individual functions.  I think you need to do the same
> > > > design.  Have a "core" section that both the display and bmc use, then a
> > > > separate display and bmc driver.
> > >
> > > If it can be reconstructed in this way, it should be clearer.
> > >
> > > However, there is a key point in my mind: if the display and IPMI are
> > > separated into two parts, they should at least be able to be probed
> > > separately, but in fact they belong to the same PCI-E device, just
> > > allocated different resource intervals.
> > >
> > > static struct pci_device_id ls2k_bmc_devices[] = {
> > >        { PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
> > >        { }
> > > };
> > > MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
> > >
> > > I'm not sure if my understanding is correct?
> >
> > You are already doing this, it appears.  I spent a little time to learn
> > how this works.  You are using the standard frame buffer driver, so no
> > special driver is required there (per earlier discussions).  And you are
> > registering it all as an MFD device, so the display buffer and IPMI
> > interface will pick it up there.
> >
> > So from a design point of view this all looks good.
> >
> > The IPMI interface needs to be separately selectable from the main mfd
> > device in the Kconfigs.  Add an IPMI_LS2K config in the IPMI section
> > that enables the IPMI interface and selects MFD_LS2K_BMC.  And both
> > configs need to be tristate, not bool, so they can be modules.
> 
> I tried rewriting Kconfig as follows:
> 
> IPMI Kconfig:
> 
> config IPMI_LS2K
>        bool 'Loongson-2K IPMI interface'
>        depends on LOONGARCH
>        select MFD_LS2K_BMC_CORE
>        help
>          Provides a driver for Loongson-2K IPMI interfaces.
> 
> MFD Kconfig:
> 
> config MFD_LS2K_BMC_CORE
>         bool "Loongson-2K Board Management Controller Support"
>         select MFD_CORE
> 
> 
> However, `tristate` does not seem to work.
> On the IPMI side, in order to better reuse code, our driver is not
> actually a completely independent driver; it is part of `ipmi_si`.

Ah, yes, that is true.  The trouble with the above is it will select
MFD_LS2K_BMC_CORE as "y" even if ipmi_si is a module.  And that will
force MFD_CORE to be "y" as well.  At least I think it works that way.
Anyway, that's not terrible, but it would be nice to have the core code
as a module if possible.

Another issue is you don't have help text on MFD_LS2K_BMC_CORE code.
You probably want to mention there that it enables the display on
the BMC.

-corey

> 
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 7fe891783a37..c13d5132fffc 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2120,6 +2120,8 @@ static int __init init_ipmi_si(void)
> 
>         ipmi_si_pci_init();
> 
> +       ipmi_si_ls2k_init();
> +
>         ipmi_si_parisc_init();
> 
>         mutex_lock(&smi_infos_lock);
> @@ -2334,6 +2335,8 @@ static void cleanup_ipmi_si(void)
> 
>         ipmi_si_pci_shutdown();
> 
> +       ipmi_si_ls2k_shutdown();
> +
>         ipmi_si_parisc_shutdown();
> 
>         ipmi_si_platform_shutdown();
> 
> 
> Therefore, it seems that we can only use `bool` here, otherwise an
> error will occur during compilation, as seen in the V3 patchset[1]:
> 
> [1]: https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
> 
> >
> > I don't know if you want to make the display part so it can be enabled
> > separately, I'm not sure how you would do that.  But that's not my
> > concern, really.
> >
> > Thanks,
> >
> > -corey
> >
> > >
> > > >
> > > > That way, you can use the display without the IPMI interface, or the
> > > > IPMI interface without the display.
> > > >
> > > > I would like to see:
> > > >
> > > > * A core mfd device named ls2k-core.c that has the core functions.
> > > >   It would have its own config item (MFD_LS2K) that would be
> > > >   selected if either the display or IPMI device is enabled.
> > > >
> > > > * A separate display device in its own file with its own config item.
> > > >   This isn't my area, so I'm not sure where this should go.
> > > >
> > > > * The IPMI device in the ipmi directory named ipmi_ls2k.c, again
> > > >   with it's own config item (IPMI_LS2K).
> > > >
> > > > Does that make sense?  I don't want to make things too hard, but that's
> > > > the way pretty much everything else is done on MFDs.
> > > >
> > > > Thanks,
> > > >
> > > > -corey
> > > >
> > > > >
> > > > > >
> > > > > > If nothing else is going to use this, then it's really not a
> > > > > > multi-function device and all the code can go into the IPMI directory.
> > > > > > That simplifies maintenance.
> > > > > >
> > > > > > If it is a multi-function device, then I want two separate Kconfig
> > > > > > items, one for the MFD and one for the IPMI portion.  That way it's
> > > > > > ready and you don't have to bother about the IPMI portion when
> > > > > > adding the other device.
> > > > > >
> > > > > > All else looks good, I think.
> > > > > >
> > > > > > -corey
> > > > > >
> > > > > > >
> > > > > > > For IPMI, according to the existing design, we use software simulation to
> > > > > > > implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
> > > > > > >
> > > > > > > Also since both host side and BMC side read and write kcs status, we use
> > > > > > > fifo pointer to ensure data consistency.
> > > > > > >
> > > > > > > For the display, based on simpledrm, the resolution is read from a fixed
> > > > > > > position in the BMC since the hardware does not support auto-detection
> > > > > > > of the resolution. Of course, we will try to support multiple
> > > > > > > resolutions later, through a vbios-like approach.
> > > > > > >
> > > > > > > Especially, for the BMC reset function, since the display will be
> > > > > > > disconnected when BMC reset, we made a special treatment of re-push.
> > > > > > >
> > > > > > > Based on this, I will present it in four patches:
> > > > > > > patch-1: BMC device PCI resource allocation.
> > > > > > > patch-2: BMC reset function support
> > > > > > > patch-3: IPMI implementation
> > > > > > >
> > > > > > > Thanks.
> > > > > > >
> > > > > > > -------
> > > > > > > V4:
> > > > > > > - Add Reviewed-by tag;
> > > > > > > - Change the order of the patches.
> > > > > > > Patch (1/3):
> > > > > > >   - Fix build warning by lkp: Kconfig tristate -> bool
> > > > > > >     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
> > > > > > >  - Update commit message;
> > > > > > >  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig and
> > > > > > >    Makefile.
> > > > > > > Patch (2/3):
> > > > > > >   - Remove unnecessary newlines;
> > > > > > >   - Rename ls2k_bmc_check_pcie_connected() to
> > > > > > >     ls2k_bmc_pcie_is_connected();
> > > > > > >   - Update comment message.
> > > > > > > Patch (3/3):
> > > > > > >   - Remove unnecessary newlines.
> > > > > > >
> > > > > > > Link to V3:
> > > > > > > https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loongson.cn/
> > > > > > >
> > > > > > > V3:
> > > > > > > Patch (1/3):
> > > > > > >  - Drop "MFD" in title and comment;
> > > > > > >  - Fromatting code;
> > > > > > >  - Add clearer comments.
> > > > > > > Patch (2/3):
> > > > > > >  - Rebase linux-ipmi/next tree;
> > > > > > >  - Use readx()/writex() to read and write IPMI data instead of structure
> > > > > > >    pointer references;
> > > > > > >  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
> > > > > > >  - Drop unused output.
> > > > > > > Patch (3/3):
> > > > > > >  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bmc_pdata_initial();
> > > > > > >  - Add clearer comments.
> > > > > > >  - Use proper multi-line commentary as per the Coding Style documentation;
> > > > > > >  - Define all magic numbers.
> > > > > > >
> > > > > > > Link to V2:
> > > > > > > https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loongson.cn/
> > > > > > >
> > > > > > > V2:
> > > > > > > - Drop ls2kdrm, use simpledrm instead.
> > > > > > > Patch (1/3):
> > > > > > >  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
> > > > > > >  - Add resolution fetching due to replacing the original display
> > > > > > >    solution with simpledrm;
> > > > > > >  - Add aperture_remove_conflicting_devices() to avoid efifb
> > > > > > >    conflict with simpledrm.
> > > > > > > Patch (3/3):
> > > > > > >  - This part of the function, moved from the original ls2kdrm to mfd;
> > > > > > >  - Use set_console to implement the Re-push display function.
> > > > > > >
> > > > > > > Link to V1:
> > > > > > > https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loongson.cn/
> > > > > > >
> > > > > > > Binbin Zhou (3):
> > > > > > >   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > > > > > >   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > > > > > >   ipmi: Add Loongson-2K BMC support
> > > > > > >
> > > > > > >  drivers/char/ipmi/Makefile       |   1 +
> > > > > > >  drivers/char/ipmi/ipmi_si.h      |   7 +
> > > > > > >  drivers/char/ipmi/ipmi_si_intf.c |   3 +
> > > > > > >  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
> > > > > > >  drivers/mfd/Kconfig              |  12 +
> > > > > > >  drivers/mfd/Makefile             |   2 +
> > > > > > >  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++++++++++++++
> > > > > > >  7 files changed, 699 insertions(+)
> > > > > > >  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> > > > > > >  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> > > > > > >
> > > > > > >
> > > > > > > base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> > > > > > > --
> > > > > > > 2.47.1
> > > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Thanks.
> > > > > Binbin
> > >
> > > --
> > > Thanks.
> > > Binbin
> 
> -- 
> Thanks.
> Binbin
