Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1244D1EE7D9
	for <loongarch@lists.linux.dev>; Sat, 21 Dec 2024 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734775196; cv=none; b=nTnHgHHD/L2RqK+2fXf28NGMDOwhetiKuED9ZP5ZlL8+Cu1atMWaRCFLncMgjCIVhQA4NBDp+fCAdZaMjIT2icUbjDsnpu3bl+x6bU5VjTpDe6+85P82zTNVbe9GYNOD/cy1dV4qg1sxicx+oVzxSSq7ucedITq0umFQxKi3BRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734775196; c=relaxed/simple;
	bh=UX21hNvTWNwf1sQ6BEmkIlxoXTRStqcI03IcAjwyENI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmrsn9CJd7WmwfKsytBI3jOBAcMLr3z8+Q8mCPKINypVWg/N/w8QKqQxHONpeyER23uupokonh/5Wyt9xLuQxz79WjZ6NQZWgcDrrQM12Th3u8qFEeneyLoaDGvlP6qhRSApXj+J9Btr1Nc7be0LH2j+f3IoWT7Q4KdS6h/Pduk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJP4xl71; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJP4xl71"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6efe5c1dea4so22131957b3.3
        for <loongarch@lists.linux.dev>; Sat, 21 Dec 2024 01:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734775194; x=1735379994; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egHprya5wIN6bGofZtv4dfpbBXKQe0iUzhyvNvr/kt4=;
        b=OJP4xl71O64e/ypd31iwH65RZRcW191iUtzrthQ4RQOTt45QcxwhL0yWPBd5oV0mjy
         v/eqm3duFJoyd9ENxFgVsiCuMxb56Wa09fT8hGAsr9UijvXAIogLy4Qbc2TW9PZgGUeG
         zP09L2MnU43ige+dIQX7owEjHRGo5zHh5wmO5pfFbyDZ/qb8PQcl66v1tWvENs7fo57X
         8uQyJydXLkwaUcdbROObUOH+WrFoxpwf1Eci9Q98VsT4k0NznDC7ZMu+F/7Ij9uznVNA
         buli9FfY8lJAQdNJBH+IoKxLzW4at/2Q8Upg1NEYq849LHxC5zJo5K1EWzT2VzyiStiK
         sajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734775194; x=1735379994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egHprya5wIN6bGofZtv4dfpbBXKQe0iUzhyvNvr/kt4=;
        b=mOHOCtQpRATjZoNsE1N/YeW8QJrTeXmC7n8UxL3r5Vz6wzESVIE0iy5I13nshy5YC6
         T83R4rg8pTgNBh+Kf4cr+ZWzY1wrhYW/4MkVywDkgWZ342MhFyBIfhcj2DZZgs+eTBFH
         S7forbwmIuOBidwyoA4qJxPOr0reO3QO+zrtFjXDomKYEonjyivSnifSc0mNB5LvQBwO
         99U/YUEtqTAXoxV/RtTAUsQ/XYLKHan/V4pRDD5dM7MnrX6PEeBTn6vfxo7iuyK4cuNE
         gl+Boi8tR3ycNcUYtbow/bV5EWRcBlZy1cb9qvxxotSC/lKPnqSueYOKkxMeaFMx2PFS
         y2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9pQv5DlLq9/SMlYx5nD6ETSZ7XNdQwy3AySTfrv8NIftCufL8QalgTEbPNmMgAIXw4l1ZTwifQac=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIHK/Sh9+57mJWXYiZ3r5i2LCoanMRZqFDii4jBU8UiL5mtIBN
	G8AzQ9fjjlT2CvRt3ykX8rHlp7aWY/q/C2o52E/k5BC3IqnfPwkECcpGlkodykZmlo4/NdibDgx
	BMez/L+zALis8kIxR8hCqHBz8wao=
X-Gm-Gg: ASbGncv7EfGQGNZ1HsFScr2gYEvMXbI79kUwjqrRZ9FlU1XJw/nKxK71SyS32QkkE/t
	Me9YAAGlFiyVquce4qnfaJ+doOZu2M2pjqSxNOeA=
X-Google-Smtp-Source: AGHT+IG9hgHXPNsbBNiOuY+6OAJ+D2q82bPj4v1OfjOz7h337kMTVjsW2qLUpiuBZXc33tZc49lNKi5hOGaIXzFbkh0=
X-Received: by 2002:a05:690c:4b13:b0:6ef:7036:3b25 with SMTP id
 00721157ae682-6f3f8216b3cmr49229327b3.31.1734775193934; Sat, 21 Dec 2024
 01:59:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241220092638.2611414-1-guoweikang.kernel@gmail.com> <20241220150623.278e8fa9f073b66dc81edfe6@linux-foundation.org>
In-Reply-To: <20241220150623.278e8fa9f073b66dc81edfe6@linux-foundation.org>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sat, 21 Dec 2024 17:59:43 +0800
Message-ID: <CAOm6qnnFDjyiQvUmyVA4iq5aJAO8NC=wcAvpKscvfRZKPnzkYw@mail.gmail.com>
Subject: Re: [PATCH] mm/memblock: Add memblock_alloc_or_panic interface
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>, rafael.j.wysocki@intel.com, 
	Palmer Dabbelt <palmer@rivosinc.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Johannes Berg <johannes.berg@intel.com>, 
	Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Christian Brauner <brauner@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Jonas Bonn <jonas@southpole.se>, 
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
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Len Brown <lenb@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Tero Kristo <kristo@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Pavel Machek <pavel@ucw.cz>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Marco Elver <elver@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	kasan-dev@googlegroups.com, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-omap@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Morton <akpm@linux-foundation.org> wrote on Saturday, 21
December 2024 07:06:
>
> On Fri, 20 Dec 2024 17:26:38 +0800 Guo Weikang <guoweikang.kernel@gmail.c=
om> wrote:
>
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
>
> Seems nice.
>
> > ...
> >
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -417,6 +417,19 @@ static __always_inline void *memblock_alloc(phys_a=
ddr_t size, phys_addr_t align)
> >                                     MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_=
NODE);
> >  }
> >
> > +static __always_inline void *memblock_alloc_or_panic(phys_addr_t size,=
 phys_addr_t align)
>
> We lost the printing of the function name, but it's easy to retain with
> something like
>
> #define memblock_alloc_or_panic(size, align)    \
>                 __memblock_alloc_or_panic(size, align, __func__)
>
You're absolutely right, this was an oversight on my part. I=E2=80=99ll mak=
e
sure to update it with the correct function name.
> > +{
> > +     void *addr =3D memblock_alloc(size, align);
> > +
> > +     if (unlikely(!addr))
> > +#ifdef CONFIG_PHYS_ADDR_T_64BIT
> > +             panic("%s: Failed to allocate %llu bytes\n", __func__, si=
ze);
>
> Won't this always print "memblock_alloc_or_panic: Failed ..."?  Not
> very useful.
>
As mentioned above.
> > +#else
> > +             panic("%s: Failed to allocate %u bytes\n", __func__, size=
);
> > +#endif
>
> We can avoid the ifdef with printk's "%pap"?
>
I appreciate you pointing this out. I wasn=E2=80=99t aware of this approach=
,
but it=E2=80=99s a great idea. It definitely simplifies things, and I=E2=80=
=99ve
learned something new in the process. I'll incorporate this into the
code.
> > +     return addr;
> > +}
>
