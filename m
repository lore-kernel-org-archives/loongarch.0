Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9F72745C
	for <loongarch@lists.linux.dev>; Sat,  7 Feb 2026 22:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770504652; cv=none; b=sCDurfOIoU726sJLonSSJD4JFffV3Fo0LNA89Wuga72Y0vvGsoWmnuGRjuj9Gc/5veGJR8F18cdHcK4qVYJjyfCY5TG0KJ9ClpnP6NeA8rtaf6FlDAB9OdHYYdG7aBsPGeZH6K2Bdn3w4yWOiSOSLnhuh/HrFEtysLoLrDBWyHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770504652; c=relaxed/simple;
	bh=Y+6qfQ0jJpJvDEssgGqbLBMLN/j7Rup6ibh8xCsuHv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaQcrKclHMMWJJja5G57CbLfEFtwMEe7YOU1xTlgZudyYryHzLXfG28eMdw+TGkH6bXdI3XdRL72WYv02SerJOh9g5KxR8c3TgKhjRIRaTKYgsaI9/CawafFQ5cDsuq2wcU8pUnsYDoalEy1rR1QIIq2gWUYAfDMDR1USXiplgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IV9E2ObP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IV9E2ObP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so38417045e9.2
        for <loongarch@lists.linux.dev>; Sat, 07 Feb 2026 14:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770504651; x=1771109451; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guTUZAnKzmLJTo83FGB09sw8SSRh07aMEfZkMVMbC+c=;
        b=IV9E2ObPn6xmCMTI3/Bt+ywTtHq6k7XDGSGb7Me2I0Ote4FrQQzozxOK1Mii2oK6eq
         UwE+0VLd/JpwLkBNKkR5hlXzyhhUpC30+dVPVlTrFPE3b5RRpwfSHAY8cVfEx1NZkHXc
         hI3d6pV5Ayc46kqQJUt97XqUE13zhFMbNIBScVwFNKKjbhNPEIZl2G+woX5ACjc5gpoR
         XNIJm+5q1O3xOEC7h2m689qTObpyOIhxIY1NiYqAnGRcZBBwxEIjAgwITbm2XxpGcpE3
         EW1OTA/tK2vrehUH4dc26DU/9WzN/cXE3RRTEpgnNYrNSUgz3/+/SAyEUgwfklO0dUqX
         o9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770504651; x=1771109451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guTUZAnKzmLJTo83FGB09sw8SSRh07aMEfZkMVMbC+c=;
        b=OzaKkjx3yWL3b3hS8fmNfg/b/0T3E4NyU/NQ7v8dS5VrBIRKAgNsG4ax6hpGegnVQH
         Kf0e3JMM3zmAJL/yCOdneqFkahlA05qU8IvTEov7SN4deHrdZRfgwo3BR/T0r6zwAyya
         WAVxYvswI1Un0R0EY6/iqwSGzgIqnsD+/eAFTbNCyffPnpXdM3UY4VxwXzB+xlwk5EqF
         xS4osy3YlSawjBnVD81H0za2iZMY2Vd2IWNxoZBk5Kz1W1vVYfWvy5riEZGSsJSxuUYu
         E2OlYYmcuEA0o1/O1YSYOYTDTlckpKqH7UI7qn4Px55bCPP8icWUvRlyBBsR9zGcx3NY
         tuoA==
X-Forwarded-Encrypted: i=1; AJvYcCW6oEzOkfrgr9h8xvznQbN9IRbPjq7UNurpvtS7f+bMuGLPevyOfy5r8QeF+zNtScTMRhnN5huUFq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ00FhJYXGDTbm0efAx1s7o8cZYDGQbUxAZMG34pT45V7XWbqb
	lMshZvYvvw5ZGl+8jKQQoHq7LF+YHZpiP5+TO1ZuGcnpPuixGPerDr3t
X-Gm-Gg: AZuq6aIXZSUpx+cIs44Zz1eA+r2Q0tLy2YLHJSQMC2Ub3v3TmaX83e1RTOJk+LMdi2x
	DJNVNsNiK22OC73Y7u6uhC6uG1SYc3ooZG3xuMz+mmK1QHPVlTtBWqwyDbVFKLYXjQj2YP7t8qN
	1nZQMBpo8mHP/3P3eZsLNKlW9pISwvlrYEprMXdkgWfz9Jjd5afXdq84yv7Dn1P87O5RH0E2kP5
	yuKa8FUn2+Q7dHtM4zYFbneOp2naRkTIu49KAbP92AaeUqrL7mN2GSkeYLjR2Oreop7gHYP05hJ
	DSKsd8HOMzw4RqFxmexgGTZa0WyiS81uMfELlNmEx8rFcS4avDDUJno/gjfMxfJ2lLYV7gfP8yU
	2JeDboJMGwcsGFwkgNLItI/iIn2yMUth6fyKQvxKLegVEKABX0Rv7ELVHy58J8fyE1/aTpMjuQe
	/+bIzHAclDJB1KsVThq+m3kH/yIla15CyHQwcDF3tri3BiG2DMFzdwhBijHrk1KST8f25h7nUtd
	86rENYGkpPoZb4=
X-Received: by 2002:a05:600c:3f08:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-483201dcfc4mr103983235e9.2.1770504650500;
        Sat, 07 Feb 2026 14:50:50 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm16866971f8f.28.2026.02.07.14.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 14:50:48 -0800 (PST)
Message-ID: <110aedf7-9f31-4552-b772-395433d7bdb3@gmail.com>
Date: Sat, 7 Feb 2026 22:50:47 +0000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 11/17] mm/hugetlb: Remove fake head pages
Content-Language: en-GB
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Frank van der Linden <fvdl@google.com>
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
 <907ff793-9b02-4a22-a85e-2873246f6402@gmail.com>
 <412359f2-ecfb-498a-9717-f0a442abd3f7@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <412359f2-ecfb-498a-9717-f0a442abd3f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/02/2026 21:25, David Hildenbrand (Arm) wrote:
> On 2/7/26 21:16, Usama Arif wrote:
>>
>>> +
>>>   int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
>>>                          int node, unsigned long headsize)
>>>   {
>>> +    unsigned long maddr, len, tail_pfn;
>>> +    unsigned int order;
>>>       pte_t *pte;
>>> -    unsigned long maddr;
>>> +
>>> +    len = end - addr;
>>> +    order = ilog2(len * sizeof(struct page) / PAGE_SIZE);
>>
>>
>> This doesnt work for ARM. For len = 32 (2MB contiguous-PTE hugetlb on arm64):
>> ilog2(32 * 64 / 65536) = ilog2(2048 / 65536) = ilog2(0) which is undefined.
> 
> HVO should not be possible for that size, and we should never reach that point, no?
> 
> Remember that for HVO, the metadata must span at least two pages.
> 

Ah yeah thats right, ignore me. Its also checked in hugetlb_vmemmap_optimizable_size,
so its all good.
