Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1989B3B71C6
	for <loongarch@lists.linux.dev>; Wed,  5 Aug 2026 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895682; cv=pass; b=pz9fLs3eJtaotJJPxA0xO2qOHmj9brpe8Kt0kG8sXZwyfs47cK81zfuJ0zGmHWR/cS7lHOKdmDg16qrfwYQh5++Hy2a0ZvDZp2AEbsJ5CMYiIe4hWMY/RpHNhmgNeSrSDWPAwR+53oP1pHvwKwe4uHVbUCTwREN+mO8++eRUN08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895682; c=relaxed/simple;
	bh=bo2Al5DQlcAE1N4YHSqDS6taaDUG9W+7g7pyrnCn0uE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PW+4HIa6Z9hfjB1H3AwlVyzy5aAl0ckb4pAQg+llSYjAn87UooW8XQUyuIZCLyS+hb3+HMSKVWyCYFO0BD3EOUvSyDtfwdFv03W8FORfsjSY+R0+kU69dAfbSr8JKl5VsjBfEdPIelq0rxOVVLHxLceMegx+RIQR0ntVtyAY7ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLAQHBbd; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLAQHBbd"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6aaf2f9ce3dso306117eaf.1
        for <loongarch@lists.linux.dev>; Tue, 04 Aug 2026 19:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785895673; cv=none;
        d=google.com; s=arc-20260327;
        b=SoWckQMyu9raUYWbfPN1pqcCx81l6OwMXDN07wiXTWYbelufKH7GflZ0DxgnKpr+nI
         7DC1DAX92yi3OSGoMmCkV73fLmslvUMGgU1ekO0Se3CqhkkGFdheuexet+rJyr/iwnf4
         sPfC8POwZmxJCPcmsdBdV2MEs6cHERyebDpqhLiNROmG5rNvQ7jB8p49bPWtKgC31Rm6
         9ZQW4vteXKMRoTcwBJkrJEPsmYvhfDezz/qSv8gxbyCaGr1OdeOidv2iFV971YwISXB/
         qXL7Y3jcK/8Ob35bAWSlXK/LXSiy9I052+5Ow6XBJL20N/qQQVmeH8Yutn7JyfKcYhpn
         I4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVVHXn5WZE3TAq2lS738uM6fISl8R37mJNBh8dxBNlc=;
        fh=P9VytS0MkpO0+Rl9YW7it8t0cGmCszO68mh3h2/l6OQ=;
        b=bvz5Ak2pAW4MUEuSFc85YpAabD5Q7eBBNThNdQcDub1sS7b6G6ZvFb/eHBPnJAzkUn
         YkMyoEET6CL0dzLEF5OMlLBygiJ9Yb8Ml+fr15JFOdtsxE5zWmkHx1IiB6pYUGWmwnkt
         +sxF25U+0b25VUamja0JpC+rZ7wJc1xPxSiregSIdghIFKUOx2Tn5rx80cb2PO7HZj3E
         f1xVQzOJWWG1VLIde7h4RxiVYredKusi8pINyMEZTk/59v1Vv4O6nAF6RDOHKO9qGRLG
         f3gvSiVLFxNk2E3wFD2r1VJqdvLiWTc//GJhFVzr8/FT+SmrPSZmmxGF8bEQq0SqNdvk
         yUvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785895673; x=1786500473; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVVHXn5WZE3TAq2lS738uM6fISl8R37mJNBh8dxBNlc=;
        b=PLAQHBbdr/L1J7UJ5jWSoPocAQ0T889jfyzsmq2uGvSz1E014vSb+M+BQehLYLIh3m
         e8oPRALz/PVmQnS8UP/yl8QRw+PsiXI6yP1WmK83a4rUbEQquOVlku4cNUANnAVjHlPq
         BKQ4eTlSoWa+mloObgc2j6CwKHpK48OgIoLZUIcF8z23zxl/A/WUZEtozv5UIimV9jkt
         c36yiI8K9EQ4lhWTsa3uJWN/sYxaivajVCX87lxDFEABJ8o41sO884yUEI4d6wAyLyWc
         uZSWvdSeC/KMYRx5DnpcQ29wTopnYaNLRMrip26jAGdxUz3kOqquLw6Wm9GzhGtLxRr7
         BS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785895673; x=1786500473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVVHXn5WZE3TAq2lS738uM6fISl8R37mJNBh8dxBNlc=;
        b=cYHKbojc4tt+GnsFilHQM2XuEYcnsL6RjKamY3rAOonDWN+7uulXDO5MFu4304TF7i
         qRiuERAnhrMtpqXcErrtZpDX7FwiFz3o02g4TjSgFDrNAmJp7D8TzU0/cWeKb6Gz9/xv
         zapKXlSMY9Loc0DuUxAKhF0+Ifg6UddcOhERSeQKirQ8JnHZrltUD/VbEPe3S1TEiNYg
         ustVYiBmLLMfZWHu4GwraniXU16baGz+uwx6mPJ2ZIlfG6K7n0rc0DvP9KVidFWLDbDs
         6nlEJyJPd+Ere63ns2vfkjma6PW9FB9G/eNPRAP/+3H5/nykpwQivDYkAjQoF8LFNpvg
         j7sw==
X-Forwarded-Encrypted: i=1; AHgh+RqJxsIkZ8Tuwz746zNJauSe3UwxtoA8iGS4UjGXMAvLxjMe/1x0mlSODCLDM9X7C7lnfqTVl/Y8wcI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3Xmib2SeGwgQe5tqcYDB687R1pD7HoACRMSO2ER6KSIIHiq9v
	FwIlLdz0A/RrWubdAkVHfEgtr0R7fnxyfScuLF+d7MmUMiN8zO6chry23BPvKXMc1AMFC3CZzn0
	g1U27HFNypL04AJKPMsvmOyPoLOdWaUI=
X-Gm-Gg: AR+sD12EDGlly06vbtTtAwl7CxPbGgHUu04bGmwNL+PZWNiULkjViVYwex+0UWPxvhf
	/0ZHlCvsMtNiGNHQYRoDn8HlCALIUSEBQ/CphW0p4qfV1LDqyKZa0LA11d2w+LotZ7mD7yzKLXW
	lcOI3HiRmECpbajlvS3iUvoI2jmYyO5F6rO+eobb/mt3EWwi7FL4sm/4C8c7OSsAXbKjd8XKF8S
	EzL0QwX5JjksHeh1WD5+EGXhvS89atxw5BcT14sAchhsylyVMvMGtSxhHHNrus5s95EnttcmlGU
	kkon9mkqDkB3b1DhNiwMh4UAis2B33a79nSTHsXswxEqjqa1OUEEbBR2uw==
X-Received: by 2002:a05:6820:188d:b0:69e:98c0:4bd6 with SMTP id
 006d021491bc7-6ae96c3662emr1951640eaf.1.1785895673383; Tue, 04 Aug 2026
 19:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729022837.355549-1-chenguang.zhao@linux.dev> <20260729022837.355549-2-chenguang.zhao@linux.dev>
In-Reply-To: <20260729022837.355549-2-chenguang.zhao@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 5 Aug 2026 10:07:41 +0800
X-Gm-Features: AUfX_mxUnxXDGZm3CuFfAeIJjZntI0dLwAv3hjNI7wnI7mpI1FaKzmFthF5pw-c
Message-ID: <CAEyhmHTgCkt2Zezuwkqjgo+MRzA2fkpMcsz_0ddC0Y7semgyvw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] LoongArch: bpf: Fix memory ordering for
 value-returning atomics
To: Chenguang Zhao <chenguang.zhao@linux.dev>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, yangtiezhu@loongson.cn, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Chenguang Zhao <zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 10:29=E2=80=AFAM Chenguang Zhao
<chenguang.zhao@linux.dev> wrote:
>
> From: Chenguang Zhao <zhaochenguang@kylinos.cn>
>
> Per the Linux Kernel Memory Model, value-returning atomic RMW operations
> must provide sequentially consistent ordering (a full memory barrier). On
> LoongArch, plain AMO instructions and bare ll/sc loops do not satisfy thi=
s
> requirement by themselves.
>

The subject line could be:
  LoongArch: bpf: Align value-returning atomics with LKMM ordering

I think it's not a fix and we don't need a Fixes tag.

Other than that,
Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> Update emit_atomic_rmw() to emit barrier-carrying instructions for all
> value-returning BPF atomics:
>
>  - BPF_FETCH (ADD/AND/OR/XOR): use am*_db.{b,h,w,d}
>  - BPF_XCHG: use amswap_db.{b,h,w,d}
>  - BPF_CMPXCHG: emit dbar 0x700 after the ll/sc loop, matching
>    __WEAK_LLSC_MB in cmpxchg.h
>
> Add the corresponding instruction encodings and emit helpers to inst.h.
> Non-value-returning RMW ops (plain BPF_ADD, BPF_AND, etc.) are left as
> weakly ordered, consistent with LKMM.
>
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
>  arch/loongarch/include/asm/inst.h | 18 +++++++++++++++++
>  arch/loongarch/net/bpf_jit.c      | 32 +++++++++++++++++--------------
>  2 files changed, 36 insertions(+), 14 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/a=
sm/inst.h
> index 76b723590023..bdbc17d07110 100644
> --- a/arch/loongarch/include/asm/inst.h
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -199,6 +199,10 @@ enum reg3_op {
>         amswaph_op      =3D 0x70b9,
>         amaddb_op       =3D 0x70ba,
>         amaddh_op       =3D 0x70bb,
> +       amswapdbb_op    =3D 0x70bc,
> +       amswapdbh_op    =3D 0x70bd,
> +       amadddbb_op     =3D 0x70be,
> +       amadddbh_op     =3D 0x70bf,
>         amswapw_op      =3D 0x70c0,
>         amswapd_op      =3D 0x70c1,
>         amaddw_op       =3D 0x70c2,
> @@ -783,6 +787,20 @@ DEF_EMIT_REG3_FORMAT(amswapb, amswapb_op)
>  DEF_EMIT_REG3_FORMAT(amswaph, amswaph_op)
>  DEF_EMIT_REG3_FORMAT(amswapw, amswapw_op)
>  DEF_EMIT_REG3_FORMAT(amswapd, amswapd_op)
> +DEF_EMIT_REG3_FORMAT(amswapdbb, amswapdbb_op)
> +DEF_EMIT_REG3_FORMAT(amswapdbh, amswapdbh_op)
> +DEF_EMIT_REG3_FORMAT(amadddbb, amadddbb_op)
> +DEF_EMIT_REG3_FORMAT(amadddbh, amadddbh_op)
> +DEF_EMIT_REG3_FORMAT(amadddbw, amadddbw_op)
> +DEF_EMIT_REG3_FORMAT(amadddbd, amadddbd_op)
> +DEF_EMIT_REG3_FORMAT(amanddbw, amanddbw_op)
> +DEF_EMIT_REG3_FORMAT(amanddbd, amanddbd_op)
> +DEF_EMIT_REG3_FORMAT(amordbw, amordbw_op)
> +DEF_EMIT_REG3_FORMAT(amordbd, amordbd_op)
> +DEF_EMIT_REG3_FORMAT(amxordbw, amxordbw_op)
> +DEF_EMIT_REG3_FORMAT(amxordbd, amxordbd_op)
> +DEF_EMIT_REG3_FORMAT(amswapdbw, amswapdbw_op)
> +DEF_EMIT_REG3_FORMAT(amswapdbd, amswapdbd_op)
>
>  #define DEF_EMIT_REG3SA2_FORMAT(NAME, OP)                              \
>  static inline void emit_##NAME(union loongarch_instruction *insn,      \
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 29c281bef28e..5417a5624327 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -8,6 +8,9 @@
>  #include <asm/asm-offsets.h>
>  #include "bpf_jit.h"
>
> +/* dbar hint for ll/sc completion ordering, see __WEAK_LLSC_MB */
> +#define DBAR_LLSC_MB   0x700
> +
>  #define LOONGARCH_MAX_REG_ARGS 8
>
>  #define LOONGARCH_SAVE_RA_NINSNS   1
> @@ -433,7 +436,7 @@ static int emit_atomic_rmw(const struct bpf_insn *ins=
n, struct jit_ctx *ctx)
>                                 pr_err_once("bpf-jit: amadd.b instruction=
 is not supported\n");
>                                 return -EINVAL;
>                         }
> -                       emit_insn(ctx, amaddb, src, t1, t3);
> +                       emit_insn(ctx, amadddbb, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_H:
> @@ -441,39 +444,39 @@ static int emit_atomic_rmw(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                                 pr_err_once("bpf-jit: amadd.h instruction=
 is not supported\n");
>                                 return -EINVAL;
>                         }
> -                       emit_insn(ctx, amaddh, src, t1, t3);
> +                       emit_insn(ctx, amadddbh, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_W:
> -                       emit_insn(ctx, amaddw, src, t1, t3);
> +                       emit_insn(ctx, amadddbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_DW:
> -                       emit_insn(ctx, amaddd, src, t1, t3);
> +                       emit_insn(ctx, amadddbd, src, t1, t3);
>                         break;
>                 }
>                 break;
>         case BPF_AND | BPF_FETCH:
>                 if (isdw) {
> -                       emit_insn(ctx, amandd, src, t1, t3);
> +                       emit_insn(ctx, amanddbd, src, t1, t3);
>                 } else {
> -                       emit_insn(ctx, amandw, src, t1, t3);
> +                       emit_insn(ctx, amanddbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                 }
>                 break;
>         case BPF_OR | BPF_FETCH:
>                 if (isdw) {
> -                       emit_insn(ctx, amord, src, t1, t3);
> +                       emit_insn(ctx, amordbd, src, t1, t3);
>                 } else {
> -                       emit_insn(ctx, amorw, src, t1, t3);
> +                       emit_insn(ctx, amordbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                 }
>                 break;
>         case BPF_XOR | BPF_FETCH:
>                 if (isdw) {
> -                       emit_insn(ctx, amxord, src, t1, t3);
> +                       emit_insn(ctx, amxordbd, src, t1, t3);
>                 } else {
> -                       emit_insn(ctx, amxorw, src, t1, t3);
> +                       emit_insn(ctx, amxordbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                 }
>                 break;
> @@ -485,7 +488,7 @@ static int emit_atomic_rmw(const struct bpf_insn *ins=
n, struct jit_ctx *ctx)
>                                 pr_err_once("bpf-jit: amswap.b instructio=
n is not supported\n");
>                                 return -EINVAL;
>                         }
> -                       emit_insn(ctx, amswapb, src, t1, t3);
> +                       emit_insn(ctx, amswapdbb, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_H:
> @@ -493,15 +496,15 @@ static int emit_atomic_rmw(const struct bpf_insn *i=
nsn, struct jit_ctx *ctx)
>                                 pr_err_once("bpf-jit: amswap.h instructio=
n is not supported\n");
>                                 return -EINVAL;
>                         }
> -                       emit_insn(ctx, amswaph, src, t1, t3);
> +                       emit_insn(ctx, amswapdbh, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_W:
> -                       emit_insn(ctx, amswapw, src, t1, t3);
> +                       emit_insn(ctx, amswapdbw, src, t1, t3);
>                         emit_zext_32(ctx, src, true);
>                         break;
>                 case BPF_DW:
> -                       emit_insn(ctx, amswapd, src, t1, t3);
> +                       emit_insn(ctx, amswapdbd, src, t1, t3);
>                         break;
>                 }
>                 break;
> @@ -524,6 +527,7 @@ static int emit_atomic_rmw(const struct bpf_insn *ins=
n, struct jit_ctx *ctx)
>                         emit_insn(ctx, beq, t3, LOONGARCH_GPR_ZERO, -6);
>                         emit_zext_32(ctx, r0, true);
>                 }
> +               emit_insn(ctx, dbar, DBAR_LLSC_MB);
>                 break;
>         default:
>                 pr_err_once("bpf-jit: invalid atomic read-modify-write op=
code %02x\n", imm);
> --
> 2.25.1
>
