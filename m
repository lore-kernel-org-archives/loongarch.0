Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B3820B3F
	for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dbc72b692adso1131651276.2
        for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 00:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702283137; x=1702887937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2eWe2oiRzSTkXAZdruL7FMLjSewImdzh7HyKdRxUqI=;
        b=CYdRZE6R5XA++QFd3vG3/ar9OurJW23ZsqmWX1nQ0e+uK/dg19CboqNWvU7HKmfOMs
         9aMlGajbbD3PBfgJ4VVSMGSTj5zj+nE3sQY7DrfHhtl/HcuC+y4bvxc0001yggvT2HDZ
         BpOEBAFr6ZfzJZcPaGS6N4Kli8JTnhKZhn2ucuHrxzpDYOXEKt7LW68f1E7luR+eBnvc
         uQsQUPMCq0iE+PclzjjyixzaDkq1giuMnZDExwYULa0SMYsnfwvfx2F46KuMatsll+l3
         OYXrkQ30dgKNGinBI+3KQocXrwcJ/u7fkdS9Oss5cYWMbw7tGqCs8p/yxvuIdjhTTK0d
         JKcw==
X-Gm-Message-State: AOJu0Yw1LYYN8ygzm42ECiUzD+iYdpRo2Cm3Y9FrfC/oyjjLJxsooUmH
	xjnR64Q/LEeoGlgMU3TGX32u+XQ8L29WTQ==
X-Google-Smtp-Source: AGHT+IFGBS/WOnuhNVA+Yv8a8HuxSYf6/0LPeRiqUJCe+9GZJFpVDXjhvlnUtt1D3lABQU4gnDpABg==
X-Received: by 2002:a05:6902:28d:b0:db7:dacf:3f99 with SMTP id v13-20020a056902028d00b00db7dacf3f99mr2020923ybh.70.1702283136684;
        Mon, 11 Dec 2023 00:25:36 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id e188-20020a2537c5000000b00db7c2132925sm2413116yba.55.2023.12.11.00.25.36
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 00:25:36 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5d6b9143782so35674587b3.0
        for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 00:25:36 -0800 (PST)
X-Received: by 2002:a81:7285:0:b0:5d8:74e6:e4c5 with SMTP id
 n127-20020a817285000000b005d874e6e4c5mr2853116ywc.98.1702283135734; Mon, 11
 Dec 2023 00:25:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231208073036.7884-1-bhe@redhat.com> <ZXLI748b85be459B@fedora>
In-Reply-To: <ZXLI748b85be459B@fedora>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Dec 2023 09:25:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAaM+eJtiVbXXBO0xOmpqhrOiCO5itNsNdTiOxRXVtVw@mail.gmail.com>
Message-ID: <CAMuHMdWAaM+eJtiVbXXBO0xOmpqhrOiCO5itNsNdTiOxRXVtVw@mail.gmail.com>
Subject: Re: [PATCH 0/5] kexec: fix the incorrect ifdeffery and dependency of CONFIG_KEXEC
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	loongarch@lists.linux.dev, kexec@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, x86@kernel.org, akpm@linux-foundation.org, 
	eric_devolder@yahoo.com, sfr@canb.auug.org.au, ignat@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baoquan,

On Fri, Dec 8, 2023 at 8:43=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
> Forgot adding kexec to CC, add it now.
>
> On 12/08/23 at 03:30pm, Baoquan He wrote:
> > The select of KEXEC for CRASH_DUMP in kernel/Kconfig.kexec will be
> > dropped, then compiling errors will be triggered if below config
> > items are set:
> >
> > =3D=3D=3D
> > CONFIG_CRASH_CORE=3Dy
> > CONFIG_KEXEC_CORE=3Dy
> > CONFIG_CRASH_DUMP=3Dy
> > =3D=3D=3D
> >
> > E.g on mips, below link error are seen:
> > --------------------------------------------------------------------
> > mipsel-linux-ld: kernel/kexec_core.o: in function `kimage_free':
> > kernel/kexec_core.c:(.text+0x2200): undefined reference to `machine_kex=
ec_cleanup'
> > mipsel-linux-ld: kernel/kexec_core.o: in function `__crash_kexec':
> > kernel/kexec_core.c:(.text+0x2480): undefined reference to `machine_cra=
sh_shutdown'
> > mipsel-linux-ld: kernel/kexec_core.c:(.text+0x2488): undefined referenc=
e to `machine_kexec'
> > mipsel-linux-ld: kernel/kexec_core.o: in function `kernel_kexec':
> > kernel/kexec_core.c:(.text+0x29b8): undefined reference to `machine_shu=
tdown'
> > mipsel-linux-ld: kernel/kexec_core.c:(.text+0x29c0): undefined referenc=
e to `machine_kexec'
> > --------------------------------------------------------------------
> >
> > Here, change the incorrect dependency of building kexec_core related ob=
ject
> > files, and the ifdeffery on architectures from CONFIG_KEXEC to
> > CONFIG_KEXEC_CORE.
> >
> > Testing:
> > =3D=3D=3D=3D=3D=3D=3D=3D
> > Passed on mips and loognarch with the LKP reproducer.
> >
> > Baoquan He (5):
> >   loongarch, kexec: change dependency of object files
> >   m68k, kexec: fix the incorrect ifdeffery and build dependency of
> >     CONFIG_KEXEC
> >   mips, kexec: fix the incorrect ifdeffery and dependency of
> >     CONFIG_KEXEC
> >   sh, kexec: fix the incorrect ifdeffery and dependency of CONFIG_KEXEC
> >   x86, kexec: fix the wrong ifdeffery CONFIG_KEXEC

I understand this series is v3 of "[PATCH v2] kexec_core: change
dependency of object files"? As this series does not contain a
changelog, can you please summarize what was changed?
Thanks!

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
