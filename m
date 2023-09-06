Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F072ED6
	for <loongarch@lists.linux.dev>; Wed,  6 Sep 2023 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693992347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pgEkHsGdpRqcvYX0da/cy0loLUWa6HLebB2lSTpxdrI=;
	b=gRzSS7jSESFH9mpz44gsD+D7Anc0BOcmwgbNep4dZW/5iKvYxGOTfC3ysN4hJwmOv7z0vL
	xRKWkQiVu7/ldglGoBhqDWXajxnBeglDh7Of6Or8d2KIhMt/xxMANd7N2X6h/GbQFv8mrU
	wMHCE/JDyxrrdwza/ve/Hg6nJpCS2iQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-SLJO0-zuPOqft37DfFReTQ-1; Wed, 06 Sep 2023 05:25:45 -0400
X-MC-Unique: SLJO0-zuPOqft37DfFReTQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-402cd372b8bso19276425e9.2
        for <loongarch@lists.linux.dev>; Wed, 06 Sep 2023 02:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992345; x=1694597145;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgEkHsGdpRqcvYX0da/cy0loLUWa6HLebB2lSTpxdrI=;
        b=YzyFSBO946IbzX/yLfq+mfTBt+vJrFEGTlb/qgEwooWWLGCaCVe35KZaDFOo79SuUe
         8cUmS4oucS3xtfDx/EZI67xHGn+94/86/ILdFbymA194Ca6OYjESOwQizfO3yKZGXoOw
         0u5aKZke1spDrilZBGsNDV3XgiYhMOSkBnFolQ739lud9eLfyaUVkYaebHyC2Bn7rZk0
         tdgbAkC0DpUnDIltDDTKYgUe3mfwWqmGymaK3konF/Qbr1oKDJ1t+abjxcj5rhGGhvga
         Giyf/5pKz0d26vEct0v54A0jtjrEYFImYhE1mhgW6pMwf81Qz+ri8jXwQhwPSyf8LX62
         XKpA==
X-Gm-Message-State: AOJu0Yyr9xG/1J9soIsmsRFm6imKYZcGmnakjjDzLBh1S+h5dayNOSGs
	T30A37KTbM5ppu7T7eETc84TZ5LgodVaQfT6hZTW2vDng1A1hjx2FHknR9G4uf2z5RO59iQdVGk
	BWdbY6fiZAW2/XArb6KJb
X-Received: by 2002:a05:600c:20b:b0:401:b654:e8e7 with SMTP id 11-20020a05600c020b00b00401b654e8e7mr1697293wmi.28.1693992344782;
        Wed, 06 Sep 2023 02:25:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEomZgZd0CazilTNSjLAWduPHkfO6+U+EB7X92VBI/6sXL99+eZBUtSMQQJxN9YHJ7qrGE8PQ==
X-Received: by 2002:a05:600c:20b:b0:401:b654:e8e7 with SMTP id 11-20020a05600c020b00b00401b654e8e7mr1697276wmi.28.1693992344363;
        Wed, 06 Sep 2023 02:25:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:6c00:92a4:6f8:ff7e:6853? (p200300cbc70c6c0092a406f8ff7e6853.dip0.t-ipconnect.de. [2003:cb:c70c:6c00:92a4:6f8:ff7e:6853])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c029100b004013797efb6sm22604068wmk.9.2023.09.06.02.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:25:43 -0700 (PDT)
Message-ID: <4268e128-ce8b-b7da-464e-eda585aeacd6@redhat.com>
Date: Wed, 6 Sep 2023 11:25:42 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] LoongArch: add p?d_leaf() definitions
To: Hongchen Zhang <zhanghongchen@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport IBM)" <rppt@kernel.org>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Qi Zheng
 <zhengqi.arch@bytedance.com>, "Matthew Wilcox Oracle)"
 <willy@infradead.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, loongson-kernel@lists.loongnix.cn
References: <20230906092019.4681-1-zhanghongchen@loongson.cn>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230906092019.4681-1-zhanghongchen@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.09.23 11:20, Hongchen Zhang wrote:
> When I do LTP test, LTP test case ksm06 caused panic at
> 	break_ksm_pmd_entry
> 	  -> pmd_leaf (Huge page table but False)
> 	  -> pte_present (panic)
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
>   arch/loongarch/include/asm/pgtable.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> index 370c6568ceb8..ea54653b7aab 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -243,6 +243,9 @@ static inline void pmd_clear(pmd_t *pmdp)
>   
>   #define pmd_phys(pmd)		PHYSADDR(pmd_val(pmd))
>   
> +#define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
> +#define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
> +
>   #ifndef CONFIG_TRANSPARENT_HUGEPAGE
>   #define pmd_page(pmd)		(pfn_to_page(pmd_phys(pmd) >> PAGE_SHIFT))
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE  */

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

