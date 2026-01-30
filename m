Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D169B34FF4F;
	Fri, 30 Jan 2026 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769760851; cv=none; b=dsX6rKmvSBTL4NE2LKBQWlOpuqap9J2e81Ntaw8q5HuHbb6Obdd4jvmCee/zu+v0jqm8hLBASvLpc+M7Sm8Ddq/VjinmAWWszY8TP+t8HZf+BvvonnHbqLblE9ocubW+gkFNT5OoDAWTy92r5vk6g4Kv+dk3grkOUZ0aAPHq6l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769760851; c=relaxed/simple;
	bh=T/xTnGyF/enhfuoxS2sv+kprrbFBjOX4J2fjW88C3U0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a+6qvEWnCyTUh2amqATMePE8MbMPEFeQxWncbJ8mJn0YpT6Oxg1IAqW1UVYAtTTLEWvCtWYgqIU8SVgjOCmlfG96RwmHP+azl3ZCPJg936qib85ePGscOf0hKJY3uwl+pWIbSopN8maVmApuaF4cZw1wq+33d6qhNieL6KqVPZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HT7JjCUc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HT7JjCUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E70C4CEF7;
	Fri, 30 Jan 2026 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769760851;
	bh=T/xTnGyF/enhfuoxS2sv+kprrbFBjOX4J2fjW88C3U0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HT7JjCUcu5J2DvsQr2lzz6QPIY2ZwnZPR2rvauDa+2EcqzyzRJStEfI1NM6/JBY03
	 FVaAY5EE1zNpJunTknA/4Rs+wOxG2LANxrcIymPgbDwYxQpfc8IRbq3GPbdK4THMeh
	 ZbdiJ+a9l1UQMGRz6FjwZNjOHqPD8b1OUhYnHLT0+UJquHUGGatMKXWp6jMKUSXxir
	 Np3iB46FYzrzzQ2scweU3R9cvlNyU7gG/x5F8l5HIrZG84AFEzxgda9KgN7vDyvzaC
	 bPpdMSlys/s5TKKe3fz1bp2mvedWLnsbwWEYqYQSAr104g5y5+CYxXBZarS4hzJLIU
	 QS9KGkZAohT4g==
From: Thomas Gleixner <tglx@kernel.org>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v9 2/4] irqchip/irq-loongson.h:irq-loongson.h
 preparation for Redirect irqchip
In-Reply-To: <20260130025941.2140582-3-zhangtianyang@loongson.cn>
References: <20260130025941.2140582-1-zhangtianyang@loongson.cn>
 <20260130025941.2140582-3-zhangtianyang@loongson.cn>
Date: Fri, 30 Jan 2026 09:14:07 +0100
Message-ID: <875x8jmsa8.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 30 2026 at 10:59, Tianyang Zhang wrote:

The subject line is broken and incomprehensible. Something like:

    irqchip/irq-loonarch-avec: Prepare for interrupt redirection support

is concise and gives context.

> Adjusted definitions and macro from loongson-avec.c to irq-loongson.h,
> including:
> 1 marco AVEC_MSG_OFFSET
> 2 struct avecintc_data
> 3 Make avecintc_sync public

That's not a change log because it only tells _what_ the patch is doing,
but not _why_. Enumerating the details of what is moved is a pointless
exercise because that can bee seen from the diff itself.

So you want something like:

  Interrupt redirection support requires a new interrupt chip, which
  needs to share data structures, constants and functions with the AVEC
  code.

  Move them to the header file and make the required functions public.

See?

