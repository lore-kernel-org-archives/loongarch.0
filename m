Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C0A57
	for <loongarch@lists.linux.dev>; Wed,  6 Sep 2023 07:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693986130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fdt2EUxE/XfED3p5ykjjh9CCofBUEIYRSA1UtPAGb0=;
	b=Ahs0EJnJje/rds0Qcbx2vp8KPle87ahl2wL0PTHhM0CCBsv9VfXw8WH2MSA3rbI9I785a9
	FmvQW87qfZu+Lq5cCdLoNngivhDVJT4MRDXF9ez6VpfBtCiH9SQy5gWhqx0MdbufOgm2/+
	9GKg6h+gl0et7zlOPzB4upW9SK7NMCQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-EdOPT_MONeaiT-MSGMSD6A-1; Wed, 06 Sep 2023 03:42:09 -0400
X-MC-Unique: EdOPT_MONeaiT-MSGMSD6A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30932d15a30so1837610f8f.1
        for <loongarch@lists.linux.dev>; Wed, 06 Sep 2023 00:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693986128; x=1694590928;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fdt2EUxE/XfED3p5ykjjh9CCofBUEIYRSA1UtPAGb0=;
        b=VAGfGzlG3JzExprnVx87UYx2lHM3vhTMJUIdVvVPdTOUDYxGsuNPVm5kf+u+n2JG0k
         3LTBtXZkwrzb6jkIhY5TuWCcDgcPE5CCDyznUtZwiiTVc0OmXYFV5whRNldYWEtcisll
         HSy9k7pl6b5UkNAn7sSe/Lz7mXiIXmh2DLlxKj3VBVuzPXBhPYq87zon3BhgJQ25enMB
         p9RRczAtFUohX2/5+dUv92KbMW/O5k6j/UoCUXanZsaoyXauAGjRrgK3IHXDhe+LMQ9B
         oYwmYdpAwJnc+GekJj5BIDAZx9fkxgqKIcNxgHitEwoA+LG9E6hRlBHAd1VbEVH9B8jy
         yetg==
X-Gm-Message-State: AOJu0Yx+Wi89VxBRXgiCe7ubAnYNu9JyxKtPc0v34wGskz0tHs0k5TlP
	deSY0Ji9pEQqYlqlVQ8fvPufuxKw2x/q3MZlxko00kHmXvhEdAnlg3VqHY6LWAn6vkwr0y7AOjj
	OsojRO1ex11YGhHgdnn9M
X-Received: by 2002:a5d:4c85:0:b0:317:6175:95fd with SMTP id z5-20020a5d4c85000000b00317617595fdmr1525238wrs.43.1693986128243;
        Wed, 06 Sep 2023 00:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvSibvvGpwzY5qzxGX02NS0IXvcFXv3566YuLrAOdwq82jQKduvKnVxaQMANAxgZwqzHWdFA==
X-Received: by 2002:a5d:4c85:0:b0:317:6175:95fd with SMTP id z5-20020a5d4c85000000b00317617595fdmr1525226wrs.43.1693986127873;
        Wed, 06 Sep 2023 00:42:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:6c00:92a4:6f8:ff7e:6853? (p200300cbc70c6c0092a406f8ff7e6853.dip0.t-ipconnect.de. [2003:cb:c70c:6c00:92a4:6f8:ff7e:6853])
        by smtp.gmail.com with ESMTPSA id a2-20020adff7c2000000b003177074f830sm19620812wrq.59.2023.09.06.00.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:42:07 -0700 (PDT)
Message-ID: <d6012fe0-9d06-f5ac-857c-c38034bf0758@redhat.com>
Date: Wed, 6 Sep 2023 09:42:06 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] LoongArch: add p?d_leaf() definitions
To: Hongchen Zhang <zhanghongchen@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport IBM)" <rppt@kernel.org>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Qi Zheng
 <zhengqi.arch@bytedance.com>, "Matthew Wilcox Oracle)"
 <willy@infradead.org>, Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
References: <20230905064955.16316-1-zhanghongchen@loongson.cn>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230905064955.16316-1-zhanghongchen@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.09.23 08:49, Hongchen Zhang wrote:
> When I do LTP test, LTP test case ksm06 caused panic at
> 	break_ksm_pmd_entry
> 	  -> pmd_leaf (Huge page table but False)
> 	  -> pte_present (panic)
> 

Probably there are other problematic bits without that can trigger that? 
I suspect walk_page_range*() callers might be affected,

> The reason is pmd_leaf is not defined, So like
> commit 501b81046701 ("mips: mm: add p?d_leaf() definitions")
> add p?d_leaf() definition for LoongArch.
> 

We most certainly want to cc stable, no?

Can we come up with a Fixes: tag? Probably when we added THP support to 
loongarch.

> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
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

