Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672125239
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iu5apHGd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D2AC433CA
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 07:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700810286;
	bh=lglZnYe7pXbnRD7veBOGW++vUBbEYHtZ/wJ0SrzzBP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iu5apHGdFR0Grv7XW8rwmXcgA6ebE+Jguvq4YYQnYDVvPAhFoRsdUPgbN3J1lsuq1
	 SaEphes7MiaeK2NbB4SNdjZliuJdn3S8jOpXMnAFujTbfQjX26vgS16urDu+yyfSKe
	 XxR3WgUYLo0ymoE2mCqFwcgVZIeF0uV2mSpDuxYaobehoDa5GFPZZVRvtzbem8B+zD
	 utNxCHpe5Lr0WmhnHOtJWVX8dWCRJWz4l4/Lt+00K0kqQ+p3l7cM3mb9aqHkoHJhYx
	 ux/bVApPWlEhlZBiL3kEPDUWzw5oXNO4LFRWWOi/iG5nOZvHVyTgNQsRqXZL8AQSTW
	 Uc5YnkQSGiezQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9fffa4c4f43so221114466b.3
        for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 23:18:06 -0800 (PST)
X-Gm-Message-State: AOJu0YyvJGJcus1IN+uUmrj8Md4bpWtOsSue2IVWdDbd5sVtpZAycL+P
	Y5CYqb5MmHv6UFoDH8N6ELtR5bL8zfpm9CTUTOw=
X-Google-Smtp-Source: AGHT+IG30BgEpDGvWnA6UgKIEuBwpFMhzxJ2o6eQPJ7Ym5PFv9aFzM0M/CI5VrC76Q5X7lljQllSyjsD1GGIyt53zO4=
X-Received: by 2002:a17:907:3101:b0:9c5:844f:a7f4 with SMTP id
 wl1-20020a170907310100b009c5844fa7f4mr1136067ejb.35.1700810285208; Thu, 23
 Nov 2023 23:18:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231124014822.7894-1-hengqi.chen@gmail.com> <cdc62ae9-87f0-c9c8-a37a-d2fe24c224af@loongson.cn>
 <CAAhV-H6xZBWzuPBSMDAmiuL=VV39Z9HJ+e0i0+BQuJo63b9ekg@mail.gmail.com> <8f54c95e-ec45-3b9a-013c-b7521a2eb685@loongson.cn>
In-Reply-To: <8f54c95e-ec45-3b9a-013c-b7521a2eb685@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Nov 2023 15:17:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H54EQe8AkqxTKDCEx8Np4mnanNNNek0412+M-hB=LkUVQ@mail.gmail.com>
Message-ID: <CAAhV-H54EQe8AkqxTKDCEx8Np4mnanNNNek0412+M-hB=LkUVQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Check unwind_error() in show_backtrace()
To: Jinyang He <hejinyang@loongson.cn>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev, kernel@xen0n.name, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 3:11=E2=80=AFPM Jinyang He <hejinyang@loongson.cn> =
wrote:
>
> On 2023-11-24 14:27, Huacai Chen wrote:
>
> > Hi, Jinyang,
> >
> > On Fri, Nov 24, 2023 at 10:34=E2=80=AFAM Jinyang He <hejinyang@loongson=
.cn> wrote:
> >>
> >> On 2023-11-24 09:48, Hengqi Chen wrote:
> >>> While tracking down the CPU stall issues ([0]), I saw
> >>> that show_backtrace() stuck in an infinite loop ([1]):
> >>>
> >>>     [  153.610816] Call Trace:
> >>>     [  153.610929] [<9000000002723eb8>] show_stack+0x5c/0x180
> >>>     [  153.611252] [<90000000038e9954>] dump_stack_lvl+0x60/0x88
> >>>     [  153.611349] [<90000000038cf8ec>] rcu_dump_cpu_stacks+0xf8/0x15=
0
> >>>     [  153.611452] [<90000000027dc5dc>] rcu_sched_clock_irq+0x69c/0xf=
10
> >>>     [  153.611585] [<90000000027f0dfc>] update_process_times+0x6c/0xb=
4
> >>>     [  153.611696] [<9000000002801fb8>] tick_nohz_highres_handler+0x5=
4/0xe0
> >>>     [  153.611808] [<90000000027f1898>] __hrtimer_run_queues+0x178/0x=
344
> >>>     [  153.611909] [<90000000027f29dc>] hrtimer_interrupt+0x108/0x28c
> >>>     [  153.612009] [<90000000027269c4>] constant_timer_interrupt+0x38=
/0x48
> >>>     [  153.612113] [<90000000027b7824>] __handle_irq_event_percpu+0x6=
8/0x24c
> >>>     [  153.612223] [<90000000027b7a20>] handle_irq_event_percpu+0x18/=
0x6c
> >>>     [  153.612327] [<90000000027bdae0>] handle_percpu_irq+0x54/0x88
> >>>     [  153.612420] [<90000000027b6af8>] generic_handle_domain_irq+0x2=
8/0x40
> >>>     [  153.612524] [<9000000003085b0c>] handle_cpu_irq+0x6c/0xa8
> >>>     [  153.612621] [<90000000038e9c28>] handle_loongarch_irq+0x30/0x4=
8
> >>>     [  153.612721] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >>>     [  153.612906] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >>>     [  153.612985] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >>>     [  153.613066] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >>>     [  153.613150] [<90000000038e9cc0>] do_vint+0x80/0xb4
> >>>     ...
> >>>
> >>> This is because the unwinder does not stop immediately when
> >>> it reaches non-kernel stackframe at which point it sets
> >>> unwind_state::error.
> >> Hi, Hengqi,
> >>
> >>
> >> I think we can set `state->stack_info.type =3D STACK_TYPE_UNKNOWN` in
> >> next_frame() where set `state->error =3D true`.
> >>
> >> Stack type change to unknown also indicate that the unwind should stop=
.
> > In this way arch_stack_walk() don't need to call unwind_error() any
> > more?
>
> Yes. But I think we should not set error in next_frame `if
> (user_mode(regs) || !__kernel_text_address(pc))`, because it indicate it
> should be user stack. Set `state->stack_info.type =3D STACK_TYPE_UNKNOWN`
> is ok, or call get_stack_info() may also be ok. See [1] and follows,
>
>
> >   But then what is the real difference between unwind_done() and
> > unwind_error()?
>
> unwind_done() means we should finish unwind because stack type is
> unexpected, not in irq stack or in task stack. Usually unwind exit when
> it meets user stack, it is probably a normal exit. In most cases it
> should be a flag of normal exit.
> unwind_error() means we should finish unwind because something
> unexpected which maybe caused by previous wrong unwind. For ORC
> unwinder, we may meet unexpected ORC info and set error. unwind_error()
> shows stack is unreliable.
Then you mean replace `state->error =3D true` with
`state->stack_info.type =3D STACK_TYPE_UNKNOWN` rather than add
`state->stack_info.type =3D STACK_TYPE_UNKNOWN` after  `state->error =3D
true` in Tiezhu's patch? If so, I suggest you submit a patch because
Hengqi may also be confusing (but I'm not sure) here.

Huacai
>
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git/tree/arch/x86/kernel/unwind_orc.c?h=3Dloongarch-next#n678
>
>
> Jinyang
>
>
> >
> > Huacai
> >
> >> The patch way makes us need fix the other place where call unwind_XXX(=
).
> >>
> >> Seems commit 370a3b8f5874 ("LoongArch: Check unwind_error() in
> >> arch_stack_walk()") can be improved.
> >>
> >>
> >> Thanks,
> >>
> >> Jinyang
> >>
> >>
> >>> Add the missing unwind_error() check
> >>> to resolve the issue.
> >>>
> >>>     [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_C=
jAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#u
> >>>     [1]: https://github.com/chenhengqi/public/blob/main/verifier_movs=
x
> >>>
> >>> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> >>> ---
> >>>    arch/loongarch/kernel/traps.c | 3 ++-
> >>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/tr=
aps.c
> >>> index aebfc3733a76..63bf24295e3d 100644
> >>> --- a/arch/loongarch/kernel/traps.c
> >>> +++ b/arch/loongarch/kernel/traps.c
> >>> @@ -65,7 +65,8 @@ static void show_backtrace(struct task_struct *task=
, const struct pt_regs *regs,
> >>>
> >>>        printk("%sCall Trace:", loglvl);
> >>>        for (unwind_start(&state, task, pregs);
> >>> -           !unwind_done(&state); unwind_next_frame(&state)) {
> >>> +         !unwind_done(&state) && !unwind_error(&state);
> >>> +          unwind_next_frame(&state)) {
> >>>                addr =3D unwind_get_return_address(&state);
> >>>                print_ip_sym(loglvl, addr);
> >>>        }
>
