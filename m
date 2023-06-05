Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A4171C8
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 12:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744A4C433D2;
	Mon,  5 Jun 2023 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685969232;
	bh=YfGoSGL9f1bxiaV/tE9J6jAugp9YIwaqLS/mzYmvdec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIXw8Gyc0yrAwqnGZu0VmvnBA7Hmrnr8sWu+RVAhDW908i+wlMsOhnoLVOHPyjI1P
	 wBQ3/HS9cOs+/JNhh3a5iibUCEo2OwdLwCRyo1U9oGv7bmM06BQpgCTmYJf39K15Qf
	 YNKhi6Dat+88fize2tkJEt2/gbtP982y8so1F6GjX+8w4h5TMEp1cBbvI6bFxFZMGk
	 FUU4d1e7QS3uisJ3+gSyKv+eETjEuk4JVWP8BZoTQVeuvoeuzEy+eguKyDsWIy12Cu
	 hAL9joWYuANv2aWP2Dvy1QuLXLhrJdz2kIwf1qujt2gc7vzRarxsdRwek5WmRt6RjN
	 s5OqtNvu7MwSQ==
Date: Mon, 5 Jun 2023 13:47:08 +0100
From: Mark Brown <broonie@kernel.org>
To: YingKun Meng <mengyingkun@loongson.cn>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH 2/3] ASoC: loongson: Add Loongson Generic ASoC Sound Card
 Support
Message-ID: <aa8381b5-0a3b-4a64-8c92-333ad751956b@sirena.org.uk>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <20230605120934.2306548-2-mengyingkun@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jMoQciNUS11hAL/M"
Content-Disposition: inline
In-Reply-To: <20230605120934.2306548-2-mengyingkun@loongson.cn>
X-Cookie: Biggest security gap -- an open mouth.


--jMoQciNUS11hAL/M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2023 at 08:09:33PM +0800, YingKun Meng wrote:

> The driver supports the use of ACPI table to describe device resources.
> On loongson 7axxx platforms, the audio device is an ACPI device.

I'm not seeing any ACPI IDs added here, this is all DT other than this:

> +	if (has_acpi_companion(&pdev->dev)) {
> +		device_property_read_string(&pdev->dev, "codec-name",
> +						&codec_name);
> +		for (i = 0; i < card->num_links; i++)
> +			loongson_dai_links[i].codecs->name = codec_name;
> +
> +		device_property_read_string(&pdev->dev, "codec-dai-name",
> +						&codec_dai_name);
> +		for (i = 0; i < card->num_links; i++)
> +			loongson_dai_links[i].codecs->dai_name = codec_dai_name;
> +	} else {

which doesn't look *great* from an ACPI point of view TBH.  I thought
there were now some (semi?) standard ACPI bindings these days to support
referencing other devices better?

--jMoQciNUS11hAL/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR92UsACgkQJNaLcl1U
h9AfIgf+LWp5mvFSev7zoIBVC//Wc1pfEjLDt2S/xnOCplilBhXZxBjJMl0yfAXV
+JPXrf2vT2qhLlKhT+kF7YAKzpubykso0spCZBGbUe6cZTuqTcDpBJSSWsQxVyQs
tJcStKW7vEquU3DmOL4YbTJ1GiZx6lum5idsxmnbrzGF6X60a5l8CAg2gXh9WD2m
nhgW+Z0AMkIDeJd+1FxxytN4Is9XBlY+4vuMY5AUc9TSHB+uxCsvBLD8if2dIwST
1t1/AcK2bKJzl5fP6t7lYwJbz7cdt/TaheVgSkN8I7LamuOlEwzs9cidU7yKPpBI
Lk2NeacN6nFEFqLkf0R2PT/VJy7jVQ==
=naBq
-----END PGP SIGNATURE-----

--jMoQciNUS11hAL/M--
