Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383A62CA9
	for <loongarch@lists.linux.dev>; Sat, 14 Jun 2025 03:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749871221; cv=none; b=JEKUpNOBWL5ePuiET0NDCOUnJVVr+BsuqVsC719Iwak92BhPjtONav7SnRrN+Gk0K12fhiBnYrK6Qe/exvl0Zb8vKdjmDP9eSvRj46F4EXwvQ2ysk+o+gnAebGKaexTbl74x2+Fqy9g0uDUUdDACePdkIwSaryZaaDvzxZDjluI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749871221; c=relaxed/simple;
	bh=SqRyC0599YbSC3pytdJJTA8OdbCcr/ZOp45Pkil2hV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7IuTWAJB8/C3niitxDKgtQ6maEms6A1CnVFO3Tf0gcS6keInzw3wo5QX/It8euc3BiOg4giwDrDxJ8BwSla3Hhfnsu5sjXkwFvLyY+Rj8InCMUNJrsn31Z9GV6mr896jwqD6Ecxx9pkJpg6I9nndg9HKjGflco4xVS5RbHiCO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=FYHpXDJh; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="FYHpXDJh"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-735a8be4ea9so671960a34.0
        for <loongarch@lists.linux.dev>; Fri, 13 Jun 2025 20:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1749871219; x=1750476019; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nrY70xBFHGJS9UHfvsdjKO7bxO6w1GEV8th9m+GedU=;
        b=FYHpXDJhC69Q33DyOXUl3wwNZFDVLSPYOHuFDKOp+VQglmtdzLFx3bbqRkdjbnDtBL
         sYqO8wBfBUGM1r6ZcIuS3nG6UTz700Ew6meACgZE98p4aYxLBCQVC+NeHlo0X/M2rIG9
         lciMNhX5F38k2DlLAwB36OvtEB/lmLDGAD7eAB6tGfQEWxg79p8CIqnDC7fV3ckcRzgp
         W2OdPBnhnc92GZMqgrMvAxU9S6KTLZBlEE6SBdw1vFbV2nQwbbfnYtzVYGmu2Q8WJ9Tq
         /kSYPGscyMkcr+eooK2PFzIO/kSy8CJDhd6caxJs9AjsGIQTXrIFM5Qbc1K36dyxsYt+
         FFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749871219; x=1750476019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nrY70xBFHGJS9UHfvsdjKO7bxO6w1GEV8th9m+GedU=;
        b=tq0SvwgAJCjwRVF2WMI7ik3iDAKfY1NEBUp4YL+SmSFtdWsx+aVBhtFf3fDuG1Qvi/
         rmgx/JSUVQyy0ySaDstOOtAh7Qlv6ZZiqIyjWXWziaKNqDCAe2AR9qWIUYOx7iQZbheN
         5DBNDEDUHipW4225yH2r4TP9WRZcsaAJgtspfAUNOrMyhhG0e0N2KIMs6M9zHwacV/50
         dMHdAJF/e2lfXYKR4lnZXKUje/5GkGlgUwqokgg42xUjJ+09jjdbod2ANfE2ZFz83gSa
         722FS7MSjU4/4kum5JQ9BUpX3gjR2RFvZL2xegwZXmcgdGmZ1Ur6krmhpMocwzDkN8EY
         6qfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCIWC1qlote2cAPRjviLC2lhUD988G5bAhpiZgk+XL1Fa15USu+iWPuUUyAlK1BtQOZuYh26jAnkk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxzNF0igNenK8hoAy24t+nHAGMLf5VAiOWvEhXeFBpVBl+VevI
	gxdsKiOtl/MF8gJo9uK5HEKzeOJ3ni5rDcI9hoE5gsHLTvQlXLIumd+KMtpJQazl03A=
X-Gm-Gg: ASbGncvonNwREex1ZyNHyzjKC6nRTMjPqikABnFb+ZhMilVMgFj0PXoPqt+WckGct2T
	drIYdW4poPgulB1N6gJ093Wae3lqIF/Pi/gSZPiuLV8AFpTZCHPmJ3nvp1ZnPUsCb3a3KklpfNc
	p1u+1+1k3lG+KhEsDt3kspsDpreILvYph6M+niazIqpFOIs9PrNOpqdmGribSo7Xb0qLxbTfJ+z
	HI039DPUiapPql6HJDho3hOoi7TjBHa2SsWqwi7nRPV3YOmUj5jjTkY+NzH8TXXiXt+k0t0ozZn
	wmg+eGP8JZx/mfl1qw/LTWf0N5fqWx6VCO9tXAYUCMB6N9WM4Gz1Y1J/zO4F+0QfAQ==
X-Google-Smtp-Source: AGHT+IFtCdsypXfUIdSkDWsQPLx8bOs0XHQwf9Hrlo4CGtcSwtwK74KjLlbplPl5Z1gluc8x6QVWFg==
X-Received: by 2002:a05:6830:4188:b0:72b:9d5e:9429 with SMTP id 46e09a7af769-73a3627b78dmr1784445a34.12.1749871219059;
        Fri, 13 Jun 2025 20:20:19 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:f41f:8468:bca8:a5f7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28402827sm437749a34.17.2025.06.13.20.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 20:20:18 -0700 (PDT)
Date: Fri, 13 Jun 2025 22:20:12 -0500
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
Message-ID: <aEzqbLHSB6phFNox@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1749731531.git.zhoubinbin@loongson.cn>
 <aEzFPdYEvbkaH_B5@mail.minyard.net>
 <CAMpQs4L66sXLdj6+ebMXcwq4i+XVi+AmwBbQSx0-EuULNJ5XeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4L66sXLdj6+ebMXcwq4i+XVi+AmwBbQSx0-EuULNJ5XeQ@mail.gmail.com>

On Sat, Jun 14, 2025 at 10:50:37AM +0800, Binbin Zhou wrote:
> Hi Corey:
> 
> On Sat, Jun 14, 2025 at 8:41 AM Corey Minyard <corey@minyard.net> wrote:
> >
> > On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> > > Hi all:
> > >
> > > This patch set introduces the Loongson-2K BMC.
> > >
> > > It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> > > And it is a multifunctional device (MFD), such as display as a sub-function
> > > of it.
> >
> > I've asked this before, but I haven't gotten a answer, I don't think.
> >
> > Is this really a multi-function device?  Is there (or will there be)
> > another driver that uses the MFD code?
> 
> I am very sorry, I may have overlooked your previous question.
> 
> And I also may not have a thorough understanding of multifunction devices.
> 
> The Loongson-2K BMC device provides two functions: display and IPMI.
> For display, we pass the simplefb_platform_data parameter and register
> the simpledrm device, as shown in patch-1.
> 
> Therefore, I think this should be considered a multifunction device.

Ok, that's clear, thank you.

However, that's not really very clear from the patches you have
provided.  Particularly, the "bmc" in the name from patch 1 makes one
think that it's only a bmc.

The "bmc" name is also a little confusing; the devices with a "bmc" in
the name are all the BMC side, but you are doing a host side device.

If you look at most of the other MFDs, they have a "core" section then
various other parts that use the core.  And possibly parts in other
directories for individual functions.  I think you need to do the same
design.  Have a "core" section that both the display and bmc use, then a
separate display and bmc driver.

That way, you can use the display without the IPMI interface, or the
IPMI interface without the display.

I would like to see:

* A core mfd device named ls2k-core.c that has the core functions.
  It would have its own config item (MFD_LS2K) that would be
  selected if either the display or IPMI device is enabled.

* A separate display device in its own file with its own config item.
  This isn't my area, so I'm not sure where this should go.

* The IPMI device in the ipmi directory named ipmi_ls2k.c, again
  with it's own config item (IPMI_LS2K).

Does that make sense?  I don't want to make things too hard, but that's
the way pretty much everything else is done on MFDs.

Thanks,

-corey

> 
> >
> > If nothing else is going to use this, then it's really not a
> > multi-function device and all the code can go into the IPMI directory.
> > That simplifies maintenance.
> >
> > If it is a multi-function device, then I want two separate Kconfig
> > items, one for the MFD and one for the IPMI portion.  That way it's
> > ready and you don't have to bother about the IPMI portion when
> > adding the other device.
> >
> > All else looks good, I think.
> >
> > -corey
> >
> > >
> > > For IPMI, according to the existing design, we use software simulation to
> > > implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
> > >
> > > Also since both host side and BMC side read and write kcs status, we use
> > > fifo pointer to ensure data consistency.
> > >
> > > For the display, based on simpledrm, the resolution is read from a fixed
> > > position in the BMC since the hardware does not support auto-detection
> > > of the resolution. Of course, we will try to support multiple
> > > resolutions later, through a vbios-like approach.
> > >
> > > Especially, for the BMC reset function, since the display will be
> > > disconnected when BMC reset, we made a special treatment of re-push.
> > >
> > > Based on this, I will present it in four patches:
> > > patch-1: BMC device PCI resource allocation.
> > > patch-2: BMC reset function support
> > > patch-3: IPMI implementation
> > >
> > > Thanks.
> > >
> > > -------
> > > V4:
> > > - Add Reviewed-by tag;
> > > - Change the order of the patches.
> > > Patch (1/3):
> > >   - Fix build warning by lkp: Kconfig tristate -> bool
> > >     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
> > >  - Update commit message;
> > >  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig and
> > >    Makefile.
> > > Patch (2/3):
> > >   - Remove unnecessary newlines;
> > >   - Rename ls2k_bmc_check_pcie_connected() to
> > >     ls2k_bmc_pcie_is_connected();
> > >   - Update comment message.
> > > Patch (3/3):
> > >   - Remove unnecessary newlines.
> > >
> > > Link to V3:
> > > https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loongson.cn/
> > >
> > > V3:
> > > Patch (1/3):
> > >  - Drop "MFD" in title and comment;
> > >  - Fromatting code;
> > >  - Add clearer comments.
> > > Patch (2/3):
> > >  - Rebase linux-ipmi/next tree;
> > >  - Use readx()/writex() to read and write IPMI data instead of structure
> > >    pointer references;
> > >  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
> > >  - Drop unused output.
> > > Patch (3/3):
> > >  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bmc_pdata_initial();
> > >  - Add clearer comments.
> > >  - Use proper multi-line commentary as per the Coding Style documentation;
> > >  - Define all magic numbers.
> > >
> > > Link to V2:
> > > https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loongson.cn/
> > >
> > > V2:
> > > - Drop ls2kdrm, use simpledrm instead.
> > > Patch (1/3):
> > >  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
> > >  - Add resolution fetching due to replacing the original display
> > >    solution with simpledrm;
> > >  - Add aperture_remove_conflicting_devices() to avoid efifb
> > >    conflict with simpledrm.
> > > Patch (3/3):
> > >  - This part of the function, moved from the original ls2kdrm to mfd;
> > >  - Use set_console to implement the Re-push display function.
> > >
> > > Link to V1:
> > > https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loongson.cn/
> > >
> > > Binbin Zhou (3):
> > >   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > >   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > >   ipmi: Add Loongson-2K BMC support
> > >
> > >  drivers/char/ipmi/Makefile       |   1 +
> > >  drivers/char/ipmi/ipmi_si.h      |   7 +
> > >  drivers/char/ipmi/ipmi_si_intf.c |   3 +
> > >  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
> > >  drivers/mfd/Kconfig              |  12 +
> > >  drivers/mfd/Makefile             |   2 +
> > >  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++++++++++++++
> > >  7 files changed, 699 insertions(+)
> > >  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> > >  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> > >
> > >
> > > base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> > > --
> > > 2.47.1
> > >
> 
> 
> -- 
> Thanks.
> Binbin
