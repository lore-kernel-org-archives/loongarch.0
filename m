Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E2C1110
	for <loongarch@lists.linux.dev>; Wed, 24 Aug 2022 10:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAD3C43141
	for <loongarch@lists.linux.dev>; Wed, 24 Aug 2022 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661335813;
	bh=G6PUNC1yHfS47YKEJZGI5+6sBFKntc7vGZXPfvBCAvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LL+lCMg5cpvXqZdf4dp2ZgfRKaC5aF1gQF//JgCwMIJ1YqpO1tIMyE6BMD/c38dpe
	 +4QdDNwbMmGoCpsEDsCIPRX4GzMXeYocATH2gjhXPaENQglIuRxy164XQEQEtDToAY
	 oNjX6Hq65/mUboyD+e8lOKwr8DD9Un4nVYMmacUB2vyD8Y8ejeh2W6KtrB3r5te5ME
	 bez/fwy/TgnSUJpSVaU5ei/2SUYvzl3mQClOYuHhLS2qzW4i7uQaZaPisT7Rh3XOR3
	 M+6b6r0cVkncTTBTZ+yfj6j+zytp+bkOJ3ir40YqOrrQ/0fIR2Nl8B2mZDwnVh7Xkv
	 LC1G3t84ouqVA==
Received: by mail-ej1-f51.google.com with SMTP id n7so14379750ejh.2
        for <loongarch@lists.linux.dev>; Wed, 24 Aug 2022 03:10:13 -0700 (PDT)
X-Gm-Message-State: ACgBeo2fBEYRGzO5FIkBgcHngz2MqusGP0hbtD33lkI9Pg8vmcKrRonx
	Sl+bLkWVUlOZNIKaQmyl6JEt4ElThvqr6GZuTSI=
X-Google-Smtp-Source: AA6agR4ZOia6keQhVlWSBGVlvkOEAhic9gslXn0/Ln1zK0RXhe9SfQLE1Ynoc8MVYGyh5zIW91gkxbxr0QG1buwuGxI=
X-Received: by 2002:a17:906:8a69:b0:73d:8e42:abf9 with SMTP id
 hy9-20020a1709068a6900b0073d8e42abf9mr2454882ejc.547.1661335811571; Wed, 24
 Aug 2022 03:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220820153506.607928-1-chenhuacai@loongson.cn>
In-Reply-To: <20220820153506.607928-1-chenhuacai@loongson.cn>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 24 Aug 2022 12:09:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Z2xR_Poiv4dTntpghWKES6Jk75jNiDy8q7_L8XfRyuQ@mail.gmail.com>
Message-ID: <CAK8P3a1Z2xR_Poiv4dTntpghWKES6Jk75jNiDy8q7_L8XfRyuQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix build warnings in VDSO
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 20, 2022 at 5:35 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> diff --git a/arch/loongarch/vdso/vgetcpu.c b/arch/loongarch/vdso/vgetcpu.c
> index 43a0078e4418..e02e775f5360 100644
> --- a/arch/loongarch/vdso/vgetcpu.c
> +++ b/arch/loongarch/vdso/vgetcpu.c
> @@ -24,6 +24,8 @@ static __always_inline const struct vdso_pcpu_data *get_pcpu_data(void)
>         return (struct vdso_pcpu_data *)(get_vdso_base() - VDSO_DATA_SIZE);
>  }
>
> +extern
> +int __vdso_getcpu(unsigned int *cpu, unsigned int *node, struct getcpu_cache *unused);
>  int __vdso_getcpu(unsigned int *cpu, unsigned int *node, struct getcpu_cache *unused)
>  {

I don't think that adding the declaration before the function is a
good workaround here,
that is likely to just trigger another warning about declarations in .c files.

I would add the declarations into a header file instead. If the
prototypes are the same
across architectures, this can be a global header that also avoids the
warnings elsewhere,
otherwise just keep it local to this directory.

      Arnd
