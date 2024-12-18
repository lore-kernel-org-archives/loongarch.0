Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19612487A5
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 03:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734491172; cv=none; b=RSS0o/7pDQIO1Lv8IOI5oZIL6wAbqQgD2edWz8Ow9FQfICWNgcFq3E6vRFZ/8xikh5PLvpTovVoMH2APgAYmNFOIyVOPvVSLc5sKHz1LrYhPb5VrKg2dvmJ6ZYm27RgoQ2SF9F/uKCa6FrBf6lk1boGEFxIFyD0a/iuitjnKYfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734491172; c=relaxed/simple;
	bh=8hClVA8lus7Wnn3lbDmQL4xCQ+eA65B2Q7smOT14wGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IURWlQX0tCbjOLYozf1lShRH3FGW4bUgsNrG9YXKbt+Cfgb5mRXA6hoH6WjC2QCoaQ/baTOounrU6a78leIBlnx0zAao+BzVOvoRcKalb/7E9y321X5ISb6ZkkWq62InY8BU1f//6GiReJS9DhTFho2XUtadR0RqmTaj/4CrlAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wenGku/z; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wenGku/z"
Message-ID: <e9fef25e-3f83-46e9-a17c-d9f83e178311@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734491167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8hClVA8lus7Wnn3lbDmQL4xCQ+eA65B2Q7smOT14wGY=;
	b=wenGku/z2rMzxYX+IeXPNbsCqzGgJ2kdZ8/XPooMWE+vcAZFkRynoSrD+VLt5/LO4iuqZ6
	wRNnYeRU9KmNL8l2+knPcL0fMssJtsLeL1LAJ4ylLdVFIsTjyapU689D9qhdSpRFu0pZSA
	8jWf004dFJbzMc6WhFhSA+mTHrtndGo=
Date: Wed, 18 Dec 2024 11:05:58 +0800
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <1e0f2174a72011cb1c78eeecbbf82a4ff108bf8a.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/12/18 07:44, Icenowy Zheng wrote:
> 在 2024-12-03星期二的 00:23 +0800，Sui Jingfeng写道：
>> Hi,
>>
>> On 10/10/23 20:26, Xi Ruoyao wrote:
>>> On Tue, 2023-10-10 at 11:02 +0800, Sui Jingfeng wrote:
>>>
>>>> On LoongArch, cached mapping and uncached mappings are DMA-
>>>> coherent and guaranteed by
>>>> the hardware. While WC mappings is *NOT* DMA-coherent when 3D GPU
>>>> is involved. Therefore,
>>>> On downstream kernel, We disable write combine(WC) mappings at
>>>> the drm drivers side.
>>> Why it's only an issue when 3D GPU is involved?
>> No one saying that only 3D GPU is suffer from this kind of issue,
>> I just meant that the issue is there at least for GPU
>>
>>> What's the difference between 3D GPUs and other devices?  Is it
>>> possible that the other
>>> devices (say neural accelerators) start to perform DMA accesses in
>>> a
>>> similar way and then suddenly broken?
>> You, the patch contributor or the maintainer or whatever stuff
>> should carry on the test, right?
> Well doing some test on PCIe peripherals need some professional tool,
> then I assume who raises the idea should do it, because not everyone
> can do.


You are posting the patch, and then you are acclaiming that you are
not even able to do sufficient test? right?


