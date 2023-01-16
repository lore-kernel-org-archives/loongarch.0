Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7393F10EA
	for <loongarch@lists.linux.dev>; Mon, 16 Jan 2023 03:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24296C433F0
	for <loongarch@lists.linux.dev>; Mon, 16 Jan 2023 03:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673839093;
	bh=xN0nB9m8Mlu0zwKCceXo+pC9SAQhuK5iA+VXSdLnQs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HVVvza9ZGJjkt7sEzxGmzuTLqg2RZGgzD8Tze/iheITECJkV/S7NTDVP69amQFcFC
	 /fcSVKAlc9Gi8QoJ3DqLRPfEcfYrIv9ffeCSSAOXyqZmF1tpukkiCMD0SLHBkSuZmp
	 xO1jIMsoG2R2UrL6bFVM1kOsP28bPF/T6XSz2ChjDBaWNlSedO/+J35NXEN2fekFHw
	 O1eW5Ifd5kIKW7sayhbQtyIGsJ5vTygrp+pzYBOl/8uspmWvUX0KT6idqbM/OFvVE/
	 mINqOD13F4ol7uVPGeiXkvAzCTRIR1HwKXeADVisTilaWA6Q3n1JIL03MP6ROLB0fe
	 SPlhpSLtl0tQA==
Received: by mail-ej1-f46.google.com with SMTP id mp20so18434181ejc.7
        for <loongarch@lists.linux.dev>; Sun, 15 Jan 2023 19:18:13 -0800 (PST)
X-Gm-Message-State: AFqh2kpkJJqZn1V7X91HrNUoLJESKcxx7qv1CEZokMRibgawT6m9n4/C
	UAoBIWJSYKGHQu2uw61a5TYS5ewvT/zESL4648Y=
X-Google-Smtp-Source: AMrXdXujtdw++p7a6byoW27xHy/lM3IXLBFnXPf4aQg/GiD1L3SxcQbhdq+FU2oajvc8xr5/AjtWlWWQNdjjCcICCcI=
X-Received: by 2002:a17:906:5616:b0:852:132b:2d7e with SMTP id
 f22-20020a170906561600b00852132b2d7emr2248742ejq.224.1673839091387; Sun, 15
 Jan 2023 19:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1673688444-24251-1-git-send-email-yangtiezhu@loongson.cn> <1673688444-24251-7-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1673688444-24251-7-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 16 Jan 2023 11:18:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H768YCCdpn62tBAzbT0W24KNK-vnFnPDmMW-+X5_EdxgA@mail.gmail.com>
Message-ID: <CAAhV-H768YCCdpn62tBAzbT0W24KNK-vnFnPDmMW-+X5_EdxgA@mail.gmail.com>
Subject: Re: [PATCH v11 6/6] LoongArch: Use common function sign_extend64()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I queued this patch, but others need more reviews.

Huacai

On Sat, Jan 14, 2023 at 5:27 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> There exists a common function sign_extend64() to sign extend a 64-bit
> value using specified bit as sign-bit in include/linux/bitops.h, it is
> more efficient, let us use it and remove the arch-specific sign_extend()
> under arch/loongarch.
>
> Suggested-by: Jinyang He <hejinyang@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/inst.h   | 8 --------
>  arch/loongarch/kernel/alternative.c | 6 +++---
>  2 files changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
> index e0771d2..ba18ce8 100644
> --- a/arch/loongarch/include/asm/inst.h
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -397,14 +397,6 @@ static inline bool unsigned_imm_check(unsigned long val, unsigned int bit)
>         return val < (1UL << bit);
>  }
>
> -static inline unsigned long sign_extend(unsigned long val, unsigned int idx)
> -{
> -       if (!is_imm_negative(val, idx + 1))
> -               return ((1UL << idx) - 1) & val;
> -       else
> -               return ~((1UL << idx) - 1) | val;
> -}
> -
>  #define DEF_EMIT_REG0I26_FORMAT(NAME, OP)                              \
>  static inline void emit_##NAME(union loongarch_instruction *insn,      \
>                                int offset)                              \
> diff --git a/arch/loongarch/kernel/alternative.c b/arch/loongarch/kernel/alternative.c
> index c5aebea..4ad1384 100644
> --- a/arch/loongarch/kernel/alternative.c
> +++ b/arch/loongarch/kernel/alternative.c
> @@ -74,7 +74,7 @@ static void __init_or_module recompute_jump(union loongarch_instruction *buf,
>         switch (src->reg0i26_format.opcode) {
>         case b_op:
>         case bl_op:
> -               jump_addr = cur_pc + sign_extend((si_h << 16 | si_l) << 2, 27);
> +               jump_addr = cur_pc + sign_extend64((si_h << 16 | si_l) << 2, 27);
>                 if (in_alt_jump(jump_addr, start, end))
>                         return;
>                 offset = jump_addr - pc;
> @@ -93,7 +93,7 @@ static void __init_or_module recompute_jump(union loongarch_instruction *buf,
>                 fallthrough;
>         case beqz_op:
>         case bnez_op:
> -               jump_addr = cur_pc + sign_extend((si_h << 16 | si_l) << 2, 22);
> +               jump_addr = cur_pc + sign_extend64((si_h << 16 | si_l) << 2, 22);
>                 if (in_alt_jump(jump_addr, start, end))
>                         return;
>                 offset = jump_addr - pc;
> @@ -112,7 +112,7 @@ static void __init_or_module recompute_jump(union loongarch_instruction *buf,
>         case bge_op:
>         case bltu_op:
>         case bgeu_op:
> -               jump_addr = cur_pc + sign_extend(si << 2, 17);
> +               jump_addr = cur_pc + sign_extend64(si << 2, 17);
>                 if (in_alt_jump(jump_addr, start, end))
>                         return;
>                 offset = jump_addr - pc;
> --
> 2.1.0
>
