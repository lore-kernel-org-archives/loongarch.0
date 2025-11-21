Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6AE330B00
	for <loongarch@lists.linux.dev>; Fri, 21 Nov 2025 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763718735; cv=none; b=pd4wObw8IM/fow7UQRhFkaseNOCQzLK+g+53Mg0niha4Wczl4ka2nNioJQcm/gOkSxCtCu4ADUTKY/IvgpVzrhWCBISOKzYqBEBFCFVbrN4w+IrZbtQuBH26si6/TtC1R7LHx2sur3uylNpMRdSWJlPtNm5aW0INOdX2baOt8g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763718735; c=relaxed/simple;
	bh=Kif3L7zyWwbGf0YiscmUcSLnS90QHLWDIeyjHEsCmyc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jNHue8YKT7oHTLQgOm7mnZ91AQPzf6J8qwqD+coNkK3w6OmtcgttfefyLi+aB2/xzR/CPtPv2jJtrprIBLA6Emm05nt/S6H02pk4M9EI1XZrZZZMx+KgbFtvlwZnLJuzNNvdL5hvVjywn3bTkrMsNdii+lABvHxK2TXfYlHDJpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b5E1j+TC; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b5E1j+TC"
Date: Fri, 21 Nov 2025 17:51:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763718720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8Ch4+tt7f8qc1gscNTfWWDqrLnApQWeC82ExILXnYI=;
	b=b5E1j+TCDVPAHCvmqRXh2Gg4bQ98FaOSvJ5MKn5CCt5s0qZVisypndIPGhV+x+7eAlheci
	/htKt9MtstGYGOQwt4Nf2CmCVSQ8Bme4d4RR9uFw6L/AW5scpHrSxLqhCdrfxgDkIwWCBb
	TtZMHhBsNJ6tU57fQhvO9ZboCY8yONw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: George Guo <dongtai.guo@linux.dev>
To: hev <r@hev.cc>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, George Guo
 <guodongtai@kylinos.cn>
Subject: Re: [PATCH 1/2] LoongArch: Add 128-bit atomic cmpxchg support
Message-ID: <20251121175151.0000124b@linux.dev>
In-Reply-To: <CAHirt9j7xxYi1xrvksu=L29kh1MSbMgYBRAUQYgDh-AR+FXoOA@mail.gmail.com>
References: <20251120-2-v1-0-705bdc440550@linux.dev>
	<20251120-2-v1-1-705bdc440550@linux.dev>
	<CAHirt9j7xxYi1xrvksu=L29kh1MSbMgYBRAUQYgDh-AR+FXoOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Thu, 20 Nov 2025 17:25:34 +0800
hev <r@hev.cc> wrote:

> On Thu, Nov 20, 2025 at 3:46 PM George Guo <dongtai.guo@linux.dev>
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
> >  arch/loongarch/include/asm/cmpxchg.h | 46
> > ++++++++++++++++++++++++++++++++++++ 1 file changed, 46
> > insertions(+)
> >
> > diff --git a/arch/loongarch/include/asm/cmpxchg.h
> > b/arch/loongarch/include/asm/cmpxchg.h index
> > 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..5f8d418595cf62ec3153dd3825d80ac1fb31e883
> > 100644 --- a/arch/loongarch/include/asm/cmpxchg.h +++
> > b/arch/loongarch/include/asm/cmpxchg.h @@ -111,6 +111,43 @@
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
> > +#define __cmpxchg128_asm(ld, st, ptr, old, new)
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
> > +       "1:   " ld "  %0, %4          # 128-bit cmpxchg low  \n"
> >     \
> > +       "     " ld "  %1, %5          # 128-bit cmpxchg high \n"
> >     \
> > +       "     bne     %0, %z6, 2f                            \n"
> >     \
> > +       "     bne     %1, %z7, 2f                            \n"
> >     \
> > +       "     move    $t0, %z8                               \n"
> >     \
> > +       "     move    $t1, %z9                               \n"
> >     \
> > +       "     " st "  $t0, $t1, %2                           \n"
> >     \
> > +       "     beqz    $t0, 1b                                \n"
> >     \
> > +       "2:                                                  \n"
> >     \
> > +       __WEAK_LLSC_MB
> >     \
> > +       : "=&r" (__ret.low), "=&r" (__ret.high),
> >     \
> > +         "=ZB" (__ptr[0]), "=ZB" (__ptr[1])
> >     \
> > +       : "ZB" (__ptr[0]), "ZB" (__ptr[1]),
> >     \  
> 
> Address operand constraints:
> - ld.d: "m"
> - ll.d: "ZC"
> - sc.q: "r"
> 
Thanks for your advice. 
Could you tell me how to find these constraints?
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
> > @@ -198,6 +235,15 @@ __cmpxchg(volatile void *ptr, unsigned long
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
> > +       __cmpxchg128_asm("ll.d", "sc.d", ptr, o, n);
> >     \  
> 
> "sc.d" -> "sc.q"
> 
> __cmpxchg128_asm doesn’t have multiple variants, so no need to
> genericize it?
> 
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
> --
> Rui

