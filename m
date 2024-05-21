Received: from out0-216.mail.aliyun.com (out0-216.mail.aliyun.com [140.205.0.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4565326296
	for <loongarch@lists.linux.dev>; Tue, 21 May 2024 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716306740; cv=none; b=H048jRCcuyf/En1V7GFpAuAdeUgD7Nngol4lJyW6C96WlxLimYVzm2w3sT27TWtM6KHefrLfrAT6VbL4wcgtORNojh4VTCN8VnY7wW/Yw4ywfi39OXDB7anoW886I9jvVIvGvoHWvlYVGPbq9pXbridHVHIpkk4st1yymiKTaFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716306740; c=relaxed/simple;
	bh=hhAiEHhq/+IVLuhBoxRZN0I/2XRvsWbz5OZ17hmIP3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mwb5BF0oh5y2AlKqyHs4QZWvzWayRwyEgLj/ZFlTYG3V4+7o09Yp53jHGDTyv2ZaVoJK/0pI+B78W2MCW5S0zRO4LgITOopbmfpUqfkDV3N4rOhTeaW0ARVrv8KycoLi0WgWwwfSHvWB1dbjeWjCnF+9F0u7CjppmitqXKc3RRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=L//SGsE5; arc=none smtp.client-ip=140.205.0.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="L//SGsE5"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716306729; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=BsUOCl1wZm20I4sMYgfdQkLnm5pLpgfzJ1P84WVKH8k=;
	b=L//SGsE5VDAlF5RD5xeq22SCzYkPZ9dwRKo654bI1EGaLT8pmSPP1pruzenn4lMbugVilLs7hPq8ZieF6MWwfJSQJnn19rMELfSXIUvuDOis0WQiGZ6GyQ/5vwpd730jLHPA4mXoRyb7BbYY6VyFicEfWYRwwqiEKr4jQBq5O4Q=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033055230028;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---.XjOK41._1716305793;
Received: from 30.236.49.195(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XjOK41._1716305793)
          by smtp.aliyun-inc.com;
          Tue, 21 May 2024 23:36:35 +0800
Message-ID: <e2646fa8-5f34-4114-b3b4-a6f2ea17d811@antgroup.com>
Date: Tue, 21 May 2024 23:36:32 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mm: Add update_mmu_tlb_range()
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 ryan.roberts@arm.com, ioworker0@gmail.com, libang.linux@gmail.com
References: <20240518074914.52170-1-libang.li@antgroup.com>
 <20240518074914.52170-2-libang.li@antgroup.com>
 <b356b558-d327-4bbc-9290-4e296877d145@redhat.com>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <b356b558-d327-4bbc-9290-4e296877d145@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

Thanks for you review!

On 2024/5/21 17:32, David Hildenbrand wrote:
> On 18.05.24 09:49, Bang Li wrote:
>> Added update_mmu_tlb_range(), we can batch update tlb of an
>> address range.
>>
>> Signed-off-by: Bang Li <libang.li@antgroup.com>
>> ---
> 
> The generic variant that is a NOP from patch #2 should go into this 
> patch as well.

Good point. Thanks for pointing this out.

Thanks,
Bang

> 
> Apart from that LGTM
> 
