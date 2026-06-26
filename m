Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09F8314A8E;
	Fri, 26 Jun 2026 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782463181; cv=none; b=sXERozvGf3LIO/0c6pkMxRmk3lZS/ekHdWpFLYjuY23CkeRhoGh3xG5o4zhGi/Jn08l+BJTXMLotHHXsJHXKmoUHi5ZXgZ5QjG2CksWLCcoIJMlzJkPxCDzn1N23Lz4ZwH5tqJL4SLiaP2hg2REDZ7FoAQ8fqiS/Z5Iy/YAgNY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782463181; c=relaxed/simple;
	bh=tbBQ5ptCm4gH95Hh4mvB9SgM97xSJbTfflHwb3puDBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4wp5/9/ibZuC+uVsGYSDoQKeU+g5YBEIt4geWeceIvWhN/8uKdtTdYjjiux1oNB32UJJ5J2dKQgpDHT42k93sHC0Xz98p88YPPk9gpILrD0y9+IBzCN5BnCHuc0IqCMidtd3Ij2EwkwdzwjiXvnxJlpQ0/TI/p6EQ+UR7p3vIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKPcXxJm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKPcXxJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F8A1F000E9;
	Fri, 26 Jun 2026 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782463180;
	bh=bVCCvdzUHBT0cmeA/8V8C8wlkIPEMkra9Xn6Q3kjkPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FKPcXxJmtiJpxTsMZhv6t7P3D3G644HGMWcJ2ocBXKvJ1vYwSJA6MoYx14/QQiZZq
	 Iez8ZUwmIp8i+BRCHbYA5l/ccCJar8rkSDFDgYhB0E9LSCWku8kzI2553/09mqeel0
	 51y3jTm5lq4HqNAQ96+DZYW8UGoe4GQ3iVTOcVTIjTu8h7eB9/8qlV23qJWhMR+p7s
	 EmjBZNbiItOVhwCq1mshjI35h2sHeeLW77iCsjkGXgd05moYmd1uMV13DE6CAagKq1
	 4y04QGRAWYvr4M4SjLR/2nLKtaUVF9BLcj6A+UUZpPH3GMOQW8Z5RQgzLw1FDl5WyH
	 5NnUVudYhUbtw==
Date: Fri, 26 Jun 2026 10:39:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 5/9] ASoC: dt-bindings: loongson,ls-audio-card: Add
 ctcisz forever pi compatible
Message-ID: <20260626-sympathetic-strategic-limpet-8daa16@quoll>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
 <183d809cd51874bcb78743273e4b7617f120fedb.1782439646.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <183d809cd51874bcb78743273e4b7617f120fedb.1782439646.git.zhoubinbin@loongson.cn>

On Fri, Jun 26, 2026 at 10:27:26AM +0800, Binbin Zhou wrote:
> Add a new compatible string `loongson,ls2k0300-forever-pi-audio-card`
> for the audio card on Loongson-2K0300 ctcisz forever pi SoC. It uses a
> different DAI format compared to existing Loongson platforms.
> 
> The existing "loongson,ls-audio-card" remains valid for LS7A,
> Loongson-2K1000 and Loongson-2K2000.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/sound/loongson,ls-audio-card.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

