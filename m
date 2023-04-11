Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098132F2D
	for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 08:09:02 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id h198so13660911ybg.12
        for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 01:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681200542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hALJfm4jnccIo090MDgna4b/Z74t0kji7w+cuP7uYXI=;
        b=qj3/Rl5O5HhQF6K28JOPhmNT+wS5DUMMB0+8v7CGaw6fgigUDygRWkLWQb/LLfqehm
         wi5wr03uZQ2dCTXJhYJ6REBBGoEfRJsCUqCumToTIpa5VVqw7Ji0Tzje4YA0zJ1J9ovl
         9zsMwWzqLWDVBBda9dHDycHe/ivTSwAQu7bp7NpmQ19oi4Y3VowBxQxk3xZJmkEGa+XZ
         iRqvcHkgAzgELm7fAQ6lpd2vmUabSO/7lNtL6uhK+P2YH4KqRcO/ievVDYCUDbqgQoId
         kpOHVj+QNA7WG7mAUPAudh3bE8XoNoTCmbm3QySXhohPz1CaLQ9pqjZzBgGG5N3/+WF3
         XtPw==
X-Gm-Message-State: AAQBX9cgVhsi4EQCJl5ro/ltUWwV545YClAjEjcnOUKhgvqkPp2UgloF
	kV3Rhd7sMC7zySEY+zn6wzrNKxQIV3bhCQ==
X-Google-Smtp-Source: AKy350YFN1J4Ug5H+xCyFGKhZz/T6Ic+h3Id1UnM3dHuzxlKLvNHI2tFjJTwGG6HXmIwUPcnUGPBxg==
X-Received: by 2002:a25:13c9:0:b0:b0f:dde5:e389 with SMTP id 192-20020a2513c9000000b00b0fdde5e389mr6446194ybt.41.1681200541775;
        Tue, 11 Apr 2023 01:09:01 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id q145-20020a819997000000b00545ef25cec6sm1176320ywg.105.2023.04.11.01.09.00
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:09:00 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-54f64b29207so35919457b3.8
        for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 01:09:00 -0700 (PDT)
X-Received: by 2002:a81:e401:0:b0:54c:19a6:480 with SMTP id
 r1-20020a81e401000000b0054c19a60480mr7173247ywl.4.1681200539960; Tue, 11 Apr
 2023 01:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-2-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:08:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
Message-ID: <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] fbdev: Prepare generic architecture helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com, 
	gregkh@linuxfoundation.org, linux-arch@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Thu, Apr 6, 2023 at 4:30=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Generic implementations of fb_pgprotect() and fb_is_primary_device()
> have been in the source code for a long time. Prepare the header file
> to make use of them.
>
> Improve the code by using an inline function for fb_pgprotect()
> and by removing include statements. The default mode set by
> fb_pgprotect() is now writecombine, which is what most platforms
> want.
>
> Symbols are protected by preprocessor guards. Architectures that
> provide a symbol need to define a preprocessor token of the same
> name and value. Otherwise the header file will provide a generic
> implementation. This pattern has been taken from <asm/io.h>.
>
> v2:
>         *  use writecombine mappings by default (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/include/asm-generic/fb.h
> +++ b/include/asm-generic/fb.h
> @@ -1,13 +1,32 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +
>  #ifndef __ASM_GENERIC_FB_H_
>  #define __ASM_GENERIC_FB_H_
> -#include <linux/fb.h>
>
> -#define fb_pgprotect(...) do {} while (0)
> +/*
> + * Only include this header file from your architecture's <asm/fb.h>.
> + */
> +
> +#include <asm/page.h>
> +
> +struct fb_info;
> +struct file;
> +
> +#ifndef fb_pgprotect
> +#define fb_pgprotect fb_pgprotect
> +static inline void fb_pgprotect(struct file *file, struct vm_area_struct=
 *vma,
> +                               unsigned long off)

Does this affect any noMMU platforms that relied on fb_pgprotect()
doing nothing before?
Perhaps the body below should be protected by "#ifdef CONFIG_MMU"?

> +{
> +       vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);

Shouldn't this use the pgprot_val() wrapper?

> +}
> +#endif

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
