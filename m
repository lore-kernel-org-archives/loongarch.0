Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17481A26B
	for <loongarch@lists.linux.dev>; Thu,  3 Jul 2025 01:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751506633; cv=none; b=clHFlbJ1Ge0HCZWF4MK24FHX8yYvReSuo0uWrCwPJkIqGwp/Wt1P3uicAdQyayZ0YGMt87MGCURUKcoK0YLY5QtkfH3jpPx4cy5I/bfQhT26u9R5VuUbm9vCqcBFWRuJlpXABKdm266mza7S0pfKh+Pwi6Rqau3eRB5BukznVko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751506633; c=relaxed/simple;
	bh=Ee5Fyo6w6kdEAg0hZRjAAbgrXjQSbQVsGiyzoE0XRZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nxOjasYJgANvcGmjgnhv5eLs14rPOPD/6HtiL68BUpYXyNkMpP0iKMc7P1b1TKFEkIKbeYpZgpJDu5oDQbbR2tlzQt1vWZX8n1LrVc8BH2P3SlYQdySRGwFCb82jIw/9Dn9iyjC9uLXk59iM9De5a4uV8S840arwQZwW/PNLSH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8Ax3eK73mVo7I4hAQ--.34779S3;
	Thu, 03 Jul 2025 09:36:59 +0800 (CST)
Received: from [10.180.13.127] (unknown [111.207.111.194])
	by front1 (Coremail) with SMTP id qMiowJDxL8K63mVovo8HAA--.86S2;
	Thu, 03 Jul 2025 09:36:58 +0800 (CST)
Message-ID: <e89f6ce6-d9f4-4744-b6a6-9a82412795a0@loongson.cn>
Date: Thu, 3 Jul 2025 09:36:58 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Support mem=SIZE kernel parameter
To: Yanteng Si <si.yanteng@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Bibo Mao <maobibo@loongson.cn>, Hari Bathini <hbathini@linux.ibm.com>,
 Guo Weikang <guoweikang.kernel@gmail.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Usama Arif
 <usamaarif642@gmail.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: lixuefeng@loongson.cn, chenhuacai@loongson.cn, gaojuxin@loongson.cn
References: <20250701090449.2426151-1-wangming01@loongson.cn>
 <0561da2c-a4d7-49bb-8394-930f10880610@linux.dev>
Content-Language: en-US
From: Ming Wang <wangming01@loongson.cn>
In-Reply-To: <0561da2c-a4d7-49bb-8394-930f10880610@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxL8K63mVovo8HAA--.86S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQEMEmhkyh0U7AAAs9
X-Coremail-Antispam: 1Uk129KBj93XoW3XF1DXF17Gr4DKw13Wr1xJFc_yoW7XrWrpF
	1kAw15trZ8GFn7Ww1xCwn8XryrAw1rJa4UWr1UuF15AF15Ar1Igr40qr1q9FyUGr4xXr42
	qr1Utr9rZa1DAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Cb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20x
	vEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
	6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5miiUUUUU=

Hi Yanteng,

Thanks for reviewing the patch and for your insightful question.

On 7/2/25 10:11, Yanteng Si wrote:
> 在 7/1/25 5:04 PM, Ming Wang 写道:
>> The LoongArch mem= parameter parser was previously limited to the
>> mem=SIZE@START format. This was inconvenient for the common use case
>> of simply capping the total system memory, as it forced users to
>> manually specify a start address. It was also inconsistent with the
>> behavior on other architectures.
>>
>> This patch enhances the parser in early_parse_mem() to also support the
>> more user-friendly mem=SIZE format. The implementation now checks for
>> the presence of the '@' symbol to determine the user's intent:
>>
>> - If mem=SIZE is provided (no '@'), the kernel now calls
>>    memblock_enforce_memory_limit(). This trims memory from the top down
>>    to the specified size.
>> - If mem=SIZE@START is used, the original behavior is retained for
>>    backward compatibility. This allows for defining specific memory
>>    banks.
>>
>> This change introduces an important usage rule reflected in the code's
>> comments: the mem=SIZE format should only be specified once on the
>> kernel command line. It acts as a single, global cap on total memory. In
>> contrast, the mem=SIZE@START format can be used multiple times to
>> define several distinct memory regions.
>>
>> Signed-off-by: Ming Wang <wangming01@loongson.cn>
>> ---
>>   arch/loongarch/kernel/setup.c | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/ 
>> setup.c
>> index b99fbb388fe0..af59ba180dc2 100644
>> --- a/arch/loongarch/kernel/setup.c
>> +++ b/arch/loongarch/kernel/setup.c
>> @@ -191,6 +191,16 @@ static int __init early_parse_mem(char *p)
>>           return -EINVAL;
>>       }
>> +    start = 0;
>> +    size = memparse(p, &p);
>> +    if (*p == '@')    /* Every mem=... should contain '@' */
>> +        start = memparse(p + 1, &p);
>> +    else {            /* Only one mem=... is allowed if no '@' */
>> +        usermem = 1;
>> +        memblock_enforce_memory_limit(size);
>> +        return 0;
>> +    }
>> +
>>       /*
>>        * If a user specifies memory size, we
>>        * blow away any automatically generated
>> @@ -201,14 +211,6 @@ static int __init early_parse_mem(char *p)
>>           memblock_remove(memblock_start_of_DRAM(),
>>               memblock_end_of_DRAM() - memblock_start_of_DRAM());
>>       }
>> -    start = 0;
>> -    size = memparse(p, &p);
>> -    if (*p == '@')
>> -        start = memparse(p + 1, &p);
>> -    else {
>> -        pr_err("Invalid format!\n");
>> -        return -EINVAL;
>> -    }
> I don't understand. Isn't it better to modify the else{} directly here?
> 
You've raised a very good point. The reason for moving the parsing logic 
to the top, rather than just modifying the original else block, is to 
handle the fundamentally different behaviors required for mem=SIZE 
versus mem=SIZE@START. The key lies in thisexisting block of code which 
handles the mem=SIZE@START case:

```
/*
* If a user specifies memory size, we
* blow away any automatically generated
* size.
*/
if (usermem == 0) {
	usermem = 1;
	memblock_remove(memblock_start_of_DRAM(),
			memblock_end_of_DRAM() - memblock_start_of_DRAM());
}
```

This code is destructive. As the comment says, it "blows away" the 
entire memory map discovered from the firmware (UEFI/ACPI). After this 
call, memblock is essentially empty, waiting for new regions to be added 
via memblock_add(). This is the correct behavior for mem=SIZE@START.

However, the new mem=SIZE functionality is meant to be non-destructive. 
It should take the existing firmware-provided memory map and simply trim 
it down to the desired size. The function 
memblock_enforce_memory_limit() is designed for this purpose—it operates 
on the current state of memblock.

If we were to keep the parsing logic at the end and only modify the else 
block, the destructive memblock_remove() call would have already 
executed for both cases. By that point, calling 
memblock_enforce_memory_limit() would be meaningless, as there would be 
no memory regions left in memblock to limit.

Therefore, the patch moves the parsing logic to the very beginning to 
create a clean separation:
1. It first checks if the format is mem=SIZE (no '@').
2. If it is, it performs the non-destructive limit on the intact memory 
map and returns immediately, completely bypassing the destructive 
memblock_remove() logic.
3. If the format is mem=SIZE@START, it falls through to the original 
destructive path as before.

I hope this explanation clarifies why the code structure was changed 
this way. It's crucial to ensure the non-destructive path is handled 
before any memory map information is lost.

Best regards,
Ming


> Thanks,
> Yanteng
> 

