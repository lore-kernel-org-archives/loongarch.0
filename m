Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55980154BEA;
	Tue, 24 Sep 2024 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727169562; cv=none; b=rBQzHfJzqkcbS+Nn5wmsVoUTFwQZGTA6DuT87btVtWEj6Aw0CGk2AvaA0OsIfI5zIJyPjbcn3gjpIp8EZn12JtAotbZ+OPHPP3XZjdlYM9xolFFJdd/IsPPU9bie4KPwhTetVMkVlJpiIs8Cjc7J0gzyOPUZy4cs46g3TLTPapU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727169562; c=relaxed/simple;
	bh=6iOYxHvNr/wgmXefsXjNWJsCi0eJkiZ+32MSb7rhrQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+DfjJTLTn5JqWeOcf5YaOPc/uflh0kuF5bEwzmifTrEu4Awzl9G6bw8T8qHAUxSvviKnAatarez4yJmUB5H+mSkrKtRJvqrl6KKVYb9mQEa17N9y1fut7iSOqEHWL76Ha47c+sQ5dQvHDsjttbMVAQqBHca6MltHTHFNKT5j5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFmeIXAY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFmeIXAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3147AC4CEC4;
	Tue, 24 Sep 2024 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169561;
	bh=6iOYxHvNr/wgmXefsXjNWJsCi0eJkiZ+32MSb7rhrQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFmeIXAY8WGXmieCJk1wVJ7A06GDzKitbT0GEiDOnzJP94P9nz6Fg7ZjN/b5WvviV
	 kgnkg9zHNXzA9PECeH0kznvxLdapC/M0zyMqm24HRmwidpTXh3xZzAWiL3BpTyntAP
	 xMqeQ1yB7m1GZmGPTyjSuJCl9NhqLjKXOL9Di/pEFvD6WQIPzwfikS8DLjZWTwmK0w
	 C+9Yt/YqapAjACXMMaoOBFzgGEKmItr02TfBuRG5Rz2r+0ViSxcaJ7rrN0zcoVZ2zH
	 MKX/SfD+o+2Yjt4ePF7sUJBgA1scJRFC9PwGzbv5dGpUPUKa6ym/s3ML1oO+WSS3jn
	 LYwF3WTkr2Xxg==
Date: Tue, 24 Sep 2024 11:19:18 +0200
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuming Fan <shumingf@realtek.com>
Subject: Re: [PATCH v2 5/9] ASoC: loongson: Fix codec detection failure on
 FDT systems
Message-ID: <ZvKEFlARvbFFWI83@finisterre.sirena.org.uk>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
 <9a286537a20f0f96597090f59165b4532e41bdb8.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WRx0WlcwrTnJod4i"
Content-Disposition: inline
In-Reply-To: <9a286537a20f0f96597090f59165b4532e41bdb8.1727056789.git.zhoubinbin@loongson.cn>
X-Cookie: Editing is a rewording activity.


--WRx0WlcwrTnJod4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 03:00:32PM +0800, Binbin Zhou wrote:

> When the Codec is compiled into a module, we can't use
> snd_soc_of_get_dlc() to get the codec dai_name, use
> snd_soc_get_dai_name() instead.

What is the issue with using snd_soc_of_get_dlc()?  Shouldn't we fix the
helper instead?

--WRx0WlcwrTnJod4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbyhBUACgkQJNaLcl1U
h9AF1Qf/S6TCXCVYvTjfPMnqAt9Ckbi7amFA3aouVJV47NCFFu6e54CYy4Pw6xI8
uJyZFDO4ZGSPZxM9K/4iezTElW3VxYNZtqaSViiTSQew2+bzC8cTNjqhd7gWjUY8
LtS/2uZ9ry3ttXK5zfjMDYljGcBgIj89KZkYn2WnRoHG6CO9m6sUcCZpjyJJxYSJ
JZiDWlaG0USGu/n5stJJ/QeN3MHh4tZvepGPDX2reB288F4zLPiVV8FM6atI1ndX
2IIUwnZa2VsvGypQy1imMUDw7QohnFaEjntezYYJEpWJR2bHT7/k04s+dVcHxBnt
oP3ahosEgY+YRXv6wuWDs9CRhKb0HQ==
=VxTZ
-----END PGP SIGNATURE-----

--WRx0WlcwrTnJod4i--
