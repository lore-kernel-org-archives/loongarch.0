Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C297B
	for <loongarch@lists.linux.dev>; Wed, 20 Jul 2022 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658309684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZJQXt6doKuqhqmCeIdZMEV0KmUXZoYN8P0BVRcFtdM=;
	b=UJTlWW1wXFjspHs3DAtPLwQB/mCEFIZ+AH1q1i66e7tYbp2IsVuCMPLfaIJQDPzfFwwZgE
	fYH5gkno+B2CQ5/9Oe/k+51zDC8rHtUD/7/GRLZwlwfWea/7iMWfdB1wvgRabndT920vbT
	Q2d5O6LzuOCet+Of60jnBy51crNvS0M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-7_1CtrK1MH-P8bYmDhdEEw-1; Wed, 20 Jul 2022 05:34:43 -0400
X-MC-Unique: 7_1CtrK1MH-P8bYmDhdEEw-1
Received: by mail-wr1-f71.google.com with SMTP id m2-20020adfc582000000b0021e28acded7so1235284wrg.13
        for <loongarch@lists.linux.dev>; Wed, 20 Jul 2022 02:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=dZJQXt6doKuqhqmCeIdZMEV0KmUXZoYN8P0BVRcFtdM=;
        b=uQYCr3WYdbOUivwlco3U10SS1OksIPPufu05niLpYDjpHB3Isz1gaXTo39ot3eNVjS
         waiZS5gPwAPzKYNgdLho6fdsk5h+Xb3h8xjsb7y9XpIqRijv5ffxl/isnUJ3LgG0X99q
         AaMN28FZn2T/Vk0Gej8JlqPjFwPGoNIK2ExCwhWxjqx5GjGmMyuo7zWxOIYyD/xl9UbE
         dUl68s++ZKn+RSH3KWu6Zp/HGVlf89JxTXcXGml1VUGt+EW5bJGutMv5HcLTue7f2l/D
         8AC4FihkB9sKHRKcMCzSeoHboTuxrDjoZq4aRlZAbaAfKsbnpu5VzGva7B150InIjuYq
         Is6A==
X-Gm-Message-State: AJIora9leHZBsZpXv3yEE5JKcePe8lc3Oy5cbAAmV7prIbv4Na9YEW9r
	vdHv0xyPMD6qHQyQGHu+85T5+ub3aIhciCAtDnFLXz0QUsQyzIePLC9fzYRo8SHeEK0cEvpFbU4
	OiOroJzWa/cTPBI5NyaM7
X-Received: by 2002:adf:e889:0:b0:21d:6510:b750 with SMTP id d9-20020adfe889000000b0021d6510b750mr31445075wrm.498.1658309681809;
        Wed, 20 Jul 2022 02:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ulf8qkNkDcp6dk1vwhLiwrg1+3SyvqKhWJWE97+JCOnPrgU25PgHyyorDQgXr5DMo4WjCfFQ==
X-Received: by 2002:adf:e889:0:b0:21d:6510:b750 with SMTP id d9-20020adfe889000000b0021d6510b750mr31445053wrm.498.1658309681533;
        Wed, 20 Jul 2022 02:34:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:e00:8d96:5dba:6bc4:6e89? (p200300cbc7060e008d965dba6bc46e89.dip0.t-ipconnect.de. [2003:cb:c706:e00:8d96:5dba:6bc4:6e89])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b003a2f2bb72d5sm2347014wmq.45.2022.07.20.02.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 02:34:41 -0700 (PDT)
Message-ID: <4216f48f-fdf1-ec1e-b963-6f7fe6ba0f63@redhat.com>
Date: Wed, 20 Jul 2022 11:34:37 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V4 3/4] mm/sparse-vmemmap: Generalise
 vmemmap_populate_hugepages()
To: Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Sudarshan Rajagopalan <quic_sudaraja@quicinc.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, loongarch@lists.linux.dev,
 linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Feiyang Chen <chenfeiyang@loongson.cn>
References: <20220704112526.2492342-1-chenhuacai@loongson.cn>
 <20220704112526.2492342-4-chenhuacai@loongson.cn>
 <20220705092937.GA552@willie-the-truck>
 <CAAhV-H5r8HDaxt8fkO97in5-eH8X9gokVNervmUWn6km4S0e-w@mail.gmail.com>
 <20220706161736.GC3204@willie-the-truck>
 <CAAhV-H7uY_KiLJRRjj4+8mewcWbuhvC=zDp5VAs03=BLdSMKLw@mail.gmail.com>
 <CAAhV-H6EziBQ=3SveRvaPxHfbsGpmYrhVHfuBkpLJXn-t-uTZA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAAhV-H6EziBQ=3SveRvaPxHfbsGpmYrhVHfuBkpLJXn-t-uTZA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.07.22 14:34, Huacai Chen wrote:
> Oh, Sudarshan Rajagopalan's Email has changed, Let's update.
> 
> Huacai
> 
> On Fri, Jul 8, 2022 at 5:47 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>
>> +Dan Williams
>> +Sudarshan Rajagopalan
>>
>> On Thu, Jul 7, 2022 at 12:17 AM Will Deacon <will@kernel.org> wrote:
>>>
>>> On Tue, Jul 05, 2022 at 09:07:59PM +0800, Huacai Chen wrote:
>>>> On Tue, Jul 5, 2022 at 5:29 PM Will Deacon <will@kernel.org> wrote:
>>>>> On Mon, Jul 04, 2022 at 07:25:25PM +0800, Huacai Chen wrote:
>>>>>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>>>>>> index 33e2a1ceee72..6f2e40bb695d 100644
>>>>>> --- a/mm/sparse-vmemmap.c
>>>>>> +++ b/mm/sparse-vmemmap.c
>>>>>> @@ -686,6 +686,60 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
>>>>>>       return vmemmap_populate_range(start, end, node, altmap, NULL);
>>>>>>  }
>>>>>>
>>>>>> +void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
>>>>>> +                                   unsigned long addr, unsigned long next)
>>>>>> +{
>>>>>> +}
>>>>>> +
>>>>>> +int __weak __meminit vmemmap_check_pmd(pmd_t *pmd, int node, unsigned long addr,
>>>>>> +                                    unsigned long next)
>>>>>> +{
>>>>>> +     return 0;
>>>>>> +}
>>>>>> +
>>>>>> +int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
>>>>>> +                                      int node, struct vmem_altmap *altmap)
>>>>>> +{
>>>>>> +     unsigned long addr;
>>>>>> +     unsigned long next;
>>>>>> +     pgd_t *pgd;
>>>>>> +     p4d_t *p4d;
>>>>>> +     pud_t *pud;
>>>>>> +     pmd_t *pmd;
>>>>>> +
>>>>>> +     for (addr = start; addr < end; addr = next) {
>>>>>> +             next = pmd_addr_end(addr, end);
>>>>>> +
>>>>>> +             pgd = vmemmap_pgd_populate(addr, node);
>>>>>> +             if (!pgd)
>>>>>> +                     return -ENOMEM;
>>>>>> +
>>>>>> +             p4d = vmemmap_p4d_populate(pgd, addr, node);
>>>>>> +             if (!p4d)
>>>>>> +                     return -ENOMEM;
>>>>>> +
>>>>>> +             pud = vmemmap_pud_populate(p4d, addr, node);
>>>>>> +             if (!pud)
>>>>>> +                     return -ENOMEM;
>>>>>> +
>>>>>> +             pmd = pmd_offset(pud, addr);
>>>>>> +             if (pmd_none(READ_ONCE(*pmd))) {
>>>>>> +                     void *p;
>>>>>> +
>>>>>> +                     p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
>>>>>> +                     if (p) {
>>>>>> +                             vmemmap_set_pmd(pmd, p, node, addr, next);
>>>>>> +                             continue;
>>>>>> +                     } else if (altmap)
>>>>>> +                             return -ENOMEM; /* no fallback */
>>>>>
>>>>> Why do you return -ENOMEM if 'altmap' here? That seems to be different to
>>>>> what we currently have on arm64 and it's not clear to me why we're happy
>>>>> with an altmap for the pmd case, but not for the pte case.
>>>> The generic version is the same as X86. It seems that ARM64 always
>>>> fallback whether there is an altmap, but X86 only fallback in the no
>>>> altmap case. I don't know the reason of X86, can Dan Williams give
>>>> some explaination?
>>>
>>> Right, I think we need to understand the new behaviour here before we adopt
>>> it on arm64.
>> Hi, Dan,
>> Could you please tell us the reason? Thanks.
>>
>> And Sudarshan,
>> You are the author of adding a fallback mechanism to ARM64,  do you
>> know why ARM64 is different from X86 (only fallback in no altmap
>> case)?

I think that's a purely theoretical issue: I assume that in any case we
care about, the altmap should be reasonably sized and aligned such that
this will always succeed.

To me it even sounds like the best idea to *consistently* fail if there
is no more space in the altmap, even if we'd have to fallback to PTE
(again, highly unlikely that this is relevant in practice). Could
indicate an altmap-size configuration issue.

-- 
Thanks,

David / dhildenb

