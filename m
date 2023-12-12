Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7B15AE9
	for <loongarch@lists.linux.dev>; Tue, 12 Dec 2023 06:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDdSv8kF"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso3712704fac.1
        for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 22:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702362608; x=1702967408; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJa+wBqRFmqU7TToeQBxWoOM65k0dqHqX2uKXZhwHqI=;
        b=FDdSv8kF2CuWvbwOb3TLQxSGIPDKZjlN2CxB8xXK2LdVN9o8lHPbfcA4zP/2aUSetX
         08Cp69wokankOEnMMSuYDbn8XLa5skUCBHsooueTNQnAcUjvwZH5u8PMS/WtBkkkTURm
         2AAOvJhCcxeZlZ1AIwCFa6ARdDqHwJh/nVrS5Lz2B/T9Vomy26/dtEClEPYgfI8+v1Wd
         7xB8VC60rkYjWPb+1FXYhfh768rKF5h5ZBxcJZvSkHxX1yiTvQTOGF2rSikCEOre6hbi
         7WRxyuyzv2tUzbyoY2k9/MruUy8oS+nPlMmEVOc5XIT5+FinTtaSIpEglNKr/cAshhxD
         1s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702362608; x=1702967408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJa+wBqRFmqU7TToeQBxWoOM65k0dqHqX2uKXZhwHqI=;
        b=L0ZzKVV24+NUdXqtv2ztR8VPK2dt76cgcQ5snDQBgWlYC04KM5XI3EqEGJb4f06VYI
         3xtsAc9l+afLGwe1/nsShRD0a1zugd8C6PkHmxXIgiYzm4zBLc6zSB2yjRkZwjgjPG7d
         EmkdMnuJ3hrhrq5y9bv8MvMIP9AAL7fKlXiuG/eivTD7U/Vf5pL2I8eMW8QfLCLJb3c8
         8Mt9aFdhge6Azp6ykXM26qPM/Fam+99xwEkwc1FemltAw0hZkT2kFqf+jMuFLYWNvxS4
         u1p3VUuE3nMzQRZjy6u4izKeJ2eVneH+ZWTjx42ueCYWBRNsjhV+KVmQmHtQ6qI7ErvX
         lVBA==
X-Gm-Message-State: AOJu0YxP7zg9429P1tJxP8ox2IVUtLt73vNxtggBdWjbgfTriVZg2B4f
	XKcLjYSng8w/Zrk6vUHO/6t/KrDUcnJBJwBiib0=
X-Google-Smtp-Source: AGHT+IFdS+4DGzxiYtv2Ras/J0bSgmgzOlC4f51dH8ylXli4HOmVNmzVdP48PSnUJN8KUPSzLtv78/hlTHpCRAGAvdg=
X-Received: by 2002:a05:6870:cd84:b0:1fb:23:6feb with SMTP id
 xb4-20020a056870cd8400b001fb00236febmr6412474oab.39.1702362608298; Mon, 11
 Dec 2023 22:30:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231211151105.7473-1-hengqi.chen@gmail.com> <CAAhV-H7jYbBjCc+rvhgwXJhis0xLzqQRPwm7Vi3rKoViTTqNkQ@mail.gmail.com>
In-Reply-To: <CAAhV-H7jYbBjCc+rvhgwXJhis0xLzqQRPwm7Vi3rKoViTTqNkQ@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 12 Dec 2023 14:29:57 +0800
Message-ID: <CAEyhmHSFKoR7h1my5upMd37+MDt8A_pDaeRO0+cUYFbdHGCwRQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Prevent out-of-bounds memory access
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, yangtiezhu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 9:44=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Hengqi,
>
> On Mon, Dec 11, 2023 at 11:11=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.c=
om> wrote:
> >
> > The test_tag test triggers an unhandled page fault:
> >
> >   # ./test_tag
> >   [  130.640218] CPU 0 Unable to handle kernel paging request at virtua=
l address ffff80001b898004, era =3D=3D 9000000003137f7c, ra =3D=3D 90000000=
03139e70
> >   [  130.640501] Oops[#3]:
> >   [  130.640553] CPU: 0 PID: 1326 Comm: test_tag Tainted: G      D    O=
       6.7.0-rc4-loong-devel-gb62ab1a397cf #47 61985c1d94084daa2432f771daa4=
5b56b10d8d2a
> >   [  130.640764] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown=
 2/2/2022
> >   [  130.640874] pc 9000000003137f7c ra 9000000003139e70 tp 9000000104c=
b4000 sp 9000000104cb7a40
> >   [  130.641001] a0 ffff80001b894000 a1 ffff80001b897ff8 a2 000000006ba=
210be a3 0000000000000000
> >   [  130.641128] a4 000000006ba210be a5 00000000000000f1 a6 00000000000=
000b3 a7 0000000000000000
> >   [  130.641256] t0 0000000000000000 t1 00000000000007f6 t2 00000000000=
00000 t3 9000000004091b70
> >   [  130.641387] t4 000000006ba210be t5 0000000000000004 t6 fffffffffff=
ffff0 t7 90000000040913e0
> >   [  130.641512] t8 0000000000000005 u0 0000000000000dc0 s9 00000000000=
00009 s0 9000000104cb7ae0
> >   [  130.641641] s1 00000000000007f6 s2 0000000000000009 s3 00000000000=
00095 s4 0000000000000000
> >   [  130.641771] s5 ffff80001b894000 s6 ffff80001b897fb0 s7 90000000040=
90c50 s8 0000000000000000
> >   [  130.641900]    ra: 9000000003139e70 build_body+0x1fcc/0x4988
> >   [  130.642007]   ERA: 9000000003137f7c build_body+0xd8/0x4988
> >   [  130.642112]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC =
-WE)
> >   [  130.642261]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> >   [  130.642353]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
> >   [  130.642458]  ECFG: 00071c1c (LIE=3D2-4,10-12 VS=3D7)
> >   [  130.642554] ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
> >   [  130.642658]  BADV: ffff80001b898004
> >   [  130.642719]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> >   [  130.642815] Modules linked in: [last unloaded: bpf_testmod(O)]
> >   [  130.642924] Process test_tag (pid: 1326, threadinfo=3D00000000f7f4=
015f, task=3D000000006499f9fd)
> >   [  130.643062] Stack : 0000000000000000 9000000003380724 000000000000=
0000 0000000104cb7be8
> >   [  130.643213]         0000000000000000 25af8d9b6e600558 900000010625=
0ea0 9000000104cb7ae0
> >   [  130.643378]         0000000000000000 0000000000000000 9000000104cb=
7be8 90000000049f6000
> >   [  130.643538]         0000000000000090 9000000106250ea0 ffff80001b89=
4000 ffff80001b894000
> >   [  130.643685]         00007ffffb917790 900000000313ca94 000000000000=
0000 0000000000000000
> >   [  130.643831]         ffff80001b894000 0000000000000ff7 000000000000=
0000 9000000100468000
> >   [  130.643983]         0000000000000000 0000000000000000 000000000000=
0040 25af8d9b6e600558
> >   [  130.644131]         0000000000000bb7 ffff80001b894048 000000000000=
0000 0000000000000000
> >   [  130.644276]         9000000104cb7be8 90000000049f6000 000000000000=
0090 9000000104cb7bdc
> >   [  130.644423]         ffff80001b894000 0000000000000000 00007ffffb91=
7790 90000000032acfb0
> >   [  130.644572]         ...
> >   [  130.644629] Call Trace:
> >   [  130.644641] [<9000000003137f7c>] build_body+0xd8/0x4988
> >   [  130.644785] [<900000000313ca94>] bpf_int_jit_compile+0x228/0x4ec
> >   [  130.644891] [<90000000032acfb0>] bpf_prog_select_runtime+0x158/0x1=
b0
> >   [  130.645003] [<90000000032b3504>] bpf_prog_load+0x760/0xb44
> >   [  130.645089] [<90000000032b6744>] __sys_bpf+0xbb8/0x2588
> >   [  130.645175] [<90000000032b8388>] sys_bpf+0x20/0x2c
> >   [  130.645259] [<9000000003f6ab38>] do_syscall+0x7c/0x94
> >   [  130.645369] [<9000000003121c5c>] handle_syscall+0xbc/0x158
> >   [  130.645507]
> >   [  130.645539] Code: 380839f6  380831f9  28412bae <24000ca6> 004081ad=
  0014cb50  004083e8  02bff34c  58008e91
> >   [  130.645729]
> >   [  130.646418] ---[ end trace 0000000000000000 ]---
> >
> > On my machine, which has CONFIG_PAGE_SIZE_16KB=3Dy, the test failed at =
loading
> > a BPF prog with 2039 instructions:
> >
> >   prog =3D (struct bpf_prog *)ffff80001b894000
> >   insn =3D (struct bpf_insn *)(prog->insnsi)ffff80001b894048
> >   insn + 2039 =3D (struct bpf_insn *)ffff80001b898000 <- end of the pag=
e
> >
> > In build_insn(), we are trying to access next instruction unconditional=
ly,
> > i.e. `(insn + 1)->imm`. The address lies in the next page and is not ow=
ned
> > by the current process, thus an page fault is inevitable and then segfa=
ult.
> >
> > So, let's access next instruction only under `dst =3D imm64` context.
> In this context the next instruction always belongs to the current page?
>

No, but the BPF verifier guarantees that the next instruction exists and ha=
s
been copied from user space.

> Huacai
> >
> > With this fix, we have:
> >
> >   # ./test_tag
> >   test_tag: OK (40945 tests)
> >
> > Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 4fcd6cd6da23..5c634de4ee36 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -465,7 +465,6 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
> >         const u8 dst =3D regmap[insn->dst_reg];
> >         const s16 off =3D insn->off;
> >         const s32 imm =3D insn->imm;
> > -       const u64 imm64 =3D (u64)(insn + 1)->imm << 32 | (u32)insn->imm=
;
> >         const bool is32 =3D BPF_CLASS(insn->code) =3D=3D BPF_ALU || BPF=
_CLASS(insn->code) =3D=3D BPF_JMP32;
> >
> >         switch (code) {
> > @@ -923,8 +922,12 @@ static int build_insn(const struct bpf_insn *insn,=
 struct jit_ctx *ctx, bool ext
> >
> >         /* dst =3D imm64 */
> >         case BPF_LD | BPF_IMM | BPF_DW:
> > +       {
> > +               const u64 imm64 =3D (u64)(insn + 1)->imm << 32 | (u32)i=
nsn->imm;
> > +
> >                 move_imm(ctx, dst, imm64, is32);
> >                 return 1;
> > +       }
> >
> >         /* dst =3D *(size *)(src + off) */
> >         case BPF_LDX | BPF_MEM | BPF_B:
> > --
> > 2.34.1
> >
> >
