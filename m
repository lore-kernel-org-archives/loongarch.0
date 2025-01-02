Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAC83FE4
	for <loongarch@lists.linux.dev>; Thu,  2 Jan 2025 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735822532; cv=none; b=jN5SbHZaBtzsGHAYkDuVXipFFnhzbtLnxkC2RTQsnbISU4epIXj3TdZTAcdXVxyIn5hsHQHVKt1u7Df+71bShzhZsoQrYERxmVxzOCUaGhT9hI9sh+86KoY7Rtw8wkJYCC3KOrmzKVb5MUKVhxEbO5yu/YywNqhrxgYLGaDdEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735822532; c=relaxed/simple;
	bh=16IOg+Kt2uA9fbFtqaxahX3JcEpMj8AJQAJbcclIrXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=but5Gz/d7ZzypAuOv+p6ZO3IDoMrO/vc7stKnbYW4p9uWYOb62jgGrqtIdtVec2fHpIj6zXtIyMwi42tM2h/FCpVjgsscZ98IDI2CaZCYVc9uixEo+8PR/iQrFqQ6FaRWjnIjtiudsil9BLCTgFEvUIEkeBoRze5UDw+l1LQHhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICSQilHx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICSQilHx"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso16270517a12.0
        for <loongarch@lists.linux.dev>; Thu, 02 Jan 2025 04:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735822529; x=1736427329; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXS24HNk/PcPkWyO7/S1209SrdCqek8Xs180xOiisVo=;
        b=ICSQilHx6LrzoO+eQaHc3VpdLB+3koNEmpsB+cNR3ZvMwwyYDYWiHVAjePeRbJgVNy
         h6sdBVt7xwrkw7hp3HtAfDFmaBK/1oKLWk56W73xlE0ftZ65Soso1bdl5S2jOGFqlad0
         kGMcSib7oxdvzWx8duNPeAXtjXyki+19sLxoHY98Aql4nhjf0749lvMWOrducSHmmK4a
         Quhhpv0bDKuLo+hjJdSSODbgdbE2XukISdACm9f8YQ21NXoq6y3WyEV8TUS9MFLO7MH0
         4TCliYM4E/pzEMXiUQZfnbpq5naWaHcGRkgmD+Yil8Qa9e1LRsGhxDEqPGdC/UkoS0T7
         kTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735822529; x=1736427329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXS24HNk/PcPkWyO7/S1209SrdCqek8Xs180xOiisVo=;
        b=eKlRd6p699PI4bpA5tYsrbTwB2UHcKTGfB9S7n0GsiCRA0bkDwn7xeBs8p/E/ay40t
         C5WG/ad9eK7eICo/ASS1iH+QuiRi6Igk2WNFxE4Fg4BUAj8u9mhpBGlGNwtUK8bm4dPD
         +ZkYVRKkT3cDQpCs+eQblNYCURnWvrZXkY+dhh4fwqvIScLuBp5dVJTyXIUwHc9YkdCQ
         KhLI4jD8eA2J+YMKe5ObtIADvGnrFVYm8jsAaAQ4GysckX59oOXn3amEABRYOpU+c+jC
         C7K/kI5ypp8w2bTklQVYnn2fJqGsawcq6Q41b8gK1lMPDoa8CXojd0MxEKbtgAdfIUsr
         m4sA==
X-Forwarded-Encrypted: i=1; AJvYcCV+WTv1VkV5Ti214a/scYcwXEGnpABZDe6kW+OEKskL17nuzAMGmRiF7p7IbZqA1SuOKKMJa/RFVUk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaZN0tIIAywqYP81fH8hKdXPkLMSlAhuYWn3OIq8mJ+WhAUs5T
	y2dbq1fJSOtWMMoHUlz3gVwL5NdDUwQxnaXq0edzfceJwqkaOJgQqNADoIora+tltk0J/2brZ+j
	SUSb9ZQVzue5x6USPHTl1cxcvk7I=
X-Gm-Gg: ASbGncv22AYeveLrTEJMnMvPpH8r5b+mR2Q72JmpUTa3VYmqXfYWTsgSM/0PqcOaF+c
	dHk83UeB1infu7eW51MjyNECKpDqJb7UQRoAu9A==
X-Google-Smtp-Source: AGHT+IGLvuXj+dIrqlUzp0aOb3Z7mz1qVwkY++yurih/6Pd33sBtFEvkwwttWiJ3Nh2EseGJDAQCU7eALZPBZTPzrLo=
X-Received: by 2002:a05:6402:2802:b0:5d3:cff5:635e with SMTP id
 4fb4d7f45d1cf-5d81de065b8mr107382476a12.26.1735822529291; Thu, 02 Jan 2025
 04:55:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1735550269.git.zhoubinbin@loongson.cn> <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
 <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de>
In-Reply-To: <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 2 Jan 2025 20:55:17 +0800
Message-ID: <CAMpQs4JcuRhpOyXHxy0ab+D-Wd0itKdb0GiZdTE59_qEpUfyLA@mail.gmail.com>
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

Thanks for your reply.

On Thu, Jan 2, 2025 at 5:07=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
>
> Am 30.12.24 um 10:31 schrieb Binbin Zhou:
> [...]
> > +
> > +static struct platform_driver ls2kbmc_platform_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "ls2kbmc-framebuffer",
>
> The driver is mostly a copy of simpledrm. Why don't you use
> "simple-framebuffer" for your device name? You could use simpledrm
> directly then.

Ah, indeed, the driver is based on simpledrm.

Initially, I also tried to use simpledrm directly, but it will fail in
drm memory acquire.
Because although we register the driver in platform form, its memory
belongs to pci space and we can see the corresponding pci probe and
resource allocation in Patch-1.
Therefore, we need to use aperture_remove_conflicting_pci_devices().

Also, since we are using BMC display, the display will be disconnected
when BMC reset, at this time we need to push the display data (crtc,
connector, etc.) manually as shown in Patch-4.

Probably it's not the most suitable way to implement it.

>
> Best regards
> Thomas
>
> > +     },
> > +     .probe =3D ls2kbmc_probe,
> > +     .remove =3D ls2kbmc_remove,
> > +};
> > +
> > +module_platform_driver(ls2kbmc_platform_driver);
> > +
> > +MODULE_DESCRIPTION("DRM driver for Loongson-2K BMC");
> > +MODULE_LICENSE("GPL");
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
