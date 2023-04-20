Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059E6539D
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 09:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32F6C433EF
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681984374;
	bh=IUhBu0smrOkBrApj+1ASVhgy2cYfdHh3x0AH5J/y1e4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LqPUz0lrjwO+Pr0nsaEy7D5TfTi3B7vEFn6/2VYLEEi9Rd/BfN1sMKFhpsohjLiyO
	 YMp1DS/EGRU7B0fPPdN5UHS7/2d98ukLi1h/KJ/yfAie95ivq6kODDryVIQQqfrIfa
	 MTnV8GdAVU6b/PH7GzwU1a7rNq06e4jqvTSkQ4k6brf3pybHRPn1a4kSzMC/BjCGwd
	 KhgujLOMwOjKZLIlMwjegYbDv6wyOi0ylQlZUdE1xCSw/WL37CRHs3pMeIi/WVTawF
	 jzVccmQM08eR+o30q/X8f/SxEhlLiRKgeTJ+TbeYTK073AjdolvL1xrHKq3UE09Km7
	 /QJeQ22hFUyNA==
Received: by mail-ej1-f51.google.com with SMTP id xd13so5061244ejb.4
        for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 02:52:54 -0700 (PDT)
X-Gm-Message-State: AAQBX9fNruR5tRoTWhOnUW/ybZAsmkQ46cSd51Wz26H7Qqr9WiHVZaqG
	riqjj700OtBrPRooKySWCWdOz2/T1qYma2Kg+BM=
X-Google-Smtp-Source: AKy350bpvnL1gxo/XroknFJJLrLpcHbwAzEmBwXxaz5Al1tJSoa8XiD8B+aYMluuetKTnB0CRr/OmUZTFNOaoEFF5h4=
X-Received: by 2002:a17:906:72d9:b0:94f:3b07:a708 with SMTP id
 m25-20020a17090672d900b0094f3b07a708mr877825ejl.29.1681984372884; Thu, 20 Apr
 2023 02:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230416060356.3711529-1-kernel@xen0n.name> <CAAhV-H58qSNsx7jNiUmQFT6sScwxaMJT23FUiJdsXNF5Gt1+HA@mail.gmail.com>
 <4bd9b28f-efa8-9503-7fde-082930a4c93f@xen0n.name>
In-Reply-To: <4bd9b28f-efa8-9503-7fde-082930a4c93f@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 20 Apr 2023 17:52:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H68j9VS2worCpVSXZA1ZM-Xene4YEXM6UmjPhmYqnE6CA@mail.gmail.com>
Message-ID: <CAAhV-H68j9VS2worCpVSXZA1ZM-Xene4YEXM6UmjPhmYqnE6CA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] LoongArch: Better backtraces
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 5:43=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 2023/4/20 16:34, Huacai Chen wrote:
> > On Sun, Apr 16, 2023 at 2:04=E2=80=AFPM WANG Xuerui <kernel@xen0n.name>=
 wrote:
> >>
> >> From: WANG Xuerui <git@xen0n.name>
> >>
> >> Hi,
> >>
> >> Here are a bunch of tweaks to the backtrace code, so the Quality of Li=
fe
> >> for unfortunate LoongArch kernel devs (including but not limited to,
> >> myself) could be marginally improved by relieving them of having to
> >> mentally decode the register names and CSR bitfields.
> >>
> >> This is nearly the same as v3 (which received no replies unfortunately=
):
> >> only one patch (the last) is added, which is a by-product of another
> >> patch series (coming soon).
> >>
> >> Before:
> >>
> >>> [   17.879976] $ 0   : 0000000000000000 9000000000cc980c 90000001002c=
c000 90000001002cfe30
> >>> [   17.887936] $ 4   : 0000000000000010 9000000000f1f770 90000001002c=
c000 9000000000cc3468
> >>> [   17.895895] $ 8   : 900000010028fd00 0000000000000001 000055558e56=
9190 0000000000000004
> >>> [   17.903853] $12   : 0000000000000000 0000000000000004 900000000102=
6000 900000000132b2d8
> >>> [   17.911811] $16   : 9000000001026000 000000006674b539 9000000000d5=
1d10 0000000000000001
> >>> [   17.919769] $20   : 0000000000000000 900000000025c27c 000000000000=
0004 0000000000000002
> >>> [   17.927727] $24   : 900000000102e5b0 900000000102e508 000000000000=
0000 0000000000000004
> >>> [   17.935686] $28   : 9000000009007840 0000000000000004 000000000000=
0000 0000000000000004
> >>> [   17.943644] era   : 90000000002215a0 __arch_cpu_idle+0x20/0x24
> >>> [   17.949438] ra    : 9000000000cc980c default_idle_call+0x34/0x5c
> >>> [   17.955406] CSR crmd: 000000b0
> >>> [   17.955408] CSR prmd: 00000004
> >>> [   17.958521] CSR euen: 00000000
> >>> [   17.961635] CSR ecfg: 00071c1c
> >>> [   17.964748] CSR estat: 00001000
> >>> [   17.971062] ExcCode : 0 (SubCode 0)
> >>> [   17.974522] PrId  : 0014c010 (Loongson-64bit)
> >>
> >> After:
> >>
> >>> [  113.936553] tp 90000000010f8000 sp 90000000010fbdc0 a0 00000000000=
00000
> >>> [  113.943125] a1 9000000000ff5158 a2 90000000010f8000 a3 9000000000d=
6233c
> >>> [  113.949696] a4 9000000104603e00 a5 0000000000000000 a6 00000000000=
b9800
> >>> [  113.956267] a7 0000000000000004 t0 0000000000000000 t1 00000000000=
00004
> >>> [  113.962838] t2 900000000110a000 t3 900000000141b5e0 t4 90000000011=
0a000
> >>> [  113.969408] t5 00000002a6d585d7 t6 9000000000e02118 t7 00000000000=
00001
> >>> [  113.975979] t8 0000000000000000 u0 0000001a3dae9000 s9 90000000010=
35c80
> >>> [  113.982550] s0 0000000000000000 s1 90000000011125d0 s2 90000000011=
12528
> >>> [  113.989121] s3 0000000000000000 s4 0000000000000004 s5 90000000055=
21880
> >>> [  113.995692] s6 90000000055218b2 s7 0000000000000000 s8 90000000010=
35c80
> >>> [  114.002263]   era: 9000000000221600 __arch_cpu_idle+0x20/0x24
> >>> [  114.007972]    ra: 9000000000d687f0 default_idle_call+0x34/0x5c
> >>> [  114.013854]  crmd: 000000b0 (-WE DACM=3DCC DACF=3DCC +PG -DA -IE P=
LV0)
> >>> [  114.020005]  prmd: 00000004 (-PWE +PIE PPLV0)
> >>> [  114.024334]  euen: 00000000 (-BTE -ASXE -SXE -FPE)
> >>> [  114.029096]  ecfg: 00071c1d (VS=3D7 LIE=3D0,2-4,10-12)
> >>> [  114.033855] estat: 00001000 [INT] (EsubCode=3D0 ECode=3D0 IS=3D12)
> >>> [  114.039479]  prid: 0014c010 (Loongson-64bit)
> > I prefer upper case for CSR registers (in manual they are all in upper =
case).
>
> I have no particular preference, so this will be changed accordingly in v=
5.
>
> >
> >>
> >> Changes in v4:
> >>
> >> - rebased on top of current loongarch-next
> >> - show CSR.BADV in case of BCE too
> >>
> >> Changes in v3:
> >>
> >> - rebased and tested on top of v6.2-rc8
> >> - restored the "era" name for PC per review suggestion
> >> - show "u0" in case of r21 according to kernel register convention
> >> - removed redundant print of $ra
> >> - print the syscall restart flag if non-zero
> >>
> >> Changes in v2:
> >>
> >> - rebased and tested on top of next-20221226
> >> - removed the mass symbol renamings per Huacai's suggestion (but the
> >>    output still uses the ISA manual names because users are expected t=
o
> >>    be more familiar with those)
> >>
> >> WANG Xuerui (12):
> >>    LoongArch: Clean up the architectural interrupt definitions
> >>    LoongArch: Add exception subcode definitions for the watchpoint
> >>      exception
> >>    LoongArch: Print GPRs with ABI names when showing registers
> >>    LoongArch: Print symbol info for CSR.ERA and $ra only for kernel-mo=
de
> >>      contexts
> >>    LoongArch: Fix format of CSR lines during show_regs
> >>    LoongArch: Humanize the CRMD line when showing registers
> >>    LoongArch: Humanize the PRMD line when showing registers
> >>    LoongArch: Humanize the EUEN line when showing registers
> >>    LoongArch: Humanize the ECFG line when showing registers
> >>    LoongArch: Humanize the ESTAT line when showing registers
> > I think Patch6~10 can be combined in a single patch.
>
> It seems we have different opinions over "what constitutes a logical
> change" ;-)
>
> IMO having more granular changes helps reviews. People's time is more
> often than not fragmented these days, and I bet you'd prefer reviewing 5
> small commits than 1 big hairy commit anyway.
No, I don't like "too small" patches, and I still don't like 3
register per line (even for E-mail clients, short lines will overflow
after several replies).

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
>
