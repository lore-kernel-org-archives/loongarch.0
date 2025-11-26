Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3E2F0C46
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150032; cv=none; b=MstOpu0kh1iFAD5yzNCrj/gLv9I80b24qCGA6KaRi0yiGerM0RDEJpW8XR4SLx60ptESxH97I+pFZogGUVwZdOBwlbtHHFdqWEfl2YYX2UnKYx86LVRQu/tbHTpVMBsQ2pjBd9uxRgVwXSpXr0PBOcj/GqWVSKvyhT66702OUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150032; c=relaxed/simple;
	bh=R6RAN7qchAUHzNblz7JQYfrEsqq7fWZuvKR9Y6gDpqw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bm0Z/BJ2jgrisf7ThScBuPLGliJ5Y7Th5rdMCaO5gyrU3fiXPsLEY/0xm4OaX0EAbIg0whXNAcIG/+rDF+sahiYkvlrzE8pOHwK33mPZCWQSz8qjX/sLMnUzpay3O71MU+s9TIRBZeaoGSetgPy4sc0WszAmKOTRtfeBd/vSNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JM/MG9wY; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JM/MG9wY"
Date: Wed, 26 Nov 2025 17:40:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764150028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsLpUGDt6Bdibb4RLOnN33B9At3aqKKU5T5nWLiLaZ4=;
	b=JM/MG9wYzccAQ+XY4m+phSLMmfViFhf8TlUB9E+hIXFijUk4TDTz1VxNuYaEVZdf/x9IhD
	6387Fui2qrl/grUOO0JzEJTjy8m0WJpJFcAu6FD6i27CURkp0A5FrD/65s2bqXJNuX5sGO
	drJFIiEFsvIkaZsPFxmAiGptf7DuvRY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: George Guo <dongtai.guo@linux.dev>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, George Guo
 <guodongtai@kylinos.cn>
Subject: Re: [PATCH v3 0/2] LoongArch: Add 128-bit atomic cmpxchg support
 (v3)
Message-ID: <20251126174016.000067f4@linux.dev>
In-Reply-To: <CAEyhmHTJU-OUZFA5Sdiv+mBwQpfq5CZp5kN9HVKRqbQzqRS66Q@mail.gmail.com>
References: <20251126-2-v3-0-851b5a516801@linux.dev>
	<CAEyhmHTJU-OUZFA5Sdiv+mBwQpfq5CZp5kN9HVKRqbQzqRS66Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Wed, 26 Nov 2025 13:23:57 +0800
Hengqi Chen <hengqi.chen@gmail.com> wrote:

> On Wed, Nov 26, 2025 at 10:06 AM George Guo <dongtai.guo@linux.dev>
> wrote:
> >
> > This patch series adds 128-bit atomic compare-and-exchange support
> > for LoongArch architecture, which fixes BPF scheduler test failures
> > caused by missing 128-bit atomics support.
> >
> > The series consists of two patches:
> >
> > 1. "LoongArch: Add 128-bit atomic cmpxchg support"
> >    - Implements 128-bit atomic compare-and-exchange using
> > LoongArch's LL.D/SC.Q instructions
> >    - Fixes BPF scheduler test failures (scx_central scx_qmap) where
> >      kmalloc_nolock_noprof returns NULL due to missing 128-bit
> > atomics, leading to -ENOMEM errors during scheduler initialization
> >  
> 
> This kmalloc_nolock_noprof() was introduced in v6.18-rc1 and has no
> caller for now.
> Why is this related to the sched_ext failure ?
> 
Hi Hengqi,

When running scx_central, function call chain as below:
central_init->bpf_timer_init->__bpf_async_init->bpf_map_kmalloc_nolock->kmalloc_nolock
->kmalloc_nolock_noprof

The function kmalloc_nolock_noprof returns NULL due to the following
condition:

if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
        /*
         * kmalloc_nolock() is not supported on architectures that
         * don't implement cmpxchg16b, but debug caches don't use
         * per-cpu slab and per-cpu partial slabs. They rely on
         * kmem_cache_node->list_lock, so kmalloc_nolock() can
         * attempt to allocate from debug caches by
         * spin_trylock_irqsave(&n->list_lock, ...)
         */
        return NULL;

The NULL return occurs because kmalloc_nolock is not supported on
Loongarch, which don't implement cmpxchg16b. So I am giving the patch.

Also I tried with debug caches(CONFIG_SLUB_DEBUG_ON=y), it works,
but not a good idea. 

> > 2. "LoongArch: Enable 128-bit atomics cmpxchg support"
> >    - Adds select HAVE_CMPXCHG_DOUBLE and select
> > HAVE_ALIGNED_STRUCT_PAGE in Kconfig to enable 128-bit atomic
> > cmpxchg support
> >
> > The issue was identified through BPF scheduler test failures where
> > scx_central and scx_qmap schedulers would fail to initialize.
> > Testing was performed using the scx_qmap scheduler from
> > tools/sched_ext/, confirming that the patches resolve the
> > initialization failures.
> >
> > Signed-off-by: George Guo <dongtai.guo@linux.dev>
> > ---
> > Changes in v3:
> > - dbar 0 -> __WEAK_LLSC_MB
> > - =ZB" (__ptr[0]) -> "r" (__ptr)
> > - Link to v2:
> > https://lore.kernel.org/r/20251124-2-v2-0-b38216e25fd9@linux.dev
> >
> > Changes in v2:
> > - Use a normal ld.d for the high word instead of ll.d to avoid race
> >   condition
> > - Insert a dbar between ll.d and ld.d to prevent reordering
> > - Simply __cmpxchg128_asm("ll.d", "sc.q", ptr, o, n) to
> > __cmpxchg128_asm(ptr, o, n)
> > - Fix address operand constraints after testing different
> > approaches:
> >   * ld.d with "m"
> >   * ll.d with "ZC",
> >   * sc.q with "ZB"(alternative constraints caused issues:
> >    - "r"  caused system hang
> >    - "ZC" caused compiler error:
> >      {standard input}: Assembler messages:
> >      {standard input}:10037: Fatal error: Immediate overflow.
> >      format: u0:0 )
> > - Link to v1:
> > https://lore.kernel.org/r/20251120-2-v1-0-705bdc440550@linux.dev
> >
> > ---
> > George Guo (2):
> >       LoongArch: Add 128-bit atomic cmpxchg support
> >       LoongArch: Enable 128-bit atomics cmpxchg support
> >
> >  arch/loongarch/Kconfig               |  2 ++
> >  arch/loongarch/include/asm/cmpxchg.h | 47
> > ++++++++++++++++++++++++++++++++++++ 2 files changed, 49
> > insertions(+) ---
> > base-commit: d5ae5ac32615e4af729f0610fdc11ff4f4798aef
> > change-id: 20251120-2-d03862b2cf6d
> >
> > Best regards,
> > --
> > George Guo <dongtai.guo@linux.dev>
> >
> >  

