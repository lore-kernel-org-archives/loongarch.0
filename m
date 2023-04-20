Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E36F3C04
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 08:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E4FC433EF
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681978899;
	bh=V8tTQfaQLfaqXBpeDFQADL4hlD5VjTx3GR/FZ7oCLII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uJm8x8y7XAHrzLPrw1d2L9hPUir0fzy6ZzeKVuHBwZ8wjqfwq+BUzkt6lLPAXl2Lj
	 aGsyBjHQgV3KDeGdwgqmErIsxnGZ7Id8fM2ZAL+RJNgi6qK5UOroPOkHkbHGmBsjLv
	 1p1W0z9ot5DysA/Kz0s2Trco5YxpLbnebaoZVBE8fey/KfDghKR7tOx5tjnv3o5MkG
	 iJIc2j/hCPFywYtA+nUFbr45N/VwK+6eh8mPm6cHlbV6/OcWgjGE/6yiQX4nFl+yaO
	 smPNVdl2lYykRcFRotnJcaxxijMs9rC0zC2UVtHaeKZDPLNW3bZaWw3np+3Qv8ewh0
	 53OSqqP1jsaTw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so3106865a12.0
        for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 01:21:38 -0700 (PDT)
X-Gm-Message-State: AAQBX9fICs0iyxYw7y+DnQcaCHmsptXGSmoMGWIFIq6Y4R12fskqb0Mw
	u+3dvGCanc3LrO/ZNpaF8E6GGkLV6D9c5rhy+RE=
X-Google-Smtp-Source: AKy350YopyYiTPvdnzPIXwrQ0+FWi5yn72Z7uUZKakzQ3T/b+ltGYKTrB66bg1oD5qQjv0BbrKrUaLDCCwonerbqSr0=
X-Received: by 2002:aa7:cc12:0:b0:4fc:d331:515 with SMTP id
 q18-20020aa7cc12000000b004fcd3310515mr645108edt.5.1681978897102; Thu, 20 Apr
 2023 01:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230416060356.3711529-1-kernel@xen0n.name> <20230416060356.3711529-4-kernel@xen0n.name>
 <CAAhV-H4JmVq9y02gPxOCm6dFO+BS9=BLj_u276UdtEJ+DUHbUw@mail.gmail.com> <1fba4e9e-dd98-39d7-5ff9-027987551a88@xen0n.name>
In-Reply-To: <1fba4e9e-dd98-39d7-5ff9-027987551a88@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 20 Apr 2023 16:21:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6AjLh+-K4aprFL8KyTKvhFkJ-TbmJAN1KNxcnKqh-u3Q@mail.gmail.com>
Message-ID: <CAAhV-H6AjLh+-K4aprFL8KyTKvhFkJ-TbmJAN1KNxcnKqh-u3Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] LoongArch: Print GPRs with ABI names when
 showing registers
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 3:17=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 2023/4/19 14:49, Huacai Chen wrote:
> > On Sun, Apr 16, 2023 at 2:04=E2=80=AFPM WANG Xuerui <kernel@xen0n.name>=
 wrote:
> >>
> >> From: WANG Xuerui <git@xen0n.name>
> >>
> >> Print 3 registers per line to fit the entire line within 75 columns ev=
en
> >> with timestamp prefixed to each line, to ease future copy-pastes for a=
ll.
> >>
> >> And show the syscall restart flag (in place of the saved "$zero") if
> >> non-zero.
> >>
> >> Signed-off-by: WANG Xuerui <git@xen0n.name>
> >> ---
> >>   arch/loongarch/kernel/traps.c | 38 +++++++++++++++++++++++----------=
--
> >>   1 file changed, 25 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/tra=
ps.c
> >> index 2f4279f612e7..f61de72e0c3a 100644
> >> --- a/arch/loongarch/kernel/traps.c
> >> +++ b/arch/loongarch/kernel/traps.c
> >> @@ -158,22 +158,34 @@ static void __show_regs(const struct pt_regs *re=
gs)
> >>          const int field =3D 2 * sizeof(unsigned long);
> >>          unsigned int excsubcode;
> >>          unsigned int exccode;
> >> -       int i;
> >>
> >>          show_regs_print_info(KERN_DEFAULT);
> >>
> >> -       /*
> >> -        * Saved main processor registers
> >> -        */
> >> -       for (i =3D 0; i < 32; ) {
> >> -               if ((i % 4) =3D=3D 0)
> >> -                       printk("$%2d   :", i);
> >> -               pr_cont(" %0*lx", field, regs->regs[i]);
> >> -
> >> -               i++;
> >> -               if ((i % 4) =3D=3D 0)
> >> -                       pr_cont("\n");
> >> -       }
> >> +       /* Print most of the GPRs, 3 per row to fit output in 75 colum=
ns */
> > I prefer print 4 registers per line, including r0 (for alignment we
> > don't use zero).
> > e.g.,
> > r0(r0) .... r1(ra) .... r2(tp) .... r3(sp) ....
>
> I don't agree here. The rationale for 3 GPRs per row is clearly stated
> in the commit message and *this exact comment*. If we can somehow fit 4
> GPRs within 75 columns I'd be all for changing, but sadly we can't.
We don't need to be limited by 75 columns for the output, you know,
even the limit of 80 columns of code has been removed.

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
