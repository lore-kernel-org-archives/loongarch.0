Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1024010786
	for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA29uXc2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F5BC433C9
	for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 11:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697283439;
	bh=CzqO/xhRHZDmhKrPv654VKtLA/I6VeNB3r9WQ2mlVe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dA29uXc2WOIJy5BPBXvucMo95PzBPdwWc7bmVJF6b+mSN3M88lmgXLNld3NKNlhAp
	 QEs2F+BkgbZWEM2wdonqq71QpnK+Ub+ABZqhZSK7Pbeemyf96WWj9dK+1RaoRAWgaB
	 EXlOH3lW8lypjLrMWm9B9N3AebP0NXq5R3kzuayu/RMw3utTFst/JftjqBFbPvq4ut
	 6dRWDFy7NBYbaNllxlvADPN3yFqSQNvmRLSuYYblnnL7KfyBRBFQJMlSEJoFJzY6Hs
	 gCAmXrX2LVsTzXpBtwf+vL55mfobvHMqrfWT9nyeUQ+CUc0jvlIGWzOJwx48Ktqdb+
	 e3zNCG1Z7I12Q==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so479627366b.3
        for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 04:37:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YznDXZRRLdfXC+6YbPDHq0ovTNvy41CEGPiCP+aC4SvS1cvBCla
	zoYlStFE9lV7bS7hnejxmJocvv0IVNc2OPnr2CI=
X-Google-Smtp-Source: AGHT+IHzohr8LI1cCAJKm+6ERY1v4M385XoHc80J03K7+SCs/7r2h/e765nGgtoWePxretmwTwdoJdsvMnoCxm1mlJs=
X-Received: by 2002:a17:907:1b15:b0:9bd:dfaa:3f2 with SMTP id
 mp21-20020a1709071b1500b009bddfaa03f2mr3494430ejc.6.1697283437976; Sat, 14
 Oct 2023 04:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1696856590-30298-1-git-send-email-yangtiezhu@loongson.cn>
 <1696856590-30298-9-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4pVRLPZ9OrfvV-UbPm1kRRJ0gpTqRtVbDd-eA5WzUaXg@mail.gmail.com> <bd40004b-10af-3c06-5ae0-750850f31446@loongson.cn>
In-Reply-To: <bd40004b-10af-3c06-5ae0-750850f31446@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 14 Oct 2023 19:37:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H77o8nMiYrKJt9nocpsOh5e66dAeg+j4soncniLc+eY=w@mail.gmail.com>
Message-ID: <CAAhV-H77o8nMiYrKJt9nocpsOh5e66dAeg+j4soncniLc+eY=w@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] LoongArch: Add ORC unwinder support
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+CC Jinyang

On Sat, Oct 14, 2023 at 5:21=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
>
>
> On 10/11/2023 12:37 PM, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > Maybe "LoongArch: Add ORC stack unwinder support" is better.
>
> OK, will modify it.
>
> >
> > On Mon, Oct 9, 2023 at 9:03=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson=
.cn> wrote:
> >>
> >> The kernel CONFIG_UNWINDER_ORC option enables the ORC unwinder, which =
is
> >> similar in concept to a DWARF unwinder. The difference is that the for=
mat
> >> of the ORC data is much simpler than DWARF, which in turn allows the O=
RC
> >> unwinder to be much simpler and faster.
>
> ...
>
> >> +ifdef CONFIG_OBJTOOL
> >> +# https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Decb=
802d02eeb
> >> +# https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D816=
029e06768
> >> +ifeq ($(shell as --help 2>&1 | grep -e '-mthin-add-sub'),)
> >> +  $(error Sorry, you need a newer gas version with -mthin-add-sub opt=
ion)
> > I prefer no error out here, because without this option we can still
> > built a runnable kernel.
>
> I agree with you that it is better to not error out to stop compilation,
> but there are many objtool warnings during the compile process with old
> binutils, so it is necessary to give a warning so that the users know
> what happened and how to fix the lots of objtool warnings.
>
> That is to say, I would prefer to replace "error" with "warning".
>
> >> +endif
> >> +KBUILD_AFLAGS  +=3D $(call cc-option,-mthin-add-sub) $(call cc-option=
,-Wa$(comma)-mthin-add-sub)
> >> +KBUILD_CFLAGS  +=3D $(call cc-option,-mthin-add-sub) $(call cc-option=
,-Wa$(comma)-mthin-add-sub)
> >> +KBUILD_CFLAGS  +=3D -fno-optimize-sibling-calls -fno-jump-tables -fal=
ign-functions=3D4
> >> +endif
>
> ...
>
> >> +#define ORC_REG_BP                     3
> > Use FP instead of BP in this patch, too.
>
> OK, will do it.
>
> >
> >> +#define ORC_REG_MAX                    4
>
> ...
>
> >> +.macro UNWIND_HINT_UNDEFINED
> >
> >> +       UNWIND_HINT type=3DUNWIND_HINT_TYPE_UNDEFINED
> >> +.endm
> > We don't need to set sp_reg=3DORC_REG_UNDEFINED for UNWIND_HINT_UNDEFIN=
ED?
>
> Yes, no need to set sp_reg, the instructions marked with UNDEFINED
> are blind spots in ORC coverage, it is no related with stack trace,
> this is similar with x86.
>
> >
> >> +
> >> +.macro UNWIND_HINT_EMPTY
> >> +       UNWIND_HINT sp_reg=3DORC_REG_UNDEFINED type=3DUNWIND_HINT_TYPE=
_CALL
> >> +.endm
> > We don't need to define UNWIND_HINT_END_OF_STACK?
>
> Yes, it is useless now.
>
> >
> >> +
> >> +.macro UNWIND_HINT_REGS
> >> +       UNWIND_HINT sp_reg=3DORC_REG_SP type=3DUNWIND_HINT_TYPE_REGS
> >> +.endm
> >> +
> >> +.macro UNWIND_HINT_FUNC
> >> +       UNWIND_HINT sp_reg=3DORC_REG_SP type=3DUNWIND_HINT_TYPE_CALL
> >> +.endm
> > We don't need to set sp_offset for UNWIND_HINT_REGS and UNWIND_HINT_FUN=
C?
>
> sp_offset is 0 by default, no need to set it unless you need to change
> its value, see include/linux/objtool.h
> .macro UNWIND_HINT type:req sp_reg=3D0 sp_offset=3D0 signal=3D0
>
> >
> >> +
> >> +#endif /* __ASSEMBLY__ */
>
> ...
>
> >> diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/ent=
ry.S
> >> index 65518bb..e43115f 100644
> >> --- a/arch/loongarch/kernel/entry.S
> >> +++ b/arch/loongarch/kernel/entry.S
> >> @@ -14,11 +14,13 @@
> >>  #include <asm/regdef.h>
> >>  #include <asm/stackframe.h>
> >>  #include <asm/thread_info.h>
> >> +#include <asm/unwind_hints.h>
> >>
> >>         .text
> >>         .cfi_sections   .debug_frame
> >>         .align  5
> >> -SYM_FUNC_START(handle_syscall)
> >> +SYM_CODE_START(handle_syscall)
> > Why?
> >
>
> see include/linux/linkage.h
> FUNC -- C-like functions (proper stack frame etc.)
> CODE -- non-C code (e.g. irq handlers with different, special stack etc.)
Hi, Jinyang,

What do you think about it? In our internal repo, most asm functions
changed in this patch are still marked with FUNC, not CODE.

>
> >> +       UNWIND_HINT_UNDEFINED
> >>         csrrd           t0, PERCPU_BASE_KS
>
> ...
>
> >> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head=
.S
> >> index 53b883d..5664390 100644
> >> --- a/arch/loongarch/kernel/head.S
> >> +++ b/arch/loongarch/kernel/head.S
> >> @@ -43,6 +43,7 @@ SYM_DATA(kernel_offset, .long _kernel_offset);
> >>         .align 12
> >>
> >>  SYM_CODE_START(kernel_entry)                   # kernel entry point
> >> +       UNWIND_HINT_EMPTY
> > I'm not sure but I think this isn't needed, because
> > "OBJECT_FILES_NON_STANDARD_head.o               :=3Dy"
>
> Yes, you are right, will remove it.
>
> >
> >>
> >>         /* Config direct window and set PG */
>
> ...
>
> >>  void __init setup_arch(char **cmdline_p)
> >>  {
> >> +       unwind_init();
> > I think this line should be after cpu_probe().
>
> I am OK to do this change, but if so, there are no stack trace before
> cpu_probe() for the early code.
As I said before, stack trace needs printk, but printk cannot work
before cpu_probe().

>
> >
> >>         cpu_probe();
> >>
> >>         init_environ();
>
> ...
>
> >> diff --git a/arch/loongarch/power/Makefile b/arch/loongarch/power/Make=
file
> >> index 58151d0..bbd1d47 100644
> >> --- a/arch/loongarch/power/Makefile
> >> +++ b/arch/loongarch/power/Makefile
> >> @@ -1,3 +1,5 @@
> >> +OBJECT_FILES_NON_STANDARD_suspend_asm.o :=3D y
> > hibernate_asm.o has no problem?
>
> Yes, only suspend_asm.o has one warning, just ignore it.
What kind of warning? When I submitted the suspend patch, Jinyang told
me that with his changes loongarch_suspend_enter() can be a regular
function.

Huacai
>
> Thanks,
> Tiezhu
>
>
