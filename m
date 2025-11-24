Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F06B665
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 02:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763950645; cv=none; b=a+khdq+zY9yOaaXqZAqL4kZ5ERWl38YsDZK+MtNJxQ9Ykk5rvyz9u6em8bHHwfD7X9RaCsu+7koJ4ucLjdf7g4kr3KUGcSDwDEIWt2p99KrTbQSvGjTvZQ19f/uafHwuyWgI4btoyvcoGHtI5B1cnFhVizD3KleoysxvwbZWsuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763950645; c=relaxed/simple;
	bh=3n/UqIKs7yJDmt1ABrTFTXr15f5pbeSWnh917eowNuw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JsayyeTOuai9t2+0fMwdnvPffNNJ3++AACPOFmEJPh8F3Z7fnrLSZIoDY61VDqZjS2GaqFAZVVPk0Up1l5+NHHFTEc7iYHmR4gTezpByRYqnYLc6iKBIZpw7kmJpHhf1fjVIC6QLB4qAoRamiL90xtmBvFaGQlT1yzgn1rQrdWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxWNEswCNpzlQnAA--.19316S3;
	Mon, 24 Nov 2025 10:17:16 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxocIiwCNpUFI9AQ--.32906S3;
	Mon, 24 Nov 2025 10:17:09 +0800 (CST)
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, linux-kernel@vger.kernel.org
References: <20251120065758.3064368-1-maobibo@loongson.cn>
 <CAAhV-H4FhRHG+Axsb4KEtiyagepJVKyQ80cLN7TNXdCGAzN-KA@mail.gmail.com>
 <42d93855-50df-a686-85c5-5552ff829977@loongson.cn>
 <CAAhV-H4xprj-WmMkp86xEmn4NL3wwW3aaDoMj=SUiP3pEa+Q7g@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <1605b5eb-5f43-62ff-28c5-192f2f0f938d@loongson.cn>
Date: Mon, 24 Nov 2025 10:14:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4xprj-WmMkp86xEmn4NL3wwW3aaDoMj=SUiP3pEa+Q7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxocIiwCNpUFI9AQ--.32906S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF15ury5KFWrJrWrJw18WFX_yoW5try7pa
	yI9a1fKF48Ar1ay342vr1qgryYqw1vkr1jqF1ftryUArnFyr97Ga1xtFyUuFW3GrykWw1I
	v34F9a43WF1UJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8j-e5UUUUU==



On 2025/11/24 上午10:03, Huacai Chen wrote:
> On Mon, Nov 24, 2025 at 9:58 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2025/11/21 下午10:08, Huacai Chen wrote:
>>> Hi, Bibo,
>>>
>>> On Thu, Nov 20, 2025 at 2:58 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>> This patchset adds timer test case for LoongArch system, it is based
>>>> on common arch_timer test case. And it includes one-shot and period mode
>>>> timer interrupt test, software emulated timer function and time counter
>>>> test.
>>> I test this series on top of 6.18-rc6 with Loongson-3A5000, sometimes
>>> it passes, sometimes I get:
>>> [root@fedora kvm]# ./arch_timer
>>> Random seed: 0x6b8b4567
>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
>>> ==== Test Assertion Failure ====
>>>     loongarch/arch_timer.c:79: irq_iter == 0
>>>     pid=60138 tid=60142 errno=4 - Interrupted system call
>>>        1  0x00000001200037cf: test_vcpu_run 于 arch_timer.c:70
>>>        2  0x00007ffff2449f27: ?? ??:0
>>>        3  0x00007ffff24c0633: ?? ??:0
>>>     irq_iter = 0x1.
>>>     Guest period timer interrupt was not triggered within the specified
>>>     interval, try to increase the error margin by [-e] option.
>>>
>>> Is this as expected, or something is wrong?
>> There is problem with that. In generic the vCPU task is rescheduled on
>> other CPUs or preempted, so period timer interrupt is not handled in
>> specified time.
> Then this series need to be updated, or problem comes from other places?
I think this series need be updated, test success criteria with period 
timer need consider this situation. Let me check how to handle this.

Regards
Bibo Mao
> 
> Huacai
> 
>>
>> Regards
>> Bibo Mao
>>>
>>> Hucai
>>>
>>>> ---
>>>> v2 ... v3:
>>>>     1. Adjust order about patch 2 and patch 3
>>>>     2. Add test case with alphabetical order
>>>>     3. Merge one-shot and period timer interrupt test case into one
>>>>     4. Only add LoongArch specific modification with common file
>>>>        Makefile.kvm
>>>>
>>>> v1 ... v2:
>>>>     1. Restore PC and PRMD after exception handler
>>>>     2. Split patch 4 into two small patches with period timer test and
>>>>        time counter test
>>>>     3. With time counter test, set time count with 0 when create VM. And
>>>>        verify time count starts from 0 in guest code
>>>> ---
>>>> Bibo Mao (6):
>>>>     KVM: LoongArch: selftests: Add system registers save and restore on
>>>>       exception
>>>>     KVM: LoongArch: selftests: Add basic interfaces
>>>>     KVM: LoongArch: selftests: Add exception handler register interface
>>>>     KVM: LoongArch: selftests: Add timer interrupt test case
>>>>     KVM: LoongArch: selftests: Add SW emulated timer test
>>>>     KVM: LoongArch: selftests: Add time counter test
>>>>
>>>>    tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>>>>    .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
>>>>    .../kvm/include/loongarch/processor.h         |  81 +++++++-
>>>>    .../selftests/kvm/lib/loongarch/exception.S   |   6 +
>>>>    .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
>>>>    .../selftests/kvm/loongarch/arch_timer.c      | 194 ++++++++++++++++++
>>>>    6 files changed, 410 insertions(+), 3 deletions(-)
>>>>    create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>>>>    create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c
>>>>
>>>>
>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
>>>> --
>>>> 2.39.3
>>>>
>>

