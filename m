Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025757;
	b=Z7Z9z2EY1NMDe22L4ZCn/l6cN6Kpvp+fGNGRgF/ZbmM6X5VF1J8mQegveaBdLebGVE/P
	 I/5uGZn0UZ33eSE7qifhVmeXju5LMeZptpSeFtjlh/hl+VwdHoq0MCrvIC0Rg97sWoWjp
	 AeRkLZ3/alOuGRMku0f49fLsmTXZSMQ9TmFQBGE5Q75vzfYrjHLcgjDyvqhXypKy6iZmD
	 YoaeXAKGws25AcObDD3c2CmDvS0OqWvHEYU9MYvCkQ7La36mCXf7iIVanYLKuSxQKGNwj
	 VQwdJSisNJKCgbfSW9XBcqaiqUPaS6dKqfo6MsvrfVuc2rwFFrFlrTiEL2R4Yw6PpbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FiyIo88XtSCmKUOLGbnBLJ62ZVS25doiOE2fXhFGrhU=;
	b=ObnrPmKbp1N4FTWUdgQnzwYDCeyBgU/2xj/sXzi15ZcPyBQyPhrujpKa0L6QXr44ibdW
	 P91BaAdwFxIIJeiKLIB9mnglSIxGWr3F2/LZtov8+WHEKRU8iPqZkOO7Yimn0QSObRNoe
	 AxxHRVH5FWeAnci1xYlSv+nC2xTT4UaKqrR7gcP3cUJ2YrhhcBVzLj+9kLtG0JyT1HCty
	 qMDQWc/jmzk0MKNIufH0sTcRFlsWSgpik7m0je8gLa5BXLXeY8nfjP9GLqSCHFx2JIqjR
	 3dTY6wdfVQ3+/XBQiSwD15P8C+qpljPEQFhzvik4vfHR2JzYkB+bPpTS7KSpEjep2Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ByuzZSwZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A717606A31D
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 14:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A717606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ByuzZSwZ
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-81ae6aefdceso2558352a34.0
        for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 07:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793025755; cv=none;
        d=google.com; s=arc-20260327;
        b=gGgtdDNqmJHlW84zsFS/rbpJSmjYD2uJug6uZhaLaiByizDAaGAGi+6BpPkh7iKIfq
         sKxU61BNsbGFiJXlW+8qZ1Tipbuh1Ecm3vdG1oDOXjoCrBVhiFvDPFkLh9P8CQchGO4O
         /ny700MUwCIGoX0tfd5cBj+NHFqbnQukWDoSzPMeLxwXa+HzordWyXRvNi6KnNHGsRZQ
         tDr662qt9+Ba2Ogn4/fXIbhK471o1DLTGeuawSp53Dr45pHSq40JG7j0mVlZ9zuxXQx+
         JfbtoeIIx79t7o8iLoWyuTzMobdU4SgMGsZT2VRILi2pHhKT6ugq4iXwOD0u4ngySj6h
         F8Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FiyIo88XtSCmKUOLGbnBLJ62ZVS25doiOE2fXhFGrhU=;
        fh=28gNqJjOpqGE/MZXVMiBqdUghE7l0PARDQPEJcSTI/8=;
        b=OOtxKl1A2yG17jiCOtadqS6Ctzq14U2dzT3NOTYfFg2y66RAOji4mx//QKUD4shAs0
         toRarAwnSQ2GVtwJYwWw6b8df+eVcRmGkL88R37Lj55n81v1VHbd8vRWg3SpIJGdT4b0
         faHpiDm5Csuv8fUlvFF9kQhd4xAxqRZ4EtbrfE/E12e5CIoHh9wRhdpjhEYFIhzZyRou
         /06BEawnF57xMMf0ujVowNWx6dQbHhz7/lTzMbfYKcsDv6ow0+S88Yedw3UymmxZcJ4R
         zlITNlx3tcvRJDEmONrw2fsndfbkHWeec9Yb/NBhSpA/VRUAy5TR0mpD4kMSd0zMHVYf
         t6+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025755; x=1793630555; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiyIo88XtSCmKUOLGbnBLJ62ZVS25doiOE2fXhFGrhU=;
        b=ByuzZSwZSAjNWEmKcxuIDm0+AO08z/b2uFndALhVUjTOttwoaOJvDop9jGCL8n9327
         Z85wrG6y28oJNaUJHf/Pkkj0rjyW30mfW17ba/Nlr+9j74odTmARL6hEhmdxSZhiYi9E
         sKTAImULCj2W3zqJfe1ngSHKICda3vUz8RZcKUl6GhiunvtUNuxmdc+mAFQ7kl+7WO7/
         Dv1a2wfV+eYO71WH2MszXHOBCtFFimvX8MOBYxJBjl1rjXFIQ040eD87vZfgp7PHDtS+
         kHE6Z0Sr4rWn+BUPwN/dQb6ov2npCg2tFSIgDxL9b66gAuHZfEj/iw5BmkYliQorju29
         isDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025755; x=1793630555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiyIo88XtSCmKUOLGbnBLJ62ZVS25doiOE2fXhFGrhU=;
        b=f52KBUxwpqssPmgwg/5KZKFYXW0+7Z6WCCGgap3BPhPM+nKF24IA9cVOEFpvfzKOCe
         WzZwCHOr5tZNdRwIetVxxyhBw4YY9vU5rAE25CQNHTODr77AFj3K9pt8AxzZurSOHUES
         PVifFQtENNr9ub3AmPhfePx1+BjOEuqB1tOUdhV7p+jCjGFxv6STaCpzHlJ3SxB8Kg+Z
         NOm0YlcLb5CWhpvbl+eTL2TFTbciuIihBQRLcGpsOQHAtPhgYLP0AixsnMv2cA31gvw5
         cPE2xRzptW6gXCOy08TVYbqYiJmb5aMwCZSXFf7s4g6XbLZc7CLxwi5xYthwa48GcbaV
         Y7Og==
X-Forwarded-Encrypted: i=1; AKwUvBxab9cWRsM6KpcBd3nljrjtXmorUP2Anu8oQEUUbMsjqY48z/5yaabMM+YWMldcYuiysjty6Ga9Q34=@lists.linux.dev
X-Gm-Message-State: AFq9FYLl+6FGLtpp221T+jSN7KF8hVZogsBgjNBTk9rm39aiJCXj6FVu
	WapHWrAkF5qBXC+wfXPy2ODlHfb7k4hsn6Q91O8CaRoLvm7JniAlZlBZazGvaB6iN93t1pekzsa
	OLC2/ZbQjxRTAqNLFQe0Fyt1oIO6qTj0MVBjxEqc=
X-Gm-Gg: AYBFou0xLu7wG9JZDl0R4V3eCMpZKMZIdTZ2In2WeRnep/HtGHsC8anlCCifcev8v7A
	CKh+lEG9GMuF519kEfBXkIIFtWB8FHsfzr9Sm1cpR7ITO5pKhiTNGrZxpXZATKs6aaq/nSLqTEz
	jOdbgbN+kIX1frZpP3xvypl/nGkkcPvGbfxJOkpuD4HxfcqCVDaTMLbvYk+a0DYQVZqkJFWUl/K
	4Ler3Wz4f1xM6HBf5N8YrTLjhzvScvqx83vlakWaPTJQdSBxTpEMMPB+2LjUg9POSAqJX0GI7Aa
	97bTxrYu0dBC+tAqTNu43k/4OXqmoE3gBNTV3r9laFNtoxKOpkYKTChAr/oObqdfL0JuhxVTqgR
	AscsEpTxJbcYY8L29Xi9fPKQ3fjsS2cilPJF2Eg==
X-Received: by 2002:a05:6871:73a2:b0:491:4a20:8ab8 with SMTP id
 586e51a60fabf-4a83f53b47amr3712608fac.28.1793025755162; Mon, 26 Oct 2026
 07:42:35 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019013335.13512-1-yangtiezhu@loongson.cn>
In-Reply-To: <20261019013335.13512-1-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 26 Oct 2026 22:42:24 +0800
X-Gm-Features: AclHuK9VfDqy3TFsNraLnkzPJtLGJTrw97NH5dTf1M621wbyFJ758LDBDfZcRk0
Message-ID: <CAEyhmHQhi6rgxXEvg6aCA=5XUVBSUpBUbFrjSyJDoD_bz5dDLw@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: BPF: Fix stack arguments for indirect trampolines
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, loongarch@lists.linux.dev, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 9:33=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> LoongArch passes arguments beyond a0-a7 at the caller stack pointer. The
> trampoline store_args() helper always reads those arguments at FP + 16,
> which is correct for a regular fentry trampoline: its prologue leaves FP
> 16 bytes below the stack pointer at trampoline entry to hold the saved
> RA/FP frame record of the parent function.
>
> A struct_ops indirect trampoline is entered through a function pointer an=
d
> only saves its own RA and FP before setting FP to the entry stack pointer=
.
> Its stack arguments therefore start at FP, not FP + 16. As a result, ever=
y
> stack-passed struct_ops argument is currently read two slots late.
>
> Select the source offset based on whether the trampoline is indirect. Thi=
s
> also prepares the stack-passed arena argument path to consume the actual
> pointer slot.
>
> With this patch, the BPF selftest "./test_progs -t struct_ops_multi_args"
> passed on LoongArch.
>
> Fixes: c9ebe2016de9 ("LoongArch: BPF: Support up to 12 function arguments=
 for trampoline")
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> v3:
>   - Reword the log and comment to clarify that the 16-byte frame record
>     is saved for the parent function, not the traced function. (bot+bpf-c=
i)
>   - Remove a stray blank line after the opening brace of store_args(). (b=
ot+bpf-ci)
>   - Reorder the comment sentences to match the true/false branches of
>     is_struct_ops for better readability.
>
> Here is the original link:
> https://lore.kernel.org/bpf/20260821233516.3426127-8-memxor@gmail.com/
>
> This version is based on the series:
> https://lore.kernel.org/loongarch/20261016081006.26069-1-yangtiezhu@loong=
son.cn/
>
>  arch/loongarch/net/bpf_jit.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 1a7c8effc37b..c6784602f029 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1725,17 +1725,22 @@ int bpf_arch_text_invalidate(void *dst, size_t le=
n)
>         return ret;
>  }
>
> -static void store_args(struct jit_ctx *ctx, int nr_arg_slots, int args_o=
ff)
> +static void store_args(struct jit_ctx *ctx, int nr_arg_slots, int args_o=
ff, bool is_struct_ops)
>  {
> +       /*
> +        * Indirect struct_ops trampolines place incoming stack arguments=
 directly at FP.
> +        * Regular fentry trampolines need to skip the 16-byte RA/FP fram=
e record saved
> +        * for the parent function.
> +        */
> +       int stack_args_off =3D is_struct_ops ? 0 : 16;
>         int i;
>
>         for (i =3D 0; i < nr_arg_slots; i++) {
>                 if (i < LOONGARCH_MAX_REG_ARGS)
>                         emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, LOONGAR=
CH_GPR_FP, -args_off);
>                 else {
> -                       /* Skip slots for T0 and FP of traced function */
>                         emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_G=
PR_FP,
> -                                 16 + (i - LOONGARCH_MAX_REG_ARGS) * 8);
> +                                 stack_args_off + (i - LOONGARCH_MAX_REG=
_ARGS) * 8);
>                         emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_G=
PR_FP, -args_off);
>                 }
>                 args_off -=3D 8;
> @@ -2068,7 +2073,7 @@ static int __arch_prepare_bpf_trampoline(struct jit=
_ctx *ctx, struct bpf_tramp_i
>         func_meta =3D nr_arg_slots;
>         emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -func_meta_off, fun=
c_meta);
>
> -       store_args(ctx, nr_arg_slots, args_off);
> +       store_args(ctx, nr_arg_slots, args_off, is_struct_ops);
>
>         if (bpf_fsession_cnt(tnodes)) {
>                 /* clear all session cookies' value */
> --
> 2.42.0
>
