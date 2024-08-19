Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753E15C130
	for <loongarch@lists.linux.dev>; Mon, 19 Aug 2024 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724057350; cv=none; b=R4QtRQIKUorkBLFFmVIYILx6yptlpPNYR6OA6b+DzKw/8pBXKNOHjdb+IuHH+fhN/Xqw0C3mDfdIdrDzzrmanY/uYG26B7G1zWXJTV7H+MeP2IhCgqzzrwDSdzcDObXqMRjYhEwV4O04e8AZvDf6zSx7pbUnJM08dxRoXVhsZ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724057350; c=relaxed/simple;
	bh=ikeSjRy4GsW1m2fYRfCUzbJkQ/cLV6dTiPYaEPwsdbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKia7m6V8wpm9DVVM5MpET8IqWT4Mpq3mACv/+MfW31qeMBU+9ns+w4Awsiv6bEVcSFfit2Q5aZxv88nM7X5Za9QtxYmuD5/wQoYuDSJ+WZZgRirPiwBMqgscZHs0TtzblO+fhTMRv4Xl2uGKABQdExv0JMMWAsKugPojfqJJ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DB5ay+B1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DB5ay+B1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448C8C4AF12
	for <loongarch@lists.linux.dev>; Mon, 19 Aug 2024 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724057350;
	bh=ikeSjRy4GsW1m2fYRfCUzbJkQ/cLV6dTiPYaEPwsdbU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DB5ay+B1SbvuK0W/tIq07Vh5cW5GH67aQBpzRM1NtCNgImUNaniZvOw8i+UTZTmTC
	 cXAiZWkZaZJdkOYwYC+6NVW37RRSUDj41llkzUzX4W2dydxf4BmGof1xv7vXIVvk5L
	 egImF0VNDy0SuW91wJNOgR0kVFq/hKLz0c86Kh7E7QzZ7hWd8wWmI8RWqYFDE7Fefb
	 +Rj7qhCx55Y5fbdhOf01+TnA2Hn3fAZlrxGtmMmKzOIj94Qt6DfP7/IiUmIGTyv5gK
	 MoghLCyygSsXX2yElsJ7knt96Bk7BgPe9UDpI48V0Vgckuv5E9kRdYTMN/jXlXBhWh
	 uvtpAY0tLfMLw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f189a2a7f8so41615391fa.2
        for <loongarch@lists.linux.dev>; Mon, 19 Aug 2024 01:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXa2T4i/PgNHUG//JMee3en98zQ59p0ySqn4njr3DgVeg4r/JWGVxTtJfQmrQn3VYBqvNzLBLbihC+lLQAwSVNjZCoy4aqskJbw
X-Gm-Message-State: AOJu0YwrYOPAbIAR/ELNA/FZmBujuM/Gdx6nwnvsbhrXFRzRCTMdtr3u
	augt68j+OPQNu7hC2MfInvgfsjoObmchqBmPioZnuurwqnJzC4UVWFvAx69D1y3wK1s9f68wQrp
	3cNIbEhnUIBQrUXDOADr4A1LU+g0=
X-Google-Smtp-Source: AGHT+IGmH+b8jUe5ni2UMuI8Z7jONtWR0To4PVrSyU6P+lbditYQK79uhqh5roR1ezY68Ur4UM5epZBfW+DnTBTSo/4=
X-Received: by 2002:a2e:4e01:0:b0:2ee:974c:596f with SMTP id
 38308e7fff4ca-2f3be5bfe54mr70497211fa.28.1724057348523; Mon, 19 Aug 2024
 01:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240812-clean-dma-direct-v1-1-cbe19c2b73f5@gmail.com>
In-Reply-To: <20240812-clean-dma-direct-v1-1-cbe19c2b73f5@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 19 Aug 2024 16:48:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4VgKaN0PywbyX5fFTMK-UNVbnLCYi1zGYPEPwVFwXkBQ@mail.gmail.com>
Message-ID: <CAAhV-H4VgKaN0PywbyX5fFTMK-UNVbnLCYi1zGYPEPwVFwXkBQ@mail.gmail.com>
Subject: Re: [PATCH] loongarch/dma: remove dma-direct.h
To: shankerwangmiao@gmail.com
Cc: WANG Xuerui <kernel@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Mon, Aug 12, 2024 at 1:30=E2=80=AFPM Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>
> From: Miao Wang <shankerwangmiao@gmail.com>
>
> dma-direct.h is introduced in commit d4b6f1562a3c ("LoongArch:
> Add Non-Uniform Memory Access (NUMA) support"). In commit
> c78c43fe7d42 ("LoongArch: Use acpi_arch_dma_setup() and remove
> ARCH_HAS_PHYS_TO_DMA"), ARCH_HAS_PHYS_TO_DMA was deselected and
> the coresponding phys_to_dma and dma_to_phys functions were
> removed. However, the unused dma-direct.h was left behind,
> which is removed by this patch.
>
> Fixes: c78c43fe7d42 ("LoongArch: Use acpi_arch_dma_setup() and remove ARC=
H_HAS_PHYS_TO_DMA")
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
>  arch/loongarch/include/asm/dma-direct.h | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/dma-direct.h b/arch/loongarch/inc=
lude/asm/dma-direct.h
> deleted file mode 100644
> index 75ccd808a2af..000000000000
> --- a/arch/loongarch/include/asm/dma-direct.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> - */
> -#ifndef _LOONGARCH_DMA_DIRECT_H
> -#define _LOONGARCH_DMA_DIRECT_H
> -
> -dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr);
> -phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr);
> -
> -#endif /* _LOONGARCH_DMA_DIRECT_H */
>
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240812-clean-dma-direct-2eef3cb0c987
>
> Best regards,
> --
> Miao Wang <shankerwangmiao@gmail.com>
>
>
