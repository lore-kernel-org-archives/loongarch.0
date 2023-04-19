Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8440223B3
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 06:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB39C4339B
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 06:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681886977;
	bh=0ostpy3TuuaDejDrULgWLaQbiqsyq0vh98ZP12rBy78=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iIY4g9v1goc/d815e1BKtzAEcZU+ZVB/jeXKpRMd8p7RmquX1PmegOeYvgMl70HGc
	 39xSeoZJkSMA+2Y3ePbjwz5mH9xEHThLFLkzD0oiK4hXjnYQlE6A2BMMytCsYZpMgR
	 /kn7Vx3UXqQ5Z+78/kK2ztVaWECSyhAkPldHauQ4ezQKPlc8At3VnfHY09w89t6Fzx
	 JKiyPCjJJkCMM0PbnuKcAaQOXY2YnHO13ow4q1/q1/XY8MqaD1LtB/LAUUFLMTCNt6
	 j9MRsmCaGSVOkFHJd+nSkonnDFPpo+kX4Io+5W+C3mSEoxxcnYhz+9J5RL/xi7RF0M
	 e3SB5LKYyzuTA==
Received: by mail-ej1-f51.google.com with SMTP id c9so40165042ejz.1
        for <loongarch@lists.linux.dev>; Tue, 18 Apr 2023 23:49:37 -0700 (PDT)
X-Gm-Message-State: AAQBX9cthj9DxRrZyQNUHuKBeD+jOwAV7g6TKPlHvTS81jlNTqgDiD33
	Wq/27gHTY8jleEDI1e2rBHL942d5wXJ2z0h4GVk=
X-Google-Smtp-Source: AKy350bb//Y/uHr9TqKGGuxHYM1Xm72Pvmj3skKjzvfZorjTu6X9mBblELQfApAG2Kzjk+Upp2/iZ0lDoOmdd+cG4tY=
X-Received: by 2002:a17:906:82cc:b0:942:3d67:34bc with SMTP id
 a12-20020a17090682cc00b009423d6734bcmr6504859ejy.10.1681886975404; Tue, 18
 Apr 2023 23:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230416060356.3711529-1-kernel@xen0n.name> <20230416060356.3711529-4-kernel@xen0n.name>
In-Reply-To: <20230416060356.3711529-4-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Apr 2023 14:49:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4JmVq9y02gPxOCm6dFO+BS9=BLj_u276UdtEJ+DUHbUw@mail.gmail.com>
Message-ID: <CAAhV-H4JmVq9y02gPxOCm6dFO+BS9=BLj_u276UdtEJ+DUHbUw@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] LoongArch: Print GPRs with ABI names when
 showing registers
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 16, 2023 at 2:04=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> Print 3 registers per line to fit the entire line within 75 columns even
> with timestamp prefixed to each line, to ease future copy-pastes for all.
>
> And show the syscall restart flag (in place of the saved "$zero") if
> non-zero.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/kernel/traps.c | 38 +++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.=
c
> index 2f4279f612e7..f61de72e0c3a 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -158,22 +158,34 @@ static void __show_regs(const struct pt_regs *regs)
>         const int field =3D 2 * sizeof(unsigned long);
>         unsigned int excsubcode;
>         unsigned int exccode;
> -       int i;
>
>         show_regs_print_info(KERN_DEFAULT);
>
> -       /*
> -        * Saved main processor registers
> -        */
> -       for (i =3D 0; i < 32; ) {
> -               if ((i % 4) =3D=3D 0)
> -                       printk("$%2d   :", i);
> -               pr_cont(" %0*lx", field, regs->regs[i]);
> -
> -               i++;
> -               if ((i % 4) =3D=3D 0)
> -                       pr_cont("\n");
> -       }
> +       /* Print most of the GPRs, 3 per row to fit output in 75 columns =
*/
I prefer print 4 registers per line, including r0 (for alignment we
don't use zero).
e.g.,
r0(r0) .... r1(ra) .... r2(tp) .... r3(sp) ....

Huacai

> +       pr_cont("tp %0*lx sp %0*lx a0 %0*lx\n",
> +               field, regs->regs[2], field, regs->regs[3], field, regs->=
regs[4]);
> +       pr_cont("a1 %0*lx a2 %0*lx a3 %0*lx\n",
> +               field, regs->regs[5], field, regs->regs[6], field, regs->=
regs[7]);
> +       pr_cont("a4 %0*lx a5 %0*lx a6 %0*lx\n",
> +               field, regs->regs[8], field, regs->regs[9], field, regs->=
regs[10]);
> +       pr_cont("a7 %0*lx t0 %0*lx t1 %0*lx\n",
> +               field, regs->regs[11], field, regs->regs[12], field, regs=
->regs[13]);
> +       pr_cont("t2 %0*lx t3 %0*lx t4 %0*lx\n",
> +               field, regs->regs[14], field, regs->regs[15], field, regs=
->regs[16]);
> +       pr_cont("t5 %0*lx t6 %0*lx t7 %0*lx\n",
> +               field, regs->regs[17], field, regs->regs[18], field, regs=
->regs[19]);
> +       pr_cont("t8 %0*lx u0 %0*lx s9 %0*lx\n",
> +               field, regs->regs[20], field, regs->regs[21], field, regs=
->regs[22]);
> +       pr_cont("s0 %0*lx s1 %0*lx s2 %0*lx\n",
> +               field, regs->regs[23], field, regs->regs[24], field, regs=
->regs[25]);
> +       pr_cont("s3 %0*lx s4 %0*lx s5 %0*lx\n",
> +               field, regs->regs[26], field, regs->regs[27], field, regs=
->regs[28]);
> +       pr_cont("s6 %0*lx s7 %0*lx s8 %0*lx\n",
> +               field, regs->regs[29], field, regs->regs[30], field, regs=
->regs[31]);
> +
> +       /* The slot for $zero is reused as the syscall restart flag */
> +       if (regs->regs[0])
> +               pr_cont("syscall restart flag: %0*lx\n", field, regs->reg=
s[0]);
>
>         /*
>          * Saved csr registers
> --
> 2.40.0
>
>
