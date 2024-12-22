Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E48C1FC8
	for <loongarch@lists.linux.dev>; Sun, 22 Dec 2024 00:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734828748; cv=none; b=ArFd0Y5Q1RmbWz485EQ17vPTmvbUSSchm/vUyjHmK7xqwtf31QW5j7c4GyosyrYztJ3x6GHGdLuqQmmN7tc4lJ1H4nWFKNqMzyYGzn7wewvsQvkETq2/TPI0VvMoa4C4jUSNr3xvH9wkv6GF59pD8toinTyT7L11b9pvxuwSIBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734828748; c=relaxed/simple;
	bh=Lwv+95ot2twUX6GsOV+1rAqhwnRBzkh6SEQLcu7rgjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvqj/f1CeEjIFw2JJe/ejsLLveKpz1Y9Dl/+xcHv5l2SxBq/xXkayWPa2pbsht/pS8z/GAZX1Nxi3D97tSzjDhXtU5iFDN4StfPFHIZSNJtcHBvVqr9jWp0Tg0ib4qZ5FX+itMksQ6wUfHAXchStd3M2t4H658f7xF/Rl4RyWXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNlE5kHD; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNlE5kHD"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so532753276.3
        for <loongarch@lists.linux.dev>; Sat, 21 Dec 2024 16:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734828744; x=1735433544; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G56dFj5BRaIttSoRxhRi+K83W3sP81bwdAaZ6QoaIrc=;
        b=ZNlE5kHD65HuElUa9Qy9WWdMqnQA/kLNAmbZDXmfdTIkod50cAZFfv/0xmrT1tfNgP
         96IoCQA/RS/xIkvXQBOBOg4KGLCx8wbs6MWQHt54/z5IbeiGihBD6FSnjW9Vx5KDz8Lh
         pKhfuOLQXGUSMLjlEV5ojtAyJl8BfpGfDm/BWKmrZG1L3pCRt2/Ox9VITcI7n98KUnR+
         HaaRUekVJJWds3/hn7neGYdy53htS44L/tv23I4sF9hSJlTru4G5q6aED5pKJbouXyDz
         e08eBFScnLvXUxn/+V8ToukkPmcnrtm1++FTttYd6iw4Br2cWB+CRmn5zeDTtcvnHqyN
         9uoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734828744; x=1735433544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G56dFj5BRaIttSoRxhRi+K83W3sP81bwdAaZ6QoaIrc=;
        b=f3LplOdRvUktxm53VGA9Gijn2sUTtSyqKtiXHYY9vuBwFsWFRAgy3YoOWuTOmB5GBN
         2O61LNv2WeFifZFSgc73nGl1813DUbfH/DC2jYma+9GiQ8i7iEFkZhSe3omVWBWdwZTr
         Qt8CdK5eO8KzJBExt6nvJ7aJ4cB0FfK/+HYAqtn1gPM/fGIUHEfae1Xg1A1bdDh1gv/B
         u2v05O6CzQeVD4L3BMKIIUxGbkKS1b6Gm62rpMz+Ni7EMWf8ev+K7yTC22h1IQtNA0YL
         MoJnza+OC889p4udWyYfbi4cJybcWlZfLb1XcmjWVR5s8Q1VcfzNq1ox9IkPgvHleeHu
         1UBw==
X-Forwarded-Encrypted: i=1; AJvYcCWKCAdk8QmejeQokr8ssDc4hGqS3dgjGbLRVdcCv95Dpx3TErI2yeh/zrCDN65HXWx+PlC8gTndtGg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyknQ0ECRbk7WGteNZzZxBBbqTc4tG9WOadYzl+MtjrVj6Vx6oY
	w1vfA4QbLGxBo1P5WOL4IFHp0k3I2cAQDnl7R6oX6IDMPKZcabviohGp2y7XgvXwlo18N6kxuna
	YvSRtNwjR5A7tWV+XQ3YFjf9032w=
X-Gm-Gg: ASbGncu0Zir6fE75IIvY5gG3I57Z3+zyQ93/RYud+WCPON6HyP3Bs8LsDTxB5E/tEal
	I3IHN2N2BR7+4i3e+GNJ0anwKvUWrHDbejKBD3aw=
X-Google-Smtp-Source: AGHT+IHH5gTAOmFubOYjlrK+2+jdIvePBlyZPYVyBZBy90RljxEGCQgcvHQMo3bTypvAoytVk58QJl8i95oeqQUdh1w=
X-Received: by 2002:a05:690c:4e82:b0:6f0:21d6:4497 with SMTP id
 00721157ae682-6f3f80d911amr42730727b3.9.1734828744363; Sat, 21 Dec 2024
 16:52:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241221104304.2655909-1-guoweikang.kernel@gmail.com> <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 08:52:14 +0800
Message-ID: <CAOm6qn=aN_n3jRc79wr-AGVaQXCbZoyE0yXYcZfw28-uBv+zuQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/memblock: Add memblock_alloc_or_panic interface
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Geert Uytterhoeven <geert@linux-m68k.org> wrote on Saturday, 21
December 2024 at 22:10
>
> Hi Guo,
>
> On Sat, Dec 21, 2024 at 11:43=E2=80=AFAM Guo Weikang
> <guoweikang.kernel@gmail.com> wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immedi=
ate
> > panic is required. To simplify this behavior and reduce repetitive chec=
ks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavio=
r.
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
>
> Thanks for your patch!
>
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -417,6 +417,20 @@ static __always_inline void *memblock_alloc(phys_a=
ddr_t size, phys_addr_t align)
> >                                       MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_N=
O_NODE);
> >  }
> >
> > +static __always_inline void *__memblock_alloc_or_panic(phys_addr_t siz=
e,
> > +                                                      phys_addr_t alig=
n,
> > +                                                      const char *func=
)
> > +{
> > +       void *addr =3D memblock_alloc(size, align);
> > +
> > +       if (unlikely(!addr))
> > +               panic("%s: Failed to allocate %llu bytes\n", func, size=
);
> > +       return addr;
> > +}
>
> Please make this out-of-line, and move it to mm/memblock.c, so we have
> just a single copy in the final binary.
>
Got it, I'll make the change
> > +
> > +#define memblock_alloc_or_panic(size, align)    \
> > +        __memblock_alloc_or_panic(size, align, __func__)
> > +
> >  static inline void *memblock_alloc_raw(phys_addr_t size,
> >                                                phys_addr_t align)
> >  {
> > diff --git a/init/main.c b/init/main.c
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

Best regards
             Guo
