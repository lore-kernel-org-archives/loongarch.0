Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1154831E0EB
	for <loongarch@lists.linux.dev>; Sat, 27 Dec 2025 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840762; cv=none; b=OkTSJHGWErAKhjENZq8CpHAZ0TkwjARwgKt/jQapTmxZiyc1euZYsDZju9uniNg+JNk1zy2C9mq0h6qI8iB/mns5NaU6lbP2l/S6CNZa0rdqB9gXDDQ6o2nMrldAfu32IWb9QBCUPrUV5ZPBXnappnsQZ/M5U7Llkp7tvaj09jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840762; c=relaxed/simple;
	bh=bnlqP3WejZcE6JnNqqMMnXH6+vrOTDNv51u7HrBBnmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+aWpmqJ9NX0NNjcQcmzCEInONpaWjtsxpMGv2metdzqSJiPmKD5z7l0SzbmXU6qLhT6mv+8slOm8Q3BX3fOPHNpiTRYV0QupsfAhamRRJ02aNYgrJKRWkzYRkMf6WqbqYkxJUjknKGLuxqBhXyQKCRpKKyo+FHWAUnlM5XS1+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZWTS3qD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZWTS3qD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1072C19422
	for <loongarch@lists.linux.dev>; Sat, 27 Dec 2025 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840761;
	bh=bnlqP3WejZcE6JnNqqMMnXH6+vrOTDNv51u7HrBBnmA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bZWTS3qD0kscPex9A+70GSUxA/0gBLInlj/ZdKsmID72E9pYgeNZOv9t4L/XUQUIg
	 YSAVV5ZOoxY1TgPOmM+/Q7O8z5q50D3guxwKSnULQ1Mhi063AUh9YD4n8/AiPhy5fE
	 Hhg2ws28TXXLE/NbDH4v556s4BODZp9z71eEcUAurWAdifataDUZe/bYcxm3ekMJBQ
	 Wjql+N6ITOevbHdl97OG3HDuwP7RrOQDC35VZU/S0CRrohF51Mck5eg0qPRa4lekhp
	 vkhHob6WZMBK45Nr1nbPuRlKxQAUwEFbaXWLWvZUgJWvBA0s+zFpcbqiLDmIT1AEAo
	 awlvNt5caY+DQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7ce5d6627dso1347813566b.2
        for <loongarch@lists.linux.dev>; Sat, 27 Dec 2025 05:06:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxCOG5YvnDODAAJT7vN4zAMLJD7myqM89fz47gznFaTUTIAaXJZKjs55HLO3ueqpfWaSPnLs98SzU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1E/fLDIGh0DaFbHG5+b/qmhX9t2V+4FfbgsUw0GRWl8h7/51N
	jpyswZ/jarKN4mF2+qFUAMr44QISNwEM6SmEyQsyFMsAICGesDPoSFnyszOAcezdLvZofbhKujw
	jypVS4U7mPgYn0MRAry49HKfQjFJDA/M=
X-Google-Smtp-Source: AGHT+IESJUVD0Sj7UqDj0ZjPzZA5ArGpUDpGCgH5jqClkFhIx6ezWaGQwsiYVxT8+S+Axq6++0gtGttQ0LThGajnM28=
X-Received: by 2002:a17:907:1c27:b0:b75:7b39:847a with SMTP id
 a640c23a62f3a-b80372228e5mr2892786466b.60.1766840760220; Sat, 27 Dec 2025
 05:06:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1766037997.git.zhoubinbin@loongson.cn> <7a0df6f836e0ec7ddfe4d592c10259c87ef96e4f.1766037997.git.zhoubinbin@loongson.cn>
In-Reply-To: <7a0df6f836e0ec7ddfe4d592c10259c87ef96e4f.1766037997.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 27 Dec 2025 21:06:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6LoF_raks89e+i3K48g0hmnhu3eJbSu2Tkpr9nNzM6iA@mail.gmail.com>
X-Gm-Features: AQt7F2ohh5YfPyb2UrWwlmfBbouHVPpjxVIci8u--dXlQ9be3QFY15Nc1ufV8S4
Message-ID: <CAAhV-H6LoF_raks89e+i3K48g0hmnhu3eJbSu2Tkpr9nNzM6iA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: interrupt-controller:
 loongson,pch-pic: Change to unevaluatedProperties
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Yao Zi <me@ziyao.cc>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Fri, Dec 19, 2025 at 4:47=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Change additionalProperties to unevaluatedProperties because it refs to
> interrupt-controller.yaml.
>
> Fix below CHECK_DTBS warnings:
> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: interrupt-controller@100=
00000 (loongson,pch-pic-1.0): '#address-cells' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/interrupt-controll=
er/loongson,pch-pic.yaml
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../interrupt-controller/loongson,pch-pic.yaml         | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loong=
son,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/l=
oongson,pch-pic.yaml
> index b7bc5cb1dff2..cf235ca57a2f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch=
-pic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch=
-pic.yaml
> @@ -14,6 +14,9 @@ description:
>    transforming interrupts from on-chip devices into HyperTransport vecto=
rized
>    interrupts.
>
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      const: loongson,pch-pic-1.0
> @@ -34,14 +37,18 @@ properties:
>    '#interrupt-cells':
>      const: 2
>
> +  '#address-cells':
> +    const: 0
> +
In the example address-cells is before interrupt-cells, so I think
here it is better to put it before interrupt -cells.

>  required:
>    - compatible
>    - reg
>    - loongson,pic-base-vec
>    - interrupt-controller
>    - '#interrupt-cells'
> +  - '#address-cells'
The same.

Huacai

>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |
> @@ -50,6 +57,7 @@ examples:
>        compatible =3D "loongson,pch-pic-1.0";
>        reg =3D <0x10000000 0x400>;
>        interrupt-controller;
> +      #address-cells =3D <0>;
>        #interrupt-cells =3D <2>;
>        loongson,pic-base-vec =3D <64>;
>        interrupt-parent =3D <&htvec>;
> --
> 2.47.3
>
