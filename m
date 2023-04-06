Received: from mail.sf-mail.de (mail.sf-mail.de [116.202.16.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F0AD47
	for <loongarch@lists.linux.dev>; Thu,  6 Apr 2023 19:08:36 +0000 (UTC)
Received: (qmail 22331 invoked from network); 6 Apr 2023 19:08:40 -0000
Received: from unknown ([2001:9e8:6dc6:3c00:76d4:35ff:feb7:be92]:48442 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
	by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
	for <arnd@arndb.de>; Thu, 06 Apr 2023 21:08:40 +0200
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com, gregkh@linuxfoundation.org, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH 12/18] arch/parisc: Implement fb_is_primary_device() under arch/parisc
Date: Thu, 06 Apr 2023 21:08:33 +0200
Message-ID: <5921681.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-13-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de> <20230405150554.30540-13-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4819412.31r3eYUQgx"; micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart4819412.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Date: Thu, 06 Apr 2023 21:08:33 +0200
Message-ID: <5921681.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-13-tzimmermann@suse.de>

Am Mittwoch, 5. April 2023, 17:05:48 CEST schrieb Thomas Zimmermann:
> Move PARISC's implementation of fb_is_primary_device() into the
> architecture directory. This the place of the declaration and
> where other architectures implement this function. No functional
> changes.

> diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/fbdev.c
> new file mode 100644
> index 000000000000..4a0ae08fc75b
> --- /dev/null
> +++ b/arch/parisc/video/fbdev.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
> + * Copyright (C) 2001-2020 Helge Deller <deller@gmx.de>
> + * Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> + */
> +
> +#include <linux/module.h>
> +
> +#include <asm/fb.h>
> +
> +#include <video/sticore.h>
> +
> +int fb_is_primary_device(struct fb_info *info)
> +{

Looking at this makes me wonder why the argument to all of these functions 
isn't const? Not your fault, but could be a candidate for patch #19?

Eike
--nextPart4819412.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCZC8YsQAKCRBcpIk+abn8
TroxAKCInC1+nDFT2zUZ2BABKO6rWJJXygCfXz1dtt8vvCEpTBZxHF+hSbDdIVk=
=5z1v
-----END PGP SIGNATURE-----

--nextPart4819412.31r3eYUQgx--



