Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14873286408;
	Tue, 16 Dec 2025 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765901804; cv=none; b=QjFD2bhXH3MbnVZNXCoNah8pGb6poTPg9sbvuzmg3rnRLQoDsy0hJzaf6M4myU47fKnzF6uzITkaaWCFZqsEB79W8qfoMx4YDrDodHJ+c3p9J8ix1eLu53UzuTGAOGzay9EyhlDc0zAKpY8BJ9bKJWfsYP7jRg10q369XVZqCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765901804; c=relaxed/simple;
	bh=KbDL6tVsoLJsdlRyLex4ZD597htAV/WJC7lKOAedOWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlZ+S3CCEoJn+uUaCF9HnTAOMY/nh8K0cDzSz0xNsPWSSQ7yVN8eUpvVHNyi+e015mOJHuehU+U21kjLuE0zzIBQyP40PBQFO7/OwzUvEEWcUcHb7LaoRM8pOj/wGjVLofEa6eIVrYB4FetQiMIO+exMLjPe+S+cSJ8UIovF0dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjzRiApZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjzRiApZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62911C4CEF1;
	Tue, 16 Dec 2025 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765901803;
	bh=KbDL6tVsoLJsdlRyLex4ZD597htAV/WJC7lKOAedOWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjzRiApZ65tyO2cE99IkhqHl6VcKSmvnzJkLMlLdyXbDD2GQrI8tPJcpoTXNmE8c6
	 1TfqCWkwJp41NCreBv9JdK4B78PKKumyyx3KM1gf+4ZlZQMrbHfJ9RorS04hEtoG5L
	 J/JjD4eaWEwKL5cp4dd/bAxeMpkHAUSGAPXFjvjG9GtXnjpzNcH/9QQj7DbkT5kiYR
	 MioSvC58mchfK39CenVTNfi7Wgjash/3FM65A4cm346PoEjbCi3wXWYxYPlHisOYmc
	 c9xp7P7TaM3hzwMciU0Psq56rkAKZuSUhMgMqIksNmhzxX85c91ul598YDTAW/uDig
	 cxtf0M+9r7PuQ==
Date: Tue, 16 Dec 2025 10:16:41 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Yao Zi <me@ziyao.cc>, Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: interrupt-controller: loongson,pch-pic:
 Change to unevaluatedProperties
Message-ID: <20251216161641.GA2573095-robh@kernel.org>
References: <cover.1765778124.git.zhoubinbin@loongson.cn>
 <db24b6366bb0d49e9dcc04328ffad7a37f687a89.1765778124.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db24b6366bb0d49e9dcc04328ffad7a37f687a89.1765778124.git.zhoubinbin@loongson.cn>

On Tue, Dec 16, 2025 at 03:55:13PM +0800, Binbin Zhou wrote:
> Change additionalProperties to unevaluatedProperties because it refs to
> interrupt-controller.yaml.
> 
> Fix below CHECK_DTBS warnings:
> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: interrupt-controller@10000000 (loongson,pch-pic-1.0): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/loongson,pch-pic.yaml
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/interrupt-controller/loongson,pch-pic.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
> index b7bc5cb1dff2..1f818316082e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
> @@ -14,6 +14,9 @@ description:
>    transforming interrupts from on-chip devices into HyperTransport vectorized
>    interrupts.
>  
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

Adding this does not define the value(s) #address-cells must be. I'd 
assume it is 0 in this case.

> +
>  properties:
>    compatible:
>      const: loongson,pch-pic-1.0
> @@ -41,7 +44,7 @@ required:
>    - interrupt-controller
>    - '#interrupt-cells'
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.47.3
> 
