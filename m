Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D81167284
	for <loongarch@lists.linux.dev>; Thu,  6 Jun 2024 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717674907; cv=none; b=k1NZuJZ8fiFG6LCQMWh76BP5IdQereGoxHP+j72ssUOmRMNw68SPYkkK4Acxv9559avpQGyRJasdxVrw7WOZKXeE5xUobPVeMqwdtfPhwoka8oT3wVlYkHBxqCQBadxQhUMVO8UiV1FnbwTc5GB5d/hv4x4dX/+si+vg0jCzUe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717674907; c=relaxed/simple;
	bh=5YI/F2VeI2iQgEFUoISlYAGkH60Dx6AgzEzpjQeRrzU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Kzu+/B+HaY/EYZ82Gc9aENxM00vMN9u9MK9rSZHVUIdYxzXlnjmnIgBD2D64JWSDxJoLmQCmyLXpyaxH/bOscS0//MTf8L1/V++/b3OPIMn/QR44FYXnO6Uej6o5hOvUd47Qegn2BGG567WUptXmrmvqu+BbsoKh2gMbAE8eKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxHuuVo2Fm9jYEAA--.17775S3;
	Thu, 06 Jun 2024 19:55:02 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxbceTo2FmFN4WAA--.57347S3;
	Thu, 06 Jun 2024 19:55:01 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Add feature passing from user space
To: WANG Xuerui <kernel@xen0n.name>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240606074850.2651896-1-maobibo@loongson.cn>
 <9bb552c8-fe86-43dc-9c4e-0b95c99fb25c@xen0n.name>
From: maobibo <maobibo@loongson.cn>
Message-ID: <2774b010-8033-2167-474a-cb1b29b27d2b@loongson.cn>
Date: Thu, 6 Jun 2024 19:54:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9bb552c8-fe86-43dc-9c4e-0b95c99fb25c@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxbceTo2FmFN4WAA--.57347S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxtF1DJr4UCF1ftr1xtw4kXwc_yoW7Wry8pF
	ykAFs8GrWUGr1fCw1kt34DWry5Xr1xGw12qF17Xa1UAF42gr10qr1vgryqgF1UJw48X3WI
	qF1Yqwn8ZF1jq3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4oGQDUUUU

Xuerui,

Thanks for your reviewing.
I reply inline.

On 2024/6/6 下午7:20, WANG Xuerui wrote:
> Hi,
> 
> On 6/6/24 15:48, Bibo Mao wrote:
>> Currently features defined in cpucfg CPUCFG_KVM_FEATURE comes from
>> kvm kernel mode only. Some features are defined in user space VMM,
> 
> "come from kernel side only. But currently KVM is not aware of 
> user-space VMM features which makes it hard to employ optimizations that 
> are both (1) specific to the VM use case and (2) requiring cooperation 
> from user space."
Will modify in next version.
> 
>> however KVM module does not know. Here interface is added to update
>> register CPUCFG_KVM_FEATURE from user space, only bit 24 - 31 is valid.
>>
>> Feature KVM_LOONGARCH_VCPU_FEAT_VIRT_EXTIOI is added from user mdoe.
>> FEAT_VIRT_EXTIOI is virt EXTIOI extension which can route interrupt
>> to 256 VCPUs rather than 4 CPUs like real hw.
> 
> "A new feature bit ... is added which can be set from user space. 
> FEAT_... indicates that the VM EXTIOI can route interrupts to 256 vCPUs, 
> rather than 4 like with real HW."
will modify in next version.

> 
> (Am I right in paraphrasing the "EXTIOI" part?)
> 
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/kvm_host.h  |  4 +++
>>   arch/loongarch/include/asm/loongarch.h |  5 ++++
>>   arch/loongarch/include/uapi/asm/kvm.h  |  2 ++
>>   arch/loongarch/kvm/exit.c              |  1 +
>>   arch/loongarch/kvm/vcpu.c              | 36 +++++++++++++++++++++++---
>>   5 files changed, 44 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/kvm_host.h 
>> b/arch/loongarch/include/asm/kvm_host.h
>> index 88023ab59486..8fa50d757247 100644
>> --- a/arch/loongarch/include/asm/kvm_host.h
>> +++ b/arch/loongarch/include/asm/kvm_host.h
>> @@ -135,6 +135,9 @@ enum emulation_result {
>>   #define KVM_LARCH_HWCSR_USABLE    (0x1 << 4)
>>   #define KVM_LARCH_LBT        (0x1 << 5)
>> +#define KVM_LOONGARCH_USR_FEAT_MASK            \
>> +    BIT(KVM_LOONGARCH_VCPU_FEAT_VIRT_EXTIOI)
>> +
>>   struct kvm_vcpu_arch {
>>       /*
>>        * Switch pointer-to-function type to unsigned long
>> @@ -210,6 +213,7 @@ struct kvm_vcpu_arch {
>>           u64 last_steal;
>>           struct gfn_to_hva_cache cache;
>>       } st;
>> +    unsigned int usr_features;
>>   };
>>   static inline unsigned long readl_sw_gcsr(struct loongarch_csrs 
>> *csr, int reg)
>> diff --git a/arch/loongarch/include/asm/loongarch.h 
>> b/arch/loongarch/include/asm/loongarch.h
>> index 7a4633ef284b..4d9837512c19 100644
>> --- a/arch/loongarch/include/asm/loongarch.h
>> +++ b/arch/loongarch/include/asm/loongarch.h
>> @@ -167,9 +167,14 @@
>>   #define CPUCFG_KVM_SIG            (CPUCFG_KVM_BASE + 0)
>>   #define  KVM_SIGNATURE            "KVM\0"
>> +/*
>> + * BIT 24 - 31 is features configurable by user space vmm
>> + */
>>   #define CPUCFG_KVM_FEATURE        (CPUCFG_KVM_BASE + 4)
>>   #define  KVM_FEATURE_IPI        BIT(1)
>>   #define  KVM_FEATURE_STEAL_TIME        BIT(2)
>> +/* With VIRT_EXTIOI feature, interrupt can route to 256 VCPUs */
>> +#define  KVM_FEATURE_VIRT_EXTIOI    BIT(24)
>>   #ifndef __ASSEMBLY__
> 
> What about assigning a new CPUCFG leaf ID for separating the two kinds 
> of feature flags very cleanly?
For compatible issue like new kernel on old KVM host, to add a new
CPUCFG leaf ID, a new feature need be defined on existing 
CPUCFG_KVM_FEATURE register. Such as:
    #define  KVM_FEATURE_EXTEND_CPUCFG        BIT(3)

VM need check feature KVM_FEATURE_EXTEND_CPUCFG at first, and then read 
the new CPUCFG leaf ID if feature EXTEND_CPUCFG is enabled.

That maybe makes it complicated since feature bit is enough now.
> 
>> @@ -896,7 +907,24 @@ static int kvm_loongarch_vcpu_get_attr(struct 
>> kvm_vcpu *vcpu,
>>   static int kvm_loongarch_cpucfg_set_attr(struct kvm_vcpu *vcpu,
>>                        struct kvm_device_attr *attr)
>>   {
>> -    return -ENXIO;
>> +    u64 __user *user = (u64 __user *)attr->addr;
>> +    u64 val, valid_flags;
>> +
>> +    switch (attr->attr) {
>> +    case CPUCFG_KVM_FEATURE:
>> +        if (get_user(val, user))
>> +            return -EFAULT;
>> +
>> +        valid_flags = KVM_LOONGARCH_USR_FEAT_MASK;
>> +        if (val & ~valid_flags)
>> +            return -EINVAL;
>> +
>> +        vcpu->arch.usr_features |= val;
> 
> Isn't this usage of "|=" instead of "=" implying that the feature bits 
> could not get disabled after being enabled earlier, for whatever reason?
yes, "=" is better. Will modify in next version.

Regards
Bibo Mao
> 
>> +        return 0;
>> +
>> +    default:
>> +        return -ENXIO;
>> +    }
>>   }
>>   static int kvm_loongarch_vcpu_set_attr(struct kvm_vcpu *vcpu,
>>
>> base-commit: 2df0193e62cf887f373995fb8a91068562784adc
> 

