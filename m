Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CF33C3B
	for <loongarch@lists.linux.dev>; Tue,  9 May 2023 07:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11B8C433EF
	for <loongarch@lists.linux.dev>; Tue,  9 May 2023 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683617730;
	bh=i6AkqX9OG4urSpbS1xrzYnpDcBb8eJNd6ma8fn40rMc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IlXhJ5B0XdxfUeNt156ZUkJeirPYII3urcHVcT6n8Z6kgly1/sqvJD6PqBxS1/bMq
	 Bru8X5xMZ1isOfEnQ0nHIO7JMmQQti4bdYhfd1jWgxLTWBWR6wBcpbNcCp1LMpTBg/
	 RSiRRN5q+Xox1lVppn9llbkf9bFjqxz0TuiO85sRp9/paN6z/mnuK/4samE6h5wMrI
	 ZduRlmx4CbZrZ+Fx5OL4YkL4PAY/qyjh7D40D/3EODPA0vKFlIs+LO2azRcvyW9MnP
	 xqfI/eZb4ZqLDQiEgb0vYy6rkEI/hAskWFta2ZM3Zz4zhkMeq1Vqhazyofhp1qjJYQ
	 e90Y/59zg/G5g==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9659443fb56so840051166b.2
        for <loongarch@lists.linux.dev>; Tue, 09 May 2023 00:35:30 -0700 (PDT)
X-Gm-Message-State: AC+VfDw9L1n5qyOg4yISfTuiH98lWFgFHQQfsAE3BY7xJpfPgM5736LQ
	0fTADMn2kLrVJrZQBFNwrl1iylY5k0c1zrUTAZ0=
X-Google-Smtp-Source: ACHHUZ7gDT2UxQsh+h4oCZr5DdH6lgknuIzYySxmf6DuAZOuNATQyE+FsTDAEyACKUKIY288OFYiEJrvAx9jCcOB4aE=
X-Received: by 2002:a17:907:2ce5:b0:969:9fd0:7ce7 with SMTP id
 hz5-20020a1709072ce500b009699fd07ce7mr2847749ejc.11.1683617728888; Tue, 09
 May 2023 00:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1683614971-10744-1-git-send-email-yangtiezhu@loongson.cn> <68984bbb-4ccc-51f8-7d4b-b1ae08a43c52@loongson.cn>
In-Reply-To: <68984bbb-4ccc-51f8-7d4b-b1ae08a43c52@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 May 2023 15:35:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4K6xjv-Jgz3BPbdBgWij5EtaMrK2cNeyqyJNC7VRMoyw@mail.gmail.com>
Message-ID: <CAAhV-H4K6xjv-Jgz3BPbdBgWij5EtaMrK2cNeyqyJNC7VRMoyw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Select HAVE_DEBUG_KMEMLEAK to support kmemleak
To: Youling Tang <tangyouling@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 3:13=E2=80=AFPM Youling Tang <tangyouling@loongson.c=
n> wrote:
>
> Hi, Tiezhu
>
> On 05/09/2023 02:49 PM, Tiezhu Yang wrote:
> > We can see that DEBUG_KMEMLEAK depends on HAVE_DEBUG_KMEMLEAK after
> > commit b69ec42b1b19 ("Kconfig: clean up the long arch list for the
> > DEBUG_KMEMLEAK config option"), just select HAVE_DEBUG_KMEMLEAK to
> > support kmemleak on LoongArch.
> >
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >
> > This is based on 6.4-rc1
> >
> >  arch/loongarch/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index d38b066..1e64edd 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -90,6 +90,7 @@ config LOONGARCH
> >       select HAVE_ASM_MODVERSIONS
> >       select HAVE_CONTEXT_TRACKING_USER
> >       select HAVE_C_RECORDMCOUNT
> > +     select HAVE_DEBUG_KMEMLEAK
> >       select HAVE_DEBUG_STACKOVERFLOW
> >       select HAVE_DMA_CONTIGUOUS
> >       select HAVE_DYNAMIC_FTRACE
> >
>
> At the same time, you need to modify the loongarch in arch-support.txt
> to ok.
Agree, Tiezhu can send a new version.

>
> BTW, we can submit a separate patch to modify the features already
> supported by LoongArch.
>
> The following features are already supported in LoongArch.
I think Youling can send this patch.

Huacai
>
> diff --git
> a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> index bcc29d3aba9a..38a0a54b79f5 100644
> --- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> +++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> @@ -13,7 +13,7 @@
>       |        csky: |  ok  |
>       |     hexagon: | TODO |
>       |        ia64: | TODO |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>       |        m68k: | TODO |
>       |  microblaze: | TODO |
>       |        mips: | TODO |
> diff --git a/Documentation/features/debug/kprobes/arch-support.txt
> b/Documentation/features/debug/kprobes/arch-support.txt
> index 8a77d62a42c5..aad83b57587a 100644
> --- a/Documentation/features/debug/kprobes/arch-support.txt
> +++ b/Documentation/features/debug/kprobes/arch-support.txt
> @@ -13,7 +13,7 @@
>       |        csky: |  ok  |
>       |     hexagon: | TODO |
>       |        ia64: |  ok  |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>       |        m68k: | TODO |
>       |  microblaze: | TODO |
>       |        mips: |  ok  |
> diff --git a/Documentation/features/debug/kretprobes/arch-support.txt
> b/Documentation/features/debug/kretprobes/arch-support.txt
> index cf4723c5ac55..61380010a4a7 100644
> --- a/Documentation/features/debug/kretprobes/arch-support.txt
> +++ b/Documentation/features/debug/kretprobes/arch-support.txt
> @@ -13,7 +13,7 @@
>       |        csky: |  ok  |
>       |     hexagon: | TODO |
>       |        ia64: |  ok  |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>       |        m68k: | TODO |
>       |  microblaze: | TODO |
>       |        mips: |  ok  |
> diff --git
> a/Documentation/features/debug/stackprotector/arch-support.txt
> b/Documentation/features/debug/stackprotector/arch-support.txt
> index 71cd4ba18f7d..4c64c5d596f7 100644
> --- a/Documentation/features/debug/stackprotector/arch-support.txt
> +++ b/Documentation/features/debug/stackprotector/arch-support.txt
> @@ -13,7 +13,7 @@
>       |        csky: |  ok  |
>       |     hexagon: | TODO |
>       |        ia64: | TODO |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>       |        m68k: | TODO |
>       |  microblaze: | TODO |
>       |        mips: |  ok  |
>
> Thanks,
> Youling.
>
