Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490CD7C
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 02:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03212C433A0
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 02:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675390135;
	bh=9SFVMDLXP6rCxw0koy5AsHtvGYm4KS5eagd3gakC66Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TG9KSfLg6Fu47hf2AXjQb32PBlMSIL+BaQG1O46FeqOYDz4PBBGz66UJqv8GbS5bQ
	 gP5NunfWKdyCQUJ7OhSs5ixN5uNiV8NNuGYxlHXR3M5BjkssA4RtyevTajBk9UNVkY
	 4w0NEixBuDFsaYLO88UtJa1dVZcglfCiWg6xxkmmCYdZVPQrePegFkHmMvkjgAZiYO
	 A/j+vc8cUjeMMGXUXV5/C9fTa4tvpnIjsTh6RbNV8hn/D3k+NAFPk/NCUoCQY8pnJ/
	 RvfaxTonSqWo2ktg9AMFD7LuTy96auFxGTvr3yUP/jzRWbdNF1zQArO1T/OTE2GFK0
	 LPv+vCtLxgW8Q==
Received: by mail-ej1-f49.google.com with SMTP id ml19so11706838ejb.0
        for <loongarch@lists.linux.dev>; Thu, 02 Feb 2023 18:08:54 -0800 (PST)
X-Gm-Message-State: AO0yUKXTfh8P8hAjoemKpINxj8a85cfkXXFOTmi0rWzCO2wLP6eFIvWp
	ftcLz2jeUzannmVt6hiAZl92pfK+teM0EdkyLgA=
X-Google-Smtp-Source: AK7set/ydpY+oP3Z+t+NArVdALXiqzOsn4rcGlM7loxkZ8n+4hJG8dOtM1ETH3IvToN2WCewRC5xSUJ3FVILiorZwGg=
X-Received: by 2002:a17:906:338d:b0:879:b98d:eb0b with SMTP id
 v13-20020a170906338d00b00879b98deb0bmr2023573eja.88.1675390133191; Thu, 02
 Feb 2023 18:08:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230202084238.2408516-1-chenhuacai@loongson.cn> <ccf74ebd-ccc1-4de5-a425-dcde4ac39a8d@app.fastmail.com>
In-Reply-To: <ccf74ebd-ccc1-4de5-a425-dcde4ac39a8d@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 3 Feb 2023 10:08:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6kuzfjw5i8-6L_68c50nsXzFipHY5hxtbShuv16bqRbg@mail.gmail.com>
Message-ID: <CAAhV-H6kuzfjw5i8-6L_68c50nsXzFipHY5hxtbShuv16bqRbg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Make -mstrict-align be configurable
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	guoren <guoren@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Arnd,

On Thu, Feb 2, 2023 at 5:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 2, 2023, at 09:42, Huacai Chen wrote:
> > Introduce Kconfig option ARCH_STRICT_ALIGN to make -mstrict-align be
> > configurable.
> >
> > Not all LoongArch cores support h/w unaligned access, we can use the
> > -mstrict-align build parameter to prevent unaligned accesses.
> >
> > This option is disabled by default to optimise for performance, but you
> > can enabled it manually if you want to run kernel on systems without h/w
> > unaligned access support.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> This feels like it's a way too low-level option, I would not expect
> users to be able to answer this correctly.
>
> What I would do instead is to have Kconfig options for specific
> CPU implementations and derive the alignment requirements from
> that.
You mean provide something like CONFIG_CPU_XXXX as MIPS do?  That
seems not a good idea, too. If there are more than 3 CONFIG_CPU_XXXX,
the complexity is more than CONFIG_ARCH_STRICT_ALIGN. Then users are
also unable to do a correct selection. On the other hand, we can add
more words under CONFIG_ARCH_STRICT_ALIGN to describe which processors
support hardware unaligned accesses.

Huacai

>
> > +config ARCH_STRICT_ALIGN
> > +     bool "Enable -mstrict-align to prevent unaligned accesses"
> > +     help
> > +       Not all LoongArch cores support h/w unaligned access, we can use
> > +       -mstrict-align build parameter to prevent unaligned accesses.
> > +
> > +       This is disabled by default to optimise for performance, you can
> > +       enabled it manually if you want to run kernel on systems without
> > +       h/w unaligned access support.
> > +
>
>
> There is already a global CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> option, I think you should use that one instead of adding another
> one. Setting HAVE_EFFICIENT_UNALIGNED_ACCESS for CPUs that can
> do unaligned access will enable some important optimizations in
> the network stack and a few other places.
>
>     Arnd
