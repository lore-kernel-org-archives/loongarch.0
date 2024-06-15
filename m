Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9B22F19
	for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718441283; cv=none; b=En7a1qACkUrbZSpSaWaVEexGu31koAvScZfXLYw54+xI2mXCC6vGyC3qfF0r75/WJQcNgyPWWwkk/hw9OqEYR2JIqa2ga1OvG5ypQ10etO7JoXpJ+sjkzeqfwDpsRW13NPDXpZkrg6nzC9YeM4W1UwxtQmG0u163e89XDy4MTIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718441283; c=relaxed/simple;
	bh=F172A5kaE7U9++BlJ9WMNmyQqB5K361uV14FzwmsrFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffEEZzExvO8dlSNVzwCuCoPVOVxVAIhhwPrUmM/2TOHhfAkCyij3gzAB1N6kLAz260/guT9jaZ1pAeiTtHWz7ldye14Mpdy02gJfcFt8u8XcraMD/DGN50818N3VgYGvOzp73vqyZ1SzaA1gtNvoYzfw/3yqxI64LYlyfZqCH9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THuRshn2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THuRshn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E3DC116B1
	for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718441282;
	bh=F172A5kaE7U9++BlJ9WMNmyQqB5K361uV14FzwmsrFU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=THuRshn2kH++zbLjnAwMXUX+KOheT9g+Nz1rvuEzfJA5G8idtktqeeukGPHnv1sNg
	 /VayyDvV6dfQpfLf3xh+ZqbpfRfeAp2iwlSujagNRNWHbhn41C19pkQ8wJC6mFcy8k
	 aYNnn+mJ2TzYCJVC1Z8PBVJ3nocMdCu7bNjn6EfGdiymIzAz0r90JGuk+DN9GhrIWe
	 efm/AD2YO64dSlEQn6W4yrzvbIUs+tSNrhv/WE2eBE3LmNaLVnXryZtVAWPkmEkLU0
	 oVv5rp4GzasGR5uFjVbl8tcxSsD+i/TDyn+uny1R9zmNo9Qe2hogwTWryjwm5KdqSN
	 iomalfin86JyQ==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57cc30eaf0aso800375a12.2
        for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 01:48:02 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx/pXFapQlYKySQrodPdACV7QYvtcv9ClfIEYpfZDGlmSoiR/mM
	3xv/4IvZFiP/Eg/e+gWmvlUIVaILvXbOHdIZbVD9n2lfwxH3xUgVVX6Z2LRVzYn/G3+k6TwQdTZ
	CPdb9W0rxlJeDF9WUkM2LR1yIPTw=
X-Google-Smtp-Source: AGHT+IEqaJ/wbQjTekPJ6ccc23TWOYoQqdPh/L6lR3BB8MjcTXWzF5Kz+ekDzr1vZLS12guDZzIe6l1Y4Jizt63LKag=
X-Received: by 2002:a50:9314:0:b0:57a:70fa:8875 with SMTP id
 4fb4d7f45d1cf-57cbd8b9c3bmr3549993a12.40.1718441281366; Sat, 15 Jun 2024
 01:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240611114939.23586-1-lihui@loongson.cn>
In-Reply-To: <20240611114939.23586-1-lihui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 15 Jun 2024 16:47:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6+to0-s+RhA8ZcExgU4e39+gEx_Yr8C+z2DL49XaDyag@mail.gmail.com>
Message-ID: <CAAhV-H6+to0-s+RhA8ZcExgU4e39+gEx_Yr8C+z2DL49XaDyag@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] LoongArch: ptrace: Fix some watchpoint function
To: Hui Li <lihui@loongson.cn>
Cc: loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jinyang,

Do you have any additional comments about this series?

Huacai

On Tue, Jun 11, 2024 at 7:49=E2=80=AFPM Hui Li <lihui@loongson.cn> wrote:
>
> LoongArch defines hardware watchpoint functions for fetch and load/store
> operations. After the software configures the watchpoints for fetch and
> load/store, the processor hardware will monitor the access addresses of
> the fetch and load/store operations and trigger a watchpoint exception
> when the watchpoint setting conditions are met.
>
> Fix some hardware watchpoint issues on user-space and kernel interface.
>
> All changes are made according to the LoongArch Reference Manual:
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html=
#control-and-status-registers-related-to-watchpoints
>
> Testing for this series can use this gdb patch:
> https://sourceware.org/pipermail/gdb-patches/2024-June/209856.html
>
> Changes v1 -> v2:
> Suggested by Jinyang and Huacai:
> - Modify the commit message.
> - Modify the privilege level judgment in ptrace_hbp_set_ctrl() and
>   move the settings of regs->csr_prmd to hw_breakpoint_control().
> - Add judgment in ptrace_hbp_set_addr() to ensure that kernel-space
>   address cannot be monitored in user mode.
>
> Hui Li (3):
>   LoongArch: ptrace: Fix watchpoint setting error
>   LoongArch: Trigger user-space watchpoints correctly
>   LoongArch: Fix multiple hardware watchpoint issues
>
>  arch/loongarch/include/asm/hw_breakpoint.h |  3 +-
>  arch/loongarch/kernel/hw_breakpoint.c      | 86 ++++++++++++----------
>  arch/loongarch/kernel/ptrace.c             | 48 +++++++-----
>  3 files changed, 77 insertions(+), 60 deletions(-)
>
> --
> 2.38.1
>
