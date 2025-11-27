Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DF1450FE
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 03:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764213328; cv=none; b=V2IjhmqIjaFe/F+R71XVrsvpXUAuRexjXJqZUs270BNk5tICC7I0kIFVCoNJXW6tI2jCyRnN7Zdxr47YcoXO/YBliKmnrNOsxyWii+ddAq20eLV3+1vOae+o7DmqXwsUnUffUalmfqBr7wmhbGc3DGJGr7oVqymtNSl0/cqlCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764213328; c=relaxed/simple;
	bh=56f5kttkpkQzKuzCys66jsw3iqCpz3A8XSusyWcLPfo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=M05dDN+vEH4bWEFjFeipORnBeW+KqsK75OgP4CdMmdFPor9EuxMmLygLa16iqnKTCfDFcq8ZyWuU+m2B5g7lQV+EZTP2Bbl4fBjyn+UcPAi52hxlCru6ei9IEp2Cetd7MNog9TBKwMm/yMCCs0+DgcUGMvJTDW6I/Lmdm5XOelY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bx2tFJwidpCJgoAA--.22776S3;
	Thu, 27 Nov 2025 11:15:21 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxysBAwidpf59AAQ--.20655S3;
	Thu, 27 Nov 2025 11:15:14 +0800 (CST)
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
 <9e19b107-039c-f45a-af26-1ed5df94ced6@loongson.cn>
 <CAAhV-H7xar7+pf-Et+=9G=rEk3yJfvbq5VrGWV=PxEBuUQwEpw@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <4fd38af7-7bf3-7a3c-d150-a187a5098fac@loongson.cn>
Date: Thu, 27 Nov 2025 11:12:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7xar7+pf-Et+=9G=rEk3yJfvbq5VrGWV=PxEBuUQwEpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxysBAwidpf59AAQ--.20655S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxKr15ZF1xXrWfCw1fAry3WrX_yoW3KFW3pr
	WUtFn8Jr4UJr1UAr1Utr1DXr1Utr1UJr1UXr18Jr1UAr1Dtr1UJr4UJr1UCF17Jr1UGr1U
	Zr18Jr13XF1UJrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r4a6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8w0eJUUUUU==



On 2025/11/27 上午11:05, Huacai Chen wrote:
> On Thu, Nov 27, 2025 at 10:54 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2025/11/27 上午10:51, Huacai Chen wrote:
>>> On Thu, Nov 27, 2025 at 10:48 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>>
>>>>
>>>> On 2025/11/27 上午10:45, Huacai Chen wrote:
>>>>> On Thu, Nov 27, 2025 at 10:37 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2025/11/27 上午10:09, Huacai Chen wrote:
>>>>>>> On Thu, Nov 27, 2025 at 9:08 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2025/11/26 下午9:43, Huacai Chen wrote:
>>>>>>>>> On Mon, Nov 24, 2025 at 10:17 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 2025/11/24 上午10:03, Huacai Chen wrote:
>>>>>>>>>>> On Mon, Nov 24, 2025 at 9:58 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 2025/11/21 下午10:08, Huacai Chen wrote:
>>>>>>>>>>>>> Hi, Bibo,
>>>>>>>>>>>>>
>>>>>>>>>>>>> On Thu, Nov 20, 2025 at 2:58 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> This patchset adds timer test case for LoongArch system, it is based
>>>>>>>>>>>>>> on common arch_timer test case. And it includes one-shot and period mode
>>>>>>>>>>>>>> timer interrupt test, software emulated timer function and time counter
>>>>>>>>>>>>>> test.
>>>>>>>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A5000, sometimes
>>>>>>>>>>>>> it passes, sometimes I get:
>>>>>>>>>>>>> [root@fedora kvm]# ./arch_timer
>>>>>>>>>>>>> Random seed: 0x6b8b4567
>>>>>>>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
>>>>>>>>>>>>> ==== Test Assertion Failure ====
>>>>>>>>>>>>>          loongarch/arch_timer.c:79: irq_iter == 0
>>>>>>>>>>>>>          pid=60138 tid=60142 errno=4 - Interrupted system call
>>>>>>>>>>>>>             1  0x00000001200037cf: test_vcpu_run 于 arch_timer.c:70
>>>>>>>>>>>>>             2  0x00007ffff2449f27: ?? ??:0
>>>>>>>>>>>>>             3  0x00007ffff24c0633: ?? ??:0
>>>>>>>>>>>>>          irq_iter = 0x1.
>>>>>>>>>>>>>          Guest period timer interrupt was not triggered within the specified
>>>>>>>>>>>>>          interval, try to increase the error margin by [-e] option.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Is this as expected, or something is wrong?
>>>>>>>>>>>> There is problem with that. In generic the vCPU task is rescheduled on
>>>>>>>>>>>> other CPUs or preempted, so period timer interrupt is not handled in
>>>>>>>>>>>> specified time.
>>>>>>>>>>> Then this series need to be updated, or problem comes from other places?
>>>>>>>>>> I think this series need be updated, test success criteria with period
>>>>>>>>>> timer need consider this situation. Let me check how to handle this.
>>>>>>>>> Any updates available?
>>>>>>>> It can be solved by modifying udelay() method with get_cycles() or using
>>>>>>>> cpu loop calculation method.
>>>>>>>>
>>>>>>>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>>>>>>>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.hYes, no common part for it, but it can be a common problem. If other
>>>> architectures have problems they should also modify their own
>>>> __delay(), right?
>>>>>>>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
>>>>>>>>
>>>>>>>>       static inline void __delay(uint64_t cycles)
>>>>>>>>       {
>>>>>>>> -       uint64_t start = timer_get_cycles();
>>>>>>>> -
>>>>>>>> -       while ((timer_get_cycles() - start) < cycles)
>>>>>>>> -               cpu_relax();
>>>>>>>> +       uint64_t start, next, loops = 0;
>>>>>>>> +
>>>>>>>> +       start = timer_get_cycles();
>>>>>>>> +       while (loops < cycles) {
>>>>>>>> +               next = timer_get_cycles();
>>>>>>>> +               /* only count one cycle if VM is preempted */
>>>>>>>> +               if (next > start) {
>>>>>>>> +                       loops++;
>>>>>>>> +                       start = next;
>>>>>>>> +               }
>>>>>>>> +       }
>>>>>>>>       }
>>>>>>> Looks good. But ARM64 and RISC-V also use a simple implementation of
>>>>>> there is no period test on them.
>>>>> I think the one-shot test can also have this problem if the CPU is
>>>>> preempted for a very long time.
>>>>>
>>>>>>> __delay(). So should this problem be thought of as a common problem?
>>>>>>> If yes, maybe we can keep __delay() as is and wait for the common
>>>>>>> parts to be fixed.
>>>>>> Also there is no common udelay() API, it is arch specific. Someone may
>>>>>> argue that skipping stolen cycles is not generic for __delay(), other
>>>>>> test cases want accurate cycles rather than skipping stolen cycles. It
>>>>>> is timer test case specific.
>>>>>>
>>>>>> Or adding another api __delay_loops() or keep it as is and wait for
>>>>>> other architectures, there should be no common part for it.
>>>>> Yes, no common part for it, but it can be a common problem. If other
>>>>> architectures have problems they should also modify their own
>>>>> __delay(), right?
>>>> yes, what to do then?
>>> Merge window is coming, let's keep it as is. And this problem only
>>> exist when the background load is high (so preemption happens easily),
>>> I think this is not the usual case.
>> I am ok with it. Maybe it can improve in future :)
> OK, all kvm patches are here, you can test whether everything works.
> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-kvm
> 
> And if you want this series be merged together please send V3 asap.
> https://lore.kernel.org/loongarch/20251124035402.3817179-1-maobibo@loongson.cn/T/#t
Thanks for your reminder.

vcpu preempt patch is not so hurry, it is only performance improvement 
and it can wait for next round.

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
>>>>>
>>>>> Huacai
>>>>>
>>>>>>
>>>>>> Regards
>>>>>> Bibo Mao
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
>>>>>>>>>>>>> Hucai
>>>>>>>>>>>>>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>> v2 ... v3:
>>>>>>>>>>>>>>          1. Adjust order about patch 2 and patch 3
>>>>>>>>>>>>>>          2. Add test case with alphabetical order
>>>>>>>>>>>>>>          3. Merge one-shot and period timer interrupt test case into one
>>>>>>>>>>>>>>          4. Only add LoongArch specific modification with common file
>>>>>>>>>>>>>>             Makefile.kvm
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> v1 ... v2:
>>>>>>>>>>>>>>          1. Restore PC and PRMD after exception handler
>>>>>>>>>>>>>>          2. Split patch 4 into two small patches with period timer test and
>>>>>>>>>>>>>>             time counter test
>>>>>>>>>>>>>>          3. With time counter test, set time count with 0 when create VM. And
>>>>>>>>>>>>>>             verify time count starts from 0 in guest code
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>> Bibo Mao (6):
>>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add system registers save and restore on
>>>>>>>>>>>>>>            exception
>>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add basic interfaces
>>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add exception handler register interface
>>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add timer interrupt test case
>>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add SW emulated timer test
>>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add time counter test
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>>>>>>>>>>>>>>         .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
>>>>>>>>>>>>>>         .../kvm/include/loongarch/processor.h         |  81 +++++++-
>>>>>>>>>>>>>>         .../selftests/kvm/lib/loongarch/exception.S   |   6 +
>>>>>>>>>>>>>>         .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
>>>>>>>>>>>>>>         .../selftests/kvm/loongarch/arch_timer.c      | 194 ++++++++++++++++++
>>>>>>>>>>>>>>         6 files changed, 410 insertions(+), 3 deletions(-)
>>>>>>>>>>>>>>         create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>>>>>>>>>>>>>>         create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
>>>>>>>>>>>>>> --
>>>>>>>>>>>>>> 2.39.3
>>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>
>>>>
>>>>
>>

