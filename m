Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD9157465
	for <loongarch@lists.linux.dev>; Wed, 14 Aug 2024 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723632066; cv=none; b=Lty8ZtgGKQ21xZnl+qoN9Iswlv9MZL58s1pZKaauLWWY5Hx4CRw4+BoAUl0lBPVB+Fbbp+h1srJJEKP29QBcpm0j2CGaBfDK4VCYFkveFdD/UPRUTX3SzOfw6TPJ1CIRmP2/c+onyKWYGNQlB3ZC3F4MZcNzZl5ALREeRVmtn54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723632066; c=relaxed/simple;
	bh=xtM8jzPLfJ/0/9BXIypVWdxgi9ZciFXkDdDx2yfPIxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jwh9dw4ftmgOUz73jikc4o7vOuAhYlITxq4ZdGlyAyjjhgzSR2Wm5kv+1pSixBpJuBUUeiyllPGszlIPtmH2OFG+n334qHpxYDWGNlVvlLu+J524AZB/E8l1knN7SuJCSc54zKTcIqHT/JUSW4RTUv94VKMtkxzrXiryQRNkPz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ey6vvyhm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xcTHhM6a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ey6vvyhm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xcTHhM6a"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723632063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtM8jzPLfJ/0/9BXIypVWdxgi9ZciFXkDdDx2yfPIxo=;
	b=ey6vvyhmJcLaaguBJhICQ4dHrYVykyWJqmcmh7/J42GsEOiWo/NmnAMDymmH2uuKW+Dhwf
	ZuRMTjAARs4Iy52yT2YHbkVFF8ai1dgNvrUn/DXn4k0pfEF+2gBN6tEYxvumfvuyK3sP/g
	86GZJ50yitxvu73E3CnD3KT8Eil5GDyHeDeIRf+i70+2EyIptxHLVbUbN67A9lvLVMu2HD
	oZSa+V+FrKjhfklTF+uec9/xK3JtX3/BoUsIIMGJ0XcDhnol622xwErcmUfF6NxJZu9RnV
	6O1XlWUen8A0E+ys6UfIb8Pk0tDWfxWieWnkYVcuGQ5GT3MGSdC9FBStqgjIFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723632063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtM8jzPLfJ/0/9BXIypVWdxgi9ZciFXkDdDx2yfPIxo=;
	b=xcTHhM6avjZM36R4/7HA6QX2axS6TXSdSfKveWZ4HX9SQcFsaQRjDA24wb8Bk6NX29MXVS
	6NJuzlU2s5E0XBAQ==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, corbet@lwn.net,
 alexs@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 jiaxun.yang@flygoat.com, gaoliang@loongson.cn, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, zhangtianyang@loongson.cn, yijun@loongson.cn,
 mhocko@suse.com, akpm@linux-foundation.org, dianders@chromium.org,
 maobibo@loongson.cn, xry111@xry111.site, zhaotianrui@loongson.cn,
 nathan@kernel.org, yangtiezhu@loongson.cn, zhoubinbin@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH Loongarch-avec support V9 1/2] irqchip/loongson-pch-msi:
 Switch to MSI parent domains
In-Reply-To: <20240813085415.20035-1-zhangtianyang@loongson.cn>
References: <20240813085415.20035-1-zhangtianyang@loongson.cn>
Date: Wed, 14 Aug 2024 12:41:02 +0200
Message-ID: <875xs3petd.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Aug 13 2024 at 16:54, Tianyang Zhang wrote:

Where is patch 2/2 ?

