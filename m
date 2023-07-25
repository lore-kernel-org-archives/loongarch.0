Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039E98F6D
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 07:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A82C433CC
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 07:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690270840;
	bh=AOHwROKmGtBG7XOHBminxc/6E3cmVoJDNP/s7PlxeYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MVtiqIi6PGKRQknHTw71Br9/q4TAyGBb9NN63nUzVhERY/hH+59ont31lO0nj51q+
	 lNzgXOFzpyi2pN9zWG3/3BGhB0uzapkoZU3Ts9tl/Akef9jkv87akXLqYqpndBSFf3
	 lwBhErih9iXBB5AoFMPTegfqIfxTrYqf/W188/maKNLIaXK2g1nJX1nTcqLtNXAL3j
	 HnTJb98b77GiDaM7qc/iXtIyQTZ7IDgrir+8FRYao68Gv0MHItVxR6fT48nN0Sgpm2
	 RwgrfDD9oPv+LRXK3UGyveRvbQipu/gzUbH7wQVWMDzKZaSg0Oj49fTEmKrbqqrwhe
	 hSYTBtJfzGXqQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5222a38c0a0so3254890a12.1
        for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 00:40:40 -0700 (PDT)
X-Gm-Message-State: ABy/qLY0F+yIqM5ZKAZWSTo29ZsFELZ4q1i7xVRORnsXMe/AClNCLvhw
	/xY9xsXOyZGSJe2UnEih9jR1TouSiFegvFxmscI=
X-Google-Smtp-Source: APBJJlFe7MXMEuBF8GWVtQgoNuR0bYSvHyKHvTptNy+xNFhtVSvcI5BHDqhjFeqCVNdqAqOUwnzKYZQlZfILYHmHMbU=
X-Received: by 2002:aa7:c613:0:b0:522:4f0a:6822 with SMTP id
 h19-20020aa7c613000000b005224f0a6822mr695646edq.22.1690270838627; Tue, 25 Jul
 2023 00:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230725061451.1231480-1-lienze@kylinos.cn> <20230725061451.1231480-3-lienze@kylinos.cn>
In-Reply-To: <20230725061451.1231480-3-lienze@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Jul 2023 15:40:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5nAwmjNsaA+=iR9EjrTSRogZUaoTcCULoe0YMgbAuFvg@mail.gmail.com>
Message-ID: <CAAhV-H5nAwmjNsaA+=iR9EjrTSRogZUaoTcCULoe0YMgbAuFvg@mail.gmail.com>
Subject: Re: [PATCH 2/4 v2] LoongArch: Get stack without NMI when providing
 regs parameter
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

On Tue, Jul 25, 2023 at 2:15=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>
> Currently, arch_stack_walk() can only get the full stack information
> including NMI.  This is because the implementation of arch_stack_walk()
> is forced to ignore the information passed by the regs parameter and use
> the current stack information instead.
>
> For some detection systems like KFENCE, only partial stack information
> is needed.  In particular, the stack frame where the interrupt occurred.
>
> To support KFENCE, this patch modifies the implementation of the
> arch_stack_walk() function so that if this function is called with the
> regs argument passed, it retains all the stack information in regs and
> uses it to provide accurate information.
>
> Before the patch applied, I get,
> [    1.531195 ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    1.531442 ] BUG: KFENCE: out-of-bounds read in stack_trace_save_regs+=
0x48/0x6c
> [    1.531442 ]
> [    1.531900 ] Out-of-bounds read at 0xffff800012267fff (1B left of kfen=
ce-#12):
> [    1.532046 ]  stack_trace_save_regs+0x48/0x6c
> [    1.532169 ]  kfence_report_error+0xa4/0x528
> [    1.532276 ]  kfence_handle_page_fault+0x124/0x270
> [    1.532388 ]  no_context+0x50/0x94
> [    1.532453 ]  do_page_fault+0x1a8/0x36c
> [    1.532524 ]  tlb_do_page_fault_0+0x118/0x1b4
> [    1.532623 ]  test_out_of_bounds_read+0xa0/0x1d8
> [    1.532745 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
> [    1.532854 ]  kthread+0x124/0x130
> [    1.532922 ]  ret_from_kernel_thread+0xc/0xa4
> <snip>
>
> With this patch applied, I get the correct stack information.
> [    1.320220 ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    1.320401 ] BUG: KFENCE: out-of-bounds read in test_out_of_bounds_rea=
d+0xa8/0x1d8
> [    1.320401 ]
> [    1.320898 ] Out-of-bounds read at 0xffff800012257fff (1B left of kfen=
ce-#10):
> [    1.321134 ]  test_out_of_bounds_read+0xa8/0x1d8
> [    1.321264 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
> [    1.321392 ]  kthread+0x124/0x130
> [    1.321459 ]  ret_from_kernel_thread+0xc/0xa4
> <snip>
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>  arch/loongarch/kernel/stacktrace.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/s=
tacktrace.c
> index 2463d2fea21f..9dab30ae68ec 100644
> --- a/arch/loongarch/kernel/stacktrace.c
> +++ b/arch/loongarch/kernel/stacktrace.c
> @@ -18,16 +18,24 @@ void arch_stack_walk(stack_trace_consume_fn consume_e=
ntry, void *cookie,
>         struct pt_regs dummyregs;
>         struct unwind_state state;
>
> -       regs =3D &dummyregs;
We can move the 'if (regs)' logic here and simplify the whole function.

Huacai
> -
>         if (task =3D=3D current) {
> -               regs->regs[3] =3D (unsigned long)__builtin_frame_address(=
0);
> -               regs->csr_era =3D (unsigned long)__builtin_return_address=
(0);
> +               if (regs)
> +                       memcpy(&dummyregs, regs, sizeof(*regs));
> +               else {
> +                       dummyregs.regs[3] =3D (unsigned long)__builtin_fr=
ame_address(0);
> +                       dummyregs.csr_era =3D (unsigned long)__builtin_re=
turn_address(0);
> +               }
>         } else {
> -               regs->regs[3] =3D thread_saved_fp(task);
> -               regs->csr_era =3D thread_saved_ra(task);
> +               if (regs)
> +                       memcpy(&dummyregs, regs, sizeof(*regs));
> +               else {
> +                       dummyregs.regs[3] =3D thread_saved_fp(task);
> +                       dummyregs.csr_era =3D thread_saved_ra(task);
> +               }
>         }
>
> +       regs =3D &dummyregs;
> +
>         regs->regs[1] =3D 0;
>         for (unwind_start(&state, task, regs);
>              !unwind_done(&state) && !unwind_error(&state); unwind_next_f=
rame(&state)) {
> --
> 2.34.1
>
>
