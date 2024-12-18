Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C84F155345
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734516375; cv=none; b=io8o6rAcTNCpbZOHF+tVP3cEuibcipA3HoyCyr7c5hj5ujwkJMbD3mUA9ugsdEE5Mkd3WlhnTLQbSzMK30NrPxQGGMJ3juIb4xebadP7RWyeJ/KJqdPltwroJIZcm+8DUc/VgFZWSad34PKzJ1/d6pEIv1HV9VQAmm+KogXH0+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734516375; c=relaxed/simple;
	bh=sytyIIuEx0b27l7Rte0Qfm42ueq1m/i8UuJbUAH0BLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=taM+2FxFQG21V/pfE1faSRGo6zhtuuxxkkA2aCAF9xwCTTSDOfa8841icd78qpDEdHtFg1lKZk1fz2Y+MJf0NHFQ8Kfs9AwzU5ZS5+zzYQEuWcIQoPco1m73mVRW+0uCR5Qv+i6LItlmt52KKFnF3AwPR+DTWzWsZaeUzRWPE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SzSVL+Cg; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SzSVL+Cg"
Message-ID: <0ca63dfb-ece7-4ea5-a61c-a80fa0567c4d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734516369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7F6NW7cU1abftqimlTrJMx6JXD3uMircyO40tKeKXg=;
	b=SzSVL+CgKKJQYpV1lYBEjwGA7aPiBhUM3FJOJk1wxvigw4lo6ifi0MFH9pvapH6e54aH2U
	nwyasoRWYMNRPkMY/YxzzN6ooshVzwQq9xjI33v+EL32cCvS2Pk8L6G3jVdWhLmHj7BbJ3
	Qd5/1wJ7P3jxbq5YY608CvMGSszzAKY=
Date: Wed, 18 Dec 2024 18:05:59 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
To: Icenowy Zheng <uwu@icenowy.me>, Shuah <shuah@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Baoquan He <bhe@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zhihong Dong <donmor3000@hotmail.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 "conduct@kernel.org" <conduct@kernel.org>
References: <20231009042841.635366-1-uwu@icenowy.me>
 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
 <dfc53da9-a1ab-4ab3-aba2-d100f7f28b9b@linux.dev>
 <c27875eb-0989-401b-98c3-f6e0a3ab88c2@kernel.org>
 <655c2b73-4ecf-4201-83b8-bbddfd68027e@linux.dev>
 <0f3989e46dd24a0c972482ea570907e5d8cae87e.camel@icenowy.me>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <0f3989e46dd24a0c972482ea570907e5d8cae87e.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/12/18 14:23, Icenowy Zheng wrote:
> 在 2024-12-18星期三的 11:24 +0800，Sui Jingfeng写道：
>> Hi,
>>
>>
>> On 2024/12/18 02:18, Shuah wrote:
>>> On 12/2/24 09:23, Sui Jingfeng wrote:
>>>> Hi,
>>>>
>>>>> IIUC this is a hardware bug of 7A1000 and 7A2000, so the proper
>>>>> location
>>>>> of the workaround is in the bridge chip driver.  Or am I
>>>>> misunderstanding something?
>>>>>
>>>> You are misunderstanding everything and ranting like a dog.
>>>>
>>> Sui Jingfeng,
>>>
>>> This is not the way to work with your fellow developers in the
>>> community to express disagreements.
>>
>> I'm not expressing disagreements, but argue that the contributor
>> and/or talker should provide *sufficient* hardware details and
>> tests. Instead of pointless *ranting* in order to get harmful
>> patch merged.
> I don't think the original patch is harmful.
>

I have told you countless times, that is, disabling Write-Combine
made the performance of BMC graphics(drm/ast) decrease dramatically.

And downstream Loongson developer really dislike related patch,
and asking for solutions to me.


>> The discussion completely not make scene at all.
>>
>>
>>> I would recommend following up with an apology.
>>>
>> I will not apology to indecent contributors and/or maintainers
>> like this, never.
>>
>>
>>> thanks,
>>> -- Shuah
>>>
>>>
>>>
>>>
>>>
-- 
Best regards,
Sui

