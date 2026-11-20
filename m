Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173952;
	b=sKJEEPpZZP4S0xg9mXJ+lv5pMnFtEPU2vDBTPMrvV8zYuhBsPEkJZLHIwixcD11YZ44e
	 F1SNPSyNV1JJsZFBh20tdwgmqZYTpWp25e5fcjW21mqbhqufG9nY6eHdmLKrGc2zehHJV
	 7bXvEXafgyv13l0ALrSt1CkBXTwP+nfgV6Ez/eQGlA1FKTP7unXPqbZsFu0XMI3G3d3Pa
	 HB3GJewpS9DGjLzOA5BGQQDKeWWrJkJZ4nV7VfBWXEphcuIxDuVRvEyGGJx7mZjsKbRpd
	 dhPj7RCPLa4V867SDLXCAPh1yAZvIYMVTgvTY9A3w0GgCTEuAStyFGV4Ruf9cFG2AIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NcV0t79NYJ/mK1aZ8pQRTmJ9otnohMh+O0hfCgV3Lfg=;
	b=OyrMrK2nAw+2MJR3Q2VENBgQXnOww51bdkejrB3LxYnvVCMjJi3ycfCVLPSXfNwcUp25
	 LizLns8jr3n8HeEhBZU/Dzda91QBYqjWmUu4Re8Ru9lzBpQVprvI2MR5TiZQOgyoLMZ6t
	 wNhIVfahk9j36tym1XDoCmGPaIRQ72DMfHYGq3f8RgL06eYRdfyTqqLmlj8Sk3NBXaeCH
	 8W4PzE1jpYCpP9Aw7fQR7f5sjfLKNWB6s30CiscmdipmxL427WEwpwEuKuT5c5rEAq5D4
	 9gduVp4oTXc8prjYsFw6ajaF9LsphlNeStz412XYiyCjtR8177L6k+hwkRgglrIE9Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y0V+TLXj;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E754460A2614
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 11:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E754460A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y0V+TLXj
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso4274225e9.0
        for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 03:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173950; x=1795778750; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcV0t79NYJ/mK1aZ8pQRTmJ9otnohMh+O0hfCgV3Lfg=;
        b=Y0V+TLXjlp75FnnJZMxIby6JbWtMKirQrsgJqX3h4UsK5yD8S5WKe/AnXN/0friWp6
         n/Mrm2Tygc/AQtcUJkD5IkSr1ZV+KjZUoKLgHwfrrm1Nz56s6TiSSesBBH3GjLHul3vJ
         jJXTyHcOyOexijUIDjjjJC/IvxcL76L/+wy8BuzxxlDmpRSfa6ptW9yX0odbd67aBSD8
         T5mWvMJJ4ZM+Q98mv2pjF22I/ZSKA3j4rLWv7059un643zf8yBlQnR88JGeojx0IWtqq
         3KE0KBFkOKepaEw4+e6UT9RcIH0M1LQAhKWhYuan6/qBMvZ+krJR+yMVn87Lqm511/XB
         dGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173950; x=1795778750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcV0t79NYJ/mK1aZ8pQRTmJ9otnohMh+O0hfCgV3Lfg=;
        b=GlXzKJGagwHcyzdcBabjxiepBO459FbW3pHBCk/IQwM05mgLJ3dtanB/CiqOdxzO5K
         YTeYdf1GTkICM/eiTWbN/o4kfXBDWYiK5TQ2XIjJJrHbCihKDMUVnzSMMP+KgGvqSvMe
         UBo0cn3qVg2m7Z84N1BiRMp4BlEc3vSinMOKedwTvDEQXZeJbHZWtSt8mFvASbhbGO7X
         p1miZHdeQfypXxKdER1sHcFlixb4QvVwO0hJqAbHUig6dg/bRF0SsIMft2RjgYRSVtel
         008IoMMbJdY6+T6KiqhfdXetv5OcJkXwWmbPkuTAL7xUaq+LQEnlfcOatRZH/wH7QmPV
         QZOA==
X-Forwarded-Encrypted: i=1; AL+hErGgy5tWhx3t3Nno899ycz4O6BisNw1lCdi6RZgGjVJ8Bs9o9w+62wxEigIzq/XvxD4+AKLofJ7L5OI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+e5tE0NGdnYfbO4Ty09vcVRctZO+0Dsb9RBeioka6twnoVm/Ad
	ZpHhKg7kJNLcvWGUqhBw+zVXUaj89LeUQ1ojN7HAhPj4xofJr+CpsaB14d8U+CR/lYQ=
X-Gm-Gg: AYBFou3S8Qbl50rZnwpDQnFGmXh838pCDORJGZNuxhRQ8lUbPyJsVjioQ00iMRhaPv5
	TbDMfE8thHED6Sx+dAkGq/ugAuA/n1oYHNBvoEXkHuTifkvk3dqy9RxdbIhSQNB++Rsl9qqKZ08
	z8U60JaGSSjNImgp3kSJy6sPaWbmML9fposHQ0m80ADFQ3ViGMcRK5IfzCQaQnJ3cW+psRMYGro
	MqzyMfwqHY6gnif7C99rsepqVHeM/C8bjbja68g61zJiTd2p2fVgwnBAzJTjn5EzCfD4QGyDDAz
	KlD/zZjAkHuuelB3KAq+2bUWHJIsUxBo9rEARKWxAyGj71QJQWiiLhzMZc9iQISDOsdVnmjvm2u
	9/eVNFZQ/12d4skza3SfYCQfSXqHnCwVgjORvpNx2Itg2vduOJYW9m9jhG8rqeyTKfrdu3xKfLu
	DrfTKKAoi3qV5o81QHJrklWXHXruF8jfJ9eOGk8YzejFLWoXuy7gmn8eSwCn3qJVHA19so/aXUn
	31jz/4FvHiHFewJpNJjBUzQCXRWrLQOfTV3opuGQ+UzIxRqmWpD/6+xkKRWRKn7ylyrlM0dYNNc
	dYPk5tCZ1mZ0ezJ24rH4JoajVMxebZZACaZ3rvT2kUKCVEMNELDizbDYWyWNL1WnH2XeK8DHYU0
	Mr6PjCHAnm4/anjGP
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr56451745e9.11.1795173950208;
        Fri, 20 Nov 2026 03:25:50 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884b8429sm117437835e9.14.2026.11.20.03.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:25:49 -0800 (PST)
Date: Fri, 20 Nov 2026 12:25:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nicolas Schier <n.schier@fritz.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-kbuild@vger.kernel.org, linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"kernelci.org bot" <bot@kernelci.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH 2/2] devicetable-offsets: Get struct cpu_feature from a
 device-id header
Message-ID: <awAtvSIQeLJq2hvF@monoceros>
References: <179424040477.1704532.18231793404479518924.b4-ty@b4>
 <av8Uv7EV3sLqUBfr@derry.ads.avm.de>
 <20261119194738.GC875856@ax162>
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
	protocol="application/pgp-signature"; boundary="tv3l72rardngbokt"
Content-Disposition: inline
In-Reply-To: <20261119194738.GC875856@ax162>


--tv3l72rardngbokt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] devicetable-offsets: Get struct cpu_feature from a
 device-id header
MIME-Version: 1.0

Hello,

On Thu, Nov 19, 2026 at 12:47:38PM -0700, Nathan Chancellor wrote:
> On Thu, Nov 19, 2026 at 04:24:47PM +0100, Nicolas Schier wrote:
> > So my questions:
> >=20
> >  * Shall we keep it the way it is to keep the original patch order
> >    (bisect might fail on the two commits before this patch)?
> >=20
> >  * Or shall the patch be moved before Uwe's (removing the 'Fixes' tag,
> >    and rewriting the commit msg)?
> >=20
> > I am in favor of the latter.  Are there any objections?
> >=20
> >=20
> > [1]: https://git.kernel.org/kbuild/c/f1dc66c38b7eb4b2fb946a2fd6929250ec=
d2d85a
> > [2]: https://patch.msgid.link/bc9fbf5784f6788e10c749a05d56c42bdb68f3d9.=
1792144769.git.u.kleine-koenig@baylibre.com
>=20
> If history is already being rewritten, I believe it is always good to
> fix potential bisection issues like this. Rewriting the commit message
> (and maybe some of the diff?) and placing it in an order such that the
> build cannot break sounds great to me (but others are free to disagree).

Full ack. I think the danger to hit that point during bisection is
small, but I like the 2nd option as this reduces the small chance to 0
in that case that people yell at me :-)

So from my side: go!

Best regards
Uwe

--tv3l72rardngbokt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsALjoACgkQj4D7WH0S
/k4lAAgAru4huUD6XgX/xEc0md/r2uTYSHfAeG9y3GIzcVC+zkGIzmFUEZ2+X4HN
rc4d07ok+2mGRZ9v9k7dO2SUzjDaoahlVqRd5ldtCwi2b03QrEfGe2Bkte8IiCCM
0vWjLcJWss62UN3gAxmKMHIxKvKcYFle+LjAYqi8dWM+YPc2SXS0gqmTZISLjEXN
HHeBGqcecdsyrFtzxYnMLvmdJ9vefsQNNlLcyy6V/EUtnk2yt1k5ZwXozAUEojXQ
OhiuLXypzkqUPvCXOQKtrqveg6g0hxnDtqlFTZfptssoqxNVMwLsN52Nsic5nzT2
9LO+HiyUPz5SPNVTac2QsyHue4WN2g==
=RzUQ
-----END PGP SIGNATURE-----

--tv3l72rardngbokt--
