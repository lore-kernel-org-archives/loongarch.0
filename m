Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF59317FE
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 02:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735871939; cv=none; b=C9oyzRCsgzJS4b497y8xw1rz9K2Raqxx25KhVU926kcS6CLNAAILP+O4r8RfhSNH1q2g6Xaz3CFKUNFBe8nV2+/lzoWN/V/nW3EdMe9IGkXiz5oUuzxQwOHSDp84CMvQ1QSbdXPD/tiOToIAOwaAI8ImKu+IsSztEuVMf+8/b0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735871939; c=relaxed/simple;
	bh=ueHxTudJ0tAFuuvzaQkseMUqINhLCGPEHUkMpaVIUE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UpZY9ulGFj6PPILjjL5rcpkfIKYVi4wlXO1JNXR27VIT+Q9cIz6/0dMBt9+LEN8VcW3ilK2NpeRyonmw3UWXPAPRzW/yQ6YQBK9/X6mTt4TDktTGkmrOOmwH+0vTzzruBW/65ifZLjJShxkU9Lkbi17K6nD19xCnTrOgyxCEYCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=je3+Tjan; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="je3+Tjan"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729E0C4CEDC
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 02:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735871938;
	bh=ueHxTudJ0tAFuuvzaQkseMUqINhLCGPEHUkMpaVIUE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=je3+TjangH5vyDj7N8riqszmn/4H+gIYJsFkaNSZfeSLuocgCUElOeQqk6VITPV4N
	 P6Fzmc3AeohgAtjvKH4Mb4I/fwSJs/t1wu8Rk493ddmWQj8r99i85Wlgk8Jzhdyx3S
	 +zOGok0y7eXGzZzBXyPUKedN9ii7yfmL/3QrRWpBxKpiLwLLIz2wquWtTIxFPVQ3sX
	 9QJ2oLaQIR0Ns5Y46AnC5+dQzG6VMIEnyhTR5mJcgW/eXBMa0ssx6fqzJN6987dgjM
	 89pzhD7ogg9mZqzzPKE+CwJM5vpQMII2cuL55XJJiX2i8w+Y18MefBfJT5PbATmIj3
	 haUM8ZtN8E2SQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaec111762bso1765184566b.2
        for <loongarch@lists.linux.dev>; Thu, 02 Jan 2025 18:38:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrFIybGZ+djisQfTJ9LvGEijXNN+qdfCe4g7Hc4ki2YiXX3CQe/9IZcnuXzYOWdUK506SZHbg58Ug=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMKTz4OatHe+fXX8aWEqprLrgP4HGu6y8TrLrDV21yv3S5y4wJ
	c10Chj608nOUy/XO9olr+E8kHOqgQsCR+yBT2Qh8b6pNsQDOF6U8a2xnXexKXqHQkihEAapaR38
	JYqySPbFUAWYPs82jMnc8MBcBSKw=
X-Google-Smtp-Source: AGHT+IHa0EKFGnfVqtPK4J6t1Hbul6dN3H/qq7EXzQAzb/ZHVJjZfbcO5pe9NOP2WQaJLPIqzIdCWapK508K4gWm4i8=
X-Received: by 2002:a17:907:97d2:b0:aa6:af4b:7c95 with SMTP id
 a640c23a62f3a-aac33690754mr4916168066b.56.1735871937020; Thu, 02 Jan 2025
 18:38:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250102-la-earlycon-fixed-map-v1-1-23fe3a6681c4@flygoat.com>
In-Reply-To: <20250102-la-earlycon-fixed-map-v1-1-23fe3a6681c4@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 3 Jan 2025 10:38:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H44VvyxHqmyQ3K8qC+HERH0FjheqAJpDCiYkQ2oK2woAg@mail.gmail.com>
Message-ID: <CAAhV-H44VvyxHqmyQ3K8qC+HERH0FjheqAJpDCiYkQ2oK2woAg@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is enabled
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jiaxun,

On Thu, Jan 2, 2025 at 10:34=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> When ARCH_IOREMAP is enabled, we are using always accessible DMW
> for ioremap. It makes no sense to create a dedicated mapping for
> earlycon given that we can access the region via DMW.
>
> Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is selected. This can
> ease debugging for early mapping issues.
Fixmap has nothing to do with IOREMAP, whether you use ARCH_IOREMAP or
GENERIC_IOREMAP, earlycon is mapped by fixmap rather than ioremap().

Huacai

>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/loongarch/Kconfig              | 2 +-
>  arch/loongarch/include/asm/fixmap.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 1c4d13aa677e2e04b9791882fba7523f93d6a69d..ad8a8cf75343799ea626be52f=
521fa75e7cbe07b 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -246,7 +246,7 @@ config MACH_LOONGSON64
>         def_bool 64BIT
>
>  config FIX_EARLYCON_MEM
> -       def_bool y
> +       def_bool !ARCH_IOREMAP
>
>  config PGTABLE_2LEVEL
>         bool
> diff --git a/arch/loongarch/include/asm/fixmap.h b/arch/loongarch/include=
/asm/fixmap.h
> index d2e55ae55bb9c499b9a685509bc26d663054b58e..905dc7a5f9fa52ac924fe8327=
49f39283c28a9f8 100644
> --- a/arch/loongarch/include/asm/fixmap.h
> +++ b/arch/loongarch/include/asm/fixmap.h
> @@ -12,7 +12,9 @@
>
>  enum fixed_addresses {
>         FIX_HOLE,
> +#ifdef CONFIG_FIX_EARLYCON_MEM
>         FIX_EARLYCON_MEM_BASE,
> +#endif
>         __end_of_fixed_addresses
>  };
>
>
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20250102-la-earlycon-fixed-map-d6a48bd5b831
>
> Best regards,
> --
> Jiaxun Yang <jiaxun.yang@flygoat.com>
>
