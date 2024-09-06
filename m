Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF831CB125;
	Fri,  6 Sep 2024 10:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725618095; cv=none; b=VoUgLkb6HasxMnEgFDDIfz7whVje31Vrf08t3d8XVtzxnwCuPBs5M/mlZNPpP7xLA6FuXOKM0gvyvPH8rUMYfKAikI1RlcltT3SdHg4Dqehs7zUKT9XDHCE6BcvetryHZ4+g0MFarQqKcE39UL857M9AEUBSwkE1Z+PGTJApEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725618095; c=relaxed/simple;
	bh=q4CcTQ33OgM36k9seQu2mrKAMAB+EsTuv8kOKC3HaNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCpncQq9qWH8LVX8r5B/3tFH9qEgzNZ2rhYEKQXaXnU2KlHz+ceyFGswiRP8DxcRzHM5ZWAP70qo+Or1nwVVrs5OGZJeX+5NP0Df8zIdaDS4CqN7YeTyirgUYu8GiwbgRRxzVYPM7+xgG+BPBanCc0fbMSt5hjk1Vwo3yCbYqiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZNQZ2z0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZNQZ2z0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A49C4CEC9;
	Fri,  6 Sep 2024 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618094;
	bh=q4CcTQ33OgM36k9seQu2mrKAMAB+EsTuv8kOKC3HaNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZNQZ2z0dfry53E/ECfC4G+xGDxtYcNAqcdf02QZsv3tGmjJOGoeqUgXoRD8IzfQv
	 0p3mST4iDItYJuU68G1hiB4/ecfIs9IPGDUx3k51BWApHC3vmG2P0/7F88jLilkp3M
	 /PRtzrrV7yESev6T7S6jiXey32dFqUfwUb3VlLvpU+gTSR5mzuU7WQkqYweVI338oA
	 P5BX3oVui9wfhqz0CYCjww9boJwoOesV8fuJwulekwlGOzDyozwuQo0RDfb1x5ijEk
	 8Ykqufnsd62jWgN41P7FaAXPj67tcZocRWdkmhfkqQ/ijm0acfsPTVYX3pPHgdoSfi
	 FPqdwP/rkNz7Q==
Date: Fri, 6 Sep 2024 12:21:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v1 01/10] ASoC: dt-bindings: Add Everest ES8323 Codec
Message-ID: <zes7kfwmz57lhyfvxuyk64n7eykb52txxatbqgqnue7e3yab7g@d7cg7ql4gyl4>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <e987b0beabba169577c8923557690984f226b29b.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e987b0beabba169577c8923557690984f226b29b.1725518229.git.zhoubinbin@loongson.cn>

On Thu, Sep 05, 2024 at 03:02:14PM +0800, Binbin Zhou wrote:
> Add Everest Semiconductor ES8316 low power audio CODEC binding with DT
> schema format using json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/sound/everest,es8323.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/everest,es8323.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8323.yaml b/Documentation/devicetree/bindings/sound/everest,es8323.yaml
> new file mode 100644
> index 000000000000..0450d0f49d03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/everest,es8323.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/everest,es8323.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Everest ES8323 audio CODECs
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: everest,es8323
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: clock for master clock (MCLK)
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mclk
> +
> +  '#sound-dai-cells':
> +    const: 0

No audio-graph-port? Are you sure? It looks exactly like
everest,es8316...

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#sound-dai-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      codec@10 {
> +        compatible = "everest,es8323";
> +        reg = <0x10>;
> +        #sound-dai-cells = <0>;

Make the example complete. Assuming this binding stays...

Best regards,
Krzysztof

