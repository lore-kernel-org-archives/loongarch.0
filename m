Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660325A357;
	Mon, 29 Dec 2025 23:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767052172; cv=none; b=KTatUD4fZ0lz8oBfznG4PIFRXWJkVX+2JTOYd3zKf7EFJiBW+1KJwuJAs5nS9YCpDlYDsWpkLKxvr+rjSlE6zZPGTGLGS4mNUG+CyWyTn0TtUZjV1qQeDXitz3Lxb6LmWhaEsyAbGa2Mf5ythiWs74862NzF8xnI+mxdifqktew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767052172; c=relaxed/simple;
	bh=x/eR97Y5rrsMQnngS8Osv1jngQ1seqUPrn8OhBjcAk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZy4y+3MoRK/bzqlHAYAfOqtHjsLri4DlH53C1KZQEAei67vFo2wtknljqonxgdMi85dEPvtzh70mokC4AuQRGmj68uGZwIaQVlDVgN2hTsc6TUHOQ54U4CgzcciKlOvSMh1aijEc7ZD4sxSyQhgZtIb+DpEcwQQxO3LVetjOlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqvzdWwe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqvzdWwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D201C4CEF7;
	Mon, 29 Dec 2025 23:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767052172;
	bh=x/eR97Y5rrsMQnngS8Osv1jngQ1seqUPrn8OhBjcAk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqvzdWweCC/auq1WYqiWokzLJ5EPPWf0QQ0Defqs61hrDk3osxmEgp8fnlVLNWdxx
	 +g81R78dt6tzbBbP70ZCPVq2NpCPC53qgRlZ4ZRaFyEXM+K27w1TgVSyl577L8nJ17
	 GLvneBVNi0rR4QA+JYOrp69rx9ooUh/Ww0Sf2ChB5UDl3pYDsuZGkg7wbYDT0g2mMg
	 diEik20Yq/K/jVLpOrLYkTspYACJ2yHjc09qpAWVxMqX8h7ItQ/YvTkeeXJzqIjegg
	 ZA/5yXJKAPbY+u7ecdwbTPvM9+4pC15SmxTKUMh0nPHJRFvL4qvb37YaHNjaRnJf+j
	 iqr43CcUG9lFg==
Date: Mon, 29 Dec 2025 17:49:31 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Yao Zi <me@ziyao.cc>, Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: interrupt-controller:
 loongson,pch-pic: Change to unevaluatedProperties
Message-ID: <20251229234931.GA2804566-robh@kernel.org>
References: <cover.1766037997.git.zhoubinbin@loongson.cn>
 <7a0df6f836e0ec7ddfe4d592c10259c87ef96e4f.1766037997.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a0df6f836e0ec7ddfe4d592c10259c87ef96e4f.1766037997.git.zhoubinbin@loongson.cn>

On Fri, Dec 19, 2025 at 04:46:49PM +0800, Binbin Zhou wrote:
> Change additionalProperties to unevaluatedProperties because it refs to
> interrupt-controller.yaml.
> 
> Fix below CHECK_DTBS warnings:
> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: interrupt-controller@10000000 (loongson,pch-pic-1.0): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/loongson,pch-pic.yaml
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../interrupt-controller/loongson,pch-pic.yaml         | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
> index b7bc5cb1dff2..cf235ca57a2f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
> @@ -14,6 +14,9 @@ description:
>    transforming interrupts from on-chip devices into HyperTransport vectorized
>    interrupts.
>  
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

This is not really needed because interrupt-controller.yaml is applied 
to all nodes named 'interrupt-controller', but fine to add.

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

This part is the only change actually needed.

>  required:
>    - compatible
>    - reg
>    - loongson,pic-base-vec
>    - interrupt-controller
>    - '#interrupt-cells'
> +  - '#address-cells'

Unless there's some guarantee that this node is *always* referenced by 
an interrupt-map property, then it's not really required. After all, 
presumably things worked without it.

>  
> -additionalProperties: false
> +unevaluatedProperties: false

Also not needed.

>  
>  examples:
>    - |
> @@ -50,6 +57,7 @@ examples:
>        compatible = "loongson,pch-pic-1.0";
>        reg = <0x10000000 0x400>;
>        interrupt-controller;
> +      #address-cells = <0>;
>        #interrupt-cells = <2>;
>        loongson,pic-base-vec = <64>;
>        interrupt-parent = <&htvec>;
> -- 
> 2.47.3
> 
