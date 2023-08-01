Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5321E531
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 10:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26190C433CC
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690886999;
	bh=u7I+zdXZxktdq8ChnbQrPRnPNrQrNqrJr3UZE+w6xVM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YEg8q8AGO7PDRDEJdoUZsaCFcZLFriVWXApTzTAVI4en+f56NOAPhRiRI7jyTg0oh
	 igyeJjI16GfahMSl5ri8osu7DEK1txIPZvIydHfEZ32Ot7cU5t61U9sUUMmx4q2/xc
	 NCH1wbq346XELm23p2LOi8eUTU2+pYpIR6sfDC7Dau3fapXStyv4X7dUoxb2zMygXt
	 eIxvk7ChiKlKyCSRqEdOXXN8OtcGoI3EiMwRUI3REjYEhGwTTcfaL+VlqW4fyDeDvX
	 DfT6aj3Nf0MT+a8JR9Op4KlXpHdOdkzXYI9hqZmmgkQoDFAYJMvsm6SgrtAirccr5V
	 mwZZ9x1VBMiBw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-522ab301692so5429546a12.2
        for <loongarch@lists.linux.dev>; Tue, 01 Aug 2023 03:49:59 -0700 (PDT)
X-Gm-Message-State: ABy/qLboxzTBw5izicEBcJcP62/VPSkUwq/r+emH5V9lQQwIN6HGskkc
	rHtF+OhtKzMvsOocdcA13+D9Rv6if+k8wLAPu7A=
X-Google-Smtp-Source: APBJJlGmfOzudB4zLRHM997HtkvDTsRmGasa+lA5ovwZauli5GP+7Ze4kTI2UNbtuJnb5revLg7J6IglOClWqNcHT40=
X-Received: by 2002:aa7:d507:0:b0:522:3a28:feca with SMTP id
 y7-20020aa7d507000000b005223a28fecamr2581715edq.24.1690886997423; Tue, 01 Aug
 2023 03:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801011554.3950435-1-guoren@kernel.org> <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
 <CAJF2gTRa5erHomJzLgUFO4SGqd5zSDwn6r3WN7kM8aWpv1vesg@mail.gmail.com>
 <CAJF2gTQ1hV1vipAo3H4X4WiPO84kVVFZcdGq7u4f0bVTry_akQ@mail.gmail.com> <CAHirt9gVqE=9vviJEY=kY=booVRmFPHrnFsKCXPXnXiWTB8bZQ@mail.gmail.com>
In-Reply-To: <CAHirt9gVqE=9vviJEY=kY=booVRmFPHrnFsKCXPXnXiWTB8bZQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Aug 2023 18:49:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2ON33wc87iV564rkDbNiE56h_t0kzKKXdJtGqgJ1sOQ@mail.gmail.com>
Message-ID: <CAJF2gTR2ON33wc87iV564rkDbNiE56h_t0kzKKXdJtGqgJ1sOQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fixup cmpxchg sematic for memory barrier
To: WANG Rui <wangrui@loongson.cn>
Cc: chenhuacai@kernel.or, kernel@xen0n.name, arnd@arndb.de, 
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com, peterz@infradead.org, 
	will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 5:32=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wrote=
:
>
> Hello,
>
> On Tue, Aug 1, 2023 at 5:05=E2=80=AFPM Guo Ren <guoren@kernel.org> wrote:
> >
> > > The CoRR problem would cause wider problems than this.For this case,
> > > do you mean your LL -> LL would be reordered?
> > >
> > > CPU 0
> > >           CPU1
> > > LL(2) (set ex-monitor)
> > >
> > >                 store (break the ex-monitor)
> > > LL(1) (reordered instruction set ex-monitor
> > > SC(3) (successes ?)
> > Sorry for the mail client reformat, I mean:
> >
> > CPU0  LL(2) (set ex-monitor)
> > CPU1  STORE (break the ex-monitor)
> > CPU0  LL(1) (reordered instruction set ex-monitor
> > CPU0  SC(3) (success?)
>
> No. LL and LL won't reorder because LL implies a memory barrier(though
> not acquire semantics).
That means we could remove __WEAK_LLSC_MB totally, right?

>
> Regards,
> --
> WANG Rui
>


--=20
Best Regards
 Guo Ren
