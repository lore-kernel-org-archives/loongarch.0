Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DB840DFB1
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 03:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773201077; cv=none; b=I56WYuufX+LPijs/zItE4fmcdScK8M5VOQ9n08769aELCl6r34uN1azTsrtdCgbCiUGkbFKpdpaQUokdS8LRQE5D+LMOH99nH8k9stLsVgeqIpQewsjv8G7TiU5O5pzpWoTkI2fh6xPFvwEAGgqE+2rkpb+VAwwnFAVX+hUSSfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773201077; c=relaxed/simple;
	bh=fLscIKEdEklbICNBIqYTqXCPeod+lzBdVkT36MSzOfA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mdkAoFw3JevIOKC1hqHm+wqWFX2DrexPPPnOXW6kyF3XV81k7HV5R++XTzNcS8QKhaSMBgK2ugEJyCV3bywIM4YqPQ62biFPGSp8sD6U9GOPCKMUdHXIsLg177E5LXGki7FtoYqmtnUOH4KXny0VS5b0//0fhDrL8TqOZHH1uic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Axy8Kb5rBpdcoZAA--.9791S3;
	Wed, 11 Mar 2026 11:50:51 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAx38Jx5rBpsrNSAA--.26277S3;
	Wed, 11 Mar 2026 11:50:11 +0800 (CST)
Subject: Re: [PATCH 3/3] LoongArch: KVM: Set vcpu_is_preempted() macro rather
 than function
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, kernel@xen0n.name,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>
References: <20260311031857.3591470-1-maobibo@loongson.cn>
 <20260311031857.3591470-4-maobibo@loongson.cn>
 <CAAhV-H6p=bArdYHkE-0s55Ogvm+Dtv8TVVCLAHGeqA-pnPOXwA@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <7f4c6ef8-b24f-88c5-82f2-e00d1629ae4c@loongson.cn>
Date: Wed, 11 Mar 2026 11:47:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6p=bArdYHkE-0s55Ogvm+Dtv8TVVCLAHGeqA-pnPOXwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx38Jx5rBpsrNSAA--.26277S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw1UGFy8Cry3urWkZF43urX_yoWrXFWrpF
	9rCFnYva18Wr1xW3yavr4DCr1Yqws7W3Z2va43Ga4rAF4qqr1kJr1v934j9Fy2qa4kWa1I
	qF95Wr4xuF1aywcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU1EksDUUUUU==



On 2026/3/11 上午11:35, Huacai Chen wrote:
> Hi, Bibo,
> 
> On Wed, Mar 11, 2026 at 11:21 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> vcpu_is_preempted() is performance sensitive called in function
>> osq_lock(), here set it as macro. So that parameter is not parsed
>> at most time, it can avoid cache line thrashing across numa node.
> I remember that I had suggested you define vcpu_is_preempted() in the
> header file but you refused.
yes, I refuse then, that is a tragedy, I am sorry for that:(

By some benchmarks, vcpu_is_preempted() is called in busy-loop method, 
more obvious with more CPUs, it may be a bottleneck.

Regards
Bibo Mao

> 
> Huacai
> 
>>
>> Here is part of unixbench result on 3C5000 DualWay machine with 32
>> Cores and 2 Numa node.
>>            origin    with patch    CONFIG_PARAVIRT disabled
>> execl     6871.9    7134.2        7190.8
>> fstime    425.5     959.9         956.1
>>
>>  From the test result, with macro method it is almost the same with
>> CONFIG_PARAVIRT disabled, and there is some improvment compared with
>> function method.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/qspinlock.h | 27 +++++++++++++++++++++-----
>>   arch/loongarch/kernel/paravirt.c       | 15 ++------------
>>   2 files changed, 24 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/qspinlock.h b/arch/loongarch/include/asm/qspinlock.h
>> index 66244801db67..305afd37cdcb 100644
>> --- a/arch/loongarch/include/asm/qspinlock.h
>> +++ b/arch/loongarch/include/asm/qspinlock.h
>> @@ -5,8 +5,10 @@
>>   #include <linux/jump_label.h>
>>
>>   #ifdef CONFIG_PARAVIRT
>> -
>> +#include <asm/kvm_para.h>
>>   DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
>> +DECLARE_STATIC_KEY_FALSE(virt_preempt_key);
>> +DECLARE_PER_CPU(struct kvm_steal_time, steal_time);
>>
>>   #define virt_spin_lock virt_spin_lock
>>
>> @@ -34,10 +36,25 @@ static inline bool virt_spin_lock(struct qspinlock *lock)
>>          return true;
>>   }
>>
>> -#define vcpu_is_preempted vcpu_is_preempted
>> -
>> -bool vcpu_is_preempted(int cpu);
>> -
>> +/*
>> + * Macro is better than inline function here
>> + * With inline function, parameter cpu is parsed even though it is not used.
>> + * This may cause cache line thrashing across NUMA node.
>> + * With macro method, parameter cpu is parsed only when it is used.
>> + */
>> +#define vcpu_is_preempted(cpu)                                         \
>> +({                                                                     \
>> +       bool __val;                                                     \
>> +                                                                       \
>> +       if (!static_branch_unlikely(&virt_preempt_key))                 \
>> +               __val = false;                                          \
>> +       else {                                                          \
>> +               struct kvm_steal_time *src;                             \
>> +               src = &per_cpu(steal_time, cpu);                        \
>> +               __val = !!(src->preempted & KVM_VCPU_PREEMPTED);        \
>> +       }                                                               \
>> +       __val;                                                          \
>> +})
>>   #endif /* CONFIG_PARAVIRT */
>>
>>   #include <asm-generic/qspinlock.h>
>> diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
>> index b74fe6db49ab..2d1206e486e2 100644
>> --- a/arch/loongarch/kernel/paravirt.c
>> +++ b/arch/loongarch/kernel/paravirt.c
>> @@ -10,8 +10,8 @@
>>   #include <asm/paravirt.h>
>>
>>   static int has_steal_clock;
>> -static DEFINE_PER_CPU(struct kvm_steal_time, steal_time) __aligned(64);
>> -static DEFINE_STATIC_KEY_FALSE(virt_preempt_key);
>> +DEFINE_PER_CPU(struct kvm_steal_time, steal_time) __aligned(64);
>> +DEFINE_STATIC_KEY_FALSE(virt_preempt_key);
>>   DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
>>
>>   static bool steal_acc = true;
>> @@ -261,17 +261,6 @@ static int pv_time_cpu_down_prepare(unsigned int cpu)
>>          return 0;
>>   }
>>
>> -bool vcpu_is_preempted(int cpu)
>> -{
>> -       struct kvm_steal_time *src;
>> -
>> -       if (!static_branch_unlikely(&virt_preempt_key))
>> -               return false;
>> -
>> -       src = &per_cpu(steal_time, cpu);
>> -       return !!(src->preempted & KVM_VCPU_PREEMPTED);
>> -}
>> -EXPORT_SYMBOL(vcpu_is_preempted);
>>   #endif
>>
>>   static void pv_cpu_reboot(void *unused)
>> --
>> 2.39.3
>>
>>

