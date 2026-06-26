Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C43E959A;
	Fri, 26 Jun 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468067; cv=none; b=pVv7GzL9aQpLWFA/39o4Y5++MauTkfFp1G0/j/3fSTHGwKkJ1eVs6AFrZBMzgeTRR+Vmvo2m2rX3xGYg+OR8PZu2FDgVTeWIDyUmBHr9Fjiy0skEq2rhHQTgOAeQQLVtXX0g80U6RnxeP5V34PkRdnBhKWpncPxeqWysvoqNon8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468067; c=relaxed/simple;
	bh=VsB0CD1HkS3lq47VJs/Rpbt0mPm7G830RQHJ360GdGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cagp1FBYlix6ywCjFSvxLsHXh0o9jebHXxiYTWws7f0Lz44+WSP3oZCYbJvbB9MroWrBJ+agra8hdWvjpEoEvq6J+1JeYBgUb8KlNmWGTnPa0bOWqAxmDGFV3FLMbpsukugT4Ugb6KMZJ7QoWqdd94RjfNwCJsaDrTWWd4VqKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPWoIgmH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPWoIgmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EE91F000E9;
	Fri, 26 Jun 2026 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782468066;
	bh=8N0bDgWZfE2GABNpHeg8dcQfMiUnvnDma5jLyH/GBD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DPWoIgmHPh83Wzw4VzQmjMyZFZarHK6UMW/Besl4t46R/1wmWc2TZwasByGNcgg9k
	 j/eJhagACInRHaud00EFb5h22q47Nstj/mdWvqpmznT8uNWC6H41ROq2/ZWFdXPacF
	 eCvYRz9GpeCU92UFcYxAQXyzwBUrcsQQCs+11O7FCCbVi+ffMvV3GRXjoTf8tP39ri
	 iRnXNRBRqhQbrXKR+nURUocQ1L3A1HHcLzyf09qDUPmwe+ueOL1fxAczaDp2XdfL73
	 YxQiBt3SZk+SCtxBHYhFh3RHAraBWpoJtd8JRBa0TmgeiAMyD2VrJ3aQK6RIUbi/5Q
	 h8o1vjmtb6X8Q==
Date: Fri, 26 Jun 2026 12:01:03 +0200
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
Subject: Re: [PATCH v3 7/9] ASoC: dt-bindings: loongson,ls-audio-card: Add
 ATK-DL2K0300B compatible
Message-ID: <20260626-devout-vulture-of-reading-4fbfad@quoll>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
 <71430fcee5951fb7a7d52e2091a87707db85e06c.1782439646.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71430fcee5951fb7a7d52e2091a87707db85e06c.1782439646.git.zhoubinbin@loongson.cn>

On Fri, Jun 26, 2026 at 10:27:28AM +0800, Binbin Zhou wrote:
> Add new compatible for the ATK-DL2K0300B development board based on
> Loongson-2K0300.
> 
> Unlike others, this board features GPIO-controlled headphone detection,
> headphone control, and speaker enable.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../sound/loongson,ls-audio-card.yaml         | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> index 8c214e5d04b1..dc7f4afbb777 100644
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
> +  spkr-en-gpios:
> +    maxItems: 1
> +    description: The GPIO that enables the speakers
> +
> +  hp-ctl-gpios:
> +    maxItems: 1
> +    description: The GPIO that control the headphones
> +
> +  hp-det-gpios:
> +    maxItems: 1
> +    description: The GPIO that detect headphones are plugged in
> +

Add allOf:if:then: block after "required:" block and disallow these
("...: false") for other variants.

If these stay, because I have doubts. spkr-en-gpios sounds like
enable-gpios of each speaker, so not suitable here but should go to
individual speaker codec nodes.

Best regards,
Krzysztof

