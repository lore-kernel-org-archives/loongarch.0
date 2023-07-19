Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE89156D7
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 15:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AB3C433A9
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689779846;
	bh=zs2lDNIts3UruHAkzHqwAbPszoB9l7KgpRKzo64mdgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TUQy3Qjs3FavuJ1prwpZnt64996PxPFlfKzw6B9zjY4LZEKMtlC9UEy9jjY1B3Rs5
	 uT7Oqfs1gnKulOo5A61jBwbYtweETG2QBvOV6UCgC/e8baTTX1bDycCKA1poXybzCZ
	 Aq2pFcqi74nl20Avg4biygE1gLfhAnSz9tjxybwvxGVmyI6IVckTvryeYXxuAZmsDg
	 S9bnmys0QyojXtWeAw2+kT/uF/fTzzlrfhyT/8mGHMMeqVc6QSCJtF5eiswURDW/OR
	 nMkvgTFc/wkY0mSvEd7uByd4KBOc6peLBaEQUS/9vkd5d09WeVhdBMM+74ub2RKRKo
	 KE958Ru9SiV4g==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-52176fdad9dso7294071a12.0
        for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 08:17:25 -0700 (PDT)
X-Gm-Message-State: ABy/qLYPidUzsfTASfWTT6rxuhDRz7BfCGcsnjNlMyeJgvcNCfQmBxwX
	38dsTw0Lu1lF825LEKNvvtVX8z058WOjN8JWBuY=
X-Google-Smtp-Source: APBJJlHdk9geVdWqcQ8q0KZbDJbyqpGOjnZT72yWoQBuu0EnZhjXFPI2S63mnT9JDuOyuswi2ymVAXvHuM/lbl4rbRw=
X-Received: by 2002:aa7:c148:0:b0:51d:d3d4:d02f with SMTP id
 r8-20020aa7c148000000b0051dd3d4d02fmr3112041edp.8.1689779844119; Wed, 19 Jul
 2023 08:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719082732.2189747-1-lienze@kylinos.cn> <20230719082732.2189747-3-lienze@kylinos.cn>
In-Reply-To: <20230719082732.2189747-3-lienze@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Jul 2023 23:17:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5y2cbbzrWtPKPZtP-DwzAq+g=PvEExD=rru1PkQg37dA@mail.gmail.com>
Message-ID: <CAAhV-H5y2cbbzrWtPKPZtP-DwzAq+g=PvEExD=rru1PkQg37dA@mail.gmail.com>
Subject: Re: [PATCH 2/4] LoongArch: Get stack without NMI when providing regs parameter
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>
> Currently, executing arch_stack_walk can only get the full stack
> information including NMI.  This is because the implementation
> of arch_stack_walk is forced to ignore the information passed by the
> regs parameter and use the current stack information instead.
>
> For some detection systems like KFENCE, only partial stack information
> is needed.  In particular, the stack frame where the interrupt occurred.
>
> To support KFENCE, this patch modifies the implementation of the
> arch_stack_walk function so that if this function is called with the
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
>  arch/loongarch/kernel/stacktrace.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/s=
tacktrace.c
> index 2463d2fea21f..21f60811e26f 100644
> --- a/arch/loongarch/kernel/stacktrace.c
> +++ b/arch/loongarch/kernel/stacktrace.c
> @@ -18,16 +18,20 @@ void arch_stack_walk(stack_trace_consume_fn consume_e=
ntry, void *cookie,
>         struct pt_regs dummyregs;
>         struct unwind_state state;
>
> -       regs =3D &dummyregs;
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
When "task !=3D current", we don't need to handle the "regs !=3D NULL" case=
?

Huacai

> -               regs->regs[3] =3D thread_saved_fp(task);
> -               regs->csr_era =3D thread_saved_ra(task);
> +               dummyregs.regs[3] =3D thread_saved_fp(task);
> +               dummyregs.csr_era =3D thread_saved_ra(task);
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
