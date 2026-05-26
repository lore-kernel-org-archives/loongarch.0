Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C513B0AFA;
	Tue, 26 May 2026 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816976; cv=none; b=YULpa5IsKfZS3UBTiqxiBacLzwn5EFgxPQoJa/HRtiuwLNOv2DcG4hkBG2Gc04NXJRngEzwaH6q9RpFlIxlufRPUaSjx3dCJOqrXpV0UzgB/Ct/tdTs88sS2YimCK4ju4IDwdWZrxixonlpIbMR7tavah+1eVip5FjaOAxC8v0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816976; c=relaxed/simple;
	bh=PBr4DGwMUgDqxCqFEEu/8cc7jeIP2GXoSgHHG9KjuSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1ct6lYOxWUiefB+idxTtpx8GN9pi8qVKsZjUFNMEhCa/2vmjjUkzQzbpKBFiycI15Bnow+EZLA3WFT/f3Mek71rClvF1akJb1U7TlOxOL7FH6qmOAhTRaRnb+deLmWqS0jWkqSMQCYPYReA9Zj/GvGATP2fniOaMDb8B7tE/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKYxgi2y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKYxgi2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CD81F000E9;
	Tue, 26 May 2026 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779816975;
	bh=IvRL+r3Zx7UNMesELbYvDtOy9v2Dbg3TNLP7P8anjPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eKYxgi2yrecV/KGkke/5U0XxHq+SP2CPrgy5+6/KmgCedfUqa9SbayK2/mFOlRx/L
	 sr72RLoQVZPqe3uHse8JgG7ss8jR5kus09Kt/UMgxZncum1ne9NwSjt5o3nKoO6+p0
	 hmdNUKGRDyNSEGnRCNAbspsHGCroJk2PyiNgj2YHCxy671hNW3zMxQfRN2whLNpuXt
	 SdoeTImyNC2NG8iaZx5A74ewiMkQKuwrgtw91lQaQiKMe0rIQ9CWvuBNy6ZIrr/Fnf
	 Uw4DSL+wGmFAb9LPqSxjSYolifmRdM/54fjdZH8h7twnoNZGMnqAIVVJexwH9f7ePG
	 MAKON7diefNjQ==
Date: Tue, 26 May 2026 18:36:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 5/5] ASoC: codecs: es8323: Adjust the initialization
 of certain registers
Message-ID: <45a5b690-e7ff-454b-9120-1eb906bdd0a2@sirena.org.uk>
References: <cover.1779796354.git.zhoubinbin@loongson.cn>
 <738268f7409fafdb65cd25214114fbde4d7e25c5.1779796354.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g4zeHAPmz0HSRMll"
Content-Disposition: inline
In-Reply-To: <738268f7409fafdb65cd25214114fbde4d7e25c5.1779796354.git.zhoubinbin@loongson.cn>
X-Cookie: You are fairminded, just and loving.


--g4zeHAPmz0HSRMll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 07:56:26PM +0800, Binbin Zhou wrote:
> A few additional register initializations are required for proper
> operation.

> - During hw_params, write ES8323_DACPOWER (0x3c) to ensure DAC power
>   is correctly configured for the selected sample rate.

Is it just a write that's needed (even if the DAC is already enabled),
or is it that we need the DAC to be powered?  If it's the latter should
this be managed using DAPM?  What does this write actually do?

> - In the probe function, initialize DACCONTROL17, DACCONTROL20,
>   ADCCONTROL10, LOUT1_VOL, and ROUT1_VOL to improve analog output
>   stability and volume level.

The volumes should be left at the chip defaults, users can adjust them
via the existing Output 1 Playback Volume control and UCM can be used to
provide defaults.  We don't configure this in the kernel because the
settings needed for different boards can be very different and tweaking
the configuration in the kernel causes them all to collide with each
other.  The chip defaults might not always be helpful but at least
they're a concrete thing that provides a fixed point for configuration.

We also seem to already have volume controls exposed in at least
DACCONTROL17 and DACCONTROL20.

> - In set_bias_level, set CHIPPOWER to 0x00 when powering up and
>   to 0xff when powering off, fully controlling the chip's power
>   state.

It looks like this register is managed by DAPM already, presumably
there's some bug or missing configuration there but=20

--g4zeHAPmz0HSRMll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoV2gkACgkQJNaLcl1U
h9DlJgf+PBu9jNs6K2cEX1bBnkXmXB6gBCaYeU71UZyd4IoLDzX4oYDF6bB8FQXM
CA7vNV1zSXsDa2mdkIOSFcs6aAIGwOCAQKtqYbwtOq0HQNuyyW7nfWOyGLamiKti
q/qhPr9cmNqcOiK2xdZlzugdkZlm/8xjiwtSHH30A/b/dFFlmJAt/tI6HMnvxnTh
Avims6hf8o0PKylzc2hdKdt3x5zMuiFpryDBBlEp7ZTZxbFkapKIgBorgqmDx1nj
C4kOA4yOD1gmat07BSQ4A15Ywqde5SesxB5bKxy2BC0akUxFwKZ8fhfKHpybJTFj
vRw2NgVG3wzxcCAlWCU1/SxiTC2Vbg==
=PnrI
-----END PGP SIGNATURE-----

--g4zeHAPmz0HSRMll--
