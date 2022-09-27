Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D1D645
	for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 05:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C12BC433B5
	for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 05:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664254994;
	bh=Jt1l+ur8owCZNiwKZzkzl+bfr1wPLucqAu5BcgfoKHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VqooohJpWsmp9T0yAMgRfKNhQgNMildZLFNzSZBMp8sEoU/+P10eS8Z+WYpwOG6Xu
	 lAYOt3ftHPLlTN1aF8Ja/ZBf5GXjnX9dV0JhA/RalpeoiFItESPgb13sbnvo0467C1
	 Mhnkv7d+u8EOsTMIeg2bYRax0Qb5l3RXUHhzw044GxTomY8rGqvq7Z/seOEiaKDMN+
	 5Vi5KN/8MuAxqWU0zRct+I2Ocyrq8r1KwBwGr4HKU0y9r4IPIgZvaafSaHDtpUbElu
	 N8xSaXRtZyHe6/n+GTLaEe/NuN8/dlRVw+hrXSNeikoL/YTYa7/k4zkmw6FOol++R7
	 KrDV0LggSs1kw==
Received: by mail-vs1-f45.google.com with SMTP id a129so8690467vsc.0
        for <loongarch@lists.linux.dev>; Mon, 26 Sep 2022 22:03:14 -0700 (PDT)
X-Gm-Message-State: ACrzQf1z/riXEMqmNZ+w6s+/pgyxXBlDlLm7246OFNAvGFiTkGB+NNQr
	zBzpPV385OIeyJQKI+UtBTgoUDneRSIMIHtks/8=
X-Google-Smtp-Source: AMsMyM5z4O33bMpiughscS5oPJRSCkVN84Wq4J5UOo9i92KMKuSDDYODXKgEp4DQ3Y5fibeF3nGDbQ+54+F/JRh8t7I=
X-Received: by 2002:a05:6102:1481:b0:39a:67f5:3096 with SMTP id
 d1-20020a056102148100b0039a67f53096mr9795505vsv.70.1664254993281; Mon, 26 Sep
 2022 22:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220926122727.2310118-1-yijun@loongson.cn> <CAJF2gTQR804AwU0up2-FyTciQZJY2M9xQ7JbiqjwMbkD=aLhCQ@mail.gmail.com>
 <5bf565a4-5bc4-42f8-59c0-8b908a9c2ab6@loongson.cn>
In-Reply-To: <5bf565a4-5bc4-42f8-59c0-8b908a9c2ab6@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 27 Sep 2022 13:03:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5oVTpGiW6T8dMSiGVe8KtAtUt2Q2sb5nEwc9PUJyqUnw@mail.gmail.com>
Message-ID: <CAAhV-H5oVTpGiW6T8dMSiGVe8KtAtUt2Q2sb5nEwc9PUJyqUnw@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: Fixup do_ri csr_era
To: Jun Yi <yijun@loongson.cn>
Cc: Guo Ren <guoren@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Qing Zhang <zhangqing@loongson.cn>, Mao Bibo <maobibo@loongson.cn>, 
	Jianmin Lv <lvjianmin@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, all,

I clean up do_ri() further based on this patch [1], thanks.

[1] https://lore.kernel.org/loongarch/20220927045820.2770062-1-chenhuacai@loongson.cn/T/#u


On Tue, Sep 27, 2022 at 11:10 AM Jun Yi <yijun@loongson.cn> wrote:
>
> do_ri is porting from mips, mipsr6 use do_ri to emulate some fp
> instructions, but Loongarch do not need to emulate these instructions.
>
> And the regs->csr_era be always recovered to ths old_era =
> regs->csr_era, so the compute_return_era is useless.
>
> On 9/27/22 07:41, Guo Ren wrote:
> > On Mon, Sep 26, 2022 at 8:27 PM Jun Yi <yijun@loongson.cn> wrote:
> >>
> >> csr_era of pt_regs in do_ri should not add 4 to point to the
> >> next instruction.
> > The comment does not make sense. I think it wants to skip some
> > instructions, but your patch broke that.
> >
> >>
> >> Signed-off-by: Jun Yi <yijun@loongson.cn>
> >> ---
> >>   arch/loongarch/kernel/traps.c | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
> >> index aa1c95aaf595..ec888eda3d45 100644
> >> --- a/arch/loongarch/kernel/traps.c
> >> +++ b/arch/loongarch/kernel/traps.c
> >> @@ -477,8 +477,6 @@ asmlinkage void noinstr do_ri(struct pt_regs *regs)
> >>
> >>          die_if_kernel("Reserved instruction in kernel code", regs);
> >>
> >> -       compute_return_era(regs);
> >> -
> >>          if (unlikely(get_user(opcode, era) < 0)) {
> >>                  status = SIGSEGV;
> >>                  current->thread.error_code = 1;
> >> --
> >> 2.31.1
> >>
> >
> >
>
