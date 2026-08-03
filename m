Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927322E8E09
	for <loongarch@lists.linux.dev>; Mon,  3 Aug 2026 01:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785720258; cv=none; b=MbTZyhl+ifgw149LzLI7XOoTN61Cb3OUQrzMg3ySNc0uxs1BaCc3Y8uhXHNi9vFLW+xskkPyyA5yTFPp9VFYl9//4bo1FWDkOu50fttqla0u1jTahZ0Nf2NXKKo9QPTIkSOpNCoZJsW5/lzD4coGoUS19TqdaeKogCVkMvWrQF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785720258; c=relaxed/simple;
	bh=uKohA31mNOMvFx55waig9Ph8EQlvfvJOnCoKA6jkUGQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dSs6Z5WVUi9yv/+9nTFd5mw263XvDKaJCe0QTrHnwNLTES5z0hicUUebKG/G8QEu9AeuYLcg3hN898DC4QWIE/yR9RI8h0wpI80xdJjOPu7H4D/zR42xS3uMHOXo2rfZauMrGENy759j18HErVGdEVCKnUuYzcmrhndh0J1Gar4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxXZu57W9qGsQJAA--.9145S3;
	Mon, 03 Aug 2026 09:24:09 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxPse47W9qU5QhAA--.54519S2;
	Mon, 03 Aug 2026 09:24:08 +0800 (CST)
Subject: Re: [PATCH 4/6] LoongArch: KVM: implement vmid updating logic
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, WANG Xuerui <kernel@xen0n.name>,
 Arnd Bergmann <arnd@arndb.de>, Xi Ruoyao <xry111@xry111.site>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260727072109.2151675-1-maobibo@loongson.cn>
 <20260727072109.2151675-5-maobibo@loongson.cn>
 <CAAhV-H5uF_hzKGZZbXzj5t6TFPefDVn09F0VM-AuNiDjoJZzCQ@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <b4689c17-e900-468b-eb08-6fb199c14a63@loongson.cn>
Date: Mon, 3 Aug 2026 09:23:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5uF_hzKGZZbXzj5t6TFPefDVn09F0VM-AuNiDjoJZzCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxPse47W9qU5QhAA--.54519S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxur4ktFykury3Gw1fWr13Jrc_yoW5KF4UpF
	y093Z8Ja18Gr13A3s0vw1q9FnYg3ykKr1293ZxtayYyr1qvr1DGrWkG398uFy8J34rGF4I
	vF15tF13ZF4UK3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU



On 2026/8/2 下午10:13, Huacai Chen wrote:
> Hi, BIbo,
> 
> On Mon, Jul 27, 2026 at 3:30 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> For every physical CPU, there is one vmid calculation method. For
>> vCPUs on the same VM, vmid is the same. However for vCPUs on
>> different VM, vmid is different. When vCPU is scheduled on the
>> physical CPU, it checked vmid of this VM and the global cached
>> vmid, and judge whether it is valid or not.
> I think Patch#2/3/4 can be folded into one.
will merge patch 2/3/4 together.

Regards
Bibo Mao
> 
> 
> Huacai
> 
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/kvm_host.h |  2 ++
>>   arch/loongarch/kvm/main.c             | 42 ++++++++++++++++++++++++++-
>>   2 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
>> index e93307cbe740..a01623c42c7a 100644
>> --- a/arch/loongarch/include/asm/kvm_host.h
>> +++ b/arch/loongarch/include/asm/kvm_host.h
>> @@ -79,6 +79,7 @@ struct kvm_arch_memory_slot {
>>   #define HOST_MAX_PMNUM                 16
>>   struct kvm_context {
>>          unsigned long vpid_cache;
>> +       unsigned long vmid_cache;
>>          struct kvm_vcpu *last_vcpu;
>>          /* Host PMU CSR */
>>          u64 perf_ctrl[HOST_MAX_PMNUM];
>> @@ -132,6 +133,7 @@ struct kvm_arch {
>>          unsigned long kvm_features;
>>
>>          s64 time_offset;
>> +       unsigned long vmid[NR_CPUS];
>>          struct kvm_context __percpu *vmcs;
>>          struct loongarch_ipi *ipi;
>>          struct loongarch_dmsintc *dmsintc;
>> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
>> index 3df46e02594f..7b3661da8958 100644
>> --- a/arch/loongarch/kvm/main.c
>> +++ b/arch/loongarch/kvm/main.c
>> @@ -281,9 +281,33 @@ static void kvm_check_vcpuid(struct kvm_vcpu *vcpu)
>>          }
>>   }
>>
>> -static void kvm_check_vmid(struct kvm_vcpu *vcpu)
>> +static void kvm_update_vmid(struct kvm_vcpu *vcpu, int cpu)
>>   {
>>          unsigned long vmid;
>> +       struct kvm_context *context;
>> +
>> +       context = per_cpu_ptr(vcpu->kvm->arch.vmcs, cpu);
>> +       vmid = context->vmid_cache + 1;
>> +       if (!(vmid & vpid_mask)) {
>> +               /* finish round of vmid loop */
>> +               if (unlikely(!vmid))
>> +                       vmid = vpid_mask + 1;
>> +
>> +               ++vmid; /* vmid 0 reserved for root */
>> +
>> +               /* start new vmid cycle */
>> +               kvm_flush_tlb_all_stage2();
>> +       }
>> +
>> +       context->vmid_cache = vmid;
>> +       vcpu->kvm->arch.vmid[cpu] = vmid;
>> +}
>> +
>> +static void kvm_check_vmid(struct kvm_vcpu *vcpu)
>> +{
>> +       int cpu;
>> +       unsigned long ver, old, vmid;
>> +       struct kvm_context *context;
>>
>>          /* On some machines like 3A5000, vmid needs the same with vpid */
>>          if (!cpu_has_guestid) {
>> @@ -295,6 +319,21 @@ static void kvm_check_vmid(struct kvm_vcpu *vcpu)
>>
>>                  return;
>>          }
>> +
>> +       cpu = smp_processor_id();
>> +       context = per_cpu_ptr(vcpu->kvm->arch.vmcs, cpu);
>> +
>> +       /*
>> +        * Check if our vmid is of an older version
>> +        */
>> +       ver = vcpu->kvm->arch.vmid[cpu] & ~vpid_mask;
>> +       old = context->vmid_cache & ~vpid_mask;
>> +       if (ver != old) {
>> +               kvm_update_vmid(vcpu, cpu);
>> +               kvm_clear_request(KVM_REQ_TLB_FLUSH_GPA, vcpu);
>> +       }
>> +
>> +       vcpu->arch.vmid = vcpu->kvm->arch.vmid[cpu] & vpid_mask;
>>   }
>>
>>   void kvm_check_vpid(struct kvm_vcpu *vcpu)
>> @@ -400,6 +439,7 @@ static int kvm_loongarch_env_init(void)
>>          for_each_possible_cpu(cpu) {
>>                  context = per_cpu_ptr(vmcs, cpu);
>>                  context->vpid_cache = vpid_mask + 1;
>> +               context->vmid_cache = vpid_mask + 1;
>>                  context->last_vcpu = NULL;
>>          }
>>
>> --
>> 2.39.3
>>

