Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE626AE6;
	Thu, 26 Sep 2024 07:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336719; cv=none; b=Obb3PIXZlRIAaj9X2gz+vwumBxrXes9+P/BNUm2mMPQlM39xYuqOShNwL5VFHz9W6KJPZd1X77Acgtgn0oyX29eGImG1H4aeftnrYHVpZ0piwpo907aAbcAmD0D1oi4cCZROPxv6bB6GaVKGBS7P9bJk3vXeDeOQ1GWdTYinf9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336719; c=relaxed/simple;
	bh=zEygzE3uA1/0tN/CB0hrUGD6Y1p/syH0CkduZxunS0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrMuNQHxcM+BYGBVCKIjfMuGodClhWUqKtTs+Zlm5Hyrh81NDV8R8K6JVkwKSnaRIutePg+9NUeEfffgkILWpXBgGLSPwA/uX48+nVWWIwSr/INTu0/c9UaWxGUAY9XApRmNqpU2kg6grlJEN/yrsK4EPUAgRKnYKw/49FemHRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0Dj2pzZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0Dj2pzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302C9C4CEC5;
	Thu, 26 Sep 2024 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727336718;
	bh=zEygzE3uA1/0tN/CB0hrUGD6Y1p/syH0CkduZxunS0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0Dj2pzZenpSKPcFr6+mI9hhXamDuh71iN7XxzjT9/gxEaxSF9ObF7Zm4lRIRTUsZ
	 cTgwwPPu/NUVnLehU8X8A628WegD9iS5UIEcij0UmIlDyPyI0ZAqtYG0uG/mdP+CJD
	 l1HD7T9rVk53we/OLE6kt1NPbK3IWiZKZ3bQYuJiJNx4WP9EuMS3W2QDDqT3CAgX+N
	 9Wer/i1BdOjOOTHnbGmVbNrasvXzE2Xj6NNJXvikru0sSjp7NWWsH1mVsMjGf1VN08
	 2fEjNpV+TGPROCtBGyXf8CgKWzciAgo8v6yhhPo+MW/4AEgRzlkZ3e0KVcrTD6K8eC
	 iK22o6v2xf/CA==
Date: Thu, 26 Sep 2024 09:45:15 +0200
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
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
Subject: Re: [PATCH v2 7/9] ASoC: loongson: Add I2S controller driver as
 platform device
Message-ID: <ZvURC1KniEo67XKl@finisterre.sirena.org.uk>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
 <fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin@loongson.cn>
 <ZvKDBc2Kohx9kPfQ@finisterre.sirena.org.uk>
 <CAMpQs4+xP7wMSm4wgE97hnbmrS5oVtQTQWXNLvK=O+SkeZnEsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SykdphlLbpH6Dfa4"
Content-Disposition: inline
In-Reply-To: <CAMpQs4+xP7wMSm4wgE97hnbmrS5oVtQTQWXNLvK=O+SkeZnEsw@mail.gmail.com>
X-Cookie: Editing is a rewording activity.


--SykdphlLbpH6Dfa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 26, 2024 at 08:03:55AM +0600, Binbin Zhou wrote:

> I will rewrite the dependency between the card and the DAI driver, as follows:

> config SND_SOC_LOONGSON_CARD
>         tristate "Loongson Sound Card Driver"
>         depends on LOONGARCH || COMPILE_TEST
>         select SND_SOC_LOONGSON_I2S_PCI if PCI
>         select SND_SOC_LOONGSON_I2S_PLATFORM if OF

> config SND_SOC_LOONGSON_I2S_PCI
>         tristate "Loongson I2S-PCI Device Driver"
>         select REGMAP_MMIO

> config SND_SOC_LOONGSON_I2S_PLATFORM
>         tristate "Loongson I2S controller as platform device"
>         select REGMAP_MMIO
>         select SND_SOC_GENERIC_DMAENGINE_PCM

That looks good apart from the PCI and platform drivers should probably
also have a

	depends on LOONGARCH || COMPILE_TEST

so they're not shown on architectures where they can't be used unless
doing testing.

--SykdphlLbpH6Dfa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb1EQgACgkQJNaLcl1U
h9BjRwgAgmps6+rtBol4iV87F4Kx1Qzr5NxpkR+TJQ8UTCHyONCU3MkAYFjBr4Fb
BiENGJNzcdS5iM+SnMIgwvP/2hMZl7Zf2iQHNjbBq28r3Z/evuEhMbC0HYiiDqfC
ga/weXC6oOsb8xjr+gkpVfVhcVk6u6lYKPqaSDTnVQ+Y/kjY6E+DCt2sRiLbMaPb
JtUPvmms/ATAd2gcltjPKdMvXxn2QPZAenOJZ73UqpZUKaRduwAK9LbE24cxvPCw
tTDEcONvLIEdBUYu3AHsDMdlC8l9wGeyVdCDpBtIscfzMdv9LRvJjL8VeTO9d+RY
AxJ3PpX7+be/bId5NlHTWbVw41Cpsw==
=d23C
-----END PGP SIGNATURE-----

--SykdphlLbpH6Dfa4--
