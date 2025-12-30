Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581053A1E6B
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097059; cv=none; b=K0/fT5Q3GDjezhgPaeQH6+EMm/zTD4Bi3SjI0UeCzclIn9X3hpOdcYKd5KTSDiAsXeFhC6tWTGtFb2Jir1X0eHoY675ogbU+2BDKfVZJcO/6gB5BV5LqNHS56YRfH6VgZNXhLDS9cZUah7EM+xOktavqJJn23LwP7szorDrAPJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097059; c=relaxed/simple;
	bh=RNqhanOrF2Bbf/FpMRi9NOv+Deus2ZbZUblar+qryzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVpDo2POes2ne/X0iMeeho7yORoIMin/cIduveI28r1t2Vw3Ligd0uzr5aRdBrBtev+jBpl8gu5f/jqB9QJ3rwccoIdE1WwohVI/sV3hlFWImMGZJTjDeRg0RyMXlNPQqWfnwb1po5/ICjV4gdBHi2NOlFj1jXONobHH+CrirkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaNB5Mwo; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaNB5Mwo"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-44ffed84cccso1992662b6e.0
        for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 04:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097057; x=1767701857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQ41jZp1YQZhDtLplxd/txXr3/BZj6SV61zdDaeAoik=;
        b=LaNB5Mwo2G4Wi1M0LgLOQ0pAyY6kxWgTLFKAUnArSSr6QdfcGfDv1KOTRecDiIXGmc
         +oztMVjUOMJ/EykHVKSu59JYTLBV0UoSx0oqPQuXgvb9fkAjJNPtvpNMsKEgqj3A4n3c
         0JK6p4TIxEHGaCwptLOK5xoUG25D2UdFQsGjx3NXPPZF5ShAN1Wl8CPXL9f0ldFWNMrw
         VUae7FBvi2DjbtJYIjKtCZQqJepwU1y65iheYyjQn4no07VkX8iHiCBKimqfocruAu6k
         4uCZ1mMfirAY0FMxngiiDA6X+5a+gXEwHD0QSD3kGSXKI6pMaxLY8LeKDpXjPlwJdCeT
         9mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097057; x=1767701857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQ41jZp1YQZhDtLplxd/txXr3/BZj6SV61zdDaeAoik=;
        b=uCE8fRfyDm7WM4Xmgg10a3gLnP4JllRmMMVaWQODBYPy4Osgri57nqavhsx81LnXPw
         ISn5TMxh3GO6QDqodvv5yQxhDBjk0rpykcPNhRIIJ9i5C9/0cZbEzRrBDY4/dM0h8AeN
         A6Csy2AjfXOuhWS2ueDOSiz1zvfJBmNcxycPfexY1xBmGptsluzyiZudLZUIOtDKf3wE
         cG+E44797rCQ2KMCuoPNMnJJzDR1OVms7rO/kQPLGVnulMl5dBd9WCOnVfyRGVK3cXHN
         e0clmkUnDeN45FOqVEBpJI1+QXUq4ZtOLE5fd2LD+PNuFMFINyHs0p7kMULypa5o5E+R
         VoUw==
X-Forwarded-Encrypted: i=1; AJvYcCVvm7PWcUbH0h7ykiCVyqKOz2EWSVvJtqLwjTMPMaBcTANXWBbju2Om6DGVKSjXGItoqU82doe2rcQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2wwJqtoTjv1MDZZwtH0ypFpub3KZc5gGkjloll+3WDEaFxc65
	PS40u00/v3L5plAXCoU1wVpOua/4asxfbym/vV+3rNJ2UIZy3GqKgC0XrRthYSs+NfDpdBGNkrc
	KgD+bt+78QjU9qh/Ucwlr2Y8lQlE0Ffg=
X-Gm-Gg: AY/fxX5Ch+CVfjf7fs3haV2SS5hA6X9wlEuJilvZSrzeGpKaPft+VJLXsBn+eNLSpAA
	Xo1IAtSQJiOzH964IlSZliqytbblcjAf/DhUgrAK533iy4yE93wW6WeBpWvGfLOxa7J+swJ/u1/
	pBtCZSsl1HIVfY5W9f8rIpnZ581jeS62+TruJ6kMKDGv9wrYiYyK7DCxmtdBg9iyAffM6xS26/H
	RuvyDSx/px4WwzrmVKGkhi+E7I9OQX/CyyPBWFO61+JiGpGfMe68v2kIozYGqyThMK1Kd5x0S+f
	xPYncQ0=
X-Google-Smtp-Source: AGHT+IEI8zT2bmMv8ITH+/iOKaXWC8hnY2W0VPqSeW9HmB2imcky6JAAqy7ygWBoCwfdo+vfj5erw3a+V94XVVrVg1g=
X-Received: by 2002:a05:6808:1241:b0:442:522:41a3 with SMTP id
 5614622812f47-457b228736emr16002416b6e.60.1767097057210; Tue, 30 Dec 2025
 04:17:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHT1gRtGCiM7C6QmrF38xxzc2OLKgiNRWd0whpSSJoyrjg@mail.gmail.com>
 <20251230013417.37393-1-dongtai.guo@linux.dev> <20251230013417.37393-3-dongtai.guo@linux.dev>
In-Reply-To: <20251230013417.37393-3-dongtai.guo@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 30 Dec 2025 20:17:26 +0800
X-Gm-Features: AQt7F2qwp-ZFZpqW1VcjYHxwDyb6V0-ySD-QcMVRf7JtRByk0yeIxlm8l33srbI
Message-ID: <CAEyhmHSG96Ps9b3XgRUqfq=FAR3JtDmu+4U=jVFreinwVte-Eg@mail.gmail.com>
Subject: Re: [PATCH v7 loongarch-next 2/4] LoongArch: Add 128-bit atomic
 cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, guodongtai@kylinos.cn, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 9:34=E2=80=AFAM George Guo <dongtai.guo@linux.dev> =
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

As I mentioned in last cycle, patch 2 and patch 3 can be merged into one.
Please also add a link ([1]) to upstream commit that breaks these tests.

  [1]: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?=
id=3D5fb750e8a9ae

> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/include/asm/cmpxchg.h | 47 ++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/includ=
e/asm/cmpxchg.h
> index 0494c2ab553e..61ce6a0889f0 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -137,6 +137,44 @@ __arch_xchg(volatile void *ptr, unsigned long x, int=
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
> +       __WEAK_LLSC_MB                                                  \
> +       "     ld.d    %1, %4            # 128-bit cmpxchg high  \n"     \
> +       "     bne     %0, %z5, 2f                               \n"     \
> +       "     bne     %1, %z6, 2f                               \n"     \
> +       "     move    $t0, %z7                                  \n"     \
> +       "     move    $t1, %z8                                  \n"     \
> +       "     sc.q    $t0, $t1, %2                              \n"     \
> +       "     beqz    $t0, 1b                                   \n"     \
> +       "2:                                                     \n"     \
> +       __WEAK_LLSC_MB                                                  \
> +       : "=3D&r" (__ret.low), "=3D&r" (__ret.high)                      =
   \
> +       : "r" (__ptr),                                                  \
> +         "ZC" (__ptr[0]), "m" (__ptr[1]),                              \
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
> @@ -224,6 +262,15 @@ __cmpxchg(volatile void *ptr, unsigned long old, uns=
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
> +       __cmpxchg128_asm(ptr, o, n);                                    \
> +})
> +
>  #ifdef CONFIG_64BIT
>  #define arch_cmpxchg64_local(ptr, o, n)                                 =
       \
>    ({                                                                   \
> --
> 2.49.0
>
