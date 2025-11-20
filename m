Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8792FF645
	for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630749; cv=none; b=GrJ+YLiGidLv5ic99soFx9va33k5xOMGxGacx+45jkPnq1AtR6mW+kTpMcia30e//slzjJoFUMni+YEjqTmwrhwXUm5APik8C5TY9aNc/FbD5vfXIO6gvWznH6wxrow/pS0hUJqOUpmsZqZGqh9seehuM9GMAJFBZTiBdMIeceY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630749; c=relaxed/simple;
	bh=u+UDEkoynGcMHXlDkVU8QdtSw3e7i+6xf4iNEpx05l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzoVHwkWt7vKiYOZ86TTe6eflkERmK7G6wz97Lc6x9V30yw9FtGS/b/y/OZjLVi1Kp82JD/nXEWeuq6bo06OGvAI6351rAY4OfarEisA5dnjeFkv3l2BRpzb8Wikzv25rYJW7ZOIvNTob05F+PcCpagL/vSdzX10WoZMiFWe72c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b=gQtTm8to; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b="gQtTm8to"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-787e35ab178so6173267b3.2
        for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 01:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1763630746; x=1764235546; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiXIh/s+OivWHxLWH1Qh/HEfQkeEixVae/Gj+mJZp24=;
        b=gQtTm8toeGM+1vhtD9BieFdeFs4X4Gx8FOKgyzfX3QyaguNRFsAh7185KgDch92CqY
         UNBP+RN8+ujxKZQ+hhP/fwi6qGKEHz/ACvKGc29Ul5Wp+Zj8W6Qfpus3vi5e+olvUnbH
         7/B03mkOQSj350jSeqmhKeEMyHtWxrTSmYpi22Eoqef+Tc5Hyx7/bpb+WZyb6jwVnGJh
         1DlxjqIq3SMNaS/tc7bjQzS5ECFYdQzvLvxbXGoSLRie9kMAVTItBGuy2wtyI8z+Q0nN
         3q+IPD1ydDwuCjyoL9/MFZ0Aj/1iFLL5knuxv1NbDHikHvtFz31BQ0cBbLnnke3IQUP1
         ESzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630746; x=1764235546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yiXIh/s+OivWHxLWH1Qh/HEfQkeEixVae/Gj+mJZp24=;
        b=IaG0AOdVEFO0NDbKpdSsp099Knq57i+Gv9csIyDPIrMCR/ovArEl1Z+9Y9LTmXd/C0
         2sYHbwx/ZfvaTwlfjQbf0NJgtTtGAH5WGOKTq/6o/1i074/GX2uQz/yTlQPhW/QoAkgf
         5yiOPC+xTnFkYHYL2p0RaIuQb2BNKkndTpbN8NX+qWvTfNBhowZ1HBImDKwsJYHaDkF9
         O2hGxyLmib0rIYx7X4BGPtGyLkLWkUQbB91DlEO7bvPQ7zQEIHTreIT7KEXWq2Q6BEZw
         LYY8LQPNoVvrzoNZ0GjLXKl1T28oYfKicshjrb8AfUk/5vP8INtjg/FpI1hm2idESjM1
         XNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfGe8mP/+1qomhENNRfSiFZBKwYkkVGI1urGok5G0wDbt0TxrFUUmw33AbDFRtHi9tbjjPXK01/ko=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBgECzhSW/QAVFiN0BmtfgEacu8YwyiW/PAzUcSKrerbnAl1ay
	7hVRC4lQFgQ2zSTwA6G/ZXzW3YVbAH3RKPOTKtdwyFd0NE1iH4JqOHzqZbahLp+lqQ4otwL6BFL
	jorchnd9KcfvLvTpdhF49Bxg8vfl75Pxj/KFo+qWbpA==
X-Gm-Gg: ASbGncsAJmSOGapz2x86hkYnIanSFeaW2wnTLjvGoIwA46nPDL9sV42WMlZu9pll3b/
	0zKZyLsAymsknMGKnv1InpnqrkaK0hwsdruMlVWK+PaQVE362eyTlKZg0UDrQEE60YHsdBNFZJ7
	2iu6VGhwsnj9Snt6InWvwcApOnWAGGgJzXObWppPy+Yd5XutpLcLlN6y3ZAgh2RnBSKZpOEBLPi
	gyb2xwc5vj4EKZByuXx9+3WbCk7zHiGPuaYvMERNBNt/idWPmHHv92i/Jot6kR8tAJo8syxt6ZD
	vDkuPkN9t5RAQalHAsBDTb7o5fE=
X-Google-Smtp-Source: AGHT+IH21XJjet9blMWbHaVB56ehTAl8aI4v4OkpQfBmhjBHgLQ8HgtRArjFmeuPIXjCvR3thvEUHUJL5490xVgKR7E=
X-Received: by 2002:a05:690c:6005:b0:788:1adf:fa6c with SMTP id
 00721157ae682-78a7abfdcd8mr18138957b3.33.1763630746435; Thu, 20 Nov 2025
 01:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120-2-v1-0-705bdc440550@linux.dev> <20251120-2-v1-1-705bdc440550@linux.dev>
In-Reply-To: <20251120-2-v1-1-705bdc440550@linux.dev>
From: hev <r@hev.cc>
Date: Thu, 20 Nov 2025 17:25:34 +0800
X-Gm-Features: AWmQ_bllAUYt5e8JsE2p7NcA9VsTMQWssTuSN10sX-y7qCv6-SC0Sp54dNsVoxo
Message-ID: <CAHirt9j7xxYi1xrvksu=L29kh1MSbMgYBRAUQYgDh-AR+FXoOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] LoongArch: Add 128-bit atomic cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 3:46=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
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
>  arch/loongarch/include/asm/cmpxchg.h | 46 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/includ=
e/asm/cmpxchg.h
> index 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..5f8d418595cf62ec3153dd382=
5d80ac1fb31e883 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -111,6 +111,43 @@ __arch_xchg(volatile void *ptr, unsigned long x, int=
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
> +#define __cmpxchg128_asm(ld, st, ptr, old, new)                         =
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
> +       "1:   " ld "  %0, %4          # 128-bit cmpxchg low  \n"        \
> +       "     " ld "  %1, %5          # 128-bit cmpxchg high \n"        \
> +       "     bne     %0, %z6, 2f                            \n"        \
> +       "     bne     %1, %z7, 2f                            \n"        \
> +       "     move    $t0, %z8                               \n"        \
> +       "     move    $t1, %z9                               \n"        \
> +       "     " st "  $t0, $t1, %2                           \n"        \
> +       "     beqz    $t0, 1b                                \n"        \
> +       "2:                                                  \n"        \
> +       __WEAK_LLSC_MB                                                  \
> +       : "=3D&r" (__ret.low), "=3D&r" (__ret.high),                     =
   \
> +         "=3DZB" (__ptr[0]), "=3DZB" (__ptr[1])                         =
   \
> +       : "ZB" (__ptr[0]), "ZB" (__ptr[1]),                             \

Address operand constraints:
- ld.d: "m"
- ll.d: "ZC"
- sc.q: "r"

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
> @@ -198,6 +235,15 @@ __cmpxchg(volatile void *ptr, unsigned long old, uns=
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
> +       __cmpxchg128_asm("ll.d", "sc.d", ptr, o, n);                    \

"sc.d" -> "sc.q"

__cmpxchg128_asm doesn=E2=80=99t have multiple variants, so no need to gene=
ricize it?

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

--
Rui
