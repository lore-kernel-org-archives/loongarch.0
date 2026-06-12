Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7451E33F36D;
	Fri, 12 Jun 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280099; cv=none; b=g7kJohP8mKVy5B6Xdey+gsC0caLeEX+oAEpUc01ypS/wQPMwC7kvIE+AMf84qq3fxkVN1FxwTwc6XpOeVWbTA/pdgCnNDsisuwpXrracF0FMHw4MSOE16ZCvYpEPWIlvCeoLpUJVurboiPccvMzvxsbGHDQnCys7jL/oIxanXlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280099; c=relaxed/simple;
	bh=wLhpsbDGe+7UZ439gh2ADhzTgD0l3cEk+bKY/MPu4xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbCsJFl7pwDfk8jLWoRctU0P6ii1QyzBkvhyW2hUbvSNjX4oCWuYUZIKw9k70Jw2tZRoRFVKwlW5LKNFfEWBZQFLJFvQG2mMp/hz+IC8zm4irYZhXrQ5NuHsFjzXXUpB7kqOpp1sSUbVehd/Y0jsh/VkTTxuw5NsbFN2J3nTWvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZeGOvCn0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZeGOvCn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9AD1F000E9;
	Fri, 12 Jun 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280095;
	bh=76xOZCss/+5Y44At0ONW/HJ57BghjF1azkGN0neK2Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZeGOvCn0EWyp5kpiyzdrhcnHVte26Rzx1tkyatiuD738lG2fJMWhTLoC206yvr6RU
	 vQTWeS7ZU5xCVmvuAa59u9E1tYwhgimXZOHhmePDD9Rck2qJW3SReAZU50vX3Ea2E+
	 6peGbqwKbcFSh8v8ENSDeZqIm+694/4s13OC8zYue13RSx49ZBh5WVL8BLeh0CJUaD
	 1I+yO26NCkLqXD39Uq7Aoy40dOumEnDwfNH81l3xNhAJuCtau6Ug1PlEkgXtgLkoUL
	 tzxHhLvSa/EemsH/aPZHRl+U2BDcWFFL/1LGeq3dn24W8OX4t6ypwGv3xf85c+EI0y
	 MxLuPVpjhxraA==
Date: Fri, 12 Jun 2026 11:01:34 -0500
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: loongson,ls-audio-card: Add
 ATK-DL2K0300B compatible
Message-ID: <20260612160134.GA1116138-robh@kernel.org>
References: <cover.1780538113.git.zhoubinbin@loongson.cn>
 <c03b86a9318cffe69ecf8d5c14543fc5948ab2c7.1780538113.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c03b86a9318cffe69ecf8d5c14543fc5948ab2c7.1780538113.git.zhoubinbin@loongson.cn>

On Thu, Jun 04, 2026 at 10:11:46AM +0800, Binbin Zhou wrote:
> Add new compatible for the ATK-DL2K0300B development board based on
> Loongson-2K0300.
> 
> Unlike others, this board features GPIO-controlled headphone detection,
> headphone mute, and speaker enable.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../sound/loongson,ls-audio-card.yaml         | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> index 8c214e5d04b1..e9b248e8246c 100644
> --- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> @@ -23,6 +23,7 @@ properties:
>      enum:
>        - loongson,ls-audio-card  # Loongson-2K1000/Loongson-2K2000/LS7A
>        - loongson,ls2k0300-forever-pi-audio-card # CTCISZ Forever Pi
> +      - loongson,ls2k0300-dl2k0300b-audio-card # ATK-DL2K0300B
>  
>    mclk-fs:
>      $ref: simple-card.yaml#/definitions/mclk-fs
> @@ -47,6 +48,18 @@ properties:
>      required:
>        - sound-dai
>  
> +  loongson,spkr-en-gpios:
> +    maxItems: 1
> +    description: The GPIO that enables the speakers
> +
> +  loongson,hp-mute-gpios:
> +    maxItems: 1
> +    description: The GPIO that mutes the headphones
> +
> +  loongson,hp-det-gpios:
> +    maxItems: 1
> +    description: The GPIO that detect headphones are plugged in

We have standard properties for at least this one. If you see multiple 
$vendor,foo-bar properties, don't add yet another vendor foo-bar 
property.

Rob
