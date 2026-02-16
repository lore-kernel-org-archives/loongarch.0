Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5B62D94BF
	for <loongarch@lists.linux.dev>; Mon, 16 Feb 2026 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771227152; cv=none; b=C2EuD3bFDURXtbOrfFWDakeZkj3yMn4ecf63ICYT/kW5cZt6FbVo1iNGGT6UF++9CMYoRFTwz9kQPkhKGzSuugwTQkVP0PjRPxXKyo+V92FmtbX1OJOUXPWOVYFtrQSPAtCCR/h7tBHWdHcgRFUz42sSG9c8g0EAS0kfff0+Kr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771227152; c=relaxed/simple;
	bh=msBsY9Fw0/9ibcRRvreY2UgQyn+jciNySv1hfVuerPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWaslE9MqRvfmQ84O3gIMDw0B6uqj1tk7alsGHz+h6rpnBijyqDCAI6/BERWDZeBa1/rfFmpsBfWTry362kt/gXkYsdN818Y93yw51qaJtz4o1pfhOFT7GGZk6DGYnaG6Tmicg1iwYDlDv+xEUpgABXvQoovD3qYTtdUuyjiZfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sWMoCnSg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NWPyRElH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sWMoCnSg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NWPyRElH"
Date: Mon, 16 Feb 2026 08:32:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771227146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6oAb6+B5r4hGsWdY6rI3rP5vskXOHtoFluAEcX/QGUU=;
	b=sWMoCnSg9AV2Ri/VF2PjtIOTM/PqnRVcyhlCsLy+JshR9V+sg2JmIYxDX112W4ckqpRjMe
	zsL+KMns6z7sp20+WOmPfkhME1moVDZD4Coz/fj1Xa/C8kPy61h8AzhcRqbAyzBiZf8RFQ
	YKnUaqArxdnwDaXy3E17921bG/d3KV5vkvVRtcGAgUSOLa6vtk0nsPWXaYCU6I6YiyC6/t
	VMFbKiS6FVeQ6UsyET9WJEKxqwqCm1/+IJmVG0ovJBCsxYIlbEU5U7dc33PtbkwMUdxkVs
	q05/L28vCGGVwh+X5ckR9xlis82T40MYa09GzXwlAa/BBvQ7qOcJl73L0huqOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771227146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6oAb6+B5r4hGsWdY6rI3rP5vskXOHtoFluAEcX/QGUU=;
	b=NWPyRElHHKiFc4p9rRj+/16YweWTqgVWzFvEwiaTCx1qg8xPPAaK2cTtRif/PD4LltHekI
	ngzQN8I/iQDgXMDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, guodongtai@kylinos.cn, hengqi.chen@gmail.com, 
	kernel@xen0n.name, lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Subject: Re: [PATCH v10 loongarch-next 2/3] LoongArch: Add 128-bit atomic
 cmpxchg support
Message-ID: <20260216082834-edc51c46-7b7a-4295-8ea5-4d9a3ca2224f@linutronix.de>
References: <20260110131124.99866-1-dongtai.guo@linux.dev>
 <20260110131124.99866-3-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110131124.99866-3-dongtai.guo@linux.dev>

Hi!

On Sat, Jan 10, 2026 at 09:11:23PM +0800, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> Implement 128-bit atomic compare-and-exchange using LoongArch's
> LL.D/SC.Q instructions.
> 
> At the same time, fix BPF scheduler test failures (scx_central scx_qmap)
> caused by kmalloc_nolock_noprof returning NULL due to missing
> 128-bit atomics. The NULL returns led to -ENOMEM errors during
> scheduler initialization, causing test cases to fail.
> 
> Verified by testing with the scx_qmap scheduler (located in
> tools/sched_ext/). Building with `make` and running
> ./tools/sched_ext/build/bin/scx_qmap.
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=5fb750e8a9ae
> Acked-by: Hengqi Chen <hengqi.chen@gmail.com>
> Tested-by: Hengqi Chen <hengqi.chen@gmail.com>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>

(...)

> +#define __arch_cmpxchg128(ptr, old, new)					\
> +({									\
> +	union __u128_halves __old, __new, __ret;			\
> +	volatile u64 *__ptr = (volatile u64 *)(ptr);			\
> +									\
> +	__old.full = (old);                                             \
> +	__new.full = (new);						\
> +									\
> +	__asm__ __volatile__(						\
> +	"1:   ll.d    %0, %3		# 128-bit cmpxchg low	\n"	\
> +	__WEAK_LLSC_MB							\
> +	"     ld.d    %1, %4		# 128-bit cmpxchg high	\n"	\
> +	"     bne     %0, %z5, 2f				\n"	\
> +	"     bne     %1, %z6, 2f				\n"	\
> +	"     move    $t0, %z7					\n"	\
> +	"     move    $t1, %z8					\n"	\
> +	"     sc.q    $t0, $t1, %2				\n"	\
> +	"     beqz    $t0, 1b					\n"	\
> +	"2:							\n"	\
> +	__WEAK_LLSC_MB							\
> +	: "=&r" (__ret.low), "=&r" (__ret.high)				\
> +	: "r" (__ptr),							\
> +	  "ZC" (__ptr[0]), "m" (__ptr[1]),				\
> +	  "Jr" (__old.low), "Jr" (__old.high),				\
> +	  "Jr" (__new.low), "Jr" (__new.high)				\
> +	: "t0", "t1", "memory");					\
> +									\
> +	__ret.full;							\
> +})

Older versions of binutils[0] seem to lack support for the sc.q instruction.
So there should be some validation of the toolchain capabilities.

ERROR:root:{standard input}: Assembler messages:
{standard input}:4831: Error: no match insn: sc.q	$t0,$t1,$r14
{standard input}:6407: Error: no match insn: sc.q	$t0,$t1,$r23
{standard input}:10856: Error: no match insn: sc.q	$t0,$t1,$r14
make[4]: *** [../scripts/Makefile.build:289: mm/slub.o] Error 1


[0] Tested with binutils 2.41 from the GCC 13.2 kernel.org toolchain.


Thomas
