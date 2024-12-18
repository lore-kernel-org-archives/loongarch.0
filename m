Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCB319C578
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517806; cv=none; b=Jz2oRGzmyVkZCW9b8iOTmOmQ8CkrLQcptJuVoEgMdBzLX9cFrSJdEibs2zonuadxVq1/aYYLPNDf3DCQhAGrMx/VaygB6RIFaZnYTqlHFRz/oQ3gceXdu2sjFVcsxmYsNPr99VQEmU/q7iVO0JlgrcbkUrj9vyRfguUsow7pvDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517806; c=relaxed/simple;
	bh=ywHdvGVxaz9JX7Ni+arNsMLJnO+IOZvHxCRcTz1VmBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0caMhEjNGA3w4Gq0LZ3+DNdj6VHfjyg+JCeOtgX7D6CdS+9POjafqCKaiQC3uK+T4V4i/3ZL2nMPK3Fa9umi3ClXjPfFUfwmv7sW+sCDLx4cGnv27uL6S6v2odA8CiBjq8ULnBt5kBfNkkOLAD9c+9/sg0EsHooJNcHlSdesTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=co6R1jKa; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="co6R1jKa"
Message-ID: <1090f735-8252-453f-b6c8-0ec35881ff32@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734517802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eXTJ4vJJqmGRwUNZB5rReGLDyJycKIgyx6I2UbxVhJY=;
	b=co6R1jKafuzxhtlmhoYQhX7wj6pbxXV8AKbJ56Gz/FPacJ02MGeFQjiFXozZMvB13XHozy
	tEkvgkVqj0JnwEhGIHfkiKZpdPwPDdtwk1EOr1B5IBcqftUK2E1lqYky49tLWkjv9S8/ot
	R8Q7nm0GvvyOuUe9zTEGR4zXKGrP1Ck=
Date: Wed, 18 Dec 2024 18:29:53 +0800
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <feb3545e650c04c8cc21c40dad36dbf4076b3ebc.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2024/12/18 13:47, Icenowy Zheng wrote:
> 在 2024-12-18星期三的 11:05 +0800，Sui Jingfeng写道：
>> Hi,
>>
>>
>> On 2024/12/18 07:44, Icenowy Zheng wrote:
>>> 在 2024-12-03星期二的 00:23 +0800，Sui Jingfeng写道：
>>>> Hi,
>>>>
>>>> On 10/10/23 20:26, Xi Ruoyao wrote:
>>>>> On Tue, 2023-10-10 at 11:02 +0800, Sui Jingfeng wrote:
>>>>>
>>>>>> On LoongArch, cached mapping and uncached mappings are DMA-
>>>>>> coherent and guaranteed by
>>>>>> the hardware. While WC mappings is *NOT* DMA-coherent when 3D
>>>>>> GPU
>>>>>> is involved. Therefore,
>>>>>> On downstream kernel, We disable write combine(WC) mappings
>>>>>> at
>>>>>> the drm drivers side.
>>>>> Why it's only an issue when 3D GPU is involved?
>>>> No one saying that only 3D GPU is suffer from this kind of issue,
>>>> I just meant that the issue is there at least for GPU
>>>>
>>>>> What's the difference between 3D GPUs and other devices?  Is it
>>>>> possible that the other
>>>>> devices (say neural accelerators) start to perform DMA accesses
>>>>> in
>>>>> a
>>>>> similar way and then suddenly broken?
>>>> You, the patch contributor or the maintainer or whatever stuff
>>>> should carry on the test, right?
>>> Well doing some test on PCIe peripherals need some professional
>>> tool,
>>> then I assume who raises the idea should do it, because not
>>> everyone
>>> can do.
>>
>> You are posting the patch, and then you are acclaiming that you are
>> not even able to do sufficient test? right?
> What I can test is that w/o this patch things break and w/ this patch
> things work.


> If you are against this patch, you need to provide more effective
> evidence / a better solution than my approach.


I have told you several times, we are asking for hardware details.
Why the Loongarch suffer from the WC bug, like the Loongson Mips?
Why the performance of drm/ast's drop dramatically when your patch
is applied?


>>
-- 
Best regards,
Sui

