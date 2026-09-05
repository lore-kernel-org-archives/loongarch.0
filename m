Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED8C49EC65
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620782; cv=none; b=BUdynf0Z6Wjrv0h/mrfSoMAYA5NqLqpk2y4qseSS5B7C9if0Uv/dlzio1HCb0n+kz1W4GC9cVIDjisxi5to2gWmkMH84Ii8gMPRXRw+Lpth3rnf4L1sCkVhTQmzDD5PVGVKBLQtwiIs/9coHOMveSjNK1GMu6ZpetrQhJZl/bPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620782; c=relaxed/simple;
	bh=T/BoCHcn+7UNKzHUeVaxUpVLcaN6ZzFjFQ0osHhrjKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoJS33RHZ0uY4aRsosNQsvuB9FPUtySSVO3ac3yEERcZzmv1LwJCipwAAAnKrXAwwR4aPCaQH2tDGJjT4BOH1QIMnOkGuNWHyR3Xofc9Jxfq8Rz1xWPvN8ohlNEjSb1Wby4VDV03MUXqk+eashbfU14SUcA8WMJ6TF+6hTJ0Wq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFN847tF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFN847tF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E821F00AC4
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788620780;
	bh=KHshG6nMPDVCmd80dZy5JGDXk83+eLNv22ru8gCVG+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BFN847tFn0rW9Qc1HSoTHxaAQK4pQng2mb+hUMgPKGuEs9M4MYAUENxo8ATR4wM/H
	 yWvXNhDew1s4jki+d3S7rr67ZKID/1kkVJLBUrDMNRpG5WF1KG5N2Rv3H4I6kXcaxA
	 FuGIQ6hCoihrGOoT4ZjRw2uV4vp7tZUYjqmJyYFwj3lpI5DmxRAgiLlH2ApRwOzoeY
	 VQ4RCA+PvZvEh1Ho/hFA7Kcz7U2GujGWr8mxC3uMbTXmeZZ4FZT2y+gq/k83dKwftU
	 bJvZW/hU8WKZGSOYTPRdReTAXoNLN6izc8+wgY8wdbM+CDHtd2lGi+fye8VEoc5HVK
	 tkyFxEaFvO13A==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c20ce3c118aso403653466b.0
        for <loongarch@lists.linux.dev>; Sat, 05 Sep 2026 08:06:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByxXA+bUEX1QdZZmjru6QXQGWyto9HrCiwUivJjhWo2+RIL5Bt6I483k58UirPwieK4k10+ga9g0Bw=@lists.linux.dev
X-Gm-Message-State: AFuF++krdOy0OYoAaUqZlaHWVZxRNbUpjCGiYfRiG9VSdZhrcwq9mC3x
	P3I8kqvH72PUEjr0Npm0TO+fwTYuQiGocPRpR7YNhyVUCgrhiJJW2QYg29dEJaSTbgGPl51w9g3
	F4Km+y2DMUIBBS9HJLEJ+eq0tLkoikew=
X-Received: by 2002:a17:907:a2cc:b0:c25:4ca3:dfda with SMTP id
 a640c23a62f3a-c25f012737cmr780960866b.9.1788620779385; Sat, 05 Sep 2026
 08:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831023106.3279-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260831023106.3279-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 5 Sep 2026 23:06:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6gwzWdck95Sr8Ubz0eeKtor8d0Ojc+gULK-=nakq-hXA@mail.gmail.com>
X-Gm-Features: AcwNN1VxHVvqIMEdQIiXWuew_GsDjwo6BKiiVq6lKP0VXx78dtGRx0MNL75g1vI
Message-ID: <CAAhV-H6gwzWdck95Sr8Ubz0eeKtor8d0Ojc+gULK-=nakq-hXA@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: BPF: Fix off-by-one error for insn_is_cast_user
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.


Huacai

On Mon, Aug 31, 2026 at 10:31=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> In the LoongArch BPF JIT code, the branch offset represents the number
> of instructions. An offset of 1 means the target of the "beq" is the
> current PC plus 1 instruction (PC + 4 bytes). This matches the exact
> same path as the sequential non-branch execution, the "or" instruction
> is always executed for the cast_user JIT arm in build_insn().
>
> If the pointer is not NULL, there is no side effect. But if the pointer
> is NULL, it is incorrectly combined with the base address and turns into
> a non-zero address, meaning a zero arena offset no longer casts to NULL.
>
> Fix this by changing the branch offset from 1 to 2, which properly skips
> the "or" instruction and jumps directly to the "move_reg" instruction if
> the pointer is NULL, ensuring the destination register is safely cleared
> to 0.
>
> Fixes: 4fdb5dd8aeba ("LoongArch: BPF: Implement bpf_addr_space_cast instr=
uction")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> v2: Update the commit message, no code changes.
>
>  arch/loongarch/net/bpf_jit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 1eb588e443c9..4da278900938 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -717,7 +717,7 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>                         move_reg(ctx, t1, src);
>                         emit_zext_32(ctx, t1, true);
>                         move_imm(ctx, dst, (ctx->user_vm_start >> 32) << =
32, false);
> -                       emit_insn(ctx, beq, t1, LOONGARCH_GPR_ZERO, 1);
> +                       emit_insn(ctx, beq, t1, LOONGARCH_GPR_ZERO, 2);
>                         emit_insn(ctx, or, t1, dst, t1);
>                         move_reg(ctx, dst, t1);
>                         break;
> --
> 2.42.0
>
