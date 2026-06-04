Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78D12FF164;
	Thu,  4 Jun 2026 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780585005; cv=none; b=DTGx3fjrMy4Gfq1aUJbxZDBBsn/GvE/5Y03KzpLRTdV3M/UU7YsF3IeAZ6fkwOGynVDvedSwto4IRuZFyNneyqpQsmFIzyukt+XmLmUj1BWKbxOi34SwY4/U1H7XrAxaup/9T+JXMV0af2obmNzbODna9DOjfg8BD1QijrTVye4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780585005; c=relaxed/simple;
	bh=gYJdOT+kztrpuCapCf5xchFjzoYlxpQe7ajZ9/2wQBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBsQ8jej1pkZYyCrrPgLCY50k0rd33bZYimIewqI0fIULWOUkqsngGepajfvKLFuIku/Lu18iNFr+lTtV2CAsV20Gnza49nqF5dUSnxkI5biHhq+WqeF/5UdVtJ56c5xwTFv/FpqALd0xPo+jqyLmrXpCSbIXaNIS+02fy2FTsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emuzeQcK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emuzeQcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EB31F00893;
	Thu,  4 Jun 2026 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780585004;
	bh=OC5ga9Pq3Yc77qTP1yNBGCZX4v5ojWcN6A8ss/R+9jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=emuzeQcKdvRxAb2ozoL3pZM02/NmEm1QVBWEbKysWMl1RJoqmITEtQp/3ufMhN8GB
	 Hiv9kh8a3pbZ2wigznzxI2v9LVMfe+xtz7wxtYRGQ1DXLYr4y0qJbfGjOwoIXAQ/JN
	 W7jnzaLNbXVbR9lMApgY4t1x+tr19DhHH4QBsOrAvIjifQDnHdof7GEi5AUHqcaKuW
	 xD9Ah7R5ir9MNLw83dvrsoiz9qMVg4juXwDY/kVIvMc9QpEnS/z/eacAQmb1kJkCWo
	 umOGkVR9rpYeLaZpB2D04/sdOON3ZowJrBj/UI173b5uiBAX4wa9ReXIOts4tey6ko
	 kZ2Io2hzlOxeQ==
Date: Thu, 4 Jun 2026 15:56:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 7/7] ASoC: loongson: Add headphone jack detection and
 DAPM routing
Message-ID: <bae028cd-c77b-4238-8b62-330a1c3c46ed@sirena.org.uk>
References: <cover.1780538113.git.zhoubinbin@loongson.cn>
 <2736a44ee11bcc0bbf282c69e99cb05b12469207.1780538113.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1fBcZ10phzTz2633"
Content-Disposition: inline
In-Reply-To: <2736a44ee11bcc0bbf282c69e99cb05b12469207.1780538113.git.zhoubinbin@loongson.cn>
X-Cookie: Q:	Are we not men?


--1fBcZ10phzTz2633
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 04, 2026 at 10:11:47AM +0800, Binbin Zhou wrote:

> +	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
> +	if (ret)
> +		dev_warn(dev, "Unable to parse routing\n");

The routing is optional in the schema but the helper will return an
error if it's missing AFAICT (the of_property_count_strings() won't find
the property).  I'm wondering if it makes more sense to have the check
for a missing property here or in the helper...

--1fBcZ10phzTz2633
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohkiYACgkQJNaLcl1U
h9Av+wf/dNDmuZb5aUnt96DNgVi/4GoHeiWCbVjokcZTYgHJC4cfLo5m+ans9tDB
WZYiRwYofUevktF714YEHaxM8FR5bInrISPa44WNu8AZrct6XdnptoDJIGd67wWm
a+zgHzQNNfyXTT2QIZJuKFLQ5ruMyfrIbQfU6NS0R8W4JOR+uxTrOlIsCZtCH6mV
/BJCl192+gkZz4mWs3tDjzAewUPIdUHUwDA7ngF8o1Uxv9ai5mK6+k1vsklSLVHN
djlZp66zw84iIk253/ftUQk/FnsvnCqFdlHmbQXyNcoo6xxIGJWc1sOQUTLlEgXV
n2INFGQESYLK3PIkN4gjjiSrRn0opQ==
=gWCa
-----END PGP SIGNATURE-----

--1fBcZ10phzTz2633--
