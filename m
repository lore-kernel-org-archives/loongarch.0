Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BC1519A6
	for <loongarch@lists.linux.dev>; Thu, 29 May 2025 02:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748484185; cv=none; b=LUOc2vHQzRqqFeeQptMWR/wScjkYeT9drGcT3HkqlR/x7cpZ0Dd8rbpjPW5Zv+QptDV//QTtZ5DC2++tzRo2qqyiDA1h3ANBikL6pxxclUWxr6yk4ls9SfDjhRxMqlzhbyQeaROZ1p+l43BaDg7rhBu3+RSYGABj4mRkKS3VQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748484185; c=relaxed/simple;
	bh=DIN6LIQaAOvcQ53vfc9A5k02oK5pSKpsJOPM8n2POLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2d8Pe38co4NEIRtaZhl8Z3mRHxuJ4G5aQXAnb5pJEZka6neyqBJc70Xv53BaBoJYEme/MXkbBRydZYIyq0DdKQS6PkzuxqYoxaJLMUAV6+bXMzmTDJshFuLLsyDSYNbA53AK8FTHXiz361J4s8HMcanrUJnqOdzxVmIPYjRPmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaROZXsp; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaROZXsp"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6065796762fso128793eaf.3
        for <loongarch@lists.linux.dev>; Wed, 28 May 2025 19:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748484182; x=1749088982; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1egAo3iwBvxZqJdXFnwcv60q/WxRGcWuQcEWMsX+k0=;
        b=KaROZXspAwbIgY3HpLdtUUhzDSZxS2iiRZmPBDDVrARoDewzJrgWYDnO5ovErwPxN6
         kPrYVXIZljuAl7rvaeHcF9xgYQkA+0ZO7/8D4pjfME0UeKS5L8DUAQNR4ChWilWlWXqJ
         DBcbV8ffyWXZG1GSzgspebhmxu87xnJaMsZPD2FbazBgEa3Pkvo+39/cfUkt9IInQ5hc
         dH5IK7pcF1HOgsKvX1Lkro2T4wLkNXQyKbKGtoznSmrSyu/CNbyUFIbtW3HeN8hrQI4i
         Gcnfnt69S0edQf/UzYXgoFUz/eyEcD+EOu3RkNlPLNqC/TEsxMtvCpDwEPb+dRuDqO57
         xMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748484182; x=1749088982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1egAo3iwBvxZqJdXFnwcv60q/WxRGcWuQcEWMsX+k0=;
        b=bRBsACNDsnWO90HH8C3AI85yf+BgRhElS2oCkdD0DCiAQMt+7tIbQcSwmf6aa12q44
         O5B6nf2o4kRfxo3RslwZ8bdIRbDt9He+AJWetqjv1R1tOC2iY0pzybeO0XsXUvyykT29
         +sWyY7VIIL9OGCn2oVeCjFQS20hhP4SIIVDBXF+5qP7W5fO/QKzyJYffrWU+FBVIITdI
         dvX8BaVxGh/Ti0gT/3TiKrGe3dQ84RFQjDn09FzRz5fz4MOI5RLS/FLYj6puBKGCySkd
         zpdniS/jTMpZG74Gb9flpDlft1IseGbfsVxlHYjbYrjrtPzHtnB75q1GCo1Mr+WoiI/d
         8mhQ==
X-Gm-Message-State: AOJu0Yza/8tFCWDTQZO1Czt72P6jk4Ro+Hb1bxdbDe1SrzF+OUsnLdAX
	1s8Z4c20xGuMmNf9GouRwp0p0mE1rbd1553pBviSzcWZtp/jAt3BMmrYu5hcqVWgb3p4iDytb9j
	JMeZEsKQrfJJ4XAgsa2Aa6kiyB7ihNHc=
X-Gm-Gg: ASbGncuU+nbk0BAgRDqQ/ICFH8gMw4w3RQgYnDUVSF00Fv75DrzAPHup73FckweMTYA
	A1Dkg9KwB3Upl6jETU7WHU4s+/4wWCtcLemIFqSjmhaAG2CzF7mpZzxvYEsEpiUxqBKwe9G89NE
	S8VRCpu82Y5AZnW5BqA3dWJGWhyl/rxmNEEcqD0Tz1uBI=
X-Google-Smtp-Source: AGHT+IH0mfeDH3IFQ2Mw4l8ARan0BJrAfAyJQiogfmzdX/eyo4H5wdRxQMSJ66duRYCi67pL0zjvLOz0YNbhUglnQQc=
X-Received: by 2002:a05:6871:20d:b0:2c1:62ba:cd7c with SMTP id
 586e51a60fabf-2e861df8abamr10614260fac.15.1748484182330; Wed, 28 May 2025
 19:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250528104032.1237415-1-jianghaoran@kylinos.cn>
In-Reply-To: <20250528104032.1237415-1-jianghaoran@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 29 May 2025 10:02:51 +0800
X-Gm-Features: AX0GCFujo6dWfpQa5SiUb5FoezkhVXHsP8VZTM4lE4ANnYjcbdoIqPK4PV8GCUw
Message-ID: <CAEyhmHTg3xNMBrSxXQj96pvfD83t6_RHRT_GGtbBzOpAKztDpw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Optimize the calculation method of
 jmp_offset in the emit_bpf_tail_call function
To: jianghaoran@kylinos.cn
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@xen0n.name, chenhuacai@kernel.org, 
	yangtiezhu@loongson.cn, haoluo@google.com, jolsa@kernel.org, sdf@fomichev.me, 
	kpsingh@kernel.org, john.fastabend@gmail.com, yonghong.song@linux.dev, 
	song@kernel.org, eddyz87@gmail.com, martin.lau@linux.dev, andrii@kernel.org, 
	daniel@iogearbox.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Haoran,

On Wed, May 28, 2025 at 6:40=E2=80=AFPM Haoran Jiang <jianghaoran@kylinos.c=
n> wrote:
>
> For a ebpf subprog JIT=EF=BC=8Cthe last call bpf_int_jit_compile function=
 will
> directly enter the skip_init_ctx process. At this point, out_offset =3D -=
1,
> the jmp_offset in emit_bpf_tail_call is calculated
> by #define jmp_offset (out_offset - (cur_offset)) is a negative number,
> which does not meet expectations.The final generated assembly as follow.
>
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

This is a known issue. Does this change pass all tailcall tests ?
If not, please refer to the tailcall hierarchy patchset([1]).
We should address it once and for all. Thanks.

  [1]: https://lore.kernel.org/bpf/20240714123902.32305-1-hffilwlqm@gmail.c=
om/

> Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index fa1500d4aa3e..d85490e7de89 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -208,9 +208,7 @@ bool bpf_jit_supports_far_kfunc_call(void)
>         return true;
>  }
>
> -/* initialized on the first pass of build_body() */
> -static int out_offset =3D -1;
> -static int emit_bpf_tail_call(struct jit_ctx *ctx)
> +static int emit_bpf_tail_call(int insn, struct jit_ctx *ctx)
>  {
>         int off;
>         u8 tcc =3D tail_call_reg(ctx);
> @@ -220,9 +218,8 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
>         u8 t2 =3D LOONGARCH_GPR_T2;
>         u8 t3 =3D LOONGARCH_GPR_T3;
>         const int idx0 =3D ctx->idx;
> -
> -#define cur_offset (ctx->idx - idx0)
> -#define jmp_offset (out_offset - (cur_offset))
> +       int tc_ninsn =3D 0;
> +       int jmp_offset =3D 0;
>
>         /*
>          * a0: &ctx
> @@ -232,8 +229,11 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
>          * if (index >=3D array->map.max_entries)
>          *       goto out;
>          */
> +       tc_ninsn =3D insn ? ctx->offset[insn+1] - ctx->offset[insn] :
> +               ctx->offset[0];
>         off =3D offsetof(struct bpf_array, map.max_entries);
>         emit_insn(ctx, ldwu, t1, a1, off);
> +       jmp_offset =3D tc_ninsn - (ctx->idx - idx0);
>         /* bgeu $a2, $t1, jmp_offset */
>         if (emit_tailcall_jmp(ctx, BPF_JGE, a2, t1, jmp_offset) < 0)
>                 goto toofar;
> @@ -243,6 +243,7 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
>          *       goto out;
>          */
>         emit_insn(ctx, addid, REG_TCC, tcc, -1);
> +       jmp_offset =3D tc_ninsn - (ctx->idx - idx0);
>         if (emit_tailcall_jmp(ctx, BPF_JSLT, REG_TCC, LOONGARCH_GPR_ZERO,=
 jmp_offset) < 0)
>                 goto toofar;
>
> @@ -254,6 +255,7 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
>         emit_insn(ctx, alsld, t2, a2, a1, 2);
>         off =3D offsetof(struct bpf_array, ptrs);
>         emit_insn(ctx, ldd, t2, t2, off);
> +       jmp_offset =3D tc_ninsn - (ctx->idx - idx0);
>         /* beq $t2, $zero, jmp_offset */
>         if (emit_tailcall_jmp(ctx, BPF_JEQ, t2, LOONGARCH_GPR_ZERO, jmp_o=
ffset) < 0)
>                 goto toofar;
> @@ -263,22 +265,11 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
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
>         pr_info_once("tail_call: jump too far\n");
>         return -1;
> -#undef cur_offset
> -#undef jmp_offset
>  }
>
>  static void emit_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx=
)
> @@ -916,7 +907,7 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>         /* tail call */
>         case BPF_JMP | BPF_TAIL_CALL:
>                 mark_tail_call(ctx);
> -               if (emit_bpf_tail_call(ctx) < 0)
> +               if (emit_bpf_tail_call(i, ctx) < 0)
>                         return -EINVAL;
>                 break;
>
> @@ -1342,7 +1333,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
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
