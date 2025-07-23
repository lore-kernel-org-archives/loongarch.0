Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA09D5223;
	Wed, 23 Jul 2025 04:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753246304; cv=none; b=HwZiyXmoQIjpbWGOUaRe9F8vKSjdf3Mbn3n4Spwro8lPQ1CruucCw66nqTHce5KMe15SYYevHBi77AEvEvURkmOafUEMzBK43HGcLHRw2Mv1DXTXOFNT1V4kw2u/cmZBvLlKq4vt2g5ZGM0qwuoR7XNpQYFhq833vPUGKOxsM78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753246304; c=relaxed/simple;
	bh=c5i2bIwG0Z+7skW9ZiHKvSW09i+jTKJfniaboye5Wkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIPE2ZdITHLahXM4Gz01SZaJG6S60ZcVFpgYQNB/c2UsquDZKyGaxc+2KHEHbFjzpYW1SRmdFydos5l30PDd9oaCtYMjYeZ/hsJ2enN1GNDgJEbeWTZada3nI8zrjl44cBhcE46ok/Et83sAWpOR0EF4sUPCcdUb1uh2V6gIN2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNGzEx7H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNGzEx7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448FBC4CEE7;
	Wed, 23 Jul 2025 04:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753246303;
	bh=c5i2bIwG0Z+7skW9ZiHKvSW09i+jTKJfniaboye5Wkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNGzEx7H2RrKv41icPRYaa2omTkYItLJMuKbqQ0wbF7Bw24ac+vB7AbMjYdJ7UT1C
	 qRHjCfFDd/omD5E/H5L4tKH2mCiMeG0AfyKM8Xno7njfbd0IxT037oY/nG8rNDUP4e
	 kN8CByMwzTPWUkTPBp93QRfpSqr+9FwnRJz3H+ad7VIWo060gkaPNXV3r1Hu11UKMe
	 KUREnxJ1Bmt5LAiVEMX7sjoFXudekIvP0LBXqLY3bXUGOzqdzyMWN8arqQZiq7sSds
	 N4JtG/sYQEitjv74LKnmCYdw3Wt2Wbrds8zibYE2tpMVBQ6+aQw84vytXZwHP6LY1W
	 mxpAGFts9VDYw==
Date: Tue, 22 Jul 2025 23:51:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Xuerui Wang <kernel@xen0n.name>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v1 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K0500 NAND controller
Message-ID: <175324630208.1226180.15885418620531152001.robh@kernel.org>
References: <cover.1753166096.git.zhoubinbin@loongson.cn>
 <588639de591ada408bdaeb0d279c5d62a4b53d61.1753166096.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <588639de591ada408bdaeb0d279c5d62a4b53d61.1753166096.git.zhoubinbin@loongson.cn>


On Tue, 22 Jul 2025 17:11:04 +0800, Binbin Zhou wrote:
> Add new compatible for the Loongson-2K NAND controller used for
> Loongson-2K0500 SoC.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/mtd/loongson,ls1b-nand-controller.yaml         | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

