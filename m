Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5ED30BB97
	for <loongarch@lists.linux.dev>; Wed, 10 Sep 2025 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494089; cv=none; b=TflxP23ofxPRcLeDfWZJBaw1yoys6/E0FFtnltQOtDFe0vVbAsiJZOAEpzUjZxTMkcpIUDFOqGDbTBdBt9c0aETbwYq21Ra4Ve6aWY3eoKsu2PZxpxmu1GGvYekzEczBkxVY1E0jEJZoO1SWcJQZwZ5zQ6D49pHugEQ92y3ZpEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494089; c=relaxed/simple;
	bh=dN+1i6d8UPUpI1B2syCPjraQa4MBlPD0R+WcgvBzssU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d7ztdQgDvySO1Bdr0lsf86v9qMWVpGhIFC8/x0amWQv9GZNM2n8RolCranS+34x88VSvTYvF3hDCFH/6uNqHajcAARyj48APFBd3sRrMR0a+TUT5rORkWAx25ct9uEOv/Jg7gG9jmXRE3yO1qcE/O2U/jEYdd57wi6063lhf85w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XzzO2s+g; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XzzO2s+g"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E8568C6B3AC;
	Wed, 10 Sep 2025 08:47:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD6CD606D4;
	Wed, 10 Sep 2025 08:48:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DABB102F28A1;
	Wed, 10 Sep 2025 10:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757494083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dN+1i6d8UPUpI1B2syCPjraQa4MBlPD0R+WcgvBzssU=;
	b=XzzO2s+gbAYCRDK65qI97IRSh9+XaVduxowWkmB17x9o6kEZ1OC2g5strtFPOv6h+VZTnG
	YYePbp4mpXS3LtlaMNdDk0SFLKgn++vgvrUk+5jBGDgDa68vWdl9eSZ0YEO1vTClikYomj
	VoiyVOWNR8EsrlDMeaaMQbuqf8yn162Y1VdNG2yidqjnBlIbIezpXt+1Bt6qRHvLN0FmqK
	M1ITxZgPiilf4q5Ve9ShN+UD1luo/BvvDAG6P0ufHsjQyfA9E+U44NsxHIhgqHIryhNF2y
	BQ7zTVSjEu0YNeh+ASmZPrktBKYPth53Lm97mGFMzd5Yx0WFqRK5zWF1/4gucQ==
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
Subject: Re: [PATCH v4 1/7] mtd: rawnand: loongson1: Rename the prefix from
 ls1x to loongson
In-Reply-To: <8c804abb75277f0ff389151c1cd58c94f2b258ca.1756991031.git.zhoubinbin@loongson.cn>
	(Binbin Zhou's message of "Thu, 4 Sep 2025 21:06:33 +0800")
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
	<8c804abb75277f0ff389151c1cd58c94f2b258ca.1756991031.git.zhoubinbin@loongson.cn>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 10:47:49 +0200
Message-ID: <87bjnielsa.fsf@bootlin.com>
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

On 04/09/2025 at 21:06:33 +08, Binbin Zhou <zhoubinbin@loongson.cn> wrote:

> I am going to introduce the NAND controllers of the Loongson-2K series

Please adopt a more global phrasing, like "In order to introduce" rather
than the first singular person.

> CPUs, which are similar to Loongson-1.
>
> As preparation, rename all prefixes from Loongson1-specific to
> Loongson-generic.
>
> No functional change intended.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---


Thanks,
Miqu=C3=A8l
