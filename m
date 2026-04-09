Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD54B3A5E9E
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775736847; cv=none; b=FUt4b6vdu9JBco8ZvwLDd8513v3Z4mQfs1gvIU9eaJOFRx6HP9CVP6nOfrMVh0t1oNrrFuHXnHThqom5fx0grunjQy4kFNVpr9lrv0/FPCktG3APUiMSg+vbfYcV2mD7yWv6Hgej0ts/67a3FeRA6UGybl3tp4KT8LwI83sMPb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775736847; c=relaxed/simple;
	bh=Nmds5nZ/SRW3m84a7R7nBu692/QNNcN/ovp6k/4beGQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VvWoBet+zD1WMzITX8EDAaMBuRB6Vxz5H/APkNUpK4FgBM5ol4oUknMCHk+C/r4WgXuiN+OzgCZrELkKLbSTpU/b9RL90c26NGJFrgaS9njYivMSIwjkCRCpBSdIYKt2UiqaY5nYFn3L3Z+AJltH3OYdB7m04thCPy/JJZOxLoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxBMEImNdpNIsjAA--.432S3;
	Thu, 09 Apr 2026 20:14:01 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCx98AHmNdpqH1pAA--.55711S3;
	Thu, 09 Apr 2026 20:14:00 +0800 (CST)
Subject: Re: [PATCH v2 0/6] LoongArch: KVM: Set max VM supported FPU type with
 FPU exception
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260330035832.2204720-1-maobibo@loongson.cn>
 <CAAhV-H4Ws3Y89XfSXdGpm3BL5Pr5kTzC0NPdkDm17uy3ZEZJmA@mail.gmail.com>
 <CAAhV-H7UP5TZh5zaqtkAboUt226-vGUBddksYXxafdKOioVngQ@mail.gmail.com>
 <61d0efa7-a15a-be48-3bca-5be5efd99acf@loongson.cn>
 <CAAhV-H4+A0bs07v4B8BTCqbNsG5SLSjjx8sh5Lz23i+R37RAKw@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <74e8fa9e-90f6-175e-fb98-2e4504d5f15d@loongson.cn>
Date: Thu, 9 Apr 2026 20:11:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4+A0bs07v4B8BTCqbNsG5SLSjjx8sh5Lz23i+R37RAKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx98AHmNdpqH1pAA--.55711S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFW5AFykAr4kuw1fJw4DZFc_yoWrCr1Dpr
	ZxJF1akF4DJr1fZrnFvw1UWF1Yvr1xJry0q3sIqryjvr90vryrJr4xtFsY9FyUG34rJF1j
	vrW0yF97Xa45ZrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjwZcUUUUU=



On 2026/4/8 下午3:47, Huacai Chen wrote:
> On Wed, Apr 8, 2026 at 9:04 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2026/4/7 下午8:41, Huacai Chen wrote:
>>> On Mon, Mar 30, 2026 at 6:00 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>>>
>>>> Hi, Bibo,
>>>>
>>>>
>>>> On Mon, Mar 30, 2026 at 11:58 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>>
>>>>> With FPU save and restore flow, the cost is the same with different
>>>>> FPU width 8/16/32 bytes, whatever from CPU cycle and cache line impaction.
>>>>>
>>>>> Here is to enable FPU with max VM supported type, for example if
>>>>> VM supports LASX instrction, enable FPU with LASX type even with FPU
>>>>> exeception. So it can avoid possible LSX/LASX exception in future.
>>>>>
>>>>> With context switch microbench which may touch FPU and LASX, there is 9%
>>>>> improvement when halt_poll_ns is disabled. The command is
>>>>> "./context --test=pipe" and source code located at:
>>>>>     https://github.com/bibo-mao/context_switch/blob/main/context.c
>>>>>
>>>>> Original     Wih patch      improvement
>>>>> 75232        82440          9%
>>>>>
>>>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>>>> ---
>>>>> v1 ... v2:
>>>>>     1. Enable FPU with max VM supported FPU type, rather than max used type.
>>>>>     2. Add new request bit KVM_REQ_LBT_LOAD for LBT restore
>>>>>     3. Rename KVM_REQ_AUX_LOAD with KVM_REQ_FPU_LOAD
>>>>>     3. Remove aux_ldtype and KVM_LARCH_LSX/KVM_LARCH_LSX
>>>>>     4. Remove middle FPU state handling in kvm_own_lsx() and kvm_own_lasx(),
>>>>>        directly enable LSX or LASX from FPU none state.
>>>>> ---
>>>>> Bibo Mao (6):
>>>>>     LoongArch: KVM: Add separate KVM_REQ_LBT_LOAD request bit
>>>>>     LoongArch: KVM: Enable FPU with max VM supported FPU type
>>>>>     LoongArch: KVM: Rename KVM_REQ_AUX_LOAD with KVM_REQ_FPU_LOAD
>>>> Patch-1 add KVM_REQ_LBT_LOAD, then KVM_REQ_AUX_LOAD is only for FPU,
>>>> so I think Patch-3 should be squashed into Patch-1.
>>>>
>>>>>     LoongArch: KVM: Remove some middle FPU states
>>>>>     LoongArch: KVM: Use vm_guest_has_fpu API in kvm_lose_fpu()
>>>>>     LoongArch: KVM: Remove KVM_LARCH_LASX and KVM_LARCH_LSX
>>>> Patch-5 remove the consumer side of KVM_LARCH_LASX / KVM_LARCH_LSX and
>>>> Patch-6 remove the provider side of KVM_LARCH_LASX / KVM_LARCH_LSX, so
>>>> I think Patch-6 should be squashed into Patch-5, too.
>>> And could you please test the power consumption where there are many
>>> VMs that only use FPU rather than LSX/LASX? As far as I know, the
>> Hi Huacai,
>>
>> Thanks for reviewing this patch
>> Could you help me to test the power consumption with this patch?
>>> power consumption of LASX is significantly more than FPU, which is a
>> Could the describe the detail scenery wheree LASX instruction is
>> frequently used by application or LASX  EUEN enabled?
> The purpose is to evaluate power consumption before and after this series.
> 
> So we can run 10 VMs (suppose there are 4 cores), and there is a
> workload run in every VM, the workload only uses FPU, no LSX and LASX.
> Before this series, KVM only save/restore FPU context; after this
> series, KVM will save/restore LASX context.
In theory there should be such test, only that it requires special Power 
Management team and testbed. Even if there is such team, maybe they care 
power consumption about DDR and screen, do not want do such experiments 
for this patch.

If someone is volunteer to do this, I do not object, also I want to get 
the result. Just from my guess, there should be no much difference since 
FPU context switch is much smaller than the whole workload, else the 
workload is just FPU context switch.

Regards
Bibo Mao

> 
> If the power consumptions are similar, then this series is perfect.
> 
> Huacai
> 
>>
>> Regards
>> Bibo Mao
>>> little similar to AVX512 (Linus said it is a power virus).
>>>
>>> Huacai
>>>
>>>>
>>>>
>>>> Huacai
>>>>
>>>>>
>>>>>    arch/loongarch/include/asm/kvm_host.h |  6 +--
>>>>>    arch/loongarch/kvm/exit.c             | 21 +++-----
>>>>>    arch/loongarch/kvm/vcpu.c             | 78 ++++++++-------------------
>>>>>    3 files changed, 30 insertions(+), 75 deletions(-)
>>>>>
>>>>>
>>>>> base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
>>>>> --
>>>>> 2.39.3
>>>>>
>>>>>
>>
>>

