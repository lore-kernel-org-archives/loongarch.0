Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1886277
	for <loongarch@lists.linux.dev>; Sat,  7 Feb 2026 20:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770495388; cv=none; b=E05tqaZdzM4qn4jkXjAnkA+DrIAIsfQvAoh634x2AjapU+DmKn1oHUtnqAjB1x68LdME0mrbB+LMWwvDjfMnuyocH3fCW3HFFPOaClA/cpjscsCeRjnPswjpzGXUyJeTmYkMxigqFTCEmf3mx9UJMz3l2Y6/gErOE4RlLZZ+ZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770495388; c=relaxed/simple;
	bh=1f6G4v+4U4f6IIr3zzk56Nlc0wxLZuYQLXFP9N6lfd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcQV42IZOkdSjBxdsK/H2c9JjXk3eTQ1iYlXGHxIVcLFFcnH9ew2uNt/i1yy7CuZa2wNBc0lH18ZVB/se8RmlGLHMGEWQ7whebh6jV0bv9mLSRe6j2sdtGEgvCvCIkF0ZCBvOYRs/hciSFVaD/1U9PzkovSHZlFmcry23h/tDX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sx8rAtph; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sx8rAtph"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48327b8350dso13612255e9.1
        for <loongarch@lists.linux.dev>; Sat, 07 Feb 2026 12:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770495387; x=1771100187; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tgEE4qPRK7pF2tP48CJlGhSYjJKIgdfs2GqYMm8p6Y=;
        b=Sx8rAtphfgOkPspm2U4+plYv2MnIv0V/Hv+l6bkjHtrxWVSCnHlOqwS1NJPPu/CE1U
         hsRDJDlZd2ntx0FMP88OmB+y0k9MOSptYw5d0nlNr86zjik99kofcmWfQAfnMubUQmBa
         JkJwuzVgGcAX6oPYNo7yW8XfOtc5w3tD3IYa/DmkjSco4i57hui0OfxTNlnPYMeAmThU
         ReT9hhIJOXfjnMWjQgoT3mZGDOjpiYK9qzm9vRjQG+V7XO1teYx1FWhvNJkZQ6ut18Ro
         TXQI4z0k1iQJBBepcp/WZaGBKfCSPrXjTuB7dz/IJL41nvRtLhFj2SeAWLSL+IgJCNok
         c7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495387; x=1771100187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tgEE4qPRK7pF2tP48CJlGhSYjJKIgdfs2GqYMm8p6Y=;
        b=FcF5PUjCRL0CWiycRwEGw3S90PGvzBO/2HjOUbgL2BL+g6b4fa9aYgC+rmYuo2eAlz
         ZoTeRdDV2vxCPebh5BM79uncMMdMcG/Tza5+2BPHFoxlZxpLP0eHId73nDM3UClfBibh
         Bnl0yJn5J+SQB/NiKHka9c10azWhcAC+Kn9lYXk37HnBMxLiU/xTAkvVVp0aSHP3Ch2+
         /3H7HwQPt8cqgbH5UqpqtdYXZRv1qDTg72q1oEJ4xOm6+oyDcL1PL17XPe0fCFKPRz5r
         koJ5+IYibOdproZnXpbSjDA7KRwt9/6hx6QYxlfV5/k5MlvfgrnHpQUvJISwBa3vjR79
         Qemg==
X-Forwarded-Encrypted: i=1; AJvYcCX26vJiWHFnyazd9XGYCWJqYROmrHZ3THS91J05HQInekIkI9t/VEfXcRe30YM9u/vaWA5AUMqabsM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz7O6XkZMB3d6dbnvtnrPsTzjHg2M9h55lG5MNxWHVti57TCB2
	PipMhypGGLW0F94OF61zSLhvWnQddCz49ZMSSkCAaTF5IGMWSuSQfgVC
X-Gm-Gg: AZuq6aIjWbVsyEAe9RRh+sEgcVpaU+EJtqfWHbRBgGercae8QH3DyHAAtLQO65mAR0Q
	jLBPJnxdG9BFpaaS8HRYw8fZoKy+rfY4z3vturY3eW4eQ8vmdy6BVufCZnLaS49ez6tomOTvu+6
	nWwdrSjy0yNEx9QJ4PtLxN4U4KS83hK5rvKIGKAXB8ern81QdtO0LP5Cr3VUdqq4t1SfNBLD8AM
	FxNhqCOzi2VSy7zEvYEDxZYsKH32OSlQo6UHJmvIidcLy1//qKTNAduSLHy5e0LcnjJUjDaDh8T
	4Q9E3V2/HIksgombJSNs4uZqnmZcGFAr0d9vSkTTfk/m68xKlskmphvRWPPMbgKGb8W4RzazxKE
	hqeid2w1Sx//bUGYxT0aZ4gbKy2AldGisC7bSMFSrWS3ljMWPp6+VAtMhE0qCxhMeB5myHU85mA
	aeZFxe9oXwnDk7bk0XbyOH8+rnft00qE1qi88CFKzPnI6g50pRRuPnQKhTQAR+BSpflt1grSVdj
	Dvmk7wcDgym8dg=
X-Received: by 2002:a05:600c:3e12:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-4832021d67dmr86909015e9.29.1770495386585;
        Sat, 07 Feb 2026 12:16:26 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719b8fsm144010445e9.9.2026.02.07.12.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 12:16:25 -0800 (PST)
Message-ID: <907ff793-9b02-4a22-a85e-2873246f6402@gmail.com>
Date: Sat, 7 Feb 2026 20:16:25 +0000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 11/17] mm/hugetlb: Remove fake head pages
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-12-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20260202155634.650837-12-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +
>  int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
>  				       int node, unsigned long headsize)
>  {
> +	unsigned long maddr, len, tail_pfn;
> +	unsigned int order;
>  	pte_t *pte;
> -	unsigned long maddr;
> +
> +	len = end - addr;
> +	order = ilog2(len * sizeof(struct page) / PAGE_SIZE);


This doesnt work for ARM. For len = 32 (2MB contiguous-PTE hugetlb on arm64):
ilog2(32 * 64 / 65536) = ilog2(2048 / 65536) = ilog2(0) which is undefined.

Is order = ilog2(len / sizeof(struct page)) better?



> +	tail_pfn = vmemmap_get_tail(order, node);
> +	if (!tail_pfn)
> +		return -ENOMEM;
>  
>  	for (maddr = addr; maddr < addr + headsize; maddr += PAGE_SIZE) {
>  		pte = vmemmap_populate_address(maddr, node, NULL, -1, 0);
> @@ -398,8 +426,7 @@ int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
>  	/*
>  	 * Reuse the last page struct page mapped above for the rest.
>  	 */
> -	return vmemmap_populate_range(maddr, end, node, NULL,
> -					pte_pfn(ptep_get(pte)), 0);
> +	return vmemmap_populate_range(maddr, end, node, NULL, tail_pfn, 0);
>  }
>  
>  void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,

