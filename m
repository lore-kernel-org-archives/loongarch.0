Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B503E1AB53A
	for <loongarch@lists.linux.dev>; Tue, 21 Jan 2025 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451223; cv=none; b=rFFcRGyELxEKJ9Isw94j+C3PJI8RiRu5N0uL/22/NflRFwGYyK4Xk3Gy3vlhDHS0Sl87x3erNbUVDobNQKoHaoLP6fIKuOBdvtuig1LoVZY54ja0HugUtDEajhEvrOtSLH20jqvD2zLqa9Di4sVeQe/OegRHxtN/WCuFeibgkhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451223; c=relaxed/simple;
	bh=k9Jsuhp577BbmaCGQFhRTg4q2s7l0fsHhlftxj2VmYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fg0H45MuSkvflffWGYsvLM/mFE33W2ysI+Yh/Lfo09Kdn53xEPowzM2PzqMikZu9SM9FSscsU3fEltXjjQSGBpcTI8OgAYHthRnKiHAW2GvHDefgaaXgRAZBvVkGHpOVRvA6HLh/e8MBfZT2kV0Kn32FHU2feR3WxIQ4aNC/GA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bTAIm5tk; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bTAIm5tk"
Message-ID: <35a07230-08f9-472c-bb30-bd1c1ca912d6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737451203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1foXokueCyiRWhPEbqH1L0+2RD6uPyhTbnZUJ2h/js4=;
	b=bTAIm5tkPlO3izsHEiiStkYUkxOnj8INfL5aQLJD0cfOsG1jRamq3INLgbF7BfR1xwrKPL
	7iLSmhzT4UXk4opEDw3pd20k1D53GXK377ERAlWJobqJrk8/SFy3vl1rnyS4+OnFqSltUw
	KKl9/Lo3AjExjB2zQ76jONE8Vt5YxZA=
Date: Tue, 21 Jan 2025 17:19:53 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
To: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
 Icenowy Zheng <uwu@icenowy.me>, Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Weihao Li <liweihao@loongson.cn>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Jun Yi <yijun@loongson.cn>, Baoquan He <bhe@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Hongchen Zhang <zhanghongchen@loongson.cn>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Zhen Lei <thunder.leizhen@huawei.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>,
 Zhihong Dong <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Shuah <shuah@kernel.org>,
 "conduct@kernel.org" <conduct@kernel.org>
References: <20231009042841.635366-1-uwu@icenowy.me>
 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
 <73ddfc81-3f94-4403-8bb2-d537742a7042@loongson.cn>
 <049fbd3906b60f75be3900f20f6974967da374f3.camel@xry111.site>
 <00d5150cadcb8b60004284ad43810adef52aab37.camel@xry111.site>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <00d5150cadcb8b60004284ad43810adef52aab37.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2023/10/13 21:53, Xi Ruoyao wrote:
> On Fri, 2023-10-13 at 21:15 +0800, Xi Ruoyao wrote:
>> Again, why this is only an issue with AMD or ATI GPUs?
>>
>> Can you provide some detailed documentations about this hardware issue
>> so the community can help to figure out a solution?


I don't ever owns you anything, so I think I don't have any obligation
to have to provide you something, right?


> 3 years ago we had https://lkml.org/lkml/2020/8/10/255:

Its not "we". Just him or "you" if you want to pretend to be included.


>     In this case the patch is a clear NAK since youhaven't root caused the issue


Excuse me, its not me posting that patch to upstream anyway. So who don't have the
root cause? Can you figure out different person at the first place? Please?


>   are just working around it in a very questionable manner.

The patch[1] that this patch fixes are circumvent the root issue in a very questionable manner.

So, who don't know the root cause? or just cheating the community, pretend it solve the problem?

[1] https://lore.kernel.org/loongarch/20230315085314.1083141-1-chenhuacai@loongson.cn/

> and
>
>     But when the hardware doesn't correctly implement WC for PCIe BARs, then
>     this is a violation of the PCIe spec and a bit more serious issue for
>     the whole platform.
>
> So do we know the root cause now?

Its not "we" here, we are not on the same side.

So the proper expression is "Do you *really* know the root cause now"?

>   <rant>Or in all the 3 years we

Not including you here.


> just keep carrying a problematic workaround downstream,


Who told you that its problematic?

Again, its works *super* well for *both* discrete GPU and Loongson integrated graphics.

With the patch applied, Loongson has been sell tons of machine and making million dollars,
if not billion.

So *who* exactly told you that its problematic? Did him ever use Loongson machine?
Did him responsible for Loongson downstream *product* and commercial deals?

If you can't effectively answer those questions, please stop your nonsense.

> burying the head into the sand like an ostrich,


I neverbury my head into the sand and I'm not like an ostrich.

In the past, Loongson downstream developers are rather diligent and busy .

I don't think I deserve this insult, so please stop it and apology.


CCing conduct@kernel.org and CCing shuah.


> and self comforting with "oh they don't understand our hardware"?!</rant>


This is exactly what I'm helping to resolve, just help the community to
figure out the root issue. Seek better solution so that we can avoid
endless the low-end repeation.

We certainly don't hope Loongson continue to produce such an ill CPU
and/or bridge chips all the time.


> Even if the problem is really "they don't understand our hardware" you
> need to provide some materials to help people understanding the hardware
> better.


Again, Its not me posting the patch anyway. So please stop the blaming and
the spams.


> If we cannot figure out the root cause or a proper fix is too difficult,
> we should *at least* have a cmdline option and/or a configuration option
> to allow the user to decide, like how we treat these spectre-like bugs.
> "Should the option be enabled or disabled by default" can be debated
> later.
>
> And please try to fix the hardware, to me it will be a compelling reason
> to pay some money for an upgrade :).
>
-- 
Best regards,
Sui

