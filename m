Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF9613D882
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 22:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723068292; cv=none; b=NJeSSqNB/WTy03OqpTR5xrG4mM4FebNY3uz+rLL59vH3fGcqoKX9WqRo+agSZOW/lq3Pbh0hYUASMMixcM60n+SgDMAWrb9kCUDUCRDM35XWBw1viaSDfRCdXAr3/Wq9H+gaujAAGNKS0VxpzDIlw72d4TIQyd/WdjwP6j2sBEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723068292; c=relaxed/simple;
	bh=Gjkxy5f6gJVy6vNpMxHuQURheufrPQs99qjqz/bpXZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gkATb3EWIZ/Cs/tiI78aa6P4JCr06n8cXFkhr2O0uOxTGg3IWUyopoe32vKHZdgFPJ7AYKODuAOuQx96l4Xk9U+4781/NzA027KgwNcglvN6VVeMoR6GJBZ3pGQ0tgNiyjUkpZbJV/QEZ8FXGBFDcq+Wwub6trtU91Br2WO67F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=18AbZMxk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tplhZKE4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="18AbZMxk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tplhZKE4"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723068289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgk3Fst2WMnEhsUwWJQ7yJneI6QzoUuA5p9aHlKtEE4=;
	b=18AbZMxk7jboDeOnt25Ydoj1drhf6mSXl8Nbg0WjY63dh/YqPrlWNbopyB2jWlWT9H+9Br
	RhAE7GpUxxJeiGOGX4HHz4scWX+YPsa8Y0oa8OfZXJHvqXXVc0zaJ680FLj53fqS4Sl5xr
	urGzCzKcN8BUCaI5G1Vmq7ok3Hm73vSrb3alfwCtrbmLTBDbI9hOefTOjoNWb/2DD6K3y5
	7/uDKb/LUfSCoypBKf3c5myHZtrdz/+K7Vkge5IRBc/Db5lvDS193L/sjL4JIKJobQ23Tr
	vM/dQNdKD7fg05TEWuEdIqkij657KYOIivYnQotnM4/TfU4l8i0S2hSXWI2pxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723068289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgk3Fst2WMnEhsUwWJQ7yJneI6QzoUuA5p9aHlKtEE4=;
	b=tplhZKE4F/TO3X8SqiY9s5lRMpFLShtTKxy+suRMFjdxSuxzDWPPHOQx88Fkbg/N6V2keI
	65DDIoE7kDefoIAQ==
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
Subject: Re: [PATCH V8 2/2] irqchip/loongarch-avec: Add AVEC irqchip support
In-Reply-To: <87le180z8b.ffs@tglx>
References: <20240806115557.4750-1-zhangtianyang@loongson.cn>
 <87le180z8b.ffs@tglx>
Date: Thu, 08 Aug 2024 00:04:49 +0200
Message-ID: <87ed700z26.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Tianyang!

On Thu, Aug 08 2024 at 00:01, Thomas Gleixner wrote:
> On Tue, Aug 06 2024 at 19:55, Tianyang Zhang wrote:

Please make sure next time that the two related patches are threaded and
have a cover letter ...

Thanks,

        tglx
