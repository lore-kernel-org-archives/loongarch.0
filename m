Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F395218591
	for <loongarch@lists.linux.dev>; Thu,  9 Jan 2025 12:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427378; cv=none; b=VMJh3p+KGWCAY9TmSJtfGvaMOZpG/acA6eyLxrOkYH6YEnQlHLGgZLk67SIImwqAzycpYnPEc/00CTWFrMLUfuqNSX0XDzKhwb5YwRhd97I/i/92psceSihoYsC/K1qM3KCQ+pUJepao5RflIiolJjEWbHa+bEH8zjlTfZkyk+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427378; c=relaxed/simple;
	bh=QA+w33pmEF1L5mGPFZCUVVEKLfucT1KxzwXEzoz12/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f70kDgQX3r2oAEX1xOLdjKfO1UogybjLGBI26kagK2Rb16YStzqzuj/0dUK/FFxLOa9kEb6ToLSlcjZ15NCqbqfJY43BN3W0IQnZhxWyFh2dyM1XVa+CU+7r8CsSM4IslsYf2rPNtJ1Y15Rn1h//gFJ0d2MCNHuIZNwsssaFRqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+GN/KFk; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+GN/KFk"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso1066477a12.2
        for <loongarch@lists.linux.dev>; Thu, 09 Jan 2025 04:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736427374; x=1737032174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEz38DtTOWq2njzGUgwlj9ewqqxd3JoGkoly/wJ2398=;
        b=h+GN/KFkV8MdcThtHgC8XcvnCD/70YTmsy0KcEHUHuZEwAm4MJGKylVPrw4/LbCjK1
         seLtN8kFAkFMNqkGBZ/d4YMt70BFrBzMcZKkdYyD7IFQphb8rRrycW23cjtvWH7hjjxk
         /D/aQ8kvx1GhPp9YUW1SzOMJaYzb7dyvWjU/wdHPF3w2sA1ZFeWaVaIsxOV/Pm9VajVf
         QK3i14XQNNByI2F+NB7OFWHkFM7BJ9n3gEB7pB9gNXu/2TLzLChvLauJlBkM7dJ0LgxL
         aVOO6IdECUsb7kBwFjY2Ckg6dxy5xh4hRWWZpsv/p1CSERhWxDhWII4yu12FFjgtQS4R
         N4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736427374; x=1737032174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEz38DtTOWq2njzGUgwlj9ewqqxd3JoGkoly/wJ2398=;
        b=ZR8oLyIZr419ERh1uyeRR0H5+/8lfQ1Uhl5DsSwQObb945n2kYNfdq3zQny1MrCzxH
         j+eqjp3u/tx0BR8lGO9zc9M6+8NxK4uKxR/mx6AChcSG/xRLB+U98IXkhsysf4U43Fuz
         IVMNBNo/5AUR8M0WQJojdQoa507rBY1Oq+1ipefyPzF8vYzpiY+NJ6Jrxz7udGVXNvLM
         Pyk6peYdIvbygWJ5z3mOPwW1gEFViQHSVQ5eHyjoANhRCWuroICHjskd8eF67Ge6WKWv
         RzVZycdE7PKRpYtTk4zs4SqXzpRQGMwbTDAi/YhG4uyZjtMHukmTHLvJsCxKTm9nUxL1
         KW/A==
X-Forwarded-Encrypted: i=1; AJvYcCWCWLTVaBMA/bzC7CLPLkFhy17LxWsQQbrDu8816abnyTfzl8x4JSygRPyv1SyZ/GRNa8TTsPVJizQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOkNxaqY/uASyI5vU4Y1abI8iteS0ktJSTWWHbwANoCfcUkrSF
	K9c5TYqQorLmN9zQjUytWiL+RuEV1igG8rerOJXsXeFRLmAo/CS4hEK0nI5sT7N0/m4BDGLfpP8
	msNKhBRcd+AUZRgwT5EDn8Rn/Zpo=
X-Gm-Gg: ASbGnctmS8epKWfvZozdmVZeLj3eDQbiehx7VhwS05y16AlpqEw6Qriv6bcO/A7qG+Q
	i4rCpeuiIBgmE1EQz/wPZYNVynSt+H8GoYT9ORuaQ
X-Google-Smtp-Source: AGHT+IFVbyh6UP8WoK4yZ81Vp8WbecdQUVFZqRCepllXETdu2aj5PHKb14SluGR7PQhfJwfA5AYrx5mYDmAL84OvN+o=
X-Received: by 2002:a05:6402:278f:b0:5d0:e63e:21c3 with SMTP id
 4fb4d7f45d1cf-5d972e085d7mr5917553a12.14.1736427374081; Thu, 09 Jan 2025
 04:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1735550269.git.zhoubinbin@loongson.cn> <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
 <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de> <CAMpQs4JcuRhpOyXHxy0ab+D-Wd0itKdb0GiZdTE59_qEpUfyLA@mail.gmail.com>
 <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de> <CAMpQs4L38rDEDYM64jJ6pO+g=M4+etKN9v9+ygzkLY6RQgu94A@mail.gmail.com>
 <392f855c-4474-4e12-8bdc-3baf43d34e13@suse.de>
In-Reply-To: <392f855c-4474-4e12-8bdc-3baf43d34e13@suse.de>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 9 Jan 2025 20:56:01 +0800
X-Gm-Features: AbW1kvb83mK1OYk5q5Dc7_3GC4pnKl8oLMmBZm6vTEKRq7fQQd39kBPeQAPHqu8
Message-ID: <CAMpQs4+_5v23z3bkT4ykPE_PkgZYUTGKM82xcGnyj4US4O4TCw@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] drm/ls2kbmc: Add support for Loongson-2K BMC display
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	dri-devel@lists.freedesktop.org, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas:

Sorry for the late reply.

On Mon, Jan 6, 2025 at 10:10=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi,
>
> Thanks for the info.
>
>
> Am 06.01.25 um 08:03 schrieb Binbin Zhou:
> [...]
> >> Could you point to the exact call that fails within simpledrm?
> > If we use simpledrm directly, the following error occurs:
> >
> > [    8.289823] simple-framebuffer simple-framebuffer.0: [drm] *ERROR*
> > could not acquire memory range [mem 0xe0031200000-0xe00315fffff flags
> > 0x200]: -16
> > [    8.312681] simple-framebuffer simple-framebuffer.0: probe with
> > driver simple-framebuffer failed with error -16
> >
> > The reason for the failure: overlapping resources.
> >
> > https://elixir.bootlin.com/linux/v6.12.6/source/drivers/video/aperture.=
c#L175
>
> This error means that there's already an instance of simpledrm bound to
> the BMC framebuffer. So you already have a working display and some
> graphics under Linux without the new driver, right?

Yes, I checked again and found that the **efifb** binds to the BMC framebuf=
fer.

>
> If so, why do you need a new driver that does exactly the same as simpled=
rm?

Regarding the new driver, we implemented the BMC display based on
simpledrm. But first we need to fix the initialization failure above,
and more importantly, we need to implement the BMC reset function [1].

Specifically, when the BMC reset, it will cause the pcie controller to
disconnect and the display will be disconnected with it. After that,
we need to restore the pcie bar data, as well as re-push the display
information (ls2kbmc_push_drm_mode()).

Based on this, I would like to rewrite a new display driver.

[1]: patch(4/4)
https://lore.kernel.org/all/b0ac8b81fbb8955ed8ada27aba423cff45aad9f6.173555=
0269.git.zhoubinbin@loongson.cn/
>
> Best regards
> Thomas
>
> >>> Because although we register the driver in platform form, its memory
> >>> belongs to pci space and we can see the corresponding pci probe and
> >>> resource allocation in Patch-1.
> >> I don't understand. Graphics memory is often located on the PCI bus.
> >> What is so special about this one?
> >>
> >>> Therefore, we need to use aperture_remove_conflicting_pci_devices().
> >> So there is already a device that represents the graphics card? That's
> >> what you'd remove here? If you only add that MFD device, who owns the
> >> framebuffer? If it's the PCI device from patch 1 ("ls2k-bmc"), why doe=
s
> >> aperture_remove_conflicting_pci_devices() not remove that device? I'm
> >> somewhat confused, because the logic in your driver mostly looks like =
it
> >> binds to a pre-configured framebuffer, but some of the code doesn't.
> > Perhaps the use of aperture_remove_conflicting_pci_devices() is wrong,
> > as there is only one display device for the LS2K BMC and there will be
> > no phase conflict.
> >
> > When I tried to use that API before, it was partly due to the error
> > above, and partly because I referenced that other display drivers via
> > pci_driver.probe() would have it, just in case I used it, which was
> > probably the wrong choice.
> >
> > The resources for pci bar0 are as follows:
> > BAR0: e0030000000/SZ_32M
> >
> > 0x0              0x600000  0xf00001c    16M            32M
> > +----+--------------+--------+-----------+---+-----------------+
> > | 2M | simpldrm |           | IPMI      |     | video env     |
> > +-----------------------------------------------------------------+
> >
> > The mfd driver registers the ls2kbmc-framebuffer and ls2k-ipmi-si
> > devices according to the resource allocation shown above. At the same
> > time, the ls2kbmc drm is bound to the pre-configured =E2=80=9Csimpldrm=
=E2=80=9D
> > resource in the above figure, which is passed through the
> > ls2kbmc-framebuffer driver. In addition, the resolution is read from
> > =E2=80=9Cvideo env=E2=80=9D for the time being, and the resolution adap=
tion is planned
> > to be added later.
> >
> >> Best regards Thomas
> >>
> >>> Also, since we are using BMC display, the display will be disconnecte=
d
> >>> when BMC reset, at this time we need to push the display data (crtc,
> >>> connector, etc.) manually as shown in Patch-4.
> >>>
> >>> Probably it's not the most suitable way to implement it.
> >>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>> +     },
> >>>>> +     .probe =3D ls2kbmc_probe,
> >>>>> +     .remove =3D ls2kbmc_remove,
> >>>>> +};
> >>>>> +
> >>>>> +module_platform_driver(ls2kbmc_platform_driver);
> >>>>> +
> >>>>> +MODULE_DESCRIPTION("DRM driver for Loongson-2K BMC");
> >>>>> +MODULE_LICENSE("GPL");
> >>>> --
> >>>> --
> >>>> Thomas Zimmermann
> >>>> Graphics Driver Developer
> >>>> SUSE Software Solutions Germany GmbH
> >>>> Frankenstrasse 146, 90461 Nuernberg, Germany
> >>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> >>>> HRB 36809 (AG Nuernberg)
> >>>>
> >> --
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Frankenstrasse 146, 90461 Nuernberg, Germany
> >> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> >> HRB 36809 (AG Nuernberg)
> >>
> >
> > --
> > Thanks.
> > Binbin
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>


--=20
Thanks.
Binbin
