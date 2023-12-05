Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18156DDB3
	for <loongarch@lists.linux.dev>; Tue,  5 Dec 2023 06:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhAG18VM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA19C433C9
	for <loongarch@lists.linux.dev>; Tue,  5 Dec 2023 06:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701756901;
	bh=5UYj01/J6V6vYTKqjacP/DLnpJNhsbeEqoGUWljLUrs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FhAG18VMYpEpiMi425Dz0GK+JdLpawVj8YRMQqvLalYbiCkOwSzMg7DTEQejEYuye
	 jNdEOjejd43Aof7CUJX0dlOmf6bioWLspmbv7ARXSjDez4HMCCBgm0h4C+V+SbOrIv
	 z7fZTWVmUyNBCnJzcSPIEG7E+0N2AogDaIuabM5mFl3Go5OwwseGKUMmzGRB5M/RFy
	 PRqyC4s/LBEpjEgB3LANgOjsS847aiKHkhlAsWNyL7zRU9dN0/NE1r5cvXVVyaqI95
	 nsqavZGqvohlEjxzGdxfzr255L0Zln9/yzdIT+MnbUBYJy1FGssb2VDVs5NoSufmhx
	 LmDeW5JfR3fQQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-54cc60f3613so2420272a12.2
        for <loongarch@lists.linux.dev>; Mon, 04 Dec 2023 22:15:01 -0800 (PST)
X-Gm-Message-State: AOJu0YyOe7LBB78FP3on+57KWXHVTewA8orO+o23s9qoCYTpIncYY+1T
	xH8YhIU58gv9xZYRfVdgwbtTD7mD6OKIh4kbPr4=
X-Google-Smtp-Source: AGHT+IFXeJQrDggHdQlmtE2vbyhzcqWMjwVbIjhqZwsx7XQxv6YZTbDr3AyV0hxCUzSWJM2YXexlk/9Q9r87Ucz/Cog=
X-Received: by 2002:a50:cdd5:0:b0:54c:b889:9c12 with SMTP id
 h21-20020a50cdd5000000b0054cb8899c12mr1905320edj.18.1701756900264; Mon, 04
 Dec 2023 22:15:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204141938.7230-1-hengqi.chen@gmail.com> <CAAhV-H5-5mCSJ4O3WFSAKM=7ZtjLwQqt3BzVoKuYx94nxkFvTQ@mail.gmail.com>
 <CAEyhmHT28sHhA8edMFuuAi3kWsbsdvDR6Dw8Z02jK4-Fx265tQ@mail.gmail.com>
In-Reply-To: <CAEyhmHT28sHhA8edMFuuAi3kWsbsdvDR6Dw8Z02jK4-Fx265tQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 5 Dec 2023 14:14:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ED+fVBEBiOxkM=pN8D3uziv7drNTO3K9vGJpJ=vaF8A@mail.gmail.com>
Message-ID: <CAAhV-H4ED+fVBEBiOxkM=pN8D3uziv7drNTO3K9vGJpJ=vaF8A@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Remove fatal signed-extension instructions
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, kernel@xen0n.name, yangtiezhu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 1:17=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> On Tue, Dec 5, 2023 at 10:11=E2=80=AFAM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Hengqi,
> >
> > Why privileged bpf programs have no problem?
> >
>
> I guess you mean the `verifier_movsx` test, but this patch does NOT fix i=
t.
> This patch is intended to fix `cls_redirect`, `sockopt_inherit` and
> `verifier_map_ptr_mixing` tests.
Yes, when you replied to me in another email, I thought you got the
root cause of verifier_movsx. So that problem still has no fix by now?

Huacai

>
> > Huacai
> >
> > On Mon, Dec 4, 2023 at 10:20=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.=
com> wrote:
> > >
> > > As reported on mailing list ([0]), several BPF testcases could
> > > triggered kernel panics like:
> > >
> > >     # ./test_progs -t verifier_map_ptr_mixing
> > >     Can't find bpf_testmod.ko kernel module: -2
> > >     WARNING! Selftests relying on bpf_testmod.ko will be skipped.
> > >     [   47.842279] CPU 0 Unable to handle kernel paging request at vi=
rtual address ffffffff9218d000, era =3D=3D 9000000003573ff8, ra =3D=3D ffff=
8000020dbc70
> > >     [   47.843498] Oops[#1]:
> > >     [   47.843870] CPU: 0 PID: 242 Comm: test_progs Not tainted 6.7.0=
-rc2+ #27
> > >     [   47.844308] Hardware name: QEMU QEMU Virtual Machine, BIOS unk=
nown 2/2/2022
> > >     [   47.844850] pc 9000000003573ff8 ra ffff8000020dbc70 tp 9000000=
097618000 sp 900000009761bad0
> > >     [   47.845484] a0 ffffffff9218d000 a1 900000009761bad8 a2 0000000=
000000001 a3 900000009761bc20
> > >     [   47.846097] a4 900000009761bc24 a5 ffffffff9218d000 a6 0000000=
000000021 a7 0000000000000118
> > >     [   47.846643] t0 ffff8000020dbbd8 t1 9000000003573ff8 t2 9000000=
09230dd00 t3 000c65d400000000
> > >     [   47.847220] t4 ffffffffffffffff t5 000000012ea823f8 t6 0000000=
000000000 t7 0000000000000000
> > >     [   47.847753] t8 000000000005b900 u0 900000009761ba88 s9 9000000=
09761bb20 s0 ffff80001b278000
> > >     [   47.848259] s1 0000000000000001 s2 900000009230dd00 s3 9000000=
09761bc20 s4 900000009761bae0
> > >     [   47.848796] s5 0000000000000000 s6 900000000438be20 s7 9000000=
09761bb54 s8 9000000005b967c0
> > >     [   47.849400]    ra: ffff8000020dbc70 bpf_prog_4ecec27f4a4ae8c7_=
pointers_for_lookup_hash_array+0x98/0xe4
> > >     [   47.850543]   ERA: 9000000003573ff8 bpf_map_lookup_elem+0x0/0x=
c
> > >     [   47.851180]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=
=3DCC -WE)
> > >     [   47.852203]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > >     [   47.852592]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
> > >     [   47.852964]  ECFG: 00071c1c (LIE=3D2-4,10-12 VS=3D7)
> > >     [   47.853351] ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D=
0)
> > >     [   47.853706]  BADV: ffffffff9218d000
> > >     [   47.854113]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> > >     [   47.854733] Modules linked in:
> > >     [   47.855261] Process test_progs (pid: 242, threadinfo=3D0000000=
071b66eac, task=3D00000000aa177492)
> > >     [   47.856344] Stack : 900000009761bb58 0000000000000000 00000000=
00000000 900000009761bc24
> > >     [   47.857347]         900000009761bc20 900000009230dd00 00000000=
00000001 ffff80001b278000
> > >     [   47.858064]         900000009761bb80 900000000438becc 00000000=
00000000 900000009761bb68
> > >     [   47.858691]         ffff80001b278048 9000000005254000 90000000=
042ec12c 0000000000000000
> > >     [   47.859332]         0000000000000000 900000009761bb80 00000000=
00000000 0000000000000001
> > >     [   47.859832]         0000000b230f0ab8 0000000000000000 ffff8000=
1b278000 0000000000000000
> > >     [   47.860268]         0000000000000000 8dfb8454e0eb5b83 ffff8000=
1b278000 9000000005b967c0
> > >     [   47.860701]         9000000093c80000 ffff80001b278000 00000000=
00000040 900000009230dd00
> > >     [   47.861190]         900000009393f400 9000000097863400 90000000=
9761bd88 0000000000000000
> > >     [   47.861650]         9000000005254000 900000000438d100 00000000=
00000001 0000000000000001
> > >     [   47.862077]         ...
> > >     [   47.862311] Call Trace:
> > >     [   47.862568] [<9000000003573ff8>] bpf_map_lookup_elem+0x0/0xc
> > >     [   47.863511] [<ffff8000020dbc70>] bpf_prog_4ecec27f4a4ae8c7_poi=
nters_for_lookup_hash_array+0x98/0xe4
> > >     [   47.864150] [<900000000438becc>] bpf_test_run+0x1e4/0x2f0
> > >     [   47.864544] [<900000000438d100>] bpf_prog_test_run_skb+0x314/0=
x67c
> > >     [   47.864934] [<900000000354cd18>] __sys_bpf+0x514/0x26d8
> > >     [   47.865261] [<900000000354f4e8>] sys_bpf+0x18/0x28
> > >     [   47.865596] [<90000000045b6c3c>] do_syscall+0x7c/0x94
> > >     [   47.865932] [<90000000033e1b1c>] handle_syscall+0xbc/0x158
> > >     [   47.866373]
> > >     [   47.866549] Code: 00150317  53fe67ff  542c6841 <2600008c> 28c1=
818c  4c000180  2600008c  28c1a18c  4c000180
> > >     [   47.867381]
> > >     [   47.867749] ---[ end trace 0000000000000000 ]---
> > >     [   47.868514] Kernel panic - not syncing: Fatal exception in int=
errupt
> > >     [   47.870138] Kernel relocated by 0x31c0000
> > >     [   47.870868]  .text @ 0x90000000033c0000
> > >     [   47.871361]  .data @ 0x9000000004690000
> > >     [   47.871777]  .bss  @ 0x9000000005a6e000
> > >     [   47.872612] ---[ end Kernel panic - not syncing: Fatal excepti=
on in interrupt ]---
> > >
> > > Take the `cls_redirect` case as an example:
> > >
> > >     cls_redirect()
> > >       -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480
> > >
> > > The pointer is later signed-extended to 0xfffffffffc00b480 at
> > > `BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
> > > page fault and a kernel panic.
> > >
> > > The `cgrp_ls_tp_btf` test reveals another kind of kernel panic
> > > when handling memory load:
> > >
> > >     ptr =3D bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
> > >                                    BPF_LOCAL_STORAGE_GET_F_CREATE);
> > >
> > > The expression `task->cgroups->dfl_cgrp` involves two memory load.
> > > Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
> > > to perform memory load. But the ldd and ldptrd instructions both
> > > have the side effect that it will signed-extended the imm operand.
> > > Finally, we got the wrong addresses and result in kernel panics.
> > >
> > > Let's get rid of those fatal signed-extension instrutions to fix
> > > the issues. For the first case, no arches do a sext on function
> > > return, the fix should be safe. For the second case, we fallback
> > > to use a generic ldxd instruction.
> > >
> > >   [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjA=
qxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#m78408fe3db883f384406e30e6b2b1f1e=
3fd57c1c
> > >
> > > Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> > > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > > ---
> > >  arch/loongarch/net/bpf_jit.c | 12 ++----------
> > >  1 file changed, 2 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_ji=
t.c
> > > index 169ff8b3915e..d76281efc5b8 100644
> > > --- a/arch/loongarch/net/bpf_jit.c
> > > +++ b/arch/loongarch/net/bpf_jit.c
> > > @@ -911,8 +911,6 @@ static int build_insn(const struct bpf_insn *insn=
, struct jit_ctx *ctx, bool ext
> > >
> > >         /* function return */
> > >         case BPF_JMP | BPF_EXIT:
> > > -               emit_sext_32(ctx, regmap[BPF_REG_0], true);
> > > -
> > >                 if (i =3D=3D ctx->prog->len - 1)
> > >                         break;
> > >
> > > @@ -988,14 +986,8 @@ static int build_insn(const struct bpf_insn *ins=
n, struct jit_ctx *ctx, bool ext
> > >                         }
> > >                         break;
> > >                 case BPF_DW:
> > > -                       if (is_signed_imm12(off)) {
> > > -                               emit_insn(ctx, ldd, dst, src, off);
> > > -                       } else if (is_signed_imm14(off)) {
> > > -                               emit_insn(ctx, ldptrd, dst, src, off)=
;
> > > -                       } else {
> > > -                               move_imm(ctx, t1, off, is32);
> > > -                               emit_insn(ctx, ldxd, dst, src, t1);
> > > -                       }
> > > +                       move_imm(ctx, t1, off, is32);
> > > +                       emit_insn(ctx, ldxd, dst, src, t1);
> > >                         break;
> > >                 }
> > >
> > > --
> > > 2.34.1
> > >
>
