Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E71C2B
	for <loongarch@lists.linux.dev>; Fri,  2 Dec 2022 09:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1669974091; bh=nTT0ilheWD/3fMGwEcxDEoa3N2e80hM8iKbFgRZk4Ik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hyyVLg8gtKAx4gllhlbxHai/dV541Fd3Rc4eaff4gddJLFhVLkGukGKVdGb4P6FVm
	 VWRmCKt1Q1dzQL1foTM0h+7UhGb8Th7Bto+dkin+WqO/wAEvnaShf/yd05MAAVtGEP
	 zbl/7KOshXS9xvWsIa0EV5PGLRq5+ROLtmx+EGjM=
Received: from [100.100.35.204] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7C6BA600F8;
	Fri,  2 Dec 2022 17:41:31 +0800 (CST)
Message-ID: <c00462a5-c5c0-a749-15aa-c0efaf232e71@xen0n.name>
Date: Fri, 2 Dec 2022 17:41:30 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0)
 Gecko/20100101 Firefox/109.0 Thunderbird/109.0a1
Subject: Re: [PATCH] LoongArch: export symbol with function
 smp_send_reschedule
Content-Language: en-US
To: maobibo <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221202075854.2253116-1-maobibo@loongson.cn>
 <07e0d775-6bb7-051b-9ec9-71153efbdf21@xen0n.name>
 <c5e1b113-f457-2cc7-808b-b13f83adbb2b@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <c5e1b113-f457-2cc7-808b-b13f83adbb2b@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2022/12/2 17:03, maobibo wrote:
>>> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
>>> index 6ed72f7ff278..51dd3c3f06cb 100644
>>> --- a/arch/loongarch/kernel/smp.c
>>> +++ b/arch/loongarch/kernel/smp.c
>>> @@ -141,6 +141,17 @@ void loongson_send_ipi_single(int cpu, unsigned int action)
>>>        ipi_write_action(cpu_logical_map(cpu), (u32)action);
>>>    }
>>>    +/*
>>> + * This function sends a 'reschedule' IPI to another CPU.
>>> + * it goes straight through and wastes no time serializing
>>> + * anything. Worst case is that we lose a reschedule ...
>>> + */
>>> +void smp_send_reschedule(int cpu)
>>> +{
>>> +    loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
>>> +}
>>> +EXPORT_SYMBOL_GPL(smp_send_reschedule);
>>> +
>>
>> While the change is in itself okay (one less case of mips legacy, getting in line with ia64, powerpc and riscv that all EXPORT_SYMBOL_GPL this), I'd suggest you batch this patch with the subsequent changes you plan to enable with this one, so reviewers would have more context and hopefully avoid churn. (I, by my familiarity with Loongson and LoongArch development, know you're probably aiming to use this with KVM, but others probably don't know, and again it's always better to have more context.)
>>
> 
> yes, kvm module depends on function smp_send_reschedule, only that it is not mature now. And this function is standard API, not arch specified API, it is normal for modules to use it :)

Hmm, maybe you could post some kind of "sneak peek" code for early 
reviews on broader things like overall approach and architecture? 
Frankly speaking, experience suggests that code from Loongson usually 
needs much refactoring to meet mainline standards, and posting your 
design and some initial implementation could save you and the community 
a *huge* amount of time and hassle.

And I'm not arguing this patch shouldn't get included, it's the 
opposite, but I don't see any difference in applying it now or later 
when the whole LoongArch KVM support gets mainlined, so maybe it's 
better to wait so we don't cause any churn if the change turns out 
unnecessary. For example, in my grepping I found that x86 doesn't have 
smp_send_reschedule exported, yet its KVM port has no problem using it; 
and that the s390 and riscv KVM ports don't invoke smp_send_reschedule 
at all. So it's entirely possible that LoongArch won't need this change 
for KVM after all, and I'm suggesting to save everyone some time.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

