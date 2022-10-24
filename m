Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CD933D3
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 15:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A13AC433C1
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 15:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666623813;
	bh=RYAN8pt1gdhjSz5Zvfh2lWS/69Ah4iwOwzygUzf6hI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lNNiMTUtw3GH4JcYw8ifH24oU0POM++SyBbRVbkShp7LrIZ6uWMnGVFxY8VCSf8x3
	 h1zqfRUrtchXD8mZ1fqzjI6Wf940SVR4T9Sht1pV+MoGfNrksWEqLAQ8f4+181R9Wo
	 M7k4KOLRWrS2JBZWHRCdeHe96kDu0mDBDwBiAF9mFBG341mC+iNypY318Mgwe/yrrD
	 J+2ZNVuzoHWYzU3+ywcNsPxZ+eHEl7E447IkApLkoa+7wOTYg6SXi8r3N1VpS+6NDK
	 IqtGbOppm9uQCcpwrY+XNeAe+9rM+Xuc3WnJcITOgthl0ILAwMV8LRqFjPLIb0NR98
	 91GPybeQ4dpqQ==
Received: by mail-ej1-f42.google.com with SMTP id n12so316850eja.11
        for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 08:03:33 -0700 (PDT)
X-Gm-Message-State: ACrzQf0ExQSEGDqf/AVMb9q76U91mJUhq7EPA3qQbLSoK1Lg/r8yaUID
	LUU/n8ZooqhnUQz2D2CVvhu3pfrYfiGIcfuQ+pg=
X-Google-Smtp-Source: AMsMyM5l0uAv6T2F73xM0Artglcqum1Dlr2U/4nCcorGz0o2GlCpZlmR8EbQjaXQEurbLamdGdxHW3q3jWC24lJe7Cw=
X-Received: by 2002:a17:906:fe45:b0:788:15a5:7495 with SMTP id
 wz5-20020a170906fe4500b0078815a57495mr28398511ejb.633.1666623811701; Mon, 24
 Oct 2022 08:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221024121305.381776-1-kernel@xen0n.name>
In-Reply-To: <20221024121305.381776-1-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 24 Oct 2022 23:03:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7y2MwKvkD116Zp_eF4p4-EO0Ab+E+j+2+O3f1Pwjh9qw@mail.gmail.com>
Message-ID: <CAAhV-H7y2MwKvkD116Zp_eF4p4-EO0Ab+E+j+2+O3f1Pwjh9qw@mail.gmail.com>
Subject: Re: [PATCH 00/13] LoongArch: Better backtraces
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

Generally, I agree to improve the output format, but I don't think we
need to modify the register definitions.

Huacai

On Mon, Oct 24, 2022 at 8:13 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> From: WANG Xuerui <git@xen0n.name>
>
> Hi,
>
> Here are some long overdue cleanups of MIPS legacy stuff from
> arch/loongarch codebase , and a bunch of tweaks to the backtrace code so
> the Quality of Life for unfortunate LoongArch kernel devs (including but
> not limited to, myself) could be marginally improved by relieving them of
> having to mentally decode the register names and CSR bitfields.
>
> Before:
>
> > [   17.879976] $ 0   : 0000000000000000 9000000000cc980c 90000001002cc000 90000001002cfe30
> > [   17.887936] $ 4   : 0000000000000010 9000000000f1f770 90000001002cc000 9000000000cc3468
> > [   17.895895] $ 8   : 900000010028fd00 0000000000000001 000055558e569190 0000000000000004
> > [   17.903853] $12   : 0000000000000000 0000000000000004 9000000001026000 900000000132b2d8
> > [   17.911811] $16   : 9000000001026000 000000006674b539 9000000000d51d10 0000000000000001
> > [   17.919769] $20   : 0000000000000000 900000000025c27c 0000000000000004 0000000000000002
> > [   17.927727] $24   : 900000000102e5b0 900000000102e508 0000000000000000 0000000000000004
> > [   17.935686] $28   : 9000000009007840 0000000000000004 0000000000000000 0000000000000004
> > [   17.943644] era   : 90000000002215a0 __arch_cpu_idle+0x20/0x24
> > [   17.949438] ra    : 9000000000cc980c default_idle_call+0x34/0x5c
> > [   17.955406] CSR crmd: 000000b0
> > [   17.955408] CSR prmd: 00000004
> > [   17.958521] CSR euen: 00000000
> > [   17.961635] CSR ecfg: 00071c1c
> > [   17.964748] CSR estat: 00001000
> > [   17.971062] ExcCode : 0 (SubCode 0)
> > [   17.974522] PrId  : 0014c010 (Loongson-64bit)
>
> After:
>
> > [   45.869200]  pc 90000000002215a0 ra 9000000000ce86bc tp 90000001002cc000
> > [   45.875858]  sp 90000001002cfe30 a0 0000000000000018 a1 9000000000f41ee0
> > [   45.882516]  a2 0000000000000001 a3 000000000000000a a4 90000000098032c0
> > [   45.889173]  a5 000000000000001b a6 000000008ea4398a a7 0000000000000004
> > [   45.895831]  t0 0000000000000000 t1 0000000000000004 t2 0000000000003c00
> > [   45.902488]  t3 0000000000cccccd t4 ffffffffffffffff t5 000000010d1ff6c8
> > [   45.909146]  t6 0000000000000000 t7 0000000000000000 t8 000000000000005b
> > [   45.915803] r21 0000000a390fa6c0 s9 0000000000000001 s0 0000000000000003
> > [   45.922460]  s1 90000000010565c0 s2 9000000001056518 s3 0000000000000000
> > [   45.929118]  s4 0000000000000004 s5 0000000000000004 s6 9000000000228194
> > [   45.935775]  s7 900000000102e220 s8 9000000100093e58
> > [   45.940704]    pc: 90000000002215a0 __arch_cpu_idle+0x20/0x24
> > [   45.946412]    ra: 9000000000ce86bc default_idle_call+0x34/0x5c
> > [   45.952294]  crmd: 000000b0 (-WE DACM=CC DACF=CC +PG -DA -IE PLV0)
> > [   45.958443]  prmd: 00000004 (-PWE +PIE PPLV0)
> > [   45.962772]  euen: 00000000 (-BTE -ASXE -SXE -FPE)
> > [   45.967532]  ecfg: 00071c1c (VS=7 LIE=2-4,10-12)
> > [   45.972119] estat: 00001000 [INT] (EsubCode=0 ECode=0 IS=12)
> > [   45.977741]  prid: 0014c010 (Loongson-64bit)
>
> Please review, and let the bikeshedding begin!
>
> WANG Xuerui (13):
>   LoongArch: Unify CSR.EUEN and CSR.ECFG bitfield names with the ISA
>     manual
>   LoongArch: Rename CSR_ESTAT_EXC -> CSR_ESTAT_ECODE
>   LoongArch: Unify the exception code definitions with the manual
>   LoongArch: Clean up the architectural interrupt definitions
>   LoongArch: Print GPRs with ABI names when showing registers
>   LoongArch: Print symbol info for PC and $ra only for kernel-mode
>     contexts
>   LoongArch: Fix format of CSR lines during show_regs
>   LoongArch: Humanize the CRMD line when showing registers
>   LoongArch: Humanize the PRMD line when showing registers
>   LoongArch: Humanize the EUEN line when showing registers
>   LoongArch: Humanize the ECFG line when showing registers
>   LoongArch: Humanize the ESTAT line when showing registers
>   LoongArch: Use lowercase ISA manual names for BADV and CPUCFG.PRID
>     lines in show_regs
>
>  arch/loongarch/include/asm/fpu.h       |  10 +-
>  arch/loongarch/include/asm/loongarch.h | 147 ++++++++-------
>  arch/loongarch/kernel/fpu.S            |   2 +-
>  arch/loongarch/kernel/irq.c            |   2 +-
>  arch/loongarch/kernel/perf_event.c     |   2 +-
>  arch/loongarch/kernel/process.c        |   2 +-
>  arch/loongarch/kernel/time.c           |   2 +-
>  arch/loongarch/kernel/traps.c          | 245 ++++++++++++++++++++-----
>  arch/loongarch/mm/fault.c              |   4 +-
>  arch/loongarch/mm/tlb.c                |  14 +-
>  drivers/irqchip/irq-loongarch-cpu.c    |   2 +-
>  11 files changed, 294 insertions(+), 138 deletions(-)
>
> --
> 2.38.0
>
>
