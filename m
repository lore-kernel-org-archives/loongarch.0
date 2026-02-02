Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15413570BA
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026394; cv=none; b=pOv5O5ptyymHwj1G3aRBU2diPRM7dniAHLGbV28H7vyW/LrS+2HpP00ZA1q2mPn+pw2m/zFkFLTCtefM8Vun1gDmVbc3LfPRbRud5NbTj4YemV0+K7mE3KlL9nN4UJFCbvUAV2cN564MQrzkmUWAHimksKgsks97xqBATf2XlLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026394; c=relaxed/simple;
	bh=m14eH5SkrBikH5k6bFBD0mKCFteemijFiTMcA5d+3Tg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NhDjCS/aUi7IyB4WbyE7u6P6+1MH5iFTTmaudzWX6b8ZmH1FelFSg9qgxpWq9id/W5oHgw9QY91GWOdCVhtfHSXEDU59CUBu9izDku10ZAyxl3p0NZDce+VY77NFLTLnxL85xucw7c5beUdLOMBKYlkbOganuELU0Pb00HIOY2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j09KHu8T; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Aw5eyl5G; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j09KHu8T";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Aw5eyl5G"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770026390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m14eH5SkrBikH5k6bFBD0mKCFteemijFiTMcA5d+3Tg=;
	b=j09KHu8Tn7Bz/AZLA8PEOhERhnvJXV0tVVC/ZbMYr+hK6u4Co+AHmS1ATzksgBtTnHW5nP
	Ym/Z9Krm3cWiUigIbK39RpRp8VzhqXSPDFxN7SA8ktJDl9NkEKAE4I20uLUGEQbP+jEOEB
	/SzTEvDtcQK/aHssaFF4mjhXUSGfm7hhXUZApLjoEdqYWfsqlY2yhvlEeZUnR7nyrwarAc
	WIEMG4G/rjcIqMTyYqzu9UeBfgn4OxnRoqbv4XNRDSWfe8Sxef4i9ONV9022oJUxHy9hxh
	7UhmBqmCVqm/w71E/PC6aAfIJthAWGzQE/rZnIKdkXijlKFjCt9dOt9Jn/VZQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770026390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m14eH5SkrBikH5k6bFBD0mKCFteemijFiTMcA5d+3Tg=;
	b=Aw5eyl5GTkxGFlTH3CHG7a1CAY0eJl0kZwQrnljCFWOTTY08zXmFXbnadV5ME9rDy8B00V
	+iRkOQPZ5zXRC7Dw==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v10 2/4] irqchip/irq-loongson.h: irq-loongson.h
 preparation for Redirect irqchip
In-Reply-To: <20260202091041.2278271-3-zhangtianyang@loongson.cn>
References: <20260202091041.2278271-1-zhangtianyang@loongson.cn>
 <20260202091041.2278271-3-zhangtianyang@loongson.cn>
Date: Mon, 02 Feb 2026 10:59:50 +0100
Message-ID: <87pl6nfotl.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 02 2026 at 17:10, Tianyang Zhang wrote:

> Interrupt redirection support requires a new interrupt chip, which
> needs to share data structures, constants and functions with the AVEC
> code.
>
> Move them to the header file and make the required functions public.
>
> including:
> 1 marco AVEC_MSG_OFFSET
> 2 struct avecintc_data
> 3 Make avecintc_sync public

https://lore.kernel.org/all/875x8jmsa8.ffs@tglx/

still applies.
