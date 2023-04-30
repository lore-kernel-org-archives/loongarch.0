Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E22597
	for <loongarch@lists.linux.dev>; Sun, 30 Apr 2023 13:03:40 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so15987635276.1
        for <loongarch@lists.linux.dev>; Sun, 30 Apr 2023 06:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682859819; x=1685451819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7WF7SpO6yLlGrM65QrDk8wld6xpe3XopvGtDDxj/oU=;
        b=JPw1MhEvZnJmPc6SWacnnrm7TKRJzTUhLF4Vr8v/h/usjKHvEvhc9hrt6X581Ts5hl
         PnSldk6vo14gnwB5NnDJbBpP3+6xsPNTBenM1qOFlxTZQautHeP/s6UMH8mrtDojseqm
         ckcelzpe8afmj0H13KLEs5uiGo4w7cgiZE8VBeWn6HauzTmV2W3OUyt8yPxnbOvIVmLk
         jnNt4eKABsufZpjHH3LOm3FtVRdeMD70kFaRJH9K8s/MCElP1UzP+dE1FGMBuvIqZm0n
         bdH5KVYy3IKftcf2HvssEuQwAYwUGA4m0GPf1AgMSmNcrslblEzzf+IG8qKc18Ozm5Dq
         fUBA==
X-Gm-Message-State: AC+VfDyb88qFEN9o3NgS6SCsaIYYgFD87oyZZCcSVxg49gJ2DGNl/mG4
	eWoakRc6Y76URS57BY9u+VU0mtdQ2KkvTQ==
X-Google-Smtp-Source: ACHHUZ7eh1YJEwMgkAFC5jQF8w54cIaNEsKGMwuj7D/uMaZCHojxANreMXLBx5kxTmNl6G6Q487dzw==
X-Received: by 2002:a81:ec2:0:b0:559:d992:405c with SMTP id 185-20020a810ec2000000b00559d992405cmr4764356ywo.5.1682859819207;
        Sun, 30 Apr 2023 06:03:39 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id h6-20020a816c06000000b005463c7417c6sm6222478ywc.8.2023.04.30.06.03.37
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 06:03:38 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so16017213276.0
        for <loongarch@lists.linux.dev>; Sun, 30 Apr 2023 06:03:37 -0700 (PDT)
X-Received: by 2002:a81:5253:0:b0:54f:b615:1e44 with SMTP id
 g80-20020a815253000000b0054fb6151e44mr9871377ywb.7.1682859817683; Sun, 30 Apr
 2023 06:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <74a647f7-cf5f-4c23-aad6-77bf5b04e116@app.fastmail.com> <mhng-8d0e378d-10f7-4107-99aa-b204c3d2a619@palmer-ri-x1c9a>
In-Reply-To: <mhng-8d0e378d-10f7-4107-99aa-b204c3d2a619@palmer-ri-x1c9a>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 30 Apr 2023 15:03:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVgAETQPzYNgEnSijt8K6LE86xM2GuJdh7b6_SNCFj2w@mail.gmail.com>
Message-ID: <CAMuHMdVVgAETQPzYNgEnSijt8K6LE86xM2GuJdh7b6_SNCFj2w@mail.gmail.com>
Subject: Re: [PATCH] libgcc: Add forward declarations for generic library routines
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, geert+renesas@glider.be, akpm@linux-foundation.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, chris@zankel.net, jcmvbkbc@gmail.com, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Palmer,

On Sat, Apr 29, 2023 at 10:20=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com=
> wrote:
> On Fri, 21 Apr 2023 13:38:52 PDT (-0700), Arnd Bergmann wrote:
> > On Fri, Apr 21, 2023, at 16:54, Geert Uytterhoeven wrote:
> >> With W=3D1 on platforms that use the generic gcc library routines
> >> (csky/loongarch/mips/riscv/sh/xtensa):
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Link: https://lore.kernel.org/oe-kbuild-all/202303272214.RxzpA6bP-lkp@=
intel.com/
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Nice, this is one I don't have in my series,
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > I have patches for a lot of other missing prototype warnings, plan
> > to send them out after -rc1.
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

> I think I've merged some stuff around here before, but it's probably
> better for some more generic tree?  LMK if you guys wanted me to pick
> these up, though, I've got a smattering of small stuff already so I'll
> have another PR either way.

Too late ;-) Already upstream via akpm's tree.

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
