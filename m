Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1B41917ED
	for <loongarch@lists.linux.dev>; Mon,  9 Mar 2026 07:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773040022; cv=none; b=UN/jkKvwlM7hoMzfQCxiskocpYjU/MBng9Veq8w9Ds4d9GQbGdMeH2Nh80by31OPKA3uq406sv+nxJZPJY5yfvhYdg/D4Cmv4DRKd61IkBvdFx0I9h1g/16XZ11AByjsBEXeFi1a+RQWW5XO26sEONA0hIrTuz1ze6tLjSVklZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773040022; c=relaxed/simple;
	bh=+FbIaYzzzYtGOPgxjLUZSjgLU0SoRdEoP3mq1rX9p4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sox8rY/hVR8Xgwet3AVUSE6q7QUc2MQK3dPA3nKF9KFQFO4vw0bhX6zkz0SBoyctUNFBMBldC5liDxLUY5e/74WtkYQWLkeSd1jN9W7XzNvrOvOtq0Dzsn68XkVnXpNMhIqIduGiNcOsogHgJICMX+bEtBAAo6nzeby5L/2kWCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tEZo6Zoj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YwSLU0Ln; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tEZo6Zoj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YwSLU0Ln"
Date: Mon, 9 Mar 2026 08:06:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773040018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtzkyJ8hx305Mtr7btFehrbW7SxQHkQHUB8AB68zsfY=;
	b=tEZo6Zoj4U8yrgiA9rkzGBQExIW+ofZLQX9F1mg0PNg6GarsaICIoae9xU443OfBaX6rM+
	7pjbEOCXsG9WFlD4wePVeUNw6sF4Vzm9GN2T9WrsFj31WVnFzJfXVEuhKUc9tjP+7+SHuE
	o/KTj4tqqQQQ46ayfoX71J6qjvrf0WopqC/XlwHDWGo1Ipp/EVu/QABicywii6OQqsPlOh
	QIdSBvSS23KoJi7/qMaxExyNqVwY5e7/xS/gua5UFqqaA/Bey6hiV1/9slG7PEM6KCbvW5
	2T733hISY1LqXw99fL7C9TM9NZ+O09vbc/rf369A8Zst/atdtrjK6eIYLOQC4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773040018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtzkyJ8hx305Mtr7btFehrbW7SxQHkQHUB8AB68zsfY=;
	b=YwSLU0Ln44a5PQgV/VukWfC1OGt+aDDBkCDkl8M/zglTo5fN7+1A5PWpgFQvUPx89s1EXa
	QqTiR3BQcgnlO8DA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	George Guo <guodongtai@kylinos.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Only use SC.Q when supported by the assembler
Message-ID: <20260309080529-64921486-31cf-4bf3-90a1-ed7459bb16c5@linutronix.de>
References: <20260225-loongarch-scq-v1-1-47acc2e45ec2@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-loongarch-scq-v1-1-47acc2e45ec2@linutronix.de>

Hi LoongArch maintainers,

On Wed, Feb 25, 2026 at 11:09:39AM +0100, Thomas Weiﬂschuh wrote:
> The 128-bit atomic cmpxchg implementation uses the SC.Q instruction.
> Older versions of GNU AS do not support that instruction, erroring out:
> 
> ERROR:root:{standard input}: Assembler messages:
> {standard input}:4831: Error: no match insn: sc.q	$t0,$t1,$r14
> {standard input}:6407: Error: no match insn: sc.q	$t0,$t1,$r23
> {standard input}:10856: Error: no match insn: sc.q	$t0,$t1,$r14
> make[4]: *** [../scripts/Makefile.build:289: mm/slub.o] Error 1
> 
> (Binutils 2.41)
> 
> Test support for SC.Q in kconfig and disable the atomics if the
> instruction is not available.
> 
> Fixes: f0e4b1b6e295 ("LoongArch: Add 128-bit atomic cmpxchg support")
> Closes: https://lore.kernel.org/lkml/20260216082834-edc51c46-7b7a-4295-8ea5-4d9a3ca2224f@linutronix.de/
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/loongarch/Kconfig               | 3 +++
>  arch/loongarch/include/asm/cmpxchg.h | 5 +++++
>  2 files changed, 8 insertions(+)

(...)

This is still broken in mainline. Any chance to get this patch to Linus?


Thomas
