Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239826;
	b=1N3IWtgez9hGx3X76yuOSNhz5JMN6IWjEpGoBEhYX9jnaZmjiqffiYVSO7izOh8wsQ9R
	 xH5yus/03/aw9M1gctfSFuYilgtYXrXIusCfdMU+jHrbmZdNwhLELDx1ajltz+cMdQ711
	 ShoiriG6Tl5uo9oCaYSr4SgmQmMR1QqWWWNyyc/L9XImCFtYAMul6hkYyxVet5DuYBili
	 ow/I+J/vuYUeykzcZOj8dDwvxt0flGsrCQbxluvUIsJIWUV46TgbAjNx+Ip1tbHRtzEua
	 e08g6OC4nkAr+j95068U4lCOQMr42mjq97D8hGkVIrAlNP0b3+1rufHInQ0u/EMz9HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pmUFbIi5ELXaVKVermTkfc30pmQFDxvmo4N0D8U5m1Y=;
	b=r034QaqtDtS+3fH+oxHIi7zVxtWq/43F2N3hDZA1qJfoZAiwZ/IqI1Iz2uLbhYaLZDpT
	 7leS3V3budPWoXY0ZUor/BhVDUsPDJwaivDYFPGkgnW11vTCshvJCh7ZACftBQsjrHcUH
	 YL3F53Q22g3qnfs6f3b6cfajU2O+RMqA+pG/zYodt3Bew3R9LBi/QHMPeImS2NoCsqvpX
	 KdAaUPBb3T0o3coqRNfwVPuLfqBYo4/AEQu9G+KSDKOD3X+WqdTGXTRwKFubeXFQZ0eu7
	 2iisTYw35LbGFmYYWa7aAIYkyvHQ4C4EY9lt7hIh+OlvzFYAhhSUijZqge/lz2dsapQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="fMFc/COb";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5586606A331
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 15:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5586606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fMFc/COb
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49318428d98so564119f8f.1
        for <loongarch@lists.linux.dev>; Mon, 09 Nov 2026 07:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794239823; x=1794844623; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmUFbIi5ELXaVKVermTkfc30pmQFDxvmo4N0D8U5m1Y=;
        b=fMFc/CObxSCrd5loJe5am7GgJYeXT4VmOucN8PZKRfzAHcp+sHkjsafSu2rNwS3TK9
         G5AnOj9aPn1+N1CgucCUg4UV3W+EmazHYN4lMle5uZrFORirixd4M3EoM9mHmXlYLXzF
         TjZ/+OA2NFT8waGiSH7zkS54Hlw34xeFMl8SUoUAJhS7qwMuj/SLzGVCXiOF1wubmW0h
         UD5iU7IEizxLf4ofi1Dush60TT9H9Wr0O/7ZzaQ2VwWFHU36Y230UQUFy9yOApUqAvUE
         Qqf6wZLEohRuyXPbY6OcfYlNkqASTKWi3zxrm0b8oq+36+kYc6OrRXrIHu8OmDj3Jh6u
         oHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239823; x=1794844623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmUFbIi5ELXaVKVermTkfc30pmQFDxvmo4N0D8U5m1Y=;
        b=tMeEGgS2acssFEhzyKmLJ2gEUJ6pkaEo82jId2FsRKklJO2VC6127ifgHTOQ2HGe2w
         HbeXdJohIYwejTxiKzKRSlP26fwKPyKspsg+Swk/z1Oc/wW4PF4bSyHGCvJzwXAlyyOx
         oMJHedEbevm/XThnmTCa14h4L/iUe0VEQpX9I1n+hHlGXGdZUt0rCC5tWbglceCMrRLP
         iCSoOu+8Eaj9eO+So/Rxa8vUa3KozJlG3SlBIT8sXx4q7syLKv0Hf4P+Q1wMW5VjZ7fc
         jIdaxLDeMEwIKO2i2vYoMmgC01uXgw9ast0v9TlG+c5qcBd3SqYGBSUersM1nYBm0ULK
         JyoA==
X-Forwarded-Encrypted: i=1; AL+hErEsS7psUyfomvvoCU0uQIFl7DnJdzHpPCmUVc6iKsYpAGAEtmDXEyAIkNStx55uhgT3UD7kLXYSpy8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Sq5vo0PoYSUjwe6QVWSls43dmppI6dSt2xPDwbAUf8jFpTm5q
	JB1Han1CMiKiUzqNGk2JCzOXHWqPQ0aZNKv1gX8cWX82baxVrSxrbXajlx7inECyh60=
X-Gm-Gg: AYBFou0e87wmfJCc8iw55BN5DA4rMmes+W2IyXaOGU42Yq6H1pvdOBov1r6NeOArgN6
	IotaXrzpdXg2LuKv3OFL/WYMaVEi5cdUgwTrcm5aDpCXefa2lY16SWutvKjTIxrkmkVdyNjJTV/
	s35GMw54TDTmDyWrjl8S/48mvDij6DImhV6S4o8OhH/E5lX9c1ba4MwyJ8kr7ARXajB7zOxKCgC
	CTDilXMJsDAdFc0YGNo7jVvyq7OL5XhayXh/+IGnLAtUKRzQOaB5EtyCpY2XgoM9RW7l3oPG/y1
	ZfZFFSFGbKfLvQ2lVe63sPIV9wV8DIxhy1YbUcP7zymDy3drSFUbFUcxYYO/+kWi7XQokq0V6OG
	hvaRVlOL7DxQ7eI872xVgicMUbX82fpuhwf7MeQQByKarUNIOwwufS8QJWgJ4PkK/HbMhKD6S9S
	ZFePLTDeX3L4GiEnLSQLArPnNVtXRXfoqOBI4OuPBK0QsAuSR0Eo6+diU1TkM7UMq7fMMVAZdl/
	PLnFf2A3xkNetevaIKcdYluLPLU8sCVVQvR4aE4zDn9Vfit0ELGAAO/Sa3GdIjshvvnpSvEsrzv
	38udSNo6f1Vr3UsMuFhLSQ2bT2sCmxeResaa+UQbAWFlRnIW7lcpXICIF9/damGBOcuX/wtqfzm
	AC9/ifdLehYfIYw==
X-Received: by 2002:a05:6000:2913:b0:48f:bc05:76fc with SMTP id ffacd0b85a97d-4958871da7cmr8465559f8f.11.1794239823132;
        Mon, 09 Nov 2026 07:57:03 -0800 (PST)
Received: from localhost (p200300f65f19a90407b2ef73b14b6bb2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7b2:ef73:b14b:6bb2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-496150c6e90sm9293515f8f.2.2026.11.09.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:57:02 -0800 (PST)
Date: Mon, 9 Nov 2026 16:57:01 +0100
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
Subject: Re: [PATCH 2/2] devicetable-offsets: Get struct cpu_feature from a
 device-id header
Message-ID: <avHrnT-rUMynqyeh@monoceros>
References: <cover.1792144769.git.u.kleine-koenig@baylibre.com>
 <179416565740.60865.16102443399828949110.b4-review@b4>
 <66e4ee9c7f9b4bc48fcee92a94b6bb6d92fe1ad2.1794233316.git.sashal@kernel.org>
 <f610c07f39df15f3e7ebdc63bfcd759ca7a687a8.1794233316.git.sashal@kernel.org>
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
	protocol="application/pgp-signature"; boundary="2fgrweo6pewwby7y"
Content-Disposition: inline
In-Reply-To: <f610c07f39df15f3e7ebdc63bfcd759ca7a687a8.1794233316.git.sashal@kernel.org>


--2fgrweo6pewwby7y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] devicetable-offsets: Get struct cpu_feature from a
 device-id header
MIME-Version: 1.0

On Mon, Nov 09, 2026 at 09:14:41AM -0500, Sasha Levin wrote:
> Since commit cdfdbc11552b ("Move struct cpu_feature to
> <linux/cpufeature.h>"), devicetable-offsets.c includes
> <linux/cpufeature.h>, which includes <asm/cpufeature.h> on architectures
> that select GENERIC_CPU_AUTOPROBE. On loongarch and mips that header
> pulls in <asm/elf.h>, and from there <linux/fs.h> and <linux/mmzone.h>,
> which need <generated/bounds.h>. devicetable-offsets.c is built before
> that header is generated, so even defconfig fails on both:
>=20
>   include/linux/page-flags-layout.h:6:10: fatal error: generated/bounds.h=
: No such file or directory
>=20
> Move struct cpu_feature to <linux/device-id/cpu_feature.h>, next to the
> other device id types, and include that from <linux/cpufeature.h>,
> devicetable-offsets.c and file2alias.c.

I didn't do that before because I didn't have the impression that struct
cpu_feature is a device id type. Seems a bit like a misuse to me, but
=F0=9F=A4=B7.

Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--2fgrweo6pewwby7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrx7UsACgkQj4D7WH0S
/k61Rwf+LVoPzWsK/woGLLlyviU+6CbjuXgKqChzk+2WLkEBD+PwtIXB8AH9dbPn
M6002PBuVjZim21ciWzb4KrFg+A7r8v7VwgqC0guYCC0fmT5saCufWs+mD3K0UNm
v99+XG+Beb0pbOot1KBVbwhXV+bC3Me9emG+M/tnXXHJCQKspmNpEZveIk7dSlWF
YkDj52lX/LcDMa7bDOfNfbEbMOZOoyzvXhBdLN5vonShXeWbBTvbIHDhIBXYUiXe
TPKI4T+X/rK0qjc0N33xYdbPFPxC6JtA0bY19P+H9qXRHfDET9c4m1tBDYI/f4GF
TRJz+4C8sNz42lbj0xNszq4D4wu9LA==
=wmA7
-----END PGP SIGNATURE-----

--2fgrweo6pewwby7y--
