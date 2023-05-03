Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E438B4A15
	for <loongarch@lists.linux.dev>; Wed,  3 May 2023 08:22:05 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-55a5a830238so29720867b3.3
        for <loongarch@lists.linux.dev>; Wed, 03 May 2023 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683102125; x=1685694125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yf0nQOOKHL0GEtmAgACXt9/1DKDkHK6ft7tmYSYGTKo=;
        b=HeyNcKb53/MlIlxMUawp6my3udvMbFRFpqjTLupzLHVbxQ3cbTAHddGJBOTxSLEXe1
         MbdPXa53JxoJf7as2Yy8kbBZaNuOIcgJmYswJXvaPAwSNbmgB6gSzrFt40ySfo7BjngI
         GQhekQ4lPNYo5+WH0OWWZAsEn1i8TGz99gk23mWIdwxAjdy7tBs8mnQcZvtU3Hy6S/yI
         c/DQ8VXFMz3LrZyaCQpA1K5AMXpqfNMjY2CHyzmcw5FMiezLlPL9Km4gEGfssWW1kptS
         bmGPp8cnV2w0ICn9YaT947NZN9q8ygO7yuAQtI5eWnbebdYwjVbfodxr9THtAEatiw0m
         Gbag==
X-Gm-Message-State: AC+VfDyagZdYSD3XU1PLwKCVfHDrC7WWPRFyC7SlL/Wpa4iS//TZcO7U
	p/eo7zJhBFpFAuIR0cQj7ZxgaWiUpm1Mtw==
X-Google-Smtp-Source: ACHHUZ4Zso4xKXVm3Dmd5mnu3vkrH5YdSKKIwx5mlPTrsklvp+rZNEt02J1Lc7KGmAULvf53QL7oIw==
X-Received: by 2002:a0d:cb4f:0:b0:55a:46d3:5a3c with SMTP id n76-20020a0dcb4f000000b0055a46d35a3cmr9617165ywd.16.1683102124706;
        Wed, 03 May 2023 01:22:04 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id u14-20020a81840e000000b0055a85ab2704sm1286395ywf.20.2023.05.03.01.22.02
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:22:03 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-55c939fb24dso2907617b3.2
        for <loongarch@lists.linux.dev>; Wed, 03 May 2023 01:22:02 -0700 (PDT)
X-Received: by 2002:a25:240f:0:b0:b9d:d5dc:596c with SMTP id
 k15-20020a25240f000000b00b9dd5dc596cmr11998230ybk.12.1683102122353; Wed, 03
 May 2023 01:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230502130223.14719-1-tzimmermann@suse.de>
In-Reply-To: <20230502130223.14719-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 10:21:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV06LN17KzOh42vjyF504myT=D=a-zz3MduOmQPEmv5SA@mail.gmail.com>
Message-ID: <CAMuHMdV06LN17KzOh42vjyF504myT=D=a-zz3MduOmQPEmv5SA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, daniel@ffwll.ch, vgupta@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, davem@davemloft.net, 
	James.Bottomley@hansenpartnership.com, arnd@arndb.de, sam@ravnborg.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, May 2, 2023 at 3:02=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> (was: fbdev: Use regular I/O function for framebuffers)
>
> Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
> fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
> depends on the architecture, but they are all equivalent to regular
> I/O functions of similar names. So use regular functions instead and
> move all helpers into <asm-generic/fb.h>
>
> The first patch a simple whitespace cleanup.
>
> Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
> will go away patches 2 to 4 prepare include statements in the various
> drivers. Source files that use regular I/O helpers, such as readl(),
> now include <linux/io.h>. Source files that use framebuffer I/O
> helpers, such as fb_readl(), also include <asm/fb.h>.
>
> Patch 5 replaces the architecture-based if-else branching in
> <linux/fb.h> by helpers in <asm-generic/fb.h>. All helpers use Linux'
> existing I/O functions.
>
> Patch 6 harmonizes naming among fbdev and existing I/O functions.
>
> The patchset has been built for a variety of platforms, such as x86-64,
> arm, aarch64, ppc64, parisc, m64k, mips and sparc.
>
> v3:
>         * add the new helpers in <asm-generic/fb.h>
>         * support reordering and native byte order (Geert, Arnd)

Thanks, this fixes the mangled display I was seeing on ARAnyM
with bpp=3D16.

BTW, this series seems to have mixed dependencies: the change
to include/asm-generic/fb.h depends on "[PATCH v3 00/19] arch:
Consolidate <asm/fb.h>"[1], but with that applied, I had to manually
fixup drivers/video/fbdev/core/fb_cfb_fops.c.

[1] https://lore.kernel.org/all/20230417125651.25126-1-tzimmermann@suse.de,

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
