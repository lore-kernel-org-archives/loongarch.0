Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596B8610D
	for <loongarch@lists.linux.dev>; Wed,  8 Nov 2023 21:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1f04c5ed8d7so58357fac.1
        for <loongarch@lists.linux.dev>; Wed, 08 Nov 2023 13:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699477838; x=1700082638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bav5/FGayyEQonBNC4kdS6ICDtnFE4p01QngumR4dg4=;
        b=E5rCi3w1LgEIO/FWWGyrDAXsXTYSfjGrAD5Igo+JjD3llxreiMKoK/0GoiMOGFvmya
         InGGkC7TD0NYSWTSE1oUQQdVuQAo97UpF9JHTgcqUSzxibR2QzS4+30+oeQM/aiGw5vR
         GBI+QK7ioWzsUDbBcC+7hvff1ZMnGXdp/jYlfYV2q5wd+UPSB8N8p9TczigcIArZY7LQ
         GAJcoSDZ+0nsWKkjiDbxmX17fqlnTucv8B94Vase7jszXI7gzqeurJybSxHRVzw/dwjM
         lPe+Ej9h4atdAnuT30KbThgO6mpqpfWseqCSh83QtHw9uHBiU4y9Mg0q3yf36LShboqh
         R2cw==
X-Gm-Message-State: AOJu0YwGBYKRLOAxIrnQ3hwIjWGkLCKLXp47CF+l7kXV4RiBFPhupB9Q
	4AxdpzVnQq5BTuAnQQw/JLlPelFUDsZeiw==
X-Google-Smtp-Source: AGHT+IGodKn1dj7cAz/Y1fU6a+EyBcpA3VMvqFvA4dNXWxxV4tHngwbEJKQ5jCmSA+dzKeMzOZDl/g==
X-Received: by 2002:a05:6871:14e:b0:1ef:bd6e:f4c6 with SMTP id z14-20020a056871014e00b001efbd6ef4c6mr3872550oab.41.1699477837812;
        Wed, 08 Nov 2023 13:10:37 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id t26-20020a05683022fa00b006ce2fce83cbsm2027966otc.25.2023.11.08.13.10.37
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 13:10:37 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b2ea7cc821so83286b6e.1
        for <loongarch@lists.linux.dev>; Wed, 08 Nov 2023 13:10:37 -0800 (PST)
X-Received: by 2002:a0d:f3c2:0:b0:59b:54b5:7d66 with SMTP id
 c185-20020a0df3c2000000b0059b54b57d66mr2960037ywf.34.1699477816210; Wed, 08
 Nov 2023 13:10:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-11-arnd@kernel.org>
 <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com> <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
In-Reply-To: <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Nov 2023 22:10:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7VfiSA9+wSJYYQkBN2=4E9HsFJRV6j8ffioe0=MFd8A@mail.gmail.com>
Message-ID: <CAMuHMdV7VfiSA9+wSJYYQkBN2=4E9HsFJRV6j8ffioe0=MFd8A@mail.gmail.com>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init() prototype
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, guoren <guoren@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Geoff Levand <geoff@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Heiko Carstens <hca@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	x86@kernel.org, Helge Deller <deller@gmx.de>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Timur Tabi <timur@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, David Woodhouse <dwmw2@infradead.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Kees Cook <keescook@chromium.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-parisc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Nov 8, 2023 at 10:07=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Wed, Nov 8, 2023, at 21:42, Geert Uytterhoeven wrote:
> > On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> Microblaze runs into a single -Wmissing-prototypes warning when that i=
s
> >> enabled:
> >>
> >> arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype fo=
r 'trap_init' [-Wmissing-prototypes]
> >>
> >> Include the right header to avoid this.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Thanks for your patch!
> >
> >>  arch/alpha/kernel/traps.c      | 1 +
> >>  arch/csky/include/asm/traps.h  | 2 --
> >>  arch/csky/kernel/traps.c       | 1 +
> >>  arch/m68k/coldfire/vectors.c   | 3 +--
> >>  arch/m68k/coldfire/vectors.h   | 3 ---
> >
> > Ah, so this is where the m68k changes listed in the cover letter are
> > hiding ;-)
> >
> >>  arch/microblaze/kernel/traps.c | 1 +
> >>  arch/sparc/kernel/traps_32.c   | 1 +
> >>  arch/sparc/kernel/traps_64.c   | 1 +
> >>  arch/x86/include/asm/traps.h   | 1 -
> >>  arch/x86/kernel/traps.c        | 1 +
> >>  10 files changed, 7 insertions(+), 8 deletions(-)
> >>  delete mode 100644 arch/m68k/coldfire/vectors.h
> >
> > Obviously the non-microblaze changes should be spun off in separate
> > patches.
>
> I messed up one of my rebases here and accidentally sent
> the wrong changelog text. My intention was to have the
> combined patch but with this text:
>
>     arch: include linux/cpu.h for trap_init() prototype
>
>     some architectures run into a -Wmissing-prototypes warning
>     for trap_init()
>
>     arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype f=
or 'trap_init' [-Wmissing-prototypes]
>
>     Include the right header to avoid this consistently, removing
>     the extra declarations on m68k and x86 that were added as local
>     workarounds already.
>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>

That makes sense, although it's hard to combine this with "my preference
would be for the patches to make it through the respective subsystem
maintainer trees"...

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
