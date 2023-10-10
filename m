Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0798171DB
	for <loongarch@lists.linux.dev>; Tue, 10 Oct 2023 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7a2a9e5451bso214814039f.1
        for <loongarch@lists.linux.dev>; Tue, 10 Oct 2023 03:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696933605; x=1697538405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbmON3xp7LlIs9AFrDaNfaYi2KFfIcOVngy3VzyA1Hk=;
        b=FXW/G9/NFAiFVK+2DNa6StJvwrBg7LKUJavl3kj+i6bX89oRhFZmShF3ffXbjMhbYW
         VM8ytlFHcUydrnPIfSmYjP9Pr8sSaRlmgLXV3QGM2cXkOpX+Up4Zi9ZUUeA0jqUtTngx
         vxVf95U5ZLn/3iKh6qzyGj6EJv2/BzJY4kIhsJGGhOtgkH8w53Z+qPYAM5ItgM3ZDKw/
         5hGRKh6iOOp11PXMErVNc3UJuCJr/k+zV+kyIrEJEXIFULKPCTkFUWkrsJERib70QcoQ
         uLWIF295LWifr7fw/u+9mOLy61+U5AfgA7UXatxR+QO0pOxLssmXSk6Ts97QwdN1EucH
         dHYA==
X-Gm-Message-State: AOJu0YwuN50sHzn4/jYydFKYK8zJG1iLMI9K3o/wt6WI32A6qfeH82+v
	a9UOl1SLr62SqTKHMFpgIcrRunEZ268UAA==
X-Google-Smtp-Source: AGHT+IG/g4d3bBYysve9FgMbz9oUxJh1rpGWCnuMyjHqdjZUQPt6nXByBHP+I0TdX4zF9iDIQPXgAg==
X-Received: by 2002:a5e:a813:0:b0:787:4b5f:b6cf with SMTP id c19-20020a5ea813000000b007874b5fb6cfmr18871582ioa.5.1696933605576;
        Tue, 10 Oct 2023 03:26:45 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id x6-20020a6bfe06000000b00791e6ae3aa4sm2894810ioh.23.2023.10.10.03.26.45
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 03:26:45 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7a2a9e5451bso214813639f.1
        for <loongarch@lists.linux.dev>; Tue, 10 Oct 2023 03:26:45 -0700 (PDT)
X-Received: by 2002:a81:8647:0:b0:595:89b0:6b56 with SMTP id
 w68-20020a818647000000b0059589b06b56mr20014839ywf.28.1696933584327; Tue, 10
 Oct 2023 03:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009211845.3136536-1-arnd@kernel.org> <20231009211845.3136536-2-arnd@kernel.org>
In-Reply-To: <20231009211845.3136536-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Oct 2023 12:26:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6MFLCOe4BSWr5oVC4JcLpBS+2PvQsoSEWMLRAFpvaGA@mail.gmail.com>
Message-ID: <CAMuHMdU6MFLCOe4BSWr5oVC4JcLpBS+2PvQsoSEWMLRAFpvaGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] vgacon: rework Kconfig dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>, 
	"David S. Miller" <davem@davemloft.net>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Deepak Rawat <drawat.floss@gmail.com>, 
	Dexuan Cui <decui@microsoft.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>, 
	Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, Oct 9, 2023 at 11:19=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The list of dependencies here is phrased as an opt-out, but this is missi=
ng
> a lot of architectures that don't actually support VGA consoles, and some
> of the entries are stale:
>
>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>    the merged arch/powerpc never did
>
>  - arm lists footbridge, integrator and netwinder, but netwinder is actua=
lly
>    part of footbridge, and integrator does not appear to have an actual
>    VGA hardware, or list it in its ATAG or DT.
>
>  - mips has a few platforms (malta, sibyte, and sni) that initialize
>    screen_info, on everything else the console is selected but cannot
>    actually work.
>
>  - csky, hexgagon, loongarch, nios2, riscv and xtensa are not listed
>    in the opt-out table and declare a screen_info to allow building
>    vga_con, but this cannot work because the console is never selected.
>
> Replace this with an opt-in table that lists only the platforms that
> remain. This is effectively x86, plus a couple of historic workstation
> and server machines that reused parts of the x86 system architecture.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Khalid Aziz <khalid@gonehiking.org>
> Acked-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

A few suggestions for simplification below...

> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -7,9 +7,9 @@ menu "Console display driver support"
>
>  config VGA_CONSOLE
>         bool "VGA text console" if EXPERT || !X86
> -       depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SU=
PERH && \
> -               (!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWI=
NDER) && \
> -               !ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !U=
ML
> +       depends on ALPHA || IA64 || X86 || \
> +               (ARM && ARCH_FOOTBRIDGE) || \

You can drop "ARM &&", as it is implied by ARCH_FOOTBRIDGE.

> +               (MIPS && (MIPS_MALTA || SIBYTE_BCM112X || SIBYTE_SB1250 |=
| SIBYTE_BCM1x80 || SNI_RM))

Likewise for "MIPS &&".

The 3 SIBYTE dependencies can be replaced by SIBYTE_SB1xxx_SOC.

>         select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
>         default y
>         help

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
