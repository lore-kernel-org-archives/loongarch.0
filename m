Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0559304BB3
	for <loongarch@lists.linux.dev>; Wed, 15 Apr 2026 02:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776219965; cv=pass; b=NT6MFAYb1zq0R44lttdGJO6Qxz7fCclnXsEfwKxv3H0tqeMYdBTA9rcsp+prCI1U5jjPYwHsgAFXqBMaf5L0cyG9aAcHwOuUv7kbdHbMy9HEdGKL1DOqBCnelKF558r85ljuu2CdMSdK3shiez1GlkzZD72ij7wiam6dELZde2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776219965; c=relaxed/simple;
	bh=MRxcm7Tt46pg3Kzyyf0G+uZbnfC1nYlRE224oNDetjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1IEE6x06h7D9Xr6UC1gHkJJJXp7wwWx2Pw/yEnF3950Ezud6qSf6dvIv6TCck7RIcegZxdpsb4roaB1GsXFlIR1lY259n6nFN7IrIDxSDIlgofSEHk1Wxy57E3Kr3KfSN3eZFNAddhJIe2gX/nZBYQwdGC9G4VCybA9oYFAz5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rsueyk95; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rsueyk95"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-685013eb590so3931676eaf.1
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 19:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776219963; cv=none;
        d=google.com; s=arc-20240605;
        b=MdI6fH0V6N4fWRXk9jAXhKMftfmIkfMMrqDg1bzk8Bnn6GK88IgAQkn5vHxnp+2kLh
         Y3ENcb7TEmIfwhsuWaVFQwxTCKW8xdxDpAWc0YO0NCWk84G0U9y1IDwFRb5IWE+9U7TX
         5GKf9nWhZ+Ag7WbRy5jLhISO8Suuygf1OEJIX0aDzqnszb7k1OF6fBJyaPIpcamHmVML
         7bMYyBN/LDPnjeMy5OU1Pkbd6Ofw5c8Vy0l+7J2M5BUsE5RF7hfbJFkpu+mUEEJG9yS4
         zUcEGOjIGqDIhdGu5rOeIpypW/1CWIMhd09TkRzFu7emkIJ0FSScHQTWJdMQBFB37q5k
         hpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gp8opaCO4NhzR0MzPaxnczut02ydEKc5TESqHBl8R9A=;
        fh=JbZ/KZSUBWctt7fRw0K+nFqj7a7//hICYVTuttDjsEU=;
        b=d+rySu5cQ4fwKmD1BSqcHEMJqf2+oEEhGxBK+SGm4VRAH8mzIplH7FzXBYyWBWud71
         r2WjNFUtYSAanrJ8xZOkV7pzwWOfnDdsVwmj3nujqqvGcAcqZln21eUq8Y1AEvzdT5PC
         BKQnJeNecdfucizm5CyC+jUhxbsMePrMtTJu5bXvl87eBRabxPkRi1SqX2siDjF1Cig3
         R8zxGT9mKAtlfQYXDv6ug1XAxsVhyAH7rYmT356czs4vK7hJESDm8FlbItgAw/U0dQYV
         9yHTFcNgmPKjsjqCMErExCGGBbKz+83gOu1ZmLODpVh6E9PeQk/8sdL3oMY/pIMGt0Wh
         p+Yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776219963; x=1776824763; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gp8opaCO4NhzR0MzPaxnczut02ydEKc5TESqHBl8R9A=;
        b=rsueyk95iMEtqgjvE3M2n6lUPqs9mq8tnm5GxE6uTwbsLhotxJ84QbUZNQw2rZ8qQg
         BDmYZ/zivzZH7qSQdU61bJT0xRl6e+1NlHL+ecO4yb9BIpsq5r+8iYeotkNMaz137nLW
         KDPXkc4ENmiR+0VgxPh4G1V5uK5p0Fnv79SyLe0qvJJspNTq4JaRQyyTXDP1jb2u6Xsl
         ASNBwyWQb49EKudD3Kv2pPQUU8ZO49TKcMpHR9PvR5fFJI3DXKVbSSjdlzbAW76s+tyW
         T5+oYFRmAz3FfbPCLGA2aFyrYp8COYQsEAGMinZ46SUqq9YG13RXRIlrKiLW4aBSNUid
         hONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776219963; x=1776824763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gp8opaCO4NhzR0MzPaxnczut02ydEKc5TESqHBl8R9A=;
        b=eDARoY3XqmG9WVO6P6J8+x/GJe1HcjLKDZqnnLLQ+9BTkLjUuHDDRFpamCOWIrry2I
         9oVbItPyFD4mBJV2YlVqd+90OLh+mJUUyHav19KJEebrpEccyBZJvXTbfg8NFqjOALku
         o8CBVjKqsTSIszf6mrEfZf4FoB7OxtEIk/oq6F9A3GraCBrr2AstzzW0WmN7Sy6cQIt7
         Ek5m4VLg135s8E0hBFO/69UEFA2Fb4tYa2MydCrtmjcjWDo/F5n420Q+/dKnxcXd/GQb
         /yOEeIFftvngnGYbu63i6fbaW5GpWIkw9G3ANr7kimGG9IuA6f7vABPSrwqarSD9sRjR
         0gcw==
X-Forwarded-Encrypted: i=1; AFNElJ8+PTp0PPoKKo9MioXwCyfu7U3iWLMkN7DVwC2537dDPiUzgmIUJCd+K0gBjhs9hFi9IEJt0z4dX00=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXzJsbjGMynSvN3tUKMnToeR5fNGdlNsED+pxGAesLAPJu5Gm2
	3Lq/wEzafPiBE71T1gv9FqJbk88cW747FqBuRUgN0sRjhXf2dEx8PgGAzvTTpmmuqNQroLgXhLF
	HX9S11c2VKUfLWw+jTS6oGrX75e9nhmY=
X-Gm-Gg: AeBDiesUAez0WssA07ejKKMmifbdSfbxaKbx7dN6eNnXv7dduTXpPVouy1KOuInbfyr
	dUo4f+sje+3/Zy0YleiEv/UYi8x0HthJAPH+v3NDoYLcMSAp8MNLjE2SHH7m63bC5lMFuPBtNDY
	g1orgMoYFecZHtGIFGvQ2kErNhshfMNRJtNFL4Ozmcw5hITcfsXCjxbGSrprr21QcdQnfRJe8Rq
	OyTLiGfmFzWJZEJHKgi4axaXxTT13/fsNBVjnjOdp6sluUqUksdmdnNy/RMcK0Q5CsqrlCDxN3i
	BqUwn3XOlbBJvDq7XQ==
X-Received: by 2002:a05:6820:4a19:b0:68d:bb0e:9c97 with SMTP id
 006d021491bc7-68dbb0eababmr6173327eaf.7.1776219962919; Tue, 14 Apr 2026
 19:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413040506.26640-1-yangtiezhu@loongson.cn> <20260413040506.26640-5-yangtiezhu@loongson.cn>
In-Reply-To: <20260413040506.26640-5-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 15 Apr 2026 10:25:50 +0800
X-Gm-Features: AQROBzAYMUwwbM_D7VxSXaSrDZ-TdfqCtp088Lx3Nk63PjxURNHrlxO41NLFNU4
Message-ID: <CAEyhmHShzVtNg-ct0PGXGfMuF_4i7-BG-bfXvPrwS1wbCcKmZw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] LoongArch: BPF: Support load-acquire and
 store-release instructions
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 12:05=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> Use the LoongArch common memory access instructions with the barrier dbar
> to support the BPF load-acquire and store-release instructions.
>
> With this patch, the following testcases passed on LoongArch if the macro
> CAN_USE_LOAD_ACQ_STORE_REL is usable in bpf selftests:
>
>   sudo ./test_progs -t verifier_load_acquire
>   sudo ./test_progs -t verifier_store_release
>   sudo ./test_progs -t verifier_precision/bpf_load_acquire
>   sudo ./test_progs -t verifier_precision/bpf_store_release
>   sudo ./test_progs -t compute_live_registers/atomic_load_acq_store_rel
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 98 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index c9a32f124f5e..805f95cbe798 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -344,6 +344,99 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx, i=
nt insn)
>  #undef jmp_offset
>  }
>
> +static int emit_atomic_ld_st(const struct bpf_insn *insn, struct jit_ctx=
 *ctx)
> +{
> +       const u8 t1 =3D LOONGARCH_GPR_T1;
> +       const u8 src =3D regmap[insn->src_reg];
> +       const u8 dst =3D regmap[insn->dst_reg];
> +       const s16 off =3D insn->off;
> +       const s32 imm =3D insn->imm;
> +
> +       switch (imm) {
> +       /* dst_reg =3D load_acquire(src_reg + off16) */
> +       case BPF_LOAD_ACQ:
> +               switch (BPF_SIZE(insn->code)) {
> +               case BPF_B:
> +                       if (is_signed_imm12(off)) {
> +                               emit_insn(ctx, ldbu, dst, src, off);
> +                       } else {
> +                               move_imm(ctx, t1, off, false);
> +                               emit_insn(ctx, ldxbu, dst, src, t1);
> +                       }
> +                       break;
> +               case BPF_H:
> +                       if (is_signed_imm12(off)) {
> +                               emit_insn(ctx, ldhu, dst, src, off);
> +                       } else {
> +                               move_imm(ctx, t1, off, false);
> +                               emit_insn(ctx, ldxhu, dst, src, t1);
> +                       }
> +                       break;
> +               case BPF_W:
> +                       if (is_signed_imm12(off)) {
> +                               emit_insn(ctx, ldwu, dst, src, off);
> +                       } else {
> +                               move_imm(ctx, t1, off, false);
> +                               emit_insn(ctx, ldxwu, dst, src, t1);
> +                       }
> +                       break;
> +               case BPF_DW:
> +                       if (is_signed_imm12(off)) {
> +                               emit_insn(ctx, ldd, dst, src, off);

See commit fe5757553bf9ebe45ae8ecab5922f6937c8d8dfc, need double check here=
.

> +                       } else {
> +                               move_imm(ctx, t1, off, false);
> +                               emit_insn(ctx, ldxd, dst, src, t1);
> +                       }
> +                       break;
> +               }
> +               emit_insn(ctx, dbar, 0b10100);
> +               break;
> +       /* store_release(dst_reg + off16, src_reg) */
> +       case BPF_STORE_REL:
> +               emit_insn(ctx, dbar, 0b10010);
> +               switch (BPF_SIZE(insn->code)) {
> +               case BPF_B:
> +                       if (is_signed_imm12(off)) {
> +                               emit_insn(ctx, stb, src, dst, off);
> +                       } else {
> +                               move_imm(ctx, t1, off, false);
> +                               emit_insn(ctx, stxb, src, dst, t1);
> +                       }
> +                       break;
> +               case BPF_H:
> +                       if (is_signed_imm12(off)) {
> +                               emit_insn(ctx, sth, src, dst, off);
> +                       } else {
> +                               move_imm(ctx, t1, off, false);
> +                               emit_insn(ctx, stxh, src, dst, t1);
> +                       }
> +                       break;
> +               case BPF_W:
> +                       if (is_signed_imm12(off)) {
> +                               emit_insn(ctx, stw, src, dst, off);
> +                       } else {
> +                               move_imm(ctx, t1, off, false);
> +                               emit_insn(ctx, stxw, src, dst, t1);
> +                       }
> +                       break;
> +               case BPF_DW:
> +                       if (is_signed_imm12(off)) {
> +                               emit_insn(ctx, std, src, dst, off);
> +                       } else {
> +                               move_imm(ctx, t1, off, false);
> +                               emit_insn(ctx, stxd, src, dst, t1);
> +                       }
> +                       break;
> +               }
> +               break;
> +       default:
> +               pr_err_once("bpf-jit: invalid atomic load/store opcode %0=
2x\n", imm);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
>  static int emit_atomic_rmw(const struct bpf_insn *insn, struct jit_ctx *=
ctx)
>  {
>         const u8 t1 =3D LOONGARCH_GPR_T1;
> @@ -1326,7 +1419,10 @@ static int build_insn(const struct bpf_insn *insn,=
 struct jit_ctx *ctx, bool ext
>         case BPF_STX | BPF_ATOMIC | BPF_H:
>         case BPF_STX | BPF_ATOMIC | BPF_W:
>         case BPF_STX | BPF_ATOMIC | BPF_DW:
> -               ret =3D emit_atomic_rmw(insn, ctx);
> +               if (bpf_atomic_is_load_store(insn))
> +                       ret =3D emit_atomic_ld_st(insn, ctx);
> +               else
> +                       ret =3D emit_atomic_rmw(insn, ctx);
>                 if (ret)
>                         return ret;
>                 break;
> --
> 2.42.0
>
