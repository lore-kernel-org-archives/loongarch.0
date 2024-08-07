Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC31915359A
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723068215; cv=none; b=kToVMz8655WwJzOAmBB74+/dXliM6cyhyhvTimRG1WepZqbcz8V8dkd6H77RKWgQsuAC3F15WmjCA8gRhfSk2lMTNm1v+jKcO7zDChxQ+h+TsaY3AnjlU2tNYyfQXbDZGaxcihGcuCdTOcSOe7tGxW9IqeErEFctbcvrJ6VXJIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723068215; c=relaxed/simple;
	bh=qc16byn3ghSUeajrTNZZfu67gQEZGCpp2eVLadjMeXI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DaRW+Zt9QTExw2iu1s2JvMP8jo4/LnBInSLMWIC5Hj2+PMbyI+RKoRX5yc3ZuHVPRiOpS5javfIwK/ZjJRHFAsLUk07KQMOnpBLymcQ9xWCk6uUeCVdv38ktE1kY0PNRiKDCvFDfw0oTqT3Av1RDS044doayw9YLTmbh4jDAfZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i9bAcj8g; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5SzbqhtE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i9bAcj8g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5SzbqhtE"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723068211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=idaTkTxvS7g1I4rkk4nWkMzXobMXnmoj6e7iBxcCGvA=;
	b=i9bAcj8gKiiZyen0DHRyLVpgB4aVFMyxEZEAwCY8HPddVKm95gomGXOf3u6vANQ7XM8qW6
	HvB8gDS4IEG5/RXSygeQp6bZdkRm/mSTDDvyOyyHUmGK1vKnO4Fn9E1/ec6SqmjbsrBTqA
	oN4cPF/WWz4DjVlNJmP7F/8KRr/5AlYdGLyPxEwVDo74jWlN5BNyuWpmSS+Hc8LYDidPPX
	gtlNjHff2j6bemWV1ToF6W/3+iUJFQRRufEibBXV16QYK6s1cQZRWFIiDwEdEBSh+nu3Va
	xNpQbdLmHWXHveqpImmhJ45gKwkMvD/bDJwgK9g/yWYLBNQAjD6xKavM2jR7/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723068211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=idaTkTxvS7g1I4rkk4nWkMzXobMXnmoj6e7iBxcCGvA=;
	b=5SzbqhtE4+BjdgUnIiN5YcI5ENzYU9H+nGTjXMa5hgvxljYnTJF0VslEWi07NX+xdYqgxI
	ZgDZz9/89EE9+ZDg==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, corbet@lwn.net,
 alexs@kernel.org, siyanteng@loongson.cn, chenhuacai@kernel.org,
 kernel@xen0n.name, jiaxun.yang@flygoat.com, gaoliang@loongson.cn,
 wangliupu@loongson.cn, lvjianmin@loongson.cn, zhangtianyang@loongson.cn,
 yijun@loongson.cn, mhocko@suse.com, akpm@linux-foundation.org,
 dianders@chromium.org, maobibo@loongson.cn, xry111@xry111.site,
 zhaotianrui@loongson.cn, nathan@kernel.org, yangtiezhu@loongson.cn,
 zhoubinbin@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH V8 1/2] irqchip/loongson-pch-msi: Switch to MSI parent
 domains
In-Reply-To: <20240806115546.4558-1-zhangtianyang@loongson.cn>
References: <20240806115546.4558-1-zhangtianyang@loongson.cn>
Date: Thu, 08 Aug 2024 00:03:30 +0200
Message-ID: <87ikwc0z4d.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Tianyang!

On Tue, Aug 06 2024 at 19:55, Tianyang Zhang wrote:
> From: Huacai Chen <chenhuacai@loongson.cn>
>
> Now remove the global PCI/MSI irqdomain implementation and provide the
> required MSI parent functionality by filling in msi_parent_ops, so the
> PCI/MSI code can detect the new parent and setup per-device MSI domains.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Lacks a SOB from Tianyang. See Documentation ...

> ---
>  drivers/irqchip/Kconfig                |  1 +
>  drivers/irqchip/irq-loongson-pch-msi.c | 58 ++++++++++----------------
>  2 files changed, 24 insertions(+), 35 deletions(-)

Nice!

Thanks,

        tglx
