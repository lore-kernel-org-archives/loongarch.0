Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E0F192590
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764211069; cv=none; b=NFaj+2J7Ul5OdEDBaz1NL5gTvm24W00FxaXr/FR0aqCOq/fcTSefzTMx907gIjg1tXxeJfpdx1cxd8e9rQagyryHGQ1eGtzz/LIyayIDQPUS2+zLv0XIN9NwV2zYxWhmfW6D97ShGCPLLyeerO/+DjBD49r1aATf7tZ25fQkq9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764211069; c=relaxed/simple;
	bh=tuh2IHmK5ztqyDlzxMLqmyEstVDeB+SYYyFGw1gogz4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uQ1uez8Ue/mrrKRA6QEoPTJUyf9vF7YjNyBXSFLYH/nMJqv6hfk7oldnoQpSklU/qeN7hphHxbOpyfKAMHf5Su/cuADGnJ8lg/JJVWpq9d6ptGshInkTIYDKEhJc/obv2Z9Zsi4I5cfExYw1RYUh4nivT+WDrKYDYPNz/hWrhYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxL9N0uSdpJJUoAA--.20492S3;
	Thu, 27 Nov 2025 10:37:41 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxZORxuSdpGZlAAQ--.40066S3;
	Thu, 27 Nov 2025 10:37:39 +0800 (CST)
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, linux-kernel@vger.kernel.org
References: <20251120065758.3064368-1-maobibo@loongson.cn>
 <CAAhV-H4FhRHG+Axsb4KEtiyagepJVKyQ80cLN7TNXdCGAzN-KA@mail.gmail.com>
 <42d93855-50df-a686-85c5-5552ff829977@loongson.cn>
 <CAAhV-H4xprj-WmMkp86xEmn4NL3wwW3aaDoMj=SUiP3pEa+Q7g@mail.gmail.com>
 <1605b5eb-5f43-62ff-28c5-192f2f0f938d@loongson.cn>
 <CAAhV-H5+suuN7Qf6qx6hVniy2KCnHf2rVPebR4Gxms-SbTz6Fg@mail.gmail.com>
 <0e125e35-8044-a6ce-998f-1221da0e827d@loongson.cn>
 <CAAhV-H57Ee-KpmYuRLnhOXGsJtBrzHPTqNTW9uj8EkiDUMp3CA@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <1a3698c8-f31e-fb32-c00a-7372450e6196@loongson.cn>
Date: Thu, 27 Nov 2025 10:35:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H57Ee-KpmYuRLnhOXGsJtBrzHPTqNTW9uj8EkiDUMp3CA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxZORxuSdpGZlAAQ--.40066S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxtFW7tr4rtr13Zw4fCrW8KrX_yoW7ZrW7pF
	WIk3ZxKF48Ar1ayw1Iqr1qqry5tw1ktr1jqr1rtr1UAr1qyr1kJa17JryUCF17Jry8Wr1j
	v340vF13WF1UJrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAF
	wI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjxUcVc_UUUUU



On 2025/11/27 上午10:09, Huacai Chen wrote:
> On Thu, Nov 27, 2025 at 9:08 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2025/11/26 下午9:43, Huacai Chen wrote:
>>> On Mon, Nov 24, 2025 at 10:17 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>>
>>>>
>>>> On 2025/11/24 上午10:03, Huacai Chen wrote:
>>>>> On Mon, Nov 24, 2025 at 9:58 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2025/11/21 下午10:08, Huacai Chen wrote:
>>>>>>> Hi, Bibo,
>>>>>>>
>>>>>>> On Thu, Nov 20, 2025 at 2:58 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>
>>>>>>>> This patchset adds timer test case for LoongArch system, it is based
>>>>>>>> on common arch_timer test case. And it includes one-shot and period mode
>>>>>>>> timer interrupt test, software emulated timer function and time counter
>>>>>>>> test.
>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A5000, sometimes
>>>>>>> it passes, sometimes I get:
>>>>>>> [root@fedora kvm]# ./arch_timer
>>>>>>> Random seed: 0x6b8b4567
>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
>>>>>>> ==== Test Assertion Failure ====
>>>>>>>       loongarch/arch_timer.c:79: irq_iter == 0
>>>>>>>       pid=60138 tid=60142 errno=4 - Interrupted system call
>>>>>>>          1  0x00000001200037cf: test_vcpu_run 于 arch_timer.c:70
>>>>>>>          2  0x00007ffff2449f27: ?? ??:0
>>>>>>>          3  0x00007ffff24c0633: ?? ??:0
>>>>>>>       irq_iter = 0x1.
>>>>>>>       Guest period timer interrupt was not triggered within the specified
>>>>>>>       interval, try to increase the error margin by [-e] option.
>>>>>>>
>>>>>>> Is this as expected, or something is wrong?
>>>>>> There is problem with that. In generic the vCPU task is rescheduled on
>>>>>> other CPUs or preempted, so period timer interrupt is not handled in
>>>>>> specified time.
>>>>> Then this series need to be updated, or problem comes from other places?
>>>> I think this series need be updated, test success criteria with period
>>>> timer need consider this situation. Let me check how to handle this.
>>> Any updates available?
>> It can be solved by modifying udelay() method with get_cycles() or using
>> cpu loop calculation method.
>>
>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
>>
>>    static inline void __delay(uint64_t cycles)
>>    {
>> -       uint64_t start = timer_get_cycles();
>> -
>> -       while ((timer_get_cycles() - start) < cycles)
>> -               cpu_relax();
>> +       uint64_t start, next, loops = 0;
>> +
>> +       start = timer_get_cycles();
>> +       while (loops < cycles) {
>> +               next = timer_get_cycles();
>> +               /* only count one cycle if VM is preempted */
>> +               if (next > start) {
>> +                       loops++;
>> +                       start = next;
>> +               }
>> +       }
>>    }
> Looks good. But ARM64 and RISC-V also use a simple implementation of
there is no period test on them.
> __delay(). So should this problem be thought of as a common problem?
> If yes, maybe we can keep __delay() as is and wait for the common
> parts to be fixed.
Also there is no common udelay() API, it is arch specific. Someone may 
argue that skipping stolen cycles is not generic for __delay(), other 
test cases want accurate cycles rather than skipping stolen cycles. It 
is timer test case specific.

Or adding another api __delay_loops() or keep it as is and wait for 
other architectures, there should be no common part for it.

Regards
Bibo Mao
> 
> Huacai
> 
>>
>> Regards
>> Bibo Mao
>>>
>>> Huacai
>>>
>>>>
>>>> Regards
>>>> Bibo Mao
>>>>>
>>>>> Huacai
>>>>>
>>>>>>
>>>>>> Regards
>>>>>> Bibo Mao
>>>>>>>
>>>>>>> Hucai
>>>>>>>
>>>>>>>> ---
>>>>>>>> v2 ... v3:
>>>>>>>>       1. Adjust order about patch 2 and patch 3
>>>>>>>>       2. Add test case with alphabetical order
>>>>>>>>       3. Merge one-shot and period timer interrupt test case into one
>>>>>>>>       4. Only add LoongArch specific modification with common file
>>>>>>>>          Makefile.kvm
>>>>>>>>
>>>>>>>> v1 ... v2:
>>>>>>>>       1. Restore PC and PRMD after exception handler
>>>>>>>>       2. Split patch 4 into two small patches with period timer test and
>>>>>>>>          time counter test
>>>>>>>>       3. With time counter test, set time count with 0 when create VM. And
>>>>>>>>          verify time count starts from 0 in guest code
>>>>>>>> ---
>>>>>>>> Bibo Mao (6):
>>>>>>>>       KVM: LoongArch: selftests: Add system registers save and restore on
>>>>>>>>         exception
>>>>>>>>       KVM: LoongArch: selftests: Add basic interfaces
>>>>>>>>       KVM: LoongArch: selftests: Add exception handler register interface
>>>>>>>>       KVM: LoongArch: selftests: Add timer interrupt test case
>>>>>>>>       KVM: LoongArch: selftests: Add SW emulated timer test
>>>>>>>>       KVM: LoongArch: selftests: Add time counter test
>>>>>>>>
>>>>>>>>      tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>>>>>>>>      .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
>>>>>>>>      .../kvm/include/loongarch/processor.h         |  81 +++++++-
>>>>>>>>      .../selftests/kvm/lib/loongarch/exception.S   |   6 +
>>>>>>>>      .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
>>>>>>>>      .../selftests/kvm/loongarch/arch_timer.c      | 194 ++++++++++++++++++
>>>>>>>>      6 files changed, 410 insertions(+), 3 deletions(-)
>>>>>>>>      create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>>>>>>>>      create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c
>>>>>>>>
>>>>>>>>
>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
>>>>>>>> --
>>>>>>>> 2.39.3
>>>>>>>>
>>>>>>
>>>>
>>
>>

