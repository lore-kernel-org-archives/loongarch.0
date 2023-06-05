Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694381F169
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 15:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708D1C433EF;
	Mon,  5 Jun 2023 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685977619;
	bh=eidswOiIHb6J7g9gZ8YGCj4/t5ooFfmlHRG0/DCt9gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1WqGVNKM0LMprpTuSPW88ttxsQya+6RCSHywsjoqhCt9c0U8etTahbFiEC6fRl/z
	 vf5ygXd303eAmHGnO3775BYbGeLj3HGVeqeS7Bm7PLl6IMJiSYFZOB+8yeuL4XGnw+
	 GB/8G7iZrh5AzEBiWSiciPIu26R5t/QEfayVRJIM08LIGs3RPUJz9P6dYvUveXvjEJ
	 TrMyhTMzCuraxUl851ANQEAyd9bosIc9csPwZCyRMtWtpCdnQ1fI2hDRQLIWIbXwsj
	 rITVGnMABV6X4/drtvOMpvlV3beCXUl6EsatriH3gRVV+EKYJo48qvYje43d5CSfr0
	 LDeHdJQHqLJgQ==
Date: Mon, 5 Jun 2023 16:06:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: YingKun Meng <mengyingkun@loongson.cn>, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Message-ID: <9fb3da48-a20b-4e2f-b84a-733f96126ebe@sirena.org.uk>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <20230605120934.2306548-3-mengyingkun@loongson.cn>
 <118d13ef-a247-cf88-5084-afdebc6b7651@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v/cqJIry2Sg0YIf1"
Content-Disposition: inline
In-Reply-To: <118d13ef-a247-cf88-5084-afdebc6b7651@kernel.org>
X-Cookie: Biggest security gap -- an open mouth.


--v/cqJIry2Sg0YIf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2023 at 04:45:38PM +0200, Krzysztof Kozlowski wrote:
> On 05/06/2023 14:09, YingKun Meng wrote:

> > +title: Loongson generic ASoC audio sound card.

> What is a "generic audio card"? Does it even match hardware? Bindings
> are supposed to describe hardware, which is usually very specific.

The concept of a generic, reusable sound card seems reasonably clear -
there's a bunch of in tree examples already and the idea that we have to
pull together multiple bits of hardware to make a useful sound subsystem
is a known thing.

> Also: Drop full stop. It's a title.

Shouldn't this be checked by the tooling?

--v/cqJIry2Sg0YIf1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR9+g4ACgkQJNaLcl1U
h9BgRgf/UjZGQKyfV2oVwePqSNHH0HwTGYid7NA5rMUyPXEpnfbliL3giOXSCz2x
KzLiuvPawEC9UtkLOs1BRIjKqU8nI9E0I7WgIkr69HhWP9aWxh7ssxmZSUOL4lG7
TqJpq1YNSWQenNPZxu+p/vrJFO/WQMfNk/mhrnYZXDQdMhQV63jvZ7+e3i+lm6/q
KkpoiPKLX/7yu2KQjtGrhqSftdg7H50YGvxx5eC+PqhI/YJK+F29CiiG6X4DJtz1
z6Dzw36EbwyX6BvP8rtcHoW9FhBw/AXXuus91jJqnGxzYRZ1+omUX6jrTytGgAwR
mT9RQweeNJKwgOJIlgdF8OL/e1JD1w==
=Omhv
-----END PGP SIGNATURE-----

--v/cqJIry2Sg0YIf1--
