Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510452EDD76
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756736533; cv=none; b=CAQD640Se7fYaEASUUaMpqUxYkmO1gr3zcsv49Zjr4Qkgqcc85ZfMvtYdVyuIOpv6/JuKtCX3EXaO7HH2T9ErLReZqSw87OTig/kw94liSKrVSSMNDAP9M1ps4ErvtixGv2/hGkGfDZY2w/X8tfuwQ8f+6NU6zGEdRagFpR8dqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756736533; c=relaxed/simple;
	bh=K2kYiZiVyxUDdi5RTXdMN+aXq8wRqVqLiPiiycS+S80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lI7r7GByPpAjYH8jykwbCJrLm8hksTB4MUYznf/OOnNT8idWlbaFZ+GiXYKJVYxOl9sXRhabXQyR2gaBx289LnPorpoICuCrYCrbKaeyJ4TFOrZVWnNmoIEDlnP0eemA+OSKWD2NAqQOSFGrVZd9DqbVQBrcQJ2hIxBdjMsG9v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGgw9yLE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGgw9yLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13ADC4CEF9
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756736533;
	bh=K2kYiZiVyxUDdi5RTXdMN+aXq8wRqVqLiPiiycS+S80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AGgw9yLEm964zTj+TgKWnhrS0YbUX5bBRc0jYrZP1NNTaAXhOnT4bAiKFtTFb1St5
	 /5TZ6oXjp2PZsVA1CZgIAeqJu800ftExLoE0FasBUJ2k8Ki1KWtOikcpDA4snYdsiH
	 VflNKyEyfb6aj1O37tIzJ1ToKecCoHADC92++u0+1al8xFRnpFZWxZnJ00PnZamSf7
	 ZbXHUCXhd6tDjzfsfH4kQJY3QIQevspRwea6ATYNN9uO57SBt390y1cDoiyoisHHZ9
	 l+yLHYTgHN/XfKHTgvvFYqDlqoInbEew0Tdwh49zvP8PRSVUD1F/MfWGHV5VM57Zjt
	 4EA/g9Q05fjkQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7322da8so859618966b.0
        for <loongarch@lists.linux.dev>; Mon, 01 Sep 2025 07:22:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYaC+adgzI9NdmytUvDBhwGBSaLK/G4+SBLPN6BIMgDYSL8wc5gnKJV+CrCWoz+X7t4fW5z/qERGU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9HYDkNYLQSfBeKkzENwKFpVbiISu+i+xsir60T4kUd0u9+o9x
	13S491Hn3xnmzuK3j2kGXz60U3SO8Yi9jOHgA3uHh2mJ+J6i6rw99jrlydoXiSVTrYz8Ggeby9O
	HF40bGCJpom5r4u7uSsGnSoohlRqkfaM=
X-Google-Smtp-Source: AGHT+IHPdXr/XUgtaqFQDzYP2xLH93Ng7BH9N5OvvUMrMk3SwimiCF81UfqyQVvDBKGvDKi529qh3/k2+tDF1h2tOaA=
X-Received: by 2002:a17:907:1c81:b0:aff:a36:e6e with SMTP id
 a640c23a62f3a-b01f20c705cmr845601266b.57.1756736531562; Mon, 01 Sep 2025
 07:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250901133804.38433-1-ziyao@disroot.org> <20250901133804.38433-2-ziyao@disroot.org>
In-Reply-To: <20250901133804.38433-2-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 1 Sep 2025 22:22:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5odi479mTr0zmDnX1WF2AmJRXTL34_ts2VCM-g6N7bjA@mail.gmail.com>
X-Gm-Features: Ac12FXxNBix1pk086_kR5DsE3syM3S-nxd0w_C-yjbJoXpM057Wr2HgqOREvarg
Message-ID: <CAAhV-H5odi479mTr0zmDnX1WF2AmJRXTL34_ts2VCM-g6N7bjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: loongson: Document GPIO
 controller of 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yao,

On Mon, Sep 1, 2025 at 9:38=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> Loongson 2K0300 ships a GPIO controller whose input/output control logic
> is similar to previous generation of SoCs. Additionally, it acts as an
> interrupt-controller supporting both level and edge interrupts and has a
> distinct reset signal.
>
> Describe its compatible in devicetree. We enlarge the maximum value of
> ngpios to 128, since the controller technically supports at most 128
> pins, although only 106 are routed out of the package. Properties for
> interrupt-controllers and resets are introduced and limited as 2K0300
> only.
Replace the full name with "Loongson-2K0300" and short name with
"LS2K0300", others look good to me.
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/gpio/loongson,ls-gpio.yaml       | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml=
 b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> index b68159600e2b..69852444df23 100644
> --- a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - loongson,ls2k-gpio
> +          - loongson,ls2k0300-gpio
>            - loongson,ls2k0500-gpio0
>            - loongson,ls2k0500-gpio1
>            - loongson,ls2k2000-gpio0
> @@ -36,7 +37,7 @@ properties:
>
>    ngpios:
>      minimum: 1
> -    maximum: 64
> +    maximum: 128
>
>    "#gpio-cells":
>      const: 2
> @@ -49,6 +50,14 @@ properties:
>      minItems: 1
>      maxItems: 64
>
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -58,6 +67,23 @@ required:
>    - gpio-ranges
>    - interrupts
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k0300-gpio
> +    then:
> +      required:
> +        - "#interrupt-cells"
> +        - interrupt-controller
> +        - resets
> +    else:
> +      properties:
> +        "#interrupts-cells": false
> +        interrupt-controller: false
> +        resets: false
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.50.1
>
>
