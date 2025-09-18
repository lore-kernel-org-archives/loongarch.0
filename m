Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E1923CF12
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 20:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758227460; cv=none; b=pme3Ow7bYGKpKXWNfPqASgqvO62+q+H3bugVc+e+3CUR+MD7f3px+YlPu0QnGXjkI01hs6882UyllwndnLUA/LdrdNA/bfEogqu+k1AqxZeNYUpmrn1C7keRcT2O+/tzhleOyuqAsvZZ3LzKwDNZz4tPFhFG5+NRSi8UiQ+clhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758227460; c=relaxed/simple;
	bh=BGACq/j6NlHIfj+byhrMU0NNhVJomWIJpdEcfXI9Nj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkoxnoVMJDtn/Spo3F/mXjLMDsfEbHh+rJRXz6JI7pHYIHnGgT0O0C+BSleioJi1K5PnxwCMJSXpiAr8e2HZDO7ljrytO3MWe30xnT+mSYYzqDe//Kts4Ei7JCi/L3HxMa1Nf1/qtKrrDRQr2d90ltog2+CGnr9A2fgfEq3l3Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0CDqEAS; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0CDqEAS"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b7a8ceaad3so13282151cf.2
        for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 13:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758227457; x=1758832257; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUaueEvzZnq+nhMhJPbiUds9k38v0e0np0Aho5dWCGU=;
        b=M0CDqEAS9xupXuuzUggZ/pFtFxja0kMJpRGi9q+pVMsFom4npbeeFuLEeVkiV5xUno
         FJYVQknviNH4I9fp4J+kVywsAX+3JTxof0wUnmXZ8yuiYgUwF7DLZUFELEAoRTRW3Vcf
         W/KDzz22fneWKJ0gg6KJbHI/lnFRtSNO55y2ItGR/AMKhPULn8G3PVktgwKfnVRSBgTQ
         n4zWYR9Cp2RXz4MlBgF7zunC5z5gj8soZVSzrft93uD8zugNcfa0gtaCrxl+2loZnSEA
         qdiAt5OVzIDYrOUHslBtWOSTr6mKnTZaBUZ3JJHkTKLPldP2H9nbF5wI91LuD3Mt9BYa
         3z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758227457; x=1758832257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUaueEvzZnq+nhMhJPbiUds9k38v0e0np0Aho5dWCGU=;
        b=jsJOvA+DmWXU/wmeFdrnQvj8zIDcXtd7o+z/zJQEYT45hOxtRMaMJVZGXq0CPCH/dy
         OkPG3N3SfNKvS/xl7pS44goENx8srJXNN37l31bZUrzBMA25D3DRJ2SBVFZpbURayc9m
         d1Y86LsT93bR1Lo3dEsbam8zp1P17Phr0+CudjCVVd7uRJowZMMQD4PJhqJYVfaGACJn
         Jb+tKYJt/6v90m28xFeSHLHlx2YkD7DbS+D0t3GYnjkd9eEmQeJmQrYblzH0B13ZNT4P
         NVMomNA4UQg8RsurW3EpnCjDU/VWkDdqyOgKGHhlw2NKzxprxmvQ9Izjj7H+Xa3wClYj
         olMg==
X-Forwarded-Encrypted: i=1; AJvYcCViopVk5a45tqbDZjJOGAKkDgo4MPAHLK99efJrijdp1wEzQTAXaY4+u4elcZVkTgyiSgwddmhcZ60=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9zU2BFUlXBQFovJpSv/83bGx075ZfNt+LoCfXDJ8WiRgtxRQK
	T2eUYLkSY7//63Q80Kwrn3jWL45ZGMnXOYyUlw01FepYjR9YklIh55/vdVjQKzA/DlKHOXaYrld
	H91vVKe3vMFzMvxIBoRbt4v/ad8kqMcA=
X-Gm-Gg: ASbGnctRk/fM7znMQSz/mWMI4gHcX33Hi1jOgmoX33zn4oLLhMzq2wG0DGLcXG5YnS/
	+8WzqI2Qn6dHCOlwT/WR2qVUZt0OLvYnGd29K/cHEovafA6bwLns7N2K4f8DKKDoX5SJ1oaBJte
	8ImUxfTN8HeodYoWFcIWXVfX+3sasWdgC4cWD3MQt66dJefVAyLvl7P5aiHecR9JD1HZfLg7vFR
	pRnvIrv3Eh9w7SomxTS/vNtSA==
X-Google-Smtp-Source: AGHT+IGUhligoIK1bt5Cv6B8LkOhb54JflvZ5PSGhgztoqM0v2F25sMixSqe/ZYAsm3isHhBFbwNnY+F7uE1dEbDEgE=
X-Received: by 2002:a05:622a:1650:b0:4b5:edd3:ddd4 with SMTP id
 d75a77b69052e-4c06d9630f0mr9179801cf.6.1758227457436; Thu, 18 Sep 2025
 13:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250916235627.102831-1-hengqi.chen@gmail.com> <20250916235627.102831-5-hengqi.chen@gmail.com>
In-Reply-To: <20250916235627.102831-5-hengqi.chen@gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 18 Sep 2025 13:30:45 -0700
X-Gm-Features: AS18NWBbmXD_c7Us4SlQzFdv464ZT-q0IJwDt9g7QCxdrBr6xP2yCMlernvnBUo
Message-ID: <CAK3+h2xXCkhTw+z20twDq27U=hALiWjmJ9xxBvzzQfCk5sFY3A@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] LoongArch: BPF: No text_poke() for kernel text
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: chenhuacai@kernel.org, yangtiezhu@loongson.cn, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 6:55=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> The current implementation of bpf_arch_text_poke() requires 5 nops
> at patch site which is not applicable for kernel/module functions.
> Because LoongArch reserves ONLY 2 nops at function entry.
> With CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy, this can be done
> by ftrace instead.
>
> See the following commit for details:
>   * commit b91e014f078e ("bpf: Make BPF trampoline use register_ftrace_di=
rect() API")
>   * commit 9cdc3b6a299c ("LoongArch: ftrace: Add direct call support")
>
> Tested-by: Vincent Li <vincent.mc.li@gmail.com>
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/net/bpf_jit.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 7b7e449b9ea9..35b13d91a979 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1294,8 +1294,11 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_pok=
e_type poke_type,
>         u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D INSN=
_NOP};
>         u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] =3D {[0 ... 4] =3D INSN=
_NOP};
>
> -       if (!is_kernel_text((unsigned long)ip) &&
> -               !is_bpf_text_address((unsigned long)ip))
> +       if (!is_bpf_text_address((unsigned long)ip))
> +               /* Only poking bpf text is supported. Since kernel functi=
on
> +                * entry is set up by ftrace, we reply on ftrace to poke =
kernel
> +                * functions.
> +                */
>                 return -ENOTSUPP;
>

Just wonder if the code is borrowed from riscv :),  Should riscv
bpf_arch_text_poke()  also remove the if (!is_kernel_text((unsigned
long)ip) ?

arch/riscv/net/bpf_jit_comp64.c

       if (!is_kernel_text((unsigned long)ip) &&
            !is_bpf_text_address((unsigned long)ip))
                return -ENOTSUPP;


>         ret =3D emit_jump_or_nops(old_addr, ip, old_insns, is_call);
> --
> 2.43.5
>
