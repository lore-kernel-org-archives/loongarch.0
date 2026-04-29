Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA89A347537
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777451009; cv=none; b=XMvljOjInUUPAEejANHRSH9JXsPfImYbTkugKEzBO1xv9l60KLAs4NA122UM935nVtGfKYl81tBgvrEEQdzZmCW2H1M8+tiaCBJ6ahHdGOYzfqQlfn7jB1CrLHwir08SWj+ROgB0Jz0mWNysew5MQqOFyBZ7l/h8iVL9+Uuyr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777451009; c=relaxed/simple;
	bh=eRNRyNdidZRxIOcsxwtVWH6uNMEaN1rVXKzz2RrTKP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehtECAAwGIy1N/DDz/nohUOC2URDoGglVY3BBYDw1w8Uz+rDcWjQu/op6h6Y6AF3OAQfSe7WAsj+ndNcfsDGLXUpfM+iKsZCPCzNUd1s3ggSk1LOyNFMMQgE3B8VCTyptVepbillsl0Yb/qSxtT1Ua2gxH8HLNHx+GCxSci30Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ab21a42243a411f1aa26b74ffac11d73-20260429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4d4166f6-496d-448f-ae46-fd6abee5db6c,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:7
X-CID-INFO: VERSION:1.3.12,REQID:4d4166f6-496d-448f-ae46-fd6abee5db6c,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:7
X-CID-META: VersionHash:e7bac3a,CLOUDID:7cfc717089355e2558956236c985aa7e,BulkI
	D:260429154131KCWQ9OGE,BulkQuantity:1,Recheck:0,SF:17|19|38|64|66|78|80|81
	|82|83|101|102|127|817|841|898,TC:nil,Content:-10|-8|-5|15|50,EDM:-3,IP:-2
	,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1
	,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab21a42243a411f1aa26b74ffac11d73-20260429
X-User: cuitao@kylinos.cn
Received: from [192.168.108.130] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1719461692; Wed, 29 Apr 2026 16:23:15 +0800
Message-ID: <08049275-494f-46e1-8f74-5c5451f1fd17@kylinos.cn>
Date: Wed, 29 Apr 2026 16:23:11 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch/KVM: Simplify _kvm_pte_init with memset64
To: Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>
Cc: zhaotianrui@loongson.cn, loongarch@lists.linux.dev, kernel@xen0n.name
References: <20260428131138.409698-1-cuitao@kylinos.cn>
 <be0a5d0c-b2c9-67f5-7497-977acc6fa1f9@loongson.cn>
 <CAAhV-H5Hat1rJywzw2CoLZYf=+hXea35zsvT+xyBOxPVk0z0ZA@mail.gmail.com>
From: Tao Cui <cuitao@kylinos.cn>
In-Reply-To: <CAAhV-H5Hat1rJywzw2CoLZYf=+hXea35zsvT+xyBOxPVk0z0ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>>
>> what is the benefit of memset64() here? I think that 8x loop unrolling
>> is better from performance side. The page size is 16K or 4K and buffer
>> is large enough, unrolling seems to be better.
> I agree.
> 
> Huacai
>>
>> Regards
>> Bibo Mao
>>

Thanks a lot for your review, Bibo and Huacai.
You are absolutely right. When I looked at the usage of this function, I only intended to make the implementation functionally simpler, but overlooked the performance benefits of the loop unrolling. With PTRS_PER_PTE = 2048, the generic implementation is indeed less performant than the current version with 8-fold loop unrolling.

Thanks.
--
Tao Cui
