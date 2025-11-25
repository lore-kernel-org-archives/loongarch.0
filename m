Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E231D7995
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764038611; cv=none; b=UgFiapjlSH45AlZmN2JXLaoZPe3rXAx8bykb5RtquLdRCVJk/2HBxZqS+xQbiNGRtxmDEw4ddZEh1sLGxlPuY8sg+q/PNfNhJSjtnFV3VZebNPNJjFqozz1ukiEfvEudibL+gdZ1Pb9c61mcI+A2BL/eQLXWSJcCSqu47U9pxjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764038611; c=relaxed/simple;
	bh=n+pEo3ASw1xCqh2iy2rD4pKCIk3s0VJF9qrZW9sSIQE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhnMl/FsSfMSho8gajHOKXyVVaN1Ps2BV3g0Mp0zIkCeRoYuBsfVEm4yf3bgd9qroIlATCQUGQmXL96wHkxdEu99OudBNPSKttvYVJ25j6OP1emO9nfUL+rMpO22g6FOHUMxlSFwtLcoGXfbO1OZi0EOcLLNnzBl55aLGVL0W6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nernluk/; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nernluk/"
Date: Tue, 25 Nov 2025 10:43:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764038606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJrPZBak8rv6upfmCuqvFwnTAD0fxHauwWeiMFCGx6c=;
	b=nernluk/+sfewOKOshhissrc41GHC4PQQp+WDmWYcYpcVuywsy+oNgrJwvyRCEdG8kQ+wC
	RgyNWo9MzG/GSYxSY5IH6Kh6zsI1vWUdaatncs/xkXIkARkcEX19OLBkfPWKr+0l93u426
	ex8IgRYDEfd26UyeQLXycgjWYy2w4wU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: George Guo <dongtai.guo@linux.dev>
To: hev <r@hev.cc>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, George Guo
 <guodongtai@kylinos.cn>
Subject: Re: [PATCH v2 1/2] LoongArch: Add 128-bit atomic cmpxchg support
Message-ID: <20251125104316.00001294@linux.dev>
In-Reply-To: <CAHirt9gjjULM6CGDR2pHJkQAKMsoZ8kpqtPn79psJQP1uu6FsA@mail.gmail.com>
References: <20251124-2-v2-0-b38216e25fd9@linux.dev>
	<20251124-2-v2-1-b38216e25fd9@linux.dev>
	<CAHirt9gjjULM6CGDR2pHJkQAKMsoZ8kpqtPn79psJQP1uu6FsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon, 24 Nov 2025 19:37:40 +0800
hev <r@hev.cc> wrote:

> On Mon, Nov 24, 2025 at 5:28 PM George Guo <dongtai.guo@linux.dev>
> wrote:
> >
> > From: George Guo <guodongtai@kylinos.cn>
> >
> > Implement 128-bit atomic compare-and-exchange using LoongArch's
> > LL.D/SC.Q instructions.
> >
> > At the same time, fix BPF scheduler test failures (scx_central
> > scx_qmap) caused by kmalloc_nolock_noprof returning NULL due to
> > missing 128-bit atomics. The NULL returns led to -ENOMEM errors
> > during scheduler initialization, causing test cases to fail.
> >
> > Verified by testing with the scx_qmap scheduler (located in
> > tools/sched_ext/). Building with `make` and running
> > ./tools/sched_ext/build/bin/scx_qmap.
> >
> > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > ---
> >  arch/loongarch/include/asm/cmpxchg.h | 47
> > ++++++++++++++++++++++++++++++++++++ 1 file changed, 47
> > insertions(+)
> >
> > diff --git a/arch/loongarch/include/asm/cmpxchg.h
> > b/arch/loongarch/include/asm/cmpxchg.h index
> > 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..757f6e82b9880d04f4883dc9a802312111aa4588
> > 100644 --- a/arch/loongarch/include/asm/cmpxchg.h +++
> > b/arch/loongarch/include/asm/cmpxchg.h @@ -111,6 +111,44 @@
> > __arch_xchg(volatile void *ptr, unsigned long x, int size) __ret;
> >                                                        \ })
> >
> > +union __u128_halves {
> > +       u128 full;
> > +       struct {
> > +               u64 low;
> > +               u64 high;
> > +       };
> > +};
> > +
> > +#define __cmpxchg128_asm(ptr, old, new)
> >             \ +({
> >                   \
> > +       union __u128_halves __old, __new, __ret;
> >     \
> > +       volatile u64 *__ptr = (volatile u64 *)(ptr);
> >     \
> > +
> >     \
> > +       __old.full = (old);
> >     \
> > +       __new.full = (new);
> >     \
> > +
> >     \
> > +       __asm__ __volatile__(
> >     \
> > +       "1:   ll.d    %0, %3            # 128-bit cmpxchg low   \n"
> >     \
> > +       "     dbar    0                 # memory barrier        \n"
> >     \
> > +       "     ld.d    %1, %4            # 128-bit cmpxchg high  \n"
> >     \
> > +       "     bne     %0, %z5, 2f                               \n"
> >     \
> > +       "     bne     %1, %z6, 2f                               \n"
> >     \
> > +       "     move    $t0, %z7                                  \n"
> >     \
> > +       "     move    $t1, %z8                                  \n"
> >     \
> > +       "     sc.q    $t0, $t1, %2                              \n"
> >     \
> > +       "     beqz    $t0, 1b                                   \n"
> >     \
> > +       "2:                                                     \n"
> >     \
> > +       __WEAK_LLSC_MB
> >     \
> > +       : "=&r" (__ret.low), "=&r" (__ret.high),
> >     \
> > +         "=ZB" (__ptr[0])
> >     \
> 
> "ZB" isn't a legal constraint for the address operand in sc.q. When
> assembled, it turns into something like sc.q $r,$r,$r,0, which clearly
> doesn't match the instruction format, yet gas happily accepts it wheil
> clang rightfully rejects it. Classic GNU-as leniency biting again. :)
> 
Hi Hev,

Thanks for your advice, I tried sc.q with r or ZC. the result as
below: (with gcc 14.2.1 in fedora-42)
   - sc.q with "r"  caused system hang
   - sc.q with "ZC" caused compiler error:
     {standard input}: Assembler messages:
     {standard input}:10037: Fatal error: Immediate overflow.
     format: u0:0 )
> > +       : "ZC" (__ptr[0]), "m" (__ptr[1]),
> >     \
> > +         "Jr" (__old.low), "Jr" (__old.high),
> >     \
> > +         "Jr" (__new.low), "Jr" (__new.high)
> >     \
> > +       : "t0", "t1", "memory");
> >     \
> > +
> >     \
> > +       __ret.full;
> >     \ +})
> > +
> >  static inline unsigned int __cmpxchg_small(volatile void *ptr,
> > unsigned int old, unsigned int new, unsigned int size)
> >  {
> > @@ -198,6 +236,15 @@ __cmpxchg(volatile void *ptr, unsigned long
> > old, unsigned long new, unsigned int __res;
> >                                  \ })
> >
> > +/* cmpxchg128 */
> > +#define system_has_cmpxchg128()                1
> > +
> > +#define arch_cmpxchg128(ptr, o, n)
> >     \ +({
> >           \
> > +       BUILD_BUG_ON(sizeof(*(ptr)) != 16);
> >     \
> > +       __cmpxchg128_asm(ptr, o, n);                    \
> > +})
> > +
> >  #ifdef CONFIG_64BIT
> >  #define arch_cmpxchg64_local(ptr, o, n)
> >             \ ({
> >                \
> >
> > --
> > 2.48.1
> >
> >
> 

