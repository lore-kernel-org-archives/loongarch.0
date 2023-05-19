Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD3A39F
	for <loongarch@lists.linux.dev>; Fri, 19 May 2023 06:52:54 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8CxPuu_HGdk+RcKAA--.17508S3;
	Fri, 19 May 2023 14:52:47 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxoOS9HGdk73hpAA--.47775S3;
	Fri, 19 May 2023 14:52:46 +0800 (CST)
Subject: Re: [PATCH v1 2/3] dt-bindings: soc: add loongson-2 pm
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Marc Zyngier <maz@kernel.org>, Youling Tang <tangyouling@loongson.cn>,
 Baoqi Zhang <zhangbaoqi@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Yun Liu <liuyun@loongson.cn>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
Cc: Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
 Liu Peibao <liupeibao@loongson.cn>, loongson-kernel@lists.loongnix.cn,
 zhuyinbo@loongson.cn
References: <20230517073149.31980-1-zhuyinbo@loongson.cn>
 <20230517073149.31980-3-zhuyinbo@loongson.cn>
 <d3791702-4d41-0208-1346-34738a2883b6@linaro.org>
 <4521c591-6fcd-c96a-e2f6-f41f5c191036@loongson.cn>
 <1bbabe6d-b013-9837-8986-205a2b04de14@linaro.org>
 <b4bc7385-3706-8aa3-0117-d106fd47a45e@loongson.cn>
 <3f81816a-b7a8-cc3a-0052-a2177bfb58c4@linaro.org>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <9c49fd36-2b87-b25a-c799-c5845718def6@loongson.cn>
Date: Fri, 19 May 2023 14:52:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3f81816a-b7a8-cc3a-0052-a2177bfb58c4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxoOS9HGdk73hpAA--.47775S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WrW7tFyxJF18Xr4DuFyfWFg_yoW7GFy8pa
	yUKF4qyrWDJr1Syw48tw18C3yFvrWkKFW5Wrn8XryxCw4qvr1Iyr17KF15u342kr1xJw12
	9Fyjy397CF45AFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	W8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU7TKuUUUUU



在 2023/5/18 下午10:15, Krzysztof Kozlowski 写道:
> On 18/05/2023 14:15, zhuyinbo wrote:
>>
>>
>> 在 2023/5/18 下午3:15, Krzysztof Kozlowski 写道:
>>> On 18/05/2023 05:23, zhuyinbo wrote:
>>>>
>>>>
>>>> 在 2023/5/17 下午11:00, Krzysztof Kozlowski 写道:
>>>>> On 17/05/2023 09:31, Yinbo Zhu wrote:
>>>>>> Add the Loongson-2 SoC Power Management Controller binding with DT
>>>>>> schema format using json-schema.
>>>>>>
>>>>>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>>>>>
>>>>> ...
>>>>>
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    items:
>>>>>> +      - enum:
>>>>>> +          - loongson,ls2k-pmc
>>>>>> +      - const: syscon
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  interrupts:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  suspend-address:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description:
>>>>>> +      This option indicate this PM suspend address.
>>>>>
>>>>> This tells me nothing. Drop "This option indicate this" and rephrase
>>>>> everything to actually describe this property. Why would the address
>>>>> differ on given, specific SoC? It looks like you just miss compatibles.
>>>>> Anyway this needs much more explanation so we can judge whether it fits DT.
>>>>
>>>> Hi Krzysztof,
>>>>
>>>> I will add following description about "suspend-address", please review.
>>>
>>> Thanks.
>>>
>>>>
>>>> The "suspend-address" is a ACPI S3 (Suspend To RAM) firmware entry
>>>
>>> Why do we add properties for ACPI? This does not seem right.
>>
>>
>> 1.  The suspend-address value was dependent on specific platform
>>       firmware code and it tends to be confiurable. if it is a fixed value
>>       that seems not friendly or the ACPI S3 will not work.
> 
>> 2. the PM driver need according to it to indicate that current SoC
>>      whether support ACPI S3, because some Loongson-2 SoC doesn't support
> 
> For this you have dedicated compatibles. Which points to the fact that
> you missed them here.


Sorry, I may not have explained it clearly before. In fact, this is a
consideration for the future, and currently all SoC supports s3.
Add corresponding compatibles as needed in the future.

> 
>>      ACPI S3 but support other ACPI mode, so the PM driver need has a
>>      check. if no this check and other ACPI mode will not work.
> 
> Sure, but it is not really relevant to the bindings... or rather: should
> not be relevant. Bindings are for hardware or in this case also for
> firmware, but not for driver.

okay, I got it.

> 
>>
>> Base on the above two points, this property was necessary.
> 
> I did not object in my last response...


Yes, but I misunderstood your meaning before.

> 
>> Using this property "suspend-address" can make the firmware entry
>> address configurable, and then the kernel can also indicate whether
>> the current SoC supports S3
>>
>> In addition, from kernel code perspective, the property
>> "suspend-address" was to initialize "loongarch_suspend_addr"
> 
> Again, how does it matter what kernel does?


okay, I got it.

> 
>>
>> S3 call flow:
>> enter_state -> loongson_suspend_enter -> bios's loongarch_suspend_addr
>>
>> SYM_FUNC_START(loongson_suspend_enter)
>>           SETUP_SLEEP
>>           bl              __flush_cache_all
>>
>>           /* Pass RA and SP to BIOS */
>>           addi.d          a1, sp, 0
>>           la.pcrel        a0, loongson_wakeup_start
>>           la.pcrel        t0, loongarch_suspend_addr
>>           ld.d            t0, t0, 0
>>           jirl            a0, t0, 0 /* Call BIOS's STR sleep routine */
>>
>>
>> Please
>>> reword to skip ACPI stuff, e.g. deep sleep states (Suspend to RAM).
>>
>>
>> Sorry, I don't got your point.
> 
> You have DT platform, so why do you use it with ACPI in the first place?
> If you have ACPI, then please drop all this and make your life easier.


okay, I got it, I will reword to skip ACPI stuff in bindings for 
"suspend-address" property description.

> 
> If this is booted without ACPI, which would justify DT, drop the
> references to ACPI. I gave you example what to use instead. If you don't
> like it, no problem, reword in different way.

okay, I got it.

> 
>>
>>>
>>>
>>>> address which was jumped from kernel and it's value was dependent on
>>>> specific platform firmware code.
>>>
>>> "entry address which was jumped" <- the address cannot jump. Please
>>> explain who is jumping here - boot CPU? each suspended CPU? I guess the
>>> first as CPUs are offlined, right?
>>
>> The boot CPU was jumping to firmware and finish remaining process in
>> firmware that was what ACPI S3 required and other CPUs (No-boot CPU)
>> have been offline before entering firmware.
> 
> Then fix the description.

okay, I got it.

> 
>>
>>>
>>>> In addition, the PM driver need
>>>> according to it to indicate that current SoC whether support ACPI S3.
>>>
>>> Skip references to driver.
>>
>>
>> Sorry, I don't got your point.  Could you elaborate on it?
> 
> If you change driver, you change bindings? No.
> 
> Bindings are for hardware, not for driver. Whatever your driver is doing
> usually does not matter for the bindings and should not be included.


okay, I got it. I will skip references to driver in bindings for 
"suspend-address" property description.

Thanks.

