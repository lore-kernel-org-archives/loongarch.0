Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56E420B23
	for <loongarch@lists.linux.dev>; Wed, 10 May 2023 12:34:48 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-559e53d1195so103599227b3.2
        for <loongarch@lists.linux.dev>; Wed, 10 May 2023 05:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683722087; x=1686314087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGY/0htSfGIvsVgPn7bx+ykp3agguIOsAu0irnl44Xg=;
        b=TAVi687ffhoqVsP4C4054NrP4QNhhSF1ao3qYWAn67f6lWT+xHou+mhUP9varENXQ+
         uKU6YWzN09hcRriTBeejOzfHAF0Mynqx8EWGwJ7VoqO8TWnTzCjQkPMoDMw3VifBZh0q
         jdZJkoZena7BzmkqlD/WZAd8J/SeE7IP5VlbfDRqbqfoTWFcE0PGyozNDtMP9TsF366Z
         RiLAmCp2jaN22I9wCyKdg45t8okCST1SoCT5otdfGbpzuTqXZh1iLCj8+avBwIrh6qS8
         qaILCjJw9yP7eS36QBfK6f2OS0lNnSHX0k38/Q9Gv8nlUbDqsGqZJj/6dFmc2T9DvrNR
         V61g==
X-Gm-Message-State: AC+VfDz3Im6Hlsk1mS0POLyI+aHf8PSTPFCMjnoF9epz2aEwJW9x0eOq
	1m9Z2wUjP6s6utI1AndtMouJaLEYmwp3Uw==
X-Google-Smtp-Source: ACHHUZ6HkRaDgu0pJFbblZo5iZq31p+7cluxWkH5Keap2Rikf4AFPEKC1NeZuFVqOMZ2ypKO6aou3w==
X-Received: by 2002:a81:4f08:0:b0:55a:8037:84ca with SMTP id d8-20020a814f08000000b0055a803784camr20639125ywb.46.1683722087316;
        Wed, 10 May 2023 05:34:47 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id e2-20020a0df502000000b0055d820f11bcsm4067249ywf.12.2023.05.10.05.34.45
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 05:34:45 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-559de1d36a9so103567637b3.1
        for <loongarch@lists.linux.dev>; Wed, 10 May 2023 05:34:45 -0700 (PDT)
X-Received: by 2002:a0d:ead7:0:b0:55a:ae08:163f with SMTP id
 t206-20020a0dead7000000b0055aae08163fmr22367018ywe.32.1683722085095; Wed, 10
 May 2023 05:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de> <20230510110557.14343-6-tzimmermann@suse.de>
In-Reply-To: <20230510110557.14343-6-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2023 14:34:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com>
Message-ID: <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, daniel@ffwll.ch, vgupta@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, davem@davemloft.net, 
	James.Bottomley@hansenpartnership.com, arnd@arndb.de, sam@ravnborg.org, 
	suijingfeng@loongson.cn, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, May 10, 2023 at 1:06=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Implement framebuffer I/O helpers, such as fb_read*() and fb_write*(),
> in the architecture's <asm/fb.h> header file or the generic one.
>
> The common case has been the use of regular I/O functions, such as
> __raw_readb() or memset_io(). A few architectures used plain system-
> memory reads and writes. Sparc used helpers for its SBus.
>
> The architectures that used special cases provide the same code in
> their __raw_*() I/O helpers. So the patch replaces this code with the
> __raw_*() functions and moves it to <asm-generic/fb.h> for all
> architectures.
>
> v6:
>         * fix fb_readq()/fb_writeq() on 64-bit mips (kernel test robot)
> v5:
>         * include <linux/io.h> in <asm-generic/fb>; fix s390 build
> v4:
>         * ia64, loongarch, sparc64: add fb_mem*() to arch headers
>           to keep current semantics (Arnd)
> v3:
>         * implement all architectures with generic helpers
>         * support reordering and native byte order (Geert, Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> add mips fb_q()

> --- a/arch/mips/include/asm/fb.h
> +++ b/arch/mips/include/asm/fb.h
> @@ -12,6 +12,28 @@ static inline void fb_pgprotect(struct file *file, str=
uct vm_area_struct *vma,
>  }
>  #define fb_pgprotect fb_pgprotect
>
> +/*
> + * MIPS doesn't define __raw_ I/O macros, so the helpers
> + * in <asm-generic/fb.h> don't generate fb_readq() and
> + * fb_write(). We have to provide them here.

MIPS does not include <asm-generic/io.h>,  nor define its own
__raw_readq() and __raw_writeq()...

> + *
> + * TODO: Convert MIPS to generic I/O. The helpers below can
> + *       then be removed.
> + */
> +#ifdef CONFIG_64BIT
> +static inline u64 fb_readq(const volatile void __iomem *addr)
> +{
> +       return __raw_readq(addr);

... so how can this call work?

> +}
> +#define fb_readq fb_readq
> +
> +static inline void fb_writeq(u64 b, volatile void __iomem *addr)
> +{
> +       __raw_writeq(b, addr);
> +}
> +#define fb_writeq fb_writeq
> +#endif
> +
>  #include <asm-generic/fb.h>

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
