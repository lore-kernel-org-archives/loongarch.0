Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C527F
	for <loongarch@lists.linux.dev>; Tue,  2 Aug 2022 01:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13910C433D6
	for <loongarch@lists.linux.dev>; Tue,  2 Aug 2022 01:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659403836;
	bh=JEUXUjvWpoYqhZ1GKJd3NPpvi9zssDdyYvhYz1KnSBA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cK6OOwZF8ti1lbS8aOHE1Iu+lmH6lKHgaWf9BeCWDaf0DE7dexc4DoRoCvzLP/UFq
	 eIBGtfaR8fTCj3iWnGXulTAg59lYIRxWQs63Gna9ZupgoGMNbc1Z8jQeNLDlFYOx76
	 7ilKxntjVmhmWc7Jz/LznZfA1DupAWZzfK3GnUqtxWP80i0TbDPR5KFlZwvgqh9HK+
	 Tt3z+09DLd9BE0Ahtr1j0T5xkc6QY+xjb5rUsqELt7V2MF+VwnaCFsQ9E7IArmCOYX
	 KrFJPMLkQdbfMIqzWHDH9jGXYjeie9BwrkAVxX5Pdsmj/VBQFqvxe77TgX/sDNnreO
	 rjHDKMpD5jLdg==
Received: by mail-vs1-f49.google.com with SMTP id x125so13077830vsb.13
        for <loongarch@lists.linux.dev>; Mon, 01 Aug 2022 18:30:36 -0700 (PDT)
X-Gm-Message-State: ACgBeo3FTEr+qpDAkUcVMlVyz8C9vhh2i8HBM2nGH7Bkdj8e0rtsW4ry
	RxKG0mwLzHA5cCAsd3tLz4Pxe4R9rVcJCP5GPiM=
X-Google-Smtp-Source: AA6agR4EqJtJecZxlBtqEwhgAhcg0aAQpjAyZjXLdHSHUP3WjNoRhq5nvJQCm1SEAYOQnTkrpu/2mdU+6L8fjkF+2uY=
X-Received: by 2002:a05:6102:390d:b0:387:78b9:bf9c with SMTP id
 e13-20020a056102390d00b0038778b9bf9cmr1360406vsu.43.1659403834985; Mon, 01
 Aug 2022 18:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220801121726.9681-1-zhangqing@loongson.cn> <20220801121726.9681-4-zhangqing@loongson.cn>
 <CAAhV-H6Az_X1afvAO+JxnDaW-Ey_8wmozehd++qOZoGmimM+6g@mail.gmail.com> <3cc6aebc-87e7-f0d0-2a88-e7e742e1e5ee@loongson.cn>
In-Reply-To: <3cc6aebc-87e7-f0d0-2a88-e7e742e1e5ee@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 2 Aug 2022 09:30:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H61ZXvF2xvXsyrxRYj6impet0w83svkt94FUhJhzj-2EQ@mail.gmail.com>
Message-ID: <CAAhV-H61ZXvF2xvXsyrxRYj6impet0w83svkt94FUhJhzj-2EQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] LoongArch: Add stacktrace support
To: zhangqing <zhangqing@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qing,

On Tue, Aug 2, 2022 at 9:20 AM zhangqing <zhangqing@loongson.cn> wrote:
>
>
>
> On 2022/8/1 =E4=B8=8B=E5=8D=8811:30, Huacai Chen wrote:
> > Hi, Qing,
> >
> > On Mon, Aug 1, 2022 at 8:17 PM Qing Zhang <zhangqing@loongson.cn> wrote=
:
> >>
> >> Use common arch_stack_walk infrastructure to avoid duplicated code and
> >> avoid taking care of the stack storage and filtering.
> >> Add sra (means __schedule return address) and scfa (means __schedule c=
all
> >> frame address) to thread_info and store it in switch_to().
> >>
> >> Now we can print the process stack by cat /proc/*/stack and can better
> >> support ftrace.
> >>
> >> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> >> ---
> >>   arch/loongarch/Kconfig                 |  5 ++++
> >>   arch/loongarch/include/asm/processor.h |  9 +++++++
> >>   arch/loongarch/include/asm/switch_to.h | 14 ++++++----
> >>   arch/loongarch/include/asm/uaccess.h   |  4 +--
> >>   arch/loongarch/kernel/Makefile         |  1 +
> >>   arch/loongarch/kernel/asm-offsets.c    |  2 ++
> >>   arch/loongarch/kernel/process.c        |  3 +++
> >>   arch/loongarch/kernel/stacktrace.c     | 37 ++++++++++++++++++++++++=
++
> >>   arch/loongarch/kernel/switch.S         |  2 ++
> >>   9 files changed, 70 insertions(+), 7 deletions(-)
> >>   create mode 100644 arch/loongarch/kernel/stacktrace.c
> >>
> >> diff --git a/arch/loongarch/include/asm/uaccess.h b/arch/loongarch/inc=
lude/asm/uaccess.h
> >> index 2b44edc604a2..a8ae2af4025a 100644
> >> --- a/arch/loongarch/include/asm/uaccess.h
> >> +++ b/arch/loongarch/include/asm/uaccess.h
> >> @@ -229,13 +229,13 @@ extern unsigned long __copy_user(void *to, const=
 void *from, __kernel_size_t n);
> >>   static inline unsigned long __must_check
> >>   raw_copy_from_user(void *to, const void __user *from, unsigned long =
n)
> >>   {
> >> -       return __copy_user(to, from, n);
> >> +       return __copy_user(to, (__force const void *)from, n);
> >>   }
> >>
> >>   static inline unsigned long __must_check
> >>   raw_copy_to_user(void __user *to, const void *from, unsigned long n)
> >>   {
> >> -       return __copy_user(to, from, n);
> >> +       return __copy_user((__force void *)to, from, n);
> > Why this? Does it have something to do with stacktrace?
> >
> > Huacai
>
> Hi, huacai
>
> This is kernel test robot report sparse warnings:
> I reproduced locally and found that other architectures calling
> __copy_user also use __force conversion, Is this modification appropriate=
?
>
> kernel/trace/trace_events_user.c: note: in included file (through
> include/linux/uaccess.h, include/linux/sched/task.h,
> include/linux/sched/signal.h, ...):
>     arch/loongarch/include/asm/uaccess.h:232:32: sparse: sparse:
> incorrect type in argument 2 (different address spaces) @@     expected
> void const *from @@     got void const [noderef] __user *from @@
>     arch/loongarch/include/asm/uaccess.h:232:32: sparse:     expected
> void const *from
>     arch/loongarch/include/asm/uaccess.h:232:32: sparse:     got void
> const [noderef] __user *from
The modification might be correct, but should it be in this patch?

Huacai
>
> Thanks,
> -Qing
>
>
>
