Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04BA2EE5F2
	for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753193845; cv=none; b=KAEJ516xgv4Z2tKOF6BMPp9SQKfblxuU72LC5obct7hV+zqfpq7qEkz3Nu3K37yPbeG/90YRnkCBhU5HgHurCAUa8jL1vx/8mknae2EwQEcyR7zx7fRP1cNF8o9grTLGs59CHMC6jWSG4PfoErd8Lg8yDsNJ5uyxSSRmy8LYjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753193845; c=relaxed/simple;
	bh=axJYq4Frwz+HCXgH3qKDKlCyZ6fEwVHXZlEM3IuVC/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8P+CAYXI/Wovyo9OcNSbvyaKzDwAbjUWBxBo1eEeZVnHWWkiajhgwqJO9itATjy4yGC2KzaxzW2GeZw01nhKQPk57D19w6HMPTshdpshJfAkrRQg0yP5xdRThNMrEuwxJ+zAv280eR3fhs1f+Zyq5UnvweCN1Qk/lgL67LW0VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsOWgcs1; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsOWgcs1"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso43279171fa.1
        for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753193842; x=1753798642; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GboL0eWXtD3fDsEKzgJ1xepA1JQohVF9co6pstDgRM8=;
        b=QsOWgcs1MKFFyr9giLKUcoefcyeWrvWOGHfkboj3qZ++CuqsUR7vDSruiapGtQ0p93
         Yb+qSCTHo7FpxAgIH7B0Yj5wMdv0ux4fsduGthjbNrCmt3Prf0w1XuqTy8DbhXSnw8Tm
         1IAdl7XCIvt84fIv2EfgaSw67JNcud0LQU9wrEBC2erJ257qvBFCMRVgntE2s+EuUrds
         Bw4PYaIqK0Z+GcxCWhK8eJ4TSCd95rfDfAqV1jkvRWS9YYfDk8CE3oELNP4fpjEhIMW8
         y/2XiE1iXHfZQnL/cJljOaWlXmYwU1+Vs/94R28kkj6lYEyhSC1SMIyska4BUQlp2/gw
         lWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753193842; x=1753798642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GboL0eWXtD3fDsEKzgJ1xepA1JQohVF9co6pstDgRM8=;
        b=SdfAuOqTNxGt/Ku11YcxpyeVzt1u54l4AJMO29pItBVuUA3BOGLgZJeFy/47WjeyqI
         NgYYXyI01RQsODjL1MPeZ3yJQglDIgJCfDdm++NgwdJ/s2ZKrxGgG7WgcAweO22z+0lX
         usAWeF3ZS7OoOctAdrezvjsC/wOqADf2DhQW5+K+iWbxPssxvg+XLgM2LbaXeog0HBiF
         kRgnM4z335JNQDN/l+lHWACDiJlAnsneJ5aPXKf0JZESDiCQbn9vjiKOZX6CqpZQ84Ip
         /LkzOF2h6Vuv3I0mntBXJUEKFZiRBfe0dp+1v6quSdqOl7Nub1kF34vP8iAQCHaOym+z
         H7MA==
X-Forwarded-Encrypted: i=1; AJvYcCW5bIScy9Tkm/fNq4KPByk3lOD5saOqb19MwB3xQJWl/tst9kPzwA117IdPAkaGRU48jdjOBFIpD/0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yye4bbibQ+bJHf/4TRNjfhrC/lWzdASHli8QHLHW0pgBvQqESV3
	4d4vRcf+gCqG3lRWRq+rVa0N0L9gWnrh9gBfSxtIZYi+rfkAfnjNRVkp4ySeAcCBlYdqE4QaJxo
	kIY2JPo9fUEtaF5bhJWBCjxtOAhVhW2s=
X-Gm-Gg: ASbGncu/EWFlYWpREHDxs6IHzosRk4jheuTTWJ/CLluTpFqRkLbUm/GdDMnXZbOaJx3
	cPDulkLtOna91JPAfYsnsME0dBYsm5RGi0O1y3FDP9ocD1kasI491fDfzQYr1ebjaxcPeQYvAMj
	rkZdGJCD522GJOZXhuZfvzGTGdbH1F8u8HQ9PL523k6mXTZ8rgv5qL3ph6GUge/TELRB7nPJv2s
	7Rwrj4=
X-Google-Smtp-Source: AGHT+IHWyFSdlAJ08NCU6ABmF9BGYFP4zXRYUy0aJCm6G+P21nbWRd00HVhqfmwkvmBdoun3tyqTRuImHuMXXJuHVwM=
X-Received: by 2002:a05:651c:110d:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-3308f5c95f9mr70998461fa.25.1753193841372; Tue, 22 Jul 2025
 07:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717142732.292822-1-snovitoll@gmail.com> <20250717142732.292822-9-snovitoll@gmail.com>
 <85de2e1f-a787-4862-87e4-2681e749cef0@gmail.com>
In-Reply-To: <85de2e1f-a787-4862-87e4-2681e749cef0@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Tue, 22 Jul 2025 19:17:03 +0500
X-Gm-Features: Ac12FXzF_nEInn7KovIF1rCbPeOEkryRpoS2Hx7q1NkLYIXq7eXxsmx3CUCidIg
Message-ID: <CACzwLxiD98BLmEmPhkJQgv297bP_7qw+Vm_icFhTiDYN7WvLjw@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com, 
	dvyukov@google.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 4:00=E2=80=AFAM Andrey Ryabinin <ryabinin.a.a@gmail=
.com> wrote:
>
>
>
> On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
> > UserMode Linux needs deferred KASAN initialization as it has a custom
> > kasan_arch_is_ready() implementation that tracks shadow memory readines=
s
> > via the kasan_um_is_ready flag.
> >
> > Select ARCH_DEFER_KASAN to enable the unified static key mechanism
> > for runtime KASAN control. Call kasan_init_generic() which handles
> > Generic KASAN initialization and enables the static key.
> >
> > Delete the key kasan_um_is_ready in favor of the unified kasan_enabled(=
)
> > interface.
> >
> > Note that kasan_init_generic has __init macro, which is called by
> > kasan_init() which is not marked with __init in arch/um code.
> >
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
> > Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> > ---
> > Changes in v3:
> > - Added CONFIG_ARCH_DEFER_KASAN selection for proper runtime control
> > ---
> >  arch/um/Kconfig             | 1 +
> >  arch/um/include/asm/kasan.h | 5 -----
> >  arch/um/kernel/mem.c        | 4 ++--
> >  3 files changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> > index f08e8a7fac9..fd6d78bba52 100644
> > --- a/arch/um/Kconfig
> > +++ b/arch/um/Kconfig
> > @@ -8,6 +8,7 @@ config UML
> >       select ARCH_WANTS_DYNAMIC_TASK_STRUCT
> >       select ARCH_HAS_CPU_FINALIZE_INIT
> >       select ARCH_HAS_FORTIFY_SOURCE
> > +     select ARCH_DEFER_KASAN
> >       select ARCH_HAS_GCOV_PROFILE_ALL
> >       select ARCH_HAS_KCOV
> >       select ARCH_HAS_STRNCPY_FROM_USER
> > diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
> > index f97bb1f7b85..81bcdc0f962 100644
> > --- a/arch/um/include/asm/kasan.h
> > +++ b/arch/um/include/asm/kasan.h
> > @@ -24,11 +24,6 @@
> >
> >  #ifdef CONFIG_KASAN
> >  void kasan_init(void);
> > -extern int kasan_um_is_ready;
> > -
> > -#ifdef CONFIG_STATIC_LINK
> > -#define kasan_arch_is_ready() (kasan_um_is_ready)
> > -#endif
> >  #else
> >  static inline void kasan_init(void) { }
> >  #endif /* CONFIG_KASAN */
> > diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
> > index 76bec7de81b..058cb70e330 100644
> > --- a/arch/um/kernel/mem.c
> > +++ b/arch/um/kernel/mem.c
> > @@ -21,9 +21,9 @@
> >  #include <os.h>
> >  #include <um_malloc.h>
> >  #include <linux/sched/task.h>
> > +#include <linux/kasan.h>
> >
> >  #ifdef CONFIG_KASAN
> > -int kasan_um_is_ready;
> >  void kasan_init(void)
> >  {
> >       /*
> > @@ -32,7 +32,7 @@ void kasan_init(void)
> >        */
> >       kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
> >       init_task.kasan_depth =3D 0;
> > -     kasan_um_is_ready =3D true;
> > +     kasan_init_generic();
>
> I think this runs before jump_label_init(), and static keys shouldn't be =
switched before that.>  }

I got the warning in my local compilation and from kernel CI [1].

arch/um places kasan_init() in own `.kasan_init` section, while
kasan_init_generic() is called from __init.
Could you suggest a way how I can verify the functions call order?

I need to familiarize myself with how to run arch/um locally and try
to fix this warning.

[1] https://lore.kernel.org/all/CACzwLxicmky4CRdmABtN8m2cr2EpuMxLPqeF5Hk375=
cN2Kvu-Q@mail.gmail.com/

> >
> >  static void (*kasan_init_ptr)(void)
>
