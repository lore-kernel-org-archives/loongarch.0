Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D052C68C
	for <loongarch@lists.linux.dev>; Mon, 15 Jan 2024 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="cWO7muAy"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5cdfbd4e8caso6615612a12.0
        for <loongarch@lists.linux.dev>; Mon, 15 Jan 2024 04:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1705321625; x=1705926425; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AVaqD1kmny+a3DzzxHWWVHP6DeI42FQlUciU6OC6AY=;
        b=cWO7muAypbzRkJxWbDb+VaLDZrddI8v2V3eqdEMKagkpE75opYBEDOFkRAP094WPmX
         94TrSPfJk/1R8N1F/rU4rCLWDloqCIknOQrxgyDsI8bDMaAjoyjp7bbEXHjrxCFi7Ggh
         BU+pDsYnVdKPjOhWGlnNZuZpgZUjwRAa7k9eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705321625; x=1705926425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AVaqD1kmny+a3DzzxHWWVHP6DeI42FQlUciU6OC6AY=;
        b=AcO95qIw7YT62rSsIDgmzw3X7ZvQ51uq/5vc0JVxJP8O368KYb+1CDr56G76hysQVp
         jQsu2WBUBpwC8E+ZYaF03rFe5kdtc6q1y+ZEYvmwaBkvEA4lYPHj9W4NmD6fRud55z60
         h7GBYgVGAZ4StnSiraj6p3q23h6sR+2qqzZkWB/g8fluHfAz2kOIPwiuir9tokwF6Qa9
         YxrBbfXypqIW5DzualJELpS+3qbsxIiXaVU5gtUgBzhYPSZpENXVasuAgyk3+udWrvbj
         JvsJp8Tk4Oo/Fa2dvJv52OVo0Kle0stjeYDMybpf8/piQi5+m2vlhG+ZGHwj9LRpSJWV
         S9MQ==
X-Gm-Message-State: AOJu0Yx4YUCGkrxUmnYr37z59RdMRkGB/G4cPmbD0uaMMtPInzVdUz6c
	o71uZLs0s+QqvN2LJXJfNJCzanZvzer2mk8G6nE3tsU3fjY7hA==
X-Google-Smtp-Source: AGHT+IFPnDgL7DMkEwUE4dB1cOrEAgUyagMefPltAmMUPrI7hNPG4cAw+4d4SULhubx12ACgLhys+J9MpMdMa9fB8tI=
X-Received: by 2002:a05:6a21:3949:b0:19b:1d4a:c4bc with SMTP id
 ac9-20020a056a21394900b0019b1d4ac4bcmr347314pzc.96.1705321625515; Mon, 15 Jan
 2024 04:27:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
In-Reply-To: <20240112193103.3798287-1-yosryahmed@google.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Mon, 15 Jan 2024 13:26:54 +0100
Message-ID: <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 8:31=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
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

I believe that having a single compressed pages allocator is a false goal.

> Existing users, if any, should voice their objections. Otherwise, we can
> remove z3fold in a few releases.

At this point I NACK this patch. We're about to submit an allocator
which is clearly better that z3fold and is faster that zsmalloc in
most cases and that submission will mark z3fold as deprecated. But for
now this move is premature.

Best,
Vitaly

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
