Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842493C5DCE;
	Tue, 26 May 2026 17:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818389; cv=none; b=M8y7uxDu7/opYR2O2GGudoVWm9ouNDhKTCSPNXP+aJi2A6QDvEnkwpwUiRBmARSLHBPOdl3ENpKYZlp/RaM3pQx53VDm3MoTxLXMQle1sYsADprOfAHg1a9+RoovUaF4SOurq2+ow2ZYEzDDL37ajQijKXXVguDtJkfmVM8V43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818389; c=relaxed/simple;
	bh=qR/frz80U4Cz1s68xWdh4P1eIuxZxnadNW5ggKtINjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKqDSXJdU2N7Oufj30znkKwszzIP12Ak6uqJyqnSk0aXb1HXAhQYJCKEdq4QAxvMBiiAJvY+O0q8AbQ6NbiFd03RMHY9xwCWeYDNGEXwGrd3eq0Cr7B1eMNTLCtQ5DsFVe4uGgy2wDwgB5xhEgKQAyLSCKKVkRwMKW5JophW7SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8EyFLmt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8EyFLmt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610851F01566;
	Tue, 26 May 2026 17:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779818388;
	bh=8rN+2lZzLMdtYrW7Wu01JcBv6xtTVfubKCqo3jYHmeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8EyFLmthSGfksCDN5ux7x9ZEHCJjAclPyzGHpbN8dN7ZjDbNg9l0D9/mynUQ6tgW
	 m/kGYlldCn4IlyPxyx6vq3RGRQ3FSlmwcjZ6QYIOnfDT88lKddJtNrwhzQkqupCSPd
	 gl0CwaZCxe2Iu2qC79dfsrFnzcBAoaA2Evon33Pa5CQ03yDn0uMrFS3R7NfIGCmZAW
	 derCmienFiwQS8kv1MG510YoAUXsHZutjsrkXNjjFU3/kcwlZMaH0qcsrxBLLHOWNt
	 iIWBM07TFpwjKkD3tEQ1vumqJOEl++kXJX0GD9WORuPjY5tA13sIi1ENxSxzumprHW
	 xKQ3+g527oR1w==
Date: Tue, 26 May 2026 18:59:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/5] ASoC: loongson: Combined regmap definitions
Message-ID: <e45ea3e7-515e-45db-b969-cccdd3f432b5@sirena.org.uk>
References: <cover.1779796354.git.zhoubinbin@loongson.cn>
 <6fd63cc57c112218ae0873b73d8c3a4b24304b80.1779796354.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w4LH0YqR6u6AFvkv"
Content-Disposition: inline
In-Reply-To: <6fd63cc57c112218ae0873b73d8c3a4b24304b80.1779796354.git.zhoubinbin@loongson.cn>
X-Cookie: You are fairminded, just and loving.


--w4LH0YqR6u6AFvkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 07:56:00PM +0800, Binbin Zhou wrote:

> While moving, adjust the following:
> - Mark only RX_DATA and TX_DATA as volatile registers. The PCI version
>   incorrectly marked CFG/CTRL/CFG1 as volatile, which prevented proper
>   regcache synchronization.

The driver also polls LS_I2S_CTRL for MCLK_READY and CLK_READY, either
we need to bypass the cache when doing that or that register needs to be
volatile too.

--w4LH0YqR6u6AFvkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoV344ACgkQJNaLcl1U
h9BfEQf/XrJk5zlpLdiOE30w9sm6LEJ1PgOWWia0Deml2K512ci51NUf0IL2LhiS
aVu5K7RZfTjeX4qlGXpIpssGf2EZcM7fs/BtmUCYbIC9V7z8THd/190BoaQ+OE2S
crQOyN1Tm4Jrb9UhJC27CkQaQoe+oppq2rlaENNL6ttdLo/ehxUb0GLcP3KZTiHw
nM3kvMu1eYY0v+DU7VCRtc/N9QrA0ncJIOikcevOevtfTmEHVFoSXqC291mzQLTO
EZ9UxbISl1eKqnVP+a62EtskCsKU3lDcQ+YxJRxxuab5YuCBtD0TaVTqHiyV1yxb
SmMiZFFo3/rSOHfn9ycFx11IS468rQ==
=n2Ku
-----END PGP SIGNATURE-----

--w4LH0YqR6u6AFvkv--
