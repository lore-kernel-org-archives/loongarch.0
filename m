Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2152673B0
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764138542; cv=none; b=NdZPUClIbb73LVHCOZg0mOWaJUW4f1qXbzXNe14sOBVkrKiJ3ilIDUFq68ZDCT+Lfc4i0x/xf91ydUrRWbXgZd+xWbpalqaQzoIIr1KTEXFjwv68OTySYfwRDtGPdVxQo7HzUHG0FhBry/3dessDID4Mrc+6zpqhNAXXTJEjs3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764138542; c=relaxed/simple;
	bh=06xRerrZ31MaDve+DwqlFWNOVYHniCRawXHhcBZvSFo=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RREcUPABUOnVJeFHAyR83lThKkdNizb8wAWgpzq2Z0RYUANf4gM+Hb5PLa9u1LCI9ptZzDuSFlx6FhwVLlkVwz/M4XLwNFGOi3Wjtb7zrcEhmCgnlxUHw9x5VgRIs5IFVZfl6IySGWCave+oFwlXVaNI0lOypMxk+DPCv6UbZTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx7tIpniZpQzQoAA--.15814S3;
	Wed, 26 Nov 2025 14:28:57 +0800 (CST)
Received: from [10.130.40.41] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxTMEoniZph78_AQ--.49310S3;
	Wed, 26 Nov 2025 14:28:57 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Jinyang He <hejinyang@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn>
 <6cc59312-7cdc-19a5-4d18-e120ea9c7563@loongson.cn>
Message-ID: <3c0602aa-a8bc-25b9-7d7a-467e04dbc519@loongson.cn>
Date: Wed, 26 Nov 2025 14:28:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6cc59312-7cdc-19a5-4d18-e120ea9c7563@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxTMEoniZph78_AQ--.49310S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFWkJF18WFWfCry3AFW5urX_yoW8Cr17pF
	y7AF4Yyr4kJFyFvr1qkws3Xr95ZanrG3WIgFs3K34kuw17ZF1fAr40kwn8uayqv392qa1Y
	vFWfta4q9a4DAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnI
	WIevJa73UjIFyTuYvjxU24SoDUUUU

On 2025/11/26 下午2:08, Tiezhu Yang wrote:
> On 2025/11/25 下午6:52, Jinyang He wrote:
>> On 2025-11-25 14:33, Tiezhu Yang wrote:
>>
>>> When running virtual machine before testing the kernel live patching 
>>> with
>>> "modprobe livepatch-sample", there is a timeout over 15 seconds, the 
>>> dmesg
>>> command shows "unreliable stack" for user tasks in debug mode.
>>>
>>> The "unreliable stack" is because it can not unwind from 
>>> kvm_handle_exit()
>>> to its previous frame kvm_exc_entry() due to the PC is not a valid 
>>> kernel
>>> address, the root cause is that the code of kvm_exc_entry() was 
>>> copied to
>>> the DMW area in kvm_loongarch_env_init(), so it should check the PC 
>>> range
>>> and then finish unwinding for this special case.
>>
>> Hi, Tiezhu,
>>
>> Since kvm_loongarch_env_init copies kvm_exc_entry which similar to how
>> trap_init copies the exception handler. We should apply the same
>> offset-based adjustment to compute the shadow PC address:
>>   shadow_pc = kvm_exc_entry + (cur_pc − copied_base_address)
>> This allows the ORC unwinder to correctly locate the corresponding 
>> unwind info.
> 
> Thank you. I did some tests, it can unwind from kvm_handle_exit()
> to its previous frame kvm_exc_entry() only when CONFIG_KVM=y,
> but it can not unwind from kvm_handle_exit() to its previous frame 
> kvm_exc_entry() when CONFIG_KVM=m because we can not get the two
> kvm address (unsigned long)kvm_exc_entry and
> (unsigned long)kvm_loongarch_ops->exc_entry
> in arch/loongarch/kernel/unwind_orc.c.

Use function pointer can get get the two kvm address
(unsigned long)kvm_exc_entry and
(unsigned long)kvm_loongarch_ops->exc_entry
in arch/loongarch/kernel/unwind_orc.c.

I will do more test and send v2 later.

Thanks,
Tiezhu

