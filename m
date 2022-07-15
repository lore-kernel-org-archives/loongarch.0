Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842987A
	for <loongarch@lists.linux.dev>; Fri, 15 Jul 2022 03:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D458C34115
	for <loongarch@lists.linux.dev>; Fri, 15 Jul 2022 03:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657855221;
	bh=r9nH0nnXki3fn2qUEx//h7cuqEVQBiYMXEgpzqbyJ5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oKw6mCZOD1HPIbLdEpgbQaev8ZMcZVxjKSGNSOdQchcnAh9IwRz8aZ2io+E+MTbbs
	 XcmIqOkLdbMkSErlBQNXmCN4tH1N8M/5uhNwn5IT0Kmiky4/q9Qmhqt5V75U7eniEm
	 od+2dX50pYreYY7GoKdd23jyYFRPrlFJH0r5Lh71vaftCd8mhUuqbtRkv5VnYyG+nx
	 1Jr5VxxHNSn4Qt9Gsn9P+a75y1IMp6sMMBkO2CFQtG+DOX3Gif1PGBMreTHt/PN/zc
	 rT5vLW7VBRTgIxnF15DbEyWLedboADMcTJUBusvin3BHOr002YDnkexTbxCWudGtpY
	 Ki5496NqPPDSg==
Received: by mail-vk1-f169.google.com with SMTP id u204so1617988vkb.7
        for <loongarch@lists.linux.dev>; Thu, 14 Jul 2022 20:20:21 -0700 (PDT)
X-Gm-Message-State: AJIora8rDbbFeE9mQKgakYu5F7fomBh/v3Dq38/d0CMAKAlFnxfBVVFq
	dfIylBqRIYwiwtOY9bm+KIzd0MnoJ7zo+R/fqyo=
X-Google-Smtp-Source: AGRyM1sN/ekI6UBawgnS3GWAQCMGXmmQNl+i2V8eRmbTHANUBobaCVtXNRsxJogDqP7TV8roV7OyjVCMMeIJdfGqkbs=
X-Received: by 2002:a1f:340f:0:b0:374:7b8a:378 with SMTP id
 b15-20020a1f340f000000b003747b8a0378mr4918379vka.37.1657855220231; Thu, 14
 Jul 2022 20:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714062550.4934-1-huqi@loongson.cn> <CAAhV-H6NWYG1ChLRyK-EAGAmhDvP-x+z9BgBo3a=GAbQ-2bKig@mail.gmail.com>
 <6896bb4c-5224-678f-e73c-fe95be41d196@loongson.cn>
In-Reply-To: <6896bb4c-5224-678f-e73c-fe95be41d196@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 15 Jul 2022 11:20:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6eBuGS5F2=DQEMnV1JWOi8rn8g=SR++FxAWa5V6WABgQ@mail.gmail.com>
Message-ID: <CAAhV-H6eBuGS5F2=DQEMnV1JWOi8rn8g=SR++FxAWa5V6WABgQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix missing fcsr in ptrace's fpr_set
To: Qi Hu <huqi@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Oleg Nesterov <oleg@redhat.com>, Xu Li <lixu@loongson.cn>, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 10:07 PM Qi Hu <huqi@loongson.cn> wrote:
>
>
> On 2022/7/14 21:12, Huacai Chen wrote:
> > Hi,
> >
> > On Thu, Jul 14, 2022 at 2:26 PM Qi Hu <huqi@loongson.cn> wrote:
> >> In file ptrace.c, function fpr_set does not copy fcsr data from ubuf
> >> to kbuf. That's the reason why fcsr cannot be modified by ptrace.
> >>
> >> This patch fixs this problem and allows users using ptrace to modify
> >> the fcsr.
> >>
> >> Signed-off-by: Qi Hu <huqi@loongson.cn>
> >> Signed-off-by: Xu Li <lixu@loongson.cn>
> >> ---
> >>   arch/loongarch/kernel/ptrace.c | 12 +++++++-----
> >>   1 file changed, 7 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
> >> index e6ab87948e1d..dc2b82ea894c 100644
> >> --- a/arch/loongarch/kernel/ptrace.c
> >> +++ b/arch/loongarch/kernel/ptrace.c
> >> @@ -193,7 +193,7 @@ static int fpr_set(struct task_struct *target,
> >>                     const void *kbuf, const void __user *ubuf)
> >>   {
> >>          const int fcc_start = NUM_FPU_REGS * sizeof(elf_fpreg_t);
> >> -       const int fcc_end = fcc_start + sizeof(u64);
> >> +       const int fcsr_start = fcc_start + sizeof(u64);
> >>          int err;
> >>
> >>          BUG_ON(count % sizeof(elf_fpreg_t));
> >> @@ -209,10 +209,12 @@ static int fpr_set(struct task_struct *target,
> >>          if (err)
> >>                  return err;
> >>
> >> -       if (count > 0)
> >> -               err |= user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> >> -                                         &target->thread.fpu.fcc,
> >> -                                         fcc_start, fcc_end);
> >> +       err |= user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> >> +                                 &target->thread.fpu.fcc, fcc_start,
> >> +                                 fcc_start + sizeof(u64));
> >> +       err |= user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> >> +                                 &target->thread.fpu.fcsr, fcsr_start,
> >> +                                 fcsr_start + sizeof(u32));
> > You shouldn't remove (count > 0) here, because  the above
> > user_regset_copyin() will modify count inside, and so "count == 0" is
> > possible.
> >
> > Huacai
>
> Yes, the "count" should be considered. But the "count" is checked at the
> beginning of the "user_regset_copyin()".
>
> So "count > 0" is useless, i think.
Yes, you are right, thanks.

Huacai
>
> Also like riscv, "count" is not checked in "riscv_fpr_set()".
>
> >>          return err;
> >>   }
> >> --
> >> 2.37.0
> >>
>
