Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974387C
	for <loongarch@lists.linux.dev>; Sun,  1 Jan 2023 09:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5DEC433D2
	for <loongarch@lists.linux.dev>; Sun,  1 Jan 2023 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672566719;
	bh=UzBas5Tre9zIW9SZ2JEAwKqNxp9RWQzZK7UCQTur3vA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fVNaJr3x/YgwItGm4wvbSFYyC51Ukt75KMz3OezGIglWarQKDBoYa1RZmSG3Jxjpn
	 DfrbhocLTiV6WwBtlknbLe9yEpusVQoznX3PMpDeiJkUWAtGPCNWIV9AE1OSIdhJYQ
	 FUD5xLQfkyz4SwnJSlPYYDo3bKjWYOu/tu7MDxRU/g9Z76IqQoBWRgdvCfcOL45n/Y
	 VRq9amHTRwP/cJwVNK5rGrdKsKCMGvpfxQj5fDxdat/Bside8djx4VYmHUYTJxL8c6
	 28qkbhh0JXNUklFe9gZqVLnfd3AoSAg/NcpoaidMXepbJxxkxA8IkakwxLYzD8JRKu
	 fa0Iulsyk/k7g==
Received: by mail-ej1-f53.google.com with SMTP id gh17so60916810ejb.6
        for <loongarch@lists.linux.dev>; Sun, 01 Jan 2023 01:51:59 -0800 (PST)
X-Gm-Message-State: AFqh2kpXKQBCeG9NdqPcbrch3XTsimZtr4zxRCERn5lqu0DfDN6trYLT
	hIwzJWsJ518sxsFyVmk09bAra5ed12zaT8Uoqh0=
X-Google-Smtp-Source: AMrXdXsFGevJ5t8JzjJ/935Zyx/nx80sqoP6MRMVS2E4wMkzbTLcxoA916a0ToqUHY95+uRhltRaiY9SDmqWoaCFGv0=
X-Received: by 2002:a17:907:bb94:b0:7c1:bb5:7757 with SMTP id
 xo20-20020a170907bb9400b007c10bb57757mr2085342ejc.633.1672566717388; Sun, 01
 Jan 2023 01:51:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221229053306.3285457-1-kernel@xen0n.name>
In-Reply-To: <20221229053306.3285457-1-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Jan 2023 17:51:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H73Am=VHZBpjPtG6ezgxx0We-QGnuvF0XY9O4h6s1BQGQ@mail.gmail.com>
Message-ID: <CAAhV-H73Am=VHZBpjPtG6ezgxx0We-QGnuvF0XY9O4h6s1BQGQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] LoongArch: Better backtraces
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

V2 is better than V1 for me, but I still have some concerns.

On Thu, Dec 29, 2022 at 1:33 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> From: WANG Xuerui <git@xen0n.name>
>
> Hi,
>
> Here are a bunch of tweaks to the backtrace code, so the Quality of Life
> for unfortunate LoongArch kernel devs (including but not limited to,
> myself) could be marginally improved by relieving them of having to
> mentally decode the register names and CSR bitfields.
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
Though r0 is always 0 in hardware, but we use pt_regs->regs[0] for
syscall restart flag, is that sometimes useful? And you give the pc
below, which means something duplicated.

> > [   45.875858]  sp 90000001002cfe30 a0 0000000000000018 a1 9000000000f41ee0
> > [   45.882516]  a2 0000000000000001 a3 000000000000000a a4 90000000098032c0
> > [   45.889173]  a5 000000000000001b a6 000000008ea4398a a7 0000000000000004
> > [   45.895831]  t0 0000000000000000 t1 0000000000000004 t2 0000000000003c00
> > [   45.902488]  t3 0000000000cccccd t4 ffffffffffffffff t5 000000010d1ff6c8
> > [   45.909146]  t6 0000000000000000 t7 0000000000000000 t8 000000000000005b
> > [   45.915803] r21 0000000a390fa6c0 s9 0000000000000001 s0 0000000000000003
In kernel we can use u0 here, I think.

> > [   45.922460]  s1 90000000010565c0 s2 9000000001056518 s3 0000000000000000
> > [   45.929118]  s4 0000000000000004 s5 0000000000000004 s6 9000000000228194
> > [   45.935775]  s7 900000000102e220 s8 9000000100093e58
> > [   45.940704]    pc: 90000000002215a0 __arch_cpu_idle+0x20/0x24
I don't know whether pc is equivalant to era in everyone's brain, but
not in mime. :)

Huacai
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
> Changes in v2:
>
> - rebased and tested on top of next-20221226
> - removed the mass symbol renamings per Huacai's suggestion (but the
>   output still uses the ISA manual names because users are expected to
>   be more familiar with those)
>
> WANG Xuerui (11):
>   LoongArch: Clean up the architectural interrupt definitions
>   LoongArch: Add exception subcode definitions for the watchpoint
>     exception
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
>  arch/loongarch/include/asm/loongarch.h |  60 ++++---
>  arch/loongarch/kernel/irq.c            |   2 +-
>  arch/loongarch/kernel/perf_event.c     |   2 +-
>  arch/loongarch/kernel/time.c           |   2 +-
>  arch/loongarch/kernel/traps.c          | 220 +++++++++++++++++++++----
>  5 files changed, 227 insertions(+), 59 deletions(-)
>
> --
> 2.38.1
>
