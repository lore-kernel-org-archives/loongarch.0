Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B9D199935
	for <loongarch@lists.linux.dev>; Sat, 15 Mar 2025 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742075370; cv=none; b=FwDx9i7hrNnYJj6fK38n6cqoVwOG+WSAlrDl3y8TbVAVOwFJV74KhlvXpa2GULHfuLf5hr3tAnbHiRduYTV0zPUTKt0hwESRsYBGRbwFKTMvbHy3lwoqJu5xpLFWynqUQotuVt6ilx5nx1eGwuVzBSqoFO1bkAKwsceXo0t5wqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742075370; c=relaxed/simple;
	bh=utj7T2zjLM6qpykTGs4WjIvLnXZHO8IrJV3zbUY/Gyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAojccn3qVqs5hvpIug4KFt03VOa3EWNUdgrFCxQsL6ZyX1opjbGAKrKcVB07FEem67a1mns/c8vNnEPFj9I1DisDM6XdRR3b8hjt9vu+TNSus2X9Aoiex38hXuqMTYJdFLM3jbmfKP135CR0xuc3GfbUFmULzHgvdVf1StcRX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPafKJvF; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPafKJvF"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476964b2c1dso24977691cf.3
        for <loongarch@lists.linux.dev>; Sat, 15 Mar 2025 14:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742075367; x=1742680167; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htMXExvmZBQm7d6kU9o8ufhUChLLpNIQghzJTcbu4/A=;
        b=cPafKJvFAEzMf6NHAq8NUz99LKzxucN3Wx33MzekojNgVy5Hb46TofDgb+UGgm1n2S
         QNRx1v+as8N/FOXwDIEjce0EDiuyIcs9i3BUrgQXECqULZGqXIt6koL+TDZ76KqRoA4L
         mzLW0pmdsP5qLr2Od3LKfNMVu2b0bMhJ7KsvrxPHRimI/gENqbOPLX6WruwThUiFc+uw
         QlZt/nyuzDKTdNXlwYYGFrPL6eY5Nub63IeC885z11AAUatL9II6dW2iGeUJOrADa3UJ
         +JCdUZJ2i/NbB9tbUjK3vMdjKbrORuEer22wg2lN6cZZgU03Jq99K+XHw5ZimAScgqGW
         X+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742075367; x=1742680167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htMXExvmZBQm7d6kU9o8ufhUChLLpNIQghzJTcbu4/A=;
        b=vebPPHFD09nOjL+MuqFFqrV7bGMonCTkHfdMdqBJCl2fztDX08A/WVXOl9hNr6KuO2
         dr7AX4TVmTjM1p4uSL4s13hfsiaUh2lsdOt+m0lxqbn3+ZVycJ2P/mKYjYPHJ2FRwIg0
         6ACsIIsUn3Dymw1WYHaxnj90jmX29c1JREPwkBGNaW29P9oUk3204GrMz/1ZnXAzK/Qq
         zpjYZFkR37irYhYMloFOBB6rJq5FJ42mLNZE+6NyD3yZy2RzLkB70KR+bqnRhs2dfPCz
         pLbU+IPD2lsfxuoQitAIGQaZehUQo3bY7w74MMUXh5hrSXMmebMRhdshdfMm5qSYYfqJ
         MPHw==
X-Gm-Message-State: AOJu0YzmI5xzdo3N4gm8MkkvS8fwgMOyKjlMLtw2Cb2EbKFwV/k/R7CO
	eP1gRtMx5bPEA5RIhP8S+D5Gz2OtGAk3XTDWnUzU4zomTCT1Ee5pSypdO+7WH465ds+XFQCgC3P
	nCIciQCX8Du2bhi+Ya1x/5uPDOwY=
X-Gm-Gg: ASbGncuVk5kpdNzYREc5rfAISPnA1Z2II0UY0SnrGzax7fR4bPVcD9S+VtVaxDQH4Pl
	gxZQVGE8Phz7oQkBGHj534KOOc3rHKRNbtEf19ihxv6HhdQqYy6RkaMFgs6msqTj2ZWU6tTnlOu
	der4u/jbHyPYmVZ7hcM4tfaYYdw0EN16cHyzXLn4hjkV6gFVggKrnD/LEnJKQ=
X-Google-Smtp-Source: AGHT+IFMwa7QDGNX9RO7A6hcfLWK9lJOQ79D8v4yAh9k4h/Gpu/TWynAhn4DEMBHiNkl1mXky7zG38a9scrLcuvmDN8=
X-Received: by 2002:a05:622a:1496:b0:474:fee1:7915 with SMTP id
 d75a77b69052e-476c81682d5mr124403151cf.31.1742075367544; Sat, 15 Mar 2025
 14:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250315080320.4193821-1-hengqi.chen@gmail.com>
In-Reply-To: <20250315080320.4193821-1-hengqi.chen@gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sat, 15 Mar 2025 14:49:16 -0700
X-Gm-Features: AQ5f1JrCTgTsTFN_PWCWd0JGY8245UQ4qmXfu01j_vQCgwV5WvkunWqZ7rO12w0
Message-ID: <CAK3+h2xxwarw1uBo0R9r=4zVA6rEwDDz=de-cr4RqSBPSLvF=Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Fix off by one error in build_prologue()
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org, yangtiezhu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 1:03=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> Vincent reported that running BPF progs with tailcalls on LoongArch
> causes kernel hard lockup. Debugging the issues shows that the JITed
> image missing a jirl instruction at the end of the epilogue.
>
> There are two passes in JIT compile, the first pass set the flags and
> the second pass generates JIT code based on those flags. With BPF progs
> mixing bpf2bpf and tailcalls, build_prologue() generates N insns in the
> first pass and then generates N+1 insns in the second pass. This makes
> epilogue_offset off by one and we will jump to some unexpected insn and
> cause lockup. Fix this by inserting a nop insn.
>
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Fixes: bb035ef0cc91 ("LoongArch: BPF: Support mixing bpf2bpf and tailcall=
s")
> Reported-by: Vincent Li <vincent.mc.li@gmail.com>
> Closes: https://lore.kernel.org/loongarch/CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_=
Ve1EDAjotVrnx6Or_c8g@mail.gmail.com/
> Closes: https://lore.kernel.org/bpf/CAK3+h2woEjG_N=3D-XzqEGaAeCmgu2eTCUc7=
p6bP4u8Q+DFHm-7g@mail.gmail.com/
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/include/asm/inst.h | 5 +++++
>  arch/loongarch/net/bpf_jit.c      | 2 ++
>  2 files changed, 7 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/a=
sm/inst.h
> index 3089785ca97e..d61b356170fe 100644
> --- a/arch/loongarch/include/asm/inst.h
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -695,6 +695,11 @@ static inline void emit_jirl(union loongarch_instruc=
tion *insn,
>         insn->reg2i16_format.rj =3D rj;
>  }
>
> +static inline void emit_nop(union loongarch_instruction *insn)
> +{
> +       insn->word =3D INSN_NOP;
> +}
> +
>  #define DEF_EMIT_REG2BSTRD_FORMAT(NAME, OP)                            \
>  static inline void emit_##NAME(union loongarch_instruction *insn,      \
>                                enum loongarch_gpr rd,                   \
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index ea357a3edc09..2346c0b55043 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -142,6 +142,8 @@ static void build_prologue(struct jit_ctx *ctx)
>          */
>         if (seen_tail_call(ctx) && seen_call(ctx))
>                 move_reg(ctx, TCC_SAVED, REG_TCC);
> +       else
> +               emit_insn(ctx, nop);
>
>         ctx->stack_size =3D stack_adjust;
>  }
> --
> 2.43.5
>

Thanks Hengqi for the patch, I tested the patch on the LoongArch
platform with the loxilb tc BPF program, it does not lockup up the
kernel anymore.

attach loxilb tc BPF program to loongfire firewall green0 interface

[root@loongfire ~]# loxilb --whitelist=3D"green0"
loxilb start
...
14:43:13 DEBUG common_libbpf.c:161: tc: autoload sec tc_packet_hook1
prog tc_packet_func
14:43:13 DEBUG common_libbpf.c:161: tc: autoload sec tc_packet_hook2
prog tc_packet_func_slow
14:43:13 DEBUG common_libbpf.c:161: tc: autoload sec tc_packet_hook3
prog tc_packet_func_fw
14:43:13 DEBUG common_libbpf.c:161: tc: autoload sec tc_packet_hook4
prog tc_csum_func1
14:43:13 DEBUG common_libbpf.c:161: tc: autoload sec tc_packet_hook5
prog tc_csum_func2
14:43:13 DEBUG common_libbpf.c:161: tc: autoload sec tc_packet_hook6
prog tc_slow_unp_func
14:43:13 DEBUG common_libbpf.c:161: tc: autoload sec tc_packet_hook7
prog tc_packet_func_masq
libbpf: Error in bpf_create_map_xattr(nh_map):Invalid argument(-22).
Retrying without BTF.
libbpf: Error in bpf_create_map_xattr(xctk):Operation not
supported(-95). Retrying without BTF.
2025-03-15 14:43:14 Get xsync()
14:43:15 INFO  common_libbpf.c:204: tc: bpf attach OK for green0
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
14:43:15 DEBUG loxilb_libdp.c:3311: llb_link_prop_add: IF-green0 added
idx 1 type 2
2025-03-15 14:43:15 ebpf intfmap added - 5 vlan 0 -> 1
2025-03-15 14:43:15 ebpf txintfmap added - 1 -> 5

Above log shows the program loaded and attached to the green0
interface, no lockup.

One strange thing is that bpftool net does not show the tc BPF program
attached to green0 interface, attached to virtual interface llb0 ok, I
guess this should be irrelevant to kernel lockup issue.

[root@loongfire ~]# bpftool net
xdp:
llb0(7) generic id 55

tc:
llb0(7) clsact/ingress tc_packet_func_:[59] id 59

flow_dissector:

netfilter:
