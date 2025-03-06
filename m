Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A429819E99E;
	Thu,  6 Mar 2025 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288794; cv=none; b=iL+1OnKr3t7zsFyzmKWC4YiKNLflVR5CEj0gI3W3VuGJFoKnlS7MsBtM6W5zD3qahgieJKN2LVNgq6ufDUUfcZVZMi1L+q9sxbHDaMlCtqQagsT2Fi04KOHqfAVGmy/WaJIYlXK6OsAaRiRFGiqwmileeaz9dsTCYZoS3ODsaJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288794; c=relaxed/simple;
	bh=VCSeFIkK2OWdz1dEx4pV+Rw9hAHhlwzqN1Th+gTyRaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ7uI01oIo09hCyrMRnHbOZcZey/eMUFz6PWx++VGCTulPQpiFfx1j6Efofo4qVZ+KuEUFZrwjmwyqG/6a6bPujRtdklxSr+Altm7BTfVp1qZiCWkh061zCpcz4YLS5bEaNPnSMBXCnH1+4KDdTdIgrx4fDsagyz+jsqdftbMgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTqmAXHJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTqmAXHJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bcc85ba13so8458415e9.0;
        Thu, 06 Mar 2025 11:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741288791; x=1741893591; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/eOCz6p5uyWrnGjfkKjBisd5HzVXiT1RDyr/H3ZddfA=;
        b=dTqmAXHJ1qu0AnCnzsEbP9VqluPpUxjYmGfitK+RrQPLAAQgtALEw2sny5EudbVRMg
         TCD5HriangUr8ROPIaST9tO/TYuWieMp9kFvnsx14JfF7bzni8nQDGI268rRvCtL/WpJ
         tW3zjsgDY+KVgwPaj+qlntgvlvt3eEhppb910D4/6ScTZaow7rHpAxH/TWL60SVMY4y4
         6pagJ4mLITeyeB0I6cghFg3PolQQuYcoxm2w8scJ+/0L7ZLL87MzhfR44nW5LQEd2iGL
         h1fUNLoGOtKRgyhcO12+Urhmj3rIO31lV4/Oz6785GGWP5IcDfGSeqJEWIs8j+X0ne34
         GMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288791; x=1741893591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eOCz6p5uyWrnGjfkKjBisd5HzVXiT1RDyr/H3ZddfA=;
        b=KdO7xizJPWYxKASbG/aoa4FuQpvrHK1pEKXc1yh3mxk8zI7CKcndkbJztGEM+EsvYQ
         So6rTBPmC+b1EGf7BEGOKu38RttwTyFHsWr59Tr18wdLIjKIoXi+avey5MZYheDk1nf1
         W6Q1KIdhf24iBD+pulv6n9CWzd6PGaau1/cTtbGHi6hSwggxIEwhW8ly7t2Hg9qSJuJV
         Bl3VjNKl4O00fF1slBHIYj785Y/UyhSADAk6S4O+lnUd0ur1ZI3mUcFqSshuE/RcYLAF
         nK4wD6bb4FYWGSWrEyEpldRAJePzzk6rWnmKHHYvNqtKXOQBA2eJXn0CHVeSINSYpICK
         6GTg==
X-Forwarded-Encrypted: i=1; AJvYcCVI0zVHcRpjWeZaob+MlsZGeyze/TFNVnNDGhdawNI7G+UoCQn0Hl/bnfEelNkfGJhlPLePK+1vvoo=@lists.linux.dev, AJvYcCWbYHljfOxBJGsGOt31euVFz57YS5+BLwlwWiETc4KLoerzmCN4dV5FF5WPW/OpM0Nc3KLb@lists.linux.dev
X-Gm-Message-State: AOJu0YxW6jWlFDKzqlP/w+xBOEbi4XCRB9k1jwUSd8yAAiathSOy0YuL
	CAHZLcGPnKpuXu+C/x1JwnkQkVfFnPKXgmfyyI1pu+qJcfAlbOqK
X-Gm-Gg: ASbGncsHKo75keUQQB0dXtl7FVLI7hCh8FTXtTP/rnHkiqW5SUclzWmvI07NZGkMnHY
	1Kgdtas0Qgp3Ahhxqigu5vWZEfC8Z4qTzTigGlGi86FB4lH60/iiNYdlYe7ZYcOTo9CVUEZ8a8h
	TGWZZn9aREkb50BxlJHEu0lhQCrCLzpHkgeJnX63TT2VpIn2VEe4yxUSUpKfsWXmsjdDDQRmaX5
	hfXiKAFD+BzaX761aPuPTAbVgRFAYlk1VXm6UV2zjzbHX6yMziSoRycbfABx+T0ImUQANrxzv8a
	KQLdVZgewIROSG8RnUBsmlvs0jKqTkfQLWK/F8GWTKQ370kqMA5PvjsxD3FCiLRquRLDIlms/V1
	dscNYDQVINNA5rOpWIkHu0Z2QsIKMUAQ=
X-Google-Smtp-Source: AGHT+IGlEvntMF2i7X6Axx8OQDb9BYfoARMqUag9hgvpN2gkfNJBXg+ADawzvsmbM+xjKyCC9YlPOA==
X-Received: by 2002:a05:600c:8a8:b0:43b:ca39:a9ca with SMTP id 5b1f17b1804b1-43c5a60e07amr7077505e9.16.1741288790433;
        Thu, 06 Mar 2025 11:19:50 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0461sm30190845e9.4.2025.03.06.11.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:19:49 -0800 (PST)
Date: Thu, 6 Mar 2025 20:19:46 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Celeste Liu <uwu@coelacanthus.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Thierry Reding <treding@nvidia.com>, soc@lists.linux.dev
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
Message-ID: <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zlzxkvnluqa6wgik"
Content-Disposition: inline
In-Reply-To: <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>


--zlzxkvnluqa6wgik
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
MIME-Version: 1.0

On Wed, Jan 15, 2025 at 04:41:23AM +0800, Celeste Liu wrote:
> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> with systemd") said it's because of recommendation from systemd. But
> systemd changed their recommendation later.[1]
>=20
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarch=
y it
> needs an RT budget assigned, otherwise the processes in it will not be ab=
le to
> get RT at all. The problem with RT group scheduling is that it requires t=
he
> budget assigned but there's no way we could assign a default budget, sinc=
e the
> values to assign are both upper and lower time limits, are absolute, and =
need to
> be sum up to < 1 for each individal cgroup. That means we cannot really c=
ome up
> with values that would work by default in the general case.[2]
>=20
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu con=
troller
> can only be enabled when all RT processes are in the root cgroup. But it =
will
> lose the benefits of cgroup v2 if all RT process were placed in the same =
cgroup.
>=20
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn=
't
> support it.
>=20
> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be3=
21c31d5299f69f
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
>=20
> Tested-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> ---
>  arch/arm/configs/bcm2835_defconfig   | 1 -
>  arch/arm/configs/omap2plus_defconfig | 1 -
>  arch/arm/configs/tegra_defconfig     | 1 -
>  3 files changed, 3 deletions(-)

Hi Arnd,

is this something that you could pick up? I think so far only the RISC-V
patch was picked up, but nobody seems to feel responsible for the ARM
patch here.

Thierry

--zlzxkvnluqa6wgik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ9VIACgkQ3SOs138+
s6EV1hAAmmOA9bt5ezD7ZL1JWnDlfosEhXQikLJbSz+gAvX+YGSrCEY9u9RhonZS
bc+6iwnvUoA0HbqdTecbWzifzHz/JqnPCAdrdoQwSspJ3onSZAnRPj1u8NRDv/gy
54LG7uX7qWZhH9OF/MHqQbjHo01dXl8OmaRrAUgUK3h2AgyzJldR0uOaQ+tQ3F4o
iPzt2JxJUBabJUImAV7wivSnMt3pPaGBS6BN203I26wIeGAY8ZuMKJrnQS/4Mmis
5lxuMl8dTaQaJ+WaJeKwRpZgI22JnMKabnDwaQ6nDuLOMY5/KOeAv2DXGZOZ8qRn
8LDhTlnir1RsuEbgf7b/CYHMNnZA4RSY6puetzCaAQ0WSb1ENMSyGcGM0HzZ49ps
6rrPpo+yWldcHVDQzbiiXIs6pWMeVvmNufpR8D/FweKG0gyqZSiDCZXJdEZjYgbu
gYp+qfQ9LiVjK1t2Z/MY0RkvaZBNhNfK29wX+oT4bPbhkV/Sep7wL1w8VCegqV/g
BzXxAu5HjRDRtfMdOzqBh3EGJfT5hmsJyH5nKD7uT5B7a8gYwUjB0pcX8cOJyCI+
oAd9Y7gS3IUWMLLOk7mFGWiIcPcO9so87NoMSlmNnVc/dZPpojNAvu/kcMgnpLSq
0Ss2JFGPVzSn+zgNVsP3A8TK/8JR41YyK/M+QEH18WZuNXQcH5o=
=P21d
-----END PGP SIGNATURE-----

--zlzxkvnluqa6wgik--
