Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB57082B
	for <loongarch@lists.linux.dev>; Thu, 19 Dec 2024 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734604781; cv=none; b=ufvRK76ESvkdzg6hjLY+I9uJlB1Ck9Uu1QqLbUd1JpYfOIqXUSmpIAmXTmJPjdXYAjlh5XGyrDaXg/JrCpI4KjmZrbkfAMZXUbrPUBTXLrXHPFHLB78ged1EtuspYNEVj8wFL24tZzC87qbF9UjZMuZ8ML+uW49WuJ3F7QCPp4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734604781; c=relaxed/simple;
	bh=qLGHno9jKw0gzutcEaRXQK1OhugursBb+ylKlxkCipk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ll0XzaLtuH+/672sv31ok5C16ytWS26xR+ecbfadEJDlpS8dD8A2wakogotFhnKNMK1GCumH4ojuhBKq/fuipcIcufLHICHbUsDKJLCJWPWHhesylORhVc/XAdQ/OCWfPboLoSvLJ2EGKwainhp9YHJplky379cpL41sgSPMX8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xabeWk8I; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xabeWk8I"
Message-ID: <e32a07c7-18ff-49a4-98bf-dda10ab69f16@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734604777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkR6X4bfGTK8QyTGuNbHt0Eno8FN+kp80ttn6XMSsI0=;
	b=xabeWk8Ih1LSEDmcXNC43ot+OWcJ8tc6N5QEE+P0ps2BLTkgJ6tQCU57bzjHkX0Y/3cYYy
	YJAXgn4iHoAx1LaE2TykDxoJWWELiwps1ZBobF+E4wJfuU8HiAKxhZp8wvs3c04PTOIUNY
	MDNa1c6e6NlyksjEoHATdw8uQk4RJCc=
Date: Thu, 19 Dec 2024 18:39:26 +0800
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
 <c9fd9cdc-4116-4181-a1b5-2b5dd1e37f56@linux.dev>
 <bdef7b5dcf7c9b20bfb97ef66ee7e66bfcc304d8.camel@icenowy.me>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <bdef7b5dcf7c9b20bfb97ef66ee7e66bfcc304d8.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2024/12/19 14:38, Icenowy Zheng wrote:
> 在 2024-12-19星期四的 13:49 +0800，Sui Jingfeng写道：
>> On 2024/12/19 12:49, Icenowy Zheng wrote:
>>> 在 2024-12-19星期四的 10:54 +0800，Sui Jingfeng写道：
>>>> On 2024/12/18 20:43, Icenowy Zheng wrote:
>>>>> For the fact of drm/ast's dramatical drop, it's because write
>>>>> to
>>>>> the
>>>>> framebuffer can no longer be reordered.
>>>> No, your understanding is wrong, very very wrong and a big wrong.
>>>>
>>>> It's not because it can't reorder the write. Rather, it's because
>>>> that the CPU can't do write gathering and can't do burst write
>>>> any
>>>> more.
>>> Write gathering is a kind of write reordering,
>>
>> No, your understanding is broken.
>>
>> Write gathering *isn't* a kind of write reordering.
> It is, it changes the order "write A -> write B -> write C -> write D"
> to "write ABCD concurrently".

  
The reorder mentioned here isn't the main reason that
affect the performance. While the cache-like behavior
and better bandwidth utilizing (burst write) is.


> If one of B/C/D is a register that triggers latching A

Mips/Loonarch CPUs doesn't allow *uncached read* bypass writes.

This means that when you issue a *uncached read*, the former
write operation must have been resolved by the hardware memory.

But this is true only for *uncached read* issued by the *CPU*.

How can the "write B", "write C" and "write D" will trigger the
latching A here?


> in the former case it will latch A correctly but
> in the latter case it will wrongly latch the old value of A instead, so
> write gathering is not strongly-ordered.
>
>
For accesses from the CPU side, registers are mapped with *uncached*.
register access by the CPU are all strong ordered.

All DRM drivers mapped their register with strong order uncached fashion.
Do you ever seen any exceptions?


Even with the command submit approach, registers will not get written to
the hardware until the kickoff command is issued to the hardware.

The write order depend on the occurrence order in the ring buffer,
not the issue order. Commands that rank first in the ring buffer
will get executed first. But there is still no hints that
"write B", "write C" and "write D" will lead to "latch A",

So please stop cheating us by making up cock-and-bull story.


>> Its doesn't have to reorder, it just cache the write operation with
>> the CPU's write buffer.
>>
>>
>>> comparing to strongly
>>> ordered writing (which is literally one byte per write).
>>>
>>>> So do you still think your patch is harmless?
>>> Well, I said that performance w/o correctness is meaningless.
>>
>> The point is that Write-Combine on drm/ast will get both correctness
>> and performance.
>>
>>
-- 
Best regards,
Sui

