Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80371DE3DB
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 04:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756700788; cv=none; b=mUCspEO5q+DMUlFmaA8nV3UrEXRAeM/dd53H3214YnSDr4eUi8bCMNC/n4I8ThiHf7wuAdwyOGnYGLXqdMdAZCsoUCrtqnF3IjaoGwPj/63iZP84CS3iXuYqL3WjMQKsc7AIk9PHDad6nITpsTtRmHlqBfEcNDGDkU86Olni3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756700788; c=relaxed/simple;
	bh=R8UVd0SeXSn7Hfq9kXxUEnIasOCObox1regKgx/K6MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDPwUD2t25aVsEOKMK8U/p8kx7t4I7PkR/RvkQOSotO6A1GSlf32SwuoJDovwKQX7mvymWpIdICVrabY6xCNRDITYKeAq69jtykBG3oZdXSKhvnLHsXL7/+Ddyzn4dgYyv9FunVl3DV5+0geXrbyAg2rjk4zZMsUwC+8uADsuUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoRF4RPf; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoRF4RPf"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b33945989bso5028411cf.2
        for <loongarch@lists.linux.dev>; Sun, 31 Aug 2025 21:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756700786; x=1757305586; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMim2DOj5Py7hRE+Yn97fqzw+dNLf6NP8B/SmBNlDLs=;
        b=DoRF4RPfkQaRKSSVfWTdOZfmnd+Ap+nAOpE7PCxMlAh0FUuJhsB4d5xB/utdb137vQ
         TGcjsmR7LcsQQ6wdlTdX75Dl244YfdPKpRUjpZkycy50TtFi4vS9pSWO5IDjPEbC9IOp
         05cR1gg67O05nLB0wwcM+x7cn9PPxenOhpGBIE4v9rtUOsAK8chfi/N29syrWjA/Z3AI
         QyVi9YbA8eS2xv3EFvSV21LBlXwr0snGchEjsdjJgwvtBmU9Rl4K9EQFJ20utNxMPFLQ
         KaIAkq4s1Bwf0g7G00pGEs7RXp464Baaxnv23MTw9OpAFfXSrC2YGwZtmpNGB66ukiQY
         t8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756700786; x=1757305586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMim2DOj5Py7hRE+Yn97fqzw+dNLf6NP8B/SmBNlDLs=;
        b=LmuJfMTkYcZLkyLfv+YCTukffEFkxbbX3Z8em0HevEY0aOKfs3PbDwJ/ZRukACZpbV
         vkEPOZB7VyY7iaxvdit00K2RHEtZqBo9vOUynJxYZx64MZUVwKERg3oaauqpnmRGOgYc
         fgPBnYtmZGNXRgrEsCiC+8nLHVM3fcI0ctv+jBImTMFyNnuaDPnlCPr5qF5FE/M5nCyi
         okAItpZWTtNM0OSoll9Y/5KL5vsW0lEucsrvgazxm5zObm3U6HjKcXIVNNX2OpVdoiyz
         PbWTVVU4nJGnnzAJy2JX1Tk2Xl9hxkAyjcqRLuPryT/F1yBUxu83s6jQGwFfLSQxwDCF
         mbjg==
X-Forwarded-Encrypted: i=1; AJvYcCV4wsyRWF0EelPA1sd3HfZIGzlgzw1PpIgTKYQUO6a78OEQHyS5npJRaDZjT9tqFTC27UUoDbdAW/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzSkqgbaBvG3ixqx7iomiQkuxQ/6W67H5+7InFNF8V35hWAn+j
	RjwRZ7QVErIJrhfAgvC1pbbbvSn35LBYYx5azZuFSC+pQ8n0y8KvqUs6+Y2eVh2jvzYpAA68y0t
	tRZ1/NxCBdrAktspQwswfEf1DGMCNRw8=
X-Gm-Gg: ASbGnctw2zXt+9f68BF5mDg1c2FlNAmUBm9y8/XtfJAnUwzKCwrKwXD7HePqMblmI6R
	049vxOEtPCj5AQtxKn8GLPzqrqwM0U8gp9AwmdenBBm22QZxJ8Ah/KBUVK6Hk88UTlgwHb+LidD
	RkRKyB1R8cmx7DEQSMAIB9ZRuUotcqFrwEPOs/4ihgrtGafEZLkKM3W+M/mrR9MgEBc82+FrjcG
	lED5e0=
X-Google-Smtp-Source: AGHT+IFH/mlMkW86Q1VUM8mDVf6Rm4F8TLS7FWBd/2P/Nj5aP/9rlLAgwLHzc3PmmQKb2xd/i/a8dH16hkb6X59Olmo=
X-Received: by 2002:ac8:7fcd:0:b0:4b0:7075:2fd3 with SMTP id
 d75a77b69052e-4b31d7f0a42mr85504601cf.7.1756700785711; Sun, 31 Aug 2025
 21:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831234328.22440-1-hengqi.chen@gmail.com> <20250831234328.22440-3-hengqi.chen@gmail.com>
In-Reply-To: <20250831234328.22440-3-hengqi.chen@gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 31 Aug 2025 21:26:14 -0700
X-Gm-Features: Ac12FXyVYNPY1O9okQ1AZkCaaAbODAypleUOnyHrNIkp79EG0HJnh-WtgT4nAV8
Message-ID: <CAK3+h2xy5XgvsBjakZinECEnjB_KXX13FaLAyBBLy6ubqxVJ3A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: chenhuacai@kernel.org, yangtiezhu@loongson.cn, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 31, 2025 at 6:55=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> The ns_bpf_qdisc selftest triggers a kernel panic:
>
>     CPU 0 Unable to handle kernel paging request at virtual address 00000=
00000741d58, era =3D=3D 90000000851b5ac0, ra =3D=3D 90000000851b5aa4
>     Oops[#1]:
>     CPU: 0 UID: 0 PID: 449 Comm: test_progs Tainted: G           OE      =
 6.16.0+ #3 PREEMPT(full)
>     Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
>     Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
>     pc 90000000851b5ac0 ra 90000000851b5aa4 tp 90000001076b8000 sp 900000=
01076bb600
>     a0 0000000000741ce8 a1 0000000000000001 a2 90000001076bb5c0 a3 000000=
0000000008
>     a4 90000001004c4620 a5 9000000100741ce8 a6 0000000000000000 a7 010000=
0000000000
>     t0 0000000000000010 t1 0000000000000000 t2 9000000104d24d30 t3 000000=
0000000001
>     t4 4f2317da8a7e08c4 t5 fffffefffc002f00 t6 90000001004c4620 t7 ffffff=
ffc61c5b3d
>     t8 0000000000000000 u0 0000000000000001 s9 0000000000000050 s0 900000=
01075bc800
>     s1 0000000000000040 s2 900000010597c400 s3 0000000000000008 s4 900000=
01075bc880
>     s5 90000001075bc8f0 s6 0000000000000000 s7 0000000000741ce8 s8 000000=
0000000000
>        ra: 90000000851b5aa4 __qdisc_run+0xac/0x8d8
>       ERA: 90000000851b5ac0 __qdisc_run+0xc8/0x8d8
>      CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
>      PRMD: 00000004 (PPLV0 +PIE -PWE)
>      EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
>      ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
>     ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
>      BADV: 0000000000741d58
>      PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
>     Modules linked in: bpf_testmod(OE) [last unloaded: bpf_testmod(OE)]
>     Process test_progs (pid: 449, threadinfo=3D000000009af02b3a, task=3D0=
0000000e9ba4956)
>     Stack : 0000000000000000 90000001075bc8ac 90000000869524a8 9000000100=
741ce8
>             90000001075bc800 9000000100415300 90000001075bc8ac 0000000000=
000000
>             900000010597c400 900000008694a000 0000000000000000 9000000105=
b59000
>             90000001075bc800 9000000100741ce8 0000000000000050 9000000085=
13000c
>             9000000086936000 0000000100094d4c fffffff400676208 0000000000=
000000
>             9000000105b59000 900000008694a000 9000000086bf0dc0 9000000105=
b59000
>             9000000086bf0d68 9000000085147010 90000001075be788 0000000000=
000000
>             9000000086bf0f98 0000000000000001 0000000000000010 9000000006=
015840
>             0000000000000000 9000000086be6c40 0000000000000000 0000000000=
000000
>             0000000000000000 4f2317da8a7e08c4 0000000000000101 4f2317da8a=
7e08c4
>             ...
>     Call Trace:
>     [<90000000851b5ac0>] __qdisc_run+0xc8/0x8d8
>     [<9000000085130008>] __dev_queue_xmit+0x578/0x10f0
>     [<90000000853701c0>] ip6_finish_output2+0x2f0/0x950
>     [<9000000085374bc8>] ip6_finish_output+0x2b8/0x448
>     [<9000000085370b24>] ip6_xmit+0x304/0x858
>     [<90000000853c4438>] inet6_csk_xmit+0x100/0x170
>     [<90000000852b32f0>] __tcp_transmit_skb+0x490/0xdd0
>     [<90000000852b47fc>] tcp_connect+0xbcc/0x1168
>     [<90000000853b9088>] tcp_v6_connect+0x580/0x8a0
>     [<90000000852e7738>] __inet_stream_connect+0x170/0x480
>     [<90000000852e7a98>] inet_stream_connect+0x50/0x88
>     [<90000000850f2814>] __sys_connect+0xe4/0x110
>     [<90000000850f2858>] sys_connect+0x18/0x28
>     [<9000000085520c94>] do_syscall+0x94/0x1a0
>     [<9000000083df1fb8>] handle_syscall+0xb8/0x158
>
>     Code: 4001ad80  2400873f  2400832d <240073cc> 001137ff  001133ff  640=
7b41f  001503cc  0280041d
>
>     ---[ end trace 0000000000000000 ]---
>
> The bpf_fifo_dequeue prog returns a skb which is a pointer.
> The pointer is treated as a 32bit value and sign extend to
> 64bit in epilogue. This behavior is right for most bpf prog
> types but wrong for struct ops which requires LoongArch ABI.
>
> So let's sign extend struct ops return values according to
> the return value spec in function model.
>
> Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support for trampoli=
ne")
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/net/bpf_jit.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index b646c6b73014..0e76a0958142 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1448,6 +1448,29 @@ void arch_free_bpf_trampoline(void *image, unsigne=
d int size)
>         bpf_prog_pack_free(image, size);
>  }
>
> +/*
> + * Sign-extend the register if necessary
> + */
> +static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size)
> +{
> +       switch (size) {
> +       case 1:
> +               emit_insn(ctx, extwb, rd, rj);
> +               break;
> +       case 2:
> +               emit_insn(ctx, extwh, rd, rj);
> +               break;
> +       case 4:
> +               emit_insn(ctx, addiw, rd, rj, 0);
> +               break;
> +       case 8:
> +               move_reg(ctx, rd, rj);
> +               break;
> +       default:
> +               pr_warn("bpf_jit: invalid size %d for sign_extend\n", siz=
e);
> +       }
> +}
> +
>  static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf=
_tramp_image *im,
>                                          const struct btf_func_model *m, =
struct bpf_tramp_links *tlinks,
>                                          void *func_addr, u32 flags)
> @@ -1654,6 +1677,8 @@ static int __arch_prepare_bpf_trampoline(struct jit=
_ctx *ctx, struct bpf_tramp_i
>         if (save_ret) {
>                 emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -=
retval_off);
>                 emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, =
-(retval_off - 8));
> +               if (is_struct_ops)
> +                       sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG=
_0], m->ret_size);
>         }
>
>         emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off=
);
> --
> 2.43.5
>
>

Tested OK.

./test_progs \
--deny=3Dmodule_attach \
--deny=3Dsubprogs_extable \
--deny=3Dtimer_lockup \
--json-summary=3D"./bpf_selftests.json"

#213/1   ns_bpf_qdisc/fifo:OK
#213/2   ns_bpf_qdisc/fq:OK
#213/3   ns_bpf_qdisc/attach to mq:OK
#213/4   ns_bpf_qdisc/attach to non root:OK
#213/5   ns_bpf_qdisc/incompl_ops:OK
#213     ns_bpf_qdisc:OK
