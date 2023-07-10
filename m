Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE0C210C
	for <loongarch@lists.linux.dev>; Mon, 10 Jul 2023 05:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63410C433C9
	for <loongarch@lists.linux.dev>; Mon, 10 Jul 2023 05:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688965295;
	bh=hIQ/sg02GFBnzX1+ASxA+DzxH1Q7XpDP1DHHVadqzVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OU6WT/nmkF0xVZpwzeynXEPdiEXvp1jRykp6qezpi4pzCBBSnmwN7rSXqOC9a9vwr
	 e9wvJdvvIMAVk/67DF83HUI3ZlJLsi8ZwpuPVY/XSC+rw/9V6w49CHKv7ytfyg8J2r
	 PCXlUKKDwOlysIbvIWzVv7OZi+A94pangwNKoD6Xy6DiFUM19quvFsoqPgLfNf1XWh
	 JdBmjaZ1Q1GfPe8rrz7crAi+1fAN491/vGXZCVBHPTu0EPgkoeyT8kMvGtdjUde0bR
	 KVxaeFJ/Q/cRmWuD0n8uKUcYEIXcONezt0aL2lrIEvr3+YQ+k0YZGgEJJFloJoVJ4H
	 cMtYtmVetZFOg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so5653264a12.1
        for <loongarch@lists.linux.dev>; Sun, 09 Jul 2023 22:01:35 -0700 (PDT)
X-Gm-Message-State: ABy/qLblFyhw6Sp5jAf4ii0l1toxOCiadRZPbHJ+vSPyZz2Hi2jkmbSL
	+SePuBG5Ov+HkFXbKKIXwKu+uyDkN8bK0HAEQss=
X-Google-Smtp-Source: APBJJlF+4I+G7utuLWVS5lbi6CtAFHjK+Y1xhwackTMfiYlKNeyUhIcWsEyB5b00uUlr6oVeTR90rHmEZi31wQbPaa4=
X-Received: by 2002:a05:6402:1b0b:b0:51d:9b4d:66bd with SMTP id
 by11-20020a0564021b0b00b0051d9b4d66bdmr10171546edb.9.1688965293643; Sun, 09
 Jul 2023 22:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230710042924.2518198-1-chenhuacai@loongson.cn> <51181fd7-fc1f-2222-9b8a-8ce44fe85ea5@xen0n.name>
In-Reply-To: <51181fd7-fc1f-2222-9b8a-8ce44fe85ea5@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 10 Jul 2023 13:01:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5MW+X17H9vj4jCp5eLcyFdQm4O1jVrSVOfRc64uE=08g@mail.gmail.com>
Message-ID: <CAAhV-H5MW+X17H9vj4jCp5eLcyFdQm4O1jVrSVOfRc64uE=08g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix module relocation error with binutils 2.41
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 12:45=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wr=
ote:
>
> On 2023/7/10 12:29, Huacai Chen wrote:
> > Binutils 2.41 enable linker relaxation by default, but kernel module
>
> "enables" / "will enable"
>
> > loader doesn't support that, so disable it. Otherwise we get such an
> > error when loading modules: "Unknown relocation type 102".
>
> IMO it could be better to also justify the disabling (instead of adding
> proper support): linker relaxation is relatively large complexity that
> may or may not bring a similar gain, and we don't really want to include
> this linker pass in the kernel.
OK, thanks.

Huacai
>
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/Makefile | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> > index 09ba338a64de..7466d3b15db8 100644
> > --- a/arch/loongarch/Makefile
> > +++ b/arch/loongarch/Makefile
> > @@ -68,6 +68,8 @@ LDFLAGS_vmlinux                     +=3D -static -n -=
nostdlib
> >   ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
> >   cflags-y                    +=3D $(call cc-option,-mexplicit-relocs)
> >   KBUILD_CFLAGS_KERNEL                +=3D $(call cc-option,-mdirect-ex=
tern-access)
> > +KBUILD_AFLAGS_MODULE         +=3D $(call cc-option,-mno-relax) $(call =
cc-option,-Wa$(comma)-mno-relax)
> > +KBUILD_CFLAGS_MODULE         +=3D $(call cc-option,-mno-relax) $(call =
cc-option,-Wa$(comma)-mno-relax)
> >   else
> >   cflags-y                    +=3D $(call cc-option,-mno-explicit-reloc=
s)
> >   KBUILD_AFLAGS_KERNEL                +=3D -Wa,-mla-global-with-pcrel
>
> The code changes are good. With the commit message improved:
>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
>
