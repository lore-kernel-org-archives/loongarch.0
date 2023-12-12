Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96FEA8
	for <loongarch@lists.linux.dev>; Tue, 12 Dec 2023 01:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qzBFPziP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E653DC433C8
	for <loongarch@lists.linux.dev>; Tue, 12 Dec 2023 01:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702345468;
	bh=xtvojjSM14sPuC0ZGCFG7rv/l40b/P2ZK/t/gT1JVIc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qzBFPziP9vS3y2hN+vQXub4UrEESv7HJH7guNDjc8z7xufRVmKhD/E7BRfpRwiOuP
	 NNIsYBX0JFyBH/pjzR5jdtZLjMhrOkbTiHTbjLSiD9sPlhVoxqPHCeCVKUfKh0G3Zv
	 CnbrHeFMAB5bj+EcRohkgNvbT/W4GwGuNV/UL81D6cyIeQLbgnHONDIQBH4y6mD9Gf
	 EOcJbkJ2DRIicoLcxq7GwNZ79KM1AFUFnqv6ZtWZPwxsuXU0m6kKtJm7zSWFKT8O9/
	 4boQ48MEEKG5iwdZSMYFqz3uGs/IIJm3+q1TM3uClsyIJY+1cTanLzz2X2/wkYsOq1
	 /i6wB4UTo6e+A==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-548f853fc9eso7085593a12.1
        for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 17:44:28 -0800 (PST)
X-Gm-Message-State: AOJu0YznXBWwPn3gS6OaauCVAGvkcufzFR951K9B+AtuKEsf1BzE9uYX
	PGQKRHWcHlGhk43kDNQF6utwM185MqYkriZFIms=
X-Google-Smtp-Source: AGHT+IGEYAa/TEe11AN8yJJhAJZHgN0UlYn6uCsQtn8c2qPCa8GdK93IOSYCfHS63dYZuLvdfvH7fujddsvpjf2NXgQ=
X-Received: by 2002:a50:cc04:0:b0:54f:5235:1987 with SMTP id
 m4-20020a50cc04000000b0054f52351987mr1932706edi.85.1702345467310; Mon, 11 Dec
 2023 17:44:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231211151105.7473-1-hengqi.chen@gmail.com>
In-Reply-To: <20231211151105.7473-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 12 Dec 2023 09:44:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7jYbBjCc+rvhgwXJhis0xLzqQRPwm7Vi3rKoViTTqNkQ@mail.gmail.com>
Message-ID: <CAAhV-H7jYbBjCc+rvhgwXJhis0xLzqQRPwm7Vi3rKoViTTqNkQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Prevent out-of-bounds memory access
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, yangtiezhu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi,

On Mon, Dec 11, 2023 at 11:11=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
>
> The test_tag test triggers an unhandled page fault:
>
>   # ./test_tag
>   [  130.640218] CPU 0 Unable to handle kernel paging request at virtual =
address ffff80001b898004, era =3D=3D 9000000003137f7c, ra =3D=3D 9000000003=
139e70
>   [  130.640501] Oops[#3]:
>   [  130.640553] CPU: 0 PID: 1326 Comm: test_tag Tainted: G      D    O  =
     6.7.0-rc4-loong-devel-gb62ab1a397cf #47 61985c1d94084daa2432f771daa45b=
56b10d8d2a
>   [  130.640764] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2=
/2/2022
>   [  130.640874] pc 9000000003137f7c ra 9000000003139e70 tp 9000000104cb4=
000 sp 9000000104cb7a40
>   [  130.641001] a0 ffff80001b894000 a1 ffff80001b897ff8 a2 000000006ba21=
0be a3 0000000000000000
>   [  130.641128] a4 000000006ba210be a5 00000000000000f1 a6 0000000000000=
0b3 a7 0000000000000000
>   [  130.641256] t0 0000000000000000 t1 00000000000007f6 t2 0000000000000=
000 t3 9000000004091b70
>   [  130.641387] t4 000000006ba210be t5 0000000000000004 t6 fffffffffffff=
ff0 t7 90000000040913e0
>   [  130.641512] t8 0000000000000005 u0 0000000000000dc0 s9 0000000000000=
009 s0 9000000104cb7ae0
>   [  130.641641] s1 00000000000007f6 s2 0000000000000009 s3 0000000000000=
095 s4 0000000000000000
>   [  130.641771] s5 ffff80001b894000 s6 ffff80001b897fb0 s7 9000000004090=
c50 s8 0000000000000000
>   [  130.641900]    ra: 9000000003139e70 build_body+0x1fcc/0x4988
>   [  130.642007]   ERA: 9000000003137f7c build_body+0xd8/0x4988
>   [  130.642112]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -W=
E)
>   [  130.642261]  PRMD: 00000004 (PPLV0 +PIE -PWE)
>   [  130.642353]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
>   [  130.642458]  ECFG: 00071c1c (LIE=3D2-4,10-12 VS=3D7)
>   [  130.642554] ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
>   [  130.642658]  BADV: ffff80001b898004
>   [  130.642719]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
>   [  130.642815] Modules linked in: [last unloaded: bpf_testmod(O)]
>   [  130.642924] Process test_tag (pid: 1326, threadinfo=3D00000000f7f401=
5f, task=3D000000006499f9fd)
>   [  130.643062] Stack : 0000000000000000 9000000003380724 00000000000000=
00 0000000104cb7be8
>   [  130.643213]         0000000000000000 25af8d9b6e600558 9000000106250e=
a0 9000000104cb7ae0
>   [  130.643378]         0000000000000000 0000000000000000 9000000104cb7b=
e8 90000000049f6000
>   [  130.643538]         0000000000000090 9000000106250ea0 ffff80001b8940=
00 ffff80001b894000
>   [  130.643685]         00007ffffb917790 900000000313ca94 00000000000000=
00 0000000000000000
>   [  130.643831]         ffff80001b894000 0000000000000ff7 00000000000000=
00 9000000100468000
>   [  130.643983]         0000000000000000 0000000000000000 00000000000000=
40 25af8d9b6e600558
>   [  130.644131]         0000000000000bb7 ffff80001b894048 00000000000000=
00 0000000000000000
>   [  130.644276]         9000000104cb7be8 90000000049f6000 00000000000000=
90 9000000104cb7bdc
>   [  130.644423]         ffff80001b894000 0000000000000000 00007ffffb9177=
90 90000000032acfb0
>   [  130.644572]         ...
>   [  130.644629] Call Trace:
>   [  130.644641] [<9000000003137f7c>] build_body+0xd8/0x4988
>   [  130.644785] [<900000000313ca94>] bpf_int_jit_compile+0x228/0x4ec
>   [  130.644891] [<90000000032acfb0>] bpf_prog_select_runtime+0x158/0x1b0
>   [  130.645003] [<90000000032b3504>] bpf_prog_load+0x760/0xb44
>   [  130.645089] [<90000000032b6744>] __sys_bpf+0xbb8/0x2588
>   [  130.645175] [<90000000032b8388>] sys_bpf+0x20/0x2c
>   [  130.645259] [<9000000003f6ab38>] do_syscall+0x7c/0x94
>   [  130.645369] [<9000000003121c5c>] handle_syscall+0xbc/0x158
>   [  130.645507]
>   [  130.645539] Code: 380839f6  380831f9  28412bae <24000ca6> 004081ad  =
0014cb50  004083e8  02bff34c  58008e91
>   [  130.645729]
>   [  130.646418] ---[ end trace 0000000000000000 ]---
>
> On my machine, which has CONFIG_PAGE_SIZE_16KB=3Dy, the test failed at lo=
ading
> a BPF prog with 2039 instructions:
>
>   prog =3D (struct bpf_prog *)ffff80001b894000
>   insn =3D (struct bpf_insn *)(prog->insnsi)ffff80001b894048
>   insn + 2039 =3D (struct bpf_insn *)ffff80001b898000 <- end of the page
>
> In build_insn(), we are trying to access next instruction unconditionally=
,
> i.e. `(insn + 1)->imm`. The address lies in the next page and is not owne=
d
> by the current process, thus an page fault is inevitable and then segfaul=
t.
>
> So, let's access next instruction only under `dst =3D imm64` context.
In this context the next instruction always belongs to the current page?

Huacai
>
> With this fix, we have:
>
>   # ./test_tag
>   test_tag: OK (40945 tests)
>
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/net/bpf_jit.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 4fcd6cd6da23..5c634de4ee36 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -465,7 +465,6 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>         const u8 dst =3D regmap[insn->dst_reg];
>         const s16 off =3D insn->off;
>         const s32 imm =3D insn->imm;
> -       const u64 imm64 =3D (u64)(insn + 1)->imm << 32 | (u32)insn->imm;
>         const bool is32 =3D BPF_CLASS(insn->code) =3D=3D BPF_ALU || BPF_C=
LASS(insn->code) =3D=3D BPF_JMP32;
>
>         switch (code) {
> @@ -923,8 +922,12 @@ static int build_insn(const struct bpf_insn *insn, s=
truct jit_ctx *ctx, bool ext
>
>         /* dst =3D imm64 */
>         case BPF_LD | BPF_IMM | BPF_DW:
> +       {
> +               const u64 imm64 =3D (u64)(insn + 1)->imm << 32 | (u32)ins=
n->imm;
> +
>                 move_imm(ctx, dst, imm64, is32);
>                 return 1;
> +       }
>
>         /* dst =3D *(size *)(src + off) */
>         case BPF_LDX | BPF_MEM | BPF_B:
> --
> 2.34.1
>
>
