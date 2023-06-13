Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF0D210D
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 08:36:36 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-977cc662f62so772188766b.3
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686645395; x=1689237395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rV8ssDQGynZC36t/0HgyiA06amNZ3IQmsZzAzsNY8U=;
        b=y4CDzclIQZShatWDsU4g3lX8SH6bhNFHPgveih8ze7Kc9XmzuzDL+ivOWMe2eRYY4n
         SHynu8bdnfsmsbFlk4+XCv5Wpbg9kKHzPiT/1j1d4MGxedsAFbxwRaZsJzsTkg7qWRvf
         zEt9kuTsIr8II9NnplGrk2BhQpS08Pi/MuQ+wFZAzZm6ivTIL4xsFCX+I9xF+Pv1iXm6
         CRhSQWqsAtktRmbIBe55zz+xSOqqywiySXJ4d7NNX2hbcQS3lut+iQYUrUyhjCwCa6xL
         C7LzI/Fh3kXECrU/hTkW0CUPk78AkZG2g7wJoWN/rKYqPl3Mg6RE36gwKU4JTRY9N0Il
         dHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686645395; x=1689237395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rV8ssDQGynZC36t/0HgyiA06amNZ3IQmsZzAzsNY8U=;
        b=Iv9+aYT9oQB8um0YbOOyC8YjAsXtZysIg1BtACSiLwZyd1iHf5WAhU5RYgW/XAPKty
         iUt7QHtKZveHCuNAI4++A1rVxfFflfH4fXh3PE5B8Cd9l7c8rU0XkSCZ1za0r0Jc8e/a
         Jn0GbqH8aQVIP2GeIzhDH5unGBShzLliEJGkJtakJzhEok5gnHA5jIZP4OeoGiHPaktT
         FCgLT5F8SXOrtkqB2Z0wDZFrlma3LMd7gVEjnOgHZzddBbJtowWvDqFiIii3VfpmQ93Y
         CQKeXcs7HJWKWKjpOiHEd9NBbALrtZZFlScv4jHkBocot0syKRY644iT9DpD5wAgBNIw
         cr7A==
X-Gm-Message-State: AC+VfDyligQCsQ+hjZWHu6ewCcl7o+AkYctCNYe+De+fM/vnVysEZv6C
	eXo6co5bPLwlyjQacizdBbbqeQ==
X-Google-Smtp-Source: ACHHUZ5/yWvyHNJu5kdJjggeTbrrp8iqM6D5sLzGgr3NFThPesILUShQHdYNem5UzxF8lccohUMkDw==
X-Received: by 2002:a17:907:25c4:b0:969:9fd0:7ce7 with SMTP id ae4-20020a17090725c400b009699fd07ce7mr10932258ejc.11.1686645395135;
        Tue, 13 Jun 2023 01:36:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gv19-20020a170906f11300b0097812e2b66csm6305158ejb.111.2023.06.13.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 01:36:34 -0700 (PDT)
Message-ID: <4f1c934c-5a68-a2cd-10d1-568d61865755@linaro.org>
Date: Tue, 13 Jun 2023 10:36:33 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Content-Language: en-US
To: YingKun Meng <mengyingkun@loongson.cn>,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230612090058.3039546-1-mengyingkun@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612090058.3039546-1-mengyingkun@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2023 11:00, YingKun Meng wrote:
> From: Yingkun Meng <mengyingkun@loongson.cn>
> 
> The audio card uses loongson I2S controller present in
> 7axxx/2kxxx chips to transfer audio data.
> 
> On loongson platform, the chip has only one I2S controller.
> 
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> ---
>  .../sound/loongson,ls-audio-card.yaml         | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> new file mode 100644
> index 000000000000..61e8babed402
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson 7axxx/2kxxx ASoC audio sound card driver
> +
> +maintainers:
> +  - Yingkun Meng <mengyingkun@loongson.cn>
> +
> +description:
> +  The binding describes the sound card present in loongson
> +  7axxx/2kxxx platform. The sound card is an ASoC component
> +  which uses Loongson I2S controller to transfer the audio data.
> +
> +properties:
> +  compatible:
> +    const: loongson,ls-audio-card

Generic compatible does not allow you to add any quirks or differences
if one board is a bit different.



Best regards,
Krzysztof

