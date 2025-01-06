Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544762D638
	for <loongarch@lists.linux.dev>; Mon,  6 Jan 2025 07:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147020; cv=none; b=DcKHnRVh/OCUB32H6JIxJFfUF7+tHsJFdz1708Z3/1QWK03KSTL0WGtrGq2FO+4EfSfKMhDvOHNc31Wtlekz9ALtyQKiKojfRheAecxO0dZXPAGfcx6OfSXrfUjWVU0fakfe8NdnhxAuO/x+cCNrXZfFGclnvi2TBtt8jzXE0tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147020; c=relaxed/simple;
	bh=8iI4VAQ+T4XdhwAZFR8eu8Z4T8xHAebi6kgUuvuaDRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9Nk03p9/s8ZXiHWNBgEv/WJPjphgaM/TzYtFbe1/vg78RkI84i6WckZhrnozHav1kBQ2GwqPewE0qRbZNpEcABDf4iPlppzrIJC1qZCfW9Cd1JvN2Ul3rTIdKdG5g0i2MB6yTLWG8FyljrkSK5Kg2L4iFm6sHmImoVRbtTqDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDqVNjGJ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDqVNjGJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso24983483a12.1
        for <loongarch@lists.linux.dev>; Sun, 05 Jan 2025 23:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147016; x=1736751816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WN0eHlvRZLqUth7fdNmiixC7R1slFhIulRWIs6eGyhw=;
        b=NDqVNjGJnsdOkunLdb8KIPgFkSr7Gqw+IQoY0sMvI5DHTw71OWUT6kFrmgS+7Mxg/J
         eC+wj08D8nbS/v8aqZncbu06qFueMNc2R5plUiUugRflifJTQwbwz/UioxoesyD1FjlC
         qq4drx1gGftmtjsSZSRuXOfoey+JRAzW7Y5R0EzMVpRbtRYdiQW1jsfJvG5Mo/2MQU13
         EzuEE7tlnMFRLX4cQ78JCOTCcnkAhFvenMXB28EAbPNOFUVU8nAdr47/DfOMEvh6w9BE
         En/xmBZ7aKx7bMp8tawVEBfuoZZBv+wxwYPL0e0W2ZXj/qoI+0aRzs1iFYkl1/im/FZK
         tcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147016; x=1736751816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN0eHlvRZLqUth7fdNmiixC7R1slFhIulRWIs6eGyhw=;
        b=Ivcc2SIsisESM52ADPwHO70m/ypCOg1UX4CSQ5G++puSdu3+4kJLrxWoHB5lCyVulW
         ec9EQGbXOwRRCNhXC4qGqpQGpwjvyEHA8fXxNQuMyiP+Ulwgke+n128vhJ9QhWwrnmoE
         sPdvkLn9MYPjuRuWNyWLWFz1e0dtPGoxbvqn13Rg0RwaPQXelbFCozVxaSg7XtsJbEK8
         TLTtb7wSGdKaXdpSfp4s+rRVrdD0G4MjIjr5oup4xeavcAdfWdx/7laju+etQGSpP8br
         8XgBnde8CMbh82vK2WA2fkafP9w1dlvttV/8YTukOx35a/T3/WCXIHRbbXoYsj7fRe57
         xmpA==
X-Forwarded-Encrypted: i=1; AJvYcCWQdPlcaanubTeVOZK9TRXc74dvzQomySxkX+/D9yvUVrVMt/n1cX2DQyEbiemVNIBNpjCii5NHS1o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4i6aCMw+onGuxllUGhlCtSmFpMRvmWiDYcsmgcqjBXJEp2e74
	MfL2es8oPij0GcGR6/BM38fXRp0f1PYzoDBNfUA+Uolb9D4fj99G0GhgBhAceijWPDbDSMFC4ZF
	hZA4qPw2kE3jyWLaNfxSNi629qIphevMWPO+M4g==
X-Gm-Gg: ASbGnctoXox5mj5/pKSj19fwWZNjBf7aR3VrxyPN17kO3wpm5cSveEmxl8zt4VR8duG
	7dqNa2GHjr1UhXYCO6i13GXoOf9goJCZaP1SS7ALj
X-Google-Smtp-Source: AGHT+IGMkHPDNbs/bcxbVow/ye0IVS3X1UdnCWKNwdCTlSfAO5AKScoqQ8hW426T+yLCtzoA1OcxbNuBrD9bCPI5FGY=
X-Received: by 2002:a05:6402:390b:b0:5d0:e461:68e6 with SMTP id
 4fb4d7f45d1cf-5d8024822a5mr53462948a12.17.1736147016283; Sun, 05 Jan 2025
 23:03:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1735550269.git.zhoubinbin@loongson.cn> <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
 <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de> <CAMpQs4JcuRhpOyXHxy0ab+D-Wd0itKdb0GiZdTE59_qEpUfyLA@mail.gmail.com>
 <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de>
In-Reply-To: <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 6 Jan 2025 15:03:23 +0800
X-Gm-Features: AbW1kvaA-CPbm5BMeJ4LfWbuB6jOL4jyphKqrcXwDCyIAy9vEeDfIzAZz8-C9Mw
Message-ID: <CAMpQs4L38rDEDYM64jJ6pO+g=M4+etKN9v9+ygzkLY6RQgu94A@mail.gmail.com>
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

The last reply email was incomplete, sorry for the incomplete reply
due to my mistake.

On Thu, Jan 2, 2025 at 9:32=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
>
> Am 02.01.25 um 13:55 schrieb Binbin Zhou:
> > Hi Thomas:
> >
> > Thanks for your reply.
> >
> > On Thu, Jan 2, 2025 at 5:07=E2=80=AFPM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> Hi
> >>
> >>
> >> Am 30.12.24 um 10:31 schrieb Binbin Zhou:
> >> [...]
> >>> +
> >>> +static struct platform_driver ls2kbmc_platform_driver =3D {
> >>> +     .driver =3D {
> >>> +             .name =3D "ls2kbmc-framebuffer",
> >> The driver is mostly a copy of simpledrm. Why don't you use
> >> "simple-framebuffer" for your device name? You could use simpledrm
> >> directly then.
> > Ah, indeed, the driver is based on simpledrm.
> >
> > Initially, I also tried to use simpledrm directly, but it will fail in
> > drm memory acquire.
>
> Could you point to the exact call that fails within simpledrm?

If we use simpledrm directly, the following error occurs:

[    8.289823] simple-framebuffer simple-framebuffer.0: [drm] *ERROR*
could not acquire memory range [mem 0xe0031200000-0xe00315fffff flags
0x200]: -16
[    8.312681] simple-framebuffer simple-framebuffer.0: probe with
driver simple-framebuffer failed with error -16

The reason for the failure: overlapping resources.

https://elixir.bootlin.com/linux/v6.12.6/source/drivers/video/aperture.c#L1=
75
>
> > Because although we register the driver in platform form, its memory
> > belongs to pci space and we can see the corresponding pci probe and
> > resource allocation in Patch-1.
>
> I don't understand. Graphics memory is often located on the PCI bus.
> What is so special about this one?
>
> > Therefore, we need to use aperture_remove_conflicting_pci_devices().
>
> So there is already a device that represents the graphics card? That's
> what you'd remove here? If you only add that MFD device, who owns the
> framebuffer? If it's the PCI device from patch 1 ("ls2k-bmc"), why does
> aperture_remove_conflicting_pci_devices() not remove that device? I'm
> somewhat confused, because the logic in your driver mostly looks like it
> binds to a pre-configured framebuffer, but some of the code doesn't.

Perhaps the use of aperture_remove_conflicting_pci_devices() is wrong,
as there is only one display device for the LS2K BMC and there will be
no phase conflict.

When I tried to use that API before, it was partly due to the error
above, and partly because I referenced that other display drivers via
pci_driver.probe() would have it, just in case I used it, which was
probably the wrong choice.

The resources for pci bar0 are as follows:
BAR0: e0030000000/SZ_32M

0x0              0x600000  0xf00001c    16M            32M
+----+--------------+--------+-----------+---+-----------------+
| 2M | simpldrm |           | IPMI      |     | video env     |
+-----------------------------------------------------------------+

The mfd driver registers the ls2kbmc-framebuffer and ls2k-ipmi-si
devices according to the resource allocation shown above. At the same
time, the ls2kbmc drm is bound to the pre-configured =E2=80=9Csimpldrm=E2=
=80=9D
resource in the above figure, which is passed through the
ls2kbmc-framebuffer driver. In addition, the resolution is read from
=E2=80=9Cvideo env=E2=80=9D for the time being, and the resolution adaption=
 is planned
to be added later.

> Best regards Thomas
>
> >
> > Also, since we are using BMC display, the display will be disconnected
> > when BMC reset, at this time we need to push the display data (crtc,
> > connector, etc.) manually as shown in Patch-4.
> >
> > Probably it's not the most suitable way to implement it.
> >
> >> Best regards
> >> Thomas
> >>
> >>> +     },
> >>> +     .probe =3D ls2kbmc_probe,
> >>> +     .remove =3D ls2kbmc_remove,
> >>> +};
> >>> +
> >>> +module_platform_driver(ls2kbmc_platform_driver);
> >>> +
> >>> +MODULE_DESCRIPTION("DRM driver for Loongson-2K BMC");
> >>> +MODULE_LICENSE("GPL");
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


--
Thanks.
Binbin
