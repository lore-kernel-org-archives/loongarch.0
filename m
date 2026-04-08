Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7738D3264EF
	for <loongarch@lists.linux.dev>; Wed,  8 Apr 2026 01:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775611204; cv=none; b=HNoJl4e0MBdpw2urMHtgFpm9hY7Y3lUD7zDA+b/QLKpAK8jFrKfhk3GfMSvGFLnswBFNUdgD0iZV1g+psArk+l5m/wK4DSj3kq1V8oYjlmq2vRvRwBINd/uVCpX7UQQb5cYjJ8fzK0izhaYsd0TQ9ebcvZwxUbNJC19O3Lc99C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775611204; c=relaxed/simple;
	bh=O1MOzrmk1TiZigp+6QJSghRKkTyKApwrrt6yfCPtkxY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pdEfk1W1n7KPM0Ir53McWNDeYTk/DE/wlt4poZoLJ67/vSXQMvB9nJeNi5D4/shw+PhYi/yowuk3vtpAkYUTsfSyrOIwnmhVcL2W/Kfh850lSRHJ5GIN9hI/KFtniG9HgZRl5nCsOXo36KjOkyhDERAqNwJAQcYHPZY3t7LB5zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Dx88A_rdVpZvsiAA--.38227S3;
	Wed, 08 Apr 2026 09:19:59 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxTMI6rdVpawNoAA--.64749S3;
	Wed, 08 Apr 2026 09:19:56 +0800 (CST)
Subject: Re: [PATCH] LoongArch: add spectre boundry for syscall dispatch table
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, arnd@arndb.de, jiaxun.yang@flygoat.com,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, stable <stable@kernel.org>
References: <2026032456-crinkle-washable-96ea@gregkh>
 <f59de81b411d1a48f9f0fa4f8c9c553a92076817.camel@xry111.site>
 <2026032541-rental-sizably-48bd@gregkh>
 <2026040259-landowner-chamomile-f581@gregkh>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <60f0307f-0c44-4f14-0185-4f0a16cf3a9c@loongson.cn>
Date: Wed, 8 Apr 2026 09:17:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2026040259-landowner-chamomile-f581@gregkh>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTMI6rdVpawNoAA--.64749S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4fAw4fXF17Aw4kAFWfCrX_yoW8XrW8pF
	WfJ3ZFkF4DJF4fAwnFg3W8uFyIywsrXrnrXF15tryjvF90gryagr40ga409F98uw1DG3y0
	qF40qa47t3WUAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxYiiDUUUU



On 2026/4/2 下午10:36, Greg Kroah-Hartman wrote:
> On Wed, Mar 25, 2026 at 09:53:09AM +0100, Greg Kroah-Hartman wrote:
>> On Wed, Mar 25, 2026 at 11:26:29AM +0800, Xi Ruoyao wrote:
>>> On Tue, 2026-03-24 at 17:30 +0100, Greg Kroah-Hartman wrote:
>>>> The LoongArch syscall number is directly controlled by userspace, but
>>>> does not have a array_index_nospec() boundry to prevent access past
>>>> the
>>>> syscall function pointer tables.
>>>>
>>>> Cc: Huacai Chen <chenhuacai@kernel.org>
>>>> Cc: WANG Xuerui <kernel@xen0n.name>
>>>> Assisted-by: gkh_clanker_2000
>>>> Cc: stable <stable@kernel.org>
>>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>> ---
>>>> My scripts caught this as I think LoongArch is vulnerable to the
>>>
>>> There's no evidence.  The kernel currently report all LoongArch
>>> processors invulnerable to spectre V1 via cpuinfo.
>>
>> Where is that?  In the sysfs files, or in the actual silicon testing?
>>
>>> So NAK unless there's a reproducer of spectre V1 on LoongArch.  If so
>>> we'd also need to adjust the cpuinfo output.
>>
>> I really thought this cpu was vulnerable to this, but if the companies
>> say it isn't, then great, but reports like this:
>> 	https://cc-sw.com/chinese-loongarch-architecture-evaluation-part-3-of-3/
>> say that the silicon is vulnerable.  So, which is it?
> 
> Any thoughts about this?
co-ask though it is hard to decide :(

Regards
Bibo Mao
> 
> thanks,
> 
> greg k-h
> 

