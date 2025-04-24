Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A591E14B06C
	for <loongarch@lists.linux.dev>; Thu, 24 Apr 2025 18:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520538; cv=none; b=XGKV0ta+MdHqzZdEEncRvQ+y9OwPhYgf71zo0/BQP1bMJs+gxp9LCpbx6CDTaZmwBojrfik1pgz4JjyUYa3tcifpWUjTuApkwStJjQxlR8K9TXjFVk+jQOrY8/utF1m4GZhEQLjURpHMiNjBFDEQbSfdPExO40wJ+mF2rYunWRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520538; c=relaxed/simple;
	bh=eHlHAQeQbDfCFfKwU3uoAXUThY467wmu8bWBncwoL7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=S/ONhqr2yBLVto/Lhu4mhUk+9DxQSr78V3RsjeCCkgUo0cgD+DxfsOakKmsQ4lahdKjJ6ciX3RVcctQ0vit4O851q49/JzmGJem3MGauKSxNbMMgYQf7Cy07Z6si0EM1z0JfNBq7Asnuqp/vWIBPt5IzgMHtcCN1wiORCvbH6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JxF+8cfw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JxF+8cfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745520535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CIsAhVnMQMAgsCImJP25I4m3E7RhssUalv/w6kh8Bxw=;
	b=JxF+8cfwOTyhq3UpNbKGQMioTQhTwGiZ3M4mRyzSIAOSs4utqPyVepEgDVx4dVIwu2/eur
	aGTKaE1FivBcM21Li7nezz5nOZUa8rqE9qs0tg1Pt9YFPeOs6v1MOujUFaF18gYkQtxGNZ
	S6Q/kEKMMr6xPMNJSPw9E9SzoiOQrzk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-SDUNV7GoPg6LIT-Kelgivg-1; Thu, 24 Apr 2025 14:48:54 -0400
X-MC-Unique: SDUNV7GoPg6LIT-Kelgivg-1
X-Mimecast-MFC-AGG-ID: SDUNV7GoPg6LIT-Kelgivg_1745520533
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c7056506so25147676d6.1
        for <loongarch@lists.linux.dev>; Thu, 24 Apr 2025 11:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520533; x=1746125333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIsAhVnMQMAgsCImJP25I4m3E7RhssUalv/w6kh8Bxw=;
        b=ARx5Es6w4KGw95qk11ecr6w7SkOY3c2vltVYGW7LnCxVlS9m38H/ZkL6+qS7Fxm5Si
         ulkpoG5qC6jPuJZ9Mc3PVGAqcl/OuVRHc/SajzA94ez1h7ncMZzxqmZFo4u0Ydoq50lH
         czou/2LEUaksAc0JbXv/tp2S0yCtJPfWDcY4ZSxreJN83KSlhuM/Pl4HdUnA8JmUNU2B
         zQH88DtJ7lAPL7RWsTf5TBpxIbuUmWV0QSBR4X3myPmzjbs4sn/LxGTEQ5VD9qoFj0k+
         B3Q92EnjsL5j3jlHqv/vikTqQv4qhzecXI5/ErGAPWETrL4MJsqA5bA2AHU6uKdkuM9w
         lfSA==
X-Forwarded-Encrypted: i=1; AJvYcCUlLBNJklAEXiCNEnCOQD6Bgu8zr5O3d4b9LwSD/MAC7D524iA4raK/ycOk1d1IJ9KqaidNDYRfOAs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyN+qPVBzyv8XhdeET5fElFwLfUexFyzi2HQK2QU/2iHQMgF0Vw
	ZPCiYgtMGoOXumC1r75rmrwikWYxFUs157on1lYhKvfhJKq8OwbAxsmlVlGStECxMfE5maCdvmM
	VgsNuNiBJUsSv2t+aT0u3MTReD33QF+uOdSvBRm7F3m9p2kcoBw1xNP7yfA==
X-Gm-Gg: ASbGncsESsIfo3SoeGRGhS8649fgl00tsPseiHNR/T90aYpILI+Px+7RFKYf2vCAVXR
	7cs6ayGu9HUkEwvFupQ6gAK9PRgI7EkLYmEBiLW++XFyT2EXdu5VlE8C21Hgnm2VriqtnrHL3UY
	auFnTmuAIYJXdBubWU9dyjaYlCINNukzCau+rT8wwnqCDpPVfhRnoh98x8G0J5of9txr6bhOo+y
	J6j569/ALFZiSgB63K2cl5RTKb6DZs2jjmPel6otvNIpltnO4SvSXrdrhjd8FoPlROax3WnqNJ4
	IpQ=
X-Received: by 2002:ad4:5dcc:0:b0:6e8:feae:929c with SMTP id 6a1803df08f44-6f4bfc0a8b0mr61445896d6.21.1745520533445;
        Thu, 24 Apr 2025 11:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH17C4USZR112eySO3Y6G9ihn+PwxF/2KrtX6D43iXldDZU8YpYtRibl9+FniISbEuiNDXIRQ==
X-Received: by 2002:ad4:5dcc:0:b0:6e8:feae:929c with SMTP id 6a1803df08f44-6f4bfc0a8b0mr61445676d6.21.1745520533154;
        Thu, 24 Apr 2025 11:48:53 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c8bf73b9sm2826156d6.25.2025.04.24.11.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:48:52 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:48:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Ming Wang <wangming01@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	lixuefeng@loongson.cn, gaojuxin@loongson.cn, chenhuacai@loongson.cn
Subject: Re: [PATCH] mm/hugetlb: LoongArch: Return NULL from
 huge_pte_offset() for none PMD
Message-ID: <aAqHkdXt50van31B@x1.local>
References: <20250424083037.2226732-1-wangming01@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250424083037.2226732-1-wangming01@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8LmjZzYpVnDUw1cb0KwJ4yuqAjbvaP-MPT2z38Vb3Ic_1745520533
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 24, 2025 at 04:30:37PM +0800, Ming Wang wrote:
> LoongArch's huge_pte_offset() currently returns a pointer to a PMD slot
> even if the underlying entry points to invalid_pte_table (indicating no
> mapping). Callers like smaps_hugetlb_range() fetch this invalid entry
> value (the address of invalid_pte_table) via this pointer.

So it's in smaps_hugetlb_range() context, then..

> 
> The generic is_swap_pte() check then incorrectly identifies this address
> as a swap entry on LoongArch, because it satisfies the !pte_present()
> && !pte_none() conditions. This misinterpretation, combined with a
> coincidental match by is_migration_entry() on the address bits, leads
> to kernel crashes in pfn_swap_entry_to_page().

.. you mentioned !pte_none() is checked.  Could you explain why it's
pte_none() rather than huge_pte_none()?  As I saw loongarch has exactly
this..

static inline int huge_pte_none(pte_t pte)
{
	unsigned long val = pte_val(pte) & ~_PAGE_GLOBAL;
	return !val || (val == (unsigned long)invalid_pte_table);
}

I'm not familiar with loongarch's invalid_pte_table, but I would expect at
least for now in hugetlb specific paths it should be reported as none even
without this patch.

One more thing to mention is the kernel (AFAIU) is trying to moving away
from hugetlb specific pgtable parsing to generic pgtable walkers.  It means
it could happen at some point where the kernel walks the hugetlb pgtables
using normal pgtable APIs.  I'm not yet sure what would happen then, but
maybe at some point the invalid_pte_table check is needed in pte_none() too
for loongarch.

Thanks,

> 
> Fix this at the architecture level by modifying huge_pte_offset() to
> check the PMD entry's content using pmd_none() before returning. If the
> entry is none (i.e., it points to invalid_pte_table), return NULL
> instead of the pointer to the slot.
> 
> Co-developed-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Ming Wang <wangming01@loongson.cn>
> ---
>  arch/loongarch/mm/hugetlbpage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
> index e4068906143b..cea84d7f2b91 100644
> --- a/arch/loongarch/mm/hugetlbpage.c
> +++ b/arch/loongarch/mm/hugetlbpage.c
> @@ -47,7 +47,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
>  				pmd = pmd_offset(pud, addr);
>  		}
>  	}
> -	return (pte_t *) pmd;
> +	return pmd_none(pmdp_get(pmd)) ? NULL : (pte_t *) pmd;
>  }
>  
>  uint64_t pmd_to_entrylo(unsigned long pmd_val)
> -- 
> 2.43.0
> 

-- 
Peter Xu

