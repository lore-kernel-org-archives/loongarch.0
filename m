Received: from out0-218.mail.aliyun.com (out0-218.mail.aliyun.com [140.205.0.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E113B7A7
	for <loongarch@lists.linux.dev>; Fri, 10 May 2024 02:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715307530; cv=none; b=WYUF1JwdJ0HoOoSJ9sapg8SHIfwTt713bs9gsDD7nUAcQStsfOeKbkkTom7gYk6NEYSoAWJxiOeqNVZRASaHgHsIC4epRthNBqzkyPkO6qB6MeyaeU6SPawBhyOApCJKRvUjBtcIihrmh8JEcwXq68rUuDc+LV8ry4+B2Jl0cz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715307530; c=relaxed/simple;
	bh=Bs/K1/cqrY9IU/a3teHI1MTK7lNsbQvLmxYdI6+My50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJjOrOJMRQXR9ojygo6G6uqeuhDyxOIT8xu0GGMMrUh9mltaJqALSt41let58NqQGcVWtF7P/dDx2MhH3C6Ih/KomEdPB1z5C5EE1l+SaFXgIwgindA4Ff3+RjyvzwwYGzXskC5YuB6nHNx7iHBdAbZakj9O0GgIwju6gfRsaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=1oef9RVl; arc=none smtp.client-ip=140.205.0.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="1oef9RVl"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715307519; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=z3HIGnGQLgftTdCGksj44Ar9SYsXylJNvYIUDPPEOR8=;
	b=1oef9RVl4+N/ZYuO1r199a6Nq3kwuoLZIbNsqS5eAeKrUwDDaUy7KWB/Rlypbubs9gEf2XfB085njZAef06aOsTdB2EJCquUI8JP9TcOTIRQhA72BMBM6Q4qdaLZSQHihol1xFjGr2HsGIEOtzU+btyAdAE7PCEGFyRkuI7exvU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047209;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XXRy7zj_1715307516;
Received: from 30.230.92.230(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XXRy7zj_1715307516)
          by smtp.aliyun-inc.com;
          Fri, 10 May 2024 10:18:37 +0800
Message-ID: <282a3696-e883-49bb-9bb5-57d4762250cf@antgroup.com>
Date: Fri, 10 May 2024 10:18:35 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] riscv: Add update_mmu_tlb_range()
To: Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 david@redhat.com, ryan.roberts@arm.com, ioworker0@gmail.com,
 libang.linux@gmail.com
References: <20240506155120.83105-1-libang.li@antgroup.com>
 <20240506155120.83105-4-libang.li@antgroup.com>
 <5a812c84-c3bb-4874-b29c-0816494b77a8@ghiti.fr>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <5a812c84-c3bb-4874-b29c-0816494b77a8@ghiti.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks, Alex!

On 2024/5/7 13:35, Alexandre Ghiti wrote:
> Hi Bang,
> 
> On 06/05/2024 17:51, Bang Li wrote:
>> Added update_mmu_tlb_range function, we can batch update tlb of an
>> address range.
>>
>> Signed-off-by: Bang Li <libang.li@antgroup.com>
>> ---
>>   arch/riscv/include/asm/pgtable.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/pgtable.h 
>> b/arch/riscv/include/asm/pgtable.h
>> index 661b2b4fe758..f784c6dd2c66 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -489,6 +489,10 @@ static inline void update_mmu_cache_range(struct 
>> vm_fault *vmf,
>>   #define __HAVE_ARCH_UPDATE_MMU_TLB
>>   #define update_mmu_tlb update_mmu_cache
>> +#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
>> +#define update_mmu_tlb_range(vma, addr, ptep, nr) \
>> +    update_mmu_cache_range(NULL, vma, addr, ptep, nr)
>> +
>>   static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>>           unsigned long address, pmd_t *pmdp)
>>   {
> 
> 
> You can add:
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> Thanks,
> 
> Alex
