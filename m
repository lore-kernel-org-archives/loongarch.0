Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1821E16414
	for <loongarch@lists.linux.dev>; Fri, 12 Jan 2024 20:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFtm1CB8"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7bed9f3ca97so141672239f.1
        for <loongarch@lists.linux.dev>; Fri, 12 Jan 2024 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705090420; x=1705695220; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DVdUR7buxaSZgsNyBuJ3Vi9ZupYqJqGpn1NqWbOy7E=;
        b=XFtm1CB8fJ2EYwIZYFRYJn5x6YapAxI//LlD/EHa1XM7d5MDzx1MCAEoJbouEm5Tym
         WMuV4qAYrrZuqIZ8OAWUYSJkOOXhncizskU4Q1K1N1OzKKUVh6rs2W10sbSEOq/cDGn7
         39YZB+wDNaJn7mV3txJpEC83nC0X+3EJK/YMpib3A6o6IBVKviGyph07Gwon2lzmqEwB
         x57T0vr2jUFNd+cQ9zZjKkSfsa5m2jqETCAAWh2fj+x+qvXErQhV5/wja97EaJOYiCAN
         9DwJgSlSKFxcawHK3kvqweyzFbXMculq3a2Yx2O0Jl6YEVSpRS4YIKVIeJqAD2wJpcoG
         Vh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705090420; x=1705695220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DVdUR7buxaSZgsNyBuJ3Vi9ZupYqJqGpn1NqWbOy7E=;
        b=fU6yGaMq8mFGzhWM+mlxhzhKmXL+cV9848gfyflgV4QNWD6VsZoINzaqmCZRZi8MJE
         fDsJWlpU0e26q/6rS9RltMGF3Q0xv1x0fhPqauDPjbr7JRU+3HuQe3kRpQeecFg5zLAc
         06PQqiywCYWufURwQVpCD8DHWB1tUWNLsAEmSPQxBmgg1EXRVv9qfVKKaLkejFLFgwVM
         9tD4jHjRARZvo6qHr0yq9nq3bcBkiFqQzQp9Ib46rvZENZD2qcRnpfRbQfwNTMWMZW5h
         YnhXgn3N53ADIkAF4KBvFmFdX9KIgXrnk3yZ0vwv19N6kM1/m+6134ZhRcRqzNYaaquo
         UevQ==
X-Gm-Message-State: AOJu0YzP3zXoPdeUrOTItrf1w09PjLvUwFAG7XmOsfg9gg6gFwKrWECq
	n1UGQPYkoqEXbY6OwP+/lfJIT11RjVj3Iv13Jvo=
X-Google-Smtp-Source: AGHT+IGtNExBQDITOeAzpzI8w4wiEssGRxsB//UqmPRz3KcbPpLnhwKnSz7qACcQ4d6yB+nGNV/rrbvuMXfFRhBcNsI=
X-Received: by 2002:a5e:8815:0:b0:7bf:27ff:dadb with SMTP id
 l21-20020a5e8815000000b007bf27ffdadbmr1338144ioj.2.1705090420103; Fri, 12 Jan
 2024 12:13:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
In-Reply-To: <20240112193103.3798287-1-yosryahmed@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 12 Jan 2024 12:13:29 -0800
Message-ID: <CAKEwX=NPMcrg6tGFJ=avYXeYvu3yxBKkcxNQp1TBEYctcPXzmg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
> The z3fold compressed pages allocator is not widely used, most users use
> zsmalloc. The only disadvantage of zsmalloc in comparison is the
> dependency on MMU, and zbud is a more common option for !MMU as it was
> the default zswap allocator for a long time.
>
> In hopes of having a single compressed pages allocator at some point,
> and following in the footsteps of SLAB, deprecate z3fold. Rename the
> user-visible option so that users with CONFIG_Z3FOLD=3Dy get a new prompt
> with explanation during make oldconfig. Remove CONFIG_Z3FOLD=3Dy from
> defconfigs.
>
> Existing users, if any, should voice their objections. Otherwise, we can
> remove z3fold in a few releases.
>
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> ---
> I have limited understanding of Kconfigs. I modelled this after commit
> eb07c4f39c3e ("mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED"),
> but one difference is that CONFIG_Z3FOLD is a tristate. I made
> CONFIG_Z3FOLD_DEPRECATED a boolean config, and CONFIG_Z3FOLD default y
> so that it is on by default if CONFIG_Z3FOLD_DEPRECATED is selected. I
> am not sure if that's the correct way to do this.
>
> ---
>  arch/loongarch/configs/loongson3_defconfig |  1 -
>  arch/powerpc/configs/ppc64_defconfig       |  1 -
>  mm/Kconfig                                 | 13 +++++++++++--
>  3 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/=
configs/loongson3_defconfig
> index 33795e4a5bd63..89b66b6c6a1d5 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -85,7 +85,6 @@ CONFIG_ZPOOL=3Dy
>  CONFIG_ZSWAP=3Dy
>  CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=3Dy
>  CONFIG_ZBUD=3Dy
> -CONFIG_Z3FOLD=3Dy
>  CONFIG_ZSMALLOC=3Dm
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_MEMORY_HOTPLUG=3Dy
> diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/=
ppc64_defconfig
> index 544a65fda77bc..d39284489aa26 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -81,7 +81,6 @@ CONFIG_MODULE_SIG_SHA512=3Dy
>  CONFIG_PARTITION_ADVANCED=3Dy
>  CONFIG_BINFMT_MISC=3Dm
>  CONFIG_ZSWAP=3Dy
> -CONFIG_Z3FOLD=3Dy
>  CONFIG_ZSMALLOC=3Dy
>  # CONFIG_SLAB_MERGE_DEFAULT is not set
>  CONFIG_SLAB_FREELIST_RANDOM=3Dy
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 1902cfe4cc4f5..bc6cc97c08349 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -193,15 +193,24 @@ config ZBUD
>           deterministic reclaim properties that make it preferable to a h=
igher
>           density approach when reclaim will be used.
>
> -config Z3FOLD
> -       tristate "3:1 compression allocator (z3fold)"
> +config Z3FOLD_DEPRECATED
> +       bool "3:1 compression allocator (z3fold) (DEPRECATED)"
>         depends on ZSWAP
>         help
> +         Deprecated and scheduled for removal in a few cycles. If you ha=
ve
> +         a good reason for using Z3FOLD rather than ZSMALLOC or ZBUD, pl=
ease
> +         contact linux-mm@kvack.org and the zswap maintainers.
> +
>           A special purpose allocator for storing compressed pages.
>           It is designed to store up to three compressed pages per physic=
al
>           page. It is a ZBUD derivative so the simplicity and determinism=
 are
>           still there.
>
> +config Z3FOLD
> +       tristate
> +       default y
> +       depends on Z3FOLD_DEPRECATED
> +
>  config ZSMALLOC
>         tristate
>         prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
> --
> 2.43.0.275.g3460e3d667-goog
>

FWIW:
Acked-by: Nhat Pham <nphamcs@gmail.com>
