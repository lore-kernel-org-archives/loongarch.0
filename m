Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3707423A97
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910675; cv=none; b=a4v05XE7m7QHpAEI42bfkzagLEsVmK3Ki2hWvUQ+J/6GR4/N0d+mvZOby7XCR2NYo8IZxPoezapSitdBZe1Pmuz+tYi4JMfRbtbOnUy0sEllAiEejOTxWVLRlxpXgD5SDZtaZjWpyVcx0hgnVP74YarT9VkO4nacK8qskt1PfwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910675; c=relaxed/simple;
	bh=T5jR8oFyaGXSo+iPT9vtSfl5SeXURECUf3DP0VsA9ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ta5xx3P9X9jGReASgJn3JU3RiK9pxIvmDjMqqd0YdD/i32Fre19jpqjTwcFoZft7F2U7qyGy+9P3HppYN2/7gMelCsMYdfG9Pwupf28MycjAnU3ezkoGaMYy6KYhmk+/W+PvvULu1UvJpMRx9cjKWnTCWz/Ec8AO+y/pgfT6lLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjKIco7/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjKIco7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7DDC4AF0B
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768910674;
	bh=T5jR8oFyaGXSo+iPT9vtSfl5SeXURECUf3DP0VsA9ZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UjKIco7/b/pNnxqqkkkxLiHYesw7a0bxN/ivFKDBzCFINQxF5G9BUK273SgC276FP
	 HrWrzAFlEZ6x9Ndkt6aau1O/OK4r86UAVVdXY7GDbezGJ3CSB0upTeBnZkHBFSgGeJ
	 QXCl6RSnjlEDNBjYL4qGNDT9RDeJyyxDo4p40mf948nQhmpuFxhrplS4FTL+ApH5/k
	 lMd0O/hQWRQhqSvaicE4AGfUcsTxbvqNGRPDcALQ7djFxXbOPYyf4NpwCX1bUqP6bl
	 9cf9KO3bk+3KhQhhjkH1smmmu2OJBqxMI38WVVthB+SHhXQ7d+c/vR+zs+tByp+OCg
	 vismoqEXovDIA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so10897947a12.0
        for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 04:04:34 -0800 (PST)
X-Gm-Message-State: AOJu0Yw9XW38ts3Tp0jQ24oJRkQGwVwsre7+aKCaba/DkB8lOTdN01F7
	jwtPahYJyoY1rglEdvJI7kE1L+bHE/c27KOODb5+mZ8ythGEOQkTeiQcYDS4CQ1EJ/Xrip0zhnu
	eyohIat8OeR/GT8/NYsmiVasF1vQkJdg=
X-Received: by 2002:a17:907:3e1b:b0:b80:40ea:1d65 with SMTP id
 a640c23a62f3a-b8793a69e79mr1448072266b.31.1768910673138; Tue, 20 Jan 2026
 04:04:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120092331.813-1-yangtiezhu@loongson.cn> <20260120092331.813-3-yangtiezhu@loongson.cn>
In-Reply-To: <20260120092331.813-3-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 20 Jan 2026 20:04:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5pxpEM=efhdF6C0t+p6DGHcr9zQPPDx3X_w_6K18dEGg@mail.gmail.com>
X-Gm-Features: AZwV_QiY0by1EF4mdHpWws4KHWgQF8bkb1NaDewLVvimpDyB8v8du-yGra4mGFI
Message-ID: <CAAhV-H5pxpEM=efhdF6C0t+p6DGHcr9zQPPDx3X_w_6K18dEGg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] LoongArch: Handle percpu handler address in bt_address()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Tue, Jan 20, 2026 at 5:23=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks for
> ORC unwinder"), the system can not boot normally under some configs,
> there are many error messages "cannot find unwind pc at".
>
> The kernel boots normally with the defconfig, so no problem found out
> at the first time. Here is one way to reproduce:
>
>   cd linux
>   make mrproper defconfig -j"$(nproc)"
>   scripts/config -e KASAN
>   make olddefconfig all -j"$(nproc)"
>   sudo make modules_install
>   sudo make install
>   sudo reboot
>
> The address that can not unwind is not a valid kernel address which is
> between "pcpu_handlers[cpu]" and "pcpu_handlers[cpu] + vec_sz" that is
> a very big address.
>
> The root cause is that the code of eentry was copied to the new area of
> pcpu_handlers[cpu] in setup_tlb_handler(), handle this special case to
> get the real address in bt_address() to unwind normally.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/setup.h |  2 ++
>  arch/loongarch/kernel/unwind_orc.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/=
asm/setup.h
> index 3c2fb16b11b6..79eb63e749f9 100644
> --- a/arch/loongarch/include/asm/setup.h
> +++ b/arch/loongarch/include/asm/setup.h
> @@ -14,6 +14,8 @@
>
>  extern unsigned long eentry;
>  extern unsigned long tlbrentry;
> +extern unsigned long pcpu_handlers[NR_CPUS];
> +extern long exception_handlers[VECSIZE * 128 / sizeof(long)];
>  extern char init_command_line[COMMAND_LINE_SIZE];
>  extern void tlb_init(int cpu);
>  extern void cpu_cache_init(void);
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index d6b3688a1ce9..40f4d6c12cf6 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -352,6 +352,18 @@ static inline unsigned long bt_address(unsigned long=
 ra)
>  {
>         extern unsigned long eentry;
>
> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
> +       for (int cpu =3D 1; cpu < num_possible_cpus(); cpu++) {
Use nr_cpu_ids instead of num_possible_cpus() can improve performance a lit=
tle.

> +               int vec_sz =3D sizeof(exception_handlers);
> +
It is better to add "if (!pcpu_handlers[cpu]) continue" here.


Huacai

> +               if (ra >=3D pcpu_handlers[cpu] &&
> +                   ra < pcpu_handlers[cpu] + vec_sz) {
> +                       ra =3D eentry + (ra - pcpu_handlers[cpu]);
> +                       break;
> +               }
> +       }
> +#endif
> +
>         if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
>                 unsigned long func;
>                 unsigned long type =3D (ra - eentry) / VECSIZE;
> --
> 2.42.0
>
