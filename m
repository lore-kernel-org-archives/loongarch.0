Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD52E21ABBB
	for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597759; cv=none; b=pq3I9tAEDeLfDHubPAliL9lhLxDXSMxEA3uxhRKPkWmfH2AxUyfo6DBgrb/PEXxWe39OkRVnKx8eghYGtz6Q0fdkWLRV3/5Dsr5vJ9Mh6l95wSN3JkLbrxb7EivNQHjskSvPX+50oLzrTf890WvmVRyHjS0bxnnIQ5Ge2GSmQsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597759; c=relaxed/simple;
	bh=2oRJmy6jdudOx3Q3CK1t3Tr8AwssA1mqdMSyvD/J694=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myqb1QpeCPIaizmpWaiKAWqZCMUcelrE0VL22AIzmXWGfJQPKUQ9Ygv0i1I2wiXL8vdsMha07cYDnhK6PZI/OCXu+KGjw2L061D6u+GnNHib1QQgTh3avbusKC+iPJOXnT5OgqpC1EqVPKt1+oDAnoks7L9EjhUyWyJE5Y3xN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qnHmoH/p; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qnHmoH/p"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333f8f0965dso42860391fa.1
        for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755597755; x=1756202555; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEIclbjfDHmWiMYwu7S7lb6mGq8E/UEDhqSMVO/QBNA=;
        b=qnHmoH/pe+lf5Hos+5OYg+mWjKdFrOjRNfe7gySCtFrNQxYJzVhvUno4CnR7i5Lemd
         ErP2XxIs4U5B4A+EiMlTGQOj5t8OmYIW+ytINlYLv+ntHqyGN+sXlfNTJYfqFaeQl+sz
         LPlO6dnN8V/yCk0T0hicD8IFK8IjrDn2RimDmLOEBmSQ15tFO4IA/ygqfpuyKqRDHurF
         1vdNusaA0aJQuei33H8Jxgro/9ykXw2Vq2HkqND49S1TLbDfwQLW3zD4A/79iP412H4K
         OQSThq1CZRWBVU6L2W5bCAa+l0quEJ8RyhlkJcPtHalwaS1JgYo+hZh9mahGqNZGYRYp
         Bh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597755; x=1756202555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEIclbjfDHmWiMYwu7S7lb6mGq8E/UEDhqSMVO/QBNA=;
        b=ecGcQl4c1/07VVQCCO4pjiSyYdTFIIHV22S5baqNpDH4ZhSuRx6DHUZzFVNoG0jXpm
         qajZ0wPePO89D7keGKhT43SJviKByyolH1QYCUvSQD+8w9jsrZSEnVspN4/i/jaAmtRS
         e59tTS3k15P6HKRyWq8l+DS6/t16qRzVcaSUQr5hefqHXIgOBNB1LoA3Rw8E8C0J9Qk+
         /6TQuS421yDe5zogOV/F8B97OxEJVzXYoaeTEXHELSEomLvMGDMjUjPr4klgKljsWGo8
         DT/GOc3zEN5dpCaWeS27OPxlqlhpJwEXknhxxJNDnq5btK4QYyXAuFzBj0chiTlK4yov
         cXVA==
X-Forwarded-Encrypted: i=1; AJvYcCVmdIvWLCo79mFvZ8lSTAT9uME3KqUkhd8qTGjxBldPoV5XglvRBTPeF7Ft0e4YCjpOQ3y/QxJtzUI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3pldhC6dd2Pu0L2SuM5X9J4YrkZW1Cos74RGVdfd1SMxjHvox
	1m1OSDFgEVSHsz0Mpv8Wpns5diNdv2kPwXT6NLXFFgHzpnmoBpNwWO9RGYFbq2rdtfUj/84BgMe
	m8uBif3JVJ5OX7npXgPk1EwMtQTFFn9vBybaSeOWbww==
X-Gm-Gg: ASbGncuSgK3la2UG6QFAfeG5fawyW4z9AIKsIk4j5qUMN402g7nMxRDUqS1C9RCA/Ue
	7HfRy35CbNJPUY2qE/sAUPGmvcKOuyB8GmH+7ljdedqxoaITQIsL6+5vNf3+n6TfDqW8Pk++TqC
	dGt+4QOXiRr4wHWLkieFXHPpreLOt2jF1WPvaGnXkPi/gNy1LKj/1oLhOKHtCJdjbYflzJDm0Rw
	oG1IROxvsHs
X-Google-Smtp-Source: AGHT+IH/19oUBfRxFr8epug82uJ7/HieWJyUVlBhoMvAFaMluZmkd3UN9bc0BKENYULFNtqg/fXi8MkFaQZgBnal9yQ=
X-Received: by 2002:a05:651c:4199:b0:333:ac42:8d6a with SMTP id
 38308e7fff4ca-335304ee6damr4961591fa.3.1755597754935; Tue, 19 Aug 2025
 03:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811163749.47028-2-ziyao@disroot.org> <20250811163749.47028-4-ziyao@disroot.org>
In-Reply-To: <20250811163749.47028-4-ziyao@disroot.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 12:02:23 +0200
X-Gm-Features: Ac12FXx1atQmH6QeSnrDLNRud94fhJMECrA9TaInUV_M5vUWxhGJhif4Q5spxjg
Message-ID: <CACRpkdZp8FLrxgkeZ=xzSPgny51iDZ3KRCrxpoSdgF8_=df=KQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ls2k0300: Support Loongson 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 6:39=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:

> Support pin multiplexing and drive-strength setting for Loongson 2K0300
> SoC. Pin multiplexing could be done separately for each pin, while
> drive-strength could be only configured on function basis. This differs
> a lot from the driver for previous generation of Loongson SoC, where
> pinmux setting is based on group.
>
> Pins are represented with pinmux properties in devicetrees, and we use
> the generic pinmux API for parsing. The common pinconf interface isn't
> used for drive-strength setting, since it handles pinconf settings at a
> unit of pin groups or smaller.
>
> Instead, the driver configures drive-strength settings just after
> parsing the devicetree. The devicetree's structure ensures no conflicts
> could happen in drive-strength settings.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Overall the driver looks very good, well done!

Look into Rob's comment on the bindings to use a single node
for mux and config.

I saw that you want to make the pin controller strict, if you also have
some pins with "GPIO mode" that will serve as back-end for a
GPIO driver (and I saw you posted a GPIO driver series as well)
then have a look at Bartosz recent patches to add infrastructure
for pinctrl to know about what a GPIO pin is:
https://lore.kernel.org/linux-gpio/20250815-pinctrl-gpio-pinfuncs-v5-0-955d=
e9fd91db@linaro.org/T/

The current driver does not seem to know about any of these
pins being usable as GPIO and does not implement those:

        int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
                                    struct pinctrl_gpio_range *range,
                                    unsigned int offset);
        void (*gpio_disable_free) (struct pinctrl_dev *pctldev,
                                   struct pinctrl_gpio_range *range,
                                   unsigned int offset);
        int (*gpio_set_direction) (struct pinctrl_dev *pctldev,
                                   struct pinctrl_gpio_range *range,
                                   unsigned int offset,
                                   bool input);
        bool strict;

Which is fine if the pins actually cannot be used for GPIO, but if they
can, and this is just implicit for unconfigured pins ... then add
functions and groups for GPIO.

The other driver using pinconf_generic_parse_dt_pinmux()
drivers/pinctrl/meson/pinctrl-amlogic-a4.c has GPIO awareness.

Yours,
Linus Walleij
