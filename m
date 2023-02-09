Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E6E627
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 03:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AC7C433EF
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 03:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675913894;
	bh=sZcmT4YoOyHE793lXhE8rjx0Hewi5P86fQfY62bVLso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CQf8hfJbaMiqC2vIng9fLIXn6mykWu4ad/Kgd3UYoVjq4NTLZ92PHRuVghczfB7j8
	 7pM88HdKPtc551iIGa+geAIhCvO6sCzr50u1+YLlGDYR88OVMszfC6gPUsXhWxDQON
	 iLm1vS/N8kY0kTpASkjSx6vp1n1zrMi2BOplTyUiKmaL3FMmxlZzNiClzQ/XIY1zCT
	 xzP0VWXsneZcAbRiIqMAKYxREj4qaBPBqOsH2zLeY0Bueo9rof7ZEDcEZfkEONgLYF
	 2zikBjpRXRhf2ip/4iUSlXXBH4B5Ld5X8+MDOYn02Mr9/ktVvdP1YD0vci3/y8nXPN
	 KMtSqDCM9dhSA==
Received: by mail-ed1-f47.google.com with SMTP id fj20so1011476edb.1
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 19:38:14 -0800 (PST)
X-Gm-Message-State: AO0yUKXaO4M330/JyspkzGQBadNAJksBrBAAD+MFVedhfpblv7vYFMEd
	RvglmKWk6Y1sLiNiiExPy/W9yloYp74oRtyoMLc=
X-Google-Smtp-Source: AK7set/t/PG5JVGZ9S+WrIC6bd3qWz1Du+f1kFd6B/WwzNipsMFDSucgFV9nWYU8xpd3NigI61q/9/FkQqn4VveljWY=
X-Received: by 2002:a50:f60b:0:b0:4ab:15bf:4b9e with SMTP id
 c11-20020a50f60b000000b004ab15bf4b9emr839361edn.7.1675913893061; Wed, 08 Feb
 2023 19:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675907639.git.chenfeiyang@loongson.cn> <Y+RqCcaS6pJ+W9+N@1wt.eu>
In-Reply-To: <Y+RqCcaS6pJ+W9+N@1wt.eu>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 9 Feb 2023 11:38:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4-m3AaS4-w-+yyUwBMt8Fm30SkS7ZnfSL5zA1OzJsLTA@mail.gmail.com>
Message-ID: <CAAhV-H4-m3AaS4-w-+yyUwBMt8Fm30SkS7ZnfSL5zA1OzJsLTA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add LoongArch support to nolibc
To: Willy Tarreau <w@1wt.eu>
Cc: chris.chenfeiyang@gmail.com, paulmck@kernel.org, 
	Feiyang Chen <chenfeiyang@loongson.cn>, arnd@arndb.de, jiaxun.yang@flygoat.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Thu, Feb 9, 2023 at 11:35 AM Willy Tarreau <w@1wt.eu> wrote:
>
> Hi Feiyang,
>
> On Thu, Feb 09, 2023 at 11:24:11AM +0800, chris.chenfeiyang@gmail.com wrote:
> > From: Feiyang Chen <chenfeiyang@loongson.cn>
> >
> > Add statx() and make stat() rely on statx() if necessary.
> > Add support for LoongArch (32 and 64 bit) to nolibc.
> > It was tested on LoongArch64 only.
> >
> > The latest QEMU support full-system emulation of a LoongArch64
> > machine, but for the moment we need to specify the firmware manually.
> > https://github.com/loongson/Firmware/tree/main/LoongArchVirtMachine
> >
> > QEMU_ARGS_loongarch  = -M virt -bios edk2-loongarch64-code.fd ...
> >
> > v2:
> > - Mention that statx() will also benefit other architectures.
> > - Make stat() rely on statx() when available.
> > - Put the whitespace changes into one commit.
> >
> > v3:
> > - Add #if defined(__NR_statx) guard.
> > - Keep the check for statx() from the first version.
> > - Mention that we may use statx() everywhere in the future.
> > - struct statx stat -> struct statx statx.
>
> I'm personally fine with this one. I'll give it a try with all supported
> archs to make sure we don't have any unexpected side effect, and unless
> anyone has any other comment, we'll queue this series.
>
> Thank you!
> Willy
