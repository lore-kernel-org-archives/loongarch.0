Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD568F7C
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 07:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E04C433C8
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690271155;
	bh=u2Ib2q+xk6FkAYZSHHu2M1mth/rmXUEtcCpK5STMStg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JIOOxeLKy6vZBQm3LC+erkiN719t+zoQCV+gXVkynadNXULF2F/s50VVTAxNoJK3s
	 NLQTtp5GRH1zhXjYi7F05FPQ+HSkwX3WsLrgF6xV3OESeQrNHkiFs3mSW2lhCxRyXG
	 VVDvSvOkPu+XbHEr3A5GkmtuZaO8BZavS4wpv51ymOqV+d15tB0m7GStaYdz2V0D2c
	 f+g23dVJg3l32lw5LdivO7cbFe8qtupqkYMNDvSgYhUKAp7pllcfuQGNXRMq0tFX/Y
	 hegaXplPrwEHgpaU8jL1cCm1jX/s5anC4jcLUE6tSo0UlKgk9NGbM35gaLvvVD+BrU
	 EqJKcCcYt+8PA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so175058a12.3
        for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 00:45:55 -0700 (PDT)
X-Gm-Message-State: ABy/qLbi0zZbBJoFgJt80q2E20DZklG42R1OLzBelqbeVMjYA5PC0Rim
	lvsxxfV7MeMRmBKZtZiRjebeYdaFX2iLvJBbsPA=
X-Google-Smtp-Source: APBJJlHq8W0Fb/nKDtR6sWbkKiD8lnNoP7SKahPjwfMJfWgOhgIpYjMg/dkZNMrI2DGrq2jP3F28bBfyBEuuseCLwBA=
X-Received: by 2002:a17:906:76d8:b0:99b:8c6f:f3ab with SMTP id
 q24-20020a17090676d800b0099b8c6ff3abmr6993697ejn.13.1690271153978; Tue, 25
 Jul 2023 00:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230725061451.1231480-1-lienze@kylinos.cn> <20230725061451.1231480-4-lienze@kylinos.cn>
In-Reply-To: <20230725061451.1231480-4-lienze@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Jul 2023 15:45:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6HzN63ccAR0mYpmJ4kV81REO+yk2h56Psic0==iMuMZg@mail.gmail.com>
Message-ID: <CAAhV-H6HzN63ccAR0mYpmJ4kV81REO+yk2h56Psic0==iMuMZg@mail.gmail.com>
Subject: Re: [PATCH 3/4 v2] KFENCE: Defer the assignment of the local variable addr
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

This patch is a preparation for LoongArch KFENCE support, so it is
better to move to the first patch.

Huacai

On Tue, Jul 25, 2023 at 2:15=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>
> The LoongArch architecture is different from other architectures.
> It needs to update __kfence_pool during arch_kfence_init_pool().
>
> This patch modifies the assignment location of the local variable addr
> in the kfence_init_pool function to support the case of updating
> __kfence_pool in arch_kfence_init_pool().
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> Acked-by: Marco Elver <elver@google.com>
> ---
>  mm/kfence/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index dad3c0eb70a0..e124ffff489f 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -566,13 +566,14 @@ static void rcu_guarded_free(struct rcu_head *h)
>   */
>  static unsigned long kfence_init_pool(void)
>  {
> -       unsigned long addr =3D (unsigned long)__kfence_pool;
> +       unsigned long addr;
>         struct page *pages;
>         int i;
>
>         if (!arch_kfence_init_pool())
> -               return addr;
> +               return (unsigned long)__kfence_pool;
>
> +       addr =3D (unsigned long)__kfence_pool;
>         pages =3D virt_to_page(__kfence_pool);
>
>         /*
> --
> 2.34.1
>
>
