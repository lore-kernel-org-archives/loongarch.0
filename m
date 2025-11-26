Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607671E5207
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764155146; cv=none; b=iKVYJbrvMA3cNKu5YrLW3s7e6JmDVKUqzMLWXI9qSIq9OK2Y44VLQfOaUgmT9KtlIf0eiWb0jRT9Ql4rL4kIYPhJu/g20rmIA679IceLB4oQKATSI5OQIr5GBsFBwJPifDlnabi5yMXjYDkaWKUSg/2BMLGnElCDrqWSxWXIoZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764155146; c=relaxed/simple;
	bh=JxNDfa3MPmfhAarqdoM09SH49Z0IMFK1bFgx78hqoL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnFN4HdYvYbPenQrGe0vYjnHuFrU/vxgk6nEQ4rR6dTO4DZF/wN2m4A1MiFt93bWkR7uD+xW7o8VGm7T382Jrm1j/4PX+Bvg/dvy/4AP9aeiP2MyIuL/sm/RhX7qVxc8PKbDlLSUMoxYDalOe48ieCYTmKshu+49RVu230AKxHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OU8gTvOe; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OU8gTvOe"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-657a6028fbbso1551440eaf.3
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 03:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764155144; x=1764759944; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oEf7wbb1ol7BLIXk5SNJQ2l25Y1J7fIpZfFjrV7aU0=;
        b=OU8gTvOesPFIylePRJTY+PTv/dGJNeVC4UkIpJnRb0Z0t/WNYl4N7eHppTSqC718DI
         kn0fiCs4vhkRqhSizFLAVZ4t/ICQkf4Wv6BxmaEDaFe8kz0SHizQS3elntxSXWVUowpN
         I8ozhyVwNoqjdG5BLEB2CHVQSqy24cXUl6V94OnBjwbHCa5YpVtZA52eC1/gzRSqpcuQ
         PKX9CX8bUO+PL/uLLQ2FEzMilm9PPUyOtDdjLQsQJ736motf1l6hymceHBcTsHv9UMEv
         uNvApevVbRYlf/heZjbgu5gOhLiWyZxDwKa4v8wjJOjdjEKYqDEMkPEMYIJtUd2Tb9uT
         /uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764155144; x=1764759944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2oEf7wbb1ol7BLIXk5SNJQ2l25Y1J7fIpZfFjrV7aU0=;
        b=PzEINt89KuGhFZ6JvHGyuS0pCH6Q0Szi6nKCINiHNpwmzkOTbdFu/zB81tskP//6Pc
         bn3DSKCXhnZzEllWU5NLZze+EYeHBvG3q0aCO8K1V9vyfSGxySsMyT2hm6P3K+6xNBBt
         gxOVN8dCFy+RCyKUxct7EZRXEZgM19/wwLJFuDoN9bE/pCTfQkUk9rVUxa+ot9q+F31L
         z5MzRcCCYYh4aWYo86zcEbEdQnR8PsEnt5lXjSg/a6n2QRE6YbO3I33vtA+bsbiYr513
         KbsFdGIImPuVxblZSMmwV5fbuWclFO3ymWLkOZxODjI94YWY+ijSBIkMUJtAj35opJ48
         CwjA==
X-Forwarded-Encrypted: i=1; AJvYcCVs3tO/EVYW2xV4s0UQLvuM0saIj1AsiNa7nb4eAh//d8FBdGQyCDE/mFbCflY41SwbUQqjp9l+BZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSZQsirsWjr8M5XCdOjxWH+zDVeXXrg6/iu1a+cmHuERP3FDMG
	U7Cqj6s4loj8BGoYXTFtKi/UN877CM+74QqCpjaXk/A6RFXvu8CnFkUXaZrpVwAA1rKNfISJJ0a
	gTV46pr/i2QQMJfIleuGl9/akR6GlAt8=
X-Gm-Gg: ASbGncsmqt/lS+6ms3ooB329MVhNkWECQu8VcCkZr/xDtNSCeMrLh0MBvaDDkeTVsH2
	vDVlA3Trfjj2yf5CFEnxEIl1UQWZpyGNI5bRS7F+A9AhYjDhtyUxWQWJcyITG00mrv/EcNHipV8
	lRrzdELU6PjQlZSHHPK2tEdDmY/xk3/oH4/zS3CzbK5RSe95a9FDAoji+E/q/lTsxdYivrz3onX
	gJw0UpMndsUy1u6k4VfKBDJQIx+rL+6yOSb3SR1ngHkGhXyhZSMh3xg1STcRkt5SbbWwzE=
X-Google-Smtp-Source: AGHT+IFbL2UOvSW133P0vEVzHYo8js4w58VLhDyNprtc0FeIbyaK1T1bn73R/2vm7/8eiUB6aq+IB4Sd30VLrewOkYM=
X-Received: by 2002:a05:6808:6b48:b0:43d:24b7:2b93 with SMTP id
 5614622812f47-4514e63de09mr2777145b6e.17.1764155144340; Wed, 26 Nov 2025
 03:05:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126-2-v3-0-851b5a516801@linux.dev> <CAEyhmHTJU-OUZFA5Sdiv+mBwQpfq5CZp5kN9HVKRqbQzqRS66Q@mail.gmail.com>
 <20251126174016.000067f4@linux.dev>
In-Reply-To: <20251126174016.000067f4@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 26 Nov 2025 19:05:33 +0800
X-Gm-Features: AWmQ_bnKdLL4MVYBdj6HapyiznEe55mZ_xGsNKoyLhB8BGcd15IZLAe6R3NwXEM
Message-ID: <CAEyhmHSeqWWv_5QZVdqRfSx_+O4nA77PDTLXzUEPMLB7jKmsWg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] LoongArch: Add 128-bit atomic cmpxchg support (v3)
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 5:40=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> On Wed, 26 Nov 2025 13:23:57 +0800
> Hengqi Chen <hengqi.chen@gmail.com> wrote:
>
> > On Wed, Nov 26, 2025 at 10:06=E2=80=AFAM George Guo <dongtai.guo@linux.=
dev>
> > wrote:
> > >
> > > This patch series adds 128-bit atomic compare-and-exchange support
> > > for LoongArch architecture, which fixes BPF scheduler test failures
> > > caused by missing 128-bit atomics support.
> > >
> > > The series consists of two patches:
> > >
> > > 1. "LoongArch: Add 128-bit atomic cmpxchg support"
> > >    - Implements 128-bit atomic compare-and-exchange using
> > > LoongArch's LL.D/SC.Q instructions
> > >    - Fixes BPF scheduler test failures (scx_central scx_qmap) where
> > >      kmalloc_nolock_noprof returns NULL due to missing 128-bit
> > > atomics, leading to -ENOMEM errors during scheduler initialization
> > >
> >
> > This kmalloc_nolock_noprof() was introduced in v6.18-rc1 and has no
> > caller for now.

OK, it does have a caller in rc-2 [1].

  [1]: https://lore.kernel.org/bpf/20251015000700.28988-1-alexei.starovoito=
v@gmail.com/

> > Why is this related to the sched_ext failure ?
> >
> Hi Hengqi,
>
> When running scx_central, function call chain as below:
> central_init->bpf_timer_init->__bpf_async_init->bpf_map_kmalloc_nolock->k=
malloc_nolock
> ->kmalloc_nolock_noprof
>

Thanks, will test this series.

> The function kmalloc_nolock_noprof returns NULL due to the following
> condition:
>
> if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
>         /*
>          * kmalloc_nolock() is not supported on architectures that
>          * don't implement cmpxchg16b, but debug caches don't use
>          * per-cpu slab and per-cpu partial slabs. They rely on
>          * kmem_cache_node->list_lock, so kmalloc_nolock() can
>          * attempt to allocate from debug caches by
>          * spin_trylock_irqsave(&n->list_lock, ...)
>          */
>         return NULL;
>
> The NULL return occurs because kmalloc_nolock is not supported on
> Loongarch, which don't implement cmpxchg16b. So I am giving the patch.
>
> Also I tried with debug caches(CONFIG_SLUB_DEBUG_ON=3Dy), it works,
> but not a good idea.
>
> > > 2. "LoongArch: Enable 128-bit atomics cmpxchg support"
> > >    - Adds select HAVE_CMPXCHG_DOUBLE and select
> > > HAVE_ALIGNED_STRUCT_PAGE in Kconfig to enable 128-bit atomic
> > > cmpxchg support
> > >
> > > The issue was identified through BPF scheduler test failures where
> > > scx_central and scx_qmap schedulers would fail to initialize.
> > > Testing was performed using the scx_qmap scheduler from
> > > tools/sched_ext/, confirming that the patches resolve the
> > > initialization failures.
> > >
> > > Signed-off-by: George Guo <dongtai.guo@linux.dev>
> > > ---
> > > Changes in v3:
> > > - dbar 0 -> __WEAK_LLSC_MB
> > > - =3DZB" (__ptr[0]) -> "r" (__ptr)
> > > - Link to v2:
> > > https://lore.kernel.org/r/20251124-2-v2-0-b38216e25fd9@linux.dev
> > >
> > > Changes in v2:
> > > - Use a normal ld.d for the high word instead of ll.d to avoid race
> > >   condition
> > > - Insert a dbar between ll.d and ld.d to prevent reordering
> > > - Simply __cmpxchg128_asm("ll.d", "sc.q", ptr, o, n) to
> > > __cmpxchg128_asm(ptr, o, n)
> > > - Fix address operand constraints after testing different
> > > approaches:
> > >   * ld.d with "m"
> > >   * ll.d with "ZC",
> > >   * sc.q with "ZB"(alternative constraints caused issues:
> > >    - "r"  caused system hang
> > >    - "ZC" caused compiler error:
> > >      {standard input}: Assembler messages:
> > >      {standard input}:10037: Fatal error: Immediate overflow.
> > >      format: u0:0 )
> > > - Link to v1:
> > > https://lore.kernel.org/r/20251120-2-v1-0-705bdc440550@linux.dev
> > >
> > > ---
> > > George Guo (2):
> > >       LoongArch: Add 128-bit atomic cmpxchg support
> > >       LoongArch: Enable 128-bit atomics cmpxchg support
> > >
> > >  arch/loongarch/Kconfig               |  2 ++
> > >  arch/loongarch/include/asm/cmpxchg.h | 47
> > > ++++++++++++++++++++++++++++++++++++ 2 files changed, 49
> > > insertions(+) ---
> > > base-commit: d5ae5ac32615e4af729f0610fdc11ff4f4798aef
> > > change-id: 20251120-2-d03862b2cf6d
> > >
> > > Best regards,
> > > --
> > > George Guo <dongtai.guo@linux.dev>
> > >
> > >
>
