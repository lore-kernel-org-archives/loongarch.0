Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB403161B2
	for <loongarch@lists.linux.dev>; Wed, 28 Jan 2026 06:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769582158; cv=none; b=l0nPcnvBMlHoYOWdwpPEhUdLVg+1+n1tnvg0TQTOUvG1QGtfdtI+AJXuRzbVTlFh0NPw4Cxrao/ycTasuDB34feWPpsjDctuNR2d2YQy8Z4haO93fAf0TooS8hUSgT3NLMGaQAmkPQXvU2dBH19ZoTnavjN+32Bnh/veSoYbmJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769582158; c=relaxed/simple;
	bh=RrXNW5UTOEFIsw1/Cl2k7p3NWELzRSgNTEz4rJr9IdE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dNGh7dsBRm88R60eBOJyE7OR3cndmUKbALDaWqYoe2YJJi8EZtxNAekGzoEmkgGHAKXarl88dxPwdG3v/RMyzezlON4xYAF0CR15gp1Z9jOSg+7/RDZ1cAd/LbMuWc2S5XA9tC/L/aMQS2e1cSqgVdH/IHRlA1/L71iN9V2m7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxKMJGrnlpZm4NAA--.44029S3;
	Wed, 28 Jan 2026 14:35:50 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxysFErnlperI2AA--.37939S3;
	Wed, 28 Jan 2026 14:35:50 +0800 (CST)
Subject: Re: [PATCH v2 3/3] LoongArch: KVM: Add FPU delay load support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20260127125124.3234252-1-maobibo@loongson.cn>
 <20260127125124.3234252-4-maobibo@loongson.cn>
 <CAAhV-H69F2T-PbewFqch5Sp+xhBP9Lsy74C6yVhp90r4GSYEsQ@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <67db8a93-eb62-7278-ae3f-a46a62365b20@loongson.cn>
Date: Wed, 28 Jan 2026 14:33:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H69F2T-PbewFqch5Sp+xhBP9Lsy74C6yVhp90r4GSYEsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxysFErnlperI2AA--.37939S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxtr1xWrWrZr1xXr1UGFyfAFc_yoW7tw47pF
	s7ZFsYva1rWr1Sk34Iqrn0gr12vrWkKr1xWry2gay5Gr1qqryrGr4kKrZ09Fy5Zw1rAa1I
	vF1FqFnxuay8J3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-
	UUUUU



On 2026/1/28 下午12:05, Huacai Chen wrote:
> Hi, Bibo,
> 
> On Tue, Jan 27, 2026 at 8:51 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> FPU is lazy enabled with KVM hypervisor. After FPU is enabled and
>> loaded, vCPU can be preempted and FPU will be lost again. Here FPU
>> is delay load until guest enter entry.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/kvm_host.h |  2 ++
>>   arch/loongarch/kvm/exit.c             | 15 ++++++++----
>>   arch/loongarch/kvm/vcpu.c             | 33 +++++++++++++++++----------
>>   3 files changed, 33 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
>> index e4fe5b8e8149..902ff7bc0e35 100644
>> --- a/arch/loongarch/include/asm/kvm_host.h
>> +++ b/arch/loongarch/include/asm/kvm_host.h
>> @@ -37,6 +37,7 @@
>>   #define KVM_REQ_TLB_FLUSH_GPA          KVM_ARCH_REQ(0)
>>   #define KVM_REQ_STEAL_UPDATE           KVM_ARCH_REQ(1)
>>   #define KVM_REQ_PMU                    KVM_ARCH_REQ(2)
>> +#define KVM_REQ_FPU_LOAD               KVM_ARCH_REQ(3)
>>
>>   #define KVM_GUESTDBG_SW_BP_MASK                \
>>          (KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP)
>> @@ -234,6 +235,7 @@ struct kvm_vcpu_arch {
>>          u64 vpid;
>>          gpa_t flush_gpa;
>>
>> +       int fpu_load_type;
> I think the logic of V1 is better, it doesn't increase the size of
> kvm_vcpu_arch, and the constant checking is a little faster than
> variable checking.
The main reason is that FPU_LOAD request is not so frequent, there is 
atomic instruction in kvm_check_request() and the unconditional 
kvm_check_request() may be unnecessary, also there will LBT LOAD check 
in later version.

So I think one unconditional atomic test_and_clear may be better than 
three/four atomic test_and_clear.
     kvm_check_request(KVM_REQ_FPU_LOAD,vcpu)
     kvm_check_request(KVM_REQ_FPU_LSX, vcpu)
     kvm_check_request(KVM_REQ_FPU_LASX, vcpu)

Actually different people have different view about this :)

Regards
Bibo Mao
> 
> Huacai
> 
>>          /* Frequency of stable timer in Hz */
>>          u64 timer_mhz;
>>          ktime_t expire;
>> diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
>> index 74b427287e96..b6f08df8fedb 100644
>> --- a/arch/loongarch/kvm/exit.c
>> +++ b/arch/loongarch/kvm/exit.c
>> @@ -754,7 +754,8 @@ static int kvm_handle_fpu_disabled(struct kvm_vcpu *vcpu, int ecode)
>>                  return RESUME_HOST;
>>          }
>>
>> -       kvm_own_fpu(vcpu);
>> +       vcpu->arch.fpu_load_type = KVM_LARCH_FPU;
>> +       kvm_make_request(KVM_REQ_FPU_LOAD, vcpu);
>>
>>          return RESUME_GUEST;
>>   }
>> @@ -794,8 +795,10 @@ static int kvm_handle_lsx_disabled(struct kvm_vcpu *vcpu, int ecode)
>>   {
>>          if (!kvm_guest_has_lsx(&vcpu->arch))
>>                  kvm_queue_exception(vcpu, EXCCODE_INE, 0);
>> -       else
>> -               kvm_own_lsx(vcpu);
>> +       else {
>> +               vcpu->arch.fpu_load_type = KVM_LARCH_LSX;
>> +               kvm_make_request(KVM_REQ_FPU_LOAD, vcpu);
>> +       }
>>
>>          return RESUME_GUEST;
>>   }
>> @@ -812,8 +815,10 @@ static int kvm_handle_lasx_disabled(struct kvm_vcpu *vcpu, int ecode)
>>   {
>>          if (!kvm_guest_has_lasx(&vcpu->arch))
>>                  kvm_queue_exception(vcpu, EXCCODE_INE, 0);
>> -       else
>> -               kvm_own_lasx(vcpu);
>> +       else {
>> +               vcpu->arch.fpu_load_type = KVM_LARCH_LASX;
>> +               kvm_make_request(KVM_REQ_FPU_LOAD, vcpu);
>> +       }
>>
>>          return RESUME_GUEST;
>>   }
>> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
>> index d91a1160a309..3e749e9738b2 100644
>> --- a/arch/loongarch/kvm/vcpu.c
>> +++ b/arch/loongarch/kvm/vcpu.c
>> @@ -232,6 +232,27 @@ static void kvm_late_check_requests(struct kvm_vcpu *vcpu)
>>                          kvm_flush_tlb_gpa(vcpu, vcpu->arch.flush_gpa);
>>                          vcpu->arch.flush_gpa = INVALID_GPA;
>>                  }
>> +
>> +       if (kvm_check_request(KVM_REQ_FPU_LOAD, vcpu)) {
>> +               switch (vcpu->arch.fpu_load_type) {
>> +               case KVM_LARCH_FPU:
>> +                       kvm_own_fpu(vcpu);
>> +                       break;
>> +
>> +               case KVM_LARCH_LSX:
>> +                       kvm_own_lsx(vcpu);
>> +                       break;
>> +
>> +               case KVM_LARCH_LASX:
>> +                       kvm_own_lasx(vcpu);
>> +                       break;
>> +
>> +               default:
>> +                       break;
>> +               }
>> +
>> +               vcpu->arch.fpu_load_type = 0;
>> +       }
>>   }
>>
>>   /*
>> @@ -1338,8 +1359,6 @@ static inline void kvm_check_fcsr_alive(struct kvm_vcpu *vcpu) { }
>>   /* Enable FPU and restore context */
>>   void kvm_own_fpu(struct kvm_vcpu *vcpu)
>>   {
>> -       preempt_disable();
>> -
>>          /*
>>           * Enable FPU for guest
>>           * Set FR and FRE according to guest context
>> @@ -1350,16 +1369,12 @@ void kvm_own_fpu(struct kvm_vcpu *vcpu)
>>          kvm_restore_fpu(&vcpu->arch.fpu);
>>          vcpu->arch.aux_inuse |= KVM_LARCH_FPU;
>>          trace_kvm_aux(vcpu, KVM_TRACE_AUX_RESTORE, KVM_TRACE_AUX_FPU);
>> -
>> -       preempt_enable();
>>   }
>>
>>   #ifdef CONFIG_CPU_HAS_LSX
>>   /* Enable LSX and restore context */
>>   int kvm_own_lsx(struct kvm_vcpu *vcpu)
>>   {
>> -       preempt_disable();
>> -
>>          /* Enable LSX for guest */
>>          kvm_check_fcsr(vcpu, vcpu->arch.fpu.fcsr);
>>          set_csr_euen(CSR_EUEN_LSXEN | CSR_EUEN_FPEN);
>> @@ -1381,8 +1396,6 @@ int kvm_own_lsx(struct kvm_vcpu *vcpu)
>>
>>          trace_kvm_aux(vcpu, KVM_TRACE_AUX_RESTORE, KVM_TRACE_AUX_LSX);
>>          vcpu->arch.aux_inuse |= KVM_LARCH_LSX | KVM_LARCH_FPU;
>> -       preempt_enable();
>> -
>>          return 0;
>>   }
>>   #endif
>> @@ -1391,8 +1404,6 @@ int kvm_own_lsx(struct kvm_vcpu *vcpu)
>>   /* Enable LASX and restore context */
>>   int kvm_own_lasx(struct kvm_vcpu *vcpu)
>>   {
>> -       preempt_disable();
>> -
>>          kvm_check_fcsr(vcpu, vcpu->arch.fpu.fcsr);
>>          set_csr_euen(CSR_EUEN_FPEN | CSR_EUEN_LSXEN | CSR_EUEN_LASXEN);
>>          switch (vcpu->arch.aux_inuse & (KVM_LARCH_FPU | KVM_LARCH_LSX)) {
>> @@ -1414,8 +1425,6 @@ int kvm_own_lasx(struct kvm_vcpu *vcpu)
>>
>>          trace_kvm_aux(vcpu, KVM_TRACE_AUX_RESTORE, KVM_TRACE_AUX_LASX);
>>          vcpu->arch.aux_inuse |= KVM_LARCH_LASX | KVM_LARCH_LSX | KVM_LARCH_FPU;
>> -       preempt_enable();
>> -
>>          return 0;
>>   }
>>   #endif
>> --
>> 2.39.3
>>
>>

