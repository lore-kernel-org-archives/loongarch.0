Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0958653B3
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 06:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVMF2a1I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2FDC433C7
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 06:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700807288;
	bh=6EvEOkLCr8zzgGpTKtoG3JN80jTAIS3N9m4lAjs88os=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fVMF2a1IZGlkiMZ9pgbYV3Y+bQHeOhcnNYjOBP2jZjlG82MrrY6GlPeJKnN+oJiU8
	 /Wkl8zDVm4qmJkODqnb3WNs7NKlDSoFljDwOcDhs0EIfxxWwJQ5j4IqbLp1ad2rufK
	 25nfuGbJVKsQW57QRVr9QW2psL1f/BwI4btz8FCkb3wFX3A6fbaUYrpiD24LJ+B2Xb
	 wKDStV1BcMjfIjrar6wsH3un5YL78TpQBttweyzhLhb09bxez9AHrQCLXnsiRE0pmV
	 SPWRUiDSvd3JyYbTyM+uIU7EDBcTAQ89o1efhQN/Jpdrjmuau92aFDqUcStovcHEFN
	 qoM52L0psHROw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a0029289b1bso213268966b.1
        for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 22:28:08 -0800 (PST)
X-Gm-Message-State: AOJu0YxHhFhM7CS6EK0x7Kx5dxlKQowgESyLzccFx9ABUXjHZxT2NAzL
	0HTgiVa8HRJrQjoMGQtiFrqtWJGmlEHJasSj3Qs=
X-Google-Smtp-Source: AGHT+IENQ0OhaK6zK/tqrB3ex7koa+d0QXMlUOEuGxbdpjWzKXGT0ZOyC2J39wgm+rsiiH5pomXQkuW9Sn3jhEkFcmc=
X-Received: by 2002:a17:906:1685:b0:9fe:a92b:9844 with SMTP id
 s5-20020a170906168500b009fea92b9844mr1125369ejd.37.1700807286981; Thu, 23 Nov
 2023 22:28:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231124014822.7894-1-hengqi.chen@gmail.com> <cdc62ae9-87f0-c9c8-a37a-d2fe24c224af@loongson.cn>
In-Reply-To: <cdc62ae9-87f0-c9c8-a37a-d2fe24c224af@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Nov 2023 14:27:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6xZBWzuPBSMDAmiuL=VV39Z9HJ+e0i0+BQuJo63b9ekg@mail.gmail.com>
Message-ID: <CAAhV-H6xZBWzuPBSMDAmiuL=VV39Z9HJ+e0i0+BQuJo63b9ekg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Check unwind_error() in show_backtrace()
To: Jinyang He <hejinyang@loongson.cn>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev, kernel@xen0n.name, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jinyang,

On Fri, Nov 24, 2023 at 10:34=E2=80=AFAM Jinyang He <hejinyang@loongson.cn>=
 wrote:
>
>
> On 2023-11-24 09:48, Hengqi Chen wrote:
> > While tracking down the CPU stall issues ([0]), I saw
> > that show_backtrace() stuck in an infinite loop ([1]):
> >
> >    [  153.610816] Call Trace:
> >    [  153.610929] [<9000000002723eb8>] show_stack+0x5c/0x180
> >    [  153.611252] [<90000000038e9954>] dump_stack_lvl+0x60/0x88
> >    [  153.611349] [<90000000038cf8ec>] rcu_dump_cpu_stacks+0xf8/0x150
> >    [  153.611452] [<90000000027dc5dc>] rcu_sched_clock_irq+0x69c/0xf10
> >    [  153.611585] [<90000000027f0dfc>] update_process_times+0x6c/0xb4
> >    [  153.611696] [<9000000002801fb8>] tick_nohz_highres_handler+0x54/0=
xe0
> >    [  153.611808] [<90000000027f1898>] __hrtimer_run_queues+0x178/0x344
> >    [  153.611909] [<90000000027f29dc>] hrtimer_interrupt+0x108/0x28c
> >    [  153.612009] [<90000000027269c4>] constant_timer_interrupt+0x38/0x=
48
> >    [  153.612113] [<90000000027b7824>] __handle_irq_event_percpu+0x68/0=
x24c
> >    [  153.612223] [<90000000027b7a20>] handle_irq_event_percpu+0x18/0x6=
c
> >    [  153.612327] [<90000000027bdae0>] handle_percpu_irq+0x54/0x88
> >    [  153.612420] [<90000000027b6af8>] generic_handle_domain_irq+0x28/0=
x40
> >    [  153.612524] [<9000000003085b0c>] handle_cpu_irq+0x6c/0xa8
> >    [  153.612621] [<90000000038e9c28>] handle_loongarch_irq+0x30/0x48
> >    [  153.612721] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >    [  153.612906] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >    [  153.612985] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >    [  153.613066] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >    [  153.613150] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >    ...
> >
> > This is because the unwinder does not stop immediately when
> > it reaches non-kernel stackframe at which point it sets
> > unwind_state::error.
>
> Hi, Hengqi,
>
>
> I think we can set `state->stack_info.type =3D STACK_TYPE_UNKNOWN` in
> next_frame() where set `state->error =3D true`.
>
> Stack type change to unknown also indicate that the unwind should stop.
In this way arch_stack_walk() don't need to call unwind_error() any
more? But then what is the real difference between unwind_done() and
unwind_error()?

Huacai

>
> The patch way makes us need fix the other place where call unwind_XXX().
>
> Seems commit 370a3b8f5874 ("LoongArch: Check unwind_error() in
> arch_stack_walk()") can be improved.
>
>
> Thanks,
>
> Jinyang
>
>
> > Add the missing unwind_error() check
> > to resolve the issue.
> >
> >    [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAq=
xy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#u
> >    [1]: https://github.com/chenhengqi/public/blob/main/verifier_movsx
> >
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >   arch/loongarch/kernel/traps.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/trap=
s.c
> > index aebfc3733a76..63bf24295e3d 100644
> > --- a/arch/loongarch/kernel/traps.c
> > +++ b/arch/loongarch/kernel/traps.c
> > @@ -65,7 +65,8 @@ static void show_backtrace(struct task_struct *task, =
const struct pt_regs *regs,
> >
> >       printk("%sCall Trace:", loglvl);
> >       for (unwind_start(&state, task, pregs);
> > -           !unwind_done(&state); unwind_next_frame(&state)) {
> > +         !unwind_done(&state) && !unwind_error(&state);
> > +          unwind_next_frame(&state)) {
> >               addr =3D unwind_get_return_address(&state);
> >               print_ip_sym(loglvl, addr);
> >       }
>
