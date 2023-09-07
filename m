Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92F77EC
	for <loongarch@lists.linux.dev>; Thu,  7 Sep 2023 01:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6453EC4339A
	for <loongarch@lists.linux.dev>; Thu,  7 Sep 2023 01:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694050581;
	bh=D3nVWOHhkmhoY1EX23mvCZ4eZ9Olrv5+jxHtY3gqvxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P1gtcAM6iZmE3GfcXb/9pte/84Tcj3t9MNhDtQFy5LOEur+TW95AAuWBqWTh4Noic
	 Akj2UjAmkTR6IGsppAc9MXTeexO/ZY7yojVVm1cuD+IEWYV9cPmIRszAqz/JpiG6q3
	 v4TkGwFB9nhHnAL3U/uMcPdz9bqQgO8p31885G22WufqWvRuuvey3naVHR+Uz2u4fK
	 E7nKI4HiJYIxTCpcMbL9mFSMWvfjT1wByHyENPRwO4cV/iEDcVjiZEofU05Qq0z/Gl
	 T9IP35rvHmuucaHlbDSgrRPz0h4sth/6EMTy6VW74tebPe+Tv7Ta+yzy2sqzSfu18e
	 jnUh1xztmKtPQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-500b66f8b27so662411e87.3
        for <loongarch@lists.linux.dev>; Wed, 06 Sep 2023 18:36:21 -0700 (PDT)
X-Gm-Message-State: AOJu0YzOQAPwwrH7gi5cBPK2/06oOMm7KSrtDJ2wzUVsnJq3RiLV0aY3
	atk4tpaP3tx0DkoifrZG9RVLb1VegaTFDG6xHLU=
X-Google-Smtp-Source: AGHT+IEE0i+eB6sNRcbbEyXiXfFXLSIfEkkJMaD0vlDSf4gvKImXgs9G/kfMt+ocLBAs/OSMT/+a3RH2B95xohcvqbM=
X-Received: by 2002:a19:6514:0:b0:500:a0a3:80ff with SMTP id
 z20-20020a196514000000b00500a0a380ffmr3615526lfb.58.1694050579372; Wed, 06
 Sep 2023 18:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230906092019.4681-1-zhanghongchen@loongson.cn>
In-Reply-To: <20230906092019.4681-1-zhanghongchen@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 7 Sep 2023 09:36:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H54scsYV_jCVY_SQ8VVRpjuDreTtJ5d1JvQFNmr59_5hQ@mail.gmail.com>
Message-ID: <CAAhV-H54scsYV_jCVY_SQ8VVRpjuDreTtJ5d1JvQFNmr59_5hQ@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: add p?d_leaf() definitions
To: Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, "Mike Rapoport IBM)" <rppt@kernel.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	"Matthew Wilcox Oracle)" <willy@infradead.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-next, thanks.

Huacai

On Wed, Sep 6, 2023 at 5:20=E2=80=AFPM Hongchen Zhang <zhanghongchen@loongs=
on.cn> wrote:
>
> When I do LTP test, LTP test case ksm06 caused panic at
>         break_ksm_pmd_entry
>           -> pmd_leaf (Huge page table but False)
>           -> pte_present (panic)
>
> The reason is pmd_leaf is not defined, So like
> commit 501b81046701 ("mips: mm: add p?d_leaf() definitions")
> add p?d_leaf() definition for LoongArch.
>
> Fixes: 09cfefb7fa70 ("LoongArch: Add memory management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> ---
> v2->v3: add Cc: stable@vger.kernel.org
> v1->v2: add Fixes in commit message
> ---
>  arch/loongarch/include/asm/pgtable.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index 370c6568ceb8..ea54653b7aab 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -243,6 +243,9 @@ static inline void pmd_clear(pmd_t *pmdp)
>
>  #define pmd_phys(pmd)          PHYSADDR(pmd_val(pmd))
>
> +#define pmd_leaf(pmd)          ((pmd_val(pmd) & _PAGE_HUGE) !=3D 0)
> +#define pud_leaf(pud)          ((pud_val(pud) & _PAGE_HUGE) !=3D 0)
> +
>  #ifndef CONFIG_TRANSPARENT_HUGEPAGE
>  #define pmd_page(pmd)          (pfn_to_page(pmd_phys(pmd) >> PAGE_SHIFT)=
)
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE  */
> --
> 2.33.0
>
>
