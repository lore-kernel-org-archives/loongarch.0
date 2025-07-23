Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DE65223;
	Wed, 23 Jul 2025 04:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753246403; cv=none; b=T84n9Hf5yuByqjJsqc0iTAA+WFFmLRgbko02iOXbZGBucrmyTh0b3ixqGdzHVoxbMpwSf328QpxxH53xuTkkW6K60MTahWvofHTw5kvaQUhVFqSq7p+21FtIJd9IagvSnYE0gScTggB0dgqhRV2g2uq5x9PCDVI7YYuBc2kAY5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753246403; c=relaxed/simple;
	bh=6960Oe+ygdAUIT8IES+usufPt7vUmG+j/++rDLnHJ+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0LsmiERHwg51yel0rZznNYk+32KpBqWPo9sGl0BGNSq3/PYnkhl+58stm5sCglfLekiEnddGDlb2QA4IbxiYUe2n0KUM82doRjxeWFtnS9gj/0oBYkcsxSvAalIerCZ8mtnn22//FajCaGA6fQi9a1ztIqkuhqHoNvBneqm1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qeO14F3r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qeO14F3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF643C4CEE7;
	Wed, 23 Jul 2025 04:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753246403;
	bh=6960Oe+ygdAUIT8IES+usufPt7vUmG+j/++rDLnHJ+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qeO14F3rVsqV0udR9lCnw+pfDYgncDn+cJKtQKtaSl+fse3rOEBbpJClTzvUmOTFZ
	 gOmRNs3ADYf/X70gphZHrXQQfyjTort5XJGf+YIHo0OxUoEdsCdQq8DGlUeLQF1OCW
	 fmbLPp0ngcXUKtcNhOTeS79D7Nzf5BCFhNJrffOapSSX1uJnqaww9gmq1zzTb6VWwj
	 JZCz4S7w+zda6Z2DotA0Xg1Fb7TS/cG4/8z76HdCpGyC8QRRp5nztwRf6e2YdECdEC
	 w1XrmaviZFDWACnk4zI5qimuNzdxdiSKhneGRZpDfN5ggzJlYAIQ5UAHWogBd3uPKr
	 irPKyrvnl+QHA==
Date: Tue, 22 Jul 2025 23:53:22 -0500
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 7/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K1000 NAND controller
Message-ID: <20250723045322.GA1226341-robh@kernel.org>
References: <cover.1753166096.git.zhoubinbin@loongson.cn>
 <ed625518c752738cb7e24f6d4b7fb9b62a609880.1753166096.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed625518c752738cb7e24f6d4b7fb9b62a609880.1753166096.git.zhoubinbin@loongson.cn>

On Tue, Jul 22, 2025 at 05:11:06PM +0800, Binbin Zhou wrote:
> Add new compatible for the Loongson-2K NAND controller used for
> Loongson-2K1000 SoC.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../mtd/loongson,ls1b-nand-controller.yaml    | 58 +++++++++++++++++--
>  1 file changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
> index 4ec2b5d1e89d..07a0d9b40fdd 100644
> --- a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
> @@ -26,18 +26,19 @@ properties:
>            - loongson,ls1b-nand-controller
>            - loongson,ls1c-nand-controller
>            - loongson,ls2k0500-nand-controller
> +          - loongson,ls2k1000-nand-controller
>        - items:
>            - enum:
>                - loongson,ls1a-nand-controller
>            - const: loongson,ls1b-nand-controller
>  
>    reg:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    reg-names:
> -    items:
> -      - const: nand
> -      - const: nand-dma

Keep the list and add dma-config here and 'minItems: 2'

> +    minItems: 2
> +    maxItems: 3
>  
>    dmas:
>      maxItems: 1
> @@ -54,6 +55,32 @@ required:
>  
>  unevaluatedProperties: false
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - loongson,ls2k1000-nand-controller
> +
> +then:
> +  properties:
> +    reg:
> +      minItems: 3
> +    reg-names:
> +      items:
> +        - const: nand
> +        - const: nand-dma
> +        - const: dma-config

And just 'minItems: 3' here

> +
> +else:
> +  properties:
> +    reg:
> +      maxItems: 2
> +    reg-names:
> +      items:
> +        - const: nand
> +        - const: nand-dma

And 'maxItems: 2' here.

> +
>  examples:
>    - |
>      nand-controller@1fe78000 {
> @@ -72,3 +99,26 @@ examples:
>              nand-ecc-algo = "hamming";
>          };
>      };
> +
> +  - |
> +    nand-controller@1fe26000 {
> +        compatible = "loongson,ls2k1000-nand-controller";
> +        reg = <0x1fe26000 0x24>,
> +              <0x1fe26040 0x4>,
> +              <0x1fe00438 0x8>;
> +        reg-names = "nand", "nand-dma", "dma-config";
> +        dmas = <&apbdma0 0>;
> +        dma-names = "rxtx";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        nand@0 {
> +            reg = <0>;
> +            label = "ls2k1000-nand";
> +            nand-use-soft-ecc-engine;
> +            nand-ecc-algo = "bch";
> +            nand-ecc-strength = <8>;
> +            nand-ecc-step-size = <512>;
> +        };
> +    };
> -- 
> 2.47.3
> 
