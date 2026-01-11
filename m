Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC01A294
	for <loongarch@lists.linux.dev>; Sun, 11 Jan 2026 01:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768096176; cv=none; b=mLdrzY4nrcZQ3c2fQCBGkVWh8ZY4lw4YJJV7XN2k0I/3rlaqNw3ZmVk0sUKpe7IDAR0lWus0lzY4MKVNWC54CHplLXAv1BIJBqUtEW3teH2AmbyVRvabifaNLKW0Oza21MveND/FcGRdI7RZmev4S690U5Ue1x74oT4d1HX2UCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768096176; c=relaxed/simple;
	bh=3b/8DRNWBNvmQ88Y7gJraVp2bLkfZF2LSd8q8EenBPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6n87QCyLFAKmZrxSL5GmlkSeMGsbqYz6LhBMDffSP/HSXxdKTS/SckNwUtvOvN9kuYvRYHdP3u78dLf6LpryFWV92omL6Z3YDVU09cUM1QzpQ2bz505xeMeUJpI8ngOVNxd3/L2B3/rz2fsryrRIYDROaP8+DX3ICCd9luFIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1SHfQN+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1SHfQN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEA7C2BC87
	for <loongarch@lists.linux.dev>; Sun, 11 Jan 2026 01:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768096176;
	bh=3b/8DRNWBNvmQ88Y7gJraVp2bLkfZF2LSd8q8EenBPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a1SHfQN+7b15J3stAti8RHbo+7X9+/1wA2O4Cs6S+d3G7UFo/lpai5fhW9/xinOO6
	 YXnkwToD/BJREE9UW+9VbhDhMQz0Lufomxat2jRtftk7vKYUJFllmnK+pCRSrZ0tZ/
	 l+Eo5OCO3vwVZsilndc8n/N8xbw+y0b5Zg1iB3/VvJtCaQ+H6m+Sg15V6SzdOPJqMM
	 DZithtx+KAgBDR3cCz5sHcvZNWQJPGeoUKsfNWyEee/qrb41zHtUVUJvmet4chpg0E
	 oiz/SqEypBPlSmMTZ7duTVhTOL4xQPaqNF0AZff98BT5C9BYZzp+KIPpEhqXqI8cXo
	 lp7B0Po3qOfQA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64fabaf9133so9656992a12.3
        for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 17:49:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUP10oti/NiFTAK57BFTJGscuRT+uHb8/KcLghI1/pUwU3p/DchPmg6zTb+C5y9H+hlnnuBuP7jTWE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEkqqGtbVTNtyL16gDwQGccm+9jU7F0dcr5NMMSynC2ss48/1A
	/ltLwq1xSSo5gssT7mgxwmrO7ULLdi2yLfUfmKBjgPnArfUEw+HTgQQH6A9OSzruh69jNESETBR
	cgLywZuM4ysMO+5pI9+Xs8iXgKXw26KU=
X-Google-Smtp-Source: AGHT+IEnAh2DyawqA/iNlhRsTs7cbMXT+2ZfFpPUOh/NanWJQbTpMSL+3a2zD/ZHfOCk6yISKSd3nu6j/2C1tyxLy6I=
X-Received: by 2002:a17:906:31d5:b0:b83:13b3:5197 with SMTP id
 a640c23a62f3a-b8444c4d291mr986087666b.11.1768096174541; Sat, 10 Jan 2026
 17:49:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260110131124.99866-1-dongtai.guo@linux.dev> <20260110131124.99866-4-dongtai.guo@linux.dev>
 <5770eef8d028b4e1778ccee21433ac753e439223.camel@perches.com>
In-Reply-To: <5770eef8d028b4e1778ccee21433ac753e439223.camel@perches.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 11 Jan 2026 09:48:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6o4FFmkOw3FQy7nW5gNuokZcweNbptSN7PTXpLJA6Vaw@mail.gmail.com>
X-Gm-Features: AZwV_Qg3pPy9YQeg5aTePDJjsEWZZqSKDjfr6Y-0HcoxpD4FqXwbwKlY9NeH0_g
Message-ID: <CAAhV-H6o4FFmkOw3FQy7nW5gNuokZcweNbptSN7PTXpLJA6Vaw@mail.gmail.com>
Subject: Re: [PATCH v10 loongarch-next 3/3] LoongArch: Replace seq_printf with
 seq_puts for simple strings
To: Joe Perches <joe@perches.com>
Cc: George Guo <dongtai.guo@linux.dev>, guodongtai@kylinos.cn, hengqi.chen@gmail.com, 
	kernel@xen0n.name, lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Joe,

On Sun, Jan 11, 2026 at 2:04=E2=80=AFAM Joe Perches <joe@perches.com> wrote=
:
>
> On Sat, 2026-01-10 at 21:11 +0800, George Guo wrote:
> > Fix warnings like: "Prefer seq_puts to seq_printf" by checkpatch.pl.
> >
> > Replace seq_printf() calls with seq_puts() in show_cpuinfo()
> > when outputting simple constant strings without format specifiers.
> >
> > This improves performance slightly as seq_puts() avoids parsing
> > the format string.
> []
> > diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.=
c
> []
> > @@ -50,33 +50,49 @@ static int show_cpuinfo(struct seq_file *m, void *v=
)
> []
> > -     seq_printf(m, "Features\t\t:");
> > -     if (cpu_has_cpucfg)     seq_printf(m, " cpucfg");
> > -     if (cpu_has_lam)        seq_printf(m, " lam");
> [etc]
> > +     seq_puts(m, "Features\t\t:");
> > +     if (cpu_has_cpucfg)
> > +             seq_puts(m, " cpucfg");
> > +     if (cpu_has_lam)
> > +             seq_puts(m, " lam");
>
> trivia:
>
> Not sure this is better style as it's fairly difficult to read.
>
> Maybe a macro might help, something like:
>
> #define seq_cpu_feature(m, feature) \
>         if (cpu_has_##feature) seq_puts(m, " " #feature)
>
>         seq_cpu_feature(m, cpucfg);
>         seq_cpu_feature(m, lam);
Seems just some bikesheedings, the current style is OK at least for
me. Since George has worked on this series for a very long time, let's
stop changing and get it merged.

Huacai

>
> etc.
>
