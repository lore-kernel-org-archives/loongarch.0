Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DC53EA73
	for <loongarch@lists.linux.dev>; Wed, 10 Jan 2024 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7831386ee01so376240585a.3
        for <loongarch@lists.linux.dev>; Wed, 10 Jan 2024 01:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704877436; x=1705482236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2Qk0JS/X/M+iSFJkteLpcJbyzGhmpZqpSZNg5QY+TE=;
        b=DxY6nGHABtghv27gCx4MXa40u2N9aO621yksGvIT/yGtm2PXxg23+G5f335NyGUiKZ
         iYK1EDw9MAQDcW9TB5DV8G91eKyYuh2BX2EsBu4mmQgDkdlwh4yUM+faujkxrFJYQ0uW
         ZtbtHe0TzU23RGRi7hZFxKfjH7Hw3QHHujajim3vihlfZLrGx2dKmg2NKDGSoGqvAJoy
         8qRY8+180HLd3f6gGmL9yfmF2L4joL1XkmYxv+hjpdC9d7mcSv7zd2oE+0j6L7EnF+b9
         fragTxETKuAQCv1Cmzzbqrdkb3WsSWQBt0oWcl8o5ip+D3ZEJjfgdGRuSpYw6BXf3ROe
         oYTQ==
X-Gm-Message-State: AOJu0Yxr9Qf7KatjuB8PwOCvMYugLQKrwec11ZbrXcry5V/3C2WtgOgy
	/CughJWBWJ70kEM9oZpZ3mlC/gudk1R7+WkY
X-Google-Smtp-Source: AGHT+IE1vM8DHcWCapie4sH1UH+VwoUim1sSLQnt9EXsrarfOYERdOYhvxRCGECAbwa29WPoECwaSg==
X-Received: by 2002:a05:620a:cf1:b0:783:2a90:ea9a with SMTP id c17-20020a05620a0cf100b007832a90ea9amr673903qkj.72.1704877435739;
        Wed, 10 Jan 2024 01:03:55 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id b2-20020a05620a0cc200b00783248928a3sm1451880qkj.87.2024.01.10.01.03.54
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 01:03:55 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-680b12e5d42so26342126d6.3
        for <loongarch@lists.linux.dev>; Wed, 10 Jan 2024 01:03:54 -0800 (PST)
X-Received: by 2002:a81:9843:0:b0:5fa:7e0a:b133 with SMTP id
 p64-20020a819843000000b005fa7e0ab133mr127729ywg.79.1704877413506; Wed, 10 Jan
 2024 01:03:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-9-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-9-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jan 2024 10:03:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
Message-ID: <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
Subject: Re: [PATCH 08/22] [v2] arch: consolidate arch_irq_work_raise prototypes
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
	linux-bcachefs@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Alexander Gordeev <agordeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The prototype was hidden in an #ifdef on x86, which causes a warning:
>
> kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_work_=
raise' [-Werror=3Dmissing-prototypes]

This issue is now present upstream.

> Some architectures have a working prototype, while others don't.
> Fix this by providing it in only one place that is always visible.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
