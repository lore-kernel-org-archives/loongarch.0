Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369CC23A4
	for <loongarch@lists.linux.dev>; Sat, 30 Jul 2022 06:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D862BC433D6
	for <loongarch@lists.linux.dev>; Sat, 30 Jul 2022 06:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659161715;
	bh=RHv7364h8RAOXghrt1coIfVoYhEmFs63PA0mfoezzCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UEeXBUJGAwW5LJP3dcW25l7pM+EqiUYakxP9UBATmxJICe7qlBAkJ4zUUQS2yZSrv
	 /PTre8UKjlffm2hkg+NTlzK3QhhKR8+9uM1kZaVYFt+lYcy9NysUB8CFXjQa79Unuo
	 IA57EthVRQq7ISSf14hiMdiyVlzo0RdeoDI2ERevq8w43vPPfrIpW186CQn/JrEKOR
	 WtKmeJXmhoEpEPGJA6YkuLRyfRpuX4TElM8Nkk9mHkF3fwLFRVH9a7aq583LWKlXt8
	 ZFqQZZVhSwZI2tONOgtY1o+wHx/yNiw8PX+oEI4iPVj0M3i4UvIJRGkAx0qfRb+Gi7
	 T3GCybmMia0iA==
Received: by mail-vk1-f182.google.com with SMTP id c12so151862vkn.13
        for <loongarch@lists.linux.dev>; Fri, 29 Jul 2022 23:15:15 -0700 (PDT)
X-Gm-Message-State: AJIora/YVVstqX+oyznaVX27Fbc3VjcR3h5MZROwxqE9LDo8sKWXilE3
	ep3h9kKE4Lnwb1XRThN8VWrUQr1GoiqmKoUIVlI=
X-Google-Smtp-Source: AGRyM1uPLeGWkU97cxykVCrWRZtBbraWV7ziZHlJYh+c6IqzKaMbvH4SpoLBUC6Jby/jXVKbdi5pCTRAx+JAIz7YljI=
X-Received: by 2002:a1f:9b90:0:b0:374:f09c:876f with SMTP id
 d138-20020a1f9b90000000b00374f09c876fmr2842092vke.12.1659161714812; Fri, 29
 Jul 2022 23:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <32a74a218c76611f897fd1df1ad0059068621133.camel@xry111.site>
 <ec52fd49-4a30-15d9-3d32-fd7bc6d8b3f0@loongson.cn> <0179679b736aea7258981dec2d83107cce74dfc1.camel@xry111.site>
 <a139a8475fe295ac9f17064269cd0312dca6f96e.camel@xry111.site>
 <6b5d2188f93ed72b67a4bbb7116113f833fe1ee5.camel@xry111.site>
 <d7670b60-2782-4642-995b-7baa01779a66@loongson.cn> <7cad6e78014168a8906e130e1cf3809077d2bda7.camel@xry111.site>
 <1d0783b87bda3e454a111862fcc5b5faffcb16b0.camel@xry111.site> <00eede4b1380888a500f74b1e818bb25a550632b.camel@xry111.site>
In-Reply-To: <00eede4b1380888a500f74b1e818bb25a550632b.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 30 Jul 2022 14:14:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7WxRp4u1iBs47LN1Sj3rDBdbLv1u7EpSt0Bt4QuhFSXQ@mail.gmail.com>
Message-ID: <CAAhV-H7WxRp4u1iBs47LN1Sj3rDBdbLv1u7EpSt0Bt4QuhFSXQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] LoongArch: Support new relocation types
To: Xi Ruoyao <xry111@xry111.site>
Cc: Youling Tang <tangyouling@loongson.cn>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jinyang He <hejinyang@loongson.cn>, Lulu Cheng <chenglulu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Sat, Jul 30, 2022 at 10:53 AM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Sat, 2022-07-30 at 10:24 +0800, Xi Ruoyao wrote:
> > On Sat, 2022-07-30 at 01:55 +0800, Xi Ruoyao wrote:
> > > On Fri, 2022-07-29 at 20:19 +0800, Youling Tang wrote:
> > >
> > > > On 07/29/2022 07:45 PM, Xi Ruoyao wrote:
> > > > > Hmm... The problem is the "addresses" of per-cpu symbols are
> > > > > faked: they
> > > > > are actually offsets from $r21.  So we can't just load such an
> > > > > offset
> > > > > with PCALA addressing.
> > > > >
> > > > > It looks like we'll need to introduce an attribute for GCC to
> > > > > make
> > > > > an
> > > > > variable "must be addressed via GOT", and add the attribute into
> > > > > PER_CPU_ATTRIBUTES.
> > >
> > > > Yes, we need a GCC attribute to specify the per-cpu variable.
> > >
> > > GCC patch adding "addr_global" attribute for LoongArch:
> > > https://gcc.gnu.org/pipermail/gcc-patches/2022-July/599064.html
> > >
> > > An experiment to use it:
> > > https://github.com/xry111/linux/commit/c1d5d70
> >
> > Correction: https://github.com/xry111/linux/commit/c1d5d708
> >
> > It seems 7-bit SHA is not enough for kernel repo.
>
> If addr_global is rejected or not implemented (for example, building the
> kernel with GCC 12), *I expect* the following hack to work (I've not
> tested it because I'm AFK now).  Using visibility in kernel seems
> strange, but I think it may make some sense because the modules are some
> sort of similar to an ELF shared object being dlopen()'ed, and our way
> to inject per-CPU symbols is analog to ELF interposition.
Sadly, I don't know what visibility is, does it have something to do
with __visible in include/linux/compiler_attributes.h?

Huacai
>
> arch/loongarch/include/asm/percpu.h:
>
>    #if !__has_attribute(__addr_global__) && defined(MODULE)
>    /* Magically remove "static" for per-CPU variables.  */
>    # define ARCH_NEEDS_WEAK_PER_CPU
>    /* Force GOT-relocation for per-CPU variables.  */
>    # define PER_CPU_ATTRIBUTES __attribute__((__visibility__("default")))
>    #endif
>
> arch/loongarch/Makefile:
>
>    # Hack for per-CPU variables, see PER_CPU_ATTRIBUTES in
>    # include/asm/percpu.h
>    if (call gcc-does-not-support-addr-global)
>      KBUILD_CFLAGS_MODULE += -fPIC -fvisibility=hidden
>    endif
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
>
