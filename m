Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32088182A8
	for <loongarch@lists.linux.dev>; Tue, 12 Dec 2023 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDQdakn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B983DC433CA
	for <loongarch@lists.linux.dev>; Tue, 12 Dec 2023 08:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702369785;
	bh=riZ4bQsxGZbFEsv73XckUmM33m8E0EsoB4mbnufuTMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XDQdakn2uCVU0Z0gjSRVYG9F9GhaYbucyU9wYOZDB68ysExXYC42u3t0HgvItYtgx
	 rasGikIuskQovasAgXxBgZlUQyP4UjGTy5quVaXiU7xicpnbKIeQmr90tNl+48jOsr
	 excJIvF7DUyOuI20WXB6WeGIDN8Xkj5NnxmYaXgKVzSkgDbJR2Uxw42CX2GmCHk2V9
	 WQ6MTFEvN/DawKUeM435SURJEp5SGyKbDBb2In6ka2qz3dn4zyKdO9Aa1VJNYtXCL9
	 sunQUAwuj4U2r94cfPkOcThnOpO05bY3OLYEwObWlNKG7MO8aPyhnmcU3XacVTMRom
	 CrBvrmz0W4WWQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a22ed5f0440so23236666b.1
        for <loongarch@lists.linux.dev>; Tue, 12 Dec 2023 00:29:45 -0800 (PST)
X-Gm-Message-State: AOJu0YyjECqDUWkGD9HzAI7Or5kGbSyguGp0jHCfu9V9w4xrBeQC5YZQ
	kyJ3nWGY7xJBvcub0pg9QH64Un2CCaSSaWZ8QTU=
X-Google-Smtp-Source: AGHT+IEKsxEsNi1OUh0+O1EWICQBjkJBpyiZ/1+aeuTAtCUYEhqmQjQplqJ79BpZAcDdoug4HgpY1p9aFUY5BhbkwF0=
X-Received: by 2002:a17:906:590e:b0:a1b:d62d:8107 with SMTP id
 h14-20020a170906590e00b00a1bd62d8107mr1787651ejq.176.1702369784155; Tue, 12
 Dec 2023 00:29:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231211151105.7473-1-hengqi.chen@gmail.com> <CAAhV-H7jYbBjCc+rvhgwXJhis0xLzqQRPwm7Vi3rKoViTTqNkQ@mail.gmail.com>
 <CAEyhmHSFKoR7h1my5upMd37+MDt8A_pDaeRO0+cUYFbdHGCwRQ@mail.gmail.com>
In-Reply-To: <CAEyhmHSFKoR7h1my5upMd37+MDt8A_pDaeRO0+cUYFbdHGCwRQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 12 Dec 2023 16:29:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4cqBvMRPbzyaOukpgprR4NubcNXhxSUBwncu2O_VsKYQ@mail.gmail.com>
Message-ID: <CAAhV-H4cqBvMRPbzyaOukpgprR4NubcNXhxSUBwncu2O_VsKYQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Prevent out-of-bounds memory access
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, yangtiezhu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 2:30=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> On Tue, Dec 12, 2023 at 9:44=E2=80=AFAM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Hengqi,
> >
> > On Mon, Dec 11, 2023 at 11:11=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail=
.com> wrote:
> > >
> > > The test_tag test triggers an unhandled page fault:
> > >
> > >   # ./test_tag
> > >   [  130.640218] CPU 0 Unable to handle kernel paging request at virt=
ual address ffff80001b898004, era =3D=3D 9000000003137f7c, ra =3D=3D 900000=
0003139e70
> > >   [  130.640501] Oops[#3]:
> > >   [  130.640553] CPU: 0 PID: 1326 Comm: test_tag Tainted: G      D   =
 O       6.7.0-rc4-loong-devel-gb62ab1a397cf #47 61985c1d94084daa2432f771da=
a45b56b10d8d2a
> > >   [  130.640764] Hardware name: QEMU QEMU Virtual Machine, BIOS unkno=
wn 2/2/2022
> > >   [  130.640874] pc 9000000003137f7c ra 9000000003139e70 tp 900000010=
4cb4000 sp 9000000104cb7a40
> > >   [  130.641001] a0 ffff80001b894000 a1 ffff80001b897ff8 a2 000000006=
ba210be a3 0000000000000000
> > >   [  130.641128] a4 000000006ba210be a5 00000000000000f1 a6 000000000=
00000b3 a7 0000000000000000
> > >   [  130.641256] t0 0000000000000000 t1 00000000000007f6 t2 000000000=
0000000 t3 9000000004091b70
> > >   [  130.641387] t4 000000006ba210be t5 0000000000000004 t6 fffffffff=
ffffff0 t7 90000000040913e0
> > >   [  130.641512] t8 0000000000000005 u0 0000000000000dc0 s9 000000000=
0000009 s0 9000000104cb7ae0
> > >   [  130.641641] s1 00000000000007f6 s2 0000000000000009 s3 000000000=
0000095 s4 0000000000000000
> > >   [  130.641771] s5 ffff80001b894000 s6 ffff80001b897fb0 s7 900000000=
4090c50 s8 0000000000000000
> > >   [  130.641900]    ra: 9000000003139e70 build_body+0x1fcc/0x4988
> > >   [  130.642007]   ERA: 9000000003137f7c build_body+0xd8/0x4988
> > >   [  130.642112]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DC=
C -WE)
> > >   [  130.642261]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > >   [  130.642353]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
> > >   [  130.642458]  ECFG: 00071c1c (LIE=3D2-4,10-12 VS=3D7)
> > >   [  130.642554] ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
> > >   [  130.642658]  BADV: ffff80001b898004
> > >   [  130.642719]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> > >   [  130.642815] Modules linked in: [last unloaded: bpf_testmod(O)]
> > >   [  130.642924] Process test_tag (pid: 1326, threadinfo=3D00000000f7=
f4015f, task=3D000000006499f9fd)
> > >   [  130.643062] Stack : 0000000000000000 9000000003380724 0000000000=
000000 0000000104cb7be8
> > >   [  130.643213]         0000000000000000 25af8d9b6e600558 9000000106=
250ea0 9000000104cb7ae0
> > >   [  130.643378]         0000000000000000 0000000000000000 9000000104=
cb7be8 90000000049f6000
> > >   [  130.643538]         0000000000000090 9000000106250ea0 ffff80001b=
894000 ffff80001b894000
> > >   [  130.643685]         00007ffffb917790 900000000313ca94 0000000000=
000000 0000000000000000
> > >   [  130.643831]         ffff80001b894000 0000000000000ff7 0000000000=
000000 9000000100468000
> > >   [  130.643983]         0000000000000000 0000000000000000 0000000000=
000040 25af8d9b6e600558
> > >   [  130.644131]         0000000000000bb7 ffff80001b894048 0000000000=
000000 0000000000000000
> > >   [  130.644276]         9000000104cb7be8 90000000049f6000 0000000000=
000090 9000000104cb7bdc
> > >   [  130.644423]         ffff80001b894000 0000000000000000 00007ffffb=
917790 90000000032acfb0
> > >   [  130.644572]         ...
> > >   [  130.644629] Call Trace:
> > >   [  130.644641] [<9000000003137f7c>] build_body+0xd8/0x4988
> > >   [  130.644785] [<900000000313ca94>] bpf_int_jit_compile+0x228/0x4ec
> > >   [  130.644891] [<90000000032acfb0>] bpf_prog_select_runtime+0x158/0=
x1b0
> > >   [  130.645003] [<90000000032b3504>] bpf_prog_load+0x760/0xb44
> > >   [  130.645089] [<90000000032b6744>] __sys_bpf+0xbb8/0x2588
> > >   [  130.645175] [<90000000032b8388>] sys_bpf+0x20/0x2c
> > >   [  130.645259] [<9000000003f6ab38>] do_syscall+0x7c/0x94
> > >   [  130.645369] [<9000000003121c5c>] handle_syscall+0xbc/0x158
> > >   [  130.645507]
> > >   [  130.645539] Code: 380839f6  380831f9  28412bae <24000ca6> 004081=
ad  0014cb50  004083e8  02bff34c  58008e91
> > >   [  130.645729]
> > >   [  130.646418] ---[ end trace 0000000000000000 ]---
> > >
> > > On my machine, which has CONFIG_PAGE_SIZE_16KB=3Dy, the test failed a=
t loading
> > > a BPF prog with 2039 instructions:
> > >
> > >   prog =3D (struct bpf_prog *)ffff80001b894000
> > >   insn =3D (struct bpf_insn *)(prog->insnsi)ffff80001b894048
> > >   insn + 2039 =3D (struct bpf_insn *)ffff80001b898000 <- end of the p=
age
> > >
> > > In build_insn(), we are trying to access next instruction uncondition=
ally,
> > > i.e. `(insn + 1)->imm`. The address lies in the next page and is not =
owned
> > > by the current process, thus an page fault is inevitable and then seg=
fault.
> > >
> > > So, let's access next instruction only under `dst =3D imm64` context.
> > In this context the next instruction always belongs to the current page=
?
> >
>
> No, but the BPF verifier guarantees that the next instruction exists and =
has
> been copied from user space.
In which cases the next instruction is guaranteed by the BPF verifier
and in which cases is not guaranteed?

Huacai

>
> > Huacai
> > >
> > > With this fix, we have:
> > >
> > >   # ./test_tag
> > >   test_tag: OK (40945 tests)
> > >
> > > Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> > > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > > ---
> > >  arch/loongarch/net/bpf_jit.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_ji=
t.c
> > > index 4fcd6cd6da23..5c634de4ee36 100644
> > > --- a/arch/loongarch/net/bpf_jit.c
> > > +++ b/arch/loongarch/net/bpf_jit.c
> > > @@ -465,7 +465,6 @@ static int build_insn(const struct bpf_insn *insn=
, struct jit_ctx *ctx, bool ext
> > >         const u8 dst =3D regmap[insn->dst_reg];
> > >         const s16 off =3D insn->off;
> > >         const s32 imm =3D insn->imm;
> > > -       const u64 imm64 =3D (u64)(insn + 1)->imm << 32 | (u32)insn->i=
mm;
> > >         const bool is32 =3D BPF_CLASS(insn->code) =3D=3D BPF_ALU || B=
PF_CLASS(insn->code) =3D=3D BPF_JMP32;
> > >
> > >         switch (code) {
> > > @@ -923,8 +922,12 @@ static int build_insn(const struct bpf_insn *ins=
n, struct jit_ctx *ctx, bool ext
> > >
> > >         /* dst =3D imm64 */
> > >         case BPF_LD | BPF_IMM | BPF_DW:
> > > +       {
> > > +               const u64 imm64 =3D (u64)(insn + 1)->imm << 32 | (u32=
)insn->imm;
> > > +
> > >                 move_imm(ctx, dst, imm64, is32);
> > >                 return 1;
> > > +       }
> > >
> > >         /* dst =3D *(size *)(src + off) */
> > >         case BPF_LDX | BPF_MEM | BPF_B:
> > > --
> > > 2.34.1
> > >
> > >
>
