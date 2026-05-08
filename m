Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C402F3C10
	for <loongarch@lists.linux.dev>; Fri,  8 May 2026 03:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210356; cv=none; b=rM2rcZmRmC2rhdtGd2AQhkK2KxMHTS3b0jWX4m1OfRAvVHbFt1Fi5Kiep3e/58WHwQ+IsHum+kEvSxJPGUw53hYb+7DYtV+4DUW/gE70NynQsl+UPJXxVH1py0grISafmJn9NnhpQwlWGd4OMBz/jxZYd4KJnwAtbHF6CdxruoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210356; c=relaxed/simple;
	bh=FlfoQ+iUqK/P+mndJSB/WYV+qMqLFhR59Er7adSFt9w=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=HrRUoqmECGzAXAnbedIOBKxQFBSRgWGMgtTjz8qIhK4wj8j01MNmktFmEYdl6sdSuCL99KPl7fJtlNIVjxkDsLXj8JHw/YxQxv1F4ccysD1OomLBXB0fmcMVIJIq/IQUGJ82/XhSidxkQNqcgx4mBSLNKakkwNCpzJB+MVp24Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Cx4eooVv1pu8IHAA--.24953S3;
	Fri, 08 May 2026 11:19:04 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxGOAnVv1pMqt8AA--.40415S3;
	Fri, 08 May 2026 11:19:03 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Move some variable declaration to file
 paravirt.h
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260508013001.4107737-1-maobibo@loongson.cn>
 <CAAhV-H6dHM0GBFCh-6-q0fM3VSa49RTXSDz+YUvM0j7u_was1g@mail.gmail.com>
 <3d3bb8ea-34b7-b4da-deac-677ac272dd76@loongson.cn>
 <CAAhV-H44v2TcSAeq+mDiHy26k=mE4ykqjrvPsNurgpw4OhnNTg@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <076bc4bc-54da-efb6-b1d4-e5e754bb580a@loongson.cn>
Date: Fri, 8 May 2026 11:16:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H44v2TcSAeq+mDiHy26k=mE4ykqjrvPsNurgpw4OhnNTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOAnVv1pMqt8AA--.40415S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw1fArWkJr4DCF1fur1fKrX_yoW5KF13pa
	yDAF1kWa18Gr18AF42qFZIgr1Utw4kGr1IqFyUXFyUA39Fqw1kXr4kKryq9Fyqya1ktF40
	gFySgrZxuF1jvwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU82g43UUUUU==



On 2026/5/8 上午11:11, Huacai Chen wrote:
> On Fri, May 8, 2026 at 11:08 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2026/5/8 上午10:56, Huacai Chen wrote:
>>> Hi, Bibo,
>>>
>>> On Fri, May 8, 2026 at 9:30 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>> Some variables relative with paravirt feature are declared in header file
>>>> asm/qspinlock.h, however this file can be included only when option
>>>> CONFIG_SMP is on. There is compiling warning if CONFIG_SMP is off since
>>>> it is not declared.
>>>>
>>>> Move these variable declaration to header file asm/paravirt.h to avoid
>>>> compiling warning.
>>> Have you reproduced the warning? I cannot reproduce it in my
>>> environment with the config file from lkp report, so I also cannot
>>> confirm whether it is fixed.
>> yes, I can reproduce this and it is fixed. The warning is reported from
>> sparse tool, rather than LLVM.
>>>
>>> Another question:
>>> Is paravirt.h a better place than kvm_para.h?
>> en, here kvm_para.h seems better, will send V2 version in next time.
> Frankly, I don't know the difference between the two files. kvm_para.h
> is kvm specific and paravirt.h is generic? Or kvm_para.h is the
> hypervisor side and paravirt.h is the guest side?
kvm_para.h is shared by hypervisor and guest kernel, paravirt.h is only 
used by guest kernel. And option CONFIG_PARAVIRT is useful with guest 
kernel, CONFIG_PARAVIRT has no much meaning with hypervisor.

Regards
Bibo Mao
> 
> Huacai
> 
>>
>> Regards
>> Bibo Mao
>>
>>>
>>> Huacai
>>>
>>>>
>>>> Fixes: c43dce6f13fb ("LoongArch: KVM: Make vcpu_is_preempted() as a macro rather than function")
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202605061313.O8Hswm2b-lkp@intel.com/
>>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>>> ---
>>>>    arch/loongarch/include/asm/paravirt.h  | 4 ++++
>>>>    arch/loongarch/include/asm/qspinlock.h | 5 +----
>>>>    2 files changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/loongarch/include/asm/paravirt.h b/arch/loongarch/include/asm/paravirt.h
>>>> index 0111f0ad5f73..dbc64908017f 100644
>>>> --- a/arch/loongarch/include/asm/paravirt.h
>>>> +++ b/arch/loongarch/include/asm/paravirt.h
>>>> @@ -3,6 +3,10 @@
>>>>    #define _ASM_LOONGARCH_PARAVIRT_H
>>>>
>>>>    #ifdef CONFIG_PARAVIRT
>>>> +#include <linux/jump_label.h>
>>>> +DECLARE_STATIC_KEY_FALSE(virt_preempt_key);
>>>> +DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
>>>> +DECLARE_PER_CPU(struct kvm_steal_time, steal_time);
>>>>
>>>>    int __init pv_ipi_init(void);
>>>>    int __init pv_time_init(void);
>>>> diff --git a/arch/loongarch/include/asm/qspinlock.h b/arch/loongarch/include/asm/qspinlock.h
>>>> index 0ee15b3b3937..fbfc6be82f26 100644
>>>> --- a/arch/loongarch/include/asm/qspinlock.h
>>>> +++ b/arch/loongarch/include/asm/qspinlock.h
>>>> @@ -3,12 +3,9 @@
>>>>    #define _ASM_LOONGARCH_QSPINLOCK_H
>>>>
>>>>    #include <asm/kvm_para.h>
>>>> -#include <linux/jump_label.h>
>>>> +#include <asm/paravirt.h>
>>>>
>>>>    #ifdef CONFIG_PARAVIRT
>>>> -DECLARE_STATIC_KEY_FALSE(virt_preempt_key);
>>>> -DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
>>>> -DECLARE_PER_CPU(struct kvm_steal_time, steal_time);
>>>>
>>>>    #define virt_spin_lock virt_spin_lock
>>>>
>>>>
>>>> base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
>>>> --
>>>> 2.39.3
>>>>
>>

