Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81F17A30A
	for <loongarch@lists.linux.dev>; Wed,  4 Jun 2025 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022779; cv=none; b=kG+hEqxiv0I8NTE+wr98mZFg1NaWVmUYJjHKyV17gWhI+mNwDj1C/wNgTkl1+v0cXyGi+bskpycTX1ltrWvXcqtrFrC9IKt0tZiA3XI4C+qTzUaQ29WdXWTsPZqkvWsdVveeKPKjpFW/mwyYqJxhNrdLtdfwKaz8e3S8bJ4biQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022779; c=relaxed/simple;
	bh=7jSMxyf92K/bwklFm/f10ExBA1OzjYYjju9IFN0lnrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwFt3xCPP5xfgyA9zwXcJWnV/t7ic4+wCHxwl4GRHIw0f7QNnEGCouUMa5IL8eJiKD1xsugjMTGhEwj3tJylYHpv3QLQWVm62uYX2UO1qWWvep8hFSzc0E2HV7gQLCOmdRHdNNeN20acQ+9U6sRkfrIwbnZVPBX58J44VM20z/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Up9l/8ey; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Up9l/8ey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749022776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vEeoKlp6F3sCfv0THwxJPcjcYZSfLkHHDxNn+gbXPaA=;
	b=Up9l/8eypwgdqjt83lTBwudzWbPIb/6gbAVwWyfmXnyLIsb1HgFfeYUv6t9dbtZjR2n5Dq
	rdsoX2ziceuZs2Y4D7NV4riBbNtzIiNMNZKgTAy3vFhCnVW3i27N44+5eMPmqSroFPZvqk
	ic4JspNzaaCZaG+0LBY/GsUp1JC6w2s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-mrFh-jd_OmWhj_TfnyUseQ-1; Wed, 04 Jun 2025 03:39:35 -0400
X-MC-Unique: mrFh-jd_OmWhj_TfnyUseQ-1
X-Mimecast-MFC-AGG-ID: mrFh-jd_OmWhj_TfnyUseQ_1749022774
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so2476712f8f.2
        for <loongarch@lists.linux.dev>; Wed, 04 Jun 2025 00:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749022773; x=1749627573;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vEeoKlp6F3sCfv0THwxJPcjcYZSfLkHHDxNn+gbXPaA=;
        b=Agrk8xemDSa1lquj1B+/DK/gDyckYeT6JkLnv+eCJzNJjjK3CBdAiXf0A3+m5fTQSw
         Y/GhoNFOeDZunO7U8BPtZnkAfUDznk3sMWKNNjSgNz2OAt9qMygYGxMsABiVc5lXC+58
         b4sOwDcwkySe0EAQoLFyTixfNy8gTLkpXd0cFJ4CRMHjZE7wwuLc3+n/EtTXRCRIoVmD
         MX0SilcZ0INoqvIH/3YC3SpU/F4S0pa+aCXaQgU13YN3/In8HCSSO+X56TJXnBVhQrU1
         wV3Mp4mxwxdn2fY8h3YGizlqkoVTapKzQYCwXUV+yz1juW3+hwEIxUgXfrqm/SJBgUnb
         rhiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtdQFHEiH1LmL0KGMWIUje8//bObpBTjM54VdDz0i7JE8nCFvrjI6vP6RhQlPaM+fGqyDx8+o4PYM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtjmrGLtj7GvX1rH73ZFrjDR+aGXOoyypoIJTA0ED7OQia/iNP
	7BVI8Z0N5pEwOqPl9YTYGXRTIoE3248kA30KCTxU7GyUypsY+15LtQVzCqPFkDX3skJUoKDXvo+
	2WWSJi0wI0d0/Ky1fvkP4m6iJUjmbu0NwrjEORqosN3dpakmB3c4QHJhcFbkqSg==
X-Gm-Gg: ASbGnctXegWBMeWtpI0o3S8XQ3/Jdx7UgjuN0mJaXTi8QOcuULGt2hWKmyvl0ZXd9hK
	+Tt8PExnWavGvZpGt5qtH9bD2vJhk2uelG5/DyY01mehWjiH8ye5m+mRP4jjDhNPn+7Yf+BF0BY
	RGH9/LwSu80d88o37Y6vnSHvtGppcTns+P3xTUMFcUbC6DyS/Jenij551BA2YR2HPi9j1nhI9VT
	tfkhY4CCJai1o0lT1Q2irMM3f52uyfgPtQvvj1iOEWhD2aJB8y2S/DZyDPsTXPZQaZPgaO2HjlQ
	esJUPy/QRbeObhGzxBY16fs3XBsC8Ak9PnsFxErRh+Cp4ChKNHv2
X-Received: by 2002:a05:6000:430a:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a51d96673fmr1049762f8f.48.1749022773621;
        Wed, 04 Jun 2025 00:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtjE45p1dQbMhXKznJNQhD9gzd16Gald/ROfCnxrA2ljBjwOkDtYt1uC7/AKZ2m2XTHTCIeQ==
X-Received: by 2002:a05:6000:430a:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a51d96673fmr1049729f8f.48.1749022773213;
        Wed, 04 Jun 2025 00:39:33 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f831.dip0.t-ipconnect.de. [79.224.248.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972f3sm21121625f8f.69.2025.06.04.00.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:39:32 -0700 (PDT)
Message-ID: <51ec4269-b132-4163-9cb5-766042a3769d@redhat.com>
Date: Wed, 4 Jun 2025 09:39:30 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Barry Song <baohua@kernel.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jann Horn <jannh@google.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org
References: <20250603192213.182931-1-lorenzo.stoakes@oracle.com>
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
In-Reply-To: <20250603192213.182931-1-lorenzo.stoakes@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dre5ZnmRiKmfAdrQWNWrRXHMHbfBuFVsXjbJZnWHNd8_1749022774
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03.06.25 21:22, Lorenzo Stoakes wrote:
> The walk_page_range_novma() function is rather confusing - it supports two
> modes, one used often, the other used only for debugging.
> 
> The first mode is the common case of traversal of kernel page tables, which
> is what nearly all callers use this for.

... and what people should be using it for 🙂

> 
> Secondly it provides an unusual debugging interface that allows for the
> traversal of page tables in a userland range of memory even for that memory
> which is not described by a VMA.
> 
> This is highly unusual and it is far from certain that such page tables
> should even exist, but perhaps this is precisely why it is useful as a
> debugging mechanism.
> 
> As a result, this is utilised by ptdump only. Historically, things were
> reversed - ptdump was the only user, and other parts of the kernel evolved
> to use the kernel page table walking here.
> 
> Since we have some complicated and confusing locking rules for the novma
> case, it makes sense to separate the two usages into their own functions.
> 
> Doing this also provide self-documentation as to the intent of the caller -
> are they doing something rather unusual or are they simply doing a standard
> kernel page table walk?
> 
> We therefore maintain walk_page_range_novma() for this single usage, and
> document the function as such.

If we have to keep this dangerous interface, it should probably be

walk_page_range_debug() or walk_page_range_dump()

> 
> Note that ptdump uses the precise same function for kernel walking as a
> convenience, so we permit this but make it very explicit by having
> walk_page_range_novma() invoke walk_page_range_kernel() in this case.
> 
> We introduce walk_page_range_kernel() for the far more common case of
> kernel page table traversal.

I wonder if we should give it a completely different name scheme to
highlight that this is something completely different.

walk_kernel_page_table_range()

etc.


-- 
Cheers,

David / dhildenb

