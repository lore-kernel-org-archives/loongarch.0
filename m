Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793064997;
	b=VMsOHmi9OH+uRd963XCbXAP0qLT2UMNGIvvs+1ZojRL0E+SlJICr9JAvZ2bdi1IszChS
	 8IzQVw5M/B1ETwreyxiWtbvQrRgv/aZahIvi+G6YNX5oTv9jWnCb01i4iKvds0mINDoqQ
	 qDMEsH+zJmOCVh4lIbwHwB9G2HobnrhOl40fEJPp27cpa9TBJBn2iGNYAE8vKJogr1a2h
	 wbWmL+0FeSsgCsCuCDmCNKB8aYCCK04F0b6/bU8ngD0JjbRjIXb4IeLaA3MY03GTIy2us
	 M4Vz1H16DkVkwPiiMdBqcsYwHyctMVwJF8NmwUF+zWxh8MhN7V3G7I9dpQW49Ow9wmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uJ7o4z3LZNIgv4lmDPckfI0AYkLgwXR/dko+SDg6wpc=;
	b=ic06/0aZieI7dAwuaL1VlFzYAuq2WpLLwXQQMeiPINybIZ/SCsP88Q+K49zRa/t4kcsu
	 NXM7ZCF7h0xfVB+Damnb5H/4BoxgqE5jbioS4A6UQiBtroaX3bCkgHy0DUQLB0ti2B+7N
	 Nx3rTeZWiK/Ma49JGHy4NOgvYKRVHfvS+QZTL8mOoTj8Z8SAakLr3fmi7t1XyG0T7LEuA
	 1EN4GdVwOmJJ7cyeBPmm9eMtMUHXLJcvXAVNcGflB3r2jrgldl1Wo4MCacltqWJktvv3V
	 QRljVtbvRk9dcgfVSuYKZElaXjFYTNHEfSEvWW77HPIcGR1XF3d4INUL99CJG6V5AQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eVy7aaki;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE5606A31B
	for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 01:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CE5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eVy7aaki
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-49429181ce9so2026273fac.0
        for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 18:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793064995; cv=none;
        d=google.com; s=arc-20260327;
        b=W+QQjZRz2n3tMzRgi5AJB4Erlkqi/2ssnAFh4M20RtI6GUEzTZ64behz11GdlMHIGx
         o6c5HUOrKfZzRUZnQ9bAzvYHeB+RalIGOHwL2gxsFplv/OrgUeWq1fyxmd2mg/e+0DQ+
         k50XJvhI58oytowkWI74BFt6MF0nvITuJ+M70cKK24bwI40bNlBx8WrUV1iJs91i36zj
         AmGABw5R/P/NbVOxV6aX3vxBqfx0/2f5JxR67TY4BfQaKHHJ5bjsimcJBOX759KKFsvQ
         awG7gCb7p+bXOPpcGtGxsKHLWEXGSYlf7rAeX6VEjfQycyVNPXSL7iIXpv/MFC3q+O+P
         Qo5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uJ7o4z3LZNIgv4lmDPckfI0AYkLgwXR/dko+SDg6wpc=;
        fh=Ac9dbjfDgYrmJUP9QyxNVpkey9PV2ACTOR2GDjWmnnw=;
        b=OHmgj8FHVmTgH6meXkPGHvh2pRPRsQuztywPovx+0Xs4GGQYiMq06moaooA9VyMNFf
         QtSo9HtbuzY6iSKtHrrPuwfmYelOLTgUTSq+b9HnhA2Y1QGnxUVxeeUWJ13Vkg9mPuLs
         kqFZDpNN3/8m7o6Vg0m5CNSl+7+h1FiFMpLRIe6X/+iEohSpL90rPf7qEXYQuiZOHHVD
         em04LP5IN+avweZWDTPEgs7EGmAvhoh6cUDeQMVzhEp3cFaDLZadzsG4cIoEJv4BPRNv
         3Hvr60s/ug/4335Zpz8Tgte4ZFcLF6mbUOojA3qYDckRSQlfukJxMsrAY+UB7b5JVwza
         wzmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793064995; x=1793669795; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJ7o4z3LZNIgv4lmDPckfI0AYkLgwXR/dko+SDg6wpc=;
        b=eVy7aakizAncyn46TCiAxBpPWqgUL6ucsCdevAyRZo0+IzeeAxtxLROMyPDeuCRiI1
         NrwYRii/FoDCP9fyA3RLcL86rgCMhuQcrF6lYhqBscB6uvIy0eZWM2Fqczy/x1q5cGGe
         itdJJnxCVTYcj1ZgjieYyiVYbdbMGMU8f9vw4BVHX/3S2Xg44IeQ18jcjsWRHnUWC25b
         f6L7crZmMkWXLryEt1RWEIdyx+rwlz3KwfN1NEywvN1S5xITasFE6TsZvKwmWF9eWKCU
         DBbkBOftct4HAWWSmVuTHPc6hlKsgQQ41dbgkrKWSvyfzR7X+QQwMiL8xkpjzUxaKXRp
         5FkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793064995; x=1793669795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJ7o4z3LZNIgv4lmDPckfI0AYkLgwXR/dko+SDg6wpc=;
        b=ssvMJ2S2zE/dXEaoajWuJ2/BCfaYT9lLk/gnmYJPpBSpLU/Z/4gSwsC/n7oAE8n8j6
         evwAdqyj5SmQjTWDYa0tM6QWViknpPS2IYOY65AJ6dy61JF00p8/lB3B+yOTyx73DYXx
         xfJh9PJkjNZ4bzvmnmtqvnqq0mGLTg8VVIJX9IIAmXplSkcWU2LYD4s/LamI9CFkOKk0
         34eZggTFamirXwVaQc6u86UV8/zg/eRJ7swuSWJXMQEY/rmifW1ho+puQagrKezcurXe
         k/lL3av9wXQQEOIlWFQrAHsRVBXp8koG6mU/TP97jTKqChGLoyAIZZ/jDK5sNf2X3UjP
         z73g==
X-Forwarded-Encrypted: i=1; AKwUvBynuldKaL0ZDmBq06pbdfCHJ9O82x2JK3DMsRCOKVXlh7VGiquOa4g90kxeZ02fGmo2h0lq8IqeugM=@lists.linux.dev
X-Gm-Message-State: AFq9FYI0UqNy1GPH962teCtoCCg0R3Ic+8qX4Vt/EvazjZtcWqeAeihQ
	UyWNAjLTxPbUvUSSWn8TL3kq0ln68jsYX7T5id1PWjEWvF7U9lcJJy1wGHMUihWACNUecJfe1/3
	bPt48KK+6o9JWZpatMsi6VV6AaAdn0oE=
X-Gm-Gg: AYBFou2Raud6JLLcuz0x7J2EMDDMqdK7BD2Ree+hKQzopvfUA+Hh9/ifPrVUDUg8dKM
	itbvSE9A32bLfYD18g1v2dSaBBUVu8JlnZBEIozah/mCSOxp3TG+WCFofRdcz3KtKlclAzykWoV
	CAiIWABpVCmkx3MnJRNF1tDBncgwrTUf3n3llA2BwiboSlzIWw3n7gp8F0ydGJ3LVSq9bYGgXRo
	ghOCrS6l89jkpG8DKbSwLFcOfJDjpf1q2lOwNlqtmNSbXTIxZlyZd2BlLYDR8EL3byUOYPxXZBC
	iFaOFs+l5K2OrwPfUJgCNw1k8scCA/CQCdVxYDvNiqaQzXk2cksCQe4qIdKvnqBXePnGlGsntvM
	v/SkDI3szDgrdIc5MynuuyHqChLiIDxaq+c+GoQ==
X-Received: by 2002:a05:6871:a842:b0:4a8:d5f:a1f9 with SMTP id
 586e51a60fabf-4a83f5ad043mr5699465fac.30.1793064994997; Mon, 26 Oct 2026
 18:36:34 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016081006.26069-1-yangtiezhu@loongson.cn> <20261016081006.26069-3-yangtiezhu@loongson.cn>
In-Reply-To: <20261016081006.26069-3-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 27 Oct 2026 09:36:23 +0800
X-Gm-Features: AclHuK8NUGUQwNg3x4d8i8Yt9qwpmzt7G03qMuZrklzkhNQomf18NVm_P8aDiWc
Message-ID: <CAEyhmHTNA_XbSW+xWss6+7bT29NxazXB2UBGatRyPUQUc667jQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] LoongArch: BPF: Clean up and decouple is32
 parameter from move_imm()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> The current move_imm() relies on the 'is32' parameter for ALU32 and JMP32=
,
> forcing the helper to internally clear the upper 32 bits. However, this i=
s
> redundant for 64-bit immediate loads. Furthermore, it is even undesirable
> for load/store signed address offset computations.
>
> Clean up move_imm() by removing the 'is32' parameter which allows it to
> focus on loading values, while moving the zero-extension logic outward to
> the explicit callers. For 64-bit and load-store operations, just drop the
> parameter.
>
> This is preparation for later patch, no functional changes.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

>  arch/loongarch/net/bpf_jit.c | 102 +++++++++++++++++++----------------
>  arch/loongarch/net/bpf_jit.h |   7 +--
>  2 files changed, 58 insertions(+), 51 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index e78eb582c300..77cd96a6f84c 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -194,7 +194,7 @@ static void build_prologue(struct jit_ctx *ctx)
>         ctx->stack_size =3D stack_adjust;
>
>         if (ctx->arena_vm_start)
> -               move_imm(ctx, REG_ARENA, ctx->arena_vm_start, false);
> +               move_imm(ctx, REG_ARENA, ctx->arena_vm_start);
>  }
>
>  static void __build_epilogue(struct jit_ctx *ctx, bool is_tail_call)
> @@ -339,7 +339,7 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx, in=
t insn)
>
>  static void emit_store_stack_imm64(struct jit_ctx *ctx, int reg, int sta=
ck_off, u64 imm64)
>  {
> -       move_imm(ctx, reg, imm64, false);
> +       move_imm(ctx, reg, imm64);
>         emit_insn(ctx, std, reg, LOONGARCH_GPR_FP, stack_off);
>  }
>
> @@ -355,7 +355,7 @@ static int emit_atomic_rmw(const struct bpf_insn *ins=
n, struct jit_ctx *ctx)
>         const s32 imm =3D insn->imm;
>         const bool isdw =3D BPF_SIZE(insn->code) =3D=3D BPF_DW;
>
> -       move_imm(ctx, t1, off, false);
> +       move_imm(ctx, t1, off);
>         emit_insn(ctx, addd, t1, dst, t1);
>         move_reg(ctx, t3, src);
>
> @@ -528,7 +528,7 @@ static int emit_atomic_ld_st(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, ldbu, dst, src, off);
>                         } else {
> -                               move_imm(ctx, t1, off, false);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, ldxbu, dst, src, t1);
>                         }
>                         break;
> @@ -536,7 +536,7 @@ static int emit_atomic_ld_st(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, ldhu, dst, src, off);
>                         } else {
> -                               move_imm(ctx, t1, off, false);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, ldxhu, dst, src, t1);
>                         }
>                         break;
> @@ -544,7 +544,7 @@ static int emit_atomic_ld_st(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, ldwu, dst, src, off);
>                         } else {
> -                               move_imm(ctx, t1, off, false);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, ldxwu, dst, src, t1);
>                         }
>                         break;
> @@ -552,7 +552,7 @@ static int emit_atomic_ld_st(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, ldd, dst, src, off);
>                         } else {
> -                               move_imm(ctx, t1, off, false);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, ldxd, dst, src, t1);
>                         }
>                         break;
> @@ -567,7 +567,7 @@ static int emit_atomic_ld_st(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, stb, src, dst, off);
>                         } else {
> -                               move_imm(ctx, t1, off, false);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxb, src, dst, t1);
>                         }
>                         break;
> @@ -575,7 +575,7 @@ static int emit_atomic_ld_st(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, sth, src, dst, off);
>                         } else {
> -                               move_imm(ctx, t1, off, false);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxh, src, dst, t1);
>                         }
>                         break;
> @@ -583,7 +583,7 @@ static int emit_atomic_ld_st(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, stw, src, dst, off);
>                         } else {
> -                               move_imm(ctx, t1, off, false);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxw, src, dst, t1);
>                         }
>                         break;
> @@ -591,7 +591,7 @@ static int emit_atomic_ld_st(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, std, src, dst, off);
>                         } else {
> -                               move_imm(ctx, t1, off, false);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxd, src, dst, t1);
>                         }
>                         break;
> @@ -716,7 +716,7 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>                 if (insn_is_cast_user(insn)) {
>                         move_reg(ctx, t1, src);
>                         emit_zext_32(ctx, t1, true);
> -                       move_imm(ctx, dst, (ctx->user_vm_start >> 32) << =
32, false);
> +                       move_imm(ctx, dst, (ctx->user_vm_start >> 32) << =
32);
>                         emit_insn(ctx, beq, t1, LOONGARCH_GPR_ZERO, 2);
>                         emit_insn(ctx, or, t1, dst, t1);
>                         move_reg(ctx, dst, t1);
> @@ -753,7 +753,8 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>         /* dst =3D imm */
>         case BPF_ALU | BPF_MOV | BPF_K:
>         case BPF_ALU64 | BPF_MOV | BPF_K:
> -               move_imm(ctx, dst, imm, is32);
> +               move_imm(ctx, dst, imm);
> +               emit_zext_32(ctx, dst, is32);
>                 break;
>
>         /* dst =3D dst + src */
> @@ -769,7 +770,8 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>                 if (is_signed_imm12(imm)) {
>                         emit_insn(ctx, addid, dst, dst, imm);
>                 } else {
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
> +                       emit_zext_32(ctx, t1, is32);
>                         emit_insn(ctx, addd, dst, dst, t1);
>                 }
>                 emit_zext_32(ctx, dst, is32);
> @@ -788,7 +790,8 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>                 if (is_signed_imm12(-imm)) {
>                         emit_insn(ctx, addid, dst, dst, -imm);
>                 } else {
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
> +                       emit_zext_32(ctx, t1, is32);
>                         emit_insn(ctx, subd, dst, dst, t1);
>                 }
>                 emit_zext_32(ctx, dst, is32);
> @@ -804,7 +807,8 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>         /* dst =3D dst * imm */
>         case BPF_ALU | BPF_MUL | BPF_K:
>         case BPF_ALU64 | BPF_MUL | BPF_K:
> -               move_imm(ctx, t1, imm, is32);
> +               move_imm(ctx, t1, imm);
> +               emit_zext_32(ctx, t1, is32);
>                 emit_insn(ctx, muld, dst, dst, t1);
>                 emit_zext_32(ctx, dst, is32);
>                 break;
> @@ -831,12 +835,13 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>         case BPF_ALU | BPF_DIV | BPF_K:
>         case BPF_ALU64 | BPF_DIV | BPF_K:
>                 if (!off) {
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
> +                       emit_zext_32(ctx, t1, is32);
>                         emit_zext_32(ctx, dst, is32);
>                         emit_insn(ctx, divdu, dst, dst, t1);
>                         emit_zext_32(ctx, dst, is32);
>                 } else {
> -                       move_imm(ctx, t1, imm, false);
> +                       move_imm(ctx, t1, imm);
>                         emit_sext_32(ctx, t1, is32);
>                         emit_sext_32(ctx, dst, is32);
>                         emit_insn(ctx, divd, dst, dst, t1);
> @@ -866,12 +871,13 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>         case BPF_ALU | BPF_MOD | BPF_K:
>         case BPF_ALU64 | BPF_MOD | BPF_K:
>                 if (!off) {
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
> +                       emit_zext_32(ctx, t1, is32);
>                         emit_zext_32(ctx, dst, is32);
>                         emit_insn(ctx, moddu, dst, dst, t1);
>                         emit_zext_32(ctx, dst, is32);
>                 } else {
> -                       move_imm(ctx, t1, imm, false);
> +                       move_imm(ctx, t1, imm);
>                         emit_sext_32(ctx, t1, is32);
>                         emit_sext_32(ctx, dst, is32);
>                         emit_insn(ctx, modd, dst, dst, t1);
> @@ -899,7 +905,8 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>                 if (is_unsigned_imm12(imm)) {
>                         emit_insn(ctx, andi, dst, dst, imm);
>                 } else {
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
> +                       emit_zext_32(ctx, t1, is32);
>                         emit_insn(ctx, and, dst, dst, t1);
>                 }
>                 emit_zext_32(ctx, dst, is32);
> @@ -918,7 +925,8 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>                 if (is_unsigned_imm12(imm)) {
>                         emit_insn(ctx, ori, dst, dst, imm);
>                 } else {
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
> +                       emit_zext_32(ctx, t1, is32);
>                         emit_insn(ctx, or, dst, dst, t1);
>                 }
>                 emit_zext_32(ctx, dst, is32);
> @@ -937,7 +945,8 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>                 if (is_unsigned_imm12(imm)) {
>                         emit_insn(ctx, xori, dst, dst, imm);
>                 } else {
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
> +                       emit_zext_32(ctx, t1, is32);
>                         emit_insn(ctx, xor, dst, dst, t1);
>                 }
>                 emit_zext_32(ctx, dst, is32);
> @@ -1097,7 +1106,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>         case BPF_JMP32 | BPF_JSLE | BPF_K:
>                 jmp_offset =3D bpf2la_offset(i, off, ctx);
>                 if (imm) {
> -                       move_imm(ctx, t1, imm, false);
> +                       move_imm(ctx, t1, imm);
>                         tm =3D t1;
>                 } else {
>                         /* If imm is 0, simply use zero register. */
> @@ -1129,7 +1138,8 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>         case BPF_JMP | BPF_JSET | BPF_K:
>         case BPF_JMP32 | BPF_JSET | BPF_K:
>                 jmp_offset =3D bpf2la_offset(i, off, ctx);
> -               move_imm(ctx, t1, imm, is32);
> +               move_imm(ctx, t1, imm);
> +               emit_zext_32(ctx, t1, is32);
>                 emit_insn(ctx, and, t1, dst, t1);
>                 emit_zext_32(ctx, t1, is32);
>                 if (emit_cond_jmp(ctx, cond, t1, LOONGARCH_GPR_ZERO, jmp_=
offset) < 0)
> @@ -1227,7 +1237,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                 if (bpf_pseudo_func(insn))
>                         move_addr(ctx, dst, imm64);
>                 else
> -                       move_imm(ctx, dst, imm64, is32);
> +                       move_imm(ctx, dst, imm64);
>                 return 1;
>         }
>
> @@ -1268,7 +1278,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                                 else
>                                         emit_insn(ctx, ldbu, dst, src, of=
f);
>                         } else {
> -                               move_imm(ctx, t1, off, is32);
> +                               move_imm(ctx, t1, off);
>                                 if (sign_extend)
>                                         emit_insn(ctx, ldxb, dst, src, t1=
);
>                                 else
> @@ -1282,7 +1292,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                                 else
>                                         emit_insn(ctx, ldhu, dst, src, of=
f);
>                         } else {
> -                               move_imm(ctx, t1, off, is32);
> +                               move_imm(ctx, t1, off);
>                                 if (sign_extend)
>                                         emit_insn(ctx, ldxh, dst, src, t1=
);
>                                 else
> @@ -1296,7 +1306,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                                 else
>                                         emit_insn(ctx, ldwu, dst, src, of=
f);
>                         } else {
> -                               move_imm(ctx, t1, off, is32);
> +                               move_imm(ctx, t1, off);
>                                 if (sign_extend)
>                                         emit_insn(ctx, ldxw, dst, src, t1=
);
>                                 else
> @@ -1304,7 +1314,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                         }
>                         break;
>                 case BPF_DW:
> -                       move_imm(ctx, t1, off, is32);
> +                       move_imm(ctx, t1, off);
>                         emit_insn(ctx, ldxd, dst, src, t1);
>                         break;
>                 }
> @@ -1331,42 +1341,42 @@ static int build_insn(const struct bpf_insn *insn=
, struct jit_ctx *ctx, bool ext
>
>                 switch (BPF_SIZE(code)) {
>                 case BPF_B:
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, stb, t1, dst, off);
>                         } else {
> -                               move_imm(ctx, t2, off, is32);
> +                               move_imm(ctx, t2, off);
>                                 emit_insn(ctx, stxb, t1, dst, t2);
>                         }
>                         break;
>                 case BPF_H:
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, sth, t1, dst, off);
>                         } else {
> -                               move_imm(ctx, t2, off, is32);
> +                               move_imm(ctx, t2, off);
>                                 emit_insn(ctx, stxh, t1, dst, t2);
>                         }
>                         break;
>                 case BPF_W:
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, stw, t1, dst, off);
>                         } else if (is_signed_imm14(off)) {
>                                 emit_insn(ctx, stptrw, t1, dst, off);
>                         } else {
> -                               move_imm(ctx, t2, off, is32);
> +                               move_imm(ctx, t2, off);
>                                 emit_insn(ctx, stxw, t1, dst, t2);
>                         }
>                         break;
>                 case BPF_DW:
> -                       move_imm(ctx, t1, imm, is32);
> +                       move_imm(ctx, t1, imm);
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, std, t1, dst, off);
>                         } else if (is_signed_imm14(off)) {
>                                 emit_insn(ctx, stptrd, t1, dst, off);
>                         } else {
> -                               move_imm(ctx, t2, off, is32);
> +                               move_imm(ctx, t2, off);
>                                 emit_insn(ctx, stxd, t1, dst, t2);
>                         }
>                         break;
> @@ -1397,7 +1407,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, stb, src, dst, off);
>                         } else {
> -                               move_imm(ctx, t1, off, is32);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxb, src, dst, t1);
>                         }
>                         break;
> @@ -1405,7 +1415,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, sth, src, dst, off);
>                         } else {
> -                               move_imm(ctx, t1, off, is32);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxh, src, dst, t1);
>                         }
>                         break;
> @@ -1415,7 +1425,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                         } else if (is_signed_imm14(off)) {
>                                 emit_insn(ctx, stptrw, src, dst, off);
>                         } else {
> -                               move_imm(ctx, t1, off, is32);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxw, src, dst, t1);
>                         }
>                         break;
> @@ -1425,7 +1435,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                         } else if (is_signed_imm14(off)) {
>                                 emit_insn(ctx, stptrd, src, dst, off);
>                         } else {
> -                               move_imm(ctx, t1, off, is32);
> +                               move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxd, src, dst, t1);
>                         }
>                         break;
> @@ -1537,7 +1547,7 @@ static int emit_jump_and_link(struct jit_ctx *ctx, =
u8 rd, u64 target)
>                 return -EFAULT;
>         }
>
> -       move_imm(ctx, LOONGARCH_GPR_T1, target, false);
> +       move_imm(ctx, LOONGARCH_GPR_T1, target);
>         emit_insn(ctx, jirl, rd, LOONGARCH_GPR_T1, 0);
>
>         return 0;
> @@ -1734,7 +1744,7 @@ static int invoke_bpf_prog(struct jit_ctx *ctx, str=
uct bpf_tramp_image *im,
>                 emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP,=
 -run_ctx_off + cookie_off);
>
>         /* arg1: prog */
> -       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p);
>         /* arg2: &run_ctx */
>         emit_insn(ctx, addid, LOONGARCH_GPR_A1, LOONGARCH_GPR_FP, -run_ct=
x_off);
>         ret =3D emit_call(ctx, (const u64)bpf_trampoline_enter(p));
> @@ -1755,7 +1765,7 @@ static int invoke_bpf_prog(struct jit_ctx *ctx, str=
uct bpf_tramp_image *im,
>         /* arg1: &args_off */
>         emit_insn(ctx, addid, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -args_o=
ff);
>         if (!p->jited)
> -               move_imm(ctx, LOONGARCH_GPR_A1, (const s64)p->insnsi, fal=
se);
> +               move_imm(ctx, LOONGARCH_GPR_A1, (const s64)p->insnsi);
>         ret =3D emit_call(ctx, (const u64)p->bpf_func);
>         if (ret)
>                 return ret;
> @@ -1772,7 +1782,7 @@ static int invoke_bpf_prog(struct jit_ctx *ctx, str=
uct bpf_tramp_image *im,
>         }
>
>         /* arg1: prog */
> -       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p);
>         /* arg2: prog start time */
>         move_reg(ctx, LOONGARCH_GPR_A1, LOONGARCH_GPR_S1);
>         /* arg3: &run_ctx */
> diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
> index bb58c42c2f2a..57a98f8a055b 100644
> --- a/arch/loongarch/net/bpf_jit.h
> +++ b/arch/loongarch/net/bpf_jit.h
> @@ -137,7 +137,7 @@ static inline void move_addr(struct jit_ctx *ctx, enu=
m loongarch_gpr rd, u64 add
>         emit_insn(ctx, lu52id, rd, rd, imm_63_52);
>  }
>
> -static inline void move_imm(struct jit_ctx *ctx, enum loongarch_gpr rd, =
long imm, bool is32)
> +static inline void move_imm(struct jit_ctx *ctx, enum loongarch_gpr rd, =
long imm)
>  {
>         long imm_11_0, imm_31_12, imm_51_32, imm_63_52, imm_51_0, imm_51_=
31;
>
> @@ -150,7 +150,7 @@ static inline void move_imm(struct jit_ctx *ctx, enum=
 loongarch_gpr rd, long imm
>         /* addiw rd, $zero, imm_11_0 */
>         if (is_signed_imm12(imm)) {
>                 emit_insn(ctx, addiw, rd, LOONGARCH_GPR_ZERO, imm);
> -               goto zext;
> +               return;
>         }
>
>         /* ori rd, $zero, imm_11_0 */
> @@ -195,9 +195,6 @@ static inline void move_imm(struct jit_ctx *ctx, enum=
 loongarch_gpr rd, long imm
>                 if (!is_signed_imm52(imm))
>                         emit_insn(ctx, lu52id, rd, rd, imm_63_52);
>         }
> -
> -zext:
> -       emit_zext_32(ctx, rd, is32);
>  }
>
>  static inline void move_reg(struct jit_ctx *ctx, enum loongarch_gpr rd,
> --
> 2.42.0
>
