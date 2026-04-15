Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E992DB78C
	for <loongarch@lists.linux.dev>; Wed, 15 Apr 2026 02:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776219903; cv=pass; b=k3YAONA3asU/TA0VmMVzH6ERrrk/Rc4nlJJGzh4dS+3wYTbIyx0kNmFhXdVcCfSXxGmKYlYhaonfZrIrKzqsguCDi29/l5i+fDLJOqd0zQ8oBBIbS0BG/+FVNnV/1ygiSrFVCmd1bmumq8Nvohjw6S4JCGVmKM0PvzDM/kxjoGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776219903; c=relaxed/simple;
	bh=T5bPmxtrwr5CPFUcZhjltMGhNlJziA7tH+wj1zrYKec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLmF8u1AVCIpkuN+f7+vFLz6au9sSoKkEF7Vyg2dxc77BCzlIVpO7IrTMXjP6xJLd1ZafAAnvzNZfWIJd38GFZo2SsWdsalFahgbVuY8ZekGimki4iXesrDh2OpI1Ks+3OpJ7CAoX9gJ+JQQBQ17F6bTufiGmYwG734ugoCVk/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtLtb7Rc; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtLtb7Rc"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-41576c5c01cso4781278fac.3
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 19:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776219901; cv=none;
        d=google.com; s=arc-20240605;
        b=YLqCd3utEiIbzrYb7Cw+TgfP+4RBnwEQiBu2+rqpjIVJV/Fm6Ig3LWCzbj8w3+hpu2
         2uWXgB05O2MHmCgjP6M5Z2xP3N8VO+V6GE1opuLBM/v+sIxtjN51zTUtpp+Pb6o34BUq
         rg5o2wZGN7PGHnxWLkdgBpz6WRuIK5JA2b+bZ3V6eMgqsHySXLRlQBYRtOsXwFN3Fr74
         Bocw9CxkwapkQfAUkIqPnLCVUhiiNcTNSNeC64cB7kHWAW+fAf1GGOhbMBGT6JplB9i5
         L5nMRjEjXSnU0R+l1HHFoJkTrU7RBq02MwriNWyuKeNdY6Qa2tbQEL/mT1wMW1JI9hcw
         Rjkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jttgu4B43bPxLujJofIdsu6iWI/oDg34v0H1xOsCRr4=;
        fh=gjTgBXSHYF9ZeoTWHasG85LHNGLUPlvxkeu43ops4HU=;
        b=A9ds+5S55gtX8h23skn45j79mJtnH7KC9GdaERCZpbgKguB5KxQA1AdMl50m+Q9lRl
         iB4ZTKQOajwyiVf3kZGOM0GFZgrJVQFzTyBBxIJFApNluf7h2bcOkXQ98QgIQWvvyPaJ
         VdyvTE+MdNIOfJNuPZykb5zR32uAtqPNIaCKRsLPHahlkH9DYfBOuqs+/2kkWLac00aH
         jDNDnTOyzkWIlNrmHp+GZTz4dDWHDs7ej7GK14HYU46x5HdochCV2Fn+3rZbdfAKu68x
         LVJoOKJwJ58mvBXoIvyRDDtzxNFp8Gkrb/9z5vNWb8dh2UMGLCODFL42qf7v967c0m1D
         BqTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776219901; x=1776824701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jttgu4B43bPxLujJofIdsu6iWI/oDg34v0H1xOsCRr4=;
        b=QtLtb7RcoTto0P29zDhELj/xXjZVNGUQxeaussUmyNZkeVdwaM0dCGVSqjdVGtzm8Q
         CP7iWtBPMYCW6zlfglD8JjlyrWb64XvRfDpnLGNKzMaF+q//FdyHUuBhIPnX0YhB8msM
         CJvx3ou+rbJkw6ohUrSgrOajXd3mcNtnGOwsZs/MiVnf8XntzSzyRuZV8cscrg1NgoCd
         CHvraoIx0O1vvVfb3b2TsBZxu7Q6DiAu48wTt2pZiRwiSInqprI+0trg60Z0m4Zf8ieb
         r/30MX+aqg8uVnNoSVUeOs2wJujEXLrXwx0OaM/lPLrg32YKheNdGHPlYGElh44RMlIV
         vl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776219901; x=1776824701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jttgu4B43bPxLujJofIdsu6iWI/oDg34v0H1xOsCRr4=;
        b=HaBhhRtbtA9acB+WQkgYTw86rWA8YqnwC6tB0zRwMT78IERdQrGXcVFMzk9Qu1XQAe
         YfDsotQAkGh/TPQS5oNbjdTh8kL61jW0KxwN9y5ZOKHlFoFiYFjNhIDLcbDGcwBWuNgX
         YfPmt+3j3oZfpFbaaVSL8Jy5+V6vLkG2eS0z6asFwLvwotUaM6/FY/aoMDgb2iPUsaET
         5ns+UU86Ha7EqN2fZX8xUoyAgkkQ8i1bn2kk2bZaO+pWU8Y39g0ce3pfNpYAG4W7RiOn
         +u7hg2wOKohWDM/bGlxVs1SOtFJLIrOlcaH5llNLcWaNAmVM64dVhAxdMOdSy4uTz0R0
         Zmeg==
X-Forwarded-Encrypted: i=1; AFNElJ9UT53W1ffOrowlx2ipVI47WAlf9xkhOqBaheUrZOuV6ip3XRuBZRpMuIsPFDIXWVmwr6jqNV0Ohvc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/VN/Ox4klY5d33RGJ5ZcVRsovpCdR7ChorIMPf1JtjrapoiDI
	pIBxS2Lzt+V4XOcTjoUBKh1SDtXV8Xq1VIUoJEx4Kq/VFeMWb1c/b4LMf0SDiafQ9LSKvSL08pP
	PrJ2gykKsp+Wg26sRtVszVX4pvFsX6JLWdJc+4kY=
X-Gm-Gg: AeBDieuC760f4teXBdr+t2uv0G4YlYpbqucOGqh1v3RKacrFIURV9QJNzqXqFPqZ8va
	BOi8VeyGmW54lQvDmjYpukv45L5yuinUc81ViRNWosWyXVpNArRFzx/+PCBR8ouvuqYLggvZO9H
	AdBOId6gvP0C/CAQW/Y61zSUU6TKAXmIhfC81j2p875iYUrJ5S3s8k68JLHDOHojjxmWSU5l3lG
	Xtgmu3Q56Hs6b2YXk3kv+x0uBvJZDEZ0lDqbwO0LGaDlD1mniwfaA35gtyhY6ziuNy85IMhzsvh
	yJHk5uraR3OH6XLNkA==
X-Received: by 2002:a05:6871:2ee7:b0:41c:dd:9e13 with SMTP id
 586e51a60fabf-423e11e69d5mr11767935fac.39.1776219900892; Tue, 14 Apr 2026
 19:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413040506.26640-1-yangtiezhu@loongson.cn> <20260413040506.26640-3-yangtiezhu@loongson.cn>
In-Reply-To: <20260413040506.26640-3-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 15 Apr 2026 10:24:50 +0800
X-Gm-Features: AQROBzApEWzUWVYCnCJW51fFV79nskrsS9_jMRIB5MMaHw0XS7Bobt8tSYuCALc
Message-ID: <CAEyhmHSAHv5PcW+_FZd5EAivJWE+0nRKN3tAjiK7pS594nu8aA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] LoongArch: BPF: Add the default case in
 emit_atomic() and rename it
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 12:05=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> Like the other archs such as x86 and riscv, add the default case
> in emit_atomic() to print an error message for the invalid opcode
> and return -EINVAL , then make its return type as int.
>
> While at it, given that all of the instructions in emit_atomic()
> are only read-modify-write instructions, rename emit_atomic() to
> emit_atomic_rmw() to make it clear, because there will be a new
> function emit_atomic_ld_st() for load-acquire and store-release
> instructions in the later patch.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

>  arch/loongarch/net/bpf_jit.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 9cb796e16379..fefda4050a20 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -344,7 +344,7 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx, in=
t insn)
>  #undef jmp_offset
>  }
>
> -static void emit_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx=
)
> +static int emit_atomic_rmw(const struct bpf_insn *insn, struct jit_ctx *=
ctx)
>  {
>         const u8 t1 =3D LOONGARCH_GPR_T1;
>         const u8 t2 =3D LOONGARCH_GPR_T2;
> @@ -448,7 +448,12 @@ static void emit_atomic(const struct bpf_insn *insn,=
 struct jit_ctx *ctx)
>                         emit_zext_32(ctx, r0, true);
>                 }
>                 break;
> +       default:
> +               pr_err_once("bpf-jit: invalid atomic read-modify-write op=
code %02x\n", imm);
> +               return -EINVAL;
>         }
> +
> +       return 0;
>  }
>
>  static bool is_signed_bpf_cond(u8 cond)
> @@ -1256,7 +1261,9 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>
>         case BPF_STX | BPF_ATOMIC | BPF_W:
>         case BPF_STX | BPF_ATOMIC | BPF_DW:
> -               emit_atomic(insn, ctx);
> +               ret =3D emit_atomic_rmw(insn, ctx);
> +               if (ret)
> +                       return ret;
>                 break;
>
>         /* Speculation barrier */
> --
> 2.42.0
>
