Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903371C4612;
	Wed, 30 Oct 2024 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730331684; cv=none; b=R1BsczbyLyWtAkeky0AamtijmdKZpzKj7qG88m4zjn86HXdBTp1vEOfL7tn8RvFjU3uG02mETB0kfwVZ1cD0yUJVOd0Z3pYIYCQjV8veNTxWb6sloGr0sEZoTc76EaP53MMzpV47saLTOdfcQkEP+WsKDD/UNCNGrpoLwE8ZzlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730331684; c=relaxed/simple;
	bh=bbGa8L383lbBHyiX3dMUYYHXFwaxWhrTdBBmLqW48J8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gIiHSzo0f5r4TuQCcxSYnYPZUZYVGALetDz7cayf1U+TKhaoI4OM1uwIkPoNQInj1FCTAVlWP+hpIGPy3bJntxYEnuiSvDRASND3kClaFTDqLo5S8dNx/qyXvOoKMIMaL84buEEowRlblqa2H26FLxr6U9IS4VqdhfgKy4g3Wok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KzprbEYD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KzprbEYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C40C4E68E;
	Wed, 30 Oct 2024 23:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1730331684;
	bh=bbGa8L383lbBHyiX3dMUYYHXFwaxWhrTdBBmLqW48J8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KzprbEYDbxB04AfEtJScziuD6t4EHGGSEhCsnxN8O4l6QWKNUXdr7Z2UyYJqP34dg
	 Gv7/T4XGD1ziHIKkJA0Jpt/ax0qa2gOv14famm7QpvDe/56jO5X/MOq2sFSKhyPmO7
	 fFpWpdDYMvLRzlh8ztA/3+aPso7SxopvzMtSbFwc=
Date: Wed, 30 Oct 2024 16:41:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Bibo Mao <maobibo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com,
 Alexander Potapenko <glider@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH v2] mm: define general function pXd_init()
Message-Id: <20241030164123.ff63a1c0e7666ad1a4f8944e@linux-foundation.org>
In-Reply-To: <20241030063905.2434824-1-maobibo@loongson.cn>
References: <20241030063905.2434824-1-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Oct 2024 14:39:05 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -267,8 +267,11 @@ extern void set_pmd_at(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp, pm
>   * Initialize a new pgd / pud / pmd table with invalid pointers.
>   */
>  extern void pgd_init(void *addr);
> +#define pud_init pud_init
>  extern void pud_init(void *addr);
> +#define pmd_init pmd_init
>  extern void pmd_init(void *addr);
> +#define kernel_pte_init kernel_pte_init
>  extern void kernel_pte_init(void *addr);

Nitlet: don't we usually put the #define *after* the definition?

void foo(void);
#define foo() foo()

?



