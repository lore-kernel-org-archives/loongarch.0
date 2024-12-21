Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657B2E64A
	for <loongarch@lists.linux.dev>; Sat, 21 Dec 2024 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734790264; cv=none; b=jZ/jofWii533oFcLO9WoTXv3CKwHkmma1AjKLBmBSUEQ9Go14wXcbxJlQEDN1o5KQbZQbBmTOU4n7ZiuZamZkuOw18l0Yi1K3TLTnax19eKS4NVbVGFb9uWs58U9iGb8LJjK21Jc6mYhI7Bn/ofLQu+c82gJbQkUX6pKQ3A7X6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734790264; c=relaxed/simple;
	bh=nGWeQg8S6y6shLHbmW3aMKeXpkYiYJxrmAinLDsKRyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hX6jKdHMQu40xJfeeOt2XMEqN7uP8IWyohJl4Y/igY67Rs+9IN6kxzi838QO5otFQJrLMdChODNGaOVMbnLAcuEDBBcCj9IAlP/CLA9tfqf81EVyER27BzCNhKgfw1cWsFNT6cxgXKUNSW+5Wc3bZunT0yOaTVHBBMwiYCPyGng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f2d8f62290so1344396eaf.2
        for <loongarch@lists.linux.dev>; Sat, 21 Dec 2024 06:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734790262; x=1735395062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpBog1LJdntPo57cyHdGkHydPz04prdcJbkki5MzpWU=;
        b=riz7W4VRp3psFiMOwiDCNEG0eCwhxix3zp0misnW92e/VS2vvgKiMHkKkdEpgggJaW
         j4kfJtXr5PWXUU8VJ0CUDCzF3VSQuayuoBc10nmtYKYIDiQc75DDHj0QefRuyBVcgZAM
         zY0965Gm1QGE7GGW4myEQ/xEh6jDctvShzJoc2CeRfDNeQIEnJTzzONQZ/CKYwjWDdhy
         mzjTRcCDibgMFPZy/pa2uIR54ezgv+duVPWkDl6M5k8pMpFY6tdENeJSqM3hLHBFdR/q
         L2H17bTV+IXuEhU5+A2IsUJUdjpk70JxYjDt3QrztyyOorCO3k5uPTLFKhPj0/d9BTMK
         loRg==
X-Forwarded-Encrypted: i=1; AJvYcCW470v5igkCYRx+/0lhvZVzeiNtSQYUbTAzNaS6keT27cH9Yz7VPpbfn3ErQ3dQwrUEymVxRtgybHA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxiujc1rA+chyLp+EVOe7Ui6d5pcPe9+5MryFjk9UuRkZnBi80P
	+V5Q8bP9AZN7K61752UMIDTw9qb9Mr7K0zAsmO4ZBvAmfZJeruc0p3YGHim1
X-Gm-Gg: ASbGncunkPnAlV99YpGL+DAEdRedTvCnLvB94YvzfZRK5vUF/O9NJPAL2j9rqiWFmgl
	Erj4nmyuMDnIFdsNzNha/0ivAxBXgSYQ9F/rC3XgKwtaTCkkybuAg+w8Sost0f4HeTJc5kbIe93
	dbhs6xbT0TwqXJ7jJBXE8ZqBv+hgqjgs9dAgFqCfvESMWHXqfgafFxI0LjYM5USxovlY/t8qbjp
	nOwIKi2hYuhgedNAmXvZCz333R3bqVKwKaJTcKAVxdwCHyXW/riGJM9XtQZVsHcb1B+6AsB8s8v
	vL56MpbRQiubNpqc2yOS+6s=
X-Google-Smtp-Source: AGHT+IGrZmEvidkf+izh1HlH7Xc8HG5DUG/1RAFzHe/JFsmsvqVxd1If4GPuU8YlfGxh84BwbHFPFg==
X-Received: by 2002:a05:6820:1f02:b0:5f2:c5e0:452f with SMTP id 006d021491bc7-5f62e775adamr4020696eaf.7.1734790261939;
        Sat, 21 Dec 2024 06:11:01 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f4db74ec16sm1211227eaf.34.2024.12.21.06.11.01
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 06:11:01 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3eb9101419cso1522093b6e.0
        for <loongarch@lists.linux.dev>; Sat, 21 Dec 2024 06:11:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeaVPyGK03u9MJ9JKfPl739Kj1RiXlSQWHz5IzVKPyMuTZ6CEMqCHwBb+rQKKWgSiPP/p0oeIROro=@lists.linux.dev
X-Received: by 2002:a05:6102:cc8:b0:4af:ef85:dae4 with SMTP id
 ada2fe7eead31-4b2cc313a2cmr7064126137.5.1734789822327; Sat, 21 Dec 2024
 06:03:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
In-Reply-To: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 21 Dec 2024 15:03:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/memblock: Add memblock_alloc_or_panic interface
To: Guo Weikang <guoweikang.kernel@gmail.com>
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

Hi Guo,

On Sat, Dec 21, 2024 at 11:43=E2=80=AFAM Guo Weikang
<guoweikang.kernel@gmail.com> wrote:
> Before SLUB initialization, various subsystems used memblock_alloc to
> allocate memory. In most cases, when memory allocation fails, an immediat=
e
> panic is required. To simplify this behavior and reduce repetitive checks=
,
> introduce `memblock_alloc_or_panic`. This function ensures that memory
> allocation failures result in a panic automatically, improving code
> readability and consistency across subsystems that require this behavior.
>
> Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>

Thanks for your patch!

> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -417,6 +417,20 @@ static __always_inline void *memblock_alloc(phys_add=
r_t size, phys_addr_t align)
>                                       MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_=
NODE);
>  }
>
> +static __always_inline void *__memblock_alloc_or_panic(phys_addr_t size,
> +                                                      phys_addr_t align,
> +                                                      const char *func)
> +{
> +       void *addr =3D memblock_alloc(size, align);
> +
> +       if (unlikely(!addr))
> +               panic("%s: Failed to allocate %llu bytes\n", func, size);
> +       return addr;
> +}

Please make this out-of-line, and move it to mm/memblock.c, so we have
just a single copy in the final binary.

> +
> +#define memblock_alloc_or_panic(size, align)    \
> +        __memblock_alloc_or_panic(size, align, __func__)
> +
>  static inline void *memblock_alloc_raw(phys_addr_t size,
>                                                phys_addr_t align)
>  {
> diff --git a/init/main.c b/init/main.c

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
