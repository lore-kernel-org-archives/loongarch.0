Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239329;
	b=o0NPx8tZirBF8kRNdZFKHfGsuxKF+eEVVum7P+NkDFK675GQDsLbLJuIsyYc2dHQ8/Nb
	 4GO9haSvdPWznmj5WEtWuOtJHQN4m5MX3pzJCFtsg/2pCsCXRUq3VGZvik93eJ3ZoDsem
	 Ckw7LnnXmUXAo5YVS6YmLTsi++vHcGpIX2UIEFhqbdFXcB4VOUeRbU2eFnB75S6d3NGMC
	 RdgVzsxE5Hl9IrIsHPpm6Q4lF+4CQ4FKcnYIXFsTqLVCOZDvtPgH6S16aycZAOl6kGurT
	 tlOM9pC962GYFl+EvUkeWMFAZJMcy2ptnE05VvGskV+x+Mw8YHU+5AR8fLn1lhTyzbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mw5sGlo+sYSIwlVNPbD+avONLlNpfVW3zWxwZsVrLa4=;
	b=0KQdBE/PlD+QtEnQfWRDOVhrarOf1eJcLFBGXJIdJT0s2vTPk8vinQXLOi0cQnYnfSP1
	 8h47CRVNf/Gcn+u47jE8+Dg2Rnnyv3O79WhIgoS1a9gcqCFOQczl1d00ssqAalqcVmqzn
	 IDdfVECjsjzkae6kBCT3uU6n5f8jPM/1S7hR66bjhLKzfssL/57Nk/Cnw11e0UjgPoZi5
	 X/3lw5XxgZ0zaFse8UZIyecj/QMxtKKkTUOY6gVVqLq/NBjdhehvZ1C++3c3Zrex0b+uT
	 IMJUupTxWQqjia+cSJe78l0W3px0exWLSzk5MFKuhPXDfxK1bAcFTQEjgdGJ4/LUPUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Aqje9RAy;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8273F606A326
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8273F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Aqje9RAy
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6131465e9.0
        for <loongarch@lists.linux.dev>; Mon, 09 Nov 2026 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794239326; x=1794844126; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mw5sGlo+sYSIwlVNPbD+avONLlNpfVW3zWxwZsVrLa4=;
        b=Aqje9RAyZjDpe/94SGNrY1qf1EfSPD1/wyS0u65Q4HzV+aXW9NP6gqvGLTObIB6487
         tuWi2YJj+WzdacUJwWkyKF8HAFBqn59thipEcjSZpxCSO60PoJiFV+/xdOxPNuEjMA3t
         iVqsWbXLBcKSWmDDbDJY4OJonAVR4l84AW6qVXMFDPhrtBU8beJEF8E2KSz0BJk0GwNa
         J4dfAt0whP6NM3nohFoyjNPJxN+kDrEOW0AVDYmqfwanB3Sbi2RNn5bsIL7QKQisw3aB
         LxIekehGvB8cpAlqWVDMSiXx9Qveh9xhP0XsdKokUbZcuflNyANS4a6gJRvS8XJH35PS
         aqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239326; x=1794844126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mw5sGlo+sYSIwlVNPbD+avONLlNpfVW3zWxwZsVrLa4=;
        b=Qq/Cu4IEdPQS7Ge/NBAqh76tUxDklVgs7nmXzzJRtTMZeMVTubu3q6j/7oWdV34Cge
         wPyUG/GKUMNr+NO3gKKkmlHA1kr5uK/jOSd8xpHxjWp9TO1QU9c067fgsSdGXJYn5MhU
         QAwjL0y20g1374tpWJfTZ4k2i4/RhmpdIokYNhYpeW9PmPv62xaK8PvWlwegGTXhoLdC
         P6OBQ4E6Se2GIPH9snuQ4NGDOoqIPzVKjwwplQarn9WnnlLCuJ//o0lYOhgphxAxzwRQ
         lvxJcX1MFTCRALlldbuRzNgluIjj5jP2LitdOeaTUtuVBWRCo0SmomGAdfxjGCj7mumA
         o1IA==
X-Forwarded-Encrypted: i=1; AL+hErHYHwqfVQwFWZXQy7QyS5HTsBaEgQsxXUsb8CQeWZHHGsq1uF+2wp1AXi+oUUFET/r3AnaU3Uz8kGM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/SVA75qqWHI17dHDFf45bnjQrjyuaF3Roeufr1QwAyWoICX947
	VXYXBh4S64XC+pM6polnW6MBfAlWmJ55qa2qaDK4cl5Co28rWFaRkWTxnKaSiksMhKA=
X-Gm-Gg: AYBFou0GUHU8NloB5i+F6JHCYoePqz9LSpBgW3csh/atMcytiogAn9HdrQ0hsrbrDcB
	eadDj7GNfM8SS5C23BO0opoKKxP2QoD7rcYQsEMugwp4Y5F9yQEUvPcLcep0RwhJlexu5twE1Mc
	jNlAYQLHtngN4me9cnAhF595kNKVC8Evp7TY0VXOGGp6kTXzZNWUv/N/CDQPOFkDGXH2Mb0VIfI
	wRIjWiiPMvDE6xiW3knMUdmftU4Y0ZSs76rKxE4MFedGQRRq7o2E5uNVKJVVbus2WDISK+NaaJC
	N7bczFLx5KUx8jPa28MVxL6kWwsC52IgsJ1O58hrvnFut3Ea8nneMnV+NQ+4fRRWs9rXTAh6xFd
	49/MwIyQPUvtFs8TM6xzhM2v9uHReLHv3xFgkcvsXCtW+oD2CF75bqR3Vg6WReQUJTtv4SJwgHt
	aB2LOwgJ/0F5IcsCF11ZCcCPTTnKWmKC24oh/gNCLCHovEGVHG4CDCh3RlsWCVyYdG5G8imxvwX
	WuYNwc5350n+4lY5FBwpFdg5KRQ8hM8jY+Hg2NmikTyVnoAyd01U6KEUXEVr8t65ub2k98xU7pB
	y5c5LrRD6uBrlOlIOeJWpfF9rk+pM9ry0gxy8R6dw/3OET5693GuP+4gllOQBmjYOYUDtJgHLFj
	P5Ofb7VPC8VneBQ==
X-Received: by 2002:a05:600c:1c02:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4b9633cee71mr101104485e9.8.1794239325803;
        Mon, 09 Nov 2026 07:48:45 -0800 (PST)
Received: from localhost (p200300f65f19a90407b2ef73b14b6bb2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7b2:ef73:b14b:6bb2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b96cd012e1sm136079025e9.8.2026.11.09.07.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:48:45 -0800 (PST)
Date: Mon, 9 Nov 2026 16:48:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-kbuild@vger.kernel.org, linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"kernelci.org bot" <bot@kernelci.org>
Subject: Re: [PATCH 1/2] s390/pkey: Include <linux/device-id/ap.h> for struct
 ap_device_id
Message-ID: <avHpQIREsJRjpD3R@monoceros>
References: <cover.1792144769.git.u.kleine-koenig@baylibre.com>
 <179416565740.60865.16102443399828949110.b4-review@b4>
 <66e4ee9c7f9b4bc48fcee92a94b6bb6d92fe1ad2.1794233316.git.sashal@kernel.org>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u6xfg7yl6qbdwrvq"
Content-Disposition: inline
In-Reply-To: <66e4ee9c7f9b4bc48fcee92a94b6bb6d92fe1ad2.1794233316.git.sashal@kernel.org>


--u6xfg7yl6qbdwrvq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] s390/pkey: Include <linux/device-id/ap.h> for struct
 ap_device_id
MIME-Version: 1.0

On Mon, Nov 09, 2026 at 09:14:40AM -0500, Sasha Levin wrote:
> pkey_cca.c and pkey_ep11.c got struct ap_device_id from
> <linux/mod_devicetable.h> by way of <linux/cpufeature.h>. Commit
> cdfdbc11552b ("Move struct cpu_feature to <linux/cpufeature.h>") dropped
> that include, so s390 defconfig no longer builds:
>=20
>   drivers/s390/crypto/pkey_cca.c:22:28: error: array type has incomplete =
element type 'struct ap_device_id'
>   drivers/s390/crypto/pkey_ep11.c:23:28: error: array type has incomplete=
 element type 'struct ap_device_id'
>=20
> Include the header that defines it, as the other AP drivers do.
>=20
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://d.kernelci.org/i/maestro:7baaa311bc9c30a8ad43f42c24225ab2=
fead866a
> Fixes: cdfdbc11552b ("Move struct cpu_feature to <linux/cpufeature.h>")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/s390/crypto/pkey_cca.c  | 1 +
>  drivers/s390/crypto/pkey_ep11.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/s390/crypto/pkey_cca.c b/drivers/s390/crypto/pkey_cc=
a.c
> index e8dc2f77c137b..f95d61fd5b090 100644
> --- a/drivers/s390/crypto/pkey_cca.c
> +++ b/drivers/s390/crypto/pkey_cca.c
> @@ -10,6 +10,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/cpufeature.h>
> +#include <linux/device-id/ap.h>
> =20
>  #include "zcrypt_ccamisc.h"
>  #include "pkey_base.h"

that makes me wonder why there is an ap MODULE_DEVICE_TABLE in
drivers/s390/crypto/pkey_cca.c while that file doesn't seem to contain a
driver for these device IDs.

> diff --git a/drivers/s390/crypto/pkey_ep11.c b/drivers/s390/crypto/pkey_e=
p11.c
> index f99c19323f3d7..f66fc97ad5adc 100644
> --- a/drivers/s390/crypto/pkey_ep11.c
> +++ b/drivers/s390/crypto/pkey_ep11.c
> @@ -10,6 +10,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/cpufeature.h>
> +#include <linux/device-id/ap.h>
> =20
>  #include "zcrypt_ccamisc.h"
>  #include "zcrypt_ep11misc.h"

Same here.

But anyhow, as a regression fix the change looks fine.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--u6xfg7yl6qbdwrvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrx61kACgkQj4D7WH0S
/k7BLwf+KHOasy6UJ5/4WPYsMNz61VCTi/ApkQtjeGFvJZN8nJOMNkjXZZ2m6o/9
v6sXIzuel/mee5ClAKlKfK7LsU6rkl8v5zvt4AUHd5FZ+bcPr+FTgq89uVV7oQ0d
2k8GO1XQsb5tYu13Aq/aVsDMaP3vIVc7F8mx5MLT/kcA4euiH3PcSxMrKoReU11Y
MvhCmuYJdWtaOMURKdiU4wt8gTnC3cSnwRKxt12D7Sx4QwdOA8kGqfzB8n5as7kf
coKuS3VS6T60nd9cjqG8Iz/zF5HdiGqtjXTKP8FyMD0uPwfgu1b0TsZudm5c1lLX
FvCSeYh/1tP74frJy0yYDBJ+tCWQfA==
=JUgK
-----END PGP SIGNATURE-----

--u6xfg7yl6qbdwrvq--
