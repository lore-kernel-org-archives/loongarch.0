Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895291F93D
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 09:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E69C433D9
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 09:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690880749;
	bh=ahFDZkG3uB6gt5CXk13eA4lfV0UiHUFqChNpbvLIrZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L9Gz8w1Y8zXgHls4hV9dnWrTg6XbW620mjJn1nYcUdu09Blf/K/IHj+85KJ6mqviJ
	 P69WzDeCdaaVwLmh87f4EpDj6Um2vREBh6nwX6FHlOT75F1Tb6j6m+8tuDfN2uZInU
	 JM+0EcwPO/gkDMuy2BT2gxrWNuPhGkqSSBpkGgD67zvdEi065neRqQEvpZ/gunH83D
	 IwcDnwOS5bEE4IofrFQrG0+YbGzRpujvvhQ4WqFtAzQVrbPqbt650d8UXQn0AEGxpV
	 03gRdwMrmsN9b0+sHOhnYj213Z3xn/HRszJ8v0zg/2nNcWMwJazzbF7oVw2BnwK410
	 KjuFYBdcOxwIg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe457ec6e7so645374e87.3
        for <loongarch@lists.linux.dev>; Tue, 01 Aug 2023 02:05:49 -0700 (PDT)
X-Gm-Message-State: ABy/qLY6vWRgI1x56MLEyh8Fv8Hxw+CxSlIBm6Y7qOsk1W51P+GSih8g
	KNIFH6qvi/sYy8H1vcB4zMhSK+JmG+1dJQJXL6g=
X-Google-Smtp-Source: APBJJlFyL5Rr/t9XHuQAHtfsKRciAKpYSXbhhNkZ/pZqJ6eT33e8g+/B+VjFpim1Hv2h0TXC0heRePu62xBWVFYPvyw=
X-Received: by 2002:a19:6908:0:b0:4f8:4512:c846 with SMTP id
 e8-20020a196908000000b004f84512c846mr1443298lfc.49.1690880747644; Tue, 01 Aug
 2023 02:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801011554.3950435-1-guoren@kernel.org> <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
 <CAJF2gTRa5erHomJzLgUFO4SGqd5zSDwn6r3WN7kM8aWpv1vesg@mail.gmail.com>
In-Reply-To: <CAJF2gTRa5erHomJzLgUFO4SGqd5zSDwn6r3WN7kM8aWpv1vesg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Aug 2023 17:05:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ1hV1vipAo3H4X4WiPO84kVVFZcdGq7u4f0bVTry_akQ@mail.gmail.com>
Message-ID: <CAJF2gTQ1hV1vipAo3H4X4WiPO84kVVFZcdGq7u4f0bVTry_akQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fixup cmpxchg sematic for memory barrier
To: WANG Rui <wangrui@loongson.cn>
Cc: chenhuacai@kernel.or, kernel@xen0n.name, arnd@arndb.de, 
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com, peterz@infradead.org, 
	will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 5:02=E2=80=AFPM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Aug 1, 2023 at 10:29=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wr=
ote:
> >
> > Hello,
> >
> > On Tue, Aug 1, 2023 at 9:16=E2=80=AFAM <guoren@kernel.org> wrote:
> > > diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/in=
clude/asm/cmpxchg.h
> > > index 979fde61bba8..6a05b92814b6 100644
> > > --- a/arch/loongarch/include/asm/cmpxchg.h
> > > +++ b/arch/loongarch/include/asm/cmpxchg.h
> > > @@ -102,8 +102,8 @@ __arch_xchg(volatile void *ptr, unsigned long x, =
int size)
> > >         "       move    $t0, %z4                        \n"          =
   \
> > >         "       " st "  $t0, %1                         \n"          =
   \
> > >         "       beqz    $t0, 1b                         \n"          =
   \
> > > -       "2:                                             \n"          =
   \
> > >         __WEAK_LLSC_MB                                               =
   \
> > > +       "2:                                             \n"          =
   \
> >
> > Thanks for the patch.
> >
> > This would look pretty good if it weren't for the special memory
> > barrier semantics of the LoongArch's LL and SC instructions.
> >
> > The LL/SC memory barrier behavior of LoongArch:
> >
> > * LL: <memory-barrier> + <load-exclusive>
> > * SC: <store-conditional> + <memory-barrier>
> >
> > and the LoongArch's weak memory model allows load/load reorder for the
> > same address.
> The CoRR problem would cause wider problems than this.For this case,
> do you mean your LL -> LL would be reordered?
>
> CPU 0
>           CPU1
> LL(2) (set ex-monitor)
>
>                 store (break the ex-monitor)
> LL(1) (reordered instruction set ex-monitor
> SC(3) (successes ?)
Sorry for the mail client reformat, I mean:

CPU0  LL(2) (set ex-monitor)
CPU1  STORE (break the ex-monitor)
CPU0  LL(1) (reordered instruction set ex-monitor
CPU0  SC(3) (success?)

>
> >
> > So, the __WEAK_LLSC_MB[1] is used to prevent load/load reorder and no
> > explicit barrier instruction is required after SC.
> >
> > [1] https://lore.kernel.org/loongarch/20230516124536.535343-1-chenhuaca=
i@loongson.cn/
> >
> > Regards,
> > --
> > WANG Rui
> >
>
>
> --
> Best Regards
>  Guo Ren



--=20
Best Regards
 Guo Ren
