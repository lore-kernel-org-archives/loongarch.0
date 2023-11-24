Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27344138C
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 04:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uW8EghXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869EEC433CD
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 04:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700799195;
	bh=g00aGacatlXzlmOn45qqzTsgRq9myawG5r3tmKSvIp0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uW8EghXURT1ADZOcJvN2pO+B/ohjE8JY2dSDjIgR4peRafYJ415/ize7Nx/W0mF8N
	 IoieWDLL0WfF8FXpLgvPu8/3SR1yCWUYIkAvRuRjBIodUrGLozDLH2eb3QyoyDj6VD
	 o7oIxBnDpecNGll5+dTCM36sTyXZs59vyiIzNeSrysF3a8/Yb4vyi/8QUTrh6/nd2/
	 tq0+WrZyZLl5kJb5bRCxZikpGkTPnF8UL/jyMGMZBenV+dVOk3T5wpdTv5x1M7sp8I
	 CTX36zZuy+w0PZkJW2A9Bsx17UzeMnEE7gE1+Hw+avmusv+wGDnN0Px52m1BABuL/x
	 oRFA5cq7FAm5Q==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a011e9bf336so203168066b.3
        for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 20:13:15 -0800 (PST)
X-Gm-Message-State: AOJu0YxOhlolXP6qA4jzjWAnuNr1tsthRMpk/OpFGjoJi1C8w4q4kthP
	PtZyQyNrZbVmH+b9kVFhywAg4uOcALqclNiXfno=
X-Google-Smtp-Source: AGHT+IGUginP95BOc5B+0Y/MBzr6ctlhyRQFFPr7xkZiTXxJBxpm6SsMScvUXZkCodTQ4fRT0EzHB3NUSXWPA4ejqg8=
X-Received: by 2002:a17:907:a092:b0:9fd:ab4:5859 with SMTP id
 hu18-20020a170907a09200b009fd0ab45859mr972804ejc.66.1700799193946; Thu, 23
 Nov 2023 20:13:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231124014822.7894-1-hengqi.chen@gmail.com>
In-Reply-To: <20231124014822.7894-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Nov 2023 12:13:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6n-_tutzF1qwaN+RgGwdFeK4gSbeDG=oNB+YC-3hnKcA@mail.gmail.com>
Message-ID: <CAAhV-H6n-_tutzF1qwaN+RgGwdFeK4gSbeDG=oNB+YC-3hnKcA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Check unwind_error() in show_backtrace()
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi,

On Fri, Nov 24, 2023 at 9:48=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> While tracking down the CPU stall issues ([0]), I saw
> that show_backtrace() stuck in an infinite loop ([1]):
>
>   [  153.610816] Call Trace:
>   [  153.610929] [<9000000002723eb8>] show_stack+0x5c/0x180
>   [  153.611252] [<90000000038e9954>] dump_stack_lvl+0x60/0x88
>   [  153.611349] [<90000000038cf8ec>] rcu_dump_cpu_stacks+0xf8/0x150
>   [  153.611452] [<90000000027dc5dc>] rcu_sched_clock_irq+0x69c/0xf10
>   [  153.611585] [<90000000027f0dfc>] update_process_times+0x6c/0xb4
>   [  153.611696] [<9000000002801fb8>] tick_nohz_highres_handler+0x54/0xe0
>   [  153.611808] [<90000000027f1898>] __hrtimer_run_queues+0x178/0x344
>   [  153.611909] [<90000000027f29dc>] hrtimer_interrupt+0x108/0x28c
>   [  153.612009] [<90000000027269c4>] constant_timer_interrupt+0x38/0x48
>   [  153.612113] [<90000000027b7824>] __handle_irq_event_percpu+0x68/0x24=
c
>   [  153.612223] [<90000000027b7a20>] handle_irq_event_percpu+0x18/0x6c
>   [  153.612327] [<90000000027bdae0>] handle_percpu_irq+0x54/0x88
>   [  153.612420] [<90000000027b6af8>] generic_handle_domain_irq+0x28/0x40
>   [  153.612524] [<9000000003085b0c>] handle_cpu_irq+0x6c/0xa8
>   [  153.612621] [<90000000038e9c28>] handle_loongarch_irq+0x30/0x48
>   [  153.612721] [<90000000038e9cc0>] do_vint+0x80/0xb4
>   [  153.612906] [<90000000038e9cc0>] do_vint+0x80/0xb4
>   [  153.612985] [<90000000038e9cc0>] do_vint+0x80/0xb4
>   [  153.613066] [<90000000038e9cc0>] do_vint+0x80/0xb4
>   [  153.613150] [<90000000038e9cc0>] do_vint+0x80/0xb4
>   ...
>
> This is because the unwinder does not stop immediately when
> it reaches non-kernel stackframe at which point it sets
> unwind_state::error. Add the missing unwind_error() check
> to resolve the issue.
I think this patch doesn't really fix this?
https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvd=
ojJqB9P7eQ@mail.gmail.com/T/#u

Huacai

>
>   [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8=
NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#u
>   [1]: https://github.com/chenhengqi/public/blob/main/verifier_movsx
>
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/kernel/traps.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.=
c
> index aebfc3733a76..63bf24295e3d 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -65,7 +65,8 @@ static void show_backtrace(struct task_struct *task, co=
nst struct pt_regs *regs,
>
>         printk("%sCall Trace:", loglvl);
>         for (unwind_start(&state, task, pregs);
> -             !unwind_done(&state); unwind_next_frame(&state)) {
> +           !unwind_done(&state) && !unwind_error(&state);
> +            unwind_next_frame(&state)) {
>                 addr =3D unwind_get_return_address(&state);
>                 print_ip_sym(loglvl, addr);
>         }
> --
> 2.34.1
>
>
