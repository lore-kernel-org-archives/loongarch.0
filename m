Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30BF2F2D
	for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 08:10:19 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54ee9ad5eb3so139338167b3.1
        for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 01:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681200619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKyKsR4WjWkIQ4662w2UQ58EahuI+KkHYModkQblq2M=;
        b=hU4ewZpazsjmXH3VgaIrESVzne5M4bUMHzbfhEasoOpqibVnnw16QJIvyBSLlNNqIt
         GOKbI1xy0QfDfR5T29ZhoQ76UjUjyxFjzy/UWTMW/VPZP6begvnc9S8VGgnGXpf64UCq
         8IPThLw72lTpBX+YJodjsyxwY9cn+4JQuYH5/bzW8OnetI+frJl40nYKPduRrS2mM3Zu
         4BEMNOo4ChEcLUQy/UKMXY3Fw726m8yxqEj1smaPbSZFXclg25YUs9diJ5bOYdVOQTzD
         QWI0eB2O56pq1qZ1C3MHrXi9ypKtvhEwo27DSGpEf4SfU7HfURNxaF3xWoPGc8BD5rCy
         LmDg==
X-Gm-Message-State: AAQBX9f9Yd4eSqKh787Jaig18Og+awO4QXvhL8lUA2/T56pl4BEzYGAc
	2xlGiR+ZXQJV2Ag1iMd+UnlVwwTSKsCzgA==
X-Google-Smtp-Source: AKy350ahLnK4On5ikdmNIRKe7aKS6WNOJMdIei92yjFY4eKTdgvG2nlKvK7yYA4YY6FtgSvMNfpa+w==
X-Received: by 2002:a0d:e24c:0:b0:54c:2500:defb with SMTP id l73-20020a0de24c000000b0054c2500defbmr6003497ywe.41.1681200618766;
        Tue, 11 Apr 2023 01:10:18 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id p5-20020a81b105000000b00545a08184c6sm3348097ywh.86.2023.04.11.01.10.16
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:10:17 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-54c0c86a436so263792457b3.6
        for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 01:10:16 -0700 (PDT)
X-Received: by 2002:a81:bc08:0:b0:54e:e490:d190 with SMTP id
 a8-20020a81bc08000000b0054ee490d190mr1216128ywi.4.1681200616792; Tue, 11 Apr
 2023 01:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-8-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-8-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:10:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Subject: Re: [PATCH v2 07/19] arch/m68k: Merge variants of fb_pgprotect() into
 single function
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

On Thu, Apr 6, 2023 at 4:30=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Merge all variants of fb_pgprotect() into a single function body.
> There are two different cases for MMU systems. For non-MMU systems,
> the function body will be empty. No functional changes, but this
> will help with the switch to <asm-generic/fb.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
