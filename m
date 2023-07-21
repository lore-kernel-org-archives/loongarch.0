Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705EB38F
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 02:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C662CC433CC
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 02:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689905882;
	bh=OFb9g6ZVz3kHcyjKj3uKCp4jraM5kd5rjK5FLNo6yJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O0Q0sK61rJcCbVji3lKH374hydIH6HStbBIjK+MKTn7trgsFbTJDqvifhwZyXJ584
	 chhr/pJ9hOixkEe32ae8ZLvdL9LA8j2VJKZtBOqI8cwRiDoz4Gu2gnCnlQ3zbO5HWk
	 dGQ5lH/8MKTc7TKZK+Tvk44SQeNEnP0OSx6GCW3fMBRf2Ue93ipXiF0YA3aY2IN6Wx
	 YEXMG1aByjfar6VcjryIYuhCFfEm42BdYa1VWXqma8jXcs7145Bgh3UyJq9XnFxA/A
	 PvSQ2N+F+wYSqF2n66CSzSeYsYu8HQkXvi1Vb98pmJHnVd4nGvx/6VeiFUgO9wF+sm
	 6rTcNIs2OT5mA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so2316011e87.2
        for <loongarch@lists.linux.dev>; Thu, 20 Jul 2023 19:18:02 -0700 (PDT)
X-Gm-Message-State: ABy/qLYN74+O0vSJ+JBK69IQbdkaV/2P0/ERqUxAVNNxOZHAHDXanIMr
	SkNWeOuTZUtic92kDgfuxnUiVgsNqRAemcmMF50=
X-Google-Smtp-Source: APBJJlGc1+79N7V0w84IVuUkC4WXeA0CcUQVXLLZetgREYIAGHNgmm4D7lGNmacSiRuRjfTUgM5z/XAR5H45yY9knms=
X-Received: by 2002:a05:6512:2826:b0:4fb:76f7:fde9 with SMTP id
 cf38-20020a056512282600b004fb76f7fde9mr369862lfb.30.1689905880781; Thu, 20
 Jul 2023 19:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719082732.2189747-1-lienze@kylinos.cn> <20230719082732.2189747-3-lienze@kylinos.cn>
 <CAAhV-H5y2cbbzrWtPKPZtP-DwzAq+g=PvEExD=rru1PkQg37dA@mail.gmail.com> <87tttyf2zj.fsf@kylinos.cn>
In-Reply-To: <87tttyf2zj.fsf@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 21 Jul 2023 10:17:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4TUnX_mgdn_GUFMvKZeNCi6TSUfpLr-Gr_Vt0m=wGs4g@mail.gmail.com>
Message-ID: <CAAhV-H4TUnX_mgdn_GUFMvKZeNCi6TSUfpLr-Gr_Vt0m=wGs4g@mail.gmail.com>
Subject: Re: [PATCH 2/4] LoongArch: Get stack without NMI when providing regs parameter
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 9:50=E2=80=AFAM Enze Li <lienze@kylinos.cn> wrote:
>
> Hi Huacai,
>
> Thanks for your review.
>
> On Wed, Jul 19 2023 at 11:17:14 PM +0800, Huacai Chen wrote:
>
> > Hi, Enze,
> >
> > On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn> wro=
te:
> >>
> >> Currently, executing arch_stack_walk can only get the full stack
> >> information including NMI.  This is because the implementation
> >> of arch_stack_walk is forced to ignore the information passed by the
> >> regs parameter and use the current stack information instead.
> >>
> >> For some detection systems like KFENCE, only partial stack information
> >> is needed.  In particular, the stack frame where the interrupt occurre=
d.
> >>
> >> To support KFENCE, this patch modifies the implementation of the
> >> arch_stack_walk function so that if this function is called with the
> >> regs argument passed, it retains all the stack information in regs and
> >> uses it to provide accurate information.
> >>
> >> Before the patch applied, I get,
> >> [    1.531195 ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [    1.531442 ] BUG: KFENCE: out-of-bounds read in stack_trace_save_re=
gs+0x48/0x6c
> >> [    1.531442 ]
> >> [    1.531900 ] Out-of-bounds read at 0xffff800012267fff (1B left of k=
fence-#12):
> >> [    1.532046 ]  stack_trace_save_regs+0x48/0x6c
> >> [    1.532169 ]  kfence_report_error+0xa4/0x528
> >> [    1.532276 ]  kfence_handle_page_fault+0x124/0x270
> >> [    1.532388 ]  no_context+0x50/0x94
> >> [    1.532453 ]  do_page_fault+0x1a8/0x36c
> >> [    1.532524 ]  tlb_do_page_fault_0+0x118/0x1b4
> >> [    1.532623 ]  test_out_of_bounds_read+0xa0/0x1d8
> >> [    1.532745 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
> >> [    1.532854 ]  kthread+0x124/0x130
> >> [    1.532922 ]  ret_from_kernel_thread+0xc/0xa4
> >> <snip>
> >>
> >> With this patch applied, I get the correct stack information.
> >> [    1.320220 ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [    1.320401 ] BUG: KFENCE: out-of-bounds read in test_out_of_bounds_=
read+0xa8/0x1d8
> >> [    1.320401 ]
> >> [    1.320898 ] Out-of-bounds read at 0xffff800012257fff (1B left of k=
fence-#10):
> >> [    1.321134 ]  test_out_of_bounds_read+0xa8/0x1d8
> >> [    1.321264 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
> >> [    1.321392 ]  kthread+0x124/0x130
> >> [    1.321459 ]  ret_from_kernel_thread+0xc/0xa4
> >> <snip>
> >>
> >> Signed-off-by: Enze Li <lienze@kylinos.cn>
> >> ---
> >>  arch/loongarch/kernel/stacktrace.c | 16 ++++++++++------
> >>  1 file changed, 10 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kerne=
l/stacktrace.c
> >> index 2463d2fea21f..21f60811e26f 100644
> >> --- a/arch/loongarch/kernel/stacktrace.c
> >> +++ b/arch/loongarch/kernel/stacktrace.c
> >> @@ -18,16 +18,20 @@ void arch_stack_walk(stack_trace_consume_fn consum=
e_entry, void *cookie,
> >>         struct pt_regs dummyregs;
> >>         struct unwind_state state;
> >>
> >> -       regs =3D &dummyregs;
> >> -
> >>         if (task =3D=3D current) {
> >> -               regs->regs[3] =3D (unsigned long)__builtin_frame_addre=
ss(0);
> >> -               regs->csr_era =3D (unsigned long)__builtin_return_addr=
ess(0);
> >> +               if (regs)
> >> +                       memcpy(&dummyregs, regs, sizeof(*regs));
> >> +               else {
> >> +                       dummyregs.regs[3] =3D (unsigned long)__builtin=
_frame_address(0);
> >> +                       dummyregs.csr_era =3D (unsigned long)__builtin=
_return_address(0);
> >> +               }
> >>         } else {
> > When "task !=3D current", we don't need to handle the "regs !=3D NULL" =
case?
> >
> > Huacai
> >
>
> So far, I have not encountered this situation.  I'm not sure what
> problems would arise from extending the modifications with "task !=3D
> current".
>
> However, these modifications now are sufficient for the KFENCE
> system.  I would suggest that we don't modify other parts until we
> encounter problems.  This way, we can forge ahead steadily.
I don't think so. In my opinion, "partial stack information" is a
clear requirement, whether the task is current or not.

So, if  the input regs is not NULL, we should always
memcpy(&dummyregs, regs, sizeof(*regs));

Or we may listen to Tiezhu's idea?

Huacai
>
> Best Regards,
> Enze
>
> >> -               regs->regs[3] =3D thread_saved_fp(task);
> >> -               regs->csr_era =3D thread_saved_ra(task);
> >> +               dummyregs.regs[3] =3D thread_saved_fp(task);
> >> +               dummyregs.csr_era =3D thread_saved_ra(task);
> >>         }
> >>
> >> +       regs =3D &dummyregs;
> >> +
> >>         regs->regs[1] =3D 0;
> >>         for (unwind_start(&state, task, regs);
> >>              !unwind_done(&state) && !unwind_error(&state); unwind_nex=
t_frame(&state)) {
> >> --
> >> 2.34.1
> >>
> >>
