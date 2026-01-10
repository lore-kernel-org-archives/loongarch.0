Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39362DE6F5
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 04:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768018301; cv=none; b=XuLF+jWFJIzQDAMNZAy0XTf+2dX3xkrYnfK1sDhHD9PhMEVqgt60wL9ziagDCQZjnZDlxXtva36aVnKY7hv2WztYFj3XO2I1Bir7UO5CQaQIet68pafCmzfwAvjE8nWf3aHEkVu7e4YHfpFQLNlXsiPHaS3Agt9nnDxbpMmFRRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768018301; c=relaxed/simple;
	bh=DalFpTMERM7czzJFlN38SAdpK1oMVDPVUHFpoWfKWO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcAIVolqAebA047OD9++81galW9bGpGvJpkhOVUCYglZyM/yTHyS64E/ccC9rryuwl5SpS3ilzmMI5xUpbrARjtPTRxMim1iUDcuY9ZSqka/3CijZEESHQlFICikYQJOAdvCr4A01lNi82wbD/L9uvRl4l4bXoaU78Y16YyZBsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9wIzeGj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9wIzeGj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292F5C19424
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 04:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768018301;
	bh=DalFpTMERM7czzJFlN38SAdpK1oMVDPVUHFpoWfKWO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I9wIzeGjB3bIwKkPCOPrvaOSuLXDvsBg/s0757zyKuipRPAm9RplY6GthPavZypAM
	 lgqvdFOSEdIeRZKooGup0l4J6iWCgjyIUfJ9/SWabimckr7Kgpbe8IvC3S+n7nF9Ru
	 RoXz8MDrhOOcjhQ+9PA6VfNdRAtOyFA8zPuZ4gTClloFsSuGLRV6eBtilqxXHYDmXR
	 +UZZA9j41TYfsimgWE901h2DKZxVhZRNYjUapuD5Y6159G22VcijSEjwf8szxKcnJU
	 KJkNc6QPxDIIpZ0fRQZ+rx9bLCE/NS1LTQDwdcNC6pGhKaZw2OdZe4TTd53RCciySf
	 lBZQur+Ts0F8g==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso7128249a12.3
        for <loongarch@lists.linux.dev>; Fri, 09 Jan 2026 20:11:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjc04TB7pPb+QWXSn/blGdz2sE3harb19E/zP6aCpCHHXycUinC/uwqoPAKHF8lfJGOP/FFB3glo4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj5SnlP4WHFrIiL5KG4NpUuZX6KWQox3JZkcrCkqwmcIJf0SFS
	B2rEURNbD/EumCGDdqAnWIUCYCJxjdgwUh2qoErCbKj4JUY0TbYmlNbXetUopIRc4kjletbOr/+
	5/yJVHVRo1sn6I7YBgq62keeCkAR4eyY=
X-Google-Smtp-Source: AGHT+IEjVbgmFV3HovlwYgSDas2Ov4uXoJoenJGXXkeR35R8fvNXTnlIp7KXnkSI1OsurrKiiKgq0dOSwcQE8V85d+I=
X-Received: by 2002:a17:907:720b:b0:b73:8cea:62b3 with SMTP id
 a640c23a62f3a-b8444f6f7a9mr1152907666b.41.1768018299728; Fri, 09 Jan 2026
 20:11:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105105514.76021-1-dongtai.guo@linux.dev> <20260105105514.76021-2-dongtai.guo@linux.dev>
In-Reply-To: <20260105105514.76021-2-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 10 Jan 2026 12:11:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4gPS5XhRmsFgsb2nofi1kNSC4qyxtYsWTgHkuP9t79LA@mail.gmail.com>
X-Gm-Features: AZwV_Qhec_SqfYKVDU0BSvYOUyXXs_K67Wc1LJGGGIvXbVOrdiqosaSmeacWfmY
Message-ID: <CAAhV-H4gPS5XhRmsFgsb2nofi1kNSC4qyxtYsWTgHkuP9t79LA@mail.gmail.com>
Subject: Re: [PATCH v9 loongarch-next 1/4] LoongArch: Replace seq_printf with
 seq_puts for simple strings
To: George Guo <dongtai.guo@linux.dev>
Cc: hengqi.chen@gmail.com, kernel@xen0n.name, lianyangyang@kylinos.cn, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, r@hev.cc, 
	xry111@xry111.site, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Mon, Jan 5, 2026 at 6:55=E2=80=AFPM George Guo <dongtai.guo@linux.dev> w=
rote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> Fix warnings like: "Prefer seq_puts to seq_printf" by checkpatch.pl.
Please move this patch to be the last one, because it is not the keystone.


Huacai
>
> Replace seq_printf() calls with seq_puts() in show_cpuinfo()
> when outputting simple constant strings without format specifiers.
>
> This improves performance slightly as seq_puts() avoids parsing
> the format string.
>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/kernel/proc.c | 61 ++++++++++++++++++++++--------------
>  1 file changed, 38 insertions(+), 23 deletions(-)
>
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index a8800d20e11b..1d646da010f9 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -50,32 +50,47 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>         seq_printf(m, "Address Sizes\t\t: %d bits physical, %d bits virtu=
al\n",
>                       cpu_pabits + 1, cpu_vabits + 1);
>
> -       seq_printf(m, "ISA\t\t\t:");
> +       seq_puts(m, "ISA\t\t\t:");
>         if (isa & LOONGARCH_CPU_ISA_LA32R)
> -               seq_printf(m, " loongarch32r");
> +               seq_puts(m, " loongarch32r");
>         if (isa & LOONGARCH_CPU_ISA_LA32S)
> -               seq_printf(m, " loongarch32s");
> +               seq_puts(m, " loongarch32s");
>         if (isa & LOONGARCH_CPU_ISA_LA64)
> -               seq_printf(m, " loongarch64");
> -       seq_printf(m, "\n");
> +               seq_puts(m, " loongarch64");
> +       seq_puts(m, "\n");
>
> -       seq_printf(m, "Features\t\t:");
> -       if (cpu_has_cpucfg)     seq_printf(m, " cpucfg");
> -       if (cpu_has_lam)        seq_printf(m, " lam");
> -       if (cpu_has_ual)        seq_printf(m, " ual");
> -       if (cpu_has_fpu)        seq_printf(m, " fpu");
> -       if (cpu_has_lsx)        seq_printf(m, " lsx");
> -       if (cpu_has_lasx)       seq_printf(m, " lasx");
> -       if (cpu_has_crc32)      seq_printf(m, " crc32");
> -       if (cpu_has_complex)    seq_printf(m, " complex");
> -       if (cpu_has_crypto)     seq_printf(m, " crypto");
> -       if (cpu_has_ptw)        seq_printf(m, " ptw");
> -       if (cpu_has_lspw)       seq_printf(m, " lspw");
> -       if (cpu_has_lvz)        seq_printf(m, " lvz");
> -       if (cpu_has_lbt_x86)    seq_printf(m, " lbt_x86");
> -       if (cpu_has_lbt_arm)    seq_printf(m, " lbt_arm");
> -       if (cpu_has_lbt_mips)   seq_printf(m, " lbt_mips");
> -       seq_printf(m, "\n");
> +       seq_puts(m, "Features\t\t:");
> +       if (cpu_has_cpucfg)
> +               seq_puts(m, " cpucfg");
> +       if (cpu_has_lam)
> +               seq_puts(m, " lam");
> +       if (cpu_has_ual)
> +               seq_puts(m, " ual");
> +       if (cpu_has_fpu)
> +               seq_puts(m, " fpu");
> +       if (cpu_has_lsx)
> +               seq_puts(m, " lsx");
> +       if (cpu_has_lasx)
> +               seq_puts(m, " lasx");
> +       if (cpu_has_crc32)
> +               seq_puts(m, " crc32");
> +       if (cpu_has_complex)
> +               seq_puts(m, " complex");
> +       if (cpu_has_crypto)
> +               seq_puts(m, " crypto");
> +       if (cpu_has_ptw)
> +               seq_puts(m, " ptw");
> +       if (cpu_has_lspw)
> +               seq_puts(m, " lspw");
> +       if (cpu_has_lvz)
> +               seq_puts(m, " lvz");
> +       if (cpu_has_lbt_x86)
> +               seq_puts(m, " lbt_x86");
> +       if (cpu_has_lbt_arm)
> +               seq_puts(m, " lbt_arm");
> +       if (cpu_has_lbt_mips)
> +               seq_puts(m, " lbt_mips");
> +       seq_puts(m, "\n");
>
>         seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_wat=
ch));
>         if (cpu_has_watch) {
> @@ -83,7 +98,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>                       cpu_data[n].watch_ireg_count, cpu_data[n].watch_dre=
g_count);
>         }
>
> -       seq_printf(m, "\n\n");
> +       seq_puts(m, "\n\n");
>
>         return 0;
>  }
> --
> 2.43.0
>
>
