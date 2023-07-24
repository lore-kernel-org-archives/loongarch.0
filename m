Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC80569E
	for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 12:07:59 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6b9ed0831bcso3278562a34.0
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 05:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690200478; x=1690805278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nNGOJzgymf6gQYpdxd2UIkw90HSJ+oAIVzOwuAShWk=;
        b=NEqNdUZWlL0Lu29K6gG4M+BY6c9LNMkTkDzRv8UAGIjyJcHuipKqp5oYNq94bmxIV3
         Og1lVhfe4XIRhyMKUAB1YahJk8leHGb+VEFR6+Csxmybno6z9daTjqe7FzYy56/vU0LN
         6wsqRGCcT6lncz0Qkyyf74vxXs1X+uZBlf4CLzFM3QiYo/OxeCGVrrmyaw9H0IaAV+Nm
         bO9rsJ8DMHp86zqh+93XSET7Ld21qjSoddPhGWkJba7OQS6xs8D3OD3d9CDtc5rWwdkG
         UEYuM65BAyWfjfNdDUA/LH4Qi2WQxjAe5zdOKmX04bKSpyHeEKx0xG1UOvzseTBUNwwL
         KXAw==
X-Gm-Message-State: ABy/qLawKHxiKTkYELfXr+wDVwSTb92f+GoZHUOehKd2iy8tfU3RnXjk
	u4hnmdBW1JAxv5/TJm9ZHrqbeit6u5vX6g==
X-Google-Smtp-Source: APBJJlHiz8IqzMGlcbhNTg6Npsm5R2/mHryT+tM4hiAwDnPMQoCEpUtTPMXKUNCxN/wsZkp0XItyrA==
X-Received: by 2002:a05:6830:1bd5:b0:6b9:5153:7cd7 with SMTP id v21-20020a0568301bd500b006b951537cd7mr7911789ota.20.1690200478224;
        Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id v7-20020a05683011c700b006b1570a7674sm3878587otq.29.2023.07.24.05.07.57
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6b9b89627c3so3267785a34.1
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 05:07:57 -0700 (PDT)
X-Received: by 2002:a25:238e:0:b0:d05:abaf:9933 with SMTP id
 j136-20020a25238e000000b00d05abaf9933mr7019302ybj.36.1690200457350; Mon, 24
 Jul 2023 05:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719123944.3438363-1-arnd@kernel.org> <20230719123944.3438363-2-arnd@kernel.org>
 <87pm4lj1w3.fsf@mail.lhotse> <19631e74-415e-4dcb-b79d-33dcf03d2dfc@app.fastmail.com>
In-Reply-To: <19631e74-415e-4dcb-b79d-33dcf03d2dfc@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jul 2023 14:07:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVszR+oZi8x8L0iXx=ydTiaNUZxToBSdf=2ZH5t85+D_Q@mail.gmail.com>
Message-ID: <CAMuHMdVszR+oZi8x8L0iXx=ydTiaNUZxToBSdf=2ZH5t85+D_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] vgacon: rework Kconfig dependencies
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, 
	Javier Martinez Canillas <javierm@redhat.com>, "David S . Miller" <davem@davemloft.net>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Brian Cain <bcain@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Daniel Vetter <daniel@ffwll.ch>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
	Deepak Rawat <drawat.floss@gmail.com>, Dexuan Cui <decui@microsoft.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	guoren <guoren@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	x86@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Fri, Jul 21, 2023 at 10:29=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Fri, Jul 21, 2023, at 06:59, Michael Ellerman wrote:
> > Arnd Bergmann <arnd@kernel.org> writes:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> The list of dependencies here is phrased as an opt-out, but this is mi=
ssing
> >> a lot of architectures that don't actually support VGA consoles, and s=
ome
> >> of the entries are stale:
> >>
> >>  - powerpc used to support VGA consoles in the old arch/ppc codebase, =
but
> >>    the merged arch/powerpc never did
> >
> > Not disputing this, but how did you come to that conclusion? I grepped
> > around and couldn't convince myself whether it can work on powerpc or
> > not. ie. currently it's possible to enable CONFIG_VGA_CONSOLE and
> > powerpc does have a struct screen_info defined which seems like it woul=
d
> > allow vgacon_startup() to complete.
>
> The VGA console needs both screen_info and vga_con to work. In arch/ppc
> we had both, but in arch/powerpc we only retained the screen_info:
>
> $ git grep vga_con v2.6.26 -- arch/ppc arch/ppc64 arch/powerpc
> v2.6.26:arch/ppc/platforms/pplus.c:     conswitchp =3D &vga_con;
> v2.6.26:arch/ppc/platforms/prep_setup.c:        conswitchp =3D &vga_con;
>
> so after arch/ppc was removed, this became impossible to use on both
> pplus and prep. These two platforms were also (as far as I can tell)
> the only ones to support vga16fb as an alternative to vgacon, but
> both platforms were removed later on.

I did use vgacon and vga16fb on CHRP on a second video card
(initialized using Gabriel Paubert's x86 BIOS emulator), but that was
definitely before the advent of arch/powerpc/.

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
