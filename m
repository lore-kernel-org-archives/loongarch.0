Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A4114AB2
	for <loongarch@lists.linux.dev>; Wed, 10 May 2023 14:34:49 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-559e53d1195so105820587b3.2
        for <loongarch@lists.linux.dev>; Wed, 10 May 2023 07:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683729288; x=1686321288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozQA/cDvPs2H88bJoE4ZEXy4NN+hc65oP+0zn7oNwKg=;
        b=KgG0i4+74b0H9RXb4MvUx90NX3UKC/4D5+hsKkf3P6ntBV37jhTIYJAal8DcgIdihy
         KQpIG4mMTKNQDmPKgBWPeAahMd5vg2uRz3Iu2vmjzSngtLdAFD4vCQvIIYRDnp8TZEHs
         M8Uzo3QlQfO/GBV37xmOu55DaYQb0nber8y/rrJ0jdlMpeVv9rXEe1y77JxVCdl5BCEg
         NIEKBYPk4bBlpp71v2XhT+ES8c3brn33pWI7gSmZSiJEUZl6Nh6+DYJu6zesWoO1noHu
         PydsEtzQiqzyVx+3uZcZJAHuacfP8flLCHNmWr9O+KKA9He2/icr9XiFDlbiHb137PGd
         RQDA==
X-Gm-Message-State: AC+VfDzOOLqWAcPG4H/CrAO1WG1rqB59IVHkjdc5lKAa+Y7yGaKMx7Fn
	ldlpait6WAPZ4238wdWpaaQFK4DbL91XMg==
X-Google-Smtp-Source: ACHHUZ7VJ7X64NU/Pq7+Kf1aLooJ+NYI/7Snf9T5HaJlY86fU5Qc04NLadVS1UZNzGY92VSj93YZBQ==
X-Received: by 2002:a0d:ebd6:0:b0:54f:d816:895d with SMTP id u205-20020a0debd6000000b0054fd816895dmr21790732ywe.28.1683729288334;
        Wed, 10 May 2023 07:34:48 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id w138-20020a0dd490000000b005463e45458bsm4116363ywd.123.2023.05.10.07.34.46
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:34:47 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-b983027d0faso9323111276.0
        for <loongarch@lists.linux.dev>; Wed, 10 May 2023 07:34:46 -0700 (PDT)
X-Received: by 2002:a05:6902:18c6:b0:b99:5707:4e6f with SMTP id
 ck6-20020a05690218c600b00b9957074e6fmr23871358ybb.32.1683729286388; Wed, 10
 May 2023 07:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de> <20230510110557.14343-6-tzimmermann@suse.de>
 <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com> <487ff03b-d753-972f-7a06-a1d5efda917d@suse.de>
In-Reply-To: <487ff03b-d753-972f-7a06-a1d5efda917d@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2023 16:34:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQLF6QZi4j5Yg3oiy8dMbuApk+r=5c2tSLvYxvAaudMA@mail.gmail.com>
Message-ID: <CAMuHMdWQLF6QZi4j5Yg3oiy8dMbuApk+r=5c2tSLvYxvAaudMA@mail.gmail.com>
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

On Wed, May 10, 2023 at 4:20=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 10.05.23 um 14:34 schrieb Geert Uytterhoeven:
> > On Wed, May 10, 2023 at 1:06=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Implement framebuffer I/O helpers, such as fb_read*() and fb_write*(),
> >> in the architecture's <asm/fb.h> header file or the generic one.
> >>
> >> The common case has been the use of regular I/O functions, such as
> >> __raw_readb() or memset_io(). A few architectures used plain system-
> >> memory reads and writes. Sparc used helpers for its SBus.
> >>
> >> The architectures that used special cases provide the same code in
> >> their __raw_*() I/O helpers. So the patch replaces this code with the
> >> __raw_*() functions and moves it to <asm-generic/fb.h> for all
> >> architectures.
> >>
> >> v6:
> >>          * fix fb_readq()/fb_writeq() on 64-bit mips (kernel test robo=
t)
> >> v5:
> >>          * include <linux/io.h> in <asm-generic/fb>; fix s390 build
> >> v4:
> >>          * ia64, loongarch, sparc64: add fb_mem*() to arch headers
> >>            to keep current semantics (Arnd)
> >> v3:
> >>          * implement all architectures with generic helpers
> >>          * support reordering and native byte order (Geert, Arnd)
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> >> --- a/arch/mips/include/asm/fb.h
> >> +++ b/arch/mips/include/asm/fb.h
> >> @@ -12,6 +12,28 @@ static inline void fb_pgprotect(struct file *file, =
struct vm_area_struct *vma,
> >>   }
> >>   #define fb_pgprotect fb_pgprotect
> >>
> >> +/*
> >> + * MIPS doesn't define __raw_ I/O macros, so the helpers
> >> + * in <asm-generic/fb.h> don't generate fb_readq() and
> >> + * fb_write(). We have to provide them here.
> >
> > MIPS does not include <asm-generic/io.h>,  nor define its own
>
> I know, that's why the TODO says to convert it to generic I/O.
>
> > __raw_readq() and __raw_writeq()...
>
> It doesn't define those macros, but it generates function calls of the
> same names. Follow the macros at
>
>
> https://elixir.bootlin.com/linux/latest/source/arch/mips/include/asm/io.h=
#L357
>
> It expands to a variety of helpers, including __raw_*().

Thanks, I forgot MIPS is using these grep-unfriendly factories...

> >> + *
> >> + * TODO: Convert MIPS to generic I/O. The helpers below can
> >> + *       then be removed.
> >> + */
> >> +#ifdef CONFIG_64BIT
> >> +static inline u64 fb_readq(const volatile void __iomem *addr)
> >> +{
> >> +       return __raw_readq(addr);
> >
> > ... so how can this call work?
>
> On 64-bit builds, there's __raw_readq() and __raw_writeq().
>
> At first, I tried to do the right thing and convert MIPS to work with
> <asm-generic/io.h>. But that created a ton of follow-up errors in other
> headers. So for now, it's better to handle this problem in asm/fb.h.

So isn't just adding

    #define __raw_readq __raw_readq
    #define __raw_writeq __raw_writeq

to arch/mips/include/asm/io.h sufficient to make <asm-generic/fb.h>
do the right thing?

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
