Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664D428E8
	for <loongarch@lists.linux.dev>; Sun,  4 Sep 2022 12:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31515C433D6
	for <loongarch@lists.linux.dev>; Sun,  4 Sep 2022 12:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662293534;
	bh=bYlOQ+oznEYSMgYdAFC3p4z/L5HIm6vFaZHKk80eJDE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ey1Mprimt9ZJAqPmkd3q9gGWCpJ3cL+sEdivcWOq+Tb+4F/fwaXYglnO+mlR4/ief
	 5xDtD9WsNAac7eTLrIAE4kyIXHQijh6oKjoJWgMBTXdc28c/YJCwkHHhNAhROuhUgI
	 Iei+WxkYs/cwUUZHBnksYIziS4JXJtpd9NR3+hCu7aC+Z2Oej1rT9lWbcmC9dOFOaE
	 PQoCCopLaccX4Zj/geviwKIh35rI2qebsVhgaiRuJot34WjGaO4VTBI2dB30U0AK9c
	 ZQBNoc2RcLsw90/GhZ5oz8BGj7CAFf0xh3C16YZdsALs62q6ySOtEB9Q3RMyaj+ztC
	 jIAgfpfFVQ2tQ==
Received: by mail-ua1-f46.google.com with SMTP id q21so2413767uam.13
        for <loongarch@lists.linux.dev>; Sun, 04 Sep 2022 05:12:14 -0700 (PDT)
X-Gm-Message-State: ACgBeo3fqsemvy8XVLviCA59kvVQMEFzzYa/kxNuK7F+RbhZKF6u8YbA
	jpxi8n9gL/311A02f3Eed9iGpgUMTIx4zpTjUV4=
X-Google-Smtp-Source: AA6agR42lQq7ZWXBjF8r7BmXSYzuWcDRPqbp2Q/KMnQF1bRLALDcwFBirb/6EagY69gm5TNtQLU7yEImdLE/DLenO6g=
X-Received: by 2002:ab0:25d3:0:b0:3ae:6580:2adc with SMTP id
 y19-20020ab025d3000000b003ae65802adcmr681840uan.23.1662293533162; Sun, 04 Sep
 2022 05:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220831054017.382749-1-liyupeng@zbhlos.com>
In-Reply-To: <20220831054017.382749-1-liyupeng@zbhlos.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 4 Sep 2022 20:12:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6p44E8KuQZz31jX+Yd0qgvqGRaR2vfwdTZLBxg6bKeFQ@mail.gmail.com>
Message-ID: <CAAhV-H6p44E8KuQZz31jX+Yd0qgvqGRaR2vfwdTZLBxg6bKeFQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] LoongArch: Fixed arch_remove_memory undefined build error.
To: Yupeng Li <liyupeng@zbhlos.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	Caicai <caizp2008@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied to loongarch-fixes, thanks.

Huacai

On Wed, Aug 31, 2022 at 1:49 PM Yupeng Li <liyupeng@zbhlos.com> wrote:
>
> The kernel build error when unslected CONFIG_MEMORY_HOTREMOVE, the
> arch_remove_memory in mm/memory_hotplug.c was undefined.
> Removed CONFIG_MEMORY_HOTREMOVE requirement refer to the definitions
> of other platform architectures.Some build error messages like:
>
>  LD      vmlinux.o
>  MODPOST vmlinux.symvers
>  MODINFO modules.builtin.modinfo
>  GEN     modules.builtin
>  LD      .tmp_vmlinux.kallsyms1
> loongarch64-linux-gnu-ld: mm/memory_hotplug.o: in function `.L242':
> memory_hotplug.c:(.ref.text+0x930): undefined reference to `arch_remove_m=
emory'
> make: *** [Makefile:1169=EF=BC=9Avmlinux] =E9=94=99=E8=AF=AF 1
>
> Signed-off-by: Yupeng Li <liyupeng@zbhlos.com>
> Signed-off-by: Caicai <caizp2008@163.com>
> ---
>  arch/loongarch/mm/init.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index 7094a68c9b83..191ed8e47895 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -142,7 +142,6 @@ int memory_add_physaddr_to_nid(u64 start)
>  EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
>  #endif
>
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  {
>         unsigned long start_pfn =3D start >> PAGE_SHIFT;
> @@ -155,7 +154,6 @@ void arch_remove_memory(u64 start, u64 size, struct v=
mem_altmap *altmap)
>         __remove_pages(start_pfn, nr_pages, altmap);
>  }
>  #endif
> -#endif
>
>  /*
>   * Align swapper_pg_dir in to 64K, allows its address to be loaded
> --
> 2.34.1
>
>
