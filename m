Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2602E764D
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767174853; cv=none; b=nv8MAJvFlIFtfuZwLfbhsBk5BkvHewghT9WhPFgDB8jYvaPVkas3U9Ic+jT9lAiR6TqdQZP40anB3yAmAgR/d6U8ShpkY/Y8iygG6eZo90yGJusMd94fkMCfbLIURGPngEvYnQY/61QrSyercsta9J6GHVYiFWj0E43ujUss5MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767174853; c=relaxed/simple;
	bh=bEi3yA7beP326f7yCZGUawTeRehwZ+7gYSiuGu9JeFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzARblrYWM8+QVtMKfzGoQZcyDswquPBevVoH7/PjozUpQ0Pz5C4Dykydn45V5DDUzdpnkqYsbkhsA4SpcWyLQx1z7zVrNxukzkXAp87SrlDlaR1oPwtHvcM9A14RCiSEb3kwg4TaEornISw7sF39rdrwAglOy8Ce2saMsVVj8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyQupURH; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyQupURH"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-65d0441b6feso5844931eaf.1
        for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 01:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767174850; x=1767779650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5StrHsTF5tROD1aore/lts+Ly3U26MHaw2cokMpxm4=;
        b=SyQupURH1cfFRMXlSFXUb7xnKRQPF50kYQ8JTiEKQpOgeWnI2yVajtK5p3tCMcZto0
         +N79o3vzrNsJDrBgmRMcUdStrNHMCbBeVEViyPh3yKM+VLg72xQyf8b5zDv9A4mWhk5f
         Co2eHzm0zoAMw6q22WPvMCQ4d5Ypk/qbfXiTUJXOS/NmNBlRW0A9P7a1tDTOq2ZyFquL
         Xzd6WvyqA6KuskMLmTI/SnBMNf9bAUa5IgrlVb07PAB5is/vyFHNQhkJMKRGzouFDavL
         EQojr0a1+XeoDPK6L7s6rvRCrY+S+hKUmQkAt3DSkbWGH+qEJYQwECVJf6QEZNqnhCho
         VU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767174850; x=1767779650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5StrHsTF5tROD1aore/lts+Ly3U26MHaw2cokMpxm4=;
        b=mTEnkEovP3lU6GiE+blw8u1A79QtiScyc3Ss/eY1t1V5eK41EWdbChRqqEQHPrQ1KP
         Rqvt42Di/fDztUST0IyHeoEuh8Jbwi9kgYeavs/pUfRCFQwAJkmmJ/N4MWB5D1f3IS4N
         nV+FnEY4ZjFUARh4+Y6Jt9wwtoGWuhbVfMcGt/2nbV+QY2/EHPo0ECfMR4dRsLjTfef8
         nwjbDBXzCq5v3II9NwAAVcO4J2oZr/Z7I1qNudABHMO+J5NdpXINw97ke8Ey0aYjUKG4
         LTZQLi1fkLD9GIT/Mw/inmWxApYi2y6ODK5GobYdeZNH9Db998wp+vY73R4a6p2tsVIK
         ofqg==
X-Forwarded-Encrypted: i=1; AJvYcCUqS/Jo4+N6opA5o0mfk7dM1RpFAkJyyr3q0lTTN9JPvVpMhzU4GrrUa53o5xAO/yO+WH8fpXfWBo8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNHnOm1QXkfead1EGSzYPpkBIw0wcXVI4uZNocUsOFT7I78Kxj
	MOytyGRg4qxNpDHF+frrw1uC+tpclDNSgWAWxo/lU6hIM95AkYMtdvoHI/+Nxz7LvMleoGUl8wd
	FjkxWPLMfFYjbZzoOJ911ccQFJZzX4Mo=
X-Gm-Gg: AY/fxX6gJRjkSvPMyti+1tVGwaMgwS2w0gwpNcdwcAQgD170SSLOVD4P2zFqWxP1x3n
	UHA2OzAntFM8Mhw2cW30h1IlwNex7x5aFC2vAVF72WFtWDq3rVuuwZXV5HMOtXaBVof794A8I4U
	hPeW2zB7jHcbNde02aEy/6pkSNJdnh5XjVjG5doaeHCvJEIXEkyeN6jFOXc/sRGijdHAJ2vUY5N
	8Fadn7s2X8xhX+iG51DChFLarC32lY8l9qN0PC5qFyH9Kp0mOOiotaXqCegroVs+lFTR7e4e7V5
	ryAr4F0=
X-Google-Smtp-Source: AGHT+IFh75EF02POubq7ezc+kfgHd0IdVkEaSlMiqqM9Lf0eT+WAWUL7AyCtm/PgXm94t1ed4BEKC1uMVav7rBzKAEE=
X-Received: by 2002:a4a:dc0c:0:b0:65c:a528:bb6d with SMTP id
 006d021491bc7-65d0e94d6aemr12860001eaf.7.1767174850111; Wed, 31 Dec 2025
 01:54:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHSi1LPW75Ovt=M8-8sv1S2LRmZw_YduJt9OUoy+OMSjKg@mail.gmail.com>
 <20251231034523.47014-1-dongtai.guo@linux.dev> <20251231034523.47014-3-dongtai.guo@linux.dev>
In-Reply-To: <20251231034523.47014-3-dongtai.guo@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 31 Dec 2025 17:53:57 +0800
X-Gm-Features: AQt7F2q5hZgZcfhokN-Vgpx-yoFO8h4PGitaskxykvA0kIafmrvsIaCWSBIRDEk
Message-ID: <CAEyhmHTvh-N4yDiJZUGFHinra0-gys+8RQfh5XhFG3RTGHPn2g@mail.gmail.com>
Subject: Re: [PATCH v8 loongarch-next 2/3] LoongArch: Add 128-bit atomic
 cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, guodongtai@kylinos.cn, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 11:45=E2=80=AFAM George Guo <dongtai.guo@linux.dev>=
 wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> Implement 128-bit atomic compare-and-exchange using LoongArch's
> LL.D/SC.Q instructions.
>
> For LoongArch CPUs lacking 128-bit atomic instruction(e.g.,
> the SCQ instruction on 3A5000), use a spinlock to emulate
> the atomic operation.
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
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>
Tested-by: Hengqi Chen <hengqi.chen@gmail.com>

>  arch/loongarch/include/asm/cmpxchg.h | 66 ++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/includ=
e/asm/cmpxchg.h
> index 0494c2ab553e..ef793bcb7b25 100644
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
> @@ -137,6 +138,61 @@ __arch_xchg(volatile void *ptr, unsigned long x, int=
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
> +#define __cmpxchg128_locked(ptr, old, new)                             \
> +({                                                                     \
> +       u128 __ret;                                                     \
> +       static DEFINE_SPINLOCK(lock);                                   \
> +       unsigned long flags;                                            \
> +                                                                       \
> +       spin_lock_irqsave(&lock, flags);                                \
> +                                                                       \
> +       __ret =3D *(volatile u128 *)(ptr);                               =
 \
> +       if (__ret =3D=3D (old))                                          =
   \
> +               *(volatile u128 *)(ptr) =3D (new);                       =
 \
> +                                                                       \
> +       spin_unlock_irqrestore(&lock, flags);                           \
> +                                                                       \
> +       __ret;                                                          \
> +})
> +
>  static inline unsigned int __cmpxchg_small(volatile void *ptr, unsigned =
int old,
>                                            unsigned int new, unsigned int=
 size)
>  {
> @@ -224,6 +280,16 @@ __cmpxchg(volatile void *ptr, unsigned long old, uns=
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
> +       cpu_has_scq ? __cmpxchg128_asm(ptr, o, n) :                     \
> +                       __cmpxchg128_locked(ptr, o, n);                 \
> +})
> +
>  #ifdef CONFIG_64BIT
>  #define arch_cmpxchg64_local(ptr, o, n)                                 =
       \
>    ({                                                                   \
> --
> 2.49.0
>
