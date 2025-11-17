Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47030E84F
	for <loongarch@lists.linux.dev>; Mon, 17 Nov 2025 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763361732; cv=none; b=ue4DaCJu9P/9QFbAb3IBbO6iUpz3pkIuWkQVuQYJPIcv739DxsIaK0Zj9fxeJ9TkwTMvYi45Xel2WmzcTt/lQbNurcwh75LTmexv+j/hYsxzMJTEU6tR0Y56Jo9VQ6IpcBp8drZZkEW4zZ5gWcF9q0DXySCZTP/mNv/9crcGbH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763361732; c=relaxed/simple;
	bh=hWqNY7muDzX4eHDWmSxYlqHlAWmhyiLq5vYJBTcMrpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHG9l1aFsobECirXjtIEPCoWRCoYDqVaWOD7ZlTEyVNWqTVAOo5qM+zp/HdYI+rT393EhXRrVxkXQ/sxt5oYhBpk1EC7lIL7hiFwzamWLX3QXKycnCJRiGV5Rq0E9xbI413G8fMQ2hW9Xra2CXweOp5DPOAQj9mrvUtqiyfZLH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LXkvl6fW; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LXkvl6fW"
Message-ID: <8fbeb3e8-7c30-46f6-a0a4-289efbf45ac0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763361727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F61/44VrimXOAEuXiMeNmI+aj0JYokmyCnACi/yOoLA=;
	b=LXkvl6fWXks2EBeWBZhRCeAyF3ikTcHZiBnXiOf/E69BeQQS14g5s1Z7/bB8YxlQXeJX97
	ZSrM63UX77TU+weQcxR68BHoTI37uR0exm53LyIVRGyINLRhjXjK25ABUedOBpfn59DJNX
	OX6fbBjMivdCT5ijsyT8t8ax4mXTWFY=
Date: Mon, 17 Nov 2025 14:41:10 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] loongarch: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Huacai Chen <chenhuacai@kernel.org>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
 david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, WANG Xuerui <kernel@xen0n.name>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <146b5a0207052b38d04caac6b20756a61c2189b3.1763117269.git.zhengqi.arch@bytedance.com>
 <CAAhV-H6HL+mXeuLqgo5BOVBB0_GHTUmn7_7NTzdUpLX7NbuQ5w@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <CAAhV-H6HL+mXeuLqgo5BOVBB0_GHTUmn7_7NTzdUpLX7NbuQ5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Huacai,

On 11/14/25 10:17 PM, Huacai Chen wrote:
> Hi, Qi Zheng,

[...]

>>
>> -#define __pmd_free_tlb(tlb, x, addr)   pmd_free((tlb)->mm, x)
>> +#define __pmd_free_tlb(tlb, x, addr)   \
>> +       tlb_remove_ptdesc((tlb), virt_to_ptdesc(x))
> I think we can define it in one line.

Do we need to change __pte_free_tlb() to a single-line format
as well?

Thanks,
Qi


>>

