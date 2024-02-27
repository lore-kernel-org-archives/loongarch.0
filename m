Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF15A133419
	for <loongarch@lists.linux.dev>; Tue, 27 Feb 2024 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024121; cv=none; b=Is6sCKCL5bM9pYJGUc0XHWV88lrH+Bkku3In97spyNGceH0O2+F/Km4XRouNAQQX9/lEHuFEcFzXZytbuX3w+Yb9Ewg7lhMSrs5swVvfMXUP5/Zjbx6CYASeIUSrKcBI6I0zb6Dle21pyq30kN8+1mTA1zEiENtjV+QHYn//nuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024121; c=relaxed/simple;
	bh=w0gu9IMca9J/tT97UVi+QQlbmYRnY/qPlnzkCAmcRmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPQBleT3qZQRbB+gf75Gnv+D2Yw08Lpp7QoTzZ6X/4SFDN4COeTTOdahlMUROx1eXhR4JXsu2UDI9hKTLx3//Xd12Bml16zjToGbdkpwJlI7RDyGv5ptmuEYG/GPQCgjrZJVdtUZTEjMMnZDQwtGmbIfE0+df8aefHggX3+7vA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6da202aa138so2635461b3a.2
        for <loongarch@lists.linux.dev>; Tue, 27 Feb 2024 00:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709024118; x=1709628918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LF4kXg8LPe/h8pV/74EqYHGgPgOEfsUWLG6ibzoE1S0=;
        b=XqAnLrKS95+CIrIObizRnoIE+SgL+6rqz65D2CftKX2JztDSo29+1BYwQ3ZIV+O3EF
         U28544xQ2lvDIfs9Ne1afisJLOBX9oVr50mzR3okv9QnSdE3FVTl1eK4+MiNNqZU2M5n
         R33ccjo5UTdBP/DHzHFX82fNfoahVo3BmA5tdDe9gQ18HvjKaYtJ54z0P0lfk/X+voOu
         8K5YFYCNSDFuk/EVfcY2G3ks/Q6xqEEhiS+KTWHwhMGeecjfOZYQJc2plnTMtuZUKYWs
         aaVUveJGVPhmNQx+D2PvQVyWqs+0t9/WP7Z+hCTxnmlYm+sN4IDXpzEO8aFTrQRfyvBc
         nKRw==
X-Forwarded-Encrypted: i=1; AJvYcCXybM0xY8Skfv2l/yOAKCzosMmPYbN1asf1e8vRi3f5gvAcJb1NXNthtv4jwJLtW3Pvj3t4R/ZxvJykcpCVEaE19+t8w4HnAx+8
X-Gm-Message-State: AOJu0Yw4TxxBAPvtS0bU6o6K4MPVPqu12ABWIM6DZMMBipUNuseMHxAH
	bTICYy4WLi2mBEVqg0KC/aSCETb+7iEGbYCnYbPy2aTR9xhsYGlwm2WnN6MfjhAd8A==
X-Google-Smtp-Source: AGHT+IFFJN+kn8mjv1kvlqb2MIS22tneIH5s26Gvd7xrdq+NlKdwzRKnjF0T927YupmsRGlUpkZWvA==
X-Received: by 2002:a05:6a00:2284:b0:6e5:3cef:eadb with SMTP id f4-20020a056a00228400b006e53cefeadbmr3632809pfe.6.1709024118536;
        Tue, 27 Feb 2024 00:55:18 -0800 (PST)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com. [209.85.215.182])
        by smtp.gmail.com with ESMTPSA id w13-20020aa79a0d000000b006e02f4bb4e4sm5536382pfj.18.2024.02.27.00.55.18
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:55:18 -0800 (PST)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3426708a12.1
        for <loongarch@lists.linux.dev>; Tue, 27 Feb 2024 00:55:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvFjJ3KVqdseCjhYDlLnktDJagaSZ7J3B8YLSs8ZTYJrKCDdqnzblXwSFYxsEVGqEx8i2yDm3c73k92YvHxFOrWJyZHDIYC7UL
X-Received: by 2002:a25:71c3:0:b0:dcf:2b44:f38d with SMTP id
 m186-20020a2571c3000000b00dcf2b44f38dmr1589302ybc.49.1709024097788; Tue, 27
 Feb 2024 00:54:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-4-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-4-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:54:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
Message-ID: <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <keescook@chromium.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, Feb 26, 2024 at 5:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -84,12 +84,15 @@ config MMU
>
>  config MMU_MOTOROLA
>         bool
> +       select HAVE_PAGE_SIZE_4KB
>
>  config MMU_COLDFIRE
> +       select HAVE_PAGE_SIZE_8KB

I think you can do without this...

>         bool
>
>  config MMU_SUN3
>         bool
> +       select HAVE_PAGE_SIZE_8KB
>         depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
>
>  config ARCH_SUPPORTS_KEXEC
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 9dcf245c9cbf..c777a129768a 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -30,6 +30,7 @@ config COLDFIRE
>         select GENERIC_CSUM
>         select GPIOLIB
>         select HAVE_LEGACY_CLK
> +       select HAVE_PAGE_SIZE_8KB if !MMU

.... if you would drop the !MMU-dependency here.

>
>  endchoice
>
> @@ -45,6 +46,7 @@ config M68000
>         select GENERIC_CSUM
>         select CPU_NO_EFFICIENT_FFS
>         select HAVE_ARCH_HASH
> +       select HAVE_PAGE_SIZE_4KB

Perhaps replace this by

    config M68KCLASSIC
            bool "Classic M68K CPU family support"
            select HAVE_ARCH_PFN_VALID
  +         select HAVE_PAGE_SIZE_4KB if !MMU

so it covers all 680x0 CPUs without MMU?

>         select LEGACY_TIMER_TICK
>         help
>           The Freescale (was Motorola) 68000 CPU is the first generation =
of

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
