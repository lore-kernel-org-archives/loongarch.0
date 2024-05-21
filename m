Received: from out187-22.us.a.mail.aliyun.com (out187-22.us.a.mail.aliyun.com [47.90.187.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE418145355
	for <loongarch@lists.linux.dev>; Tue, 21 May 2024 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716305834; cv=none; b=dred2bQ4+3xddIXeU62GS7uorRihpH8WodaZrFhAgTu/FLgTqhbUtfhzYbludCrLRjkRtMW0faCOzkc1WLKaQPkXf5KUe/Q3Cu97X4luOQ9ia2yNhxCVgiIK62XdcIsAM5zRKiN+3Z3uJsr2VZBL4XbiB+PcnWsEUooNEoFg63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716305834; c=relaxed/simple;
	bh=7cMYQjWrFB8NyPN7IxbC0FNw72IWwl12mZnaAWXxAHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5Gfi99HlNB4olB5/N+TUDQmjdzayGbXXWfOtVaF2HeNJnVH1R8mgbhEVWh4HkQotUCU+4C8l00GSkLKWw2FswDHJlCwpz4K+Ql/dSFsO80+FNlX+yqB3BRkMY48GHGt5SVWooKXmmc8tAlKe5/0IyJpvb/oMntPxs2/VR5ExBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=1PDxK98a; arc=none smtp.client-ip=47.90.187.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="1PDxK98a"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716305815; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=0F8utKmHBsqT5aaZ1shtTgjkR7zRzQ1wD7Atj7HfE5s=;
	b=1PDxK98ajQsWd/viW0gggAq08f+ifUj2FceeJqLSs6nXi9MYzV7VPNV2Xk9K12oxMUybl/GA+3vakqhG03qn7nKdVet9x3d0hHzLCDRhuWiC6UUebIWMacK+eYVsAJPFBDajnhr0FHKUcbAuLKmkt0cFS3VN1292lk/1uyNsYPU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033038033188;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---.XjOK43f_1716305812;
Received: from 30.236.49.195(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XjOK43f_1716305812)
          by smtp.aliyun-inc.com;
          Tue, 21 May 2024 23:36:53 +0800
Message-ID: <7d00705a-8a6b-48a5-8aba-7e789c536e2e@antgroup.com>
Date: Tue, 21 May 2024 23:36:51 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] mm: Refactor update_mmu_tlb()
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 ryan.roberts@arm.com, ioworker0@gmail.com, libang.linux@gmail.com
References: <20240518074914.52170-1-libang.li@antgroup.com>
 <20240518074914.52170-3-libang.li@antgroup.com>
 <4650b888-d90f-40e3-8c53-c9949e539959@redhat.com>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <4650b888-d90f-40e3-8c53-c9949e539959@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi David,

Thanks for you review!

On 2024/5/21 17:36, David Hildenbrand wrote:
> On 18.05.24 09:49, Bang Li wrote:
>> Remove update_mmu_tlb() from those architectures and define
>> generically via update_mmu_tlb_range(), removing the ability
>> for arches to override it.
> 
> I'd suggest something like
> 
> "mm: implement update_mmu_tlb() using update_mmu_tlb_range()
> 
> Let's make update_mmu_tlb() simply a generic wrapper around 
> update_mmu_tlb_range(). Only the latter can now be overridden by the 
> architecture. We can now remove __HAVE_ARCH_UPDATE_MMU_TLB as well.
> "

Agree! Thank you for your suggestion, I will modify it in the next version

> 
> [...]
> 
>> +#ifndef update_mmu_tlb_range
>> +static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
>> +                unsigned long address, pte_t *ptep, unsigned int nr)
>> +{
>> +}
>> +#endif
> 
> With that in patch #1

Thanks again.
Bang

> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 
