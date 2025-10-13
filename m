Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADE31FDA89
	for <loongarch@lists.linux.dev>; Mon, 13 Oct 2025 22:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760395726; cv=none; b=gMIvRl1cD2OG48Q6GxothMmmlgh4LlBN056CDpIgJ8H7cLOgt1SccWfzbrvV+bzITMjP2DR2qqUwcR7RvCJ+oMdwmzRU0YcAysY5XmuBUaU38ndHkGcsZnDdTC05HMeWsbmZD5G+1+S7XK5GeHj7IVSJqixtSdwqMNacfx27SCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760395726; c=relaxed/simple;
	bh=G+fhFzn3s185dsLph643rDU+nKHMFhMOKr/tuS3LLxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=suvWE5i8cehl/A7JHEX0njgQLMbiB/FgFe3SGpZkQfv5bNWHrSvGKuG4K5j4trVO23/5VofTHlFyZLM/E89DTnF2Kf+ekoXBtPmf64ieaEp0nSj1w9KZ15ROmsBq598qgl4JO833NkMIXZWlF7teRQVDMo7KioQvw9iwXM41tdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKrZ/EM8; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKrZ/EM8"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3635bd94dadso39446921fa.1
        for <loongarch@lists.linux.dev>; Mon, 13 Oct 2025 15:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760395723; x=1761000523; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VhD+CaTAnFEGvX8NVAnmhYkSF8vQCH/ncHAiaKEl7w=;
        b=lKrZ/EM8Y2zT03MtRV1MdTU+MuPRDboT4A/8JkSnJUv7f2CtrCsso7mC5ezgaLtUS/
         xQgEIj8ZlNuO9J9ql9S8Ybb1y69/wR8eOYfj66CQuzqqWVEMPIn4v36kYrWm0ES8LwGj
         qniXoyYEj5yUNk/UTVguoQoKlSjs1dT7VyDGxBiKHqogzBHS+CYh/9u3yM0trG8RK5+w
         4mvBcpAR0+ep9J37It2OUjL9J/tkCdGgJk6hLJ69IJt486Mae+tSaVIDj5Z9htmH8FDS
         wFe5qEIc+61SCmBOYGw+hlDJ8MZmKbdh0XqPwb+2GvMg6I3QC85Y+H53u5NYwVa6aRDS
         EH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760395723; x=1761000523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VhD+CaTAnFEGvX8NVAnmhYkSF8vQCH/ncHAiaKEl7w=;
        b=E/sWk5LZcodtjH1NpOaM47y8ahPbcsbrZVuysIyfyigGFFDXoyUgcsbqtmvYEldVt3
         78YB37d7RZe6u3+4Ju8vIjSv3/JveS5G+8+bBQpVc0xrLm3j3ypczu9b+CaWnHJT652G
         59/Nxrm/+aQyM+ysojHIGIymSoIpPCEuM47EPH7zi5Me6wBnlgKDqB+TR5e4CpA4at5W
         W7tAxW+B9gPy+MtNFHE49q0NMRUzrnntr8Lyo/BJlQWRJI3FNr/VXAA4A7rVQeRX95gS
         /bqM4c7u1NLvc/m+6fXYXzLxujQTRP17s2KlVh0B3OpANJPU2sfNYoT/gA2pSi3+H6y5
         wyxw==
X-Forwarded-Encrypted: i=1; AJvYcCXH9MODyamPBdg3pMjmLsOzD9SwZgfSFgOC8ZB7UqnTKIllyjkovz/KD0N9eT/KQHQr9j4GOe+73bk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPiQpPP/UyQEnrnRDaqHt3JAZwie0hcYc6rhXTWQCoH3cVr6M/
	Dl4qiF1Nuu7b/Sx9wjyYG9EFuJBvQ7InbWpUX7+AKYWm+UQIrzrq1K+CWOVOQBDesVWR/5bdkua
	aQpfA9UMeIa5MUvJYd16LXyBcTm7U6MSKa0wsqokAxw==
X-Gm-Gg: ASbGncs489IZuiMTmZK9JcCV9dujcb+eQpXZ8u+GASCair0aB9oTE6T6NKsDAJW6mpY
	8X7lt6b59PPMwPQW+LsdL2ntOXT33E7gA9jBv0Slw9+p0NIWBjcK/781OaH4tX5lbWPVgf+Uo73
	2+NYjhh2OgIclayu3Y4xSbK1Gwo5BM5fUk3kna0UVtMiyTOhoxDCzFXar28ATPx/Hztg4j/vVJ1
	hqmx51V5x0/bErxXo6/kqHHCKdElw==
X-Google-Smtp-Source: AGHT+IFl74NSqW15IsNzPl0t9dfL86nU+K1sLMERr5mtjLBBOxObParOztphix/LcxuJdowoYR/BS+BlcXi+vhVMOq4=
X-Received: by 2002:a05:651c:1b96:b0:36d:ec4c:f476 with SMTP id
 38308e7fff4ca-37609d39ce3mr60243551fa.11.1760395722422; Mon, 13 Oct 2025
 15:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811163749.47028-2-ziyao@disroot.org> <20250811163749.47028-3-ziyao@disroot.org>
In-Reply-To: <20250811163749.47028-3-ziyao@disroot.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 00:48:31 +0200
X-Gm-Features: AS18NWA8SFvTqHrsvJetzuHren0gSb2rt-z-TJ-P_Xe_tgvYSWiLVp_doY2Zbk4
Message-ID: <CACRpkdYC6ueVGngC=KMqh9aW8DiMKWyxoa8dqb4N3sEEkpdsFg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-binding: pinctrl: Document Loongson 2K0300 pin controller
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 6:39=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:

> The pincontroller integarted in Loongson 2K0300 is able to configure
> function multiplexing for all the pins. It could also configure drive
> strength on basis of functions, which means all pins set to the same
> function share drive-strength setting. Drive-strength configuration
> isn't available for all functions, either.
>
> This binding utilizes two levels of subnodes, where the outer represents
> function and the inner represents groups. Drive-strength is allowed in
> the outer since it's shared among all groups configured to the function.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
(...)
> +patternProperties:
> +  '^func-':
> +    type: object
> +
> +    $ref: pincfg-node.yaml#
> +
> +    properties:
> +      drive-strength:
> +        description:
> +          Maximum sink or source current as defined in pincfg-node.yaml.=
 Note
> +          that drive strength could only be configured on function basis=
, i.e.,
> +          all pins multiplexed to the same function share the same
> +          configuration.
> +
> +          This could only be configured for several functions, including=
 jtag,
> +          dvo, uart, gmac, sdio, spi, i2s, timer, usb and emmc.
> +        enum: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

As Rob points out this is really odd, or rather the first time I see
something like this.

It is clear from the driver that these are all set by writing bits
in a 32bit register, with 2 or 3 bits dedicated to each function.

Its a bit weird, like each function has driver totempoles/stages
before the mux instead of after (which is the normal). But
I guess it is engineered like that then!

It now looks like this:

+        func-uart {
+            drive-strength =3D <2>;
+
+            uart0-pins {
+                pinmux =3D <((40 << 8) | 0x3)>, <((41 << 8) | 0x3)>;
+            };

I think this is better:

uart0_default: uart0-pins {
     function =3D "uart0";
     drive-strength =3D <2>;
     pinmux =3D <((40 << 8) | 0x3)>, <((41 << 8) | 0x3)>;
 };

This is consistent with the bindings if you include both
$ref: pinmux-node.yaml#
$ref: pincfg-node.yaml#

And will configure it all in one go.

Sure you need a lookup for the function strings in the driver
but it's OK.

It's odd to have "function" without "group" but it seems legal
and works fine for your usecase. The normal would be to
skip pinmux, have just pins =3D <40, 41>; and look up the
function value for each function for a pin from a table that
cross-reference in this case "uart0" to 3. But I
guess you don't wanna do that so pinmux is fine too.

<((40 << 8) | 0x3)>, <((41 << 8) | 0x3)> is a bit odd, maybe
you want to also include an explanatory macro in the bindings.

Yours,
Linus Walleij
