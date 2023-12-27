Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546AF28FA
	for <loongarch@lists.linux.dev>; Wed, 27 Dec 2023 01:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8CxRPB2eYtlKOMEAA--.23471S3;
	Wed, 27 Dec 2023 09:10:14 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx6r10eYtlkhsMAA--.15386S3;
	Wed, 27 Dec 2023 09:10:14 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Let cores_io_master cover the largest NR_CPUS
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongson-kernel@lists.loongnix.cn, loongarch@lists.linux.dev,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Xuerui Wang <kernel@xen0n.name>, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@loongson.cn>
References: <20231225070002.1350705-1-chenhuacai@loongson.cn>
 <3db5c086-db9b-cb3a-5521-44f18cb55c4a@loongson.cn>
 <CAAhV-H5Rs4BGKHZrA5bxSh0=4uhPx7vbVwBXtdtfU4hemN2QjA@mail.gmail.com>
 <b239bfee-73a7-495d-b094-bdfa31c1500e@flygoat.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <dc93675e-62a2-9648-dfbc-846e3afdf5b4@loongson.cn>
Date: Wed, 27 Dec 2023 09:09:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b239bfee-73a7-495d-b094-bdfa31c1500e@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx6r10eYtlkhsMAA--.15386S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFy3XF1rtrykZw4kAFWfCrX_yoW8AF43pr
	4vvFykGFWrGrn3Ga1jq34UCryYyr1DG3WqqF42ga48GrZFv3WqqF4jgryq9F1DZa1rtF10
	qw1fKw1avF4UAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UU
	UUU==



On 2023/12/25 下午10:02, Jiaxun Yang wrote:
> 
> 
> 在 2023/12/25 09:19, Huacai Chen 写道:
>> On Mon, Dec 25, 2023 at 5:13 PM maobibo <maobibo@loongson.cn> wrote:
>>>
>>>
>>>
>>> On 2023/12/25 下午3:00, Huacai Chen wrote:
>>>> Now loongson_system_configuration::cores_io_master only covers 64 cpus,
>>>> if NR_CPUS > 64 there will be memory corruption. So let cores_io_master
>>>> cover the largest NR_CPUS (256).
>>>>
>>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>>> ---
>>>>    arch/loongarch/include/asm/bootinfo.h | 4 ++--
>>>>    arch/loongarch/kernel/acpi.c          | 2 +-
>>>>    arch/loongarch/kernel/smp.c           | 2 +-
>>>>    3 files changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/loongarch/include/asm/bootinfo.h 
>>>> b/arch/loongarch/include/asm/bootinfo.h
>>>> index c60796869b2b..32fd0319594a 100644
>>>> --- a/arch/loongarch/include/asm/bootinfo.h
>>>> +++ b/arch/loongarch/include/asm/bootinfo.h
>>>> @@ -30,7 +30,7 @@ struct loongson_system_configuration {
>>>>        int boot_cpu_id;
>>>>        int cores_per_node;
>>>>        int cores_per_package;
>>>> -     unsigned long cores_io_master;
>>>> +     unsigned long cores_io_master[4];
>>> Can the hardcoded 4 be defined something like this?
>>>      DIV_ROUND_UP(CONFIG_NR_CPUS, sizeof(long))
>> Can this be used to define arrays?
> 
> I think DECLARE_BITMAP should work.
> 
> See how are we dealing with cpumask_t:
> ```
> typedef struct cpumask { DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;
> ```
Yeap, that will be better.

Regards
Bibo Mao
> 
> Thanks
> - Jiaxun
> [...]
> 
>>
>> Huacai

