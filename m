Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316002DC77F
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753441; cv=none; b=O5igB5RL37N62bGEYOWOjUMd7WCwz8F/x9FDWoEnfbt4W07wVxnwV7JqCSoRbihyPD3GGyoEazwSLDlYKj0p+l5QNtMRkUWlOfPqOJYEzC2XUQfME1DwipPE62N14n0RuNfZ5XxdoDhOKOZ9Jd1AGHoN03pRd5JPw3cQQiPegBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753441; c=relaxed/simple;
	bh=UCqBI7cEMsrZfr7nU8sKwo+ZdD54odOk/me57oUkGlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRVnQx6Csfcaf+7/h2y0JG6ilj4t3grv76OUptPxgFFBVmR1h5F87lsUpNqhROF7wY3A9I37wlVw1WEg9BwB8+mqiSY2NJ+1e5ARNNsHzDDyUGkjhS38m8STCOfLmq5mDtNRynSqBTvj/Mo3cXfIz2di2xDRlFcFH8tRT1Czp1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2mj3gwD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2mj3gwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52D7C19424
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764753440;
	bh=UCqBI7cEMsrZfr7nU8sKwo+ZdD54odOk/me57oUkGlY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M2mj3gwDqaPLibnMJHLM7syQCxiVez6epOVVe63aJIdDf+ogZpY7qKAj6OimGJ4oV
	 bm89PNvIPRrTpDr6zbFBFPd6tbuMtzcz7ev9mgy6xcqO7qe1TowCyat7zZN5bgtU27
	 4nHmYUw9Zz0QtnVCTJR2N0cYnYy7aYbEfu1THkbbBxOr1KqLgHMCzKu4WnTrvDI3+S
	 yTwIYy54hW7EWXcglwITjXeJ0msOe+FBz9MOY4+NbGm1DMWMqxwJnAVTXrm6sabto4
	 +V1vh6UsC0gI4iepl6IhcbK/XBS+9LezBZjhu+bHmUhgKjRwsX0J+Vpu0rL1PvFhiY
	 M/mt4e/vq+wSQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79b9113651so384956566b.3
        for <loongarch@lists.linux.dev>; Wed, 03 Dec 2025 01:17:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWo7W4AfIjRutVulUgGvB5vvP5mdSEnG0IsYeW7BKEG/zjUEsB4TqW/lE5ZnSiEIPytcoHwTnwtHHs=@lists.linux.dev
X-Gm-Message-State: AOJu0YymjFN7gbmoY217NpWX+hApfk+jUL6rpNg9+Cz0tXkfsBrKrwCB
	ttvi4W7zEzWP1iRBYJA86vh73NcjZB/Z5zMKJfXNzl7zjkLWCgClMqmtTnATSXBZ+jJ8nRJcWQR
	quUdbmPM/+AE7BdGbUzszmFXDh2+fWns=
X-Google-Smtp-Source: AGHT+IGukS3yrTL5+S07JAKjZU6LTQoB71FbGgsiFQSkFsYh6g5MV6gZi1SWjNqFGEkgZglFZtCJdPXiJaJmr5+Oi/o=
X-Received: by 2002:a17:907:6d21:b0:b76:4bde:c9df with SMTP id
 a640c23a62f3a-b79dc4b4aa1mr164048866b.14.1764753439327; Wed, 03 Dec 2025
 01:17:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203091039.125259-1-wangyuli@aosc.io>
In-Reply-To: <20251203091039.125259-1-wangyuli@aosc.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 3 Dec 2025 17:17:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4bgShB3NqM3KC9Vtcr3Pz+DiwmGgjgif2H2tKpxLeO+g@mail.gmail.com>
X-Gm-Features: AWmQ_blrubxcCYQCAYwdzr51ipDiPT7wh36RS7-z8uW3HvQK_ZcQzZTrMKaCruw
Message-ID: <CAAhV-H4bgShB3NqM3KC9Vtcr3Pz+DiwmGgjgif2H2tKpxLeO+g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add klp-build support for live patching
To: WangYuli <wangyuli@aosc.io>
Cc: jpoimboe@kernel.org, peterz@infradead.org, kernel@xen0n.name, 
	yangtiezhu@loongson.cn, pmladek@suse.com, alexandre.chartre@oracle.com, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	guanwentao@uniontech.com, WangYuli <wangyl5933@chinaunicom.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yuli,

On Wed, Dec 3, 2025 at 5:11=E2=80=AFPM WangYuli <wangyuli@aosc.io> wrote:
>
> From: WangYuli <wangyl5933@chinaunicom.cn>
>
> Add klp-build support for the LoongArch architecture, enabling
> automated live patch module generation using objtool.
Have you verified the functions?

Huacai

>
> Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
> ---
>  arch/loongarch/Kconfig                | 1 +
>  tools/objtool/Makefile                | 3 ++-
>  tools/objtool/arch/loongarch/decode.c | 5 +++++
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 1a0a5f9def33..7b5f2a329908 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -159,6 +159,7 @@ config LOONGARCH
>         select HAVE_KPROBES
>         select HAVE_KPROBES_ON_FTRACE
>         select HAVE_KRETPROBES
> +       select HAVE_KLP_BUILD
>         select HAVE_LIVEPATCH
>         select HAVE_MOD_ARCH_SPECIFIC
>         select HAVE_NMI
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index ad6e1ec706ce..cead37c25a69 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -8,7 +8,8 @@ ifeq ($(SRCARCH),x86)
>  endif
>
>  ifeq ($(SRCARCH),loongarch)
> -       BUILD_ORC          :=3D y
> +       BUILD_ORC    :=3D y
> +       ARCH_HAS_KLP :=3D y
>  endif
>
>  ifeq ($(ARCH_HAS_KLP),y)
> diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/l=
oongarch/decode.c
> index 6cd288150f49..674e4efd138f 100644
> --- a/tools/objtool/arch/loongarch/decode.c
> +++ b/tools/objtool/arch/loongarch/decode.c
> @@ -34,6 +34,11 @@ s64 arch_insn_adjusted_addend(struct instruction *insn=
, struct reloc *reloc)
>         return reloc_addend(reloc);
>  }
>
> +u64 arch_adjusted_addend(struct reloc *reloc)
> +{
> +       return reloc_addend(reloc);
> +}
> +
>  bool arch_pc_relative_reloc(struct reloc *reloc)
>  {
>         return false;
> --
> 2.51.0
>
