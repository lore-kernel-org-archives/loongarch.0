Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E604A2C11DF
	for <loongarch@lists.linux.dev>; Tue,  2 Sep 2025 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815442; cv=none; b=NkH10o2zUYCjKBW0eirxFy6pSYQwNm1O6pgpp4EMUmW8jSw3n1fwCaEXAY5NO1JMstT7Z/qD8+AMZf+fFu32+0ZzyX+pfn7DYe5AN2oqD7sOj2c8zRYYIXv7rU1H8vhE+7sxiyJrH3/yBaCB8MZ49yM3T5d/MTUMVjlSl8oIZ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815442; c=relaxed/simple;
	bh=WKeK4TjkDMRS3nDi2iaypR+EoL8NEvPvhPoo5d5rfMI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qZ7v2kogBtK9RsmZ4Z5jBxS1mtMO11bPplxCv/t5GKr3CX5gT9d9i+XZzIwhtf+wevWmKS2Wbhm0YINTjloUO/l+iOqpFOCa3YvZKmleHZ3nJ/reCRT6tCWXzCXd8LlKiRp63wbX/iDG6El6+xB5jDm5b3fyaI2QtuIXGk8mlG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bx379K4LZoeMsFAA--.10843S3;
	Tue, 02 Sep 2025 20:17:15 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxjcFH4LZozO54AA--.64270S3;
	Tue, 02 Sep 2025 20:17:13 +0800 (CST)
Subject: Re: [PATCH 1/4] LoongArch: KVM: Avoid use copy_from_user with lock
 hold in kvm_eiointc_regs_access
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xianglai Li <lixianglai@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250902094945.2957566-1-maobibo@loongson.cn>
 <20250902094945.2957566-2-maobibo@loongson.cn>
 <CAAhV-H7hCggw_zhQk89uvBrpAPxgHCS_BC5+twsyZdwWkF4A1g@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <4eb3fffa-8330-ad54-8cbc-2cabf6355c74@loongson.cn>
Date: Tue, 2 Sep 2025 20:15:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7hCggw_zhQk89uvBrpAPxgHCS_BC5+twsyZdwWkF4A1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxjcFH4LZozO54AA--.64270S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxtr47uw4rJr4rGr4fJw1xXrc_yoWxGr1fpr
	yUAFsakr4rXry7ZrnFyw1DAr17Aw4xZ3W8Jr18KFyUur1jgrn3tFy8GrW7AF1YkwnxJF1I
	qF1qyF1Yvr1UtwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2L05UUUUU



On 2025/9/2 下午7:58, Huacai Chen wrote:
> Hi, Bibo,
> 
> On Tue, Sep 2, 2025 at 5:49 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> Function copy_from_user() and copy_to_user() may sleep because of page
>> fault, and they cannot be called in spin_lock hold context. Otherwise there
>> will be possible warning such as:
>>
>> BUG: sleeping function called from invalid context at include/linux/uaccess.h:192
>> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 6292, name: qemu-system-loo
>> preempt_count: 1, expected: 0
>> RCU nest depth: 0, expected: 0
>> INFO: lockdep is turned off.
>> irq event stamp: 0
>> hardirqs last  enabled at (0): [<0000000000000000>] 0x0
>> hardirqs last disabled at (0): [<9000000004c4a554>] copy_process+0x90c/0x1d40
>> softirqs last  enabled at (0): [<9000000004c4a554>] copy_process+0x90c/0x1d40
>> softirqs last disabled at (0): [<0000000000000000>] 0x0
>> CPU: 41 UID: 0 PID: 6292 Comm: qemu-system-loo Tainted: G W 6.17.0-rc3+ #31 PREEMPT(full)
>> Tainted: [W]=WARN
>> Stack : 0000000000000076 0000000000000000 9000000004c28264 9000100092ff4000
>>          9000100092ff7b80 9000100092ff7b88 0000000000000000 9000100092ff7cc8
>>          9000100092ff7cc0 9000100092ff7cc0 9000100092ff7a00 0000000000000001
>>          0000000000000001 9000100092ff7b88 947d2f9216a5e8b9 900010008773d880
>>          00000000ffff8b9f fffffffffffffffe 0000000000000ba1 fffffffffffffffe
>>          000000000000003e 900000000825a15b 000010007ad38000 9000100092ff7ec0
>>          0000000000000000 0000000000000000 9000000006f3ac60 9000000007252000
>>          0000000000000000 00007ff746ff2230 0000000000000053 9000200088a021b0
>>          0000555556c9d190 0000000000000000 9000000004c2827c 000055556cfb5f40
>>          00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
>> Call Trace:
>> [<9000000004c2827c>] show_stack+0x5c/0x180
>> [<9000000004c20fac>] dump_stack_lvl+0x94/0xe4
>> [<9000000004c99c7c>] __might_resched+0x26c/0x290
>> [<9000000004f68968>] __might_fault+0x20/0x88
>> [<ffff800002311de0>] kvm_eiointc_regs_access.isra.0+0x88/0x380 [kvm]
>> [<ffff8000022f8514>] kvm_device_ioctl+0x194/0x290 [kvm]
>> [<900000000506b0d8>] sys_ioctl+0x388/0x1010
>> [<90000000063ed210>] do_syscall+0xb0/0x2d8
>> [<9000000004c25ef8>] handle_syscall+0xb8/0x158
>>
>> Fixes: 1ad7efa552fd5 ("LoongArch: KVM: Add EIOINTC user mode read and write functions")
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/kvm/intc/eiointc.c | 33 ++++++++++++++++++++-----------
>>   1 file changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
>> index 026b139dcff2..2fb5b9c6e8ad 100644
>> --- a/arch/loongarch/kvm/intc/eiointc.c
>> +++ b/arch/loongarch/kvm/intc/eiointc.c
>> @@ -462,19 +462,17 @@ static int kvm_eiointc_ctrl_access(struct kvm_device *dev,
>>
>>   static int kvm_eiointc_regs_access(struct kvm_device *dev,
>>                                          struct kvm_device_attr *attr,
>> -                                       bool is_write)
>> +                                       bool is_write, int *data)
>>   {
>>          int addr, cpu, offset, ret = 0;
>>          unsigned long flags;
>>          void *p = NULL;
>> -       void __user *data;
>>          struct loongarch_eiointc *s;
>>
>>          s = dev->kvm->arch.eiointc;
>>          addr = attr->attr;
>>          cpu = addr >> 16;
>>          addr &= 0xffff;
>> -       data = (void __user *)attr->addr;
>>          switch (addr) {
>>          case EIOINTC_NODETYPE_START ... EIOINTC_NODETYPE_END:
>>                  offset = (addr - EIOINTC_NODETYPE_START) / 4;
>> @@ -513,13 +511,10 @@ static int kvm_eiointc_regs_access(struct kvm_device *dev,
>>          }
>>
>>          spin_lock_irqsave(&s->lock, flags);
>> -       if (is_write) {
>> -               if (copy_from_user(p, data, 4))
>> -                       ret = -EFAULT;
>> -       } else {
>> -               if (copy_to_user(data, p, 4))
>> -                       ret = -EFAULT;
>> -       }
>> +       if (is_write)
>> +               memcpy(p, data, 4);
>> +       else
>> +               memcpy(data, p, 4);
> p is a local variable, data is a parameter, they both have nothing to
> do with s, why memcpy need to be protected?
p is pointer to register buffer rather than local variable. When dump 
extioi register to user space, maybe one vCPU is writing extioi register 
at the same time, so there needs spinlock protection.

> 
> After some thinking I found the code was wrong at the first time.  The
> real code that needs to be protected is not copy_from_user() or
> memcpy(), but the above switch block.
For switch block in function kvm_eiointc_regs_access() for example, it 
is only to get register buffer pointer, not register content. Spinlock 
protection is not necessary in switch block.

Regards
Bibo Mao
> 
> Other patches have similar problems.
> 
> Huacai
> 
>>          spin_unlock_irqrestore(&s->lock, flags);
>>
>>          return ret;
>> @@ -576,9 +571,18 @@ static int kvm_eiointc_sw_status_access(struct kvm_device *dev,
>>   static int kvm_eiointc_get_attr(struct kvm_device *dev,
>>                                  struct kvm_device_attr *attr)
>>   {
>> +       int ret, data;
>> +
>>          switch (attr->group) {
>>          case KVM_DEV_LOONGARCH_EXTIOI_GRP_REGS:
>> -               return kvm_eiointc_regs_access(dev, attr, false);
>> +               ret = kvm_eiointc_regs_access(dev, attr, false, &data);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               if (copy_to_user((void __user *)attr->addr, &data, 4))
>> +                       ret = -EFAULT;
>> +
>> +               return ret;
>>          case KVM_DEV_LOONGARCH_EXTIOI_GRP_SW_STATUS:
>>                  return kvm_eiointc_sw_status_access(dev, attr, false);
>>          default:
>> @@ -589,11 +593,16 @@ static int kvm_eiointc_get_attr(struct kvm_device *dev,
>>   static int kvm_eiointc_set_attr(struct kvm_device *dev,
>>                                  struct kvm_device_attr *attr)
>>   {
>> +       int data;
>> +
>>          switch (attr->group) {
>>          case KVM_DEV_LOONGARCH_EXTIOI_GRP_CTRL:
>>                  return kvm_eiointc_ctrl_access(dev, attr);
>>          case KVM_DEV_LOONGARCH_EXTIOI_GRP_REGS:
>> -               return kvm_eiointc_regs_access(dev, attr, true);
>> +               if (copy_from_user(&data, (void __user *)attr->addr, 4))
>> +                       return -EFAULT;
>> +
>> +               return kvm_eiointc_regs_access(dev, attr, true, &data);
>>          case KVM_DEV_LOONGARCH_EXTIOI_GRP_SW_STATUS:
>>                  return kvm_eiointc_sw_status_access(dev, attr, true);
>>          default:
>> --
>> 2.39.3
>>

