Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CFF2F2D
	for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 08:20:15 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-54c0c86a436so264164627b3.6
        for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 01:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOXdqLxEHLBZ7hy/2mM/9REbA1X5ZreSZtF+7etv6Sw=;
        b=zknsnDG4piDhTTdt+IzlKfW0gUL2FPcmGn2GPVRpVZu1lwIpT10UTS2+eZcwsyhpvv
         uL6kkXuF61lBdi2ZSJRZG/S+DKq1H50I3uTwJZHU6hzBFQb/xLrGrI5v/V42i0xGtZeq
         XURmpkjuoJHgknA3rOkRuS77pFWvyIFr12Zv/hjd8WMZ/9FXDXv1sk6811ADlf8v9lPq
         PDriXCgasc85x0IwfjgbiVu/bpZUHuJf+BeZVCfuseUBSmlQb0eyLPSSyxEIngfOWuqb
         0CDaFWVX6OK3tOvwbbYFWiVOjHiJM4+4NhFiN9FX8oLxEpRnjaSU7KoQ1mgJz2mJBUl8
         ddYg==
X-Gm-Message-State: AAQBX9dbkoDnl/KGqtTHlhNwg5nn1KhP0aab2/+cQASrT4V4Vx3M5SYh
	rDzc8ew/wA7EzQAWL2dGXX/ZtWYi2rdZDg==
X-Google-Smtp-Source: AKy350YQMDOvduhA3jijBMEI5RoOzWF6Qyd5+htSlqYCvWb0KRj8CMmp+0XArxBXzkz7I8krhLzmOA==
X-Received: by 2002:a81:c213:0:b0:544:5816:b93 with SMTP id z19-20020a81c213000000b0054458160b93mr1457110ywc.10.1681201214651;
        Tue, 11 Apr 2023 01:20:14 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id bx12-20020a05690c080c00b00545a08184dcsm3299117ywb.108.2023.04.11.01.20.13
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:20:13 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id h198so13688871ybg.12
        for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 01:20:13 -0700 (PDT)
X-Received: by 2002:a25:d447:0:b0:b75:9519:dbcd with SMTP id
 m68-20020a25d447000000b00b759519dbcdmr960089ybf.12.1681201212819; Tue, 11 Apr
 2023 01:20:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-9-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-9-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:20:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] arch/m68k: Implement <asm/fb.h> with generic helpers
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
> Replace the architecture's fb_is_primary_device() with the generic
> one from <asm-generic/fb.h>. No functional changes.
>
> v2:
>         * provide empty fb_pgprotect() on non-MMU systems
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
