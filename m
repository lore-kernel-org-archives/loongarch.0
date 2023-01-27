Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200EA522D
	for <loongarch@lists.linux.dev>; Fri, 27 Jan 2023 23:19:38 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so6116502pjb.5
        for <loongarch@lists.linux.dev>; Fri, 27 Jan 2023 15:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8CUiuR0W5E+PBhliE9B5Xpc1hgvQcn7IvZXYHXz1Ztk=;
        b=paJf4L9cWbEi06hvXF3W+dvDzKcJfx5lCtIJZryT2W6x9jn8QFdqdeSxBXueWWBz4l
         rmERWAhF8Jm6eVjAbcEKqXWk92TaZ81krplTYlrMd/cx7BLYELfqbb5CODOLpDvn3Wml
         kRDg2FG0oQukaBrpadAmUfS7JdX6dtNX5Yhxfrmh9fF25lANpaUbh+OUe4mJnDmapjXX
         gkAdUczu4u3q5myPePEFbhYsOrjzSYhCHKeHI7PmJlrIZYidHb64mfDumPwdlk9pOjoP
         gInzuu73k1EMmj9geC+hKbAVQjTYtmE/jHVcj9mm7ngPUJ7ymq4p0azycwmTjONcP99X
         kwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CUiuR0W5E+PBhliE9B5Xpc1hgvQcn7IvZXYHXz1Ztk=;
        b=GOYN5W+CPLK/9vDhP1ma6wX8jdHybURimc86KYurqLkrG2O3wTuO8P+c3QNXHDAQVa
         4wgPK7dtjI8bKO1rh9Qvl1nA69mmvaablKZQQagJces80+PiFbBahxO32DfxePRP+6Tt
         QUlcKo3LBImvgxK01ce7FhDbDEG1E5DPZPSRdatIYDNGib+1nmT5UbSic8EGygrSfw4/
         AQRyHs4igZ3gVLlXPDioyb+fNQRmraK0ztptI1280dl6XuHc/mW/kgm8kytG6sezbvBg
         ywny342P1wgzodydGu9Dl73JeZ6YoGKqTtK14SFFSCK9ooScca33oMyBFZsQgwB7qJt6
         VmBQ==
X-Gm-Message-State: AO0yUKWrGbD9Qyx3U+xDYki8YFaSWkg2GXctlXGNcHvgIbUY3ZDbLNWI
	2y6Wp3NwNWpCy5cwUIUyIbExnEUSVMvmQEsnEb/kkg==
X-Google-Smtp-Source: AK7set86nD7AHLHjFHADNw68YHO3+pTEXmPYEX73qRUo91NxvyvumPLImtBCeS4GMfu57Ja5MOsxUjtYU3znLSUgghw=
X-Received: by 2002:a17:90a:2ec7:b0:22c:419a:f4cd with SMTP id
 h7-20020a17090a2ec700b0022c419af4cdmr750919pjs.74.1674861577303; Fri, 27 Jan
 2023 15:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221235147.45lkqmosndritfpe@google.com> <mhng-17d41c33-7f33-4a1c-8af2-ae7d07134e8c@palmer-ri-x1c9>
In-Reply-To: <mhng-17d41c33-7f33-4a1c-8af2-ae7d07134e8c@palmer-ri-x1c9>
From: Fangrui Song <maskray@google.com>
Date: Fri, 27 Jan 2023 18:19:25 -0500
Message-ID: <CAFP8O3J1Pn+_BMKXtxB+avtYyZ+bBKffHfNOXoJPMD5QHv5obQ@mail.gmail.com>
Subject: Re: [PATCH v2] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Arnd Bergmann <arnd@arndb.de>
Cc: christophe.leroy@csgroup.eu, Palmer Dabbelt <palmer@dabbelt.com>, luto@kernel.org, 
	tglx@linutronix.de, vincenzo.frascino@arm.com, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 29, 2022 at 11:22 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 21 Dec 2022 15:51:47 PST (-0800), maskray@google.com wrote:
> > The actual intention is that no dynamic relocation exists. However, some
> > GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
> > the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> > relocations. E.g. ld's powerpc port recently fixed
> > https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
> > generally no-op in the dynamic loaders. So just ignore them.
> >
> > With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
> > bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
> > not called "absolute relocations". (The patch is motivated by the arm64
> > port missing R_AARCH64_RELATIVE.)
> >
> > Signed-off-by: Fangrui Song <maskray@google.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> > Change from v1:
> > * rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso: use "grep -E" instead of "egrep")
> > * change the commit message to mention an example GNU ld bug; no longer say the patch fixes a deprecated egrep use
> > ---
> >   arch/arm/vdso/Makefile            |  3 ---
> >   arch/arm64/kernel/vdso/Makefile   |  3 ---
> >   arch/arm64/kernel/vdso32/Makefile |  3 ---
> >   arch/csky/kernel/vdso/Makefile    |  3 ---
> >   arch/loongarch/vdso/Makefile      |  3 ---
> >   arch/mips/vdso/Makefile           |  3 ---
> >   arch/powerpc/kernel/vdso/Makefile |  1 -
> >   arch/riscv/kernel/vdso/Makefile   |  3 ---
> >   arch/s390/kernel/vdso32/Makefile  |  2 --
> >   arch/s390/kernel/vdso64/Makefile  |  2 --
> >   arch/x86/entry/vdso/Makefile      |  4 ----
> >   lib/vdso/Makefile                 | 13 ++++---------
> >   12 files changed, 4 insertions(+), 39 deletions(-)
>
> [snip]
>
> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> > index 06e6b27f3bcc..d85c37e11b21 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -1,9 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   # Copied from arch/tile/kernel/vdso/Makefile
> >
> > -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
> > -# the inclusion of generic Makefile.
> > -ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
> >   include $(srctree)/lib/vdso/Makefile
> >   # Symbols present in the vdso
> >   vdso-syms  = rt_sigreturn
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
>
> Thanks!

Looks like this patch hasn't been picked yet...
