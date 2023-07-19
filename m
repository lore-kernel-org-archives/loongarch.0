Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4AD156CA
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 15:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941AAC433C9
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689779214;
	bh=kUIBro8VYIEkHE5j0/agoPvwIueb/Dl6A+asw1DqHtY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qqgFzyb1Q6LF7MPggU2bQnt2PduSRwyoWsnAyQPFnL7+kOVE2ZXPW1+VgUQ/m/WKN
	 pfvUpfs4lOq1epjUqEPn0//6r6xexKUXK6rWTNZHEQtmB4K4mrT8ZAwukM52j84l+s
	 AfF+vEDjKVEJmh8871y2yhiM8v1jASJ3EHrlLsi04qSb9k7YTGvRbo1jrhrB4MEoGK
	 b1QRl4gwEgmmW6ITAAAXk12wZki6qonYp5+D3kLxgy99FMoNMMdYYne0K+iRS8NZ9C
	 fdrEy7bXZrQ5Vj1XpWfo89EmiBvmQU/qrfmFtYWkvDjkoqce7gXpyHriwXSdgu3LQY
	 nwQG6OU/D7SSA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5216f44d881so7520288a12.1
        for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 08:06:54 -0700 (PDT)
X-Gm-Message-State: ABy/qLZvwGSMTX5Ywc8LGEBzl0OqUJoQZIzFANDG+Ce/u6efvuNyCJ//
	z5WS/2FtQGhlPGDLvgg1N3DVk/kvqO52ECz6XQk=
X-Google-Smtp-Source: APBJJlFIWF/JGtjaWiG8xG1Xidqf9LjssEXWxsrj4ORgGERwBC9Whsl8zR9B/GHY7ZNedscei3fl6EnpikXH+bdIBsA=
X-Received: by 2002:aa7:c1cc:0:b0:51e:ca0:8a2e with SMTP id
 d12-20020aa7c1cc000000b0051e0ca08a2emr2687589edp.36.1689779212858; Wed, 19
 Jul 2023 08:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719082732.2189747-1-lienze@kylinos.cn> <20230719082732.2189747-4-lienze@kylinos.cn>
 <CANpmjNOHL8EMP+E9w5wxMJ+PUbxYZh2DMaEocfHP1ATQn64+ng@mail.gmail.com>
In-Reply-To: <CANpmjNOHL8EMP+E9w5wxMJ+PUbxYZh2DMaEocfHP1ATQn64+ng@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Jul 2023 23:06:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Ca08Aj1y5HHUsUreOdBTQwVu=H+3nFOUjiUiq5aR76g@mail.gmail.com>
Message-ID: <CAAhV-H7Ca08Aj1y5HHUsUreOdBTQwVu=H+3nFOUjiUiq5aR76g@mail.gmail.com>
Subject: Re: [PATCH 3/4] KFENCE: Deferring the assignment of the local
 variable addr
To: Marco Elver <elver@google.com>
Cc: Enze Li <lienze@kylinos.cn>, kernel@xen0n.name, loongarch@lists.linux.dev, 
	glider@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Marco,

On Wed, Jul 19, 2023 at 6:55=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> On Wed, 19 Jul 2023 at 10:28, Enze Li <lienze@kylinos.cn> wrote:
> >
> > The LoongArch architecture is different from other architectures.
> > It needs to update __kfence_pool during arch_kfence_init_pool.
> >
> > This patch modifies the assignment location of the local variable addr
> > in the kfence_init_pool function to support the case of updating
> > __kfence_pool in arch_kfence_init_pool.
> >
> > Signed-off-by: Enze Li <lienze@kylinos.cn>
>
> I think it's fair to allow this use case.
>
> However, please make sure that when your arch_kfence_init_pool()
> fails, it is still possible to free the memblock allocated memory
> properly.
>
> Acked-by: Marco Elver <elver@google.com>
Does Acked-by means this patch can go through loongarch tree together
with other patches? If this patch should go through kfence tree, then
the others should wait for some time.

Huacai
>
> > ---
> >  mm/kfence/core.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> > index dad3c0eb70a0..e124ffff489f 100644
> > --- a/mm/kfence/core.c
> > +++ b/mm/kfence/core.c
> > @@ -566,13 +566,14 @@ static void rcu_guarded_free(struct rcu_head *h)
> >   */
> >  static unsigned long kfence_init_pool(void)
> >  {
> > -       unsigned long addr =3D (unsigned long)__kfence_pool;
> > +       unsigned long addr;
> >         struct page *pages;
> >         int i;
> >
> >         if (!arch_kfence_init_pool())
> > -               return addr;
> > +               return (unsigned long)__kfence_pool;
> >
> > +       addr =3D (unsigned long)__kfence_pool;
> >         pages =3D virt_to_page(__kfence_pool);
> >
> >         /*
> > --
> > 2.34.1
> >
