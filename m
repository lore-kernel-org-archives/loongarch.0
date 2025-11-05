Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3031C56F
	for <loongarch@lists.linux.dev>; Wed,  5 Nov 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762361528; cv=none; b=OMOh1MOksu4Gqut7gYsxM2661FXMft0Z5nVjT+tWUiIhuGFSIUXDW0NWY92rLwEzKLfJ0cuvp1QE2sPLALoKUIDBSH7JDG6FU3JjKqbRAZz1JBnaSZbFJJetCpYoJ2nLmlcaFTiHEvS47PI7Lotn3eSmTNJb3TuiASxXnfmOT4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762361528; c=relaxed/simple;
	bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyeKl4OcXLTTlSF6tDqKqvh+yzC2k5tJl5ibIt65SHk/1KPWC00ROqfJY5QaiiM0nMiGamGxwu5UIgunL2ghFAdm4WbSVAywxrmUSNWKOvhNXz+nQqr4KFfhOlyDTSu0vtP2V7ts9RIoLRwetJQUhVifkQwze3ccAyUkfmez6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKq8sZPs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKq8sZPs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47755a7652eso173175e9.0
        for <loongarch@lists.linux.dev>; Wed, 05 Nov 2025 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762361524; x=1762966324; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
        b=MKq8sZPsyfDsK44WrhPceLVcVyH18owbBmPl5DSBbpVGJBCwSbpRdzJWqz5A3hL9o0
         3UrXqQ/ki/AUXKZSdmOCTmb1xUiDSBLvRSGKQz+9T3AM9+qLtPw9KT9SR9XcgLTOlsxo
         IdJ5VelFtaDCrf888br5WSqCRBoyCOnp+WUen6dYniMmBqpr4wdm5mzfi3xip2JbvuLx
         cGd2vu9tNLMZJpjzHDQ3wwh/eNVtDrzDKTN24h7Rk5ejfhuqkxXUw8p6C7MPaNiQZL/m
         waQiHUvjJ6CLhaES54FIKCJ4fMoqC7D6Hp/4VZqpBdu+rEwo+myFfvQdtLmSg5Z898VN
         l1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361524; x=1762966324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
        b=fTB4JMPzoKNRoeGpO6AaWEAqZwVv+BEL2bsm5gym/9L6otKgCn/aeddJ+SckfV9V/2
         G2snM1HP4a+ZoKrPp4Ibxl7TxA+nn6S8h9pI0Stch49MIlnl8Ij3GYcKjuxtpo4mc9B2
         aP5ZECkcteBwJcdHixL02vZs1Kcdkmwo7d4TvuBPIwpAev/5cldzikNv7qcgTJDD7wn8
         FqtYJoS2j9W3Mem6lTsWEZl3RQlSAveaN8tpOjlGY/uBgtan/xzUipjJgu+D66ScOPMv
         rxCee9q8l3jGR9IE+2ow0PJ5TP7iBF396kYZQRRAW6mFWgyE8Dw8Poyldlmyib/Cy69/
         iI3w==
X-Forwarded-Encrypted: i=1; AJvYcCXqtiirhe6s7P03jD+oLHf5i2TAzjxoUFwAvaYT/rQq2MKOjs1oUujlkSHpBawsdZCij1me1SxUCXc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1nye9BB7IzLrvDbm+52aM2xzBugg2PKYPK+SzUcbWZURY+CA3
	COvfeRVz+topMn2XuFTXGonnUQPKSWsaEezaA1WbAzwLpROSjgViUgiH
X-Gm-Gg: ASbGncvVTZ+CtlmTo6wegvJ0pHTw2fKJtLLSgrOcMGSYDQ3mCmF3vhR+J0s6debLp3t
	Z2HAw57pyxhLeFinQTjVVelfw+VtJlSAjuNFUKGlTVm+TmvAHNqHRH3kkyoYzy6Oeg7yW7vIhPm
	gQSH51y+NE0YrEkrndD80SDkt9S18gdHa51HMqBzU4EhH6smuvWLXMeciKft03/frSeuFoPHjlw
	tx7pjI/cXsXK0Q8tfUE1QGhz75ft4iGj2McMqBox5A3U7rFzb7Mn6glLCOrEt7upxLbQMWoQrVD
	x6DNEnJmj4a+V1KMLRKDUNHMOhxDmDH0OLth/xq42+d+qADO5HYjNHF3EkjsQg6aTHGexapADuJ
	deFpnq+11S20E0y+Du6NSooNLxzUt69AaCDIsevu2ZBr6UyN7LrQWLiIKMGHjpiVUjagzR7nTwc
	e1gzloxW/8lY5XX/RVb0eu4sVCIT5mpZKzbkdqYhbN2NZLpcXcoYXu02vHzmCjLBk=
X-Google-Smtp-Source: AGHT+IF1eT04urNHEfsD9kdCj32CNL1YcHJ6oGuMVK3cU2BLT/aQRFRmm7ox5OYZe77ML31HK9v5ow==
X-Received: by 2002:a05:600c:1c94:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4775ce23efemr42468465e9.17.1762361524090;
        Wed, 05 Nov 2025 08:52:04 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce210a7sm59725725e9.12.2025.11.05.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:52:02 -0800 (PST)
Date: Wed, 5 Nov 2025 17:52:01 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
Message-ID: <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com>
 <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ykyajizgfjgayrmb"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>


--ykyajizgfjgayrmb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Several drivers can benefit from registering per-instance data along
> > with the syscore operations. To achieve this, move the modifiable fields
> > out of the syscore_ops structure and into a separate struct syscore that
> > can be registered with the framework. Add a void * driver data field for
> > drivers to store contextual data that will be passed to the syscore ops.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> This change is fine with me, so I can apply it unless somebody has any
> specific heartburn related to it (Greg?), but in case you want to
> route it differently
>=20
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

I have a few follow-up patches for the Tegra PMC driver that depend on
this. 6.19 is what I was targetting, so if we could put this into a
stable branch that'd be the best solution. I can set that up via the
Tegra tree if you and Greg are okay with it.

If that's all too complicated, I can probably wait until the next cycle
to merge the PMC changes.

Thierry

--ykyajizgfjgayrmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkLgLAACgkQ3SOs138+
s6F0Lg//dTn1/PUCYHRhF8cm1xB6JKggiLC40TRct49fcf9eF5gAdCqXm44qKoaF
67aqiXAiwzovTctJIu3rz8p71/FeXp/qGWDdPm/+wI7yD+BoCcVO0nmvXuPwCzhd
ZMwqeaRVm57JX4M9S5BdkOGtDLgAjyZ/6Qq/2isiQSPiWWl/IT3YiLyzw8vq8mcY
VoepQGK5hm7CHFf8FOBs+sMt6q5JJDm0VjNi+seVcCNg9U25GaXCRc2D9ztAqRib
3768/KMhlftnoJKsizCwWq2Gyw0Se7ifz66djjf51sHd064LLDv7OZpfeGyiFK01
MvVGXoPFuIJB0yqIoMRBbeRULm4kq+dkUkt1JWwYAMw9ZJnhXPJJI8bal2IASj8/
E6NADiYd9HS8kAXWYvLkm0xHv4FN5WXWG2a+Gf6K2vpBm07zG2xnI+eVjYQSnb9W
O9TcZf3jDWvgEQ31plH5JFY32sI4vjLAdcKS2oRfkbxFDJvTS+RRjj3EPqFshNXf
B5E6pXTCltOkUepuhbGDzIifVWzYgg/GyXNfwzdnJUXcAz7QPPJySfMraf/dn+8S
hggVgAivRFDEtaNEqKU6iqoePR3HIUJe/Ebjrb199RV9t4FcnVYOpviJRf5EWpsF
2YEUJPiA7neiac9fPLwCoRh33bJTIzanmWVxmFF1nQ2vozIt68U=
=3Mmd
-----END PGP SIGNATURE-----

--ykyajizgfjgayrmb--
