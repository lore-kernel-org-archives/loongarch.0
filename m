Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD861F3B87
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105075; cv=none; b=NaXleS3dEQ0qSVfkGqFd5/5ufmKmyeTuIQ0/3hRI/b9R5olKezwHSI87BhwLK/v48eD1G4CtZpM4Nis127RktGRG8KxWk+Lb/mWIFcU0cOKdhtQDcD9Wa6nGgnEM+tKeRiBD8PnnrIUr43+ahbfdSsVk2Rq7kOXFa4L9HNSZBmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105075; c=relaxed/simple;
	bh=56gdmw32y644px8re6hn9Lk7NZaqrOXwVydzn28qO3A=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Z8DfUUN/MGrSv2u2y+Kgrs/ne7DKo5jRPvB9en1/GGePGIgUWtRKRDZ+piFq3kxxM9dmF6X1bZ2NDyCNQOHt7IhZ7AipTgAYhwRuuPMQNgCFt4atl3z1PCVVNkptjfOPzHaLifmTLtsvnekQ8v/1wzoXIX4aOTJGEsdOqXNakyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxVcHpqIFpLUoPAA--.2557S3;
	Tue, 03 Feb 2026 15:51:06 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxGODjqIFp7vc+AA--.51394S3;
	Tue, 03 Feb 2026 15:51:04 +0800 (CST)
Subject: Re: [PATCH v3 4/4] LoongArch: KVM: Add FPU delay load support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20260203033131.3372834-1-maobibo@loongson.cn>
 <20260203033131.3372834-5-maobibo@loongson.cn>
 <CAAhV-H7Y-m2wfV2YZ7J_nU0Zc198jroP6o8m0C+qSZ-8S79kwg@mail.gmail.com>
 <b9f311be-88f6-ffca-fc8e-70bec2cf7a75@loongson.cn>
 <CAAhV-H6v2oVe38HX7k_wvysUx4nyz6pbfUOU7wiaJO+1A3ASJw@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <03d39cc0-ed99-b32b-8678-575c646b6428@loongson.cn>
Date: Tue, 3 Feb 2026 15:48:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6v2oVe38HX7k_wvysUx4nyz6pbfUOU7wiaJO+1A3ASJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGODjqIFp7vc+AA--.51394S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3WrWfKw18uw48XF13GrykZwc_yoW3ZFy8pr
	WxAF4kAw48Wr1ak34Iqwn0grnIvrWkKr1xXry2gay5Kr1qqFy3Jr48KryDuFyrCw1rCF1I
	qFy5tF43uFy8J3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjwZcUUUUU=



On 2026/2/3 下午3:34, Huacai Chen wrote:
> On Tue, Feb 3, 2026 at 2:48 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2026/2/3 下午12:15, Huacai Chen wrote:
>>> Hi, Bibo,
>>>
>>> On Tue, Feb 3, 2026 at 11:31 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>> FPU is lazy enabled with KVM hypervisor. After FPU is enabled and
>>>> loaded, vCPU can be preempted and FPU will be lost again, there will
>>>> be unnecessary FPU exception, load and store process. Here FPU is
>>>> delay load until guest enter entry.
>>> Calling LSX/LASX as FPU is a little strange, but somewhat reasonable.
>>> Calling LBT as FPU is very strange. So I still like the V1 logic.
>> yeap, LBT can use another different BIT and separate with FPU. It is
>> actually normal use one bit + fpu type variant to represent different
>> different FPU load requirement, such as
>> TIF_FOREIGN_FPSTATE/TIF_NEED_FPU_LOAD on other architectures.
>>
>> I think it is better to put int fpu_load_type in structure loongarch_fpu.
>>
>> And there will be another optimization to avoid load FPU again if FPU HW
>> is owned by current thread/vCPU, that will add last_cpu int type in
>> structure loongarch_fpu also.
>>
>> Regards
>> Bibo Mao
>>>
>>> If you insist on this version, please rename KVM_REQ_FPU_LOAD to
>>> KVM_REQ_AUX_LOAD and rename fpu_load_type to aux_type, which is
>>> similar to aux_inuse.
> Then why not consider this?
this can work now. However there is two different structure struct 
loongarch_fpu and struct loongarch_lbt.

1. If kernel wants to use late FPU load, new element fpu_load_type can 
be added in struct loongarch_fpu for both user app/KVM.

2. With further optimization, FPU HW can own by user app/kernel/KVM, 
there will be another last_cpu int type added in struct loongarch_fpu.

Regards
Bibo Mao

Regards
Bibo Mao

> 
> Huacai
> 
>>>
>>> Huacai
>>>
>>>>
>>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>>> ---
>>>>    arch/loongarch/include/asm/kvm_host.h |  2 ++
>>>>    arch/loongarch/kvm/exit.c             | 21 ++++++++++-----
>>>>    arch/loongarch/kvm/vcpu.c             | 37 ++++++++++++++++++---------
>>>>    3 files changed, 41 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
>>>> index e4fe5b8e8149..902ff7bc0e35 100644
>>>> --- a/arch/loongarch/include/asm/kvm_host.h
>>>> +++ b/arch/loongarch/include/asm/kvm_host.h
>>>> @@ -37,6 +37,7 @@
>>>>    #define KVM_REQ_TLB_FLUSH_GPA          KVM_ARCH_REQ(0)
>>>>    #define KVM_REQ_STEAL_UPDATE           KVM_ARCH_REQ(1)
>>>>    #define KVM_REQ_PMU                    KVM_ARCH_REQ(2)
>>>> +#define KVM_REQ_FPU_LOAD               KVM_ARCH_REQ(3)
>>>>
>>>>    #define KVM_GUESTDBG_SW_BP_MASK                \
>>>>           (KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP)
>>>> @@ -234,6 +235,7 @@ struct kvm_vcpu_arch {
>>>>           u64 vpid;
>>>>           gpa_t flush_gpa;
>>>>
>>>> +       int fpu_load_type;
>>>>           /* Frequency of stable timer in Hz */
>>>>           u64 timer_mhz;
>>>>           ktime_t expire;
>>>> diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
>>>> index 65ec10a7245a..62403c7c6f9a 100644
>>>> --- a/arch/loongarch/kvm/exit.c
>>>> +++ b/arch/loongarch/kvm/exit.c
>>>> @@ -754,7 +754,8 @@ static int kvm_handle_fpu_disabled(struct kvm_vcpu *vcpu, int ecode)
>>>>                   return RESUME_HOST;
>>>>           }
>>>>
>>>> -       kvm_own_fpu(vcpu);
>>>> +       vcpu->arch.fpu_load_type = KVM_LARCH_FPU;
>>>> +       kvm_make_request(KVM_REQ_FPU_LOAD, vcpu);
>>>>
>>>>           return RESUME_GUEST;
>>>>    }
>>>> @@ -794,8 +795,10 @@ static int kvm_handle_lsx_disabled(struct kvm_vcpu *vcpu, int ecode)
>>>>    {
>>>>           if (!kvm_guest_has_lsx(&vcpu->arch))
>>>>                   kvm_queue_exception(vcpu, EXCCODE_INE, 0);
>>>> -       else
>>>> -               kvm_own_lsx(vcpu);
>>>> +       else {
>>>> +               vcpu->arch.fpu_load_type = KVM_LARCH_LSX;
>>>> +               kvm_make_request(KVM_REQ_FPU_LOAD, vcpu);
>>>> +       }
>>>>
>>>>           return RESUME_GUEST;
>>>>    }
>>>> @@ -812,8 +815,10 @@ static int kvm_handle_lasx_disabled(struct kvm_vcpu *vcpu, int ecode)
>>>>    {
>>>>           if (!kvm_guest_has_lasx(&vcpu->arch))
>>>>                   kvm_queue_exception(vcpu, EXCCODE_INE, 0);
>>>> -       else
>>>> -               kvm_own_lasx(vcpu);
>>>> +       else {
>>>> +               vcpu->arch.fpu_load_type = KVM_LARCH_LASX;
>>>> +               kvm_make_request(KVM_REQ_FPU_LOAD, vcpu);
>>>> +       }
>>>>
>>>>           return RESUME_GUEST;
>>>>    }
>>>> @@ -822,8 +827,10 @@ static int kvm_handle_lbt_disabled(struct kvm_vcpu *vcpu, int ecode)
>>>>    {
>>>>           if (!kvm_guest_has_lbt(&vcpu->arch))
>>>>                   kvm_queue_exception(vcpu, EXCCODE_INE, 0);
>>>> -       else
>>>> -               kvm_own_lbt(vcpu);
>>>> +       else {
>>>> +               vcpu->arch.fpu_load_type = KVM_LARCH_LBT;
>>>> +               kvm_make_request(KVM_REQ_FPU_LOAD, vcpu);
>>>> +       }
>>>>
>>>>           return RESUME_GUEST;
>>>>    }
>>>> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
>>>> index 995461d724b5..d05fe6c8f456 100644
>>>> --- a/arch/loongarch/kvm/vcpu.c
>>>> +++ b/arch/loongarch/kvm/vcpu.c
>>>> @@ -232,6 +232,31 @@ static void kvm_late_check_requests(struct kvm_vcpu *vcpu)
>>>>                           kvm_flush_tlb_gpa(vcpu, vcpu->arch.flush_gpa);
>>>>                           vcpu->arch.flush_gpa = INVALID_GPA;
>>>>                   }
>>>> +
>>>> +       if (kvm_check_request(KVM_REQ_FPU_LOAD, vcpu)) {
>>>> +               switch (vcpu->arch.fpu_load_type) {
>>>> +               case KVM_LARCH_FPU:
>>>> +                       kvm_own_fpu(vcpu);
>>>> +                       break;
>>>> +
>>>> +               case KVM_LARCH_LSX:
>>>> +                       kvm_own_lsx(vcpu);
>>>> +                       break;
>>>> +
>>>> +               case KVM_LARCH_LASX:
>>>> +                       kvm_own_lasx(vcpu);
>>>> +                       break;
>>>> +
>>>> +               case KVM_LARCH_LBT:
>>>> +                       kvm_own_lbt(vcpu);
>>>> +                       break;
>>>> +
>>>> +               default:
>>>> +                       break;
>>>> +               }
>>>> +
>>>> +               vcpu->arch.fpu_load_type = 0;
>>>> +       }
>>>>    }
>>>>
>>>>    /*
>>>> @@ -1286,13 +1311,11 @@ int kvm_arch_vcpu_ioctl_set_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
>>>>    #ifdef CONFIG_CPU_HAS_LBT
>>>>    int kvm_own_lbt(struct kvm_vcpu *vcpu)
>>>>    {
>>>> -       preempt_disable();
>>>>           if (!(vcpu->arch.aux_inuse & KVM_LARCH_LBT)) {
>>>>                   set_csr_euen(CSR_EUEN_LBTEN);
>>>>                   _restore_lbt(&vcpu->arch.lbt);
>>>>                   vcpu->arch.aux_inuse |= KVM_LARCH_LBT;
>>>>           }
>>>> -       preempt_enable();
>>>>
>>>>           return 0;
>>>>    }
>>>> @@ -1335,8 +1358,6 @@ static inline void kvm_check_fcsr_alive(struct kvm_vcpu *vcpu) { }
>>>>    /* Enable FPU and restore context */
>>>>    void kvm_own_fpu(struct kvm_vcpu *vcpu)
>>>>    {
>>>> -       preempt_disable();
>>>> -
>>>>           /*
>>>>            * Enable FPU for guest
>>>>            * Set FR and FRE according to guest context
>>>> @@ -1347,16 +1368,12 @@ void kvm_own_fpu(struct kvm_vcpu *vcpu)
>>>>           kvm_restore_fpu(&vcpu->arch.fpu);
>>>>           vcpu->arch.aux_inuse |= KVM_LARCH_FPU;
>>>>           trace_kvm_aux(vcpu, KVM_TRACE_AUX_RESTORE, KVM_TRACE_AUX_FPU);
>>>> -
>>>> -       preempt_enable();
>>>>    }
>>>>
>>>>    #ifdef CONFIG_CPU_HAS_LSX
>>>>    /* Enable LSX and restore context */
>>>>    int kvm_own_lsx(struct kvm_vcpu *vcpu)
>>>>    {
>>>> -       preempt_disable();
>>>> -
>>>>           /* Enable LSX for guest */
>>>>           kvm_check_fcsr(vcpu, vcpu->arch.fpu.fcsr);
>>>>           set_csr_euen(CSR_EUEN_LSXEN | CSR_EUEN_FPEN);
>>>> @@ -1378,7 +1395,6 @@ int kvm_own_lsx(struct kvm_vcpu *vcpu)
>>>>
>>>>           trace_kvm_aux(vcpu, KVM_TRACE_AUX_RESTORE, KVM_TRACE_AUX_LSX);
>>>>           vcpu->arch.aux_inuse |= KVM_LARCH_LSX | KVM_LARCH_FPU;
>>>> -       preempt_enable();
>>>>
>>>>           return 0;
>>>>    }
>>>> @@ -1388,8 +1404,6 @@ int kvm_own_lsx(struct kvm_vcpu *vcpu)
>>>>    /* Enable LASX and restore context */
>>>>    int kvm_own_lasx(struct kvm_vcpu *vcpu)
>>>>    {
>>>> -       preempt_disable();
>>>> -
>>>>           kvm_check_fcsr(vcpu, vcpu->arch.fpu.fcsr);
>>>>           set_csr_euen(CSR_EUEN_FPEN | CSR_EUEN_LSXEN | CSR_EUEN_LASXEN);
>>>>           switch (vcpu->arch.aux_inuse & (KVM_LARCH_FPU | KVM_LARCH_LSX)) {
>>>> @@ -1411,7 +1425,6 @@ int kvm_own_lasx(struct kvm_vcpu *vcpu)
>>>>
>>>>           trace_kvm_aux(vcpu, KVM_TRACE_AUX_RESTORE, KVM_TRACE_AUX_LASX);
>>>>           vcpu->arch.aux_inuse |= KVM_LARCH_LASX | KVM_LARCH_LSX | KVM_LARCH_FPU;
>>>> -       preempt_enable();
>>>>
>>>>           return 0;
>>>>    }
>>>> --
>>>> 2.39.3
>>>>
>>>>
>>
>>

