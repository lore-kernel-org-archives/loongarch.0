Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E05C745E8
	for <loongarch@lists.linux.dev>; Tue,  6 Feb 2024 04:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707192266; cv=none; b=ZvYxGxcoJxeFFm3dDZ4cNwK6c26CKOoryByiZumjCU+1WZH9kV6/GvSDYPGQCz0kSOvxVTA4cdQ1MrwnzOgVvg4iwRBehROWVdxOwPNn0aWlEdgiUf8I0iB3OSJDaUETTfYEAo63GY7OyVdDmHM1pWmZ7YHuD115DQjAKWXm/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707192266; c=relaxed/simple;
	bh=gjYVPn/YFpnMwXejyLvWj4ikLtJDZVwXdB0BNhrwtME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7xJTWWuDgLKvNWkDzrJOoL55PnxI3B5zNUNoBUNUurzydPhHkSYgTlg6ZCuxfn49s7JVzmGggMOF5UyzTihp1ZE2JzskY/O5f96zOOQKemGY4EGaAYgVjQInL+EjHj24r4oXTve2a6AXnnH/UBlip0Z3ebELFC9aH3B9GeKhW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWY7yztv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWY7yztv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327D2C433F1
	for <loongarch@lists.linux.dev>; Tue,  6 Feb 2024 04:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707192266;
	bh=gjYVPn/YFpnMwXejyLvWj4ikLtJDZVwXdB0BNhrwtME=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OWY7yztvDJFlPwyT9ZSGTPPLykqW5deu96VSGAPT+WEERJGQPJbIsM/PGpwBo5osb
	 wz+xqaCLY3TM498RIH4LWjsi1Oa0T/cixDkHz6ablxypTx3fEdcWY77KPaWtTUoPZe
	 ZBdsKNoLiadH1wxtjM87kam59rA0gVtcLkIZvrnvG16In9N/K+ARon+8AYsu/LPr40
	 KaVPmdSUvGJOOU/e5kidg1PtOuolHQCQQ0bFmc491RPPqxmSWuwZNxYwkuSAVa74bR
	 K8aNq9j0EjqmO9Illm1TNjnNR/2gvIFFFPhBe96lCPHnGh5A+rf368p2kChX3Jj2nq
	 woX+frtmbjQZw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5100cb238bcso9286048e87.3
        for <loongarch@lists.linux.dev>; Mon, 05 Feb 2024 20:04:26 -0800 (PST)
X-Gm-Message-State: AOJu0YyIht+qmo8KlsXx01LqpRy6RS5lP8P6vTjWdRwm/pDgaszl0nIZ
	TgLvBU/cA2xgOIl4W6XPoZ4N7oCy0jR406DZLu4uAlsNfW28X2aoHCFxxrHVcQ+TKsU1LW/ar4d
	FlPKXcA9XbkeeOGRPdrHWmnHNb8s=
X-Google-Smtp-Source: AGHT+IFGiaxdS+q0jNB1zQEW84GYvpFJAoEuKs2W2qWpgcWKlRM99vTKyrvLhz1uzHwe+YPkBjkkSTclljrhx3Bm4Qc=
X-Received: by 2002:ac2:5926:0:b0:511:4ff0:5323 with SMTP id
 v6-20020ac25926000000b005114ff05323mr877963lfi.31.1707192264382; Mon, 05 Feb
 2024 20:04:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240204134813.61884-1-masahiroy@kernel.org>
In-Reply-To: <20240204134813.61884-1-masahiroy@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 Feb 2024 12:04:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Wfu4-X0zUJgwEpFC9DNCP5BPFQ0Dazo_fWXLpxzqK6w@mail.gmail.com>
Message-ID: <CAAhV-H6Wfu4-X0zUJgwEpFC9DNCP5BPFQ0Dazo_fWXLpxzqK6w@mail.gmail.com>
Subject: Re: [PATCH] loongarch: select ARCH_ENABLE_THP_MIGRATION instead of
 redefining it
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Sun, Feb 4, 2024 at 9:48=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> ARCH_ENABLE_THP_MIGRATION is supposed to be selected by arch Kconfig.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/loongarch/Kconfig | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 10959e6c3583..64e9a01c7f36 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -12,6 +12,7 @@ config LOONGARCH
>         select ARCH_DISABLE_KASAN_INLINE
>         select ARCH_ENABLE_MEMORY_HOTPLUG
>         select ARCH_ENABLE_MEMORY_HOTREMOVE
> +       select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>         select ARCH_HAS_ACPI_TABLE_UPGRADE      if ACPI
>         select ARCH_HAS_CPU_FINALIZE_INIT
>         select ARCH_HAS_FORTIFY_SOURCE
> @@ -667,10 +668,6 @@ config ARCH_SPARSEMEM_ENABLE
>           or have huge holes in the physical address space for other reas=
ons.
>           See <file:Documentation/mm/numa.rst> for more.
>
> -config ARCH_ENABLE_THP_MIGRATION
> -       def_bool y
> -       depends on TRANSPARENT_HUGEPAGE
> -
>  config ARCH_MEMORY_PROBE
>         def_bool y
>         depends on MEMORY_HOTPLUG
> --
> 2.40.1
>
>
