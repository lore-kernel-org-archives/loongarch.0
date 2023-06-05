Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81731096C
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 14:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5148C433D2;
	Mon,  5 Jun 2023 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685976345;
	bh=W29DiFd00K8hukRzh7m2tWsdPBE9ZZWXYOwuKdLzUOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JaVIG1v4rnNauxEFhjHpUvkm8iUPJoZmdzYPWadpgRZzAlfu2SzMTdt3iLmsLsbcF
	 WnNI3LYmykUmviomBVf1KPJr9dTMls3dyAo3YB/pjePzaIcP9nVTIAl7Kp7T7HSo0K
	 aTsOL0veP2X/YvXjgT73JhicFhMHtmV2pgrn/bsj9iyLpqWY69bSOgIk+SWi8/byKd
	 Md0hhTIzirzyu7/tXH25UWzZwhOUz82jfuGY5rvpIz+Vzp5/xwb9bRvMayDlVo9EP6
	 0lpvzFPNJi3rjzzeIJTZkIVBAOV4qHtX3Xu9R/QnwZgbG2glDuBa02l/pf/G9gp05M
	 /rhDQdltDH3Tw==
Message-ID: <118d13ef-a247-cf88-5084-afdebc6b7651@kernel.org>
Date: Mon, 5 Jun 2023 16:45:38 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
To: YingKun Meng <mengyingkun@loongson.cn>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <20230605120934.2306548-3-mengyingkun@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230605120934.2306548-3-mengyingkun@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2023 14:09, YingKun Meng wrote:
> From: Yingkun Meng <mengyingkun@loongson.cn>
> 
> The audio card uses loongson I2S controller present in 7axxx/2kxxx chips
> to transfer audio data.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested.
Please resend and include all necessary entries.

> 
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> ---
>  .../sound/loongson,ls-audio-card.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> new file mode 100644
> index 000000000000..f1d6ee346bb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/loongson-audio-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson generic ASoC audio sound card.

What is a "generic audio card"? Does it even match hardware? Bindings
are supposed to describe hardware, which is usually very specific.

Also: Drop full stop. It's a title.


> +
> +maintainers:
> +  - Yingkun Meng <mengyingkun@loongson.cn>
> +
> +description:
> +  Generic ASoC audio device for loongson platform.
> +
> +properties:
> +  compatible:
> +    const: loongson,ls-audio-card
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  mclk-fs:
> +    $ref: simple-card.yaml#/definitions/mclk-fs
> +
> +  cpu:
> +    description: Holds subnode which indicates cpu dai.
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      sound-dai:
> +        maxItems: 1

In the cpu: required with sound-dai

> +
> +  codec:
> +    description: Holds subnode which indicates codec dai.
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      sound-dai:
> +        maxItems: 1

In the codec: required with sound-dai

No multiple dai links? Are you sure this card is so limited?


Best regards,
Krzysztof

