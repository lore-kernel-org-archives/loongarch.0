Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844A3ED8C
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 22:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155E5C433C8;
	Tue, 13 Jun 2023 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686694614;
	bh=u1U2JS+u6wM6OBhkKijCKkdxF/PQ2U4e1EnjjkO0qgU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hQuqhvJn3yNLy2Olxjnd1xuxCkh0wfTthUElblk3SWD5APhbp2A8h/GrhfZUDe0CA
	 msAOI8lTM4SDCJH4Jw/egXw9kHffrgpSBDU2Lq/B7FL9Ncb4kZlGiVq95JuesT+7qf
	 YEh5WOURMYPSU7yAQJlo+F3GFXuLwUg0ZCA7ynIU6Zby2JiopTRsMlBw6pN58eDxfr
	 P7S7QpyZ+fotvuzUysUkJnW2doGlPUjxnxuveW2tzsGyBUdpBclirEyYiSIpPiSYAo
	 M8uN4PP8S1NMMmXoKD0EuORe3OhQDCHvxGL87kEJWcKBMzzECpxbOCX8TRFljoINsE
	 8Ubz3n0NLn6FQ==
Message-ID: <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
Date: Tue, 13 Jun 2023 17:16:50 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-28-vishal.moola@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20230612210423.18611-28-vishal.moola@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/23 16:04, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>   arch/nios2/include/asm/pgalloc.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
> index ecd1657bb2ce..ce6bb8e74271 100644
> --- a/arch/nios2/include/asm/pgalloc.h
> +++ b/arch/nios2/include/asm/pgalloc.h
> @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
>   
>   extern pgd_t *pgd_alloc(struct mm_struct *mm);
>   
> -#define __pte_free_tlb(tlb, pte, addr)				\
> -	do {							\
> -		pgtable_pte_page_dtor(pte);			\
> -		tlb_remove_page((tlb), (pte));			\
> +#define __pte_free_tlb(tlb, pte, addr)					\
> +	do {								\
> +		pagetable_pte_dtor(page_ptdesc(pte));			\
> +		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
>   	} while (0)
>   
>   #endif /* _ASM_NIOS2_PGALLOC_H */

Applied!

Thanks,
Dinh
