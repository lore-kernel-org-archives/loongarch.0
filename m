Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2854919D07A
	for <loongarch@lists.linux.dev>; Fri, 22 Aug 2025 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755888219; cv=none; b=Vfx/YNplAet6yGFlSI5xd/yUzqd1QSAuUGwoXd2tRJ9xB8IYf+NmuFo9Iy5P6jyfk37icTAbKG9mdLbBSKodnqf9IHTUKy3WeTJ12XIpIZ37wdzlB33ZNUrh20bzppZbB3iQ+F4+NHnyXmWaYybpRBrPqYxWKs37hyyN8HosseY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755888219; c=relaxed/simple;
	bh=dxkVD+b4M1nrUZ2Whc+sjYjTzOsWbtuFCZNW0FlJnoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hW0CV3w0lzlBcKzIDqTKh1Uofvz482e6mOCvXpj5OtGCEztvHKAN86eATVIwHo8FqZwIYgg63MJFaLEnQvA8/AwViKrfiMgyhT/yGaUFqIJ094y5APaXvWoDM/nPqfvdW5CBu1MU8TKhkpvOE/MdYmI4TLMXWG/HKi6WKG8X5TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCGHh5rx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCGHh5rx"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32326df0e75so2075796a91.2
        for <loongarch@lists.linux.dev>; Fri, 22 Aug 2025 11:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755888215; x=1756493015; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yrP3A2wc1sdHVj0Mjd5Q9CFRSUAOQeMpXsZFVELhAE=;
        b=fCGHh5rxHlukbljd2T01oUU/m0ULnGS3U0Q5Ue3IuzMMeOFQwpsVMIDQC3xB3M5lmV
         npElEBv5icIMzi6urN6Qh1DBA2ztUUy24iwlIubIevEHoOBtzQUzJYNSDsPnyyeTyA7L
         IkbT3FNE3bwftjkzc7gHam6vzES1CpwbJf6076N2SMbB2EHNiJMQyZhwVsOMSrDgLat9
         lI6jyFbaZqz/lOA9ITtoa+QD6PUa5G1T0XCtJAtZYCu4eUiD560sucJCG4qAb3I2G9Lh
         P08y2B7nBJtGOzN5OrcuLGj5bH1xcCJLqQG2S91lr3I6LOxAlYNTGV8By7EdY5zgBE3m
         MMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755888215; x=1756493015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yrP3A2wc1sdHVj0Mjd5Q9CFRSUAOQeMpXsZFVELhAE=;
        b=r8Mmith0bMPfFwYVQcwARBSTaDFP4d2ijGsCDAhNg7BBFWRL2fXeu5jAPEd66ISAQG
         B8gz/TumqJcfR6vx190uPhM7Y56g5TuS6wyQw0DOfnuaxdbWqoqX8rce2MIP2nrvB8KF
         w3ZXBaJ92CzaUKmiGULgHHL5KzlO2b9oKxchwhIfGo/frrjd+5MiHVZWLGY9TwvuHTyZ
         TqZVl1a0HLQPJT9WxptJFJusps2TR7uS/bJGRdvua3ll45BjIDTao+12nqtoMO/rqnoo
         f2fEOC6SFOqj4Sy8+siZZNg2hnwCgcJmrMlARZY77xSYJsQIxzaobToSs01WSLydxySY
         UzQA==
X-Forwarded-Encrypted: i=1; AJvYcCX2i1z03Czb4mjZfxGMn6XI06yJ+3zpgdbT5xj1w1udqkf62OLo7BCzPXC+D5h3xK0M+CM33prvoXs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3QCIiHtSI2LQM5U92QXoWvFo1x8OUeflrOmnqSo+LYAY+BZH5
	RvMUMu+Jay0wh1vOhpkVuiWWD/V+g/o9c6WxE1HTVPnR2YAZEAZovRUcAWTLLh+WnLqZxCt/bfA
	uEryXbj6JHQcvMF5+TpMQz3JkON0Io/Wl8Q==
X-Gm-Gg: ASbGncvUI4ykj/a0uEj+izIbdSffNBUYZNHVpNl0vxCN21j+EZsLN8T3fyJfQM3zhlf
	Qxr/lh0cKsuV/umdkJdCTHSNUwWdbZ9SGW3Axml4rcv0hxdspyXq562o24M+0NeWIFeLGDXTbVn
	dqGA5oZ3ilhsLKgtGKjHW7l+HW8f/JOVGjGRYSjIcKLaAwH2axiSqEmnZaOsKWR8369qnxZtvxg
	7WYx4c/qKjZDu3a1qHXLHg=
X-Google-Smtp-Source: AGHT+IEUXODzWS3pCnGwThbAnGSrXVApyosNmeapYZtj6MDSpkysw2w1jLflsuKy2DvUUmRQ0vvEUuK351S2Mcttzog=
X-Received: by 2002:a17:90b:3f88:b0:31c:36f5:d95 with SMTP id
 98e67ed59e1d1-32515e2b881mr4766831a91.2.1755888215349; Fri, 22 Aug 2025
 11:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819111953.3197428-1-chenhuacai@loongson.cn>
In-Reply-To: <20250819111953.3197428-1-chenhuacai@loongson.cn>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 22 Aug 2025 11:43:19 -0700
X-Gm-Features: Ac12FXzrYOzfj7i2cMKRVyTzQec3hNJbudkkDPYSdzi9TGgGm2mcwIbyXDmRGsw
Message-ID: <CAEf4BzajrMOkdOX5fn=bzWVTLbObPM9=_4Nh9rm5oc_4377Pfw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Fix uninitialized symbol 'retval_off'
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, bpf@vger.kernel.org, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Huacai Chen <chenhuacai@gmail.com>, George Guo <guodongtai@kylinos.cn>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, loongarch@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 4:21=E2=80=AFAM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> In __arch_prepare_bpf_trampoline(), retval_off is meaningful only when
> save_ret is not 0, so the current logic is correct. But it may cause a
> build warning:
>
> arch/loongarch/net/bpf_jit.c:1547 __arch_prepare_bpf_trampoline() error: =
uninitialized symbol 'retval_off'.
>
> So initialize retval_off unconditionally to fix it.
>
> Fixes: f9b6b41f0cf3 ("LoongArch: BPF: Add basic bpf trampoline support")
> Closes: https://lore.kernel.org/r/202508191020.PBBh07cK-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>

Is this something that should go through loongarch-specific tree?

> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index abfdb6bb5c38..a73f6ea4ed4a 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1504,11 +1504,10 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
>         stack_size +=3D 16;
>
>         save_ret =3D flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FEN=
TRY_RET);
> -       if (save_ret) {
> -               /* Save BPF R0 and A0 */
> -               stack_size +=3D 16;
> -               retval_off =3D stack_size;
> -       }
> +       if (save_ret)
> +               stack_size +=3D 16; /* Save BPF R0 and A0 */
> +
> +       retval_off =3D stack_size;
>
>         /* Room of trampoline frame to store args */
>         nargs =3D m->nr_args;
> --
> 2.47.3
>
>
