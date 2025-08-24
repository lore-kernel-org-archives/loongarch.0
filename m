Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D512DA740
	for <loongarch@lists.linux.dev>; Sun, 24 Aug 2025 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756049222; cv=none; b=nl0NNN0okpqvHgKMs81Lg6MBoANI1/yWr9SvCLrtilAQGcZSvgj2sO5nxZ5XmCW4I1+Fb85jj3b0kDQNLs94juAkQ1jx7xXfpmqyetLGovquYBCE/17tOqn+FQwAujMXDVWXdwnK6jAEeZ9y5i5WUMeRUjqwfeWXQ2iV1+91xY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756049222; c=relaxed/simple;
	bh=iSA52mppQq6VEdZILw6vObSiFbOmgxHmb/zZhprKPGU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f/oTHAMSDvWrEeqkbS6fln91R2KTHW1uwX5yJVXTtwoUZLEy3iyVc4qUTWW4mgDUFsjS9JyTTL4cFxkt+8Ql0+vcur/iszdQ2egCcQo9+b9ADjB68Z+RQcnqPqwoCOgMRvNIwYzrg6iNAm7rwJCTuRa9n/MUG3ObLzgFLBkFIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=th1hQciU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="th1hQciU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5AE1C6B391;
	Sun, 24 Aug 2025 15:26:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 895B6605F1;
	Sun, 24 Aug 2025 15:26:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 408F11C22C53D;
	Sun, 24 Aug 2025 17:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756049216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W37avhcOHPEOuToxYLINfB6zYTm39to0zmX0Je7/jPg=;
	b=th1hQciUjmRNbv6BLnof91Y+bfzBVGqM5CSdEEtcq2ZOgLFK3zycmKvAYKHUAFtJf45ale
	n3VDtvOzQJc+R9Hxt/awwsYepOXPBNFF+pGW1CZK9MNF38dqaCkG5jALOhC1LMlsqrLk+P
	lY+3KDFH8/975O03IlsyD3bW/CvOLKO26AThr8eq+ikNiL2GeLe7bVDbN0Ypbg431digiT
	e1ik5t2R/6MPJ43QlfrwhCv98hKr7zDqEXF8uR/tPasK4GHDo8EyyQ3JstFfA1VzLjx+KJ
	SAKuBILUzO5wsYqAG+Yrb3GURZGS9lkEFjfWnTr35wuKoYFeng9T4NeMPAqtdw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,  Huacai Chen
 <chenhuacai@loongson.cn>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Keguang Zhang <keguang.zhang@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Huacai Chen
 <chenhuacai@kernel.org>,  Xuerui Wang <kernel@xen0n.name>,
  loongarch@lists.linux.dev,  devicetree@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 5/7] mtd: rawnand: loongson: Add Loongson-2K0500 NAND
 controller support
In-Reply-To: <589b4dfab9c1edd95fa05cba80ec58ea9ca099da.1755757841.git.zhoubinbin@loongson.cn>
	(Binbin Zhou's message of "Thu, 21 Aug 2025 14:39:19 +0800")
References: <cover.1755757841.git.zhoubinbin@loongson.cn>
	<589b4dfab9c1edd95fa05cba80ec58ea9ca099da.1755757841.git.zhoubinbin@loongson.cn>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 17:26:29 +0200
Message-ID: <87ms7olp0a.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Binbin,

> +#define LOONGSON_NAND_64BIT_DMA		BIT(0)
> +
>  #define BITS_PER_WORD			(4 * BITS_PER_BYTE)
>=20=20
>  struct loongson_nand_host;
> @@ -83,6 +104,7 @@ struct loongson_nand_data {
>  	unsigned int hold_cycle;
>  	unsigned int wait_cycle;
>  	unsigned int nand_cs;
> +	unsigned int flags;

Can we turn this into a boolean instead and give it a DMA related name?
I'm not sure the list of flags will extend rapidly...

>  	void (*set_addr)(struct loongson_nand_host *host, struct loongson_nand_=
op *op);
>  };
>=20=20
> @@ -745,7 +767,7 @@ static int loongson_nand_controller_init(struct loong=
son_nand_host *host)
>  	struct device *dev =3D host->dev;
>  	struct dma_chan *chan;
>  	struct dma_slave_config cfg =3D {};
> -	int ret;
> +	int ret, val;
>=20=20
>  	host->regmap =3D devm_regmap_init_mmio(dev, host->reg_base, &loongson_n=
and_regmap_config);
>  	if (IS_ERR(host->regmap))
> @@ -755,6 +777,9 @@ static int loongson_nand_controller_init(struct loong=
son_nand_host *host)
>  		regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, host->data->id_c=
ycle_field,
>  				   host->data->max_id_cycle << __ffs(host->data->id_cycle_field));
>=20=20
> +	if (host->data->flags & LOONGSON_NAND_64BIT_DMA)
> +		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +
>  	chan =3D dma_request_chan(dev, "rxtx");
>  	if (IS_ERR(chan))
>  		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channe=
l\n");
> @@ -770,7 +795,14 @@ static int loongson_nand_controller_init(struct loon=
gson_nand_host *host)
>=20=20
>  	init_completion(&host->dma_complete);
>=20=20
> -	return 0;
> +	val =3D FIELD_PREP(LOONGSON_NAND_MAP_CS1_SEL, LOONGSON_NAND_CS_SEL1)
> +	    | FIELD_PREP(LOONGSON_NAND_MAP_RDY1_SEL, LOONGSON_NAND_CS_RDY1)
> +	    | FIELD_PREP(LOONGSON_NAND_MAP_CS2_SEL, LOONGSON_NAND_CS_SEL2)
> +	    | FIELD_PREP(LOONGSON_NAND_MAP_RDY2_SEL, LOONGSON_NAND_CS_RDY2)
> +	    | FIELD_PREP(LOONGSON_NAND_MAP_CS3_SEL, LOONGSON_NAND_CS_SEL3)
> +	    | FIELD_PREP(LOONGSON_NAND_MAP_RDY3_SEL, LOONGSON_NAND_CS_RDY3);

Just a nit about the style, '|' should be last character on the previous
line.

Otherwise the rest lgtm.

Thanks,
Miqu=C3=A8l
