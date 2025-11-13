Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0002F83AE
	for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 18:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763058766; cv=none; b=a76TFuxcbdMkun3K0l2/x2c53t7sls6/wof7ibzlG3sqN0I0W8gaq56HQPm0hMxEJZ+5iVg8LuXTxbHF/6HGZhYUiDXA6f+9Y0J8DN7gdijUOI6yR9K8lV7z1bxydDmTpmyhwmcSGaEAVxQgTXtgtld9gDN+8eVFd3rR7G5XWJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763058766; c=relaxed/simple;
	bh=lVK6LGrRGW3eaG+V9l1z4aQDY2CjycAA5y0HtlS4sFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAOTZrY99zATu5g9+shSjY2Apeu7zItK2Q7AhvNm2afxC12oy1y5j13A5kR1lar2XJX10cFmb96nUNbUqSJU0O07z/EgXojZqcofp5ewOE8zvbupnIfvBQL7PIBZjUN9rPRLwfCu0HxXYL/ncAp7xV1gHwB1AeEhT12bUIuQDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rfg6rK4n; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rfg6rK4n"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so9082345e9.3
        for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 10:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763058763; x=1763663563; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=Rfg6rK4nG4TLiB4pyWacYxSYK9FM6KyrsYVaql++zeWc44oPwYlQkkeZFB0/x4f4pb
         xTLLF/C1QQBf/P0mnjhYzgp9TE+oYmTTxiwbCHFJtrfHKEo+vMVBcoS+12OdN+tT+xh/
         nC453LCuZsvpT0srOjqFrr0hjq7jjrx/8USNcov+nmimw1uAL0HONcjFpTuPvwLLVAs1
         LQrh9/FubUYXLkfc23YeKtk405y0Q1aGAcwwUr0Y26VNJoTXDtEk2K+aXg4jRHQmhZg4
         RCkGqoqOKPyyPTLEyTHaFyt+2/Jyz8/sUScmrYxHkNdqTMz2/zFBQe1rKcjMXtq4d6BT
         lN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058763; x=1763663563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=ebzAv8ZslBTy3f6H6QAhHAyS0O/a25PuUeo+aQGhkMLmmkg4vhzJfrHnENvo+WjjRz
         EQtwE6XP0/KrayaM7i7X8lAcO3XpHFo5zT/2n4UP7KtmLYrjmyu6DIOijRZlcUlRYPqO
         DMf6YQCzlqOFyoipVfrb/sYPSbFKyQFvq6qxous/XCwegD/O57SOqavcVUyFAdAOomlr
         vVgZU3zO5Z0NbfT/YOZgJtf44nh2C5JhwujnZLBnO6ZA3E7QQ157bnPooWgBtyGE9jFn
         Gwb3IGnJ3cbRt3XRtPJAYMqlvUnYrpfTLmesbj2Hcnh9fxYnY+OLZ9NofcSnZpjaPCo3
         UZuA==
X-Forwarded-Encrypted: i=1; AJvYcCV8RSFb246AKfCyGKXzMzijvrMCUOrn2V+frJMQ79OQ7flAD+k1+6/YlxDzCK2bA3WGCjKgRsiaNxs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEPEp0it9pzggLpC8VNgwHkKxs71BL62zuuoreyZsH2oYD6qIX
	xiv+AAM8yob/HNg6Rgx92wEoruVwIXNcex+DQRl7wT00wtpFfDTNEd+G
X-Gm-Gg: ASbGnct0Nl++3mClOLrNubXYUerpQ8FN6yCB2g6Lam4utSwneqY/J1uK+AWOSNZt1RX
	NKrMTVAKQ8MJ+4eU/4xkmt1R2rvfp4WeoS0YCRR50QGtvFsghF7GGNZ8yag1iysXxmuJ+E7A2Gl
	KbSonUFqmLaY09lmqc/ZiigTksTXZBAcPlDe2i9/9P1vx6pNzwklly9Ec/CNI2bLACqEj8RVfTP
	p28o7rUNDfeYz9kDF/byZ0UzgG9NSef63YscOQArIZTFxPjaQSeQVncbnBbJ+66w0YQDzyPK2wC
	hxpPqYSL4Gf5G9FMwCaSBtxbuGztpwUe9JhWQkoayOPsDzFc5N3elBQ7hnbjvyeHvV6x22V/1B3
	LE0NTV03+uQBeqrpzjfNu1NS98POIZIfd/3GVtCb6jYtHrPxEvxsZN3LxLMz4Y35jeZgTslN+xm
	sDsu2cPD24Ij6vAsZMP7bIhGtM38tEMCktUxVqodqae4f/qrJYjF0jtobctOhl7DsfbVZwqoUeX
	g==
X-Google-Smtp-Source: AGHT+IEUOfl9Mj/MhDnCs6vXeSUiBJWe5OA5hhf/B85epyvDSKEXz8FsTxq8lGXRcYwvA52KNvjEqA==
X-Received: by 2002:a05:600c:3b12:b0:477:67ca:cdbb with SMTP id 5b1f17b1804b1-4778febd327mr4653575e9.36.1763058762895;
        Thu, 13 Nov 2025 10:32:42 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm63595835e9.11.2025.11.13.10.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:32:40 -0800 (PST)
Date: Thu, 13 Nov 2025 19:32:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
Message-ID: <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com>
 <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
 <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7axrx4sqgqvkj2b7"
Content-Disposition: inline
In-Reply-To: <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>


--7axrx4sqgqvkj2b7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Wed, Nov 05, 2025 at 05:52:01PM +0100, Thierry Reding wrote:
> On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> > On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.reding@=
gmail.com> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Several drivers can benefit from registering per-instance data along
> > > with the syscore operations. To achieve this, move the modifiable fie=
lds
> > > out of the syscore_ops structure and into a separate struct syscore t=
hat
> > > can be registered with the framework. Add a void * driver data field =
for
> > > drivers to store contextual data that will be passed to the syscore o=
ps.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > This change is fine with me, so I can apply it unless somebody has any
> > specific heartburn related to it (Greg?), but in case you want to
> > route it differently
> >=20
> > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
>=20
> I have a few follow-up patches for the Tegra PMC driver that depend on
> this. 6.19 is what I was targetting, so if we could put this into a
> stable branch that'd be the best solution. I can set that up via the
> Tegra tree if you and Greg are okay with it.
>=20
> If that's all too complicated, I can probably wait until the next cycle
> to merge the PMC changes.

I've added this single patch to a branch based off of v6.18-rc1 that I
plan to feed into linux-next so it can get some broader exposure.

I can keep that branch stable so it can go through multiple trees if
needed. If anyone's interested, the branch is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/log/?h=3Df=
or-6.19/syscore

Thierry

--7axrx4sqgqvkj2b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkWJEYACgkQ3SOs138+
s6GbLQ/+LcY0n50MLCzG6P3cLlbnizYWB4fd77qBH6YbB2iRPf1TPkFtC1s24QiA
KgZqLzCkJ5rw0Xtvmtzci4gr3GeqsMf/4DM0k3X5WdN/DMat0RTe1rhVuxq0MmGV
7kmy+iB9FW6MgVt4kjeYdEL94ohEKXEUKTS6HTGfPFsonbJjnZdIsv4GVThClyxW
Y3vE0mnoAvxjqtVu57jc/Ihryv5Zz6pYiX9AWhT1ryTG7tmgKuFWW0YgqkFy/Y9O
rneSUrPJCeOBzjgL5oY6mPqTCl5f0VdGMb9S18RK+DKXSCLW7b0nGt4CCN7sEuOo
7Dy1UuUjok1XLs8NYPQ7oDD29Q536WmrUmQMjMm0R3HuqmmD+PDO0/I9QA2cuOvw
V1zUm+XqIlAyZs4lZkJXotqlCEBkPNCv0iIqEraETrCS1RYi/k0eqPF3Yu3oQc5p
58cnaEW28DaJ9+Cy7T4NCu7lsDzDyyL+5n4HQyWGaFkVYU+Wkfh0H1ezo8bP9txU
/Yan3s21OGdjzLMcCT0abiDrFOdN9N6HGOI2/UHnz87jxubwy7HjZ52Fkz3iGATD
uz1HyHzrIav2FWTN0PkENUQpiTQIHTs0znDBKPpTvDkeVbTF5nQuP2S0+bUGxvLR
BBevVnm7dT2dD5WqJbGfhem+DFPn66JVA5SFq9+/bvG0KsOpwpA=
=Jfb5
-----END PGP SIGNATURE-----

--7axrx4sqgqvkj2b7--
