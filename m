Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2F327CCF5
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749155041; cv=none; b=CSG5SpUO6f+ZOqgk6631uofLuqpaalI0GnYID+qwpInpGsJMBhKkqp4AmHrpw4tiTLIZft+TAHo/1N7fPXZxSClTo9bdj+ud31ymW6ToI3DDDyvO5iUXVmquU7GeIbQtojGEv/B94Hnj6ALY2C0ovZXJkpgcYr5AqAat196fyck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749155041; c=relaxed/simple;
	bh=u1ofUrAFqETnBUoehywEUIvW+xbOTm3X9P80BvOhxS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZToLS5yjAywhl94pi6KnLCG0MRgKvwzi9KGE9YBfle/1Jr5gl2yef1uLzmW28YlFoaHLxYCqV4aBbtT950AmhW9G1M1u/wGSUIyEsnKEz+JSXKoHRs7EugnmII1UPMR01iBnfGqmUHkiuyc+dXkjC3sz5r4zdD5rtePL+pXDjGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ag31gNMo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ag31gNMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749155038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wGRAUX3Vi4mrKdBS2NEw0LJip1BNYoUgoRIdRDK4JKI=;
	b=Ag31gNMoWyM512azaZvYlfTaqSoFeogaL3HUyU51LzGgAbK28rOj7p8wTQiH21xh/gllzP
	cmg/r4OzyxI21XmQ9BdzkNRZpFttXNMmkuC2g+//2cjL6VSpD7aVqOSiURHyp/Mb2H2p1F
	SdrhbOtTt2z9aL7Dd3BwtNfHvmxRiuw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-QcJM1RQsPIy1xYp4Je6vFg-1; Thu, 05 Jun 2025 16:23:56 -0400
X-MC-Unique: QcJM1RQsPIy1xYp4Je6vFg-1
X-Mimecast-MFC-AGG-ID: QcJM1RQsPIy1xYp4Je6vFg_1749155035
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451e24dfe1dso11072925e9.0
        for <loongarch@lists.linux.dev>; Thu, 05 Jun 2025 13:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749155035; x=1749759835;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wGRAUX3Vi4mrKdBS2NEw0LJip1BNYoUgoRIdRDK4JKI=;
        b=EVNuzgRsuZXisr25z4r8VPpXsbQCaKZvYEbdoO9y7fFm7LSZnCZ3yQkRnJii6F6uEt
         06z5rlDG3KN/6XLeK45sjFAEn2uoiPqJwUFi3wl2dAWaLKHRH+6EUnoQje7VaK1Fdksk
         YoOyBZHemF089G6VTAjs9JR2trL2rDuaCx2JEpcfIK14Cdm7FLkMrwun44E0/l5DHmJH
         SRDWL6fxkQhMwG8INoeAoFT6/RwaMQJTvMoL7DNNfE7jciz/Xcche9w3Lrnn62FadU4m
         /ZecuWTUuvea7OUdCjwJ/R9By/5m8sQoukq1MyzTmhP0tdncsGwczd2KFLGfsWQvtQF+
         b53g==
X-Forwarded-Encrypted: i=1; AJvYcCU22zNPjhYIpZlgAORFrrecTo+pzSb0V83L/S/31SWFG2ix0rXYkS+UtZSVV67lAZyMoif7DRqYnuA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEufmISfPATIs2g+vxGLs1tksqC144fZ2I3FdjSQ/uI/pMKPu+
	Jjq+KCJpP9kTAHK/Qo5hkoxTqiJYV0NryBF/NAeKzCT4o6It49f0qeFVfGVW7DK0xE3aLDuxcwP
	XB58iXm1782WYnsWDptQ1ntjPf8yqVLjdRzAy88mwcxY3+4812px2E6hlNVF41w==
X-Gm-Gg: ASbGncuNsktbL077a0+tZ8cfZ3/5uELMwQrfwBVGwO7F/p0PW+r2uK92c2I88Plu8Tk
	miibdSG1+oMjL4GRAItbSdVgVEc7faobjcjsHVnD2HJzMpzRaj2MPyP/U5xDg17V+rhjTqLqBrO
	b8Gpu92oLdv2Qrzv18tmBNoAGHqUNgPddvtc5t5+d8f2jdFrZ3YP0FUCCtLKguzlK2/Awq1mU+K
	IeddKK4rk9XaWPZaDWEbo5Fm5y5Ol8o8OSlY52xlYqWEUT9HufDeSA/b2F5vfIA3Q/OzDHEgds0
	b4LK8X0VUqOBVw0N2/N7ma3frksOHcsj82mpMjYMrug=
X-Received: by 2002:a05:600c:8b6f:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-45201437a3bmr7944265e9.5.1749155035365;
        Thu, 05 Jun 2025 13:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiHsw/Y4RMekktDUGS/INXjLuw1e2xyTzcANzwqsfxHShQSLVh4rDvLAoSpveuDwSISxQApw==
X-Received: by 2002:a05:600c:8b6f:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-45201437a3bmr7943865e9.5.1749155034932;
        Thu, 05 Jun 2025 13:23:54 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f5ef.dip0.t-ipconnect.de. [79.224.245.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532436555sm138250f8f.61.2025.06.05.13.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 13:23:54 -0700 (PDT)
Message-ID: <af6d28d0-d646-45d5-832c-66add20ea388@redhat.com>
Date: Thu, 5 Jun 2025 22:23:52 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song
 <baohua@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
 <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5XJKWe8an6nDPUXeunYTp8mnVBCiaCr2qpyw5OU7-Go_1749155035
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.06.25 21:19, Jann Horn wrote:
> On Wed, Jun 4, 2025 at 4:21 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
>> The walk_page_range_novma() function is rather confusing - it supports two
>> modes, one used often, the other used only for debugging.
>>
>> The first mode is the common case of traversal of kernel page tables, which
>> is what nearly all callers use this for.
>>
>> Secondly it provides an unusual debugging interface that allows for the
>> traversal of page tables in a userland range of memory even for that memory
>> which is not described by a VMA.
>>
>> It is far from certain that such page tables should even exist, but perhaps
>> this is precisely why it is useful as a debugging mechanism.
>>
>> As a result, this is utilised by ptdump only. Historically, things were
>> reversed - ptdump was the only user, and other parts of the kernel evolved
>> to use the kernel page table walking here.
> 
> Just for the record, copy-pasting my comment on v1 that was
> accidentally sent off-list:
> ```
> Sort of a tangential comment: I wonder if it would make sense to give
> ptdump a different page table walker that uses roughly the same safety
> contract as gup_fast() - turn off IRQs and then walk the page tables
> locklessly. We'd need basically no locking and no special cases
> (regarding userspace mappings at least), at the cost of having to
> write the walker code such that we periodically restart the walk from
> scratch and not being able to inspect referenced pages. (That might
> also be nicer for debugging, since it wouldn't block on locks...)
> ```

I assume we don't have to dump more than pte values etc? So 
pte_special() and friends are not relevant to get it right.

GUP-fast depend on CONFIG_HAVE_GUP_FAST, not sure if that would be a 
concern for now.

-- 
Cheers,

David / dhildenb

