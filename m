Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BD238176
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764041558; cv=none; b=rNZYFzkUInvmMkRjlt7k9WnUWHW8Msz8SQelVLkkJXdVNBc3hd2v1d7om3MDObqePpKpLWI7ydKOvfydLLrpnFhisgvvRV//KruJxrbBHtj8dPtdz78O74e+lJH47gzlJ7Z64+JjYkixWhFPy0nRIYsDZTndwkZdKKOrYRO7xIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764041558; c=relaxed/simple;
	bh=ZUciDTS1ToW4r/YvTvB/59kjxpW2ZTNNw7eIj1UG15U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftetgnU0q3wLavTq17N8rSq8HKPoPayDoLlsibMC/BeLlJzvONZsLjQrG/s6BSKqrYnocQdXkEyJEi6fhpfztSAmrVv3vdMzQJB+NWg9gvYlsQveEATAj5S9dIEFLo1a9I5+ONmziFaQBKBoC3zi8NXmJXoppnbY585yRCUHimc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b=quMl8HnK; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b="quMl8HnK"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64107188baeso4462939d50.3
        for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 19:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1764041554; x=1764646354; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdraXDdY/sdj6Am5a5IhqHEu0NfKpsF/3w9oKVfcn28=;
        b=quMl8HnKKZxLqzDegZtjJ6RlW+THJ1NMMLlSzcpLp3f8I/WK7Zxvxvhj7cztg2DLYL
         3m6jZxETJvg0CpfZgIRTSv3axWLUvGK0M5f9amWFc7fS/5bb9oMoCORr//O5vkF8Xb2/
         CSElWmpM83uME+6BzK0/uUF6nEqJH7/FukRQIDVGhOkwwfjEU0o/P+3BxIfVRAPIpgtG
         eRUVapBGJ1eM5TtpoOKA7Fbat0pvuuIkZaWal+NZRu/g5tTA5zk/Kglx2z6n904z0TeA
         zbrqm3txuXsV/dKoejNChvmj1xUa2ZXHmtbxg9JL5gXE1Wrf00ahP/Gv+Ft7WNlLKW/A
         TKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764041555; x=1764646355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CdraXDdY/sdj6Am5a5IhqHEu0NfKpsF/3w9oKVfcn28=;
        b=k4EKhL16kV8wtU8S8VjYxPNG121MxK1pVJsANAhtnFGGOVexyK6Du8LBBSaK5x4RXi
         QbAFEz2oa1nXFFgjtehYCWl71rszbkTcUHPm8I3uUQ67qjG4YsBQaxDEidXtBB9y8tGm
         NMe0Tw7KU8K8OCzN6hoGWoklxojlDcMkN8bZ/1KWxXfhzUbTT5bbAO8ua27ylKdaCP0C
         4QkkJ7+WAUju5YWWQNABaQ6MAgTWTGAYPDyJC7hc41HANiAujketQe3hd8F/5Z4o2BMX
         wPXcxjlMwtfG8QOnivPdiLrNzTWz66YAWo9LSetxfVks+6igUch5tpAET+wTfkkOKp8b
         Yvsg==
X-Forwarded-Encrypted: i=1; AJvYcCWetQ3Y1CgW6lGr04cnumQ6A0TqRrRef63wTIL9PPACzSYLfSlArc4/MGhgWfYAAZJXFWL4BoOec8Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/Tijci6WkEj84WBBrX9lQuMGiNXCJkht0xQ+saXkNdYzAJoJv
	BLNHTlDdBXtaMDT7fGYDY1+oTcUvS+B2kYbqWkZGcCKI75ljfcroX4SJLlVXHTmToHNkztdc1If
	TaXheJcXqfRw912JF//uWmifJydOUKIH9ecDf+AKYWw==
X-Gm-Gg: ASbGncsU3jwbZxBfFLdziiPO5Lh5X231KARNElfqm8+/90FskzXO5KrCesuPxuWdDsg
	coVZ6uSjW7c9N5ifNtuGSJg1Vk6a667DpPreJa5IRc57izTBcACI2a4si41c8uj7aNOJigPdZcz
	1H9/TmLdfbBcyBREDU5cRSnTqNe6S7BlNL0MT5PnGvG42iBx6sZbIo0FDqEshMBuErvoY5CKr6a
	Pk6yoB+TPOAcDhpXyCXGKXEetCjZQFKn4a7Upx96dqTUmpsRc+9wy1n89GzNADlxgffcUwhWF2h
	0UcohQEGr2tVcLnWB5g+DlSnffA=
X-Google-Smtp-Source: AGHT+IGzdtDBk5mvD8NrlXr4aDEiC0oSmrhc21tCn2MImRrlX4sqmmRmcKyulRjMzSqZruqI/tvKWFQK8tJYXEesAWY=
X-Received: by 2002:a53:d00a:0:b0:641:f5bc:6966 with SMTP id
 956f58d0204a3-64302b44d7dmr7550928d50.82.1764041554538; Mon, 24 Nov 2025
 19:32:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124-2-v2-0-b38216e25fd9@linux.dev> <20251124-2-v2-1-b38216e25fd9@linux.dev>
 <CAHirt9gjjULM6CGDR2pHJkQAKMsoZ8kpqtPn79psJQP1uu6FsA@mail.gmail.com> <20251125104316.00001294@linux.dev>
In-Reply-To: <20251125104316.00001294@linux.dev>
From: hev <r@hev.cc>
Date: Tue, 25 Nov 2025 11:32:24 +0800
X-Gm-Features: AWmQ_bk4xAW-JwTmykhJFZ3cQrbR2swSVJUg8nbGALfk03m8iKjUSqZtL_FL0ys
Message-ID: <CAHirt9hAZtp3m5b4htj9R7P+g4xUtPqaRGHtd68NGC+Ke8OnEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] LoongArch: Add 128-bit atomic cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 10:43=E2=80=AFAM George Guo <dongtai.guo@linux.dev>=
 wrote:
>
> On Mon, 24 Nov 2025 19:37:40 +0800
> hev <r@hev.cc> wrote:
>
> > On Mon, Nov 24, 2025 at 5:28=E2=80=AFPM George Guo <dongtai.guo@linux.d=
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
> > >  arch/loongarch/include/asm/cmpxchg.h | 47
> > > ++++++++++++++++++++++++++++++++++++ 1 file changed, 47
> > > insertions(+)
> > >
> > > diff --git a/arch/loongarch/include/asm/cmpxchg.h
> > > b/arch/loongarch/include/asm/cmpxchg.h index
> > > 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..757f6e82b9880d04f4883dc9a80=
2312111aa4588
> > > 100644 --- a/arch/loongarch/include/asm/cmpxchg.h +++
> > > b/arch/loongarch/include/asm/cmpxchg.h @@ -111,6 +111,44 @@
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
> > > +#define __cmpxchg128_asm(ptr, old, new)
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
> > > +       "1:   ll.d    %0, %3            # 128-bit cmpxchg low   \n"
> > >     \
> > > +       "     dbar    0                 # memory barrier        \n"
> > >     \
> > > +       "     ld.d    %1, %4            # 128-bit cmpxchg high  \n"
> > >     \
> > > +       "     bne     %0, %z5, 2f                               \n"
> > >     \
> > > +       "     bne     %1, %z6, 2f                               \n"
> > >     \
> > > +       "     move    $t0, %z7                                  \n"
> > >     \
> > > +       "     move    $t1, %z8                                  \n"
> > >     \
> > > +       "     sc.q    $t0, $t1, %2                              \n"
> > >     \
> > > +       "     beqz    $t0, 1b                                   \n"
> > >     \
> > > +       "2:                                                     \n"
> > >     \
> > > +       __WEAK_LLSC_MB
> > >     \
> > > +       : "=3D&r" (__ret.low), "=3D&r" (__ret.high),
> > >     \
> > > +         "=3DZB" (__ptr[0])
> > >     \
> >
> > "ZB" isn't a legal constraint for the address operand in sc.q. When
> > assembled, it turns into something like sc.q $r,$r,$r,0, which clearly
> > doesn't match the instruction format, yet gas happily accepts it wheil
> > clang rightfully rejects it. Classic GNU-as leniency biting again. :)
> >
> Hi Hev,
>
> Thanks for your advice, I tried sc.q with r or ZC. the result as
> below: (with gcc 14.2.1 in fedora-42)
>    - sc.q with "r"  caused system hang

input operands:
 : "r" (__ptr), ...

>    - sc.q with "ZC" caused compiler error:
>      {standard input}: Assembler messages:
>      {standard input}:10037: Fatal error: Immediate overflow.
>      format: u0:0 )
> > > +       : "ZC" (__ptr[0]), "m" (__ptr[1]),
> > >     \
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
> > > @@ -198,6 +236,15 @@ __cmpxchg(volatile void *ptr, unsigned long
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
> > > +       __cmpxchg128_asm(ptr, o, n);                    \
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
>
