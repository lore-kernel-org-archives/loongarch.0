Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B72472AA
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139030; cv=none; b=N6mQl5B65BUT54Hdn6IQsCdxULarYT2bb9ybnwYSspRT4vjX2QjWAEJaEm6bvfO0u3Ufuk2UGdmn9AFUR++/2jr21Sq94Yzrb3yktCkx+dPUa2ZxaV1cEtq30vUDAjSYCUkpbbWGKyc+NVo2ltB5/4wVJ8ToVx+Dk6uECb2tWCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139030; c=relaxed/simple;
	bh=Gm8kju3BOv4fyZL2j7blSsoUCk+WswC7IUWaVy3D3Xo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JZZPdSvP3aD1RNbOj6/AdOEDsK3mVDTO/ru/D+q712x1zt4koK8y7rdC1OEw31wOeeaUaxy5rI+fB6JyCRnnWXLClLwT+wg3mFb7bj2L+fdgpd8cLO2dbovClQPFB4rGhq/FEELA5Tmk/70MpazLU1GsjDM8Ig0+0rfGPavQ/cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PrJJ3ziq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UumkOyCN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PrJJ3ziq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UumkOyCN"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770139026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hdEhsEe5h/isdzof4SeNxyYxi9Xk2dUgTuqY/PU8TvM=;
	b=PrJJ3ziqM4pIXzHVgR+ykNcC/5neZEmmN4z6hSu93EzRMoObut77YH43IGv86Y1Z35B4ix
	f5I4xKQvdcatVZ1zKaiR65SZu0pl5n6L6cnO+hw8u0ncEMh1WTQoCH6Usv3ewwBW61dT/R
	T1ewmOJKf3/bhD1XTTDPrF3L2A88grnlkNdhf9kCk03bbp+LjT+7pDTmBzG0gXc0/9sI/Z
	0BxHuninN6/Am7JdLJbvATXZN6xyzU/xSnjV5gm1jOg98marmcLWL27kzNuTpd6jAXMUEC
	8bTYa0/KrRnUo2CDUBfSQkyN3k7Nn6s0H2GB4U80qEdocHn+kG9bUw1Y0hTAhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770139026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hdEhsEe5h/isdzof4SeNxyYxi9Xk2dUgTuqY/PU8TvM=;
	b=UumkOyCNTeuwH5oo2/3zUyQdpyQSS0elEBGfcaf0aT55I7tuQvaJE72wSmxz+k+QPy7U2+
	Z/lD31LyavvyEmDw==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v11 2/4] irqchip/irq-loonarch-avec: Prepare for
 interrupt redirection support
In-Reply-To: <20260203124522.2288900-3-zhangtianyang@loongson.cn>
References: <20260203124522.2288900-1-zhangtianyang@loongson.cn>
 <20260203124522.2288900-3-zhangtianyang@loongson.cn>
Date: Tue, 03 Feb 2026 18:17:05 +0100
Message-ID: <87tsvx3fxq.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 03 2026 at 20:45, Tianyang Zhang wrote:

$Subject: irqchip/irq-loonarch-avec

I know you blindly copied my suggestion and obviously you failed to spot
the missing 'g'.

> Interrupt redirection support requires a new interrupt chip, which
> needs to share data structures, constants and functions with the AVEC
> code.
>
> Move them to the header file and make the required functions public.

But then you still keep this nonsense around, which has no place in the
change log as I explained to you before:

  "Enumerating the details of what is moved is a pointless exercise
   because that can bee seen from the diff itself."

What's so hard about that to understand?

Just in case I'm not able to express myself coherently, this means:

Remove the following 4 lines:

> including:
> 1 marco AVEC_MSG_OFFSET
> 2 struct avecintc_data
> 3 Make avecintc_sync public

Sigh. Though I have to admit that 'loonarch' gave me a good laugh at
least.

Thanks,

        tglx
