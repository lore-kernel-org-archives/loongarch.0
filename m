Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E24219A81
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 01:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752629496; cv=none; b=P1cni7RgOLDBeF1/Guk39HuflPIsJ0/h6rAFT3mviiWkuXqZ8dHGavr9iENhdrx7e24dlvsI2efMmC2LniSUTsbn8hR1KfYJG6BP0JbKBg8mHexVz67W8+FwqQ0s9B+SyTQobhm2U+G5IsqP4KBqFkW9bJ3BrwzsTcGZnz2aSN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752629496; c=relaxed/simple;
	bh=L9CyshifxKcUZVuTjUaa7cOrnfH0zavz0cWcKU5YwyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqqmF4nvl8p5KBIl8F0/Nwm8jTm4N7MT88ff2bH6ow98snVYKHs78thFTum06AMb1zpz5CLDRfa7l0u8hzkvcGvxWhB0ub08UdXCmquaPd3qtnkbvhysoZj1QYc+1i7+vCB3buK4TqeuqEyYSl3/CjViZLzBIfpO5monswnCgfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdnsI5tS; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdnsI5tS"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-41cbc8da42aso311709b6e.2
        for <loongarch@lists.linux.dev>; Tue, 15 Jul 2025 18:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752629494; x=1753234294; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYpwja3WwHsWmhojkvFP4doj/3QR1BsUPWZRmwJKMLY=;
        b=YdnsI5tSoM5ErojuZKjzRQjerJswhCrqixXqLIYuWBorFaz8LarJxP+nzrwk0R7XmY
         1dRKmnjBTtBZW+a9sMOlYxQpgNYXI2x41GDHK2hseHiLb9T780Sj64/RzYUwRf+yeAFg
         Htu6W7r2GgxGZC1DIaBxJtngAYetovu4PVDbb3ACc7VYEAaVpKdLm/AxrH4yF57Aur0R
         R8DTV03HRnjgHCbyvHqxEdALPDOQ5rLRR7L0umXXUKQ5rgKHWkPN/CkLiNpbiOBh/1vW
         WJV07k2c87ANwvWHUnGeZS9nc9ArVxsAPTIlkW0EsqSEAYiXPWEvKy9Mq/WXWW5GZnzu
         IyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752629494; x=1753234294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYpwja3WwHsWmhojkvFP4doj/3QR1BsUPWZRmwJKMLY=;
        b=Y2DnuzBKJlkFthcs9IqNC5p0i4b8NFUZYFURvp4FIZxowCQQMiTobI6//mNqKOGjcv
         iNKshSWlrrZPt8c2Y/bMazaE92CxSiaZFsGcL+zDezOFJwdXPdL3XWLaqdqXW14R+dgX
         qnzWChWNQtZlK47mN5DEtmbyf5cEtjlBpdVOcMzZMszCBU7YILUT2l3okja/XCYizbMj
         VBCeW+TmA8dgeUveyIh6W98hd27L2ZkPdypZAlzfEelro3RpLeJIcSmTUl8PgaPVcHyw
         6ex2IQLn5ChqbALxEWuMacggeTlh8AuM13dc0Vq4LbKFdHud8+xX2PkBCw18UTx/3iWo
         0e8w==
X-Gm-Message-State: AOJu0YzYVcj7s8FD8vs18wCvWumNlM+Gc4psMyisYyyxCKZ4Fuw9KvbA
	+zdqRj87gG2egskQh0IuNPfxV0ApfpBUReTIOGYsWc/GpdfJN5z8A4zb+VXbE+oR/htEm5o2Hhb
	kdaq8ZIcNn6LE3o3fzzl2Z5K4OE98IDs=
X-Gm-Gg: ASbGncsI1oL5Qz1qXNH4I4taRLJKcpj3vG6kiK3p770ZJesYj0VG+QCzd/hsvV99uVI
	PX7YSyLc9iv1k2csYlVbejNClZCExxibdRTEs3b8Fq2cw4ioM+AhBcix21V8HJQ24VogvLDZh7C
	D2eF4dUc5D7U0Z/e7LLq/orVnmi2gLNXRQq04FISyUDueOt1HNUMm4vWnRtF4s9n26sTFzfAM5h
	+E13aU=
X-Google-Smtp-Source: AGHT+IFRBzfjG6GQRuYdwCYZd1NMmF5LIK7Fi8P22lPDUB0inlgKR8YIdvZaHWi43hFuqgUE6TldPhGSc9S/EdM9Jo0=
X-Received: by 2002:a05:6808:3505:b0:40a:52e5:37df with SMTP id
 5614622812f47-41d0594ca9amr751322b6e.39.1752629494067; Tue, 15 Jul 2025
 18:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250708071840.556686-1-jianghaoran@kylinos.cn> <20250708071840.556686-2-jianghaoran@kylinos.cn>
In-Reply-To: <20250708071840.556686-2-jianghaoran@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 16 Jul 2025 09:31:23 +0800
X-Gm-Features: Ac12FXwrv6G51Jw3sJaR8S9iwxsghpyl4WQWLSb7nWsG9OLEVGEIK9Hn524VnVY
Message-ID: <CAEyhmHRUQV5JROOO+PyuZoLuFRrVJ-eeYH5hMf9gtVXW18aa8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] LoongArch: BPF: Optimize the calculation method of
 jmp_offset in the emit_bpf_tail_call function
To: Haoran Jiang <jianghaoran@kylinos.cn>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org, kernel@xen0n.name, 
	chenhuacai@kernel.org, yangtiezhu@loongson.cn, jolsa@kernel.org, 
	haoluo@google.com, sdf@fomichev.me, kpsingh@kernel.org, 
	john.fastabend@gmail.com, yonghong.song@linux.dev, song@kernel.org, 
	eddyz87@gmail.com, martin.lau@linux.dev, andrii@kernel.org, 
	daniel@iogearbox.net, ast@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Haoran,

On Tue, Jul 8, 2025 at 3:19=E2=80=AFPM Haoran Jiang <jianghaoran@kylinos.cn=
> wrote:
>
> The extra pass of bpf_int_jit_compile() skips JIT context initialization
> which essentially skips offset calculation leaving out_offset =3D -1,
> the jmp_offset in emit_bpf_tail_call is calculated
> by #define jmp_offset (out_offset - (cur_offset)) is a negative number,
> which does not meet expectations.The final generated assembly as follow.
>

"does not meet expectations" ? Simply "is wrong" ?

The subject line should be something like:
  Fix jump offset calculation in tailcall

It's a fix, not optimization.

Other than that, feel free to add:
Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>

> 54:     bgeu            $a2, $t1, -8        # 0x0000004c
> 58:     addi.d          $a6, $s5, -1
> 5c:     bltz            $a6, -16            # 0x0000004c
> 60:     alsl.d          $t2, $a2, $a1, 0x3
> 64:     ld.d            $t2, $t2, 264
> 68:     beq             $t2, $zero, -28     # 0x0000004c
>
> Before apply this patch, the follow test case will reveal soft lock issue=
s.
>
> cd tools/testing/selftests/bpf/
> ./test_progs --allow=3Dtailcalls/tailcall_bpf2bpf_1
>
> dmesg:
> watchdog: BUG: soft lockup - CPU#2 stuck for 26s! [test_progs:25056]
>
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index fa1500d4aa3e..5061bfc978f2 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -208,9 +208,7 @@ bool bpf_jit_supports_far_kfunc_call(void)
>         return true;
>  }
>
> -/* initialized on the first pass of build_body() */
> -static int out_offset =3D -1;
> -static int emit_bpf_tail_call(struct jit_ctx *ctx)
> +static int emit_bpf_tail_call(struct jit_ctx *ctx, int insn)
>  {
>         int off;
>         u8 tcc =3D tail_call_reg(ctx);
> @@ -220,9 +218,10 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
>         u8 t2 =3D LOONGARCH_GPR_T2;
>         u8 t3 =3D LOONGARCH_GPR_T3;
>         const int idx0 =3D ctx->idx;
> +       int tc_ninsn =3D 0;
>
>  #define cur_offset (ctx->idx - idx0)
> -#define jmp_offset (out_offset - (cur_offset))
> +#define jmp_offset (tc_ninsn - (cur_offset))
>
>         /*
>          * a0: &ctx
> @@ -232,6 +231,8 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
>          * if (index >=3D array->map.max_entries)
>          *       goto out;
>          */
> +       tc_ninsn =3D insn ? ctx->offset[insn+1] - ctx->offset[insn] :
> +               ctx->offset[0];
>         off =3D offsetof(struct bpf_array, map.max_entries);
>         emit_insn(ctx, ldwu, t1, a1, off);
>         /* bgeu $a2, $t1, jmp_offset */
> @@ -263,15 +264,6 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
>         emit_insn(ctx, ldd, t3, t2, off);
>         __build_epilogue(ctx, true);
>
> -       /* out: */
> -       if (out_offset =3D=3D -1)
> -               out_offset =3D cur_offset;
> -       if (cur_offset !=3D out_offset) {
> -               pr_err_once("tail_call out_offset =3D %d, expected %d!\n"=
,
> -                           cur_offset, out_offset);
> -               return -1;
> -       }
> -
>         return 0;
>
>  toofar:
> @@ -916,7 +908,7 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>         /* tail call */
>         case BPF_JMP | BPF_TAIL_CALL:
>                 mark_tail_call(ctx);
> -               if (emit_bpf_tail_call(ctx) < 0)
> +               if (emit_bpf_tail_call(ctx, i) < 0)
>                         return -EINVAL;
>                 break;
>
> @@ -1342,7 +1334,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>         if (tmp_blinded)
>                 bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ? =
tmp : orig_prog);
>
> -       out_offset =3D -1;
>
>         return prog;
>
> --
> 2.43.0
>
>
