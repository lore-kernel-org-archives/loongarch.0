Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5FA15AFD
	for <loongarch@lists.linux.dev>; Fri, 12 Jan 2024 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGLT1kIM"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7bedd61c587so135122439f.2
        for <loongarch@lists.linux.dev>; Fri, 12 Jan 2024 11:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705088573; x=1705693373; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jBwE7Jt9seeB7l4z11oYjZwnUcDEcCEvTkM2Ir2NMI=;
        b=WGLT1kIMxEf9aQRYOq4+gOOQ7o/PD9pTKbQUzQQZDBj5ySpIU8NwCTylEdgKbohHu/
         EOAYr5FpkMsD+2DtkuhYpY4Nu6ztkSoF6E1UErG6hs/R6XsVNJDLs3aj/9GOqfkR7EAh
         fLrEBVvioUKCdORwS7Lw4coIRbEJBGLqBtdeQFVorVTnF1wxs+PO69McEGeX86o/Qrba
         GOGzOSzr+8OvBcOzVWTcUez4pi0WSz3b+8o8SsUSJmYAO7OP2GzNZugRbAhejdr6O6YJ
         4wyIVhugpcZek/bkq4TdOkVw0BmIvjJOfXHlWn4QXe5AQEuEeplv1Py23CkdCnzr8rmU
         Q7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705088573; x=1705693373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jBwE7Jt9seeB7l4z11oYjZwnUcDEcCEvTkM2Ir2NMI=;
        b=wtvSOiAgyyMP6bnmDQeMCfxR+cWIDg04X88qw526dlKfj1/3Of+gzaSMa+MbvzOA1H
         ksmxp+Bj+pLKqI5N5ggS604GJRty2xJn4nDua7VCkiFLuL6ypsU7E2ZNfxuu7Qg/RwNG
         9dkOyc8icKI8GZx7JXv+hiuAfha4mkOrYknK2WzwZ/zmmoAqEC3MmuRgxD8Pl563JIU+
         R8m8Z7xweZSPcc/Ffa6XkJ6DfcY9KjDhT9ZvVC+WA2+8GmjOmQ43wCJfbVI2+nj2LEDa
         Svim26A/Mg8Y2MzDryyhafX8USO8LC5MrMpmh0GeObwOXTc0FUOGG7SXxVJTAtiaVuMw
         UfkA==
X-Gm-Message-State: AOJu0YxA8gnDBq5QLeYZl+TahEZYiUguR4l1im+uVA4qYM1VrdbipMaF
	9CXP6sQPqtC5orTz1VS41JJD1jigQHYiTTDLbT8=
X-Google-Smtp-Source: AGHT+IHfCfBeIKefE1pIXMRHJc5enwSKf3AqqH1Q2r68AUAgrpkc5+s5bMgmxMzoF9BtYalbpQtcdFcbOtmlcSPYcNU=
X-Received: by 2002:a5e:dd09:0:b0:7be:f53e:4dbc with SMTP id
 t9-20020a5edd09000000b007bef53e4dbcmr2169399iop.28.1705088573558; Fri, 12 Jan
 2024 11:42:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
In-Reply-To: <20240112193103.3798287-1-yosryahmed@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 12 Jan 2024 11:42:42 -0800
Message-ID: <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
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

Johannes and I were chatting about this the other day. We might be
able to disable certain zsmalloc behavior in the case of !MMU, making
it available there too. Once that's happened, we can outright remove
z3fold and zbud, and have one allocator to rule them all? :)

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
