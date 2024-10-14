Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D11146D45
	for <loongarch@lists.linux.dev>; Mon, 14 Oct 2024 06:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728887475; cv=none; b=mCwrE336XhmsQAJp/iGsN8O7FZfz63m5B1wmvcbxJwQJoBA42nAX0p5Ic8/SRSr3rdgIsVBjC7rdaBJMgpALx3tzBPli96ZCgT11c8nmX5Crs/Rok6ezuny53o50W7wQMev7r/F41Uqll/mK0xcl59gQPQ1fYkOwB9pcrhbEwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728887475; c=relaxed/simple;
	bh=gtdpBTeQLmr18gVrhQkVp+R+fm5FD66vp+1RtcWutpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lT9UG0pn9P/dD9lCrQE7eDhlhDgdB9dGodDosfkZ+UnNiQqra8XGbIEkM7psCBDG6JxqNCI88gGGl0fkGK/G3VEtlgqyb3J46k2TlVX0fi5MJrgR8fVsZitmUnE+//JIwJEudIONci87Y6NHEiRUGlmxFJ+vG/C2mqPbcgKAJjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuQhmyUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuQhmyUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68400C4AF0B
	for <loongarch@lists.linux.dev>; Mon, 14 Oct 2024 06:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728887475;
	bh=gtdpBTeQLmr18gVrhQkVp+R+fm5FD66vp+1RtcWutpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HuQhmyUsxHFQosKnFrRPoQFxO3qFr4NwggE3ksPLx9oycfgViN4ZTGJhLXWsXjIU8
	 ntd66f/prdD5VrSjGyi8nFxZJ7bsfnabc/eF6nTwdYcCayDM+k3NnFSi4wMVAcgj6s
	 wFPB2arEtAtaA6TIH3dwaiS+ZTflir5FESdte65uqM3CA6BRjq4Ka/ZL8RMydvqYb9
	 M/6a5G6LyV3jlpHLZfwQwqi0L7ufQpe9rT+tni85EGxSDpe2l4DzkPzvZpbTLGsclq
	 HDxhLzrC78sANOS0fHx+dcoJ/mWVzdGfzwrQX6y8K0lu+y+O9TlqQbdbs5OGg38xKg
	 jOBE/IrYJZI4w==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so48219781fa.2
        for <loongarch@lists.linux.dev>; Sun, 13 Oct 2024 23:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEk1GWQQjhN3fJYYDhjs3Ms1wcfRnlNAAic6SqcpDzEErbqGT0VJNxpEFvCbtR/sfGht3O9SCnrKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPI9BK8FJqDf36eGQmH7TFHXZObCc4wAdX0tDg+/x03sbz8ff+
	Rp4gPTSrHz0YHbWozMmCg7P9cbT0iXr77WESmFzTwroeonhkTvyci+8jmpiBnCTG5xnT6v7uZSa
	sFtSgHkW2TLdZJJBK5REHazZTX7I=
X-Google-Smtp-Source: AGHT+IE2ikZfTCj1ldIG4d5HvpoPlo2JvKFiNjMNNj8Hkiza0u+9foosUHeMoLBWDVDJbRUUk8gLgI7f1jDWzR6Lh6E=
X-Received: by 2002:a05:6512:1598:b0:530:b773:b4ce with SMTP id
 2adb3069b0e04-539e551a25emr2964252e87.33.1728887473738; Sun, 13 Oct 2024
 23:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014035855.1119220-1-maobibo@loongson.cn> <20241014035855.1119220-3-maobibo@loongson.cn>
In-Reply-To: <20241014035855.1119220-3-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 14 Oct 2024 14:31:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6nkiw_eOS3jFdojJsCJOA2yiprQmaT5c=SnPhJTOyKkQ@mail.gmail.com>
Message-ID: <CAAhV-H6nkiw_eOS3jFdojJsCJOA2yiprQmaT5c=SnPhJTOyKkQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] LoongArch: Add barrier between set_pte and memory access
To: Bibo Mao <maobibo@loongson.cn>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

On Mon, Oct 14, 2024 at 11:59=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
> It is possible to return a spurious fault if memory is accessed
> right after the pte is set. For user address space, pte is set
> in kernel space and memory is accessed in user space, there is
> long time for synchronization, no barrier needed. However for
> kernel address space, it is possible that memory is accessed
> right after the pte is set.
>
> Here flush_cache_vmap/flush_cache_vmap_early is used for
> synchronization.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/include/asm/cacheflush.h | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/cacheflush.h b/arch/loongarch/inc=
lude/asm/cacheflush.h
> index f8754d08a31a..53be231319ef 100644
> --- a/arch/loongarch/include/asm/cacheflush.h
> +++ b/arch/loongarch/include/asm/cacheflush.h
> @@ -42,12 +42,24 @@ void local_flush_icache_range(unsigned long start, un=
signed long end);
>  #define flush_cache_dup_mm(mm)                         do { } while (0)
>  #define flush_cache_range(vma, start, end)             do { } while (0)
>  #define flush_cache_page(vma, vmaddr, pfn)             do { } while (0)
> -#define flush_cache_vmap(start, end)                   do { } while (0)
>  #define flush_cache_vunmap(start, end)                 do { } while (0)
>  #define flush_icache_user_page(vma, page, addr, len)   do { } while (0)
>  #define flush_dcache_mmap_lock(mapping)                        do { } wh=
ile (0)
>  #define flush_dcache_mmap_unlock(mapping)              do { } while (0)
>
> +/*
> + * It is possible for a kernel virtual mapping access to return a spurio=
us
> + * fault if it's accessed right after the pte is set. The page fault han=
dler
> + * does not expect this type of fault. flush_cache_vmap is not exactly t=
he
> + * right place to put this, but it seems to work well enough.
> + */
> +static inline void flush_cache_vmap(unsigned long start, unsigned long e=
nd)
> +{
> +       smp_mb();
> +}
> +#define flush_cache_vmap flush_cache_vmap
> +#define flush_cache_vmap_early flush_cache_vmap
From the history of flush_cache_vmap_early(), It seems only archs with
"virtual cache" (VIVT or VIPT) need this API, so LoongArch can be a
no-op here.

And I still think flush_cache_vunmap() should be a smp_mb(). A
smp_mb() in flush_cache_vmap() prevents subsequent accesses be
reordered before pte_set(), and a smp_mb() in flush_cache_vunmap()
prevents preceding accesses be reordered after pte_clear(). This
potential problem may not be seen from experiment, but it is needed in
theory.

Huacai

> +
>  #define cache_op(op, addr)                                             \
>         __asm__ __volatile__(                                           \
>         "       cacop   %0, %1                                  \n"     \
> --
> 2.39.3
>
>
