Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D2534AB0B
	for <loongarch@lists.linux.dev>; Fri, 21 Nov 2025 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725103; cv=none; b=KTZApPIsVfujSEAhIwtD2eqdlWFajftnKu3ps6ZFzkwuYbcpCxG3NewkvcHJDsGU3is+AbRcdDAbNvXsNmtCHy8CypvheqsFb6wxELuBUFCVVf5ItSGs8INARHsshuxGRUKoc6tPacNW5s0SJhqHil/VelRMy6UR9u5CH0tt34E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725103; c=relaxed/simple;
	bh=Ob1Md4dyfCfyrYFIfW03vj2a/2IkRCcUcj4c3yf8Muo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzMFSRraP9WhM18X3yHzupaocTYlDbVUZFQzMVf1eZifdKqOvCwXIhwfHVGl06xixsa19rXPQVf4/K5CQiZgwgRcehC2OXHELOBcOMinxME8O3jEY+3KzbuoevG8A27Ree5eSUs3CX7bSBgCXQwAHzq9L0qO0X7PHO+LF0ba99g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b=ln7PHgH1; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b="ln7PHgH1"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so1603763d50.3
        for <loongarch@lists.linux.dev>; Fri, 21 Nov 2025 03:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1763725099; x=1764329899; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZm6JinDzrk9wCTvPYa8wVJeVOirWBFNPVI55Z3FzBQ=;
        b=ln7PHgH1RIl3aLrNsaJeGe+BhNpOyct61oH1fBSbiphTZSY+J8ngnmYi+pqUYPdxA5
         ayHFHl0NdCxK0V9/V/BmPw8VRZ3IYTMqkHiVYtp4hsNiGdWI0n6AauWdED+KjBB9CEKx
         TEBKMISDiKdSsGx15AX81YppAJdPH6X030/SuTP2Uw/SQXqoMxG5+NbdffJmF85Hy3DN
         yhg2fejrnepJWiqNKP9RcTzfQXBdgmb1eu1jZ0Zr9gOopR0YpIrqLvgOoL5pGzT6ipqL
         T4FuANC4xnMf4HWsGan4kbOjNG18SF+PtUaanAhH7+HwKA/JagOLl7nukvoB1615AkHZ
         VgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763725099; x=1764329899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZm6JinDzrk9wCTvPYa8wVJeVOirWBFNPVI55Z3FzBQ=;
        b=BH55w26KcxdQs3LwAjcu+ljF2Ep5WuB1Me0MO5MeSkJ/OJyqZ7TDl/Fok9y4PGwgyN
         jaPPm+W3zcNT8ssIscUKNTdceZC3BIdBDGShVjk4Hgi/jahA4az89wunA+u6PHfYT8xM
         Mpet5sUwq5TeYDOCDxpFr2TgABlmlKUb4SxVOmuj9sjC+8CM/+pMfKqk4Mix5+EKts4a
         samQbmdEoUyiaIkXNVrDrE30BuZw6SZ5DRBjC8rzBOHkOksWmErPzlI/m20eRTdzBstW
         OldlHQrt6lAt4nmtIh547qs9ZDstzHaiNMC97VHcSDRD7vOT9bWOwFo0NU9+GWe/V2c2
         2z+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVK79qZugqfpryjKltTSY2Sb2TtIJPayXA5v9HJbphg2zGYHTkc66dJ4l0R5E5ABP2NJVpcXvvUYso=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtqOYRiaw30omuG0u12r1pvGd5YMrJ+1N36QuqybzKI1V/dgt/
	IHIJNC578TRIw0d/2oJTy87UD4KBjC5Wx9stGbJPuXREsUBcPtZ76vHd0oPgMzqzM0AUg7qqyHK
	OhXzc62ckXpTHLGBbRIiJnjSPwX1OKT4T+OFc8uCpQQ==
X-Gm-Gg: ASbGncs07x1ls4rPBCDjLOarwIAnpICwNWceXk+ZWVIQ+5kpce3QFwygN9mooSrYRq7
	d8B+u0WzQGUBby1nZqp9+zXdVUphG462xLMWSuzIhfCszJA7x4IS0b3NQrwMkFzt5OTZzLQpd/j
	sVIdSCw2/B1liUNmg/heoUhualhQIa53Yp3p5e8+FjqtllnQiYvsAxzvYRqjYw1h7yfO3tKNusm
	5HfPvXKluX8MuXP5Od9+JdD+FizDw7/WUs65tmAJrGK4dyd68GumZhSMC2i+9gAvzxcGVG14TCm
	NHDxxuz+LZwcU3SY8MNupx6DieM=
X-Google-Smtp-Source: AGHT+IGZdsDIgLlbX8bANFacrFxPIv6FO2GkZsJMD5ZDgAqXjo4z5LgY3xHKae1XUz0y6XB/PRAwqtsIzkLb5gC/w9g=
X-Received: by 2002:a53:acc3:0:20b0:640:ce59:1275 with SMTP id
 956f58d0204a3-64302ab674amr909657d50.32.1763725098704; Fri, 21 Nov 2025
 03:38:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120-2-v1-0-705bdc440550@linux.dev> <20251120-2-v1-1-705bdc440550@linux.dev>
 <CAHirt9j7xxYi1xrvksu=L29kh1MSbMgYBRAUQYgDh-AR+FXoOA@mail.gmail.com> <20251121175151.0000124b@linux.dev>
In-Reply-To: <20251121175151.0000124b@linux.dev>
From: hev <r@hev.cc>
Date: Fri, 21 Nov 2025 19:38:08 +0800
X-Gm-Features: AWmQ_bn7dVXRAfPFo7iCWtBG5xX0jRENbb3zwcMzRDtT2A3kscOv1N76PPmy_bg
Message-ID: <CAHirt9jjp-u500TVXOWAKfw_L0gKRzshJ8LfZwb2wngiK+iEQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] LoongArch: Add 128-bit atomic cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 5:52=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> On Thu, 20 Nov 2025 17:25:34 +0800
> hev <r@hev.cc> wrote:
>
> > On Thu, Nov 20, 2025 at 3:46=E2=80=AFPM George Guo <dongtai.guo@linux.d=
ev>
> > wrote:
> > >
> > > From: George Guo <guodongtai@kylinos.cn>
> > >
> > > Implement 128-bit atomic compare-and-exchange using LoongArch's
> > > LL.D/SC.Q instructions.
> > >
> > > At the same time, fix BPF scheduler test failures (scx_central
> > > scx_qmap) caused by kmalloc_nolock_noprof returning NULL due to
> > > missing 128-bit atomics. The NULL returns led to -ENOMEM errors
> > > during scheduler initialization, causing test cases to fail.
> > >
> > > Verified by testing with the scx_qmap scheduler (located in
> > > tools/sched_ext/). Building with `make` and running
> > > ./tools/sched_ext/build/bin/scx_qmap.
> > >
> > > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > > ---
> > >  arch/loongarch/include/asm/cmpxchg.h | 46
> > > ++++++++++++++++++++++++++++++++++++ 1 file changed, 46
> > > insertions(+)
> > >
> > > diff --git a/arch/loongarch/include/asm/cmpxchg.h
> > > b/arch/loongarch/include/asm/cmpxchg.h index
> > > 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..5f8d418595cf62ec3153dd3825d=
80ac1fb31e883
> > > 100644 --- a/arch/loongarch/include/asm/cmpxchg.h +++
> > > b/arch/loongarch/include/asm/cmpxchg.h @@ -111,6 +111,43 @@
> > > __arch_xchg(volatile void *ptr, unsigned long x, int size) __ret;
> > >                                                        \ })
> > >
> > > +union __u128_halves {
> > > +       u128 full;
> > > +       struct {
> > > +               u64 low;
> > > +               u64 high;
> > > +       };
> > > +};
> > > +
> > > +#define __cmpxchg128_asm(ld, st, ptr, old, new)
> > >             \ +({
> > >                   \
> > > +       union __u128_halves __old, __new, __ret;
> > >     \
> > > +       volatile u64 *__ptr =3D (volatile u64 *)(ptr);
> > >     \
> > > +
> > >     \
> > > +       __old.full =3D (old);
> > >     \
> > > +       __new.full =3D (new);
> > >     \
> > > +
> > >     \
> > > +       __asm__ __volatile__(
> > >     \
> > > +       "1:   " ld "  %0, %4          # 128-bit cmpxchg low  \n"
> > >     \
> > > +       "     " ld "  %1, %5          # 128-bit cmpxchg high \n"
> > >     \
> > > +       "     bne     %0, %z6, 2f                            \n"
> > >     \
> > > +       "     bne     %1, %z7, 2f                            \n"
> > >     \
> > > +       "     move    $t0, %z8                               \n"
> > >     \
> > > +       "     move    $t1, %z9                               \n"
> > >     \
> > > +       "     " st "  $t0, $t1, %2                           \n"
> > >     \
> > > +       "     beqz    $t0, 1b                                \n"
> > >     \
> > > +       "2:                                                  \n"
> > >     \
> > > +       __WEAK_LLSC_MB
> > >     \
> > > +       : "=3D&r" (__ret.low), "=3D&r" (__ret.high),
> > >     \
> > > +         "=3DZB" (__ptr[0]), "=3DZB" (__ptr[1])
> > >     \
> > > +       : "ZB" (__ptr[0]), "ZB" (__ptr[1]),
> > >     \
> >
> > Address operand constraints:
> > - ld.d: "m"
> > - ll.d: "ZC"
> > - sc.q: "r"
> >
> Thanks for your advice.
> Could you tell me how to find these constraints?

https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html

> > > +         "Jr" (__old.low), "Jr" (__old.high),
> > >     \
> > > +         "Jr" (__new.low), "Jr" (__new.high)
> > >     \
> > > +       : "t0", "t1", "memory");
> > >     \
> > > +
> > >     \
> > > +       __ret.full;
> > >     \ +})
> > > +
> > >  static inline unsigned int __cmpxchg_small(volatile void *ptr,
> > > unsigned int old, unsigned int new, unsigned int size)
> > >  {
> > > @@ -198,6 +235,15 @@ __cmpxchg(volatile void *ptr, unsigned long
> > > old, unsigned long new, unsigned int __res;
> > >                                  \ })
> > >
> > > +/* cmpxchg128 */
> > > +#define system_has_cmpxchg128()                1
> > > +
> > > +#define arch_cmpxchg128(ptr, o, n)
> > >     \ +({
> > >           \
> > > +       BUILD_BUG_ON(sizeof(*(ptr)) !=3D 16);
> > >     \
> > > +       __cmpxchg128_asm("ll.d", "sc.d", ptr, o, n);
> > >     \
> >
> > "sc.d" -> "sc.q"
> >
> > __cmpxchg128_asm doesn=E2=80=99t have multiple variants, so no need to
> > genericize it?
> >
> > > +})
> > > +
> > >  #ifdef CONFIG_64BIT
> > >  #define arch_cmpxchg64_local(ptr, o, n)
> > >             \ ({
> > >                \
> > >
> > > --
> > > 2.48.1
> > >
> > >
> >
> > --
> > Rui
>
