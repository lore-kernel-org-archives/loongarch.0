Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385538837D
	for <loongarch@lists.linux.dev>; Tue,  6 Oct 2026 22:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326397; cv=none; b=TRLsLCSGXnsqv5N2iF0tOvo3Mb5ZLggqshY67GD4EiaKED7zpIWZDcdgpCyYvxjwVbN6L1WIcKTvtbLYCK+lC2UplX0ptgX5jjUrlVoQf5c/go0g1QZbiSlRrQm8sGGc481DrcIPomL0eKQiojQ0nNj1jvCaVgjeV7jSkHB/aVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326397; c=relaxed/simple;
	bh=AdxL2XdONYmbRXYyv/1A1S77fovnRsIOafIkjtja1Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJVZsCqN+/9Is/iUrFGJnrrN/bpNfHxNq/hnpuk0Zwty8h1O0cqoxl4QMo2L3sjcvm5GeUW+znw16nMMKtROAbAq6Leb5Vj9OSKk3e+wGAmtDdKmjykBigSwKm4Xhj+/pw/c/gmNxk+sZssI53N678FGwU5L0pi1lhuOaiGij/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ApQMNk9c; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ApQMNk9c"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so21479415e9.0
        for <loongarch@lists.linux.dev>; Tue, 06 Oct 2026 15:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791326393; x=1791931193; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdxL2XdONYmbRXYyv/1A1S77fovnRsIOafIkjtja1Ys=;
        b=ApQMNk9ccDFRz2lEz/lYyqDd9yyvPFRBBsAQtBCcrmXZg5Pu1U/N770ELw7u0kHCZP
         nKKuoY09Qnne5ex0MMX3VeByrctbmPmCfaAPALZXgG+M9CbMPFIL+Np0gOnCUB/BoMVS
         cm8QYN8jFs5/94rE6Myrwsaia6KiOyQrQWoObPasjIGZBwg4lbYrOJucpbz5QM1ebBLA
         CjCe4vEtPEX7X1EB5vU7kWsZfEgqzdBm0+k4AI51rQoI+wbHB84mazkTHJWa6o32toDo
         P0Yh6Lxm5E3ls/L3QL/74C2xcct/2GZ2Y6CWYZemAFzH0bbDkCt6b/mRddUqNWddlQ5r
         da1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326393; x=1791931193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdxL2XdONYmbRXYyv/1A1S77fovnRsIOafIkjtja1Ys=;
        b=zr/j/FqsAk2lfuLcsj6xCxDPDeLy04v7IQrmydjFFppNen9p2uHdE3yvqF9IvE6rJg
         drYACWkwYHp2UmoH7bHt892KNCJC1qK/cIWvSVgMuJKGiWNaMVSyKdjrZkbJL2VP9f/S
         fJCVJDlHUJmW2jZjBK2EBo4pJVfJmF+2gxTeL+t0Yy5R15O2zUPRos/z6Bpnt0nXJ62v
         0EE3GNytsp8Aq0DWjFQO718A9qeKNwygPD6ktipQLp4PW9vIfgqmJs3AZMxInkawnmuV
         +3xsQuQr7RnDS67Yw6DgtJJSlxtZODBzHA3H6clZj14liHIziPkMDfmi/fqQTqMkQQhe
         PW9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRD+CFzT5cQ8SVrGf/agXYECdylUTApo+TlB/IOQCiatPkjV9rqYn3oX5UZekcy4ThzP+szbPij+g=@lists.linux.dev
X-Gm-Message-State: AFuF++kHI/SrW6fjXkyf0pb4RblDKpKk0fqj9jCXVU4QC7laCfl84V+N
	FFrn8eT90U7gc/3WOqZt7UjSTPZkmDT+VAK0zg4nbA3YVIUO143LURc752GgeXupLjk=
X-Gm-Gg: AYBFou2/G222940XHuAkkDmUr44HxmC8YY2Z5zgtwIcQ2yIolrgBQhsfpc752BPxRss
	H9T7mRwW2KOHCBF436tyInYdGLW7Z87ReBEsyeYpBdlBrPumk2Rj3/sTpld8/kYVU0VhZy5Lqo9
	U6QKtBiOl/GxTwXZAUhFwYQgiQi5poJUycuvbcHLxNn5aeherwKAE1BVrGtAbhygihGUyUdiVSj
	IvRPQXCRlE/QtYAoPeHNXRvVJrwRuBtxaYbQbG7t/qE32Fmhk8+pQpjrv5o8vhMyoVcyYGze0G2
	ftENQpQ723xJdik1yY77yXU00Fbe23RI0GwIYwVdaW6mZKAzsepQwimBLn44KB1Es/IQgdYp0GG
	35VzT8jAPbi5tBwzeSutjZaKEXFpMh89hxTa6+HJSODcbxSzbRRKFf14CydkxKL9X9/ad3RYvdH
	v6YCOVeRNzF9Qcol3/lz5uYrpW3TS1uLePip6wV41XXcgfnQ0cOElHliPLomDJsNnlznIV9g==
X-Received: by 2002:a05:600c:3b9e:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a180660fd4mr3921435e9.27.1791326393614;
        Tue, 06 Oct 2026 15:39:53 -0700 (PDT)
Received: from localhost ([213.151.81.74])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18044c970sm4177245e9.4.2026.10.06.15.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:39:52 -0700 (PDT)
Date: Wed, 7 Oct 2026 00:39:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Raag Jadav <raag.jadav@intel.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>, 
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Alexey Gladkov <legion@kernel.org>, Hasan Basbunar <basbunarhasan@gmail.com>, 
	Hugh Dickins <hughd@google.com>, Armin Wolf <W_Armin@gmx.de>, WANG Xuerui <kernel@xen0n.name>, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v1 0/3] <linux/mod_devicetable.h> deprecation continues
Message-ID: <asV4UKTFRPv4gCUx@monoceros>
References: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
 <179121379654.1159753.4410832336442519712.b4-review@b4>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7j23svchiupmb33"
Content-Disposition: inline
In-Reply-To: <179121379654.1159753.4410832336442519712.b4-review@b4>


--c7j23svchiupmb33
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 0/3] <linux/mod_devicetable.h> deprecation continues
MIME-Version: 1.0

Hello Nathan,

On Mon, Oct 05, 2026 at 05:23:16PM +0200, Nathan Chancellor wrote:
> If you would like this in 7.4-rc1, I am not opposed to sticking your v2
> into -next now but I plan to finalize the Kbuild tree for 7.4 around
> October 15, so we'd only get a week or so of build coverage. If that
> feels like too little, we should defer this until after 7.4-rc1 is out.

I'll look into your build regressions and then I'm happy to get it into
next for 7.5-rc1.

Thanks
Uwe

--c7j23svchiupmb33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrFeLMACgkQj4D7WH0S
/k75zQf/Z9M3Qv+MzXCE+/ArZCIjcf7D1SB/7qYHmlMpHOhpIQCpv43i8PqY8WOv
ulcwbwStLe9f4pjnBVM0/Rm9nby9VZo3bK79LWBMwnwkZORonA2EqgQdsoZdfRp+
rAETMDcFUQ9GUGhN7DAcWMA4xZhjUtso0mWGwtF7ExTFgEpE33GWQUBdTInG2TNI
0u2gVDxfb010LE6jzbHBJLoFNE/8LEPyCVyCCWsoCz+xslpavz8+KA5j3Frpl3Iz
ier5fkw0XOws8piZfouheZOaXqDZ/HcdrhFTBW9mXVnvMLiUaiH05aCOv9h33Etu
n9pm75LVifFbz4hIGjjZonFwBzkLug==
=5U0C
-----END PGP SIGNATURE-----

--c7j23svchiupmb33--
