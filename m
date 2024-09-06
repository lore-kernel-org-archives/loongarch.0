Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9441CB134;
	Fri,  6 Sep 2024 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725618222; cv=none; b=jESTBjEwqPTK7P8XYxcj/8MbhBZ4IQpLvrilOq7RqWgDw3iUwmLHdkrsCDr7BQGeNqQSAHgQfCAK3HJGw386GJpkX2DJx0lVso/b6g7sEmXL928g4F9yZ8JBZWOQl7jNRFAm91j2j3WV/3vF/TC1JWhpGSgQwwdON2wmtA5vTS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725618222; c=relaxed/simple;
	bh=6bOj2FVCTWmkpLPRDibSAoyfiVk2TeFdHzcEQbNyEqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeOHm4KGe70B2YCnfNN1Xm9JFqZZMPk3gKY/7Px5G3oGwKAGG6+YnlSWswi9w+8mfdPsNMBDWeD7meNWdXSmwjpM0w2En4Jc0ItyBY7KR2BKNluifUn1xz7hWkF/LLzV1NL9X+b/pyaGRQMXzLtBtZd+ndN/x36qMOMotJSVUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf2IRPCf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf2IRPCf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7F4C4CEC4;
	Fri,  6 Sep 2024 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618221;
	bh=6bOj2FVCTWmkpLPRDibSAoyfiVk2TeFdHzcEQbNyEqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kf2IRPCfUfZ4YjXdw8k22q8R25bcabtihwDG71BT54Sjzd4FKbnl1Agm5FnR/ZEI4
	 Tib17JtCqAV7nKKicdap+jCxBt2ipF3a7v/NkvI0acuM0srObiYolyMSY3Woroaa+R
	 ga1UkUMPLdFxITrjCsUnNUEpeAYVhP1nWhil9NZtgFvlR06KY7/aBX/+krGXOodTD9
	 /nsSQ49hR2WVaHzPigo2gosrD/1MDH2e+kodLEOIU+BeHNfpfw4e7D+hTiAdX3dj3J
	 rCKAPedoKz7XG3Fk3fD9acEQ63kRZlih39qfLWIywiDPRSMxJKRSxeuKqvfwP+OmYv
	 O/V2p6CdTwegQ==
Date: Fri, 6 Sep 2024 12:23:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v1 07/10] ASoC: dt-bindings: Add Loongson I2S controller
Message-ID: <2bel2spvqvuqyyvuv32wevxmf7tv6w336f7zfj3uq3wslwgr32@weiqjaqitqt5>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
 <ca09352c70c8e69d95dc085c8b479bec21560309.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca09352c70c8e69d95dc085c8b479bec21560309.1725518229.git.zhoubinbin@loongson.cn>

On Thu, Sep 05, 2024 at 03:02:56PM +0800, Binbin Zhou wrote:
> Add Loongson I2S controller binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/sound/loongson,ls2k-i2s.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.yaml b/Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.yaml
> new file mode 100644
> index 000000000000..a2e3bbe00dab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/loongson,ls2k-i2s.yaml

Filename matching compatible.

> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/loongson,ls2k-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-2K I2S controller
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: loongson,ls2k1000-i2s
> +
> +  reg:
> +    maxItems: 2

List and describe items instead.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - dmas
> +  - dma-names
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false

Instead:
unevaluatedProperties: false

Best regards,
Krzysztof

