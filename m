Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90DF32ED44
	for <loongarch@lists.linux.dev>; Wed, 28 Jan 2026 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769574400; cv=none; b=SCGnj0d9Tw53ElpgYxTV1yH3YQezTeGpEj0EeJS/1PbkFVYigVm1W7p+BAFZkTeHjPKV3u4TaxI5t+yfyTs+Xt7H1Kny4en6qUiB9/pcVeqzby8RyUMfv5IgFs6jBJMu7M81nf/elyfCsF4+sa0rfLyjKA/JFhpT0KRlTcLeWik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769574400; c=relaxed/simple;
	bh=Pc2rI7qM19mFDaNqMnNEawZEG0Y9trD2JN4G9HCShHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axPM8AHFPixapR8DX2TxsSR/RpNYI3ZYBkm/0g6xY6RFVK/4o5Yxv94kbepdjJ4gQred/IZPkDgLFxAp09GGL/5WzFVI3naVOdv2a3zc106kBM0Vadq3YIRN30eJ2C9JlpBULUWdTKL8CWq+ts08H6TQ2q7aPfH4XSCmRSwFYww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQ11QC6E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQ11QC6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FD4C4AF0B
	for <loongarch@lists.linux.dev>; Wed, 28 Jan 2026 04:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769574400;
	bh=Pc2rI7qM19mFDaNqMnNEawZEG0Y9trD2JN4G9HCShHU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vQ11QC6E+S/D7qEEkf8eaT6C8u/66QGwJFDs65FNOpJqui5dzTWsFjOyXr/kFb2Hy
	 6qfakfSdRWtCA4yVmcnDOwvyKVGcfFIh4ttFgqBGRFqaGmjuLSHuw691YlNqGJtRWK
	 BZuaiYLfXISiDnRmuDuCqr8ErN3Fx4PcgxiNQqaIASEixsbaR4MGfC9gusxXPMyQKF
	 AuB91GAHwIUrAK+fPOMAFvYTIWF4OzwLTApSgyIgdRjCOEqedBDns4WS6LAvT50Gds
	 gnfNh8CvQtaCewbBzIL3/q2xDm1oEFBqSKlcto+arNHjmzq8NezpeGsOe/WdrwvcRa
	 PAk+ApTriWrkQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8863db032dso794823366b.0
        for <loongarch@lists.linux.dev>; Tue, 27 Jan 2026 20:26:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFw1d9OzoymoZMy1V4GyB6yF/A9BS4hYiD98InTqVx6trFFD/9S7cFxYlqa7yD/Adn/NB9vLBhtZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwV0E96UDe4f/TGOHKJgoyNdCWMQL3wcofP5WiE3AuEaPf9Y459
	2sAwwvVwBFY3nnNLvp7O6aNatTZayfdN4OwZX2Dowp4axIz0TPtw4IqpcF7g4wHfBNLO61nbFbi
	TYRGCiSKRcsUUWIpZ6ce6T1o+G0i0SC8=
X-Received: by 2002:a17:907:868e:b0:b88:61c3:3701 with SMTP id
 a640c23a62f3a-b8dab382724mr277739066b.52.1769574397941; Tue, 27 Jan 2026
 20:26:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260110131124.99866-1-dongtai.guo@linux.dev> <20260110131124.99866-3-dongtai.guo@linux.dev>
In-Reply-To: <20260110131124.99866-3-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 28 Jan 2026 12:26:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7qsoZ6YbrJgi8z7ejr3kxeG5nW2hGpYjMP8H5WXYc2NA@mail.gmail.com>
X-Gm-Features: AZwV_Qhp-sPlHtyH_1ILj-l04EL-hmPdpPEoxDnMbGGP-s2u9xBMDzJ8woP_ljs
Message-ID: <CAAhV-H7qsoZ6YbrJgi8z7ejr3kxeG5nW2hGpYjMP8H5WXYc2NA@mail.gmail.com>
Subject: Re: [PATCH v10 loongarch-next 2/3] LoongArch: Add 128-bit atomic
 cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: guodongtai@kylinos.cn, hengqi.chen@gmail.com, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and add arch_cmpxchg128_local(), you can check whether everthing is=
 OK.
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.g=
it/commit/?h=3Dloongarch-next&id=3D09a3171203974a30c6d0ab66f8ef0a6d9e7e780e

Huacai

On Sat, Jan 10, 2026 at 9:11=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
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
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/=
?id=3D5fb750e8a9ae
> Acked-by: Hengqi Chen <hengqi.chen@gmail.com>
> Tested-by: Hengqi Chen <hengqi.chen@gmail.com>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/Kconfig               |  2 ++
>  arch/loongarch/include/asm/cmpxchg.h | 48 ++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 730f34214519..f9845ebec1a4 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -114,6 +114,7 @@ config LOONGARCH
>         select GENERIC_TIME_VSYSCALL
>         select GPIOLIB
>         select HAS_IOPORT
> +       select HAVE_ALIGNED_STRUCT_PAGE
>         select HAVE_ARCH_AUDITSYSCALL
>         select HAVE_ARCH_BITREVERSE
>         select HAVE_ARCH_JUMP_LABEL
> @@ -130,6 +131,7 @@ config LOONGARCH
>         select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>         select HAVE_ARCH_USERFAULTFD_MINOR if USERFAULTFD
>         select HAVE_ASM_MODVERSIONS
> +       select HAVE_CMPXCHG_DOUBLE
>         select HAVE_CONTEXT_TRACKING_USER
>         select HAVE_C_RECORDMCOUNT
>         select HAVE_DEBUG_KMEMLEAK
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/includ=
e/asm/cmpxchg.h
> index 0494c2ab553e..d25e25d8fc9e 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -8,6 +8,7 @@
>  #include <linux/bits.h>
>  #include <linux/build_bug.h>
>  #include <asm/barrier.h>
> +#include <asm/cpu-features.h>
>
>  #define __xchg_amo_asm(amswap_db, m, val)      \
>  ({                                             \
> @@ -137,6 +138,44 @@ __arch_xchg(volatile void *ptr, unsigned long x, int=
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
> +#define __arch_cmpxchg128(ptr, old, new)                                =
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
> @@ -224,6 +263,15 @@ __cmpxchg(volatile void *ptr, unsigned long old, uns=
igned long new, unsigned int
>         __res;                                                          \
>  })
>
> +/* cmpxchg128 */
> +#define system_has_cmpxchg128()                (cpu_has_scq)
> +
> +#define arch_cmpxchg128(ptr, o, n)                                     \
> +({                                                                     \
> +       BUILD_BUG_ON(sizeof(*(ptr)) !=3D 16);                            =
 \
> +       __arch_cmpxchg128(ptr, o, n);                                   \
> +})
> +
>  #ifdef CONFIG_64BIT
>  #define arch_cmpxchg64_local(ptr, o, n)                                 =
       \
>    ({                                                                   \
> --
> 2.49.0
>
>
