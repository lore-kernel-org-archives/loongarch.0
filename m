Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FEF246BAF
	for <loongarch@lists.linux.dev>; Mon, 28 Jul 2025 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753700167; cv=none; b=mUnFhIH2jOGJgTPidVnIjksCExnPUT+1u3rXUl2ny0j9lRSnioc/J9rhkwJi6lZxKb+kDumVZvdBd7CB3JVu8IYV6HtcvlPoh8izhFxl4uQfALv76sWP5vCFUKXvLPvtjK52jSjcFczgybLTOPIyo6DNAykNc/wSrw0GSDMJR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753700167; c=relaxed/simple;
	bh=YGleY+BTac5R9ZvEJZtBBPaOkPgNhDZgmq3t8OTsKFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9Dzcc46qGiITSJ+rd7AAeTV8zxVlRgBRxbTZbW4T6OD5Si5XfB/EyBhiXwoYCwD1dzQgVoyOcj1QAUp6rPDWxJhsgZ/AvWvKAqrof/wlIm9J2EF3jZsjOsklSbIRdNaBVZHmL2lh1WycHDP0e/nFtSAhKo5VRH3viboL+Aoers=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECxx/Wsc; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECxx/Wsc"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-301a83477e5so3092144fac.1
        for <loongarch@lists.linux.dev>; Mon, 28 Jul 2025 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753700164; x=1754304964; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWL1xu7848dX7PG0tXdUa0Ie1a9/Le0YZIKNkJPCEek=;
        b=ECxx/WscZtU7TcYjFmKTqzjAFW6jK7PC2pAiMlXR5IRmm1WFwWBHeDEPLbEh75JaBN
         lFozdwbLtCb1GGjOdGAZ9YCZe5Fqscvtng9Mqhn5tzhzvRW612M2h1mw5qTW3Cbnaekv
         2niZXS2WnV/qLv6LekiAKXVEl72zHw7wW+bhoODrSS8s8SrmqcydgMQhqIsIP7BLsLE6
         PpbR8DRMWVCmZGOowDdLJU6EqdjWlAlCrviq4OwGjSiYIgjERbZi+GZLmlEOEUBaGzBJ
         oyRfhjd40rf5mtuUzg0urAQDG8D5lFhsK8PphC78NlUMx+NygPM2zpLrTQ4eZuwr+KX3
         mpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753700164; x=1754304964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWL1xu7848dX7PG0tXdUa0Ie1a9/Le0YZIKNkJPCEek=;
        b=konS8xTVMcVgAiO0O3DO7K+6X/q5QC67v+siz/fKvtAoKYynUUQ3sKdXfeQ36ylKmc
         gU+GSAyiiS/eLWvthPxIc8shO+GB6VgZ8l6lRyK6k8QCRuync2erKDXe1rSUoMD5uvSO
         tD//PiPtV4Wd3XGZrSk0sBCm83NbiHvC/uz1xix1F53/wFsZfFqg3TOiaCf353eT4D0i
         jSpqLNraC6V8YWHZpL3+YaIG6j0HyU5OEcVFaR1NNl/l5v2XlZGoIq/0o296SzRDyf+9
         hhlCPBB+sCHqban1SvUvyNtXibSYervtKh6ld9kZ1Pc/V/Hi+PopZ9n/1SQUIr+/AOCv
         rPBg==
X-Forwarded-Encrypted: i=1; AJvYcCXCymIEu+VdJDPw0RuPWBmydhESROixJxCSsMgjdXCNnJwA9dO/whR+Pc2pVOJlUMRXMxOeYpfkR9o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzilAPgVpSUJ6PNNWoFo9KUk4nK5XRpxKMGrTZr28D45Jq+ngAA
	hd2iX6ufECYpkm2nDnT0Dg+cb0oADiI8Oe5Gb13P333BQLFneKKFlAkl5bKR536zy6kzeKy5in6
	Ecb99h03mcgx6NclpMjeGV9dOoTJZCT4=
X-Gm-Gg: ASbGnctM344G6oQZ3oitYbE5Rc2bDOfqh7AtlTsy9iqcKhcKhJc7NXQ/rITTa3VXc6M
	DLRhQWIrqTyN2puXcumoo2VnjZ/bD9K4wSExgyL8jxOKWFv0Pj00+/tIzJN7L5RSpntifertdrb
	TAmR9xfCY7WkxChICeu6muHbCup3YKXI53knyxVttA877GWsVupMk0JH8xnDoTv3PlKLqaNjX3m
	a3Qvbs=
X-Google-Smtp-Source: AGHT+IGARqiTWQTPDrhfm8cwnocnmRpP9f+DBFyblxvpuVCcS8LapX/WdvEguEftXmefu5EyqAQ3TzJmMAo2H63z4jI=
X-Received: by 2002:a05:6808:308b:b0:41c:45e4:6c4c with SMTP id
 5614622812f47-42bb9e01655mr6828338b6e.39.1753700163813; Mon, 28 Jul 2025
 03:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724141929.691853-1-duanchenghao@kylinos.cn> <20250724141929.691853-6-duanchenghao@kylinos.cn>
In-Reply-To: <20250724141929.691853-6-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 28 Jul 2025 18:55:52 +0800
X-Gm-Features: Ac12FXzP_XUDs2XhXziuxv8yd0WOVmTcIPNArR6GVihQbnffbAuPDxb0KuZCKMA
Message-ID: <CAEyhmHQKBQbidX_SpUF1ZPv7vkkhSR_UuRvxznyb6y5GYQS3qw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] LoongArch: BPF: Add struct ops support for trampoline
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, chenhuacai@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	vincent.mc.li@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 10:22=E2=80=AFPM Chenghao Duan <duanchenghao@kylino=
s.cn> wrote:
>
> From: Tiezhu Yang <yangtiezhu@loongson.cn>
>
> Use BPF_TRAMP_F_INDIRECT flag to detect struct ops and emit proper
> prologue and epilogue for this case.
>
> With this patch, all of the struct_ops related testcases (except
> struct_ops_multi_pages) passed on LoongArch.
>
> The testcase struct_ops_multi_pages failed is because the actual
> image_pages_cnt is 40 which is bigger than MAX_TRAMP_IMAGE_PAGES.
>
> Before:
>
>   $ sudo ./test_progs -t struct_ops -d struct_ops_multi_pages
>   ...
>   WATCHDOG: test case struct_ops_module/struct_ops_load executes for 10 s=
econds...
>
> After:
>
>   $ sudo ./test_progs -t struct_ops -d struct_ops_multi_pages
>   ...
>   #15      bad_struct_ops:OK
>   ...
>   #399     struct_ops_autocreate:OK
>   ...
>   #400     struct_ops_kptr_return:OK
>   ...
>   #401     struct_ops_maybe_null:OK
>   ...
>   #402     struct_ops_module:OK
>   ...
>   #404     struct_ops_no_cfi:OK
>   ...
>   #405     struct_ops_private_stack:SKIP
>   ...
>   #406     struct_ops_refcounted:OK
>   Summary: 8/25 PASSED, 3 SKIPPED, 0 FAILED
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 71 ++++++++++++++++++++++++------------
>  1 file changed, 47 insertions(+), 24 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index ac5ce3a28..6a84fb104 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1603,6 +1603,7 @@ static int __arch_prepare_bpf_trampoline(struct jit=
_ctx *ctx, struct bpf_tramp_i
>         struct bpf_tramp_links *fentry =3D &tlinks[BPF_TRAMP_FENTRY];
>         struct bpf_tramp_links *fexit =3D &tlinks[BPF_TRAMP_FEXIT];
>         struct bpf_tramp_links *fmod_ret =3D &tlinks[BPF_TRAMP_MODIFY_RET=
URN];
> +       bool is_struct_ops =3D flags & BPF_TRAMP_F_INDIRECT;
>         int ret, save_ret;
>         void *orig_call =3D func_addr;
>         u32 **branches =3D NULL;
> @@ -1678,18 +1679,31 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
>
>         stack_size =3D round_up(stack_size, 16);
>
> -       /* For the trampoline called from function entry */
> -       /* RA and FP for parent function*/
> -       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -16);
> -       emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
> -       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
> -       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 16);
> -
> -       /* RA and FP for traced function*/
> -       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -stack_=
size);
> -       emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_siz=
e - 8);
> -       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_siz=
e - 16);
> -       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_s=
ize);
> +       if (!is_struct_ops) {
> +               /*
> +                * For the trampoline called from function entry,
> +                * the frame of traced function and the frame of
> +                * trampoline need to be considered.
> +                */
> +               emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 -16);
> +               emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8=
);
> +               emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0=
);
> +               emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP,=
 16);
> +
> +               emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 -stack_size);
> +               emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, s=
tack_size - 8);
> +               emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, s=
tack_size - 16);
> +               emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP,=
 stack_size);
> +       } else {
> +               /*
> +                * For the trampoline called directly, just handle
> +                * the frame of trampoline.
> +                */
> +               emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 -stack_size);
> +               emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, s=
tack_size - 8);
> +               emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, s=
tack_size - 16);
> +               emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP,=
 stack_size);
> +       }
>

The diff removes code added in patch 4/5, this should be squashed to
the trampoline patch if possible.

>         /* callee saved register S1 to pass start time */
>         emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off=
);
> @@ -1779,21 +1793,30 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
>
>         emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off=
);
>
> -       /* trampoline called from function entry */
> -       emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_siz=
e - 8);
> -       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_siz=
e - 16);
> -       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, stack_s=
ize);
> +       if (!is_struct_ops) {
> +               /* trampoline called from function entry */
> +               emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, s=
tack_size - 8);
> +               emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, s=
tack_size - 16);
> +               emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 stack_size);
> +
> +               emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8=
);
> +               emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0=
);
> +               emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 16);
>
> -       emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
> -       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
> -       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, 16);
> +               if (flags & BPF_TRAMP_F_SKIP_FRAME)
> +                       /* return to parent function */
> +                       emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARC=
H_GPR_RA, 0);
> +               else
> +                       /* return to traced function */
> +                       emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARC=
H_GPR_T0, 0);
> +       } else {
> +               /* trampoline called directly */
> +               emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, s=
tack_size - 8);
> +               emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, s=
tack_size - 16);
> +               emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP,=
 stack_size);
>
> -       if (flags & BPF_TRAMP_F_SKIP_FRAME)
> -               /* return to parent function */
>                 emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_RA=
, 0);
> -       else
> -               /* return to traced function */
> -               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_T0=
, 0);
> +       }
>
>         ret =3D ctx->idx;
>  out:
> --
> 2.25.1
>
