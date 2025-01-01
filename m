Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8848A5914C
	for <loongarch@lists.linux.dev>; Wed,  1 Jan 2025 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735727753; cv=none; b=Sk+fz+ck7FBX9ml9u8wPdXXo6y+Ooy5GAf01wEMn8v9QfSzetRRC6oY1sU/ezXXUZotOQNrhbQKyQ2lPvJDAW6YrrQSBTTtbUHzvBecaNvA8nHmA+TJNG9HbnaZQYPPV5Tqr6Eh+RQaRr4/kXZYullZGzgUysWUbvLpHqCXdYn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735727753; c=relaxed/simple;
	bh=dcToFOn6zMPYiG8fgtcE/L9OOYN6RM1jEdjmwyd1aNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/mftPPjk81hjLlzShPzwVLfCO39raG8zD6Sbr3h68bF6fsyZIaXMf/veeNs2TVcSb7SP4a58om/erP5M+S8oBsxDxQ6LJIqjLvkMrVoU6/NF+VQ23SMbq+xOk0djc8PNrrs0GihbWU/ZmNKvxhjCLOdHcwMgPopqLJrWf68noI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJKz+Mzy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJKz+Mzy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CE5C4CED1
	for <loongarch@lists.linux.dev>; Wed,  1 Jan 2025 10:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735727753;
	bh=dcToFOn6zMPYiG8fgtcE/L9OOYN6RM1jEdjmwyd1aNg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bJKz+MzyqMXVt3UwNPGGdsQL0AhldFLXY5APejrKnc9/zyTTal5f6fP6GfKWdxjiT
	 h4zI2kU4rWbEC9vQrrMtV5j80yYL+2MDEjfULEVdPVUrWqYao5i9Tr/haPvvZblvam
	 nkplhaFxtWJO8UT9+xQxb8kP5OJrA44N8N8gpbKCt9ibolgR2VTl/i/z6QZ6ggmhVz
	 U7CoNLa2QtfYC2/lkyClOkRynwO3aPOMKnM7kiCJ65OKZAcEwD4Bf3bLffHhym5YKo
	 8Dvtylt/Xn+O76L0I6lo18nNPPPHfWy4IRSokV3p+frblfwE7CY/yBR5AA1fucYURR
	 N5U5tmsOC1v7A==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so1740916266b.2
        for <loongarch@lists.linux.dev>; Wed, 01 Jan 2025 02:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlvGjFyBDR+O4jLo3NBL8p9M2Oe0in9RdH0K9S0sRAra8zxz2W2LZthTVcX8dIYzVsxjz+JY7Tjq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA5K4WviNil4bCnMcMaRV2gBPft0ZpCVxP6O4kRryehTe/HGIY
	AkQ3JS8opIJMM6BLDxGO/ADf7xRn3lzQDcZrsxFJAjX6BY5GcMvLcYlbc9bcvVlstv7gKSeK2cH
	mglciJ4ekQbyH/yDh+kdLZQfot+I=
X-Google-Smtp-Source: AGHT+IEo4ASs6IkoKoJI3LR4lA64FKwqkvMmHxIR0XQ/5e8ZxWKbm7Y4ToD5cR03Tvma6wtc27xhSPHctZ2kR0tWfic=
X-Received: by 2002:a17:907:728c:b0:aab:9430:40e9 with SMTP id
 a640c23a62f3a-aac2d420441mr3695676066b.32.1735727751712; Wed, 01 Jan 2025
 02:35:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241222001230.2579074-1-masahiroy@kernel.org>
In-Reply-To: <20241222001230.2579074-1-masahiroy@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 1 Jan 2025 18:35:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H599RsZqAXHZf8Ct84wh+t+pyPMk0=F6N1Z6opLkTkSmg@mail.gmail.com>
Message-ID: <CAAhV-H599RsZqAXHZf8Ct84wh+t+pyPMk0=F6N1Z6opLkTkSmg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: migrate to the generic rule for built-in DTB
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Sun, Dec 22, 2024 at 8:13=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
> DTBs") introduced generic support for built-in DTBs.
>
> Select GENERIC_BUILTIN_DTB when built-in DTB support is enabled.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/loongarch/Kbuild            | 1 -
>  arch/loongarch/Kconfig           | 1 +
>  arch/loongarch/boot/dts/Makefile | 2 --
>  3 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/loongarch/Kbuild b/arch/loongarch/Kbuild
> index bfa21465d83a..beb8499dd8ed 100644
> --- a/arch/loongarch/Kbuild
> +++ b/arch/loongarch/Kbuild
> @@ -4,7 +4,6 @@ obj-y +=3D net/
>  obj-y +=3D vdso/
>
>  obj-$(CONFIG_KVM) +=3D kvm/
> -obj-$(CONFIG_BUILTIN_DTB) +=3D boot/dts/
>
>  # for cleaning
>  subdir- +=3D boot
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index dae3a9104ca6..98e099be912d 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -396,6 +396,7 @@ endchoice
>  config BUILTIN_DTB
>         bool "Enable built-in dtb in kernel"
>         depends on OF
> +       select GENERIC_BUILTIN_DTB
>         help
>           Some existing systems do not provide a canonical device tree to
>           the kernel at boot time. Let's provide a device tree table in t=
he
> diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/M=
akefile
> index 747d0c3f6389..15d5e14fe418 100644
> --- a/arch/loongarch/boot/dts/Makefile
> +++ b/arch/loongarch/boot/dts/Makefile
> @@ -1,5 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  dtb-y =3D loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k200=
0-ref.dtb
> -
> -obj-$(CONFIG_BUILTIN_DTB)      +=3D $(addsuffix .dtb.o, $(CONFIG_BUILTIN=
_DTB_NAME))
> --
> 2.43.0
>
