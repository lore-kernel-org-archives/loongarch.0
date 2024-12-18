Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7DE149C55
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 03:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734492263; cv=none; b=be/8XTYRCmGQoc2EB7QM+iPegkD+C+jq+QGACZxsfZwDDf5xIxNSWh+XDApmC8UzX67yLaUU0ePzqHBdE84NIQWtCrbhD1u9iqRpb9pGNNBuqmYyzZeC4QljESJ/gptQb93o8yMXEJdhlf0zhE+sXi2sgfdfH8ETpWO485N/xk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734492263; c=relaxed/simple;
	bh=ppkB9ff5SFanqDMBDulhEevphStN8oVCqnYmdagle6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbDaFfdvm9n9yVi2CwZAq6Iu7DdJCNXsHh9vCkrJXxYwuDTdxv2XyFPLpDJY72hMsfOwXyBJ6OLLhG25O4Syth671jCd2tUjQFqoeKzKmBARsIpXjV08B+35MZYlZ64WpRSvUL7JXbNH8wTJxuM2AQS2dq7kQu+k9QaygsHvCnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WlKOBUIU; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WlKOBUIU"
Message-ID: <655c2b73-4ecf-4201-83b8-bbddfd68027e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734492257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNp/HsutIeyxsolMC3DfsGwVmYfNUMobZor97BWbPI8=;
	b=WlKOBUIUQFdy3w4SR0kv3hmImRdAsBGVJrJah2bMF/T91Xipypt8yggEMs/4t7dyg5dOyj
	r8FB2anW1WnxrqMqBa42LEQItGNPyFznG2Ft9XIfVZcN9if/42SmSufEzNGvDNg80HdUZt
	QkiE3x3WhcPzZRzBfxhtGE+k4kioT6M=
Date: Wed, 18 Dec 2024 11:24:06 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
To: Shuah <shuah@kernel.org>, Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>, Icenowy Zheng <uwu@icenowy.me>,
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <c27875eb-0989-401b-98c3-f6e0a3ab88c2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/12/18 02:18, Shuah wrote:
> On 12/2/24 09:23, Sui Jingfeng wrote:
>> Hi,
>>
>
>>> IIUC this is a hardware bug of 7A1000 and 7A2000, so the proper 
>>> location
>>> of the workaround is in the bridge chip driver.  Or am I
>>> misunderstanding something?
>>>
>>
>> You are misunderstanding everything and ranting like a dog.
>>
>
> Sui Jingfeng,
>
> This is not the way to work with your fellow developers in the
> community to express disagreements.


I'm not expressing disagreements, but argue that the contributor
and/or talker should provide *sufficient* hardware details and
tests. Instead of pointless *ranting* in order to get harmful
patch merged.

The discussion completely not make scene at all.


> I would recommend following up with an apology.
>

I will not apology to indecent contributors and/or maintainers
like this, never.


> thanks,
> -- Shuah
>
>
>
>
>
-- 
Best regards,
Sui

