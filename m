Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5D532C6E
	for <loongarch@lists.linux.dev>; Wed,  8 Nov 2023 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6d2efe8c43eso596628a34.0
        for <loongarch@lists.linux.dev>; Wed, 08 Nov 2023 12:42:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699476173; x=1700080973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYbfzdavLbBO2X96qC9Jj/xBig9KkpEQ+EQytSx8qtw=;
        b=rdjzFjrTgTRE5g5gkptJld7DvYUd5X1Lis9qFDNKlLf3Jx83itEtxUOUdl+MXpAwHq
         EeAadu7uNR35G3rmDLsX1hFXCHDACumnucJlgJhRZ0JPvAyDNI1uPppgesqKUS//D+RA
         J1O7clRo5O69fX/kX45Q3KTnrTeC4SacpHpLH08peLvjM4wQgCfA+giNDdXOS1IBTXYU
         jS2FOw/0t9dnAptKUXHfhk5Risia3+U1TaRPNtDL9wcuiqfPEhpIA+6sYaGiRzGayq+n
         OOjBDXptyYSq5zr5Tdql9wCvXKurES0GeGyAeAqjl1y/0BdPagfHP1psJL2AFJNHZQk/
         BCvg==
X-Gm-Message-State: AOJu0YyF8LrIp/IL3nRYxUOsxhpoJLJfiTshIvoje39LwI+K5w72ZQm+
	1U27SMJs56mXrxp3xACIYWV9fGylDI+mqw==
X-Google-Smtp-Source: AGHT+IHz6oeYqZmt7GjWZyD/T67v0neshRn6A6oDX2NiQDTvWiJaZPoUOPQwIrIUK0s5iKVoSpDNdg==
X-Received: by 2002:a9d:4c8a:0:b0:6cd:a9e:689f with SMTP id m10-20020a9d4c8a000000b006cd0a9e689fmr3617876otf.10.1699476173365;
        Wed, 08 Nov 2023 12:42:53 -0800 (PST)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id z26-20020a05683020da00b006c61c098d38sm1973627otq.21.2023.11.08.12.42.52
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 12:42:52 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d2efe8c43eso596612a34.0
        for <loongarch@lists.linux.dev>; Wed, 08 Nov 2023 12:42:52 -0800 (PST)
X-Received: by 2002:a81:4756:0:b0:59f:699b:c3b3 with SMTP id
 u83-20020a814756000000b0059f699bc3b3mr5987326ywa.0.1699476150732; Wed, 08 Nov
 2023 12:42:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-11-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-11-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Nov 2023 21:42:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Message-ID: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init() prototype
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Geoff Levand <geoff@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Heiko Carstens <hca@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
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
	Al Viro <viro@zeniv.linux.org.uk>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, netdev@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-bcachefs@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Microblaze runs into a single -Wmissing-prototypes warning when that is
> enabled:
>
> arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype for '=
trap_init' [-Wmissing-prototypes]
>
> Include the right header to avoid this.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

>  arch/alpha/kernel/traps.c      | 1 +
>  arch/csky/include/asm/traps.h  | 2 --
>  arch/csky/kernel/traps.c       | 1 +
>  arch/m68k/coldfire/vectors.c   | 3 +--
>  arch/m68k/coldfire/vectors.h   | 3 ---

Ah, so this is where the m68k changes listed in the cover letter are
hiding ;-)

>  arch/microblaze/kernel/traps.c | 1 +
>  arch/sparc/kernel/traps_32.c   | 1 +
>  arch/sparc/kernel/traps_64.c   | 1 +
>  arch/x86/include/asm/traps.h   | 1 -
>  arch/x86/kernel/traps.c        | 1 +
>  10 files changed, 7 insertions(+), 8 deletions(-)
>  delete mode 100644 arch/m68k/coldfire/vectors.h

Obviously the non-microblaze changes should be spun off in separate
patches.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
