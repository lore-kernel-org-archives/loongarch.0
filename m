Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C942E972B
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026866; cv=none; b=QL2fnhD/lspCB75eskUZqeHgH15iQFYcmXbp++bBKlem5ha2Ycnv3oh+SAA5lKlNGPnJX91J1qi3i0k9P4t5IXAVtqbUoO0L5DpOPQGfSHiZcFQ2OVnfqFPYsTyWHcXEGAFS/mTCvv3VucQ/sl0hvwbNsbfb2CD9xJFkCbR3Qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026866; c=relaxed/simple;
	bh=KqSta0t4KQI/YyMLBT1daHemlSj1RPunMVE+rVW0+ho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FONuNUJ9/CVfarVy+RGgvTR6vglHkZnJ+atqV2wujmbZrOvEWarxl8hE7l7Hqb14ADds4BuFlKkqAZImhJ1odtGrRsAl/zuBI5vxbGYOBtUM7sGUWTxp/ojfdN3kzulFpFFPw8393t3oMznBrw47c25+rMHSLnFsv2aSx10GuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OAUofdx+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IuL2Stt0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OAUofdx+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IuL2Stt0"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770026863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vgKo/2Y7XNk0bqY+u6jsG6nT1KZIz5J+eZsVkaeHKFs=;
	b=OAUofdx+MLSj+Q5h6IdQ0jqKe42OEmwpvZGNthyHdhL/D//I6nyjhGbXmr3vmffYATpxgP
	S5vxbZKDO2QgXhOUE4aSDIgT2aMftHf7zpQR1SXvKfoKYhBDFMzWf6HQMOf9FNDy8ui30L
	CNz2iqIHKHc7Lv0uXEkN0HqqLauApE/W+7uoGpebhrBJ4a1EnSD25TqaNb7hp2OoTokjCk
	EgtZb7kwYmlVtb1afgYFiK5m1VmV+lvgWamofMaIciGLXh6fEu856PWGundM8nFkuwNiEo
	ji5D7sY9ZXxS8Cq58w25GZmR8CjZ72s0hzRnfNUqshB/56pZQQmUwAnUkey5ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770026863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vgKo/2Y7XNk0bqY+u6jsG6nT1KZIz5J+eZsVkaeHKFs=;
	b=IuL2Stt0IgwdBLnfud47oOlWK57jsSq1Xwt8qJjn2CRVYrZ95EHWLdW1nOs28oTchWMTiA
	NOKLvUz33cfekvBw==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>,
 Liupu Wang <wangliupu@loongson.cn>
Subject: Re: [PATCH v10 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
In-Reply-To: <20260202091041.2278271-5-zhangtianyang@loongson.cn>
References: <20260202091041.2278271-1-zhangtianyang@loongson.cn>
 <20260202091041.2278271-5-zhangtianyang@loongson.cn>
Date: Mon, 02 Feb 2026 11:07:42 +0100
Message-ID: <87ms1rfogh.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 02 2026 at 17:10, Tianyang Zhang wrote:
> +static inline void redirect_write_reg64(u32 node, u64 val, u32 reg)
> +{
> +	return writeq(val, REDIRECT_REG(reg, node));

Again: What is this return for?

> +static int redirect_table_init(struct irde_desc *irde)
> +{
> +	struct redirect_table *ird_table = &irde->ird_table;
> +	unsigned long *bitmap;
> +	struct folio *folio;
> +	int node = irde->node;

It seems to be really hard to do a length based sort.

Oh well...
