Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0511CBA
	for <loongarch@lists.linux.dev>; Sat, 14 Jun 2025 02:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749869454; cv=none; b=dFFVk4rLrNQFQcsDqdB5WRlYbvfc9n7qAqjVGGqQoX/Y37LyzqTlvwW18P9mtQZSenosjOfJf1Kg5x8zQWd8qsgwFIMudDZAhwINOBK7xwMK2ClpHOXeAj/AEcZSmGLgyRCW6BuPHfIn0qR1mnJThpH+wJ2dHDkqupQ26cHgdiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749869454; c=relaxed/simple;
	bh=1mMthxwuY7zU8b7bASinv8URUT4ZVfo4sQhOgoow08g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzinplzFNmwHKui+cN8lo3fcp7wnWSFhDyEfOEg9dk0aeB/KDSynoYYGi87fM9dP3isuuMWjtO+z/LL0jWjsbKceH3pBN+WOtIYS3ykr8AHeLQsNWDJb7xFQ7psR+owkTA8AKTtMzytzUCUvubgjua+r8HTb17otLDDkk58X+3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqOD+g9Y; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqOD+g9Y"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso5014994a12.1
        for <loongarch@lists.linux.dev>; Fri, 13 Jun 2025 19:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749869450; x=1750474250; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reW5LCT7F0G44H+pooztus/zBkKfkR0anUQESqlGGXg=;
        b=nqOD+g9YRYNu5e2gzhBj0lx7WRWlF9T94GUuPxG/eqD5Xs9UNE73eS/RTGZsxgLwQx
         BvjUCOEvtgqfRT7NlYrk6ADk3TTlWxVIv74vNmkl7qT7GEw/tkCAqcSVys5bMxB3Suiq
         rdP/zpaKQGMcXstGIr/p3WwgFaX5QwbhYT8fMGIdDTzZ08tnDCDONtrplhlryEIVLgfv
         qUQZDLWXpCjjD0RejeIUSsgI/UEx5iE9t0DaynQM+cUS0IuKOr/NSSa3er2vBHyebAgL
         AP7FULMVEbYAdv6wIMl8F4SeOgTqsFPYP/8Lrn5ulVySsRjk6yAi2Xdjnn0isR58r0Ml
         uEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749869450; x=1750474250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reW5LCT7F0G44H+pooztus/zBkKfkR0anUQESqlGGXg=;
        b=xNfuGXw81gDpyi61WphOWiPTmBZYIVrY1+eLWBN4zHaxr/HsR4Dn+V7rTf2Mj/dftd
         i3n6njEGdHyd4vYriMhOLBUhAfTUgrpqgIb9PRQCJnph+USld8VQz3IaIm7pviEeM+TW
         LTj1a5LgMmFb20NcBawgJ4yVISQSeEu2wr7bahpkyR3FL9sj1ATEsIFt/vhz6P8wJmxm
         R06ZyuhjO8yZwPDueOptZLIkBdjmlgLXn7b4H03xNI59NCyOu+KTQTDsJw7iDJZhBlVR
         fZ4CGKakBWza75sa5lI/gHaz2sZiB2tkX9eVs5UzaIlDFLQi231+ZzUZ8na2vtfjZaCB
         lzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeSsd9FHQs5esSEc7VLSegiA4UZwbhL+mCE9qcMqP16tpCEL+VjFHA0zpwxndRncUGjwc/2Zygbik=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr2YebN4ZZDOSIYbvgo3uboMaGErkPmWUOsmSQxRE55FTwc1lN
	IJZOawh+hVdQttoonvpZVYD/rp9cNKjmsJNdJfCqSqu4vbpbnNTUYyyNdw+nhIpQxQVTsnVefKr
	RgHUabjNdIWGCaXOtMGh7B5/rgjna6JM=
X-Gm-Gg: ASbGncv5OQpaYtHbCIJtTiktN+EJWAk2jM4KNz7nt9ZcmX9PueQCM527keq9XeeK0Bz
	+6JIA8YaGK79JJMK6hbNLBgrYMnVaIzcjOOVa/p4ezHYgsKGxuKp8PRjux/cG9hndxwxFBt9vfH
	YkD62VxvEejOCoxIfDhPNeE9u3HdqbKfD/VusRww4MT18=
X-Google-Smtp-Source: AGHT+IF/Q0o6Yl7zNwQgrK7c7P+nIiKSAwskEsw51/vaH4NuCZSSwKShmLHUv0Fyz0Ihla6ndeFaxUGInwUaR7icFVE=
X-Received: by 2002:a17:907:3e08:b0:ad2:4da6:f58c with SMTP id
 a640c23a62f3a-adfad594f01mr129675266b.46.1749869449968; Fri, 13 Jun 2025
 19:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749731531.git.zhoubinbin@loongson.cn> <aEzFPdYEvbkaH_B5@mail.minyard.net>
In-Reply-To: <aEzFPdYEvbkaH_B5@mail.minyard.net>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 14 Jun 2025 10:50:37 +0800
X-Gm-Features: AX0GCFv4h7xWDH3ozZIWsx0a_f5_jGW6ZYKf82T8TFw1i_6zr_wtJ3dRp7i1A-w
Message-ID: <CAMpQs4L66sXLdj6+ebMXcwq4i+XVi+AmwBbQSx0-EuULNJ5XeQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] LoongArch: Add Loongson-2K BMC support
To: corey@minyard.net
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io, 
	kexybiscuit@aosc.io, wangyao@lemote.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Corey:

On Sat, Jun 14, 2025 at 8:41=E2=80=AFAM Corey Minyard <corey@minyard.net> w=
rote:
>
> On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> > Hi all:
> >
> > This patch set introduces the Loongson-2K BMC.
> >
> > It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> > And it is a multifunctional device (MFD), such as display as a sub-func=
tion
> > of it.
>
> I've asked this before, but I haven't gotten a answer, I don't think.
>
> Is this really a multi-function device?  Is there (or will there be)
> another driver that uses the MFD code?

I am very sorry, I may have overlooked your previous question.

And I also may not have a thorough understanding of multifunction devices.

The Loongson-2K BMC device provides two functions: display and IPMI.
For display, we pass the simplefb_platform_data parameter and register
the simpledrm device, as shown in patch-1.

Therefore, I think this should be considered a multifunction device.

>
> If nothing else is going to use this, then it's really not a
> multi-function device and all the code can go into the IPMI directory.
> That simplifies maintenance.
>
> If it is a multi-function device, then I want two separate Kconfig
> items, one for the MFD and one for the IPMI portion.  That way it's
> ready and you don't have to bother about the IPMI portion when
> adding the other device.
>
> All else looks good, I think.
>
> -corey
>
> >
> > For IPMI, according to the existing design, we use software simulation =
to
> > implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
> >
> > Also since both host side and BMC side read and write kcs status, we us=
e
> > fifo pointer to ensure data consistency.
> >
> > For the display, based on simpledrm, the resolution is read from a fixe=
d
> > position in the BMC since the hardware does not support auto-detection
> > of the resolution. Of course, we will try to support multiple
> > resolutions later, through a vbios-like approach.
> >
> > Especially, for the BMC reset function, since the display will be
> > disconnected when BMC reset, we made a special treatment of re-push.
> >
> > Based on this, I will present it in four patches:
> > patch-1: BMC device PCI resource allocation.
> > patch-2: BMC reset function support
> > patch-3: IPMI implementation
> >
> > Thanks.
> >
> > -------
> > V4:
> > - Add Reviewed-by tag;
> > - Change the order of the patches.
> > Patch (1/3):
> >   - Fix build warning by lkp: Kconfig tristate -> bool
> >     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
> >  - Update commit message;
> >  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig and
> >    Makefile.
> > Patch (2/3):
> >   - Remove unnecessary newlines;
> >   - Rename ls2k_bmc_check_pcie_connected() to
> >     ls2k_bmc_pcie_is_connected();
> >   - Update comment message.
> > Patch (3/3):
> >   - Remove unnecessary newlines.
> >
> > Link to V3:
> > https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loongson.cn=
/
> >
> > V3:
> > Patch (1/3):
> >  - Drop "MFD" in title and comment;
> >  - Fromatting code;
> >  - Add clearer comments.
> > Patch (2/3):
> >  - Rebase linux-ipmi/next tree;
> >  - Use readx()/writex() to read and write IPMI data instead of structur=
e
> >    pointer references;
> >  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
> >  - Drop unused output.
> > Patch (3/3):
> >  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bmc_pdata_=
initial();
> >  - Add clearer comments.
> >  - Use proper multi-line commentary as per the Coding Style documentati=
on;
> >  - Define all magic numbers.
> >
> > Link to V2:
> > https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loongson.cn=
/
> >
> > V2:
> > - Drop ls2kdrm, use simpledrm instead.
> > Patch (1/3):
> >  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
> >  - Add resolution fetching due to replacing the original display
> >    solution with simpledrm;
> >  - Add aperture_remove_conflicting_devices() to avoid efifb
> >    conflict with simpledrm.
> > Patch (3/3):
> >  - This part of the function, moved from the original ls2kdrm to mfd;
> >  - Use set_console to implement the Re-push display function.
> >
> > Link to V1:
> > https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loongson.cn=
/
> >
> > Binbin Zhou (3):
> >   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> >   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> >   ipmi: Add Loongson-2K BMC support
> >
> >  drivers/char/ipmi/Makefile       |   1 +
> >  drivers/char/ipmi/ipmi_si.h      |   7 +
> >  drivers/char/ipmi/ipmi_si_intf.c |   3 +
> >  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
> >  drivers/mfd/Kconfig              |  12 +
> >  drivers/mfd/Makefile             |   2 +
> >  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++++++++++++++
> >  7 files changed, 699 insertions(+)
> >  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> >  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> >
> >
> > base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> > --
> > 2.47.1
> >


--=20
Thanks.
Binbin
