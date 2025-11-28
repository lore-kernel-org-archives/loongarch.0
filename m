Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1390D221299
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 01:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764292281; cv=none; b=PNqN5DaFUSYGOV2WPCy42RAO9UxoBXQrFVILUGX7iC3fKBXlW7eDboNFE1TYIalx8i9F+Qanu46VOmu9PFyTwf0h10hEU36BaXv+5mazCfWTQVIoEYj9ta/Ot3VGQu5rnV2AIOtrgKPWGhgg0mRwiTiyGVsViHsak+UGuQAMRmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764292281; c=relaxed/simple;
	bh=EUp8AjSGMdj/YM09FtrLeBBHO/XYJbgs7aSuJXicHNI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=H4v0xLU//Tiux2QA5ARJ3owSG1BE9YLePTozo2SALO8/3pvIohoognkTrhTdGCP1jWQwuXEgNH5cyIvtEKZLm2I5vIsdu6yk6qlVB0Pa4TFR3akJyov3hKuM8VnRC+yEgNEAA27LhX6JCf36mdzO6XAeyv116bP7Hv9bRb3c5pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxmdGy9ihpoe8oAA--.22874S3;
	Fri, 28 Nov 2025 09:11:14 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxZOSw9ihpfoxBAQ--.42120S3;
	Fri, 28 Nov 2025 09:11:14 +0800 (CST)
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, linux-kernel@vger.kernel.org
References: <20251120065758.3064368-1-maobibo@loongson.cn>
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
 <bcea143f-fc8e-d40f-3fec-7dfe64bfa0c4@loongson.cn>
 <CAAhV-H5PxgfbWQDqLr9apUi40kk_V1OWGoHvwceJbFHPa0FH1g@mail.gmail.com>
 <8b99f6a4-cbcb-9249-610a-3adffa966fdc@loongson.cn>
 <CAAhV-H7h1u4DiYMyWqitxhsBogfen81hOBM5UbrqHFn3+rhO2A@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <980d4749-ff0b-e618-8008-6d1d62c0acdd@loongson.cn>
Date: Fri, 28 Nov 2025 09:08:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7h1u4DiYMyWqitxhsBogfen81hOBM5UbrqHFn3+rhO2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxZOSw9ihpfoxBAQ--.42120S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9fXoWfJr1kArWUtFyxGw15Gw13Jrc_yoW8JFWrXo
	WrJr17Jr18Jr1UJF1UJw1UJr1UJw1UJr1UJryUJr1UJF1Utw1UJr1UJr1UJr47Jr1UJr1U
	JF1UJr1UAry7Jr1Ul-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUY27kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXU
	UUUU=



On 2025/11/27 下午10:38, Huacai Chen wrote:
> On Thu, Nov 27, 2025 at 9:02 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2025/11/27 下午3:11, Huacai Chen wrote:
>>> On Thu, Nov 27, 2025 at 3:03 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>>
>>>>
>>>> On 2025/11/27 下午2:54, Huacai Chen wrote:
>>>>> On Thu, Nov 27, 2025 at 2:48 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2025/11/27 下午2:42, Huacai Chen wrote:
>>>>>>> On Thu, Nov 27, 2025 at 2:21 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2025/11/27 上午10:51, Huacai Chen wrote:
>>>>>>>>> On Thu, Nov 27, 2025 at 10:48 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 2025/11/27 上午10:45, Huacai Chen wrote:
>>>>>>>>>>> On Thu, Nov 27, 2025 at 10:37 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 2025/11/27 上午10:09, Huacai Chen wrote:
>>>>>>>>>>>>> On Thu, Nov 27, 2025 at 9:08 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 2025/11/26 下午9:43, Huacai Chen wrote:
>>>>>>>>>>>>>>> On Mon, Nov 24, 2025 at 10:17 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> On 2025/11/24 上午10:03, Huacai Chen wrote:
>>>>>>>>>>>>>>>>> On Mon, Nov 24, 2025 at 9:58 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> On 2025/11/21 下午10:08, Huacai Chen wrote:
>>>>>>>>>>>>>>>>>>> Hi, Bibo,
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> On Thu, Nov 20, 2025 at 2:58 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> This patchset adds timer test case for LoongArch system, it is based
>>>>>>>>>>>>>>>>>>>> on common arch_timer test case. And it includes one-shot and period mode
>>>>>>>>>>>>>>>>>>>> timer interrupt test, software emulated timer function and time counter
>>>>>>>>>>>>>>>>>>>> test.
>>>>>>>>>>>>>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A5000, sometimes
>>>>>>>>>>>>>>>>>>> it passes, sometimes I get:
>>>>>>>>>>>>>>>>>>> [root@fedora kvm]# ./arch_timer
>>>>>>>>>>>>>>>>>>> Random seed: 0x6b8b4567
>>>>>>>>>>>>>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
>>>>>>>>>>>>>>>>>>> ==== Test Assertion Failure ====
>>>>>>>>>>>>>>>>>>>             loongarch/arch_timer.c:79: irq_iter == 0
>>>>>>>>>>>>>>>>>>>             pid=60138 tid=60142 errno=4 - Interrupted system call
>>>>>>>>>>>>>>>>>>>                1  0x00000001200037cf: test_vcpu_run 于 arch_timer.c:70
>>>>>>>>>>>>>>>>>>>                2  0x00007ffff2449f27: ?? ??:0
>>>>>>>>>>>>>>>>>>>                3  0x00007ffff24c0633: ?? ??:0
>>>>>>>>>>>>>>>>>>>             irq_iter = 0x1.
>>>>>>>>>>>>>>>>>>>             Guest period timer interrupt was not triggered within the specified
>>>>>>>>>>>>>>>>>>>             interval, try to increase the error margin by [-e] option.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> Is this as expected, or something is wrong?
>>>>>>>>>>>>>>>>>> There is problem with that. In generic the vCPU task is rescheduled on
>>>>>>>>>>>>>>>>>> other CPUs or preempted, so period timer interrupt is not handled in
>>>>>>>>>>>>>>>>>> specified time.
>>>>>>>>>>>>>>>>> Then this series need to be updated, or problem comes from other places?
>>>>>>>>>>>>>>>> I think this series need be updated, test success criteria with period
>>>>>>>>>>>>>>>> timer need consider this situation. Let me check how to handle this.
>>>>>>>>>>>>>>> Any updates available?
>>>>>>>>>>>>>> It can be solved by modifying udelay() method with get_cycles() or using
>>>>>>>>>>>>>> cpu loop calculation method.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>>>>>>>>>>>>>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.hYes, no common part for it, but it can be a common problem. If other
>>>>>>>>>> architectures have problems they should also modify their own
>>>>>>>>>> __delay(), right?
>>>>>>>>>>>>>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>          static inline void __delay(uint64_t cycles)
>>>>>>>>>>>>>>          {
>>>>>>>>>>>>>> -       uint64_t start = timer_get_cycles();
>>>>>>>>>>>>>> -
>>>>>>>>>>>>>> -       while ((timer_get_cycles() - start) < cycles)
>>>>>>>>>>>>>> -               cpu_relax();
>>>>>>>>>>>>>> +       uint64_t start, next, loops = 0;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +       start = timer_get_cycles();
>>>>>>>>>>>>>> +       while (loops < cycles) {
>>>>>>>>>>>>>> +               next = timer_get_cycles();
>>>>>>>>>>>>>> +               /* only count one cycle if VM is preempted */
>>>>>>>>>>>>>> +               if (next > start) {
>>>>>>>>>>>>>> +                       loops++;
>>>>>>>>>>>>>> +                       start = next;
>>>>>>>>>>>>>> +               }
>>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>>          }
>>>>>>>>>>>>> Looks good. But ARM64 and RISC-V also use a simple implementation of
>>>>>>>>>>>> there is no period test on them.
>>>>>>>>>>> I think the one-shot test can also have this problem if the CPU is
>>>>>>>>>>> preempted for a very long time.
>>>>>>>>>>>
>>>>>>>>>>>>> __delay(). So should this problem be thought of as a common problem?
>>>>>>>>>>>>> If yes, maybe we can keep __delay() as is and wait for the common
>>>>>>>>>>>>> parts to be fixed.
>>>>>>>>>>>> Also there is no common udelay() API, it is arch specific. Someone may
>>>>>>>>>>>> argue that skipping stolen cycles is not generic for __delay(), other
>>>>>>>>>>>> test cases want accurate cycles rather than skipping stolen cycles. It
>>>>>>>>>>>> is timer test case specific.
>>>>>>>>>>>>
>>>>>>>>>>>> Or adding another api __delay_loops() or keep it as is and wait for
>>>>>>>>>>>> other architectures, there should be no common part for it.
>>>>>>>>>>> Yes, no common part for it, but it can be a common problem. If other
>>>>>>>>>>> architectures have problems they should also modify their own
>>>>>>>>>>> __delay(), right?
>>>>>>>>>> yes, what to do then?
>>>>>>>>> Merge window is coming, let's keep it as is. And this problem only
>>>>>>>>> exist when the background load is high (so preemption happens easily),
>>>>>>>>> I think this is not the usual case.
>>>>>>>> Another method is to modify period timer test case, calling udelay with
>>>>>>>> loop times rather than one time, something like this:
>>>>>>>> --- a/tools/testing/selftests/kvm/loongarch/arch_timer.c
>>>>>>>> +++ b/tools/testing/selftests/kvm/loongarch/arch_timer.c
>>>>>>>> @@ -75,7 +75,7 @@ static void guest_test_oneshot_timer(uint32_t cpu)
>>>>>>>>
>>>>>>>>       static void guest_test_period_timer(uint32_t cpu)
>>>>>>>>       {
>>>>>>>> -       uint32_t irq_iter;
>>>>>>>> +       uint32_t irq_iter, config_iter;
>>>>>>>>              uint64_t us;
>>>>>>>>              struct test_vcpu_shared_data *shared_data = &vcpu_shared_data[cpu];
>>>>>>>>
>>>>>>>> @@ -84,7 +84,8 @@ static void guest_test_period_timer(uint32_t cpu)
>>>>>>>>              us = msecs_to_usecs(test_args.timer_period_ms) +
>>>>>>>> test_args.timer_err_margin_us;
>>>>>>>>              timer_set_next_cmp_ms(test_args.timer_period_ms, true);
>>>>>>>>              /* Setup a timeout for the interrupt to arrive */
>>>>>>>> -       udelay(us * test_args.nr_iter);
>>>>>>>> +       for (config_iter = 0; config_iter < test_args.nr_iter;
>>>>>>>> config_iter++)
>>>>>>>> +               udelay(us);
>>>>>>> This can reduce the probability but still cause problem if the
>>>>>>> background CPU load is very high. So I suggest keep it as is.
>>>>>> If merge window is close, one fix can be post in later.
>>>>>>
>>>>>> Even if the background CPU load is high, timer interrupt will happen
>>>>>> every time udelay() is called. So total times of timer interrupt
>>>>>> triggered will meet the test case requirements.
>>>>> I said it only "reduce the probability" because the one-shot test case
>>>>> is also observed errors. If we use "retry method" to fix, then
>>>>> one-shot test case is also needed.
>>>> one-shot test case has already used split udelay() method. I observed
>>>> one-shot test case failure on 3D6000 also, it is KVM timer emulation issue.
>>> Yes, one-shot test case use udelay() in a loop, but it also calls
>>> __GUEST_ASSERT() in a loop. So it reports errors even if only one of
>>> udelay() timeouts.
>> Sorry, I do not understand what is your meaning. what is the problem
>> with one-shot test case? Do you mean there is problem with one-shot
>> testcase also?
> Sorry for confusing description.
> Yes, one-shot test has problems and the reason is similar to period
> test, if I understand correctly.
> 1. The error report comes from __GUEST_ASSERT(), right?
> 2. The reason of period test error is interrupt hasn't triggered
> during udelay(), right?
> 3. For the one-shot test, there is also a udelay() and a
> __GUEST_ASSERT() in every iteration, right?
> 4. In any iteration of the loop, if a interrupt hasn't triggered
> during udelay(), __GUEST_ASSERT() will report errors, right?
all are right. only that in one loop why a interrupt is not triggered 
during udelay()? is the udelay() too short or other reasons?

If udelay() take longer time than expected, timer interrupt should 
happen between udelay() and  __GUEST_ASSERT(), is that right?

Regards
Bibo Mao
> 
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
>>>> Well, let's keep it as is for the present.
>>>>>
>>>>> Huacai
>>>>>
>>>>>>
>>>>>> Regards
>>>>>> Bibo Mao
>>>>>>>
>>>>>>>
>>>>>>> Huacai
>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> Regards
>>>>>>>> Bibo Mao
>>>>>>>>>
>>>>>>>>> Huacai
>>>>>>>>>
>>>>>>>>>>
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
>>>>>>>>>>>>>>> Huacai
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Regards
>>>>>>>>>>>>>>>> Bibo Mao
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Huacai
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Regards
>>>>>>>>>>>>>>>>>> Bibo Mao
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> Hucai
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>> v2 ... v3:
>>>>>>>>>>>>>>>>>>>>             1. Adjust order about patch 2 and patch 3
>>>>>>>>>>>>>>>>>>>>             2. Add test case with alphabetical order
>>>>>>>>>>>>>>>>>>>>             3. Merge one-shot and period timer interrupt test case into one
>>>>>>>>>>>>>>>>>>>>             4. Only add LoongArch specific modification with common file
>>>>>>>>>>>>>>>>>>>>                Makefile.kvm
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> v1 ... v2:
>>>>>>>>>>>>>>>>>>>>             1. Restore PC and PRMD after exception handler
>>>>>>>>>>>>>>>>>>>>             2. Split patch 4 into two small patches with period timer test and
>>>>>>>>>>>>>>>>>>>>                time counter test
>>>>>>>>>>>>>>>>>>>>             3. With time counter test, set time count with 0 when create VM. And
>>>>>>>>>>>>>>>>>>>>                verify time count starts from 0 in guest code
>>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>> Bibo Mao (6):
>>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add system registers save and restore on
>>>>>>>>>>>>>>>>>>>>               exception
>>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add basic interfaces
>>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add exception handler register interface
>>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add timer interrupt test case
>>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add SW emulated timer test
>>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add time counter test
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>            tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>>>>>>>>>>>>>>>>>>>>            .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
>>>>>>>>>>>>>>>>>>>>            .../kvm/include/loongarch/processor.h         |  81 +++++++-
>>>>>>>>>>>>>>>>>>>>            .../selftests/kvm/lib/loongarch/exception.S   |   6 +
>>>>>>>>>>>>>>>>>>>>            .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
>>>>>>>>>>>>>>>>>>>>            .../selftests/kvm/loongarch/arch_timer.c      | 194 ++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>            6 files changed, 410 insertions(+), 3 deletions(-)
>>>>>>>>>>>>>>>>>>>>            create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>>>>>>>>>>>>>>>>>>>>            create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
>>>>>>>>>>>>>>>>>>>> --
>>>>>>>>>>>>>>>>>>>> 2.39.3
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>
>>>>
>>>>
>>
>>

