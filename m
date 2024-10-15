Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D2203711
	for <loongarch@lists.linux.dev>; Tue, 15 Oct 2024 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729017377; cv=none; b=ki4vRuSM54fmvTjPhlHU1swuugoYEHUsjxwCU/BrodRU8bbf8zTE3YVMWg0vC3UVNZt9ed0GwxgKxZEI3jFTxnZsTHQQTIHYjMs9GzAF76bunbBiI0wqKYlhc2BL/vWG3CWy9TAJIWDwgYyaP42DNrLXkGb19olmfx9yzi65Wys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729017377; c=relaxed/simple;
	bh=yNKksyNGQRjEC8ytyREQ7iMJkDnpET9UN4Qt41xw7dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKwzrVni7lStPBKZl0tRs8APXvelo91zGBMaZu1qVM+5P6W9thW/Xqbrdu7IT+BunIxgbKyVzxvHMfZ0x3SSpGpbKKpwrEynC1LtKwiDtEnSMPPfokcNj9dyUAIjlf9pXFS+k1gfLmYTzqgrH8ZEyB6fMc4lRE3eUWMbcmCiZsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZ0EE0g1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZ0EE0g1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d325beee2so3462814f8f.2
        for <loongarch@lists.linux.dev>; Tue, 15 Oct 2024 11:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729017374; x=1729622174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q5eEEdHL0dWI89V6py6cPKMvtj8RQmT2g6+quRNSkY=;
        b=GZ0EE0g1KcPCRZMIWAGw8vxMI2x6rmmTnhNozUS8iYJnrTNFDqmBGs9zfZoeQggp/2
         iJr5Xx+GlyOzNydQchJd9njVRLS+45B6OWAjkzmsZBdj/Gp1uDN6EqmsiFqMu1eS7lCv
         ZbIUS8xadCJVhwr2EpKeL9QEPcboTWqLtKab9Pj8eEhmyIgcppKnQe77G59uq+Sbhk2t
         aS3D2PH434YS9saD8eNRge+w2PQf2i3RAuijLGRiwF82yxxZkJIIgrHkt7GD1glXBkxf
         B6jnPR/H2rVWRedUlz1SmGLG1FzjZztn7U99MJc1Ovkxo2zZMiLFGUnvkLb+9bcXosS/
         5kIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729017374; x=1729622174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7q5eEEdHL0dWI89V6py6cPKMvtj8RQmT2g6+quRNSkY=;
        b=tC7LWy+P9AtLFX2ERYW2HvuG34UnJSWlPFScOIDawl+Bo3eIIxKS0qOUWTLJjAwH1m
         CvIyz+5d9yyzvPZoa4nVttI1uL+MGHlGyS+SSigQnvLKFwR1ZhUT6gpwkqv9n1RJWGps
         gkpxuqC3WWIPcC+0JE6DeVph4NPVnTa7S+ZAG4LFk17/xpKK/M9MAGDd+kAgTgJWqkRv
         FJmofScVPie9dDuYqidHISJcigDZJOMwqf9QKkMP1ZMCyAI8rLJqOghfErjeXZ/V7b8G
         3+UJGIVN45jXx4FihVjY7Ynz2EZQTPL3vNkc2jWGFZHBfBMQkyOyocmbzb3aRh4jsSn5
         1PUg==
X-Forwarded-Encrypted: i=1; AJvYcCXpfFtvRdE8RPJHTwMS2/h4C6EKNpiWee8WfTDJCQ4u4dFh7qYxZEsOa60qwDmXxWwDaWBxKbdf14s=@lists.linux.dev
X-Gm-Message-State: AOJu0YygSSgSiNtLQS3PeFqyTGHyFxDHQQotI7dc0xM7pQeTokmX/1IF
	s9Ncp18aqtJzuWN8/ko++MEjKc//phEapX0NWOuJP6t/V0g9kEN3C6vm33ohCQibS774fXxjROc
	Jv5RSrc9m8eZsNym55cpataYO0fUyMo53
X-Google-Smtp-Source: AGHT+IE4tZcwjlIK0ZjoV3mK8y4/qf2Rvzx5itXTUvqKcrWs9eCIHm3hSbg6OoA8/znTqDqElp2h5eztY73UyfpqyFY=
X-Received: by 2002:a5d:4d8c:0:b0:37d:33ab:de30 with SMTP id
 ffacd0b85a97d-37d5fec99e4mr8386614f8f.8.1729017373640; Tue, 15 Oct 2024
 11:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015113915.12623-1-yangtiezhu@loongson.cn> <20241015113915.12623-5-yangtiezhu@loongson.cn>
In-Reply-To: <20241015113915.12623-5-yangtiezhu@loongson.cn>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 15 Oct 2024 11:36:02 -0700
Message-ID: <CAADnVQK6wgy0e5nW220sSDXzxkKcga8zpCDqKmDd=8xdooP37g@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] bpf, core: Add weak arch_prepare_goto()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 4:50=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> The objtool program needs to analysis the control flow of each
> object file generated by compiler toolchain, it needs to know
> all the locations that a branch instruction may jump into.
>
> In the past, objtool only works on x86, where objtool can find
> the relocation against the nearest instruction before the jump
> instruction, which points to the goto table, because there is
> only one table jump instruction even if there is more than one
> computed goto in a function such as ___bpf_prog_run().
>
> In fact, the compiler behaviors are different for various archs.
> On RISC machines (for example LoongArch) this approach does not
> work: with -fsection-anchors (often enabled at -O1 or above) the
> relocation entry may actually points to the section anchor instead
> of the table. Furthermore, objdump kernel/bpf/core.o shows that
> there are many table jump instructions in ___bpf_prog_run() with
> more than one computed gotos, but there are no relocations which
> actually points to the table for some table jump instructions on
> LoongArch.
>
> For the jump table of switch cases, a GCC patch "LoongArch: Add
> support to annotate tablejump" has been merged into the upstream
> mainline, it makes life much easier with the additional section
> ".discard.tablejump_annotate" which stores the jump info as pairs
> of addresses, each pair contains the address of jump instruction
> and the address of jump table.
>
> For the jump table of computed gotos, it is indeed not so easy
> to implement in the compiler, especially if there is more than
> one computed goto in a function.
>
> Without the help of compiler, in order to figure out the address
> of goto table by interpreting the LoongArch machine code, add a
> function arch_prepare_goto() for goto table, it is an empty weak
> definition and is only overridden by archs that have special
> requirements.
>
> This is preparation for later patch on LoongArch, there is no any
> effect for the other archs with this patch.
>
> Suggested-by: Xi Ruoyao <xry111@xry111.site>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  kernel/bpf/core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 5e77c58e0601..81e5d42619d5 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1706,6 +1706,14 @@ bool bpf_opcode_in_insntable(u8 code)
>  }
>
>  #ifndef CONFIG_BPF_JIT_ALWAYS_ON
> +/*
> + * This symbol is an empty weak definition and is only overridden
> + * by archs that have special requirements.
> + */
> +#ifndef arch_prepare_goto
> +#define arch_prepare_goto()
> +#endif
> +
>  /**
>   *     ___bpf_prog_run - run eBPF program on a given context
>   *     @regs: is the array of MAX_BPF_EXT_REG eBPF pseudo-registers
> @@ -1743,6 +1751,7 @@ static u64 ___bpf_prog_run(u64 *regs, const struct =
bpf_insn *insn)
>  #define CONT_JMP ({ insn++; goto select_insn; })
>
>  select_insn:
> +       arch_prepare_goto();
>         goto *jumptable[insn->code];

That looks fragile. There is no guarantee that compiler will keep
asm statement next to indirect goto.
It has all rights to move/copy such goto around.
There are other parts in the kernel which are not annotated either:
drm_exec_retry_on_contention(),
drivers/misc/lkdtm/cfi.c

You're arguing that it's hard to properly in the compiler,
but that's the only option. It has to be done by the compiler.
