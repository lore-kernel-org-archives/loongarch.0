Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDA72D948A
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 04:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764216947; cv=none; b=IRws2foHfCM7KQkTv63xYGSGRawYQtElDJO7jQ3lLjDQO6ltNy9qPexoFbUSTpvWfhgRcC+LlSG4XxuH6wS1Xgsfhq2LSMM+JOaG1QuRh0NwbjNpCgbdiQ62H/2FQC2lXKa9wMI1nkdX3B9GfzDoLJNBQoL1tgrbAlOUm+QfwM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764216947; c=relaxed/simple;
	bh=SEvDCHVf1aeGd5cuVXy+lAhn+GcB8cGT/9EfWUK+RHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2yYZfFPj+RyxJbzIKvA78GTNacSYS4zLPHrb+zcQqF9BxcbhGQcWWq3MQZhqiXHmyBwyLIbwUzfLqCgtXh8VlFXcYNzzGfp2pJhcsjalqhAcsqtAwbDJZIIdZFRLsgdBN4ZqM3NL6xga5GHcsGcjrrhQF8sRbCV8gFdymABWTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebhTEjwz; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebhTEjwz"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-65727896f35so255736eaf.2
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 20:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764216945; x=1764821745; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6j06Msvo5hxmEmA5FBbheJHYIaRPrkdemJSwWbekt4=;
        b=ebhTEjwz8QUdNCnFNBU7zhpcY1sA0aHPqS+OKeWz4DkuE0I7hCklPJ6CcaILiKd880
         DcBGvSmtCO4HTQoDvKcZYO0b0bpoQYiAOJpZR5orilRa8czhojpUXflZeg3+ShPxrpLB
         u5bEkcZlvPxnFMQ1SkUNCtPDXsroJGdrMnuawZpr7biPZZZ0VbHob0KcofiwWMHcUzoZ
         Qp5Z+UAN5Y1xe1Peu04fE9mjlZ6ebQ3FMHtGeFcd6aGJquZ2UZO7q7fjZifCHqnHQJG+
         PICbiKmVfCXhFGtGHQiNF5KfKwQ8KBLsQKkN55PsmcXn8T8zkSLPfR7CAcznGy4F0CXx
         QUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764216945; x=1764821745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6j06Msvo5hxmEmA5FBbheJHYIaRPrkdemJSwWbekt4=;
        b=YRdzUG9cnD1sSP1YU0hfH77Pi/Sv8eKJEf+A4gJYIS+CCEG6vbDLoWP6pr72fQIHTd
         mVlXElbXuYncBFqelnmZUMr+MO6Z3ymqMSsvlk3hSthxKjpW7HpihT9sKcNPLuRwd31d
         Wl00V7sSgVsjFT1SW/qKIVWY57qTMJ2CqxnWcKEu4m0Zj4BC5Ze2RFDYZJnSPq+up6wU
         KAxWWvsbD7OPiL5/3D2yx8pow995miE52e4dc4+lrSElHRGjETmj3xUAO2AkzZdK7lxs
         3AeiFIkdOLyBIAbxIAvwlp+MdS+8mGCxlVntifbK1vLk7jDRr3sHk0WmfPnxPF0DYmra
         GFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+fNNFM7SXR2cKCIRtkwe+S6Ce208ku1rfiTKPTDs+/ctvaZDL5u3O5uDcrgqO1r25ghPAdv1myn8=@lists.linux.dev
X-Gm-Message-State: AOJu0YySkmVXe2xx9u2VSzdb+qgMjtC3FFqCrWCXIbXiMMH3YXPrzgtg
	+ZY6sgWDg0GlIil963xP/4zUbmYmMRl/YUo/5A4h3q3IsFubkQ6cxpEAw28YHFic5snr1P2zmhg
	xNugXbERaiA6Hqmu5IabHjp8PrYsAkDw=
X-Gm-Gg: ASbGncv2NAbNhxVpNtpdTSFrLACjCIrs4Kek2IKEKPYcVgq1BycJRhQcOO/QPRjg174
	6h13FC/uLX3VKhdxjm1jqUTMqfLtR9buYryjbtz2JrhbQnW0YnrNTHdhHWgp2Y2cDG0+/Vr74nv
	EtDMXSqBLwT0y7UM1+WS7V+PNolEi7AtpJDEBqvL/ZBZBWe3s+mgzGYXxhijIKUNI54Bzg1U5h/
	IJo2UtvzOc/s36LR5+lDFOJw96ZEBsml6jx8Ba/f/weaiYFdmHS4pn9BfQkU6OE8BOnYxE=
X-Google-Smtp-Source: AGHT+IHviBKXXjGOBdLCHSL36fJp8uOUxWVQoQsOCHDuxhERclFHPjnHTiWr9rAtVFRrGgBVVo2LcQ7X5MG78/OJZGc=
X-Received: by 2002:a05:6808:2008:b0:43f:606a:c1a with SMTP id
 5614622812f47-45115a0c66bmr8681340b6e.16.1764216944960; Wed, 26 Nov 2025
 20:15:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126-2-v3-0-851b5a516801@linux.dev> <CAEyhmHTJU-OUZFA5Sdiv+mBwQpfq5CZp5kN9HVKRqbQzqRS66Q@mail.gmail.com>
 <20251126174016.000067f4@linux.dev> <CAEyhmHSeqWWv_5QZVdqRfSx_+O4nA77PDTLXzUEPMLB7jKmsWg@mail.gmail.com>
In-Reply-To: <CAEyhmHSeqWWv_5QZVdqRfSx_+O4nA77PDTLXzUEPMLB7jKmsWg@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 27 Nov 2025 12:15:34 +0800
X-Gm-Features: AWmQ_bnitYnWJI_OJpazaVPp_uR_375k9MdHbhue6UA1QgekibDWY1GbL05j5Ss
Message-ID: <CAEyhmHTRTFkMpd7svznM9YKmtNpML4Uz9_wnpizQEA=-T_wgJg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] LoongArch: Add 128-bit atomic cmpxchg support (v3)
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 7:05=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> On Wed, Nov 26, 2025 at 5:40=E2=80=AFPM George Guo <dongtai.guo@linux.dev=
> wrote:
> >
> > On Wed, 26 Nov 2025 13:23:57 +0800
> > Hengqi Chen <hengqi.chen@gmail.com> wrote:
> >
> > > On Wed, Nov 26, 2025 at 10:06=E2=80=AFAM George Guo <dongtai.guo@linu=
x.dev>
> > > wrote:
> > > >
> > > > This patch series adds 128-bit atomic compare-and-exchange support
> > > > for LoongArch architecture, which fixes BPF scheduler test failures
> > > > caused by missing 128-bit atomics support.
> > > >
> > > > The series consists of two patches:
> > > >
> > > > 1. "LoongArch: Add 128-bit atomic cmpxchg support"
> > > >    - Implements 128-bit atomic compare-and-exchange using
> > > > LoongArch's LL.D/SC.Q instructions
> > > >    - Fixes BPF scheduler test failures (scx_central scx_qmap) where
> > > >      kmalloc_nolock_noprof returns NULL due to missing 128-bit
> > > > atomics, leading to -ENOMEM errors during scheduler initialization
> > > >
> > >
> > > This kmalloc_nolock_noprof() was introduced in v6.18-rc1 and has no
> > > caller for now.
>
> OK, it does have a caller in rc-2 [1].
>
>   [1]: https://lore.kernel.org/bpf/20251015000700.28988-1-alexei.starovoi=
tov@gmail.com/
>
> > > Why is this related to the sched_ext failure ?
> > >
> > Hi Hengqi,
> >
> > When running scx_central, function call chain as below:
> > central_init->bpf_timer_init->__bpf_async_init->bpf_map_kmalloc_nolock-=
>kmalloc_nolock
> > ->kmalloc_nolock_noprof
> >
>
> Thanks, will test this series.

I tried with qemu, but it seems the kernel can't even boot.

>
> > The function kmalloc_nolock_noprof returns NULL due to the following
> > condition:
> >
> > if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
> >         /*
> >          * kmalloc_nolock() is not supported on architectures that
> >          * don't implement cmpxchg16b, but debug caches don't use
> >          * per-cpu slab and per-cpu partial slabs. They rely on
> >          * kmem_cache_node->list_lock, so kmalloc_nolock() can
> >          * attempt to allocate from debug caches by
> >          * spin_trylock_irqsave(&n->list_lock, ...)
> >          */
> >         return NULL;
> >
> > The NULL return occurs because kmalloc_nolock is not supported on
> > Loongarch, which don't implement cmpxchg16b. So I am giving the patch.
> >
> > Also I tried with debug caches(CONFIG_SLUB_DEBUG_ON=3Dy), it works,
> > but not a good idea.
> >
> > > > 2. "LoongArch: Enable 128-bit atomics cmpxchg support"
> > > >    - Adds select HAVE_CMPXCHG_DOUBLE and select
> > > > HAVE_ALIGNED_STRUCT_PAGE in Kconfig to enable 128-bit atomic
> > > > cmpxchg support
> > > >
> > > > The issue was identified through BPF scheduler test failures where
> > > > scx_central and scx_qmap schedulers would fail to initialize.
> > > > Testing was performed using the scx_qmap scheduler from
> > > > tools/sched_ext/, confirming that the patches resolve the
> > > > initialization failures.
> > > >
> > > > Signed-off-by: George Guo <dongtai.guo@linux.dev>
> > > > ---
> > > > Changes in v3:
> > > > - dbar 0 -> __WEAK_LLSC_MB
> > > > - =3DZB" (__ptr[0]) -> "r" (__ptr)
> > > > - Link to v2:
> > > > https://lore.kernel.org/r/20251124-2-v2-0-b38216e25fd9@linux.dev
> > > >
> > > > Changes in v2:
> > > > - Use a normal ld.d for the high word instead of ll.d to avoid race
> > > >   condition
> > > > - Insert a dbar between ll.d and ld.d to prevent reordering
> > > > - Simply __cmpxchg128_asm("ll.d", "sc.q", ptr, o, n) to
> > > > __cmpxchg128_asm(ptr, o, n)
> > > > - Fix address operand constraints after testing different
> > > > approaches:
> > > >   * ld.d with "m"
> > > >   * ll.d with "ZC",
> > > >   * sc.q with "ZB"(alternative constraints caused issues:
> > > >    - "r"  caused system hang
> > > >    - "ZC" caused compiler error:
> > > >      {standard input}: Assembler messages:
> > > >      {standard input}:10037: Fatal error: Immediate overflow.
> > > >      format: u0:0 )
> > > > - Link to v1:
> > > > https://lore.kernel.org/r/20251120-2-v1-0-705bdc440550@linux.dev
> > > >
> > > > ---
> > > > George Guo (2):
> > > >       LoongArch: Add 128-bit atomic cmpxchg support
> > > >       LoongArch: Enable 128-bit atomics cmpxchg support
> > > >
> > > >  arch/loongarch/Kconfig               |  2 ++
> > > >  arch/loongarch/include/asm/cmpxchg.h | 47
> > > > ++++++++++++++++++++++++++++++++++++ 2 files changed, 49
> > > > insertions(+) ---
> > > > base-commit: d5ae5ac32615e4af729f0610fdc11ff4f4798aef
> > > > change-id: 20251120-2-d03862b2cf6d
> > > >
> > > > Best regards,
> > > > --
> > > > George Guo <dongtai.guo@linux.dev>
> > > >
> > > >
> >
