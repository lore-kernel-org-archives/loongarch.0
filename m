Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27613DD869
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798360; cv=none; b=Nt56OaeBQFKTvGcQTnS8RSOH0ONOdpFzUIXvegD2C0QJXQRoadZctwPbwMtGPBNNFMYd4feSO4BcXcodEnu5bgm6ZXx1O0q2dEoRwoJhyW0PvoFWFAlpkMDp7DM4FB/jbOIXCrRvLJcXy0XzoQnhqoLC+AXVrW+vsLNWSVzNpPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798360; c=relaxed/simple;
	bh=BLEKH2goSjFPae7TXgdDWhWOuyPOcvGkJQPO5CqO2fI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=S1/7htxpcXQ/s0tAxLr1YI2vY7txn4QvIaVI1ujzj1+IEmM6Ht/o6kf81VdES9AG2IPV8cEXEKtRnrOMmWrCwk0JECvLAJ2tb7gmn5Mj/LNpJNXzqLQ0gL+7E/ov2BVh3Dztl18rjraBU9gE9LC0Umk1la54DwsYD+fHmDyiAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Ax_ulTkRVqJWYNAA--.37754S3;
	Tue, 26 May 2026 20:25:55 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxGOBSkRVq4pORAA--.13422S3;
	Tue, 26 May 2026 20:25:54 +0800 (CST)
Subject: Re: [PATCH 2/4] LoongArch: KVM: Add PV TLB flush support via
 steal-time shared memory
To: Tao Cui <cuitao@kylinos.cn>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, loongarch@lists.linux.dev
Cc: kernel@xen0n.name
References: <20260526111837.2090768-1-cuitao@kylinos.cn>
 <20260526111837.2090768-3-cuitao@kylinos.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <0cb0ee14-39fb-8814-7230-788071486760@loongson.cn>
Date: Tue, 26 May 2026 20:22:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260526111837.2090768-3-cuitao@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOBSkRVq4pORAA--.13422S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxtrWxtryDWw1DAFy3trW5Arc_yoWxuw4kpF
	n2yFn5WF4xGr1fC3Z3t39F9rW5WF4xCr1Iga47urW3AF4agryDurnYkrWDAFyDX3W8XayI
	gF1Fv34DZF4DX3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8
	sqAUUUUU=



On 2026/5/26 下午7:18, Tao Cui wrote:
> Implement paravirtualized TLB flush for LoongArch KVM guests using the
> existing steal-time shared memory page, following the same design as x86.
> 
> The mechanism uses the preempted byte in struct kvm_steal_time with an
> additional KVM_VCPU_FLUSH_TLB flag bit:
> 
> - When a guest vCPU needs remote TLB flush but the target vCPU is
>    preempted (not running), it atomically sets KVM_VCPU_FLUSH_TLB in
>    the target's steal-time preempted byte instead of sending an IPI.
> - When the host re-enters the target vCPU (kvm_update_stolen_time()),
>    it reads and clears the preempted byte. If KVM_VCPU_FLUSH_TLB was
>    set, the host drops the vCPU's VPID, which triggers a full TLB
>    flush on the next VM entry via kvm_check_vpid().
> - For non-preempted vCPUs, the guest falls back to normal IPI-based
>    flush, avoiding unnecessary VM exits.
> 
> This significantly reduces TLB flush overhead in multi-vCPU workloads
> where target vCPUs are often idle/preempted.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>   arch/loongarch/include/asm/kvm_host.h      |  1 +
>   arch/loongarch/include/asm/kvm_para.h      |  1 +
>   arch/loongarch/include/uapi/asm/kvm.h      |  1 +
>   arch/loongarch/include/uapi/asm/kvm_para.h |  1 +
>   arch/loongarch/kvm/trace.h                 | 15 +++++++++++++++
>   arch/loongarch/kvm/vcpu.c                  | 15 ++++++++++++++-
>   arch/loongarch/kvm/vm.c                    |  3 +++
>   7 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
> index 903cb67ca817..a379868fb147 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -170,6 +170,7 @@ enum emulation_result {
>   #define LOONGARCH_PV_FEAT_MASK		(BIT(KVM_FEATURE_IPI) |		\
>   					 BIT(KVM_FEATURE_PREEMPT) |	\
>   					 BIT(KVM_FEATURE_STEAL_TIME) |	\
> +					 BIT(KVM_FEATURE_PV_TLB_FLUSH) |\
>   					 BIT(KVM_FEATURE_USER_HCALL) |	\
>   					 BIT(KVM_FEATURE_VIRT_EXTIOI))
>   
> diff --git a/arch/loongarch/include/asm/kvm_para.h b/arch/loongarch/include/asm/kvm_para.h
> index fb17ba0fa101..28e3fa3b4c0e 100644
> --- a/arch/loongarch/include/asm/kvm_para.h
> +++ b/arch/loongarch/include/asm/kvm_para.h
> @@ -41,6 +41,7 @@ struct kvm_steal_time {
>   	__u8  pad[47];
>   };
>   #define KVM_VCPU_PREEMPTED		(1 << 0)
> +#define KVM_VCPU_FLUSH_TLB		(1 << 1)
>   
>   /*
>    * Hypercall interface for KVM hypervisor
> diff --git a/arch/loongarch/include/uapi/asm/kvm.h b/arch/loongarch/include/uapi/asm/kvm.h
> index cd0b5c11ca9c..e4cd4bbf8914 100644
> --- a/arch/loongarch/include/uapi/asm/kvm.h
> +++ b/arch/loongarch/include/uapi/asm/kvm.h
> @@ -106,6 +106,7 @@ struct kvm_fpu {
>   #define  KVM_LOONGARCH_VM_FEAT_PTW		8
>   #define  KVM_LOONGARCH_VM_FEAT_MSGINT		9
>   #define  KVM_LOONGARCH_VM_FEAT_PV_PREEMPT	10
> +#define  KVM_LOONGARCH_VM_FEAT_PV_TLB_FLUSH	11
>   
>   /* Device Control API on vcpu fd */
>   #define KVM_LOONGARCH_VCPU_CPUCFG	0
> diff --git a/arch/loongarch/include/uapi/asm/kvm_para.h b/arch/loongarch/include/uapi/asm/kvm_para.h
> index d28cbcadd276..8872839251cc 100644
> --- a/arch/loongarch/include/uapi/asm/kvm_para.h
> +++ b/arch/loongarch/include/uapi/asm/kvm_para.h
> @@ -16,6 +16,7 @@
>   #define  KVM_FEATURE_IPI		1
>   #define  KVM_FEATURE_STEAL_TIME		2
>   #define  KVM_FEATURE_PREEMPT		3
> +#define  KVM_FEATURE_PV_TLB_FLUSH	4
>   /* BIT 24 - 31 are features configurable by user space vmm */
>   #define  KVM_FEATURE_VIRT_EXTIOI	24
>   #define  KVM_FEATURE_USER_HCALL		25
> diff --git a/arch/loongarch/kvm/trace.h b/arch/loongarch/kvm/trace.h
> index 3467ee22b704..8556954fa196 100644
> --- a/arch/loongarch/kvm/trace.h
> +++ b/arch/loongarch/kvm/trace.h
> @@ -210,6 +210,21 @@ TRACE_EVENT(kvm_vpid_change,
>   	    TP_printk("VPID: 0x%08lx", __entry->vpid)
>   );
>   
> +TRACE_EVENT(kvm_pv_tlb_flush,
> +	TP_PROTO(struct kvm_vcpu *vcpu, bool need_flush),
> +	TP_ARGS(vcpu, need_flush),
> +	TP_STRUCT__entry(
> +		__field(unsigned int, vcpu_id)
> +		__field(bool, need_flush)
> +	),
> +	TP_fast_assign(
> +		__entry->vcpu_id = vcpu->vcpu_id;
> +		__entry->need_flush = need_flush;
> +	),
> +	TP_printk("vcpu %u need_flush %u", __entry->vcpu_id,
> +		  __entry->need_flush)
> +);
> +
>   #endif /* _TRACE_KVM_H */
>   
>   #undef TRACE_INCLUDE_PATH
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index d82782b90457..7554ed3aa73c 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -173,7 +173,20 @@ static void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
>   	}
>   
Hi Tao,

The idea is wonderful, only that the memory order between LoongArch and 
X86 is different, there may be some potential issues on LoongArch.

>   	st = (struct kvm_steal_time __user *)ghc->hva;
> -	if (kvm_guest_has_pv_feature(vcpu, KVM_FEATURE_PREEMPT)) {
> +	if (kvm_guest_has_pv_feature(vcpu, KVM_FEATURE_PV_TLB_FLUSH)) {
> +		u8 preempted = 0;
> +
> +		unsafe_get_user(preempted, &st->preempted, out);
> +		unsafe_put_user(0, &st->preempted, out);
is it possible that unsafe_put_user() will go to out sentence and skip 
the following flush tlb? even if value of preempted is 
KVM_VCPU_FLUSH_TLB | KVM_VCPU_PREEMPTED.

On guest side, try_cmpxchg() atomic instruction is used, however here is 
non-atomic put_user instruction.

Regards
Bibo Mao
> +		vcpu->arch.st.preempted = 0;
> +
> +		if (preempted & KVM_VCPU_FLUSH_TLB) {
> +			vcpu->arch.vpid = 0;	/* Drop vpid to flush TLB */
> +			trace_kvm_pv_tlb_flush(vcpu, true);
> +		} else {
> +			trace_kvm_pv_tlb_flush(vcpu, false);
> +		}
> +	} else if (kvm_guest_has_pv_feature(vcpu, KVM_FEATURE_PREEMPT)) {
>   		unsafe_put_user(0, &st->preempted, out);
>   		vcpu->arch.st.preempted = 0;
>   	}
> diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
> index 8af874e0b36b..4be70e4f1279 100644
> --- a/arch/loongarch/kvm/vm.c
> +++ b/arch/loongarch/kvm/vm.c
> @@ -54,8 +54,10 @@ static void kvm_vm_init_features(struct kvm *kvm)
>   	if (kvm_pvtime_supported()) {
>   		kvm->arch.pv_features |= BIT(KVM_FEATURE_PREEMPT);
>   		kvm->arch.pv_features |= BIT(KVM_FEATURE_STEAL_TIME);
> +		kvm->arch.pv_features |= BIT(KVM_FEATURE_PV_TLB_FLUSH);
>   		kvm->arch.kvm_features |= BIT(KVM_LOONGARCH_VM_FEAT_PV_PREEMPT);
>   		kvm->arch.kvm_features |= BIT(KVM_LOONGARCH_VM_FEAT_PV_STEALTIME);
> +		kvm->arch.kvm_features |= BIT(KVM_LOONGARCH_VM_FEAT_PV_TLB_FLUSH);
>   	}
>   	kvm->arch.pv_auto_features = kvm->arch.pv_features;
>   }
> @@ -159,6 +161,7 @@ static int kvm_vm_feature_has_attr(struct kvm *kvm, struct kvm_device_attr *attr
>   	case KVM_LOONGARCH_VM_FEAT_PV_IPI:
>   	case KVM_LOONGARCH_VM_FEAT_PV_PREEMPT:
>   	case KVM_LOONGARCH_VM_FEAT_PV_STEALTIME:
> +	case KVM_LOONGARCH_VM_FEAT_PV_TLB_FLUSH:
>   		if (kvm_vm_support(&kvm->arch, attr->attr))
>   			return 0;
>   		return -ENXIO;
> 

