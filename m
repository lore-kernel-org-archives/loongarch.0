Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19FD1F93D
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 09:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C2EC43395
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690880564;
	bh=yysbtRG74SbIc4kvWFf/yt8D0zmK33jlQSMHNhB2wik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A0GTM2AE72dpcUqSmcfOwmGqe8VJbA+nJCh8Adx7EpCoKBq5AetFc/Y2oOegRt7FQ
	 byGONZNnIeHQ06SZWqYVbslVRMZkBnu1S3RfOl3IOvTQqyz0hS4sorNQb9jmEgUwFv
	 ysQ4uJg6kSV0mI8JbdNKcczUURS/8Gzlx8RBPwAGbquAGl8pW2LpLMSDxZPHlTO/gX
	 2DfmVQDF7v+QHy1L2O4cz2nhYQHDLjxoQN2ytinUmIgp2z8aAmf9SPyKeN/sAS0m/D
	 pYSlS0rDRzMuPZ3YLpZ5FjOMLGLXdyTWyXHJkjARFwP3MlHkVNSbTQUABOTs/JQfpc
	 68W8gJv/t9pDw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99bccc9ec02so840053866b.2
        for <loongarch@lists.linux.dev>; Tue, 01 Aug 2023 02:02:44 -0700 (PDT)
X-Gm-Message-State: ABy/qLbLeL6qFBtLFqYcUUaMqxkZiED3d2e5/jYS6umEZmcgL+9bUoqH
	/T1Kuyf8jrsfXyC89VyHrlagiVPXmhloasfKRWg=
X-Google-Smtp-Source: APBJJlGGoZMkogmrxXd1aBmttUxLJ/2UiVvuEB9yAaC63nVShKvzX5/bPnSIX9IEOeKpxZKzoFs4j8M6v5I9QPSsris=
X-Received: by 2002:a17:907:2718:b0:99b:415f:2e4f with SMTP id
 w24-20020a170907271800b0099b415f2e4fmr1895566ejk.57.1690880562621; Tue, 01
 Aug 2023 02:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801011554.3950435-1-guoren@kernel.org> <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
In-Reply-To: <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Aug 2023 17:02:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRa5erHomJzLgUFO4SGqd5zSDwn6r3WN7kM8aWpv1vesg@mail.gmail.com>
Message-ID: <CAJF2gTRa5erHomJzLgUFO4SGqd5zSDwn6r3WN7kM8aWpv1vesg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fixup cmpxchg sematic for memory barrier
To: WANG Rui <wangrui@loongson.cn>
Cc: chenhuacai@kernel.or, kernel@xen0n.name, arnd@arndb.de, 
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com, peterz@infradead.org, 
	will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 10:29=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> Hello,
>
> On Tue, Aug 1, 2023 at 9:16=E2=80=AFAM <guoren@kernel.org> wrote:
> > diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/incl=
ude/asm/cmpxchg.h
> > index 979fde61bba8..6a05b92814b6 100644
> > --- a/arch/loongarch/include/asm/cmpxchg.h
> > +++ b/arch/loongarch/include/asm/cmpxchg.h
> > @@ -102,8 +102,8 @@ __arch_xchg(volatile void *ptr, unsigned long x, in=
t size)
> >         "       move    $t0, %z4                        \n"            =
 \
> >         "       " st "  $t0, %1                         \n"            =
 \
> >         "       beqz    $t0, 1b                         \n"            =
 \
> > -       "2:                                             \n"            =
 \
> >         __WEAK_LLSC_MB                                                 =
 \
> > +       "2:                                             \n"            =
 \
>
> Thanks for the patch.
>
> This would look pretty good if it weren't for the special memory
> barrier semantics of the LoongArch's LL and SC instructions.
>
> The LL/SC memory barrier behavior of LoongArch:
>
> * LL: <memory-barrier> + <load-exclusive>
> * SC: <store-conditional> + <memory-barrier>
>
> and the LoongArch's weak memory model allows load/load reorder for the
> same address.
The CoRR problem would cause wider problems than this.For this case,
do you mean your LL -> LL would be reordered?

CPU 0
          CPU1
LL(2) (set ex-monitor)

                store (break the ex-monitor)
LL(1) (reordered instruction set ex-monitor
SC(3) (successed ?)

>
> So, the __WEAK_LLSC_MB[1] is used to prevent load/load reorder and no
> explicit barrier instruction is required after SC.
>
> [1] https://lore.kernel.org/loongarch/20230516124536.535343-1-chenhuacai@=
loongson.cn/
>
> Regards,
> --
> WANG Rui
>


--=20
Best Regards
 Guo Ren
