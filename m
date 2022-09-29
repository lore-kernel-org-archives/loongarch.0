Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67958111D
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 11:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13043C43142
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 11:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664451765;
	bh=R8C++G9yVjwgvqMjhqRqKMSuZQfilkNzr6uk/kuxuGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WH9SOjOmqxgO/Nwf83BfzJWn5pkQQfwFvgx65m+fn9DJDuAcKYQlmTm+C9b/mTtGa
	 8IbSW0gag5BPck7AsAk066x0N0zBmt6LtVh/ZEFVkkdG80vv3nT0JptzWmr0oa9gTB
	 VD9glJMAcl3uz8Wo66wCjItA04eH3/3MnbP4aWfH1RFKpY9zhQBxkNntPOrbdeY/0H
	 HE6+Wum5r/yAcTKiP8w4aBYb/bZ7Rh49CHnAFbHhPIaA9eWe5dQ71MftDCv9dkAzJm
	 lXkR8CCI+TdXH/Mpmx0fYFjwq/luE+jfNxP6mqkfMmfU/V6gIkGo9n1xFJAnJ79xLt
	 ii18tkDND6oVQ==
Received: by mail-vs1-f54.google.com with SMTP id d187so1197305vsd.6
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 04:42:45 -0700 (PDT)
X-Gm-Message-State: ACrzQf3d3J+9kdvljE5UJi7YFz0zhLpFTHnjCXnIUaqlQU3XufF8Zr7e
	aoJNzrs+Y7r8fDfcBM1DpVELbLTT+0dKqI4C9G0=
X-Google-Smtp-Source: AMsMyM6Nnt8ZdRe8FMdHl/JPv1eHTDU5Op0EUXbvFWEy78GzfWHyiNuR27dKEVd0bqvRZVt7fePlnxU/4+oWz5pRMMM=
X-Received: by 2002:a05:6102:1481:b0:39a:67f5:3096 with SMTP id
 d1-20020a056102148100b0039a67f53096mr989910vsv.70.1664451763903; Thu, 29 Sep
 2022 04:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929112318.32393-1-zhengqi.arch@bytedance.com> <20220929112318.32393-3-zhengqi.arch@bytedance.com>
In-Reply-To: <20220929112318.32393-3-zhengqi.arch@bytedance.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 29 Sep 2022 19:42:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H76pOCs2uAA6y1JB+-uwASDBTWk-zaheGdG+ap-4HUZxA@mail.gmail.com>
Message-ID: <CAAhV-H76pOCs2uAA6y1JB+-uwASDBTWk-zaheGdG+ap-4HUZxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] LoongArch: update local TLB if PTE entry exists
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, maobibo@loongson.cn, chenhuacai@loongson.cn, 
	songmuchun@bytedance.com, david@redhat.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, loongarch@lists.linux.dev, chris@zankel.net, 
	jcmvbkbc@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi, all,

Should this patch go via mm tree or loongarch tree? If via mm tree, then

Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Thu, Sep 29, 2022 at 7:23 PM Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>
> Currently, the implementation of update_mmu_tlb() is empty if
> __HAVE_ARCH_UPDATE_MMU_TLB is not defined. Then if two threads
> concurrently fault at the same page, the second thread that did
> not win the race will give up and do nothing. In the LoongArch
> architecture, this second thread will trigger another fault,
> and only updates its local TLB.
>
> Instead of triggering another fault, it's better to implement
> update_mmu_tlb() to directly update the local TLB of the second
> thread. Just do it.
>
> Suggested-by: Bibo Mao <maobibo@loongson.cn>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  arch/loongarch/include/asm/pgtable.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> index 8ea57e2f0e04..946704bee599 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -412,6 +412,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>         __update_tlb(vma, address, ptep);
>  }
>
> +#define __HAVE_ARCH_UPDATE_MMU_TLB
> +#define update_mmu_tlb update_mmu_cache
> +
>  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>                         unsigned long address, pmd_t *pmdp)
>  {
> --
> 2.20.1
>
>
