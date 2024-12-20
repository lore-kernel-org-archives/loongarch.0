Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B942156FD;
	Fri, 20 Dec 2024 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713015; cv=none; b=nZjhax88oVbzJw0UmWsLeBGILnybMr6y2T5iNcwy9+8FP614OSbdO3c2eud46gG0I5em9jeb1oL8vVzPRCujCbZemU5VM3mgkSDw8003qPHBVimGtFrwIVvEZgwVvEKpyqycyyTzLmY7Rf7vqPzR4V49/DPMcSlw7V4gQOUva0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713015; c=relaxed/simple;
	bh=LrgBFBJgMMLjjZl1A6YiBqDtZB7DhvV2TIDZSCAIi0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fycHB7b075AI0X15MBSdy/k0ic1as8j2huUikOhS8A/CxizMTemg0JZRUaYdL5t/8WcC9wLlm9Sm/ESW94tRsb2OT9eLQ1t5c7eFVwFeClN2KILY8TXIxnj8w5zcxW/0p5GJ1WAN9bA9d5qNj5zvhOeJzMFjzh3BZ2jIVN205iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMQ45tiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMQ45tiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B662C4CECD;
	Fri, 20 Dec 2024 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713015;
	bh=LrgBFBJgMMLjjZl1A6YiBqDtZB7DhvV2TIDZSCAIi0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mMQ45tiXkqhUXR//v/DhYcJiqxMcBM5QOeiWvyd1/wq3bt5cU9RZKO0mGKL5v6nz3
	 8vLeA833BkBipKSEDer5dpjbHmVEnkeGvXtMrZbKrEgXEHJyzVcO7E+0hAaZdVHC+o
	 To2g+KlKA8Px6/uCw5tm4070t8w8qnzyJWemXchPlxIF+D5OZmDeNS2nVZsQY6eL1Y
	 3/dKBCNzdk70XW/YY4e6Yrcq2MJ3EUMJjtKqDZGYXOJqF9Ze5HCarB47glHbVvOBEe
	 QSvz+mvpMRxKoCNz2j/uxsyMHWHXJojz1EGOtTae2BlPPhb7p1BpVx/6bK21DMKiih
	 AAx/jOXctNmCg==
Message-ID: <3e493e1e-07cb-40ff-823b-d166d0261a2a@kernel.org>
Date: Fri, 20 Dec 2024 09:43:34 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Shuah <shuah@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
 Icenowy Zheng <uwu@icenowy.me>, Huacai Chen <chenhuacai@kernel.org>
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
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <655c2b73-4ecf-4201-83b8-bbddfd68027e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/17/24 20:24, Sui Jingfeng wrote:
> Hi,
> 
> 
> On 2024/12/18 02:18, Shuah wrote:
>> On 12/2/24 09:23, Sui Jingfeng wrote:
>>> Hi,
>>>
>>
>>>> IIUC this is a hardware bug of 7A1000 and 7A2000, so the proper location
>>>> of the workaround is in the bridge chip driver.  Or am I
>>>> misunderstanding something?
>>>>
>>>
>>> You are misunderstanding everything and ranting like a dog.
>>>
>>
>> Sui Jingfeng,
>>
>> This is not the way to work with your fellow developers in the
>> community to express disagreements.
> 
> 
> I'm not expressing disagreements, but argue that the contributor
> and/or talker should provide *sufficient* hardware details and
> tests. Instead of pointless *ranting* in order to get harmful
> patch merged.
> 
> The discussion completely not make scene at all.
> 
> 
>> I would recommend following up with an apology.
>>
> 
> I will not apology to indecent contributors and/or maintainers
> like this, never.
> 

Either way the way the wording you are using your discussion is
not what is expected and understood as the code of conduct.

https://docs.kernel.org/process/code-of-conduct.html

thanks,
-- Shuah (On behalf of the Code of Conduct Committee)

