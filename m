Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD802FC877
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150179; cv=none; b=AWO2kXtbcta+PjXKCgBWQ5FyBNNpqI/AIb79ibSkpuFFgj4R/SMNvnvwjsVs/Ae3iJvih4FywT4c8S77n3CiCtBvP6xGyUmX9SZzSX/JEmVO1y9To2ke7dpNw5fPmbVVmRayaJD/apkU+vGAP2mUpnmSvVdNXdN1DQEVY32PdXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150179; c=relaxed/simple;
	bh=bJ6B6a/FDF8y2OxW1ciZacCySVo2kIu2xjIxs5EsTuk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kfACj5irufHSQDmLd6xzWdq3jW/xabxEpFG1YGLYulJLqy1pXRBRQkNwgZUmrl/LSzYJzrrPECe6PW71Wn4o4Ds4YzlieeaQvt0NwS2pMJdRvp0vXRiLgwL1+QIJDl0KobbpGUX9sNY/u+m4GGRWsMY3zupIOuUa+z1VdltsSWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=axZkhDU5; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="axZkhDU5"
Date: Wed, 26 Nov 2025 17:42:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764150175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PnbKqlRCwk+X9/nd1ISPbhTsBVurZ2fmhlOSMjiosso=;
	b=axZkhDU50Vl7fMr0WHWcGhp2HudlTgT+7NyRgFpoVr4pq+WO4EtkEeaCybPZH+qJlJbpDd
	JSFFnmMkCaqeE12WjVegq/Qfus6+ZTtnjlgOSNiSTeIjrTQZ8uM6mcQijeWSHTNMWv72WE
	J/X3HiU9NtnOSv1tYFo5Uy2A4JFfei8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Subject: Re: [PATCH v3 0/2] LoongArch: Add 128-bit atomic cmpxchg support
 (v3)
Message-ID: <20251126174232.000069ff@linux.dev>
In-Reply-To: <CAAhV-H4=C2Fe=O=OWZVPTpSe0P6s2_vtpL7P9os5QGE7_r3s4w@mail.gmail.com>
References: <20251126-2-v3-0-851b5a516801@linux.dev>
	<CAAhV-H4=C2Fe=O=OWZVPTpSe0P6s2_vtpL7P9os5QGE7_r3s4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Wed, 26 Nov 2025 12:44:44 +0800
Huacai Chen <chenhuacai@kernel.org> wrote:

> Hi, George,
> 
> On Wed, Nov 26, 2025 at 10:06 AM George Guo <dongtai.guo@linux.dev>
> wrote:
> >
> > This patch series adds 128-bit atomic compare-and-exchange support
> > for LoongArch architecture, which fixes BPF scheduler test failures
> > caused by missing 128-bit atomics support.  
> Have you tested your code on Loongson-3A5000/3C5000?
> 
> Huacai
> 
Hi Huacai,

I have tested it on a virtual machine with fedora-42.

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

