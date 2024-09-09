Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF4219F3;
	Mon,  9 Sep 2024 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725895347; cv=none; b=O5gyQPjIREp/oMyT3i+Tha/oMl2QAAuTAEJU/+aVkipU6i5R4n5cdiatfnxHzUs6w8ZueYPMRlyhbtW4JgTKeormCBYigx6KByKuC4+qHUqBJ9glM1SoMQy9fZltRv+9BYbfLPlXEO/BMS/+MTDtLfeEFehpVLBj3XKksCzf3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725895347; c=relaxed/simple;
	bh=a0m/5gYTMMr3TP9ud5tLv9VqBwaNZswxyqbniOZHCQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkYbfA051u0tCRVs/jxZiPmwyGGVDzBNQ8X7VC/ziD+9zUfDmxROYZUXTEu2LPImbWqviKXlyIU0ZD1AgUXLC230DEezeD+OkDQhZ1ZWh9w/UlFj1fAjBR2EHct8ZsZieLS0pM7sglH9BOdGTxBN6NqCAtUu4Uh09u6bHkCjEu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unt0WybB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unt0WybB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62B4C4CEC5;
	Mon,  9 Sep 2024 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725895346;
	bh=a0m/5gYTMMr3TP9ud5tLv9VqBwaNZswxyqbniOZHCQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unt0WybBK1c56qotLnhdCBv4cNzhVPiyykAsGmY2oCnLTXEW/lNPismYC3lpfObwx
	 XEYuQr9eF/rlsq6EzRVFsWekxpMQDIamMjsdagf7LOLsoDGfVJHWJpEQrodZNDu8Yw
	 Rc1rQUMyHLx3Oj3zqxWFrRL3Pl+nS8yvYU9/9C1T0zHSG2H/0xW6WmW42bci8pNtUK
	 4vyvTr7/ugIsqRkuu79Vh0I2AY/sz2IDjNTROPNoKdnqMwETeTWa/t44aPuRidID6F
	 WS3id3EU3n4PJT2WZrgDva/wXJjFmBYJnUKEonJZy/vJHxqS4/3uvvYRiV/vAq525C
	 fhZ4j9okHJuFw==
Date: Mon, 9 Sep 2024 16:22:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 6/8] ASoC: loongson: Replace if with ternary operator
Message-ID: <cd232028-952e-493b-82a2-aa4814f35444@sirena.org.uk>
References: <cover.1725844530.git.zhoubinbin@loongson.cn>
 <94ec2ac178610f50af4815ef5b719695915bba31.1725844530.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="guOFxhnOqcwoFxkX"
Content-Disposition: inline
In-Reply-To: <94ec2ac178610f50af4815ef5b719695915bba31.1725844530.git.zhoubinbin@loongson.cn>
X-Cookie: Anything is possible, unless it's not.


--guOFxhnOqcwoFxkX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2024 at 03:19:36PM +0800, Binbin Zhou wrote:

> Replace an if statement with a ternary operator, making the code a tiny
> bit shorter.

Please don't, it's shorter but not great for legibility.

--guOFxhnOqcwoFxkX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbfEqwACgkQJNaLcl1U
h9BNtwf/dMNKIiMpkKm3SnU6R4F4rRON+ltP+PGUtZyqQReZaiaYY4FZqPEaM1wH
Q1tSzkHSDSd7V/92ywgXBYwTofalPcK9uAIP72Lt4KWXKnEQEgN45blaTYrxSlZC
6Ew+RzmGDjOnRrX5GforAQ62dIWXMvYV/lkVEAatcANVJEs4PwkZ8UyjC8J8M/jV
6OgJIpo3o8ZxQMg7xkqsGmMWzWEe5FGtH6s+IqcivVD/97AClZocnJ62ujeIAWwL
tAXvn88jcQbHD5AUJS5HrP+je4ZGVC3y13IVfWjl+jm7F5xRihItj+35OB7432Zg
ALWDB/dQNH2NE5YjhymZkg8Wt/A98Q==
=dDfb
-----END PGP SIGNATURE-----

--guOFxhnOqcwoFxkX--
