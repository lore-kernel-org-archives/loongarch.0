Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55DD263
	for <loongarch@lists.linux.dev>; Tue,  5 Dec 2023 05:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPp5olTO"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6d9ae075e5fso416668a34.0
        for <loongarch@lists.linux.dev>; Mon, 04 Dec 2023 21:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701753137; x=1702357937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPpVOQJQziCV41TQdHYvGq4672lVB0zzxJQ6LZ3f1/8=;
        b=NPp5olTOoTa818844WLU5jq8leaIW2huyJDC/D2dgDJjNbO18I9eBJwED7Y54zW81I
         91ypzseZHDmSGILKFCrPDon2ECwKFLfb7mI3EkC7RSnDQE9JXvzkruZI/xgY3NeoGovq
         +VjgpHDu4dW+TYlsGiIHKKcEsVTXux3bKwujDwpl4ZsHoY4pJSfs/WNj3pAGAS125bEy
         IHl+KReo62IFtcR9LayajUxXY0H7y+S5OrYjkn28e980Ns5Dax7WpstmjnC3B1g9Bwfq
         QLdDuNTnXAGA6aV7LpOHaFwAGMv9jmMRE1CR26oQ7PVf55xACQpCvZ/8ChOwYz8X8EWT
         g6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701753137; x=1702357937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPpVOQJQziCV41TQdHYvGq4672lVB0zzxJQ6LZ3f1/8=;
        b=ftEwsr/4dQ3YkuTqh2JrgmAIZ6Ef2sw3jlhnaxHP7a0AZIr/9xYvr++41w5Z6n5N57
         OpfH6frNcRcDLijnmamGT5cKD8ObC+jLH+6KX6vq54Hkza5jisHYGCS6EBwNLWHguG79
         BxZcyg4jIm194Wl+2FjxNLGBUFMR7ISF5fRy7yR0HR0W2u5RmQ+foNeox4GscXTyvOTJ
         jP+UpU1+fNzhVlS/UUjbahBwzpBSu6unynaofBeMpkPRax47SwYB7nvNB6xNGKGkFJvG
         OQZ6bYA2jNZdORwH8QOmqFopN3/zIGaH61zRokUm9gg9EpZ1ofSBYs1jTEtQe+NqT9qn
         NNyg==
X-Gm-Message-State: AOJu0YzHHqINStuRhp0H5Rw0LgS4t30RtPufoK90kRTdVIQxoeuQ3JsS
	9ev+Nzwv5O/BL2HPW6HchZzhBkxybUi6h+bJLlIpzyX9Nu0=
X-Google-Smtp-Source: AGHT+IEVThivRIVtszFPp70dXL4Ft/ZhQMM8zLxMkvpvsStExm9B81bUjlTSv8HdFYVUtwWatLw9RtGK2ILTg5SgfhE=
X-Received: by 2002:a05:6870:3106:b0:1fa:db2d:628c with SMTP id
 v6-20020a056870310600b001fadb2d628cmr397356oaa.8.1701753136794; Mon, 04 Dec
 2023 21:12:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204141938.7230-1-hengqi.chen@gmail.com> <3db2436e-1f17-3e6a-2523-9090e2135b88@loongson.cn>
In-Reply-To: <3db2436e-1f17-3e6a-2523-9090e2135b88@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 5 Dec 2023 13:12:05 +0800
Message-ID: <CAEyhmHTf6K8PY=4+B7R6yOJicJ-YPOiUjtus3g0t-7Yt-SOBaw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Remove fatal signed-extension instructions
To: Jinyang He <hejinyang@loongson.cn>
Cc: loongarch@lists.linux.dev, chenhuacai@kernel.org, kernel@xen0n.name, 
	yangtiezhu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 9:21=E2=80=AFAM Jinyang He <hejinyang@loongson.cn> w=
rote:
>
>
> On 2023-12-04 22:19, Hengqi Chen wrote:
> > As reported on mailing list ([0]), several BPF testcases could
> > triggered kernel panics like:
> >
> >      # ./test_progs -t verifier_map_ptr_mixing
> >      Can't find bpf_testmod.ko kernel module: -2
> >      WARNING! Selftests relying on bpf_testmod.ko will be skipped.
> >      [   47.842279] CPU 0 Unable to handle kernel paging request at vir=
tual address ffffffff9218d000, era =3D=3D 9000000003573ff8, ra =3D=3D ffff8=
000020dbc70
> >      [   47.843498] Oops[#1]:
> >      [   47.843870] CPU: 0 PID: 242 Comm: test_progs Not tainted 6.7.0-=
rc2+ #27
> >      [   47.844308] Hardware name: QEMU QEMU Virtual Machine, BIOS unkn=
own 2/2/2022
> >      [   47.844850] pc 9000000003573ff8 ra ffff8000020dbc70 tp 90000000=
97618000 sp 900000009761bad0
> >      [   47.845484] a0 ffffffff9218d000 a1 900000009761bad8 a2 00000000=
00000001 a3 900000009761bc20
> >      [   47.846097] a4 900000009761bc24 a5 ffffffff9218d000 a6 00000000=
00000021 a7 0000000000000118
> >      [   47.846643] t0 ffff8000020dbbd8 t1 9000000003573ff8 t2 90000000=
9230dd00 t3 000c65d400000000
> >      [   47.847220] t4 ffffffffffffffff t5 000000012ea823f8 t6 00000000=
00000000 t7 0000000000000000
> >      [   47.847753] t8 000000000005b900 u0 900000009761ba88 s9 90000000=
9761bb20 s0 ffff80001b278000
> >      [   47.848259] s1 0000000000000001 s2 900000009230dd00 s3 90000000=
9761bc20 s4 900000009761bae0
> >      [   47.848796] s5 0000000000000000 s6 900000000438be20 s7 90000000=
9761bb54 s8 9000000005b967c0
> >      [   47.849400]    ra: ffff8000020dbc70 bpf_prog_4ecec27f4a4ae8c7_p=
ointers_for_lookup_hash_array+0x98/0xe4
> >      [   47.850543]   ERA: 9000000003573ff8 bpf_map_lookup_elem+0x0/0xc
> >      [   47.851180]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3D=
CC -WE)
> >      [   47.852203]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> >      [   47.852592]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
> >      [   47.852964]  ECFG: 00071c1c (LIE=3D2-4,10-12 VS=3D7)
> >      [   47.853351] ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0=
)
> >      [   47.853706]  BADV: ffffffff9218d000
> >      [   47.854113]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> >      [   47.854733] Modules linked in:
> >      [   47.855261] Process test_progs (pid: 242, threadinfo=3D00000000=
71b66eac, task=3D00000000aa177492)
> >      [   47.856344] Stack : 900000009761bb58 0000000000000000 000000000=
0000000 900000009761bc24
> >      [   47.857347]         900000009761bc20 900000009230dd00 000000000=
0000001 ffff80001b278000
> >      [   47.858064]         900000009761bb80 900000000438becc 000000000=
0000000 900000009761bb68
> >      [   47.858691]         ffff80001b278048 9000000005254000 900000000=
42ec12c 0000000000000000
> >      [   47.859332]         0000000000000000 900000009761bb80 000000000=
0000000 0000000000000001
> >      [   47.859832]         0000000b230f0ab8 0000000000000000 ffff80001=
b278000 0000000000000000
> >      [   47.860268]         0000000000000000 8dfb8454e0eb5b83 ffff80001=
b278000 9000000005b967c0
> >      [   47.860701]         9000000093c80000 ffff80001b278000 000000000=
0000040 900000009230dd00
> >      [   47.861190]         900000009393f400 9000000097863400 900000009=
761bd88 0000000000000000
> >      [   47.861650]         9000000005254000 900000000438d100 000000000=
0000001 0000000000000001
> >      [   47.862077]         ...
> >      [   47.862311] Call Trace:
> >      [   47.862568] [<9000000003573ff8>] bpf_map_lookup_elem+0x0/0xc
> >      [   47.863511] [<ffff8000020dbc70>] bpf_prog_4ecec27f4a4ae8c7_poin=
ters_for_lookup_hash_array+0x98/0xe4
> >      [   47.864150] [<900000000438becc>] bpf_test_run+0x1e4/0x2f0
> >      [   47.864544] [<900000000438d100>] bpf_prog_test_run_skb+0x314/0x=
67c
> >      [   47.864934] [<900000000354cd18>] __sys_bpf+0x514/0x26d8
> >      [   47.865261] [<900000000354f4e8>] sys_bpf+0x18/0x28
> >      [   47.865596] [<90000000045b6c3c>] do_syscall+0x7c/0x94
> >      [   47.865932] [<90000000033e1b1c>] handle_syscall+0xbc/0x158
> >      [   47.866373]
> >      [   47.866549] Code: 00150317  53fe67ff  542c6841 <2600008c> 28c18=
18c  4c000180  2600008c  28c1a18c  4c000180
> >      [   47.867381]
> >      [   47.867749] ---[ end trace 0000000000000000 ]---
> >      [   47.868514] Kernel panic - not syncing: Fatal exception in inte=
rrupt
> >      [   47.870138] Kernel relocated by 0x31c0000
> >      [   47.870868]  .text @ 0x90000000033c0000
> >      [   47.871361]  .data @ 0x9000000004690000
> >      [   47.871777]  .bss  @ 0x9000000005a6e000
> >      [   47.872612] ---[ end Kernel panic - not syncing: Fatal exceptio=
n in interrupt ]---
> >
> > Take the `cls_redirect` case as an example:
> >
> >      cls_redirect()
> >        -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480
> >
> > The pointer is later signed-extended to 0xfffffffffc00b480 at
> > `BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
> > page fault and a kernel panic.
> >
> > The `cgrp_ls_tp_btf` test reveals another kind of kernel panic
> > when handling memory load:
> >
> >      ptr =3D bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
> >                                  BPF_LOCAL_STORAGE_GET_F_CREATE);
> >
> > The expression `task->cgroups->dfl_cgrp` involves two memory load.
> > Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
> > to perform memory load. But the ldd and ldptrd instructions both
> > have the side effect that it will signed-extended the imm operand.
> > Finally, we got the wrong addresses and result in kernel panics.
> >
> > Let's get rid of those fatal signed-extension instrutions to fix
> > the issues. For the first case, no arches do a sext on function
> > return, the fix should be safe. For the second case, we fallback
> > to use a generic ldxd instruction.
> >
> >    [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAq=
xy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#m78408fe3db883f384406e30e6b2b1f1e3=
fd57c1c
> >
> > Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >   arch/loongarch/net/bpf_jit.c | 12 ++----------
> >   1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 169ff8b3915e..d76281efc5b8 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -911,8 +911,6 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
> >
> >       /* function return */
> >       case BPF_JMP | BPF_EXIT:
> > -             emit_sext_32(ctx, regmap[BPF_REG_0], true);
> > -
> >               if (i =3D=3D ctx->prog->len - 1)
> >                       break;
> >
> > @@ -988,14 +986,8 @@ static int build_insn(const struct bpf_insn *insn,=
 struct jit_ctx *ctx, bool ext
> >                       }
> >                       break;
> >               case BPF_DW:
> > -                     if (is_signed_imm12(off)) {
> > -                             emit_insn(ctx, ldd, dst, src, off);
> > -                     } else if (is_signed_imm14(off)) {
> > -                             emit_insn(ctx, ldptrd, dst, src, off);
>
> I suspect there are some bugs with other ldptr.{w,d} and stptr.{w.d}.
> Because their offsets are 4-bytes aligned 16-bit signed numbers.
>
> [1]
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html=
#_ldptr_wd_stptr_wd
>
>

Probably, but I am inclined to keep it as it is for now since there
are no issues exposed.

> Thanks.
>
> > -                     } else {
> > -                             move_imm(ctx, t1, off, is32);
> > -                             emit_insn(ctx, ldxd, dst, src, t1);
> > -                     }
> > +                     move_imm(ctx, t1, off, is32);
> > +                     emit_insn(ctx, ldxd, dst, src, t1);
> >                       break;
> >               }
> >
>
