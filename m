Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D33074BD
	for <loongarch@lists.linux.dev>; Wed, 10 Sep 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494544; cv=none; b=Sj5YDAyfx++kgGXEn5IB5B877Rpl/siVmDjlBeEZHE9V1awg5mgxrY3QeeujNdZ/BdTTFz0Tg5IXOYE2z68C5GtKCVdY6ohs4dQuTPjqfOvk+xShM2MYpimjWNt7GukLBuUD3r7aULAuEqeNYKcngrT4LXj5iJjUQ+1Zwjwfz3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494544; c=relaxed/simple;
	bh=xa9auGg8cwqhPNG0DFih02jn1l20IbvqO550FrgoUcU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fEQotIvL1n4N78lM61RqD9R1N6iglYxdetbmVI8RhdjfPNnuLkKADgXph6pfgwRsw5Bv1673CHc9z7a/rTVoVusNFfO2HAXEkpaEa0eKwqB8ZgLFIKtieMD274qEsEzK3VvJqlmE0W0uhOwP6q3Sa6DzBDCHgbKa2rY6N6Kh048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=naov1dQz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="naov1dQz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9F667C6B3AC;
	Wed, 10 Sep 2025 08:55:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 561B7606D4;
	Wed, 10 Sep 2025 08:55:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 493A8102F28B2;
	Wed, 10 Sep 2025 10:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757494539; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xa9auGg8cwqhPNG0DFih02jn1l20IbvqO550FrgoUcU=;
	b=naov1dQzy5RX8zG17asjtec42pCCqEJSVEwtsIoyuSWmnS/CkepAtfPQR80S6a5tmqfXJP
	doOWqlr3m2PvJHGcALeZI2rXQGYBaYyf4SRnpPYFhHdDirDtnc/3ANrpoJtMYZcsEbk7qn
	MS9PGc+bD9HHMgEFMXUNL2Qa5kYUTrG7LRgbRxBYksPAR0ODNv1JOd/2BIrycZtH3JvdgK
	1ydED6axMydA4qf4cH/Lic8I8rsxOV44Rm6SUiSpbg2E0tBnNImoBz3QsF8pIk6KEo6di5
	s9F2SaCfrxzuTQm4+6ywJb7ZPcz/6spumNInJM+yRS8eIejLSq3UPWBqcohn5g==
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
In-Reply-To: <87bjnielsa.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 10
	Sep 2025 10:47:49 +0200")
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
	<8c804abb75277f0ff389151c1cd58c94f2b258ca.1756991031.git.zhoubinbin@loongson.cn>
	<87bjnielsa.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 10:55:36 +0200
Message-ID: <87348uelfb.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 10/09/2025 at 10:47:49 +02, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:

> Hi Binbin,
>
> On 04/09/2025 at 21:06:33 +08, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>
>> I am going to introduce the NAND controllers of the Loongson-2K series
>
> Please adopt a more global phrasing, like "In order to introduce" rather
> than the first singular person.

This will be a hint for next submission, the rest of the series looks
good, so I'm taking it anyway, no need to resubmit.

Thanks,
Miqu=C3=A8l
