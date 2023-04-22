Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F607F
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 06:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450DCC433D2
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682146717;
	bh=nsdoG1QuSOg4ZryWvs/VQ81TmZ57eq0sC3/6e4Ym/nM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c4JHYQDBm0fwLVtPPJoVzPtysqNMVschfxWM64spnJK6qqOj7HKil37E41VBeSY2q
	 oOHEAZDKVc/++akxKRtoa5KGfGs9ud8abWef5P5pOgcfsyFQmIzIjGkZSoS2QJt/cs
	 oL756rBXCx8j96jXfdPeySMKaoj+eY90y0XrjA28rMBEFBSpoBR0Ot39bndw7NyqEk
	 ixJf7h6BbiQ1aEKzjYbBbbifpMB8x0ARkSvWG8eyaTCXPoaq58k/C/X5IeFxlueda9
	 2opCjFogiaZDhG8JJoMbMf+YQgDomSy9hLou5ShL4BTx7vDdM5/9CQ8kzIqNF5OSl6
	 VkZ6Wd0TEr0nw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-50847469a7fso3547370a12.0
        for <loongarch@lists.linux.dev>; Fri, 21 Apr 2023 23:58:37 -0700 (PDT)
X-Gm-Message-State: AAQBX9eK/zideweIH6gX4C7mjaEPAElw5roVbz7ArerXmpfHZzSPz5LH
	jgccoU188/t7ADvOJ9mh7TLKS7xlBHCD4YpBo1o=
X-Google-Smtp-Source: AKy350bbjgI0B0GlQxnB2R2Br4rTM/6GUMm/5XCkkxGBqcgHpMCiH04RhTZhjn+9kAOwkTiwmaHxAO5PcRnn98XKvrs=
X-Received: by 2002:a17:906:e253:b0:957:1268:e611 with SMTP id
 gq19-20020a170906e25300b009571268e611mr4645287ejb.1.1682146715405; Fri, 21
 Apr 2023 23:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230421114908.2970567-1-kernel@xen0n.name>
In-Reply-To: <20230421114908.2970567-1-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 22 Apr 2023 14:58:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4_Ai9PCYXU+zEZnrsj96DuNw32hngUmqzT3yNi==yAhA@mail.gmail.com>
Message-ID: <CAAhV-H4_Ai9PCYXU+zEZnrsj96DuNw32hngUmqzT3yNi==yAhA@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] LoongArch: Better backtraces
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Xuerui,

On Fri, Apr 21, 2023 at 7:49=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
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
> Finally, the long-awaited bikeshedding has happened after v4 was posted,
> although outside of the mailing lists because everyone else preferred to
> talk in Chinese real-time ;-) Notably v5 has retained the 4x8 grid
> layout of GPRs because many developers on Loongson hardware are used to
> the previous style. The CSR names and the name for the CPUCFG.PRID leaf
> are also shown in upper-case for consistency with the official manuals.
>
> Before:
>
> > [   17.879976] $ 0   : 0000000000000000 9000000000cc980c 90000001002cc0=
00 90000001002cfe30
> > [   17.887936] $ 4   : 0000000000000010 9000000000f1f770 90000001002cc0=
00 9000000000cc3468
> > [   17.895895] $ 8   : 900000010028fd00 0000000000000001 000055558e5691=
90 0000000000000004
> > [   17.903853] $12   : 0000000000000000 0000000000000004 90000000010260=
00 900000000132b2d8
> > [   17.911811] $16   : 9000000001026000 000000006674b539 9000000000d51d=
10 0000000000000001
> > [   17.919769] $20   : 0000000000000000 900000000025c27c 00000000000000=
04 0000000000000002
> > [   17.927727] $24   : 900000000102e5b0 900000000102e508 00000000000000=
00 0000000000000004
> > [   17.935686] $28   : 9000000009007840 0000000000000004 00000000000000=
00 0000000000000004
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
> > [  187.882746]                     ra 9000000002ea8e30 tp 9000000003294=
000 sp 9000000003297db0
I think we can fill this blank with pc, as in an early version.

> > [  187.891047] a0 0000000000000000 a1 900000000318ede8 a2 0000000000000=
001 a3 000000000000000a
> > [  187.899347] a4 9000000100297e00 a5 0000000000000001 a6 0000000000000=
02d a7 0000000000000004
> > [  187.907646] t0 0000000000000000 t1 0000000000000001 t2 0000000000003=
c00 t3 0000000000cccccd
> > [  187.915946] t4 ffffffffffffffff t5 000000045f5d556c t6 0000000000000=
000 t7 0000000000000001
> > [  187.924245] t8 0000000000000000 u0 0000002b6fd7b000 s9 90000000031d0=
2f0 s0 0000000000000004
> > [  187.932543] s1 90000000032ae5d0 s2 90000000032ae528 s3 0000000000000=
000 s4 0000000000000004
> > [  187.940842] s5 9000000000571880 s6 90000000005718b2 s7 0000000000000=
000 s8 90000000031d02f0
> > [  187.949141]   ERA: 9000000002351640 __arch_cpu_idle+0x20/0x24
> > [  187.954852]    ra: 9000000002ea8e30 arch_cpu_idle+0x1c/0x34
If ra should be in lower case, try to exchange it with the ERA line.

> > [  187.960391]  CRMD: 000000b0 (-WE DACM=3DCC DACF=3DCC +PG -DA -IE PLV=
0)
> > [  187.966542]  PRMD: 00000004 (-PWE +PIE PPLV0)
> > [  187.970871]  EUEN: 00000000 (-BTE -ASXE -SXE -FPE)
> > [  187.975633]  ECFG: 00071c1d (VS=3D7 LIE=3D0,2-4,10-12)
> > [  187.980394] ESTAT: 00000004 [INT] (EsubCode=3D0 ECode=3D0 IS=3D2)
> > [  187.985931]  PRID: 0014c010 (Loongson-64bit)
>
> Changes in v5:
>
> - rebased on top of current loongarch-next
> - reverted to 4x8 layout for the GPRs
> - show $ra twice (once in the GPRs, once below with symbol info) for
>   prettier grid
> - use upper-case field names where applicable
>
> Changes in v4:
>
> - rebased on top of current loongarch-next
> - show CSR.BADV in case of BCE too
>
> Changes in v3:
>
> - rebased and tested on top of v6.2-rc8
> - restored the "era" name for PC per review suggestion
> - show "u0" in case of r21 according to kernel register convention
> - removed redundant print of $ra
> - print the syscall restart flag if non-zero
>
> Changes in v2:
>
> - rebased and tested on top of next-20221226
> - removed the mass symbol renamings per Huacai's suggestion (but the
>   output still uses the ISA manual names because users are expected to
>   be more familiar with those)
>
> WANG Xuerui (12):
>   LoongArch: Clean up the architectural interrupt definitions
>   LoongArch: Add exception subcode definitions for the watchpoint
>     exception
>   LoongArch: Print GPRs with ABI names when showing registers
>   LoongArch: Print symbol info for CSR.ERA and $ra only for kernel-mode
>     contexts
>   LoongArch: Fix format of CSR lines during show_regs
>   LoongArch: Humanize the CRMD line when showing registers
>   LoongArch: Humanize the PRMD line when showing registers
>   LoongArch: Humanize the EUEN line when showing registers
>   LoongArch: Humanize the ECFG line when showing registers
>   LoongArch: Humanize the ESTAT line when showing registers
>   LoongArch: Use ISA manual names for BADV and CPUCFG.PRID lines in
>     show_regs
>   LoongArch: Include CSR.BADV in show_regs in case of BCE exceptions
>
>  arch/loongarch/include/asm/loongarch.h |  51 +++---
>  arch/loongarch/kernel/irq.c            |   2 +-
>  arch/loongarch/kernel/perf_event.c     |   2 +-
>  arch/loongarch/kernel/time.c           |   2 +-
>  arch/loongarch/kernel/traps.c          | 225 +++++++++++++++++++++----
>  5 files changed, 222 insertions(+), 60 deletions(-)
>
> --
> 2.40.0
>
>
