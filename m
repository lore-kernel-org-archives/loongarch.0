Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C078B1C07C4
	for <loongarch@lists.linux.dev>; Fri, 26 Sep 2025 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897066; cv=none; b=qn7Ik3C8NSp6KhCxUKscPPyca3WsD+EoCSSW9LgV27gPSh4nk7wccfPElkjuhXv2Io/6Pl52XA9k2avxb/avZ4lzyRVg3g6rI6SANzn8WbnQ3bmKBNMVd0jqWMl1dTFR7D/0Rwuw0Y7fx5MnLpXGeXIm0ibrORQz3CW8JNF5N/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897066; c=relaxed/simple;
	bh=IGdCqM/yTaiPyzZyhYs3irmCvSMu4bZkT42mEj1Liho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGbn0hEI8e48hDH8pOcAIeN26UlYuExtPtS9m5IpD4/Q4z3kRSwIM6trihbkYGQeJ2D3defGi8OBPMI1qz4/BGOiil4oRlxKQww4Ydk2oO2zAwQSU4quBEU3yX6dtO6ZYXch8i45E/M95dp5M+174wS9Ul8p15G18mWSMGB3YoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=je5lcoVJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="je5lcoVJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f3405c38aso2303744b3a.0
        for <loongarch@lists.linux.dev>; Fri, 26 Sep 2025 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758897064; x=1759501864; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eu75bAdjt5h24Mx1b29gb92p1XKKnNXBr/2FE3JcqU0=;
        b=je5lcoVJv71crmtxIJ44NsErxeFSJDRWTFlKcLC6gMYON8XSfs5dDvkY1YzDf3riyn
         mX0tP0336z2SpBS0Jy2owQjL+ONxtY/6RddbxRdvbzko8p6p/R46NcwQyuqdLqdw5xCA
         Kl/c+NZs9q7YL8mW8WZFxiKTADg+fRwiGDAILYG8XiorQHPgL6jnsifXcPMGMUhJE4Ud
         zabocbFxOIwDLyYHxgXZrY3SYVFaeTrB7jaJS2DgmY14CR56/RkffirXUm+IRkcWKQdM
         t/sk7rYrZ/2HWO7LNHP7MP7f7CChz41I4ZJc8u1yflUq2tLU/bDlPI5lnzD5MmeFMLV1
         Qw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758897064; x=1759501864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eu75bAdjt5h24Mx1b29gb92p1XKKnNXBr/2FE3JcqU0=;
        b=njvdyfdk7FEdEkHFNc46nKF278rIw7tr6/qWlP+SSDIV/WcbtwP+yuDVm3r6eohe8E
         dqkbKQsIEMjPztso3ZJkyVkbj+DiziJgeSIuIsdl+NgGY9q1pO3lDAXie49HSUyeTsFI
         AzwTb9PkPwYjuXjOR0Avf6+ghF1oIT8nw30NCglNNqrnMrcpFynWEfgjdhyqknYj+g6a
         sk9WMpIJjFynPjQJXxOpOjghXspDDugfY0Rswl+OjQYfUyyUsQ4WK4jAYQxdyigVSho/
         6MwdnL6gSWIQDfDp7iTSTWC1/LjqGHpr7bTHu1fkp1KCi5Fm1kxRtcILaKk6oeHi7DwL
         /Opw==
X-Forwarded-Encrypted: i=1; AJvYcCWVu6/RUhbrbNaM9fPD4DeVihIqf4Ys9pybYhKS+2CJlHX2+MwtRvnf7fBw3FDWgnZySBNZs0G5mPw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhSIVlEiLISjg+c3QX9TXizAZcnQGC91OSe8R3PlkMcHWPaCCv
	4ugetHHMwONSQoU5bLsI8+Z/Saomw7DyodgyMYkUlcKYquZE/VuTQc4E
X-Gm-Gg: ASbGnct7WuyEVVv8FQT0/jmEfpJ8gmiyH4e8iYHxsTJFlys320eJGKa9dURUlbyO6MJ
	nV7S/0NY2NaRc/QHpvRtvgbXoXoWvFLiBwusy77sRP5iNArNc+0pvUyXhjPv2Ib8tX4kLZuJS25
	/b2ATKdPjLUfeOpq6tj2gN87gjpD4SD5gPoakFT9N/zX0Sv6duvSKypgeP0CJf7ZYath+224ro4
	9hk/ItG+Gwm7fZX8uUvPaVd/icN1zbPAEfYViAA54IZzXVUpCNHFgsb18kuwzauMH7/h2brynZw
	Psauqa7+YeiiyePWtJEoiACg0eMDC9bzhHDxSPp2X9H0et1RfI9LyImpobirD/m+UuvXlwRCDWq
	u/MeNC1jHhuZgqui6n/3tX76HTE+XvMO7rhs=
X-Google-Smtp-Source: AGHT+IGltOAbo12hajVKgocbpBnHZMZeOL2ERzr9t+RXZ6PnxdAexobpssI/N7xOALCEb6/v2s939A==
X-Received: by 2002:a05:6a21:7116:b0:2f9:4cde:34fb with SMTP id adf61e73a8af0-2f94cde4d16mr2209198637.1.1758897063477;
        Fri, 26 Sep 2025 07:31:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238cafasm4613070b3a.4.2025.09.26.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:31:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 26 Sep 2025 07:31:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH V2] LoongArch: Align ACPI structures if ARCH_STRICT_ALIGN
 enabled
Message-ID: <899f2dec-e8b9-44f4-ab8d-001e160a2aed@roeck-us.net>
References: <20250910091033.725716-1-chenhuacai@loongson.cn>
 <20250920234836.GA3857420@ax162>
 <CAAhV-H5S8VKKBkNyrWfeuCVv8jS6tNED6YNeAD=i-+wkaoRSDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H5S8VKKBkNyrWfeuCVv8jS6tNED6YNeAD=i-+wkaoRSDQ@mail.gmail.com>

On Sun, Sep 21, 2025 at 09:07:38AM +0800, Huacai Chen wrote:
> Hi, Nathan,
> 
> On Sun, Sep 21, 2025 at 7:48 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Huacai,
> >
> > On Wed, Sep 10, 2025 at 05:10:33PM +0800, Huacai Chen wrote:
> > > ARCH_STRICT_ALIGN is used for hardware without UAL, now it only control
> > > the -mstrict-align flag. However, ACPI structures are packed by default
> > > so will cause unaligned accesses.
> > >
> > > To avoid this, define ACPI_MISALIGNMENT_NOT_SUPPORTED in asm/acenv.h to
> > > align ACPI structures if ARCH_STRICT_ALIGN enabled.
> > >
> > > Cc: stable@vger.kernel.org
> > > Reported-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > Suggested-by: Xi Ruoyao <xry111@xry111.site>
> > > Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > ---
> > > V2: Modify asm/acenv.h instead of Makefile.
> > >
> > >  arch/loongarch/include/asm/acenv.h | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/loongarch/include/asm/acenv.h b/arch/loongarch/include/asm/acenv.h
> > > index 52f298f7293b..483c955f2ae5 100644
> > > --- a/arch/loongarch/include/asm/acenv.h
> > > +++ b/arch/loongarch/include/asm/acenv.h
> > > @@ -10,9 +10,8 @@
> > >  #ifndef _ASM_LOONGARCH_ACENV_H
> > >  #define _ASM_LOONGARCH_ACENV_H
> > >
> > > -/*
> > > - * This header is required by ACPI core, but we have nothing to fill in
> > > - * right now. Will be updated later when needed.
> > > - */
> > > +#ifdef CONFIG_ARCH_STRICT_ALIGN
> > > +#define ACPI_MISALIGNMENT_NOT_SUPPORTED
> > > +#endif /* CONFIG_ARCH_STRICT_ALIGN */
> > >
> > >  #endif /* _ASM_LOONGARCH_ACENV_H */
> >
> > I am seeing several ACPI errors in my QEMU testing after this change in
> > Linus's tree as commit a9d13433fe17 ("LoongArch: Align ACPI structures
> > if ARCH_STRICT_ALIGN enabled").
> >
> >   $ make -skj"$(nproc)" ARCH=loongarch CROSS_COMPILE=loongarch64-linux- clean defconfig vmlinuz.efi
> >   kernel/sched/fair.o: warning: objtool: sched_update_scaling() falls through to next function init_entity_runnable_average()
> >   mm/mempolicy.o: warning: objtool: alloc_pages_bulk_mempolicy_noprof+0x380: stack state mismatch: reg1[30]=-1+0 reg2[30]=-2-80
> >   lib/crypto/mpi/mpih-div.o: warning: objtool: mpihelp_divrem+0x2d0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16
> >   In file included from include/acpi/acpi.h:24,
> >                    from drivers/acpi/acpica/tbprint.c:10:
> >   drivers/acpi/acpica/tbprint.c: In function 'acpi_tb_print_table_header':
> >   include/acpi/actypes.h:530:43: warning: 'strncmp' argument 1 declared attribute 'nonstring' is smaller than the specified bound 8 [-Wstringop-overread]
> >     530 | #define ACPI_VALIDATE_RSDP_SIG(a)       (!strncmp (ACPI_CAST_PTR (char, (a)), ACPI_SIG_RSDP, (sizeof(a) < 8) ? ACPI_NAMESEG_SIZE : 8))
> >         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   drivers/acpi/acpica/tbprint.c:105:20: note: in expansion of macro 'ACPI_VALIDATE_RSDP_SIG'
> >     105 |         } else if (ACPI_VALIDATE_RSDP_SIG(ACPI_CAST_PTR(struct acpi_table_rsdp,
> >         |                    ^~~~~~~~~~~~~~~~~~~~~~
> >   In file included from include/acpi/acpi.h:26:
> >   include/acpi/actbl.h:69:14: note: argument 'signature' declared here
> >      69 |         char signature[ACPI_NAMESEG_SIZE] ACPI_NONSTRING;       /* ASCII table signature */
> >         |              ^~~~~~~~~
> >From this link this seems a comiler issue (at least not an
> arch-specific kernel issue):
> https://github.com/AOSC-Tracking/linux/commit/1e9ee413357ef58dd902f6ec55013d2a2f2043eb
> 

I see that the patch made it into the upstream kernel, now breaking both
mainline and 6.16.y test builds of loongarch64:allmodconfig with gcc.

Since this is apparently intentional, I'll stop build testing
loongarch64:allmodconfig. So far it looks like my qemu tests
are not affected, so I'll continue testing those for the time being.

Guenter
