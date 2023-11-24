Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3C44416
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 05:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBIEtZ78"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6d7e51638e7so922166a34.1
        for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 21:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700804060; x=1701408860; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHCCIv8tsPd8RTsRMpwqBw9Sr+WUe9/qiBoUH8rW8zo=;
        b=MBIEtZ78pZ535mezcn7EuhgfKeZkQ6a/wnDmhx0Lt8UQoVGu3BamTrJoHOhV+KqhVh
         62NUx3bUtwVN+sPDcSrOWQPnhVClC/ziwS83b2xmin0xoacgqyPDgFNNaKtAm3Hc1VF1
         gg/GAqYxIjcV+iT8RTvrAg3eRPsvs00zZCxKMHufjrYo4Iaa/fQ+c+vOqHIVaDkM2Hlq
         Bv5RH2xd/RFV4NcF3I5NitEYYtnCf3Rnv6cgLmK4Vgr6b1Xbi/0vKLABFGUqbyhuic+n
         v5gHeDwh3Sqi31knwNlhbh8uEQKPzZu+MgT7E18VeDUZnNPmLjjhE+dPeR75xBxP9/eU
         e1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700804060; x=1701408860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHCCIv8tsPd8RTsRMpwqBw9Sr+WUe9/qiBoUH8rW8zo=;
        b=I3n8E9tKmTKNY4PD9toyf13u4MRalc4yvLU0eChyOk6mzOqhMtCnNWSXVYFb2YMSA7
         OOUAepWp11N0vpj/qsoy4b+0W6SYk7hfdly0pJe2uDh/JLtK6yIRhv5t7zbKweCCXOzL
         GHs/8LUBKrMHQnN4Enb8g1m8LtoDz6eSV9NN2clKuTsZjtgJ48t5M1Re2at9WLJp9zt+
         quY9sjEAnxp9Jm59wJjo9aqkbTfvsFIkSnI2tDqZn8VSvP9n6CxKz7PIDPqk3iDNKbwO
         N6xRwuT+GxGj8Gwq6ecXmSJx+KoG3W0HiAmm8vywVOoL2kVqFqisj3gSU1Ka/ZpHfcAc
         Q+VA==
X-Gm-Message-State: AOJu0Yw73H3Fo4ZT1cRadJCQ661M+V39OTBtVYOjgii5/od6OwR+vIxA
	sKdr0slVvLfkYOqF9TvH6296ubjyp5xQ4O1vYcs=
X-Google-Smtp-Source: AGHT+IGLBmazJ8+WRX7D6BFsH26fNKmV1qhmZ31XpKcJc/86PtMtvxsnnWZ8U8FWV9aUZxIPKU8ftqCvo5Gw0MHl1D8=
X-Received: by 2002:a05:6871:3a22:b0:1fa:135:cc6a with SMTP id
 pu34-20020a0568713a2200b001fa0135cc6amr183927oac.4.1700804059661; Thu, 23 Nov
 2023 21:34:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231124014822.7894-1-hengqi.chen@gmail.com> <cdc62ae9-87f0-c9c8-a37a-d2fe24c224af@loongson.cn>
In-Reply-To: <cdc62ae9-87f0-c9c8-a37a-d2fe24c224af@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Fri, 24 Nov 2023 13:34:08 +0800
Message-ID: <CAEyhmHQ7ny4C7ZSvuWUdxYDRWvEJLjjG_jp1aZyXLh7a8o3mSA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Check unwind_error() in show_backtrace()
To: Jinyang He <hejinyang@loongson.cn>
Cc: loongarch@lists.linux.dev, chenhuacai@kernel.org, kernel@xen0n.name, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
>

OK, will do.

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
