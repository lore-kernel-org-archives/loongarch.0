Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87D118E743
	for <loongarch@lists.linux.dev>; Fri, 23 Aug 2024 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724434499; cv=none; b=a0vKZK9n8qQEA0lhed17YzSsJtUbERu6IGhGwfTVCuzdKCZ0W/TK2nZV2FhNpk4exJwzi/vFHPJqPcPorskAg3F5+GGVdXAVEpM9Rxn7LqYMoeo0tlRUR5mbG2A1qP/9AEY8wuBoZAOI2a7alvi+cIQCcP8m4XuQfNktlJLiloI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724434499; c=relaxed/simple;
	bh=NFF/2cUYTJ/4NeMO0Tzg66sX7A/koDNnPT4RhW4dHjg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=If7GI3yqIBNlPFC4/21PQ58v6j86JTRB/3ZqRkjm5jc67TtEFeFsHorcNmO9k+ErKJBfvO4JYmSNL+FmIMx1haXR+BOx+4fOuJiLoxYGV+z9Tc9Dp/LnEpf2DOmnplAKghOnvkVrLhsEMj1+zUOi9+gQMNKeufeZy5BXnA5FYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S+QPm9nO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JuM6tkxk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S+QPm9nO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JuM6tkxk"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724434495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NFF/2cUYTJ/4NeMO0Tzg66sX7A/koDNnPT4RhW4dHjg=;
	b=S+QPm9nOrOJws9Vm0SHeksL8GW9so7vvVwkZlu7RsYdN2MrsduWTGNGQu94uThg4aEInrr
	JXxQwjdxufbvOfCgXKJ5+Blj8eggpoEvGZ6eNk/TnRCdsVJYnbhYTtZUsGIlmwV3fM9E8j
	b5l6TUaw7PpLCOE+amQ9RZs1LwRJy1geMkRBBJ3T7WFlcdkl74MlSMvjWT1ZXTR8WsKv9E
	XzHIUnXhyJnvPHn5b789gYUIIsF5MXIILot8MCaru0MVjZOsn3rZdvmNg/3d3dQrmfzW3o
	HmFKCU0GfOY/l6V58S7Z1LmUo7cJg3eflmYc9ivYgQEuUL1j5St7VV3ZT7OgPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724434495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NFF/2cUYTJ/4NeMO0Tzg66sX7A/koDNnPT4RhW4dHjg=;
	b=JuM6tkxkuEFodDxWTvecvRItoc5MGVKSqJV9fKejZzz+JKSdQe0cquOB97aPo4DZENi+kN
	QubMap1XKSg0egCQ==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, corbet@lwn.net,
 alexs@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 jiaxun.yang@flygoat.com, gaoliang@loongson.cn, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, zhangtianyang@loongson.cn, yijun@loongson.cn,
 mhocko@suse.com, akpm@linux-foundation.org, dianders@chromium.org,
 maobibo@loongson.cn, xry111@xry111.site, zhaotianrui@loongson.cn,
 nathan@kernel.org, yangtiezhu@loongson.cn, zhoubinbin@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v11 2/7] LoongArch: Define ARCH_IRQ_INIT_FLAGS as
 IRQ_NOPROBE
In-Reply-To: <20240823103337.23602-3-zhangtianyang@loongson.cn>
References: <20240823103337.23602-1-zhangtianyang@loongson.cn>
 <20240823103337.23602-3-zhangtianyang@loongson.cn>
Date: Fri, 23 Aug 2024 19:34:55 +0200
Message-ID: <87a5h3gn28.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 23 2024 at 18:33, Tianyang Zhang wrote:
> From: Huacai Chen <chenhuacai@loongson.cn>
>
> Currently we call irq_set_noprobe() in a loop for all IRQs, but indeed
> it only works for IRQs below NR_IRQS_LEGACY because at init_IRQ() only
> legacy interrupts have been allocated.
>
> Instead, we can define ARCH_IRQ_INIT_FLAGS as IRQ_NOPROBE in asm/hwirq.h
> and the core will automatically set the flag for all interrupts.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
