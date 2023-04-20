Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D7F17C9
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 08:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7181C433EF
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681979659;
	bh=Sr0zD2K17MHWwKsBzlUlSVJd6DEKGE6+jy4DK7LwrIY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JpRrgMAcayvFam12Vg+9Cuc4zDsBSkIfdZIkYMQ/p3lai3SBGsSseR9eYiRRgFD87
	 vpfV8mHeriAYW7qfmnF6gICwqQW/S2hHbOfAzETWFh+c4DcyIBcIGdBPlM6fJ/bJyR
	 72h6tmYh9dzcoR0Rezz9vMn0h3DaWsKp4q61rFepNkbD8wsmzs56n4kWKdRS++bCkx
	 2WILhTdQknR6nf13Py7tSdwlY8Gke9gkRQK9xMssWIToWQe0tTOjsnfMCAshkh/dlA
	 fYXBianIkdV9L2QAx6FIBR6valcsS1lYFeXhDc8dhY0B9jtnrvPlRTeqAFOpVcMTcp
	 CI+ywX1QEjsKA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50847469a7fso615087a12.0
        for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 01:34:19 -0700 (PDT)
X-Gm-Message-State: AAQBX9dJqaiIUw5Li7fxuzxt5QSKocLgpAgDWNIeNNnC72RkbgWzgkIo
	KHw85x9n18adlV94AMDKReg1Qt4p3pFa39bwyM4=
X-Google-Smtp-Source: AKy350YW1OMMDn2rEOAGqGFwl7T9LqLIT6e4KP2qGDBy30MdqR0wLNI34tA9CnaKC5jVsWm9HTZWVvXra2g9LP+D9Bw=
X-Received: by 2002:aa7:c907:0:b0:508:4014:ae3a with SMTP id
 b7-20020aa7c907000000b005084014ae3amr995631edt.39.1681979657985; Thu, 20 Apr
 2023 01:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230416060356.3711529-1-kernel@xen0n.name>
In-Reply-To: <20230416060356.3711529-1-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 20 Apr 2023 16:34:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H58qSNsx7jNiUmQFT6sScwxaMJT23FUiJdsXNF5Gt1+HA@mail.gmail.com>
Message-ID: <CAAhV-H58qSNsx7jNiUmQFT6sScwxaMJT23FUiJdsXNF5Gt1+HA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] LoongArch: Better backtraces
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 16, 2023 at 2:04=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
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
> This is nearly the same as v3 (which received no replies unfortunately):
> only one patch (the last) is added, which is a by-product of another
> patch series (coming soon).
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
> > [  113.936553] tp 90000000010f8000 sp 90000000010fbdc0 a0 0000000000000=
000
> > [  113.943125] a1 9000000000ff5158 a2 90000000010f8000 a3 9000000000d62=
33c
> > [  113.949696] a4 9000000104603e00 a5 0000000000000000 a6 00000000000b9=
800
> > [  113.956267] a7 0000000000000004 t0 0000000000000000 t1 0000000000000=
004
> > [  113.962838] t2 900000000110a000 t3 900000000141b5e0 t4 900000000110a=
000
> > [  113.969408] t5 00000002a6d585d7 t6 9000000000e02118 t7 0000000000000=
001
> > [  113.975979] t8 0000000000000000 u0 0000001a3dae9000 s9 9000000001035=
c80
> > [  113.982550] s0 0000000000000000 s1 90000000011125d0 s2 9000000001112=
528
> > [  113.989121] s3 0000000000000000 s4 0000000000000004 s5 9000000005521=
880
> > [  113.995692] s6 90000000055218b2 s7 0000000000000000 s8 9000000001035=
c80
> > [  114.002263]   era: 9000000000221600 __arch_cpu_idle+0x20/0x24
> > [  114.007972]    ra: 9000000000d687f0 default_idle_call+0x34/0x5c
> > [  114.013854]  crmd: 000000b0 (-WE DACM=3DCC DACF=3DCC +PG -DA -IE PLV=
0)
> > [  114.020005]  prmd: 00000004 (-PWE +PIE PPLV0)
> > [  114.024334]  euen: 00000000 (-BTE -ASXE -SXE -FPE)
> > [  114.029096]  ecfg: 00071c1d (VS=3D7 LIE=3D0,2-4,10-12)
> > [  114.033855] estat: 00001000 [INT] (EsubCode=3D0 ECode=3D0 IS=3D12)
> > [  114.039479]  prid: 0014c010 (Loongson-64bit)
I prefer upper case for CSR registers (in manual they are all in upper case=
).

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
I think Patch6~10 can be combined in a single patch.

Huacai

>   LoongArch: Use lowercase ISA manual names for BADV and CPUCFG.PRID
>     lines in show_regs
>   LoongArch: Include CSR.BADV in show_regs in case of BCE exceptions
>
>  arch/loongarch/include/asm/loongarch.h |  60 ++++---
>  arch/loongarch/kernel/irq.c            |   2 +-
>  arch/loongarch/kernel/perf_event.c     |   2 +-
>  arch/loongarch/kernel/time.c           |   2 +-
>  arch/loongarch/kernel/traps.c          | 227 +++++++++++++++++++++----
>  5 files changed, 233 insertions(+), 60 deletions(-)
>
> --
> 2.40.0
>
>
