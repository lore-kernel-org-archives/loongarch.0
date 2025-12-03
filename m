Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56E42882D6
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755212; cv=none; b=g9RTV5z/XaVKuO3c/1Q6R2zv5d48Lg1bp8gAdzDsHC87NV9QfQ3Hfc0z1rch3fqrCsQM0qft1454Ls0O60qIgpGz05116gR4IF1Yo7Vv9KLt934NI4cfY4B78E8C9FsNwh1j8CsCeks6mR5mSd9m9rqWYDbKPHgmCL43z7kKSBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755212; c=relaxed/simple;
	bh=iTJPNS21QAgyxcFdz8sjw4zAZJizqRkyHSb23BoW7bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KyTOqMzQJgKhfoPHuqAtT0gaNVAO+kOD6sXzSah+WK/NhzgJ31LQD5ghvhvyK8eOmWclGF1Lgu+JhWh2R6SxPYpsNBPeW+C30t6yEDXnMi51tEvAJUwyOno0yRUj0njApcSsATN6lSafDoS7g4PIngnmJYE0v02JaX7pORe6Q7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ng8is6Ou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ng8is6Ou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655A1C19423
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 09:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764755212;
	bh=iTJPNS21QAgyxcFdz8sjw4zAZJizqRkyHSb23BoW7bU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ng8is6OuZhNwnrIjSqcbeOKYNnzG2fUYASWPnMw9khpS0xo1rflRo9+U8DD6xdEZd
	 iQ0ryUCW199MqrVye04sgNi5mRA3ytMu93aq+pOgqaUaup9HZfvQyM0dZ4fyV3XZt/
	 VRx+GRBs0Be7LX4ZeLo8xwFQjn/NnHLThQArtvPDQvmODinFkWI6Z+vmm2gvmwP4QA
	 WFg+/gYXiTaFYm/bLzRYe00rjRvTsEnNdjvVFNc2xddlmGnVCkzhRH+g3t6HEB7GTD
	 tcF7Wnb9FzKOycTr6VKxBjvyU+hqESMrNzjYsDrvo4d0ecmm9YYIYkHUXGlpXlk0b0
	 5wB5DlN9QqzRA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b79b9113651so389837666b.3
        for <loongarch@lists.linux.dev>; Wed, 03 Dec 2025 01:46:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpOdFHDywGhHEDA9Pt8MY58r2R1VzT+W3oRptpPsBxXFj5iyrthtrFi73/1hLAMBD+kZVz9GUdCRc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxaw6yHMUvv2pNqf5qETUM8iVZBEziWZ5z3eH2g20jEhZmPE3uC
	O45mkbHitUrRtZTaJ8yVDUCNMy/4NeTGMcHtXgw4A0H2XfC0ihEdM9/iq2XpM9WkvycHZ/F4BjX
	5AyD68Fs1T7kXeWYekbmzfNPmGX8yMAY=
X-Google-Smtp-Source: AGHT+IGrL6RBlZT5o0F6/Dbpjp/XqtON4tBrqOGWpa+01LlIBwfByFsG87u09wtkNtYYQZsjHDLCtK6ak25nek1NnY8=
X-Received: by 2002:a17:907:6d21:b0:b76:4bde:c9df with SMTP id
 a640c23a62f3a-b79dc4b4aa1mr173126766b.14.1764755210983; Wed, 03 Dec 2025
 01:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203092849.130284-1-wangyuli@aosc.io>
In-Reply-To: <20251203092849.130284-1-wangyuli@aosc.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 3 Dec 2025 17:46:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4eYuH1rsD+-vRzPJ8tiEEx-Y_LL55ozcA5odXQKxqojQ@mail.gmail.com>
X-Gm-Features: AWmQ_bm5CfZZeDUUlpCz8SPoVNsftYehzjbgOVrxXZ6B5eRLfiRZT-e1fTyh3Mk
Message-ID: <CAAhV-H4eYuH1rsD+-vRzPJ8tiEEx-Y_LL55ozcA5odXQKxqojQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Use __pmd() helper for __swp_entry_to_pmd()
To: WangYuli <wangyuli@aosc.io>
Cc: kernel@xen0n.name, akpm@linux-foundation.org, david@kernel.org, 
	willy@infradead.org, bjorn@rivosinc.com, agordeev@linux.ibm.com, 
	zhangtianyang@loongson.cn, apopple@nvidia.com, thuth@redhat.com, 
	linmag7@gmail.com, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WangYuli <wangyl5933@chinaunicom.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yuli,

On Wed, Dec 3, 2025 at 5:29=E2=80=AFPM WangYuli <wangyuli@aosc.io> wrote:
>
> From: WangYuli <wangyl5933@chinaunicom.cn>
>
> The __pmd() helper macro provides the correct initialization syntax
> and abstraction for the pmd_t type.
>
> Fix follow warning on gcc-15 under specific configs [1] :
>
>   In file included from ./include/linux/pgtable.h:6,
>                    from ./include/linux/mm.h:31,
>                    from ./include/linux/pagemap.h:8,
>                    from arch/loongarch/mm/init.c:14:
>   ./include/linux/swapops.h: In function =E2=80=98swp_entry_to_pmd=E2=80=
=99:
>   ./arch/loongarch/include/asm/pgtable.h:302:34: error: missing braces ar=
ound initializer [-Werror=3Dmissing-braces]
>     302 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE=
 })
>         |                                  ^
>   ./include/linux/swapops.h:559:16: note: in expansion of macro =E2=80=98=
__swp_entry_to_pmd=E2=80=99
>     559 |         return __swp_entry_to_pmd(arch_entry);
>         |                ^~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>
> [1]. https://download.01.org/0day-ci/archive/20251119/202511190316.luI90k=
Ao-lkp@intel.com/config
>
> Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
> ---
>  arch/loongarch/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index 03fb60432fde..4e09f7e8bbec 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -299,7 +299,7 @@ static inline pte_t mk_swap_pte(unsigned long type, u=
nsigned long offset)
>  #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)  ((pte_t) { (x).val })
Why not change __swp_entry_to_pte() together with __pte()?

Huacai

>  #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
> -#define __swp_entry_to_pmd(x)  ((pmd_t) { (x).val | _PAGE_HUGE })
> +#define __swp_entry_to_pmd(x)  __pmd((x).val | _PAGE_HUGE)
>
>  static inline bool pte_swp_exclusive(pte_t pte)
>  {
> --
> 2.51.0
>
