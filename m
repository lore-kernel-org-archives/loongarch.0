Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DF326ED39
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 07:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764226981; cv=none; b=Nkfa8+2y46pVL8W6o6jMzbKhS/p+fOnTTnGHhqfX9ohrEU6boQ0goFZ+Un+psWACxbfHGcCPQkTT801fSJ+KuIWlKcA6ytxY/6y3dy0tYmWKaS5V4upcabeNlzrHlXnAx77LW6U331SuRdiNI6zpvWXOMp6JBcXD/cJVnv8YDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764226981; c=relaxed/simple;
	bh=IUdkjcz7Bmwyk5j/H/doLgqYiUD50KMRqPtEB2Xop08=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=D0yqjM3Aw2DhpeJ1IuskL5AhR9+vym+kTNmUOoTmBQF6WBTwTKrdTLZbHWpRTP/4OeNSYtj9P64uDCFm73qQT1TAzBaXoaGp0R5vdEG/siZnEPqs3esCldXMxOsrdFOZiSPv9UfOnbVwG/Y3OQGzu89jq/HxRUEsY0jNDwx2J0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Dxvr+e9ydpoaMoAA--.20023S3;
	Thu, 27 Nov 2025 15:02:54 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxbMGb9ydpD8RAAQ--.53025S3;
	Thu, 27 Nov 2025 15:02:53 +0800 (CST)
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
 <1a3698c8-f31e-fb32-c00a-7372450e6196@loongson.cn>
 <CAAhV-H7VMAwcdG3LqKL2sdS==G5=ARWtwBcYq65y15+0aWUMtQ@mail.gmail.com>
 <284da6b1-8703-a9d7-f564-236ade3986a8@loongson.cn>
 <CAAhV-H4phQ-VK0YSip6+-fLwfkLb052fEcQFOATkmQZB73=J8Q@mail.gmail.com>
 <94724535-94cd-c256-2080-f87f70226502@loongson.cn>
 <CAAhV-H7WEMTJWROBxm1hYNu2PQWZvBg2xTy5ACeO+E3JaZG1FQ@mail.gmail.com>
 <2732fb28-be67-9c7d-9146-e0fd5358f88c@loongson.cn>
 <CAAhV-H6iyqNU0p0vaWRTNG2iseZUZULgZLAaQ0LNr_HmCL43VQ@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <bcea143f-fc8e-d40f-3fec-7dfe64bfa0c4@loongson.cn>
Date: Thu, 27 Nov 2025 15:00:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6iyqNU0p0vaWRTNG2iseZUZULgZLAaQ0LNr_HmCL43VQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxbMGb9ydpD8RAAQ--.53025S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWfJr1Duw17Zw1fGw17urWUZFc_yoWDCrW5pr
	WUJF1DJF4UJr1UAr1Utr1UJr1Utr1UJr1UXr18Jr1UAr1Dtr1UJr4UJr1UCF17Jr1UJr1U
	Ar18Jr13XF1UJrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9vb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_
	Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU1KFAJUUUUU==



On 2025/11/27 下午2:54, Huacai Chen wrote:
> On Thu, Nov 27, 2025 at 2:48 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2025/11/27 下午2:42, Huacai Chen wrote:
>>> On Thu, Nov 27, 2025 at 2:21 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>>
>>>>
>>>> On 2025/11/27 上午10:51, Huacai Chen wrote:
>>>>> On Thu, Nov 27, 2025 at 10:48 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2025/11/27 上午10:45, Huacai Chen wrote:
>>>>>>> On Thu, Nov 27, 2025 at 10:37 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2025/11/27 上午10:09, Huacai Chen wrote:
>>>>>>>>> On Thu, Nov 27, 2025 at 9:08 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 2025/11/26 下午9:43, Huacai Chen wrote:
>>>>>>>>>>> On Mon, Nov 24, 2025 at 10:17 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 2025/11/24 上午10:03, Huacai Chen wrote:
>>>>>>>>>>>>> On Mon, Nov 24, 2025 at 9:58 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 2025/11/21 下午10:08, Huacai Chen wrote:
>>>>>>>>>>>>>>> Hi, Bibo,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On Thu, Nov 20, 2025 at 2:58 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> This patchset adds timer test case for LoongArch system, it is based
>>>>>>>>>>>>>>>> on common arch_timer test case. And it includes one-shot and period mode
>>>>>>>>>>>>>>>> timer interrupt test, software emulated timer function and time counter
>>>>>>>>>>>>>>>> test.
>>>>>>>>>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A5000, sometimes
>>>>>>>>>>>>>>> it passes, sometimes I get:
>>>>>>>>>>>>>>> [root@fedora kvm]# ./arch_timer
>>>>>>>>>>>>>>> Random seed: 0x6b8b4567
>>>>>>>>>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
>>>>>>>>>>>>>>> ==== Test Assertion Failure ====
>>>>>>>>>>>>>>>           loongarch/arch_timer.c:79: irq_iter == 0
>>>>>>>>>>>>>>>           pid=60138 tid=60142 errno=4 - Interrupted system call
>>>>>>>>>>>>>>>              1  0x00000001200037cf: test_vcpu_run 于 arch_timer.c:70
>>>>>>>>>>>>>>>              2  0x00007ffff2449f27: ?? ??:0
>>>>>>>>>>>>>>>              3  0x00007ffff24c0633: ?? ??:0
>>>>>>>>>>>>>>>           irq_iter = 0x1.
>>>>>>>>>>>>>>>           Guest period timer interrupt was not triggered within the specified
>>>>>>>>>>>>>>>           interval, try to increase the error margin by [-e] option.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Is this as expected, or something is wrong?
>>>>>>>>>>>>>> There is problem with that. In generic the vCPU task is rescheduled on
>>>>>>>>>>>>>> other CPUs or preempted, so period timer interrupt is not handled in
>>>>>>>>>>>>>> specified time.
>>>>>>>>>>>>> Then this series need to be updated, or problem comes from other places?
>>>>>>>>>>>> I think this series need be updated, test success criteria with period
>>>>>>>>>>>> timer need consider this situation. Let me check how to handle this.
>>>>>>>>>>> Any updates available?
>>>>>>>>>> It can be solved by modifying udelay() method with get_cycles() or using
>>>>>>>>>> cpu loop calculation method.
>>>>>>>>>>
>>>>>>>>>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>>>>>>>>>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.hYes, no common part for it, but it can be a common problem. If other
>>>>>> architectures have problems they should also modify their own
>>>>>> __delay(), right?
>>>>>>>>>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
>>>>>>>>>>
>>>>>>>>>>        static inline void __delay(uint64_t cycles)
>>>>>>>>>>        {
>>>>>>>>>> -       uint64_t start = timer_get_cycles();
>>>>>>>>>> -
>>>>>>>>>> -       while ((timer_get_cycles() - start) < cycles)
>>>>>>>>>> -               cpu_relax();
>>>>>>>>>> +       uint64_t start, next, loops = 0;
>>>>>>>>>> +
>>>>>>>>>> +       start = timer_get_cycles();
>>>>>>>>>> +       while (loops < cycles) {
>>>>>>>>>> +               next = timer_get_cycles();
>>>>>>>>>> +               /* only count one cycle if VM is preempted */
>>>>>>>>>> +               if (next > start) {
>>>>>>>>>> +                       loops++;
>>>>>>>>>> +                       start = next;
>>>>>>>>>> +               }
>>>>>>>>>> +       }
>>>>>>>>>>        }
>>>>>>>>> Looks good. But ARM64 and RISC-V also use a simple implementation of
>>>>>>>> there is no period test on them.
>>>>>>> I think the one-shot test can also have this problem if the CPU is
>>>>>>> preempted for a very long time.
>>>>>>>
>>>>>>>>> __delay(). So should this problem be thought of as a common problem?
>>>>>>>>> If yes, maybe we can keep __delay() as is and wait for the common
>>>>>>>>> parts to be fixed.
>>>>>>>> Also there is no common udelay() API, it is arch specific. Someone may
>>>>>>>> argue that skipping stolen cycles is not generic for __delay(), other
>>>>>>>> test cases want accurate cycles rather than skipping stolen cycles. It
>>>>>>>> is timer test case specific.
>>>>>>>>
>>>>>>>> Or adding another api __delay_loops() or keep it as is and wait for
>>>>>>>> other architectures, there should be no common part for it.
>>>>>>> Yes, no common part for it, but it can be a common problem. If other
>>>>>>> architectures have problems they should also modify their own
>>>>>>> __delay(), right?
>>>>>> yes, what to do then?
>>>>> Merge window is coming, let's keep it as is. And this problem only
>>>>> exist when the background load is high (so preemption happens easily),
>>>>> I think this is not the usual case.
>>>> Another method is to modify period timer test case, calling udelay with
>>>> loop times rather than one time, something like this:
>>>> --- a/tools/testing/selftests/kvm/loongarch/arch_timer.c
>>>> +++ b/tools/testing/selftests/kvm/loongarch/arch_timer.c
>>>> @@ -75,7 +75,7 @@ static void guest_test_oneshot_timer(uint32_t cpu)
>>>>
>>>>     static void guest_test_period_timer(uint32_t cpu)
>>>>     {
>>>> -       uint32_t irq_iter;
>>>> +       uint32_t irq_iter, config_iter;
>>>>            uint64_t us;
>>>>            struct test_vcpu_shared_data *shared_data = &vcpu_shared_data[cpu];
>>>>
>>>> @@ -84,7 +84,8 @@ static void guest_test_period_timer(uint32_t cpu)
>>>>            us = msecs_to_usecs(test_args.timer_period_ms) +
>>>> test_args.timer_err_margin_us;
>>>>            timer_set_next_cmp_ms(test_args.timer_period_ms, true);
>>>>            /* Setup a timeout for the interrupt to arrive */
>>>> -       udelay(us * test_args.nr_iter);
>>>> +       for (config_iter = 0; config_iter < test_args.nr_iter;
>>>> config_iter++)
>>>> +               udelay(us);
>>> This can reduce the probability but still cause problem if the
>>> background CPU load is very high. So I suggest keep it as is.
>> If merge window is close, one fix can be post in later.
>>
>> Even if the background CPU load is high, timer interrupt will happen
>> every time udelay() is called. So total times of timer interrupt
>> triggered will meet the test case requirements.
> I said it only "reduce the probability" because the one-shot test case
> is also observed errors. If we use "retry method" to fix, then
> one-shot test case is also needed.
one-shot test case has already used split udelay() method. I observed 
one-shot test case failure on 3D6000 also, it is KVM timer emulation issue.

Well, let's keep it as is for the present.
> 
> Huacai
> 
>>
>> Regards
>> Bibo Mao
>>>
>>>
>>> Huacai
>>>
>>>>
>>>>
>>>> Regards
>>>> Bibo Mao
>>>>>
>>>>> Huacai
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Huacai
>>>>>>>
>>>>>>>>
>>>>>>>> Regards
>>>>>>>> Bibo Mao
>>>>>>>>>
>>>>>>>>> Huacai
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Regards
>>>>>>>>>> Bibo Mao
>>>>>>>>>>>
>>>>>>>>>>> Huacai
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Regards
>>>>>>>>>>>> Bibo Mao
>>>>>>>>>>>>>
>>>>>>>>>>>>> Huacai
>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Regards
>>>>>>>>>>>>>> Bibo Mao
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Hucai
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>> v2 ... v3:
>>>>>>>>>>>>>>>>           1. Adjust order about patch 2 and patch 3
>>>>>>>>>>>>>>>>           2. Add test case with alphabetical order
>>>>>>>>>>>>>>>>           3. Merge one-shot and period timer interrupt test case into one
>>>>>>>>>>>>>>>>           4. Only add LoongArch specific modification with common file
>>>>>>>>>>>>>>>>              Makefile.kvm
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> v1 ... v2:
>>>>>>>>>>>>>>>>           1. Restore PC and PRMD after exception handler
>>>>>>>>>>>>>>>>           2. Split patch 4 into two small patches with period timer test and
>>>>>>>>>>>>>>>>              time counter test
>>>>>>>>>>>>>>>>           3. With time counter test, set time count with 0 when create VM. And
>>>>>>>>>>>>>>>>              verify time count starts from 0 in guest code
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>> Bibo Mao (6):
>>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add system registers save and restore on
>>>>>>>>>>>>>>>>             exception
>>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add basic interfaces
>>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add exception handler register interface
>>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add timer interrupt test case
>>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add SW emulated timer test
>>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add time counter test
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>          tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>>>>>>>>>>>>>>>>          .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
>>>>>>>>>>>>>>>>          .../kvm/include/loongarch/processor.h         |  81 +++++++-
>>>>>>>>>>>>>>>>          .../selftests/kvm/lib/loongarch/exception.S   |   6 +
>>>>>>>>>>>>>>>>          .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
>>>>>>>>>>>>>>>>          .../selftests/kvm/loongarch/arch_timer.c      | 194 ++++++++++++++++++
>>>>>>>>>>>>>>>>          6 files changed, 410 insertions(+), 3 deletions(-)
>>>>>>>>>>>>>>>>          create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>>>>>>>>>>>>>>>>          create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
>>>>>>>>>>>>>>>> --
>>>>>>>>>>>>>>>> 2.39.3
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>>>
>>>>
>>>>
>>

