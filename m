Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F06770E2
	for <loongarch@lists.linux.dev>; Thu, 19 Dec 2024 03:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734578245; cv=none; b=ERZ+RO/o57MlhrjMnPSfZNYk0z3Pl4ZC8153679bRvwi1SsFnUStme5VlCt2sFhYVfS8SPZbp5GdOB1VBVpiO3RQIrDcam0mNNC+II4YQaIsYA52JMpXxrmwItkC0t171rwFG+jR64D6wum8uC1KpBTJud/ZoN2JoqCxmcsq7GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734578245; c=relaxed/simple;
	bh=8LJNLdut4jY0/WbyZydflJPtdFmg2478znbeBTD35W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Upi5JtKgotgIsnK4ECy4EruM5KPG5sMVSKinbDK/wCIEzeA6c05hhHa8B76lsWlZntyvAZVC3y+QwDq2iY1ZE64dGfgaQ9JZKFgEI0ILN9nvENCLOSLST9BZAxhBuytvHxxa26UJqdb1xqeNmTTL3/skL0JU5TbkSbfHhebun8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YklPlLOq; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YklPlLOq"
Message-ID: <147eda64-0673-4698-a79d-0bd367c80b70@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734578240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3vVQXNXtkPXfnHg2cTpnG2JnRBJFfTlUg5WlwSALSI=;
	b=YklPlLOqSgRG3uOE+gUmUwVLsvRF1jqkq09k1DkBavY02sPxr61Ds/U49PZ6QKs/wQbwOT
	7OvVnn1DCLeBvas4UVea0BOsaakGWUJNUli+dZhD7H4c5wQnWXwaa+NoKwyZOVEDSdS5lC
	hpOtS00Qrtat2ta20jwXV5HWh0hhpKE=
Date: Thu, 19 Dec 2024 11:17:12 +0800
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
 <0ca63dfb-ece7-4ea5-a61c-a80fa0567c4d@linux.dev>
 <8d38328adea0d752b09a91f69e7a94d4804ac725.camel@icenowy.me>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <8d38328adea0d752b09a91f69e7a94d4804ac725.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/12/18 20:37, Icenowy Zheng wrote:
> 在 2024-12-18星期三的 18:05 +0800，Sui Jingfeng写道：
>> Hi,
>>
>>
>> On 2024/12/18 14:23, Icenowy Zheng wrote:
>>> 在 2024-12-18星期三的 11:24 +0800，Sui Jingfeng写道：
>>>> Hi,
>>>>
>>>>
>>>> On 2024/12/18 02:18, Shuah wrote:
>>>>> On 12/2/24 09:23, Sui Jingfeng wrote:
>>>>>> Hi,
>>>>>>
>>>>>>> IIUC this is a hardware bug of 7A1000 and 7A2000, so the
>>>>>>> proper
>>>>>>> location
>>>>>>> of the workaround is in the bridge chip driver.  Or am I
>>>>>>> misunderstanding something?
>>>>>>>
>>>>>> You are misunderstanding everything and ranting like a dog.
>>>>>>
>>>>> Sui Jingfeng,
>>>>>
>>>>> This is not the way to work with your fellow developers in the
>>>>> community to express disagreements.
>>>> I'm not expressing disagreements, but argue that the contributor
>>>> and/or talker should provide *sufficient* hardware details and
>>>> tests. Instead of pointless *ranting* in order to get harmful
>>>> patch merged.
>>> I don't think the original patch is harmful.
>>>
>> I have told you countless times, that is, disabling Write-Combine
>> made the performance of BMC graphics(drm/ast) decrease dramatically.
> So do the ast driver have any kind of command queues that needs to be
> read by the card and executed? If it has, I assume it will break like
> amdgpu/radeon if this is utilized (I remember ast has some 2D accel);
> if it does not have, then maybe you can add an architecture-specific
> pgprot type (e.g. pgprot_wuc), see how pgprot_noncached_wc is defined
> for PowerPC or pgprot_device is defined for ARM64


drm/ast driver doesn't perform DMA to/from system RAM so far.


>   -- in fact you may
> find another architecture that have some page attribute that behave
> like WUC on LongArch; and then utilize the newly introduced pgprot type
> in drm/ast, instead of using WUC as pgprot_writecombine, which do not
> exactly match (usual driver expect an ARM-like behavior of
> pgprot_combine, I assume).


This exactly saying that your patch is unqualified, because its not
entirely an arch-specific problem.

Your patch, together with other WC disable patch make the WC mapping
of LoongArch completely broken. then you told us "you don't think
the original patch is harmful" ???


>> And downstream Loongson developer really dislike related patch,
>> and asking for solutions to me.
>>
>>
>>>> The discussion completely not make scene at all.
>>>>
>>>>
>>>>> I would recommend following up with an apology.
>>>>>
>>>> I will not apology to indecent contributors and/or maintainers
>>>> like this, never.
>>>>
>>>>
>>>>> thanks,
>>>>> -- Shuah
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
-- 
Best regards,
Sui

