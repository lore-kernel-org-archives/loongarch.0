Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55B65B;
	Thu, 11 May 2023 12:36:07 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-559eae63801so129598387b3.2;
        Thu, 11 May 2023 05:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683808566; x=1686400566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bccEgTIv+NuBZ7b0m7HvDAcmdwRNosK16KRrDt/LqxI=;
        b=fmxDj6QL0kf6j/HYNUijezMNB3clKymChcxCOUWVr/cH2WRkEb3KiBUUC4gBtxXHVW
         4PAiKtcpTkiXrrv3/cMRgA9xsNamjw4FD/L+e5Y+Q3PoYKOLV0P460BhGjSh/YZenutA
         +e+gz2+WOVAbXPzltJsdW2r2XqLsxeN+luhx99zyynxFBffB+DfRuy7PQyLyJAKExjiF
         P+7CcRfM86hfh/wYj83jmois17+0sd7Jk4iV5ZMX8lAhlCUICEjIUVnqqm/llf4GyZEE
         hQxjCsFjIYZ/HoW+h04pxMurNm/etNLm/7I0StqLtYLsNohiWG/zPZUbjxvOxS+6luVD
         PL0g==
X-Gm-Message-State: AC+VfDxv+QbIsfjiOQ8T0vlLPvwD0BXTwkWLCsF8wt0Ke/etZIo7Hv/u
	Mq2igfc9E4nh8YfWkdyF9UZNusobVUq9IA==
X-Google-Smtp-Source: ACHHUZ7WxAh5Va9j2DKODVlLcYcuaGztEogmpitKpdMypfNhMxNnGigU4mDQVyi6S3aUJcVtBKMqpA==
X-Received: by 2002:a0d:d4d0:0:b0:55a:abf8:5c0d with SMTP id w199-20020a0dd4d0000000b0055aabf85c0dmr20457977ywd.21.1683808565912;
        Thu, 11 May 2023 05:36:05 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id h11-20020a816c0b000000b0054fdc874c8asm4881193ywc.59.2023.05.11.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 05:36:04 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-559debdedb5so129814967b3.0;
        Thu, 11 May 2023 05:36:03 -0700 (PDT)
X-Received: by 2002:a81:8a05:0:b0:556:1b32:343b with SMTP id
 a5-20020a818a05000000b005561b32343bmr19413336ywg.45.1683808563363; Thu, 11
 May 2023 05:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230510110557.14343-6-tzimmermann@suse.de> <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com> <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
In-Reply-To: <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 14:35:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Message-ID: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>, 
	Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Vineet Gupta <vgupta@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	"David S . Miller" <davem@davemloft.net>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Sam Ravnborg <sam@ravnborg.org>, 
	suijingfeng@loongson.cn, oe-kbuild-all@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Artur Rojek <contact@artur-rojek.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

CC Artur, who's working on HP Jornada 680.

On Wed, May 10, 2023 at 5:55=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Wed, May 10, 2023, at 16:27, Thomas Zimmermann wrote:
> > Am 10.05.23 um 16:15 schrieb Arnd Bergmann:
> >> On Wed, May 10, 2023, at 16:03, kernel test robot wrote:
>
> >> I think that's a preexisting bug and I have no idea what the
> >> correct solution is. Looking for HD64461 shows it being used
> >> both with inw/outw and readw/writew, so there is no way to have
> >> the correct type. The sh __raw_readw() definition hides this bug,
> >> but that is a problem with arch/sh and it probably hides others
> >> as well.
> >
> > The constant HD64461_IOBASE is defined as integer at
> >
> >
> > https://elixir.bootlin.com/linux/latest/source/arch/sh/include/asm/hd64=
461.h#L17
> >
> > but fb_readw() expects a volatile-void pointer. I guess we could add a
> > cast somewhere to silence the problem. In the current upstream code,
> > that appears to be done by sh's __raw_readw() internally:
> >
> >
> > https://elixir.bootlin.com/linux/latest/source/arch/sh/include/asm/io.h=
#L35
>
> Sure, that would make it build again, but that still doesn't make the
> code correct, since it's completely unclear what base address the
> HD64461_IOBASE is relative to. The hp6xx platform code only passes it
> through inw()/outw(), which take an offset relative to sh_io_port_base,
> but that is not initialized on hp6xx. I tried to find in the history
> when it broke, apparently that was in 2007 commit 34a780a0afeb ("sh:
> hp6xx pata_platform support."), which removed the custom inw/outw
> implementations.

See also commit 4aafae27d0ce73f8 ("sh: hd64461 tidying."), which
claims they are no longer needed.

Don't the I/O port macros just treat the port as an absolute base address
when sh_io_port_base isn't set?

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
