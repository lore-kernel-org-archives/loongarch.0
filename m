Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173861CA9C
	for <loongarch@lists.linux.dev>; Mon,  6 Jan 2025 01:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736128633; cv=none; b=Rk9GHt2n7bkv+MfnHXeZJeZ61vRLJ7J/5hjbQM/KQiC2WuQf/wlIxAK9ozZjQjludaernmd9jF6g0WpagoN5jL4dUdRpUCvXoaeGWPBgxB9ZNYb4GMLqQRfxcTZdAg4bJYdP026uio6VMT9HCXzqUawnWS2kDCqGx4yHa6s4TVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736128633; c=relaxed/simple;
	bh=790vBMuGvVpS5KDVFQkWkyG2+QFbMOW1/pt4KQyWFP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxDtiRZT602JGvMh8pagXOApsnXn9Ac92Ty2RbN9E1gGou9oWXlm/Xl3AJpbWcEO8go3I4qX0aLszZ5fMOBVTdjoYTi6hxurFo4xFTx1SIbuk5vTaeHbklRw/jQNkzE4sIDRR38Lo2Vn2vNV3jTSNw4hpHjBRH+eBiFy4ryqyHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTJoLoqA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTJoLoqA"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d8c1950da7so12586583a12.3
        for <loongarch@lists.linux.dev>; Sun, 05 Jan 2025 17:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736128630; x=1736733430; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlWS4YvO53NnHzw6pvNdcFFPAPIg3E65lSWjybM2Ieg=;
        b=XTJoLoqAtuh5/ZSwpwGe62Wo05z+lclQUPvTt5ikbuNN45YZAhUBgbvV8LJNYCMiBW
         0Eqyfv891Vb1f35tLddZ5zD+33JKeCf39PXzYBSOdekcX9RL5bnbKPdGYcivlFYVzT5s
         K6xwxr4uQq6NK2D5Lud66XOpIbz+NKpR8Pavfs4q+UXEI1fzPPhRWWkp4C3ashD9+CyV
         ElPgwqPxm26TxDJLHGBCWHKg4bxgYSz0HuKNEDwIBLcBHlCWwfDg67vstx+hZ+h8bev/
         5Syfm53h9i/LfoGZJ1DxSWOSQzAC5AKsPtj8sFKB7XkAhY7wvgJTvgAkN1v2xDj8NZ9F
         XQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736128630; x=1736733430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlWS4YvO53NnHzw6pvNdcFFPAPIg3E65lSWjybM2Ieg=;
        b=hvqq9GVKIdhE3NxEE3klARScIOqH9hrL14nWO1hdn6kOh///zRAtwLfJQaATpcknXe
         ERx7VTN+gaSS428q102EJem1RfDuXPl+Nhgt2JkIDC2GES9+uwVmgeSyv/96U2EsWCv4
         T5JAk0vNWbpgOh9GePUbrdHQb9Uvg8kehtEXQtMqhD2aiLbjCfQgtKIl5blZ1wZklhDp
         UbzdUK2rL98BBDT6LgNKZHQCbpbwqnqZ2IaZCGefrPYs0Goc0XkHbVa7oNTH7MZP9NlE
         GnQewbElG0P4eHXycyd89HUUADpxTKvj+Y+Z+EV5P61cJWxeJD3MVBiOmj52rVbvAuES
         hyzw==
X-Forwarded-Encrypted: i=1; AJvYcCW4qmW6f+l26mdh2cvcFhAN3cIHY/nEPb1/bghtpKwb5WpBV8xJyIc7lADj1BdDgrjzAI2FBi59FDI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAk7LU+L15vX6SK+kyuiWYRPKqDVCKJuKAcGua0iTLf8owgJm2
	pETfQ06PP1cVm8qmhyKEkt71W7OX0LlytAbl3ntxeIFzjvQSze6qFA41II/Hjn+2b9ZulbMglFi
	UoXAWmBSYzMx1MePaUY1sVgN6oeg=
X-Gm-Gg: ASbGncuZbqA0C75Axh9lyDu4w3A08EgXDx6tE6qNwapPcrQwgOB+apYe/yStsEaEMkg
	jPy6McBv6euXBXdBs0vCecyQqiw9Gb6Wm+B6rbP1J
X-Google-Smtp-Source: AGHT+IHp3npAFMqevwFn4zq6KYPbZvnYmmZPzwsSEsLp2V2eixfHQyRdfe0VM6iSm48wm7zTxXNLli6e9amHYTcX/ow=
X-Received: by 2002:a05:6402:1e90:b0:5d3:ff30:b4cc with SMTP id
 4fb4d7f45d1cf-5d81de39866mr52543342a12.33.1736128630093; Sun, 05 Jan 2025
 17:57:10 -0800 (PST)
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
Date: Mon, 6 Jan 2025 09:56:57 +0800
X-Gm-Features: AbW1kvYlBMzJH0hwIKgBJ-3gkJK4OQkqvI5bw9nzSAa4-sFHT3qKE49iY62ABvI
Message-ID: <CAMpQs4+0Pn8c=C6bEk=_M4f8WvXv7K6Rbcw2_ghOZmxgE88e3Q@mail.gmail.com>
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

[    8.289823] simple-framebuffer simple-framebuffer.0: [drm] *ERROR*
could not acquire memory range [mem 0xe0031200000-0xe00315fffff flags
0x200]: -16
[    8.312681] simple-framebuffer simple-framebuffer.0: probe with
driver simple-framebuffer failed with error -16
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


--=20
Thanks.
Binbin
