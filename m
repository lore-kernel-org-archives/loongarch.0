Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE1AEA8
	for <loongarch@lists.linux.dev>; Wed, 27 Sep 2023 00:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF04C433C8
	for <loongarch@lists.linux.dev>; Wed, 27 Sep 2023 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695775539;
	bh=2czlUODplVLqlPwrGiCVrixmp6cbiBPmEv+rpDMNXbE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gNE3/ylOvhRAAoz/vsvv9pN5ZobXtP1piV0MjWp1L0UZj699jNMZbSqPNIug9aveo
	 EXIR25LqshXk+WtroxcOWzrX8sHUzX+k3t/iTkQb+0n4hSJqcQBpyIvyXfu9I/C4qo
	 9Zcm00JBw0DvFNlOAz8fWYvCC6GGgCZEazaYZbI4zHTzyIbKvT4Zq2Gka+8StvxJbm
	 v29idUfwAetZBi/R+2RCOPbQnmrZa09PJdhkBCs59xhijWkwu3iPnjtNfdBBwFsRss
	 5a1oyOE+sSaJlNVxR/r5r6JsojfIp8MQYqDhtGqcBdm7bx+thdBaWvs1SwDfT2zeNm
	 JIGs47bCHE4wA==
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so102113745e9.2
        for <loongarch@lists.linux.dev>; Tue, 26 Sep 2023 17:45:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YxGUua+dXNlb57iz0wtQ/18HogFLhe3FzTe2FsapBsyFewEabbR
	hAhmqOxyTIfQhhZtWOyfsDijG56dZ4o1bGhikDk=
X-Google-Smtp-Source: AGHT+IH7TiTSw495lHvxkQDLdhAGLVNGCEfgqX0IVQetkEk4oU2/PQH5vwKZCIneHOZYWfI/8AGboWlwslKgZwyqJJY=
X-Received: by 2002:adf:ecce:0:b0:31f:98b4:4b62 with SMTP id
 s14-20020adfecce000000b0031f98b44b62mr229081wro.37.1695775537680; Tue, 26 Sep
 2023 17:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230926121031.1901760-1-chenhuacai@loongson.cn> <4abf8ddb-ff93-436f-a834-39e7f4d7a503@xen0n.name>
In-Reply-To: <4abf8ddb-ff93-436f-a834-39e7f4d7a503@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 27 Sep 2023 08:45:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5z5a45PobUQ5xU3rP6bqenoqtuuceX2=ijYhTN6a_vqg@mail.gmail.com>
Message-ID: <CAAhV-H5z5a45PobUQ5xU3rP6bqenoqtuuceX2=ijYhTN6a_vqg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: numa: Fix high_memory calculation
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn, 
	stable@vger.kernel.org, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 11:26=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wr=
ote:
>
> On 9/26/23 20:10, Huacai Chen wrote:
> > high_memory is the virtual address of the 'highest physical address' in
> > the system. But __va(get_num_physpages() << PAGE_SHIFT) is not what we
> > want because there may be holes in the physical address space. On the
> > other hand, max_low_pfn is calculated from memblock_end_of_DRAM(), whic=
h
> > is exactly corresponding to the highest physical address, so use it for
> > high_memory calculation.
> >
> > Cc: <stable@vger.kernel.org>
> Which commit is this patch intended to amend? A "Fixes:" tag may be
> helpful for stable backporting.
OK, I will add a Fixes: tag.

Huacai

> > Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/kernel/numa.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.=
c
> > index c7d33c489e04..6e65ff12d5c7 100644
> > --- a/arch/loongarch/kernel/numa.c
> > +++ b/arch/loongarch/kernel/numa.c
> > @@ -436,7 +436,7 @@ void __init paging_init(void)
> >
> >   void __init mem_init(void)
> >   {
> > -     high_memory =3D (void *) __va(get_num_physpages() << PAGE_SHIFT);
> > +     high_memory =3D (void *) __va(max_low_pfn << PAGE_SHIFT);
> >       memblock_free_all();
> >   }
> >
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
