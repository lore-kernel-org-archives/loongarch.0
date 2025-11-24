Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379D12F60B6
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763984273; cv=none; b=T9uCaaQalI2I/AIp6Ol2Y/Oh0MBMNxN0HRC1WmsLl7Ye8b6+OwLManI0MpfHqMH8qPmECJmWvR59z80RHGk2+ivREIngHdWXRWy3vBsud4xT7k6aWMpFJ9Sz4k5TvLBA75kvBNBW03uDbKBiNo/qmrTtxp1uJt/1KBa2OBGzjzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763984273; c=relaxed/simple;
	bh=xQkRzR3QAgi21AnK3p+RQ/FUSylUpiS9lWVTSRJzCes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qviDJsNqi/H4s95UGX3IHOPBjHle21g3zyOeIxFc88V8FQmWQCPHMgqXFoG9a94rVLhpVt4Kp5o2u59+ZJI60/xwKlfl8eZEqX5SADWfoHJ/IUhZJXC8M6By9OMK1KOQzbPuP79OW2EIKcQNqLWVWkEAypwnEk9H9UFUlugeo+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b=tIcOvoIO; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b="tIcOvoIO"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7881b67da53so40418907b3.1
        for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 03:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1763984271; x=1764589071; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htCKxX8DFS8N2OF9sCBb5Rm54vdwatCJw9jB7U9PXY8=;
        b=tIcOvoIOv2eqH44XApWvmbzR1nKz14cKGwwCRFNZ4GqcsD4auCJwCTE7alvALxIPTP
         YkOpf8phS7nK1WCxP18hKheOu/LDNwl43zEP1X0wgqopwn+0FK9ARaPwReXjft1Chez9
         qJfGhaWxi0VLro+U0nSmMAyJ6H0Uz37bGj7TWOGFA/EMSpsU2mzBix/Hf8KZHm9+bAFN
         vmCNEn0fr0/wgSBtuyuTI6V25Ir89iyw+RbRqIesKOX2hdE1Vidjda+71lHO9dierqMb
         PXAyeoPeacGemxwqQaZEPY24FWwhp0IQHaJaA3ovRrvGkvbTOivfW07Mj1LKfrWi1XZo
         Df/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763984271; x=1764589071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htCKxX8DFS8N2OF9sCBb5Rm54vdwatCJw9jB7U9PXY8=;
        b=dEpHcVDY8RVdXLiLQ6lYfU12LCfaYZKIlbyfWOTNWNtGLZK8ddSAyWkcaKZdypMwgX
         utBPWsf3PkvsJXOYw4sTjjXjEgqiCd74BGJAzRpLivv7V1YXzPJbfiedEselhzs2VIf1
         5PeleK8XmQb0pUeGGE1jV8TzbgLttEu4VU/R/srH3ELog/SbWwXKODagICX47yIsmgWB
         SckBNZpNrWQN51FhblzwI8MNT+gbMPlnP3mlB2zEd252Ma1IhKtUoOWevUGd4FLOsg8z
         2pAcs52XmfDVV9BuujBj5np6Nncodl7yTj/U+ldUDhHiJFEwNycmumzBsZRy40TIb+Pq
         1wHA==
X-Forwarded-Encrypted: i=1; AJvYcCVGCY4YiplneMPtrBEVLyTgTA6BEAJNzaUfMM47EKFdiAVuHitLtOQMN5A+XFEEXu2Ql5PZX3eBEaM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpUf8p/erLFPHAFIGmMKzoNh/u3daEB5G8x4CYGOIu379gNj1k
	iQb4qtW3i9pjxWIieYgf0Fe8G0/N+ukeLHIB6w0TErM+Wu4wcE3+q1EXxh9Aa50kUFg/TrhpRig
	jNThjRjVdfeXUQxWH5bXw6ET5ZwEBiSPhwh5THgf4hw==
X-Gm-Gg: ASbGnctO/ggITfS4q8akgoTTd0Jkye/fHOIlQLxti2FdVsPT5Gl27UHekTB18X55MVj
	4UdSxKnBaFS6ZId/DXo0EGKXSLzWdR7lgrkaHjU5okXUzi+cdoWeLNSJdB0/Jn59zZxiiDMw1sY
	MymlUqXYAezFhmZ3eH3dOB8k9ywmQs5imP0iLE2KwpLmY+KIjL0dUI6GzbWbB4WLBw6Rnze3hBX
	QXUBL/8db48sDGD7fP7pGoa8C7/HI8JMFz5Uv0oXJ4gXWuXFLsONgg2Xj/j2TY1Z0uida61S44K
	JE0S0JcTjtKrjIUcmeKK+hnDVX0=
X-Google-Smtp-Source: AGHT+IEayvI8VLT3rYWI38UMhn3smgG67kBBujEA8hKxv/BZNj3RvRmd/zFUXsFuvbITLp835TIZxtFvqQgX3r1jN/M=
X-Received: by 2002:a05:690c:61c1:b0:786:59d3:49c3 with SMTP id
 00721157ae682-78a8b556f5emr99275507b3.46.1763984271200; Mon, 24 Nov 2025
 03:37:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124-2-v2-0-b38216e25fd9@linux.dev> <20251124-2-v2-1-b38216e25fd9@linux.dev>
In-Reply-To: <20251124-2-v2-1-b38216e25fd9@linux.dev>
From: hev <r@hev.cc>
Date: Mon, 24 Nov 2025 19:37:40 +0800
X-Gm-Features: AWmQ_bksMTYosUdP8crNLrhiIcOSqH1S1QSQ5RBEPndU7-BLmjUcBq8uz-E-zq0
Message-ID: <CAHirt9gjjULM6CGDR2pHJkQAKMsoZ8kpqtPn79psJQP1uu6FsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] LoongArch: Add 128-bit atomic cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 5:28=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
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
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/include/asm/cmpxchg.h | 47 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/includ=
e/asm/cmpxchg.h
> index 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..757f6e82b9880d04f4883dc9a=
802312111aa4588 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -111,6 +111,44 @@ __arch_xchg(volatile void *ptr, unsigned long x, int=
 size)
>         __ret;                                                          \
>  })
>
> +union __u128_halves {
> +       u128 full;
> +       struct {
> +               u64 low;
> +               u64 high;
> +       };
> +};
> +
> +#define __cmpxchg128_asm(ptr, old, new)                                 =
       \
> +({                                                                     \
> +       union __u128_halves __old, __new, __ret;                        \
> +       volatile u64 *__ptr =3D (volatile u64 *)(ptr);                   =
 \
> +                                                                       \
> +       __old.full =3D (old);                                            =
 \
> +       __new.full =3D (new);                                            =
 \
> +                                                                       \
> +       __asm__ __volatile__(                                           \
> +       "1:   ll.d    %0, %3            # 128-bit cmpxchg low   \n"     \
> +       "     dbar    0                 # memory barrier        \n"     \
> +       "     ld.d    %1, %4            # 128-bit cmpxchg high  \n"     \
> +       "     bne     %0, %z5, 2f                               \n"     \
> +       "     bne     %1, %z6, 2f                               \n"     \
> +       "     move    $t0, %z7                                  \n"     \
> +       "     move    $t1, %z8                                  \n"     \
> +       "     sc.q    $t0, $t1, %2                              \n"     \
> +       "     beqz    $t0, 1b                                   \n"     \
> +       "2:                                                     \n"     \
> +       __WEAK_LLSC_MB                                                  \
> +       : "=3D&r" (__ret.low), "=3D&r" (__ret.high),                     =
   \
> +         "=3DZB" (__ptr[0])                                             =
 \

"ZB" isn't a legal constraint for the address operand in sc.q. When
assembled, it turns into something like sc.q $r,$r,$r,0, which clearly
doesn't match the instruction format, yet gas happily accepts it wheil
clang rightfully rejects it. Classic GNU-as leniency biting again. :)

> +       : "ZC" (__ptr[0]), "m" (__ptr[1]),                              \
> +         "Jr" (__old.low), "Jr" (__old.high),                          \
> +         "Jr" (__new.low), "Jr" (__new.high)                           \
> +       : "t0", "t1", "memory");                                        \
> +                                                                       \
> +       __ret.full;                                                     \
> +})
> +
>  static inline unsigned int __cmpxchg_small(volatile void *ptr, unsigned =
int old,
>                                            unsigned int new, unsigned int=
 size)
>  {
> @@ -198,6 +236,15 @@ __cmpxchg(volatile void *ptr, unsigned long old, uns=
igned long new, unsigned int
>         __res;                                                          \
>  })
>
> +/* cmpxchg128 */
> +#define system_has_cmpxchg128()                1
> +
> +#define arch_cmpxchg128(ptr, o, n)                                     \
> +({                                                                     \
> +       BUILD_BUG_ON(sizeof(*(ptr)) !=3D 16);                            =
 \
> +       __cmpxchg128_asm(ptr, o, n);                    \
> +})
> +
>  #ifdef CONFIG_64BIT
>  #define arch_cmpxchg64_local(ptr, o, n)                                 =
       \
>    ({                                                                   \
>
> --
> 2.48.1
>
>
