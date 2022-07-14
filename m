Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1446B9
	for <loongarch@lists.linux.dev>; Thu, 14 Jul 2022 13:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8510C385A2
	for <loongarch@lists.linux.dev>; Thu, 14 Jul 2022 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657804353;
	bh=nEK6K0+xvlBOpmwF55h7AMv2fTvVGg4WhQpZfCPwTck=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K4QkIeEnSjNOVvIakhJPaz+BMQichtSdqlqgo/9PLPrADjb9O9Q7eTVA5sAArg7G7
	 Wz2U29ZAffJAfCXtoyOV+ugQq7WiQTilWhdtejxGRfB79Ei8UPkylXA7hifTOYzqpj
	 9eX59A1bmQ3oOtuS7yZxkIBZwJGXLb+YCFMrXg3CYQJ1PRRSeHFzf+o083G/g+ZpBO
	 9bueQO2PlVC/gxQyaExACobVz9Y4bQZD+UWOczvu6Jwr3S1gjUffzVLPx7VLI0t5H/
	 hNOIwmDnOoxuaMcs3fXNaRIurBTkTWzTK5+hYAONAWeGobvMhsha+U2cAlgrdgnXBr
	 FcjGfj2Ij2hbA==
Received: by mail-vk1-f177.google.com with SMTP id 7so804701vkq.0
        for <loongarch@lists.linux.dev>; Thu, 14 Jul 2022 06:12:33 -0700 (PDT)
X-Gm-Message-State: AJIora/90SlaU3mInQrAAa0HxewJWlb6WmnGkzCG24TULgSZlGGU3+ts
	7rj8puGUicz+QTkhnTG+T7oRvXmmZw2Ek3vz+C0=
X-Google-Smtp-Source: AGRyM1vfuUcnXizkvLae+QNNbMgGaJxyylCp70bxKvXjxeF0ccvn003iMZHCh7GShPROgiewYW9IR85nmtOm2qXw1Wg=
X-Received: by 2002:a05:6122:329:b0:374:f09c:876f with SMTP id
 d9-20020a056122032900b00374f09c876fmr3625484vko.12.1657804352795; Thu, 14 Jul
 2022 06:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714062550.4934-1-huqi@loongson.cn>
In-Reply-To: <20220714062550.4934-1-huqi@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 14 Jul 2022 21:12:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6NWYG1ChLRyK-EAGAmhDvP-x+z9BgBo3a=GAbQ-2bKig@mail.gmail.com>
Message-ID: <CAAhV-H6NWYG1ChLRyK-EAGAmhDvP-x+z9BgBo3a=GAbQ-2bKig@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix missing fcsr in ptrace's fpr_set
To: Qi Hu <huqi@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Oleg Nesterov <oleg@redhat.com>, Xu Li <lixu@loongson.cn>, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Jul 14, 2022 at 2:26 PM Qi Hu <huqi@loongson.cn> wrote:
>
> In file ptrace.c, function fpr_set does not copy fcsr data from ubuf
> to kbuf. That's the reason why fcsr cannot be modified by ptrace.
>
> This patch fixs this problem and allows users using ptrace to modify
> the fcsr.
>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> Signed-off-by: Xu Li <lixu@loongson.cn>
> ---
>  arch/loongarch/kernel/ptrace.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
> index e6ab87948e1d..dc2b82ea894c 100644
> --- a/arch/loongarch/kernel/ptrace.c
> +++ b/arch/loongarch/kernel/ptrace.c
> @@ -193,7 +193,7 @@ static int fpr_set(struct task_struct *target,
>                    const void *kbuf, const void __user *ubuf)
>  {
>         const int fcc_start = NUM_FPU_REGS * sizeof(elf_fpreg_t);
> -       const int fcc_end = fcc_start + sizeof(u64);
> +       const int fcsr_start = fcc_start + sizeof(u64);
>         int err;
>
>         BUG_ON(count % sizeof(elf_fpreg_t));
> @@ -209,10 +209,12 @@ static int fpr_set(struct task_struct *target,
>         if (err)
>                 return err;
>
> -       if (count > 0)
> -               err |= user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> -                                         &target->thread.fpu.fcc,
> -                                         fcc_start, fcc_end);
> +       err |= user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> +                                 &target->thread.fpu.fcc, fcc_start,
> +                                 fcc_start + sizeof(u64));
> +       err |= user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> +                                 &target->thread.fpu.fcsr, fcsr_start,
> +                                 fcsr_start + sizeof(u32));
You shouldn't remove (count > 0) here, because  the above
user_regset_copyin() will modify count inside, and so "count == 0" is
possible.

Huacai
>
>         return err;
>  }
> --
> 2.37.0
>
