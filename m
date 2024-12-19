Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FB1F541C
	for <loongarch@lists.linux.dev>; Thu, 19 Dec 2024 05:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734587357; cv=none; b=V4SvgQkC3E02QImiCNayVUnmvlKqautaT7/7Y3TdDx220XRbj4Lct8JckOkGHrLt06A6rhj2TpYdd2ypmCCwZ/cPwLNq8rr/wFc9lPiFHyDXLOIetXHvqb+JHDgSLJTr+Mbibzl6TixcZU7lUoj6NTwN6W8qC3BgwsDf0FyjOVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734587357; c=relaxed/simple;
	bh=3HBI5vOJhzDVa9C45kvTZsvkTt5M4M9NGjtPlj1opIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ma7WLXgRvMDcSHgGnlJDjul0ZOkvMk4eEDkhO+OmUatBk4GiLoKR9Lb+WpD4UxFkSI4vX6tF6sDpNpQ/AprLcSS01uI2+VFUfNiRsU5D4jzP9+3JCWSCv3T/XRkXOpspSClvnkZmSfjNTq+UurSYhzUH3WwkoKpUI0fWNAtO2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gIIodoxh; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gIIodoxh"
Message-ID: <c9fd9cdc-4116-4181-a1b5-2b5dd1e37f56@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734587351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GxOTIHaIVBN6tNPdwHI5uDp585nGYq3Fwp1EQkg5m9o=;
	b=gIIodoxhI1wRl+rQP1JKZosWAhJFPBVGP9E38MoBTo75QYxxZHrZUkln+ubQe7b+L/d2US
	4QK6hQaBFogZsS/h6ELnFw1sF5y2ahEmMrsMM8tyBYi5SVWY/1793IGuTpdFvzs8mPN92m
	e++f5weNhlcOALB/95I31v7+ahmWM6Y=
Date: Thu, 19 Dec 2024 13:49:02 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
To: Icenowy Zheng <uwu@icenowy.me>, Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Baoquan He <bhe@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zhihong Dong <donmor3000@hotmail.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231009042841.635366-1-uwu@icenowy.me>
 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
 <dfc53da9-a1ab-4ab3-aba2-d100f7f28b9b@linux.dev>
 <1e0f2174a72011cb1c78eeecbbf82a4ff108bf8a.camel@icenowy.me>
 <e9fef25e-3f83-46e9-a17c-d9f83e178311@linux.dev>
 <feb3545e650c04c8cc21c40dad36dbf4076b3ebc.camel@icenowy.me>
 <1090f735-8252-453f-b6c8-0ec35881ff32@linux.dev>
 <932a9a93c00082645df465862231f6d8c91f3bf6.camel@icenowy.me>
 <80e0813a-0651-41cf-a82d-776acbf1a5bc@linux.dev>
 <ffd9ab359d2234e7ed680f161152d95c449e96bd.camel@icenowy.me>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ffd9ab359d2234e7ed680f161152d95c449e96bd.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2024/12/19 12:49, Icenowy Zheng wrote:
> 在 2024-12-19星期四的 10:54 +0800，Sui Jingfeng写道：
>> On 2024/12/18 20:43, Icenowy Zheng wrote:
>>> For the fact of drm/ast's dramatical drop, it's because write to
>>> the
>>> framebuffer can no longer be reordered.
>>
>> No, your understanding is wrong, very very wrong and a big wrong.
>>
>> It's not because it can't reorder the write. Rather, it's because
>> that the CPU can't do write gathering and can't do burst write any
>> more.
> Write gathering is a kind of write reordering,


No, your understanding is broken.

Write gathering *isn't* a kind of write reordering.
Its doesn't have to reorder, it just cache the write operation with
the CPU's write buffer.


> comparing to strongly
> ordered writing (which is literally one byte per write).
>
>> So do you still think your patch is harmless?
> Well, I said that performance w/o correctness is meaningless.


The point is that Write-Combine on drm/ast will get both correctness and performance.


>>
-- 
Best regards,
Sui

