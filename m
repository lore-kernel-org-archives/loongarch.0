Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B2D19343B
	for <loongarch@lists.linux.dev>; Sun, 24 Aug 2025 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756050037; cv=none; b=m5DuKi9gzJkroq4bbFn8/h1d+3Prj4n5rwu8SNlB+bEFrK7dXS7/dgvWR9gHBGVRwG3cFjYuUFGmQ9Y5Febt1ywGxs2m26/9PXZDN3HIvz6qPDGn7dHSZS3jLbRG02qMRIVVjpDNNz+z/2dB7sjV+BhHPL7Dq2HcGBS+s7EakNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756050037; c=relaxed/simple;
	bh=qT3IN5JZqK0a9mJ1NdYp7+MaE8c9peEsfZLm0EqhpRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IryErUoYXsWKU4fQqE7MSEcBJksSeK6lzAxAKY27YbFIZ38yIwC+ypsyzyd81+1kuch4snUq7BBOHYrMd0kCd8X3yBgVHnEsIt3R5VmoqNBlSRMtxG3f+RO8JDvsGpJiO2GTnRiXIBjx6rcOnkDDxyrBeueFIF4Z3zoE2dOWLbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WeEmgYIq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WeEmgYIq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 60B8F4E40708;
	Sun, 24 Aug 2025 15:40:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D32E605F1;
	Sun, 24 Aug 2025 15:40:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADFCB1C2282BF;
	Sun, 24 Aug 2025 17:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756050031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MotUNYtWFgc8OORlfbN4GS88Cb0UZDtllVzLDmU3zCs=;
	b=WeEmgYIqPuzO2yFtzWo79qo6u1aKpCZcQqdmC+eR1l5vXDo0+xGHRsipk77Gd9/41kY2ij
	eqh8sKV8o+fwY3eqeGstLQHjqhxyggIRr4oZdhsK8BpX6LS8tj8eYKx9zpp+iUGWdV2sCl
	+kROdgZ3j6NjY/y4KrBi7cDAVdVHOQd4xeN4qvuhIyoD8DwvgzCf3QtK/Pd/JYNHNbYvtn
	k4PolOE1pSxmJ0tiKmm8/g+Uw00O05eriwioFivwCe3cFVoCCFCD94YQD2HI597g1ZJ2Ck
	pEQZT/LC99A3PXsqtIbt+byL8acVH6FPo2MIrWHNezxau0S6OgvwM6ooBuAV7A==
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
Subject: Re: [PATCH v3 7/7] mtd: rawnand: loongson: Add Loongson-2K1000 NAND
 controller support
In-Reply-To: <f01986dcb9f16450bd7f38c8fd663df686e6d145.1755757841.git.zhoubinbin@loongson.cn>
	(Binbin Zhou's message of "Thu, 21 Aug 2025 14:39:21 +0800")
References: <cover.1755757841.git.zhoubinbin@loongson.cn>
	<f01986dcb9f16450bd7f38c8fd663df686e6d145.1755757841.git.zhoubinbin@loongson.cn>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 17:40:02 +0200
Message-ID: <875xeclodp.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 21/08/2025 at 14:39:21 +08, Binbin Zhou <zhoubinbin@loongson.cn> wrote:

> The Loongson-2K1000 NAND controller is also similar to the Loongson-1C.
>
> It supports a maximum capacity of 16GB FLASH per chip with a maximum
> page size of 8KB, and it supports up to 4 chip selects and 4 RDY
> signals.
>
> The key difference from the Loongson-2K0500 is that it requires explicit
> configuration of the DMA control route. Typically, it is configured as
> APBDMA0.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../mtd/nand/raw/loongson-nand-controller.c   | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mt=
d/nand/raw/loongson-nand-controller.c
> index 7b331d0ca2f0..6610c239f721 100644
> --- a/drivers/mtd/nand/raw/loongson-nand-controller.c
> +++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
> @@ -73,9 +73,18 @@
>  #define LOONGSON_NAND_READ_ID_TIMEOUT_US	5000
>=20=20
>  #define LOONGSON_NAND_64BIT_DMA		BIT(0)
> +#define LOONGSON_NAND_DMA_CONFIG	BIT(1)

You're reusing this flags member, so it's fine, please ignore the
previous comment (except the style issue).

...

> +	regs =3D devm_platform_ioremap_resource(pdev, 2);

Would it be clearer to get the resource by name? (not a strong request)

Thanks
Miqu=C3=A8l
