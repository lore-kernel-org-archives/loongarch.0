Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282EC4A0A
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 09:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BD3C385A2
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656150306;
	bh=sGD3QcG0UqAxSb4FrP5f6CZIJr2tycGD6WU0UZ1QWZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UczaFAbzdoc/32QDgjRcUtRaG2IkoBjuVMGAKwN77xH5Gt2XuyMDBa7sCyQs9lUkG
	 5qUD4wOgZfQ3ifcEy326Eo4Q6nXDXHK9JCVEQLSo+/SBQnO2gNj4b1sICDGB3TIBWj
	 7HrQQ31nQAPPLt31NhhsQcQaz7H9vOrptuwPE+l2hloXk1yMUsdpEBMczEGlhz0Ddq
	 OyYHkJMGQHZnHlXbQv1rlW2JDB+uveTiZUbqBNqQo1sZf4OdFPlLUMkPdvB3UKCwah
	 2YL2NdGpmGuAHzeFMkGRkmAwfCfjmfQYu2bMLuJy3TzAtFmtQdeBX0eeTZxTJFwjiY
	 OyztAvYyRbQhw==
Received: by mail-ua1-f46.google.com with SMTP id b7so1699865uap.5
        for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 02:45:06 -0700 (PDT)
X-Gm-Message-State: AJIora/ReYo+kQ6MSnYGk0tIptW6i9Im3MD/06AE7TTp3UrBLJ8PIJ4N
	uLXm+SwruGd7k/0Wjt+JBUHxUidipMV2SlQQxHo=
X-Google-Smtp-Source: AGRyM1soFmWLy6ThEXumO6AzvtcIrpUtCkUyXXAy8+AYu6PrM6UF1qCKGpFdqC+2KZ3JzLFcHVUb6laCVATRG5aAZw0=
X-Received: by 2002:ab0:4910:0:b0:35d:19ce:f020 with SMTP id
 z16-20020ab04910000000b0035d19cef020mr1224093uac.104.1656150305777; Sat, 25
 Jun 2022 02:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220625090150.3171909-1-chenhuacai@loongson.cn> <e960e9c9-dec6-6ac6-ed7c-7ba60e1f4ace@xen0n.name>
In-Reply-To: <e960e9c9-dec6-6ac6-ed7c-7ba60e1f4ace@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 25 Jun 2022 17:44:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6KpO=ND-fWze2uVLfUvMp1xY=MVSU+OWNygQ=xiQxC9Q@mail.gmail.com>
Message-ID: <CAAhV-H6KpO=ND-fWze2uVLfUvMp1xY=MVSU+OWNygQ=xiQxC9Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix the _stext symbol address
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

On Sat, Jun 25, 2022 at 5:31 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 6/25/22 17:01, Huacai Chen wrote:
> > _stext means the start of .text section (see __is_kernel_text()), but we
> > put its definition in .ref.text by mistake. Fix it by defining it at the
> > head of head.S.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/kernel/head.S | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
> > index e596dfcd924b..d8c625b89c7d 100644
> > --- a/arch/loongarch/kernel/head.S
> > +++ b/arch/loongarch/kernel/head.S
> > @@ -12,10 +12,10 @@
> >   #include <asm/loongarch.h>
> >   #include <asm/stackframe.h>
> >
> > -     __REF
> > -
> >   SYM_ENTRY(_stext, SYM_L_GLOBAL, SYM_A_NONE)
> >
> > +     __REF
> > +
> So why aren't we going the riscv way and just define _stext in
> vmlinux.lds.S so that there's no chance it's placed incorrectly?
It is a good idea, thanks.

Huacai
> >   SYM_CODE_START(kernel_entry)                        # kernel entry point
> >
> >       /* Config direct window and set PG */
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
