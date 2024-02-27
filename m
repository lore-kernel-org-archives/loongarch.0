Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85F1386AD
	for <loongarch@lists.linux.dev>; Tue, 27 Feb 2024 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709032381; cv=none; b=LqE6uJJPSwo5Y26vndhgZ32sAU65BwMfPid9rgYeqO3Xfl1bPd2Qt/aGavVoKHxFIVrGZ1WrQhGeOI3W/w+05uoaEin8i+e+3Gf+8jGcMb164dxk+MbKEPqLDHYGJzL0UnsUMy5zTsER+aQMHCzmhL/Hza1Sud1n4YwVQN2NibU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709032381; c=relaxed/simple;
	bh=O6UtDTaDn834cQ2sd7oFrdw4KjK6pBp4PggykizhEd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgtuVSDpFMwulT1XcorvYH854BvuGovdQt7jmQl2OiLf0EvgMo3GPsCsJRVnH3loM97XDwlyVwiChyNT6L56JbvKMtyC3tO8fd+Rs3G3DnDQh8r4QzHzOsonNvqdTpMVDOesZz4fg/gX0ceM6oCgrTxggf9IwYLGDcoibZd88Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bbb4806f67so3099615b6e.3
        for <loongarch@lists.linux.dev>; Tue, 27 Feb 2024 03:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032378; x=1709637178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4Tv6sdcFEpWvZL/hYJEF+Ju7qt4AFqMkWFUs5NrLKU=;
        b=VRuhkAUcApOKLusxF22e8hb5AL/UbmcMDwGVtxkA2LYwT0EEbzE9aoLoE+THGKl4iT
         RXOM5rlxUgq9/24wAgdVjLyLqcCogBjX3fKl4YTRbLRj56nam59leWlQgn2JsGZgdtsM
         VcjHUUmf1MXlrBVoJh2s+XBPzc31NQhmirpyjkXW+qFThrtjVIMy49Zb2o3uSGhad2gR
         iONbSDSFo6fsvXpnbkJ59fEl35z3qO/RPXuso+adX5ZLt8FCGKmQYc0yFjKxnZf11qNJ
         1DrTLIrWW+WAKGr+AybF0M9Y++Z+mL7G5u4WhK4wmxS4AbB56jGpZ04vKWAMFz90CfC9
         mR5w==
X-Forwarded-Encrypted: i=1; AJvYcCW5TsH2cu57DP05/rb1JXwmVQTbIibD8Wi/iMMEWLOqZt3VZZANLYA4D5rW4Gs0gXKu/ECe21AwMDxQlKF0Wzp+WvfasuucrZg4
X-Gm-Message-State: AOJu0YwphmZ4aD3jwkRufreDBnI1/nPGc2Y1Vkfs7ibCm6wy2D8O41pW
	muW+ZMAC4fg9dFwSoF5rVT5hhw9MtxdFTm9E725nycGYE5BF+hXwRJ1Qr22sq6mXww==
X-Google-Smtp-Source: AGHT+IFPNpNqeImWLwtp9+5uukHBU42OMrlowsAeB1A4AsrRkEj7xckTsYX2liaqVxeoFX4HOh79Kw==
X-Received: by 2002:a05:6870:63a6:b0:21e:b5e1:ac3d with SMTP id t38-20020a05687063a600b0021eb5e1ac3dmr11016438oap.52.1709032378550;
        Tue, 27 Feb 2024 03:12:58 -0800 (PST)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id b23-20020a056830105700b006e49669e1f1sm1126773otp.10.2024.02.27.03.12.58
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 03:12:58 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5a03933eb55so1774944eaf.1
        for <loongarch@lists.linux.dev>; Tue, 27 Feb 2024 03:12:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4pyzwDcDBn8ajZKRTBf16Jid+ZnB9altg39lTH0EbyFMwFudWE8jh4y5xNE6AlkGjpNGypiBAxlmqRZE9okQOM9zKs7AWqYjV
X-Received: by 2002:a5b:ecc:0:b0:dc6:c32f:6126 with SMTP id
 a12-20020a5b0ecc000000b00dc6c32f6126mr1607871ybs.22.1709032357452; Tue, 27
 Feb 2024 03:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-4-arnd@kernel.org>
 <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com> <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
In-Reply-To: <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 12:12:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Message-ID: <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <keescook@chromium.org>, 
	Anna-Maria Gleixner <anna-maria@linutronix.de>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, guoren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

CC Greg

On Tue, Feb 27, 2024 at 11:59=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Tue, Feb 27, 2024, at 09:54, Geert Uytterhoeven wrote:
> >> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> >> index 9dcf245c9cbf..c777a129768a 100644
> >> --- a/arch/m68k/Kconfig.cpu
> >> +++ b/arch/m68k/Kconfig.cpu
> >> @@ -30,6 +30,7 @@ config COLDFIRE
> >>         select GENERIC_CSUM
> >>         select GPIOLIB
> >>         select HAVE_LEGACY_CLK
> >> +       select HAVE_PAGE_SIZE_8KB if !MMU
> >
> > .... if you would drop the !MMU-dependency here.
> >
> >>
> >>  endchoice
> >>
> >> @@ -45,6 +46,7 @@ config M68000
> >>         select GENERIC_CSUM
> >>         select CPU_NO_EFFICIENT_FFS
> >>         select HAVE_ARCH_HASH
> >> +       select HAVE_PAGE_SIZE_4KB
> >
> > Perhaps replace this by
> >
> >     config M68KCLASSIC
> >             bool "Classic M68K CPU family support"
> >             select HAVE_ARCH_PFN_VALID
> >   +         select HAVE_PAGE_SIZE_4KB if !MMU
> >
> > so it covers all 680x0 CPUs without MMU?
>
> I was a bit unsure about how to best do this since there
> is not really a need for a fixed page size on nommu kernels,
> whereas the three MMU configs clearly tie the page size to
> the MMU rather than the platform.
>
> There should be no reason for coldfire to have a different
> page size from dragonball if neither of them actually uses
> hardware pages, so one of them could be changed later.

Indeed, in theory, PAGE_SIZE doesn't matter for nommu, but the concept
of pages is used all over the place in Linux.

I'm mostly worried about some Coldfire code relying on the actual value
of PAGE_SIZE in some other context. e.g. for configuring non-cacheable
regions.

And does this impact running nommu binaries on a system with MMU?
I.e. if nommu binaries were built with a 4 KiB PAGE_SIZE, do they
still run on MMU systems with an 8 KiB PAGE_SIZE (coldfire and sun3),
or are there some subtleties to take into account?

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
