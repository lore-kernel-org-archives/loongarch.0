Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728BD14B967;
	Sat,  7 Sep 2024 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725711301; cv=none; b=ituW8XHxPWF8dWzxqkdFOK93yuFRJ5OfwyPRdLDBP5OwgM4/C/Rr/UckM262JbQV8V9X3fi3JRl6qA9xXnOqiPjj7nVuEB1g1DkRA8vXch7Af1LUeMMTioOmsa32O2nto38KbrpypieS55pDdEVITLA3K5ObhPMEtrvC+PeME0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725711301; c=relaxed/simple;
	bh=xWO+HlGp+Ve2s3sZZmNAp1zEuVQsJubnUVeY4rbyAQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gft/6UNqMML9ngtPbpffy2hJho3r8xsbAP7v/IRMtbdi5EytTGUzAsaYKssT7NWL4IwOHh0OhBq8EuKARJcYaiVUvGhDgKYvPJugaUWzMNwObhXiZoN74KRwOHR2ClfOHSDwEgMhjOtJJ5mL69zJDFxWC/EglDQxUmGSmLZZHBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzbfqhg5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzbfqhg5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27697C4CEC2;
	Sat,  7 Sep 2024 12:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725711300;
	bh=xWO+HlGp+Ve2s3sZZmNAp1zEuVQsJubnUVeY4rbyAQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzbfqhg5Z8lxpJsTVPNtuI8sRVjR/PCl3Wuf5//SDZl+W6JLHEj51gZAN0H2vZjh8
	 QpQrOXDYq7ir49iVlIbyhtqbGWRxuiOjZF4Pq/n0JJ9RHXdK/O9tODmOLTADcQ5fJT
	 5ZafgASy/XSj0MOe5mtKgt/mbNYRr62XkkHqLDG1qHqJQFTcJg9xAfIhnL21eRFiH1
	 3/SMY9hJuZfj2hXiRRgSW1PKYEkPdVgcwNhH7cIbGc9iLNdAaVoiny/+lLfO//hjV1
	 QosfG3WWbbZfvwRkNWJhDoxQql/Gv3OjAGrr6L9N7rrRmT6n6Rb11p5ni7TcV58WR0
	 YpwMyjBOWlfdQ==
Date: Sat, 7 Sep 2024 13:14:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
Message-ID: <ZtxDsc9hTiDbKQ0v@finisterre.sirena.org.uk>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
 <76612fdc-996c-4cfd-b5f7-04acb5b717be@sirena.org.uk>
 <CAMpQs4KedjHVK=Y87beuc0M_DadrXWWgcC5ob+wXfdy4XtCdWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E73tOL5tCpfB6UED"
Content-Disposition: inline
In-Reply-To: <CAMpQs4KedjHVK=Y87beuc0M_DadrXWWgcC5ob+wXfdy4XtCdWw@mail.gmail.com>
X-Cookie: Your love life will be... interesting.


--E73tOL5tCpfB6UED
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 07, 2024 at 02:08:08PM +0600, Binbin Zhou wrote:
> On Thu, Sep 5, 2024 at 8:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > Can some of this be shared with the PCI version - is it the same IP in a
> > different wrapper, or is it a new IP?

> To be exact, they are similar, such as the definition of the
> controller registers.
> But for example, DMA data processing is different. In the pci version
> of i2s, the DMA controller is built-in, while the DMA controller here
> is external, using ls2x-apbdma (drivers/dma/ls2x-apb-dma.c)

OK, if all the registers are the same it might be worth trying to share
that code but possibly not with the DMA being split like this.

--E73tOL5tCpfB6UED
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbcQ64ACgkQJNaLcl1U
h9Bi9gf/S56VR8NSVcSfBm4HsSJTfqUcsRL8KbAYJ7wGx7qtMb6TF6UGWzd9+g54
kLRS3ijQBf5yRU01wbAa2ZbrVEqdj3LvXJqBcuUzKI3dR51BQCd5c++vgGtuV4X3
tpHuupcX1fCwq2I071gdWeb7qbjmg8DgwPqAoHqyaUc5BXk5jyK2Sac5dM3sbIcv
C3Uqn61JiGDSDtmjZcLnCD2D3klVv6mJoUybe5Zgu5/j2z9cE+Hwyg4XZ146zwX1
6KzV9HGH/NnjsCIVZxnAzEKqSZQSUX/8CxBAlj0trPYhYpUQoCVPhQ+LWLZjCOzI
vHLmZ06fTPK84rWNfttMzKRfOEjXTw==
=cZxO
-----END PGP SIGNATURE-----

--E73tOL5tCpfB6UED--
