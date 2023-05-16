Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB0A23D6
	for <loongarch@lists.linux.dev>; Tue, 16 May 2023 07:08:05 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-561a33b6d63so1133387b3.1
        for <loongarch@lists.linux.dev>; Tue, 16 May 2023 00:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684220884; x=1686812884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTQjfNfGsMfbyHJYnY/d7iucXXNLZgToVmLQABWZsBQ=;
        b=cv0Cf5miCgJLNrpTmvQSOCP9RYjOBDm8RkURzNZzrUXi0yBxVot//FYDLPtaXkRZcT
         WtHW1C/blQ7Sp/3T/x15KKNp94EJKNu394WbrvPVdKBB2g6l7qW88Ez04HDo/ZVLgng+
         w1sboeSukD54GLhhuFYi+eHA5buj+rfZgmO8FOA2NyZPXEk4wXkwM/jvbNkAD+dRtlsk
         ywQgVVTz2DsQe5lDpFQ4RTLpYWW6yCjjO02fijs01XHsRlmlVawGtCeo7EDoqhYIg3w4
         gc/qBl0v9eadbyfY65qksTG9P4iE8aztaUVO9aMR1GXMbM9UoPATvm8KIky+2IDcBxKJ
         QkgA==
X-Gm-Message-State: AC+VfDw6MYo1czbTq6Hg8nP+efYI98LAP30mTNQe77u0PETmhEgxssWP
	itxhh2J2gXB6OYZRjMQSPvntUZt89kw7BA==
X-Google-Smtp-Source: ACHHUZ6ksQt5jxFdrJcORgI/M8efT+7ziv3oQ0LeuGqwMHAPhvrWIIJnqxQY7ZGeIGiyu1+ThpVSpA==
X-Received: by 2002:a0d:d9c7:0:b0:55b:4942:c86b with SMTP id b190-20020a0dd9c7000000b0055b4942c86bmr33129400ywe.42.1684220884469;
        Tue, 16 May 2023 00:08:04 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id w126-20020a816284000000b0054fbadd96c4sm396490ywb.126.2023.05.16.00.08.04
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 00:08:04 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-ba825dee5f0so386516276.0
        for <loongarch@lists.linux.dev>; Tue, 16 May 2023 00:08:04 -0700 (PDT)
X-Received: by 2002:a25:1c6:0:b0:ba7:dcad:9b6 with SMTP id 189-20020a2501c6000000b00ba7dcad09b6mr4131622ybb.40.1684220883815;
 Tue, 16 May 2023 00:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230515090848.833045-1-bhe@redhat.com> <20230515090848.833045-2-bhe@redhat.com>
In-Reply-To: <20230515090848.833045-2-bhe@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 May 2023 09:07:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-bL-khVUN59ku1GwV6i4OC3O9AU1GQU2hfGn+JrsBXg@mail.gmail.com>
Message-ID: <CAMuHMdU-bL-khVUN59ku1GwV6i4OC3O9AU1GQU2hfGn+JrsBXg@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 01/17] asm-generic/iomap.h: remove
 ARCH_HAS_IOREMAP_xx macros
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, arnd@arndb.de, christophe.leroy@csgroup.eu, 
	hch@infradead.org, agordeev@linux.ibm.com, wangkefeng.wang@huawei.com, 
	schnelle@linux.ibm.com, David.Laight@aculab.com, shorne@gmail.com, 
	willy@infradead.org, deller@gmx.de, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 11:14=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
> Let's use '#define ioremap_xx' and "#ifdef ioremap_xx" instead.
>
> For each architecture to remove defined ARCH_HAS_IOREMAP_xx macros in
> To remove defined ARCH_HAS_IOREMAP_xx macros in <asm/io.h> of each ARCH,
> the ARCH's own ioremap_wc|wt|np definition need be above
> "#include <asm-generic/iomap.h>. Otherwise the redefinition error would
> be seen during compiling. So the relevant adjustments are made to avoid
> compiling error:
>
>   loongarch:
>   - doesn't include <asm-generic/iomap.h>, defining ARCH_HAS_IOREMAP_WC
>     is redundant, so simply remove it.
>
>   m68k:
>   - selected GENERIC_IOMAP, <asm-generic/iomap.h> has been added in
>     <asm-generic/io.h>, and <asm/kmap.h> is included above
>     <asm-generic/iomap.h>, so simply remove ARCH_HAS_IOREMAP_WT defining.
>
>   mips:
>   - move "#include <asm-generic/iomap.h>" below ioremap_wc definition
>     in <asm/io.h>
>
>   powerpc:
>   - remove "#include <asm-generic/iomap.h>" in <asm/io.h> because it's
>     duplicated with the one in <asm-generic/io.h>, let's rely on the
>     latter.
>
>   x86:
>   - selected GENERIC_IOMAP, remove #include <asm-generic/iomap.h> in
>     the middle of <asm/io.h>. Let's rely on <asm-generic/io.h>.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>

>  arch/m68k/include/asm/io_mm.h       | 2 --
>  arch/m68k/include/asm/kmap.h        | 2 --

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
