Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC5D4F5FD
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908535; cv=none; b=hwVYFDFj6umELdfWVcuyMc7OfACRAuD2FjKFd1mLBjQjIcBFTZg7vSXO7TxrB1Vad2z37Sc5KQgwVRmETDJ5kfWHXdhPiK8W9/1T2JLxPKYPBiUvuy2MvTosVOgiVuArK5Rx88hJlrL7pk87bNsw71jtkuLVZxd4KvGbvMJxpHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908535; c=relaxed/simple;
	bh=WiBKvWDWXcc3F57ym1KckrbUhulBgUCOIkVzBugvbB0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WW5TWqkBsSrTSiSN2SrQy5zA8YBIqKwV1oTmzGtautRGGBKZKcKEizRqxHp0ItxIiBXXpUDXl8cvPeyFsVcLCWxico7KZ9Bm57psGXWKYAjmpKWy7ea4aT3bpIW7qDMXIG8lSZDr26Fcf8cDqVXvzjsWb+tddWDaKZ1A6SBj+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8CxWOjw6BhmRUkmAA--.2444S3;
	Fri, 12 Apr 2024 15:55:29 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxDBPt6BhmGZN4AA--.34874S3;
	Fri, 12 Apr 2024 15:55:27 +0800 (CST)
Subject: Re: [PATCH 1/1] LoongArch: KVM: Add PMU support
To: Song Gao <gaosong@loongson.cn>, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, zhaotianrui@loongson.cn, chenhuacai@kernel.org,
 kernel@xen0n.name, loongarch@lists.linux.dev
References: <20240410095812.2943706-1-gaosong@loongson.cn>
From: maobibo <maobibo@loongson.cn>
Message-ID: <b0a23cbf-28ef-990d-86b4-f5a305b01f15@loongson.cn>
Date: Fri, 12 Apr 2024 15:55:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240410095812.2943706-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxDBPt6BhmGZN4AA--.34874S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Kw4DGrWUXF1fuF18Gr1rGrX_yoWkXF18pF
	WDCws7WrW8KF17G3WDtwnF9r43Wrs3Kw4agry7trWSyF1jqry5Xr4kKrWDXFyrZ34rtF1S
	9Fn0k3Z5ZF4vywbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjWlkUUUUU=



On 2024/4/10 下午5:58, Song Gao wrote:
> This patch adds KVM PMU support. We save/restore the host PMU CSR
> values to kvm_context. guest entry saves the host PMU CSR and
> guest exit restores the host PMU CSR when the host supports PMU
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   arch/loongarch/include/asm/kvm_csr.h   |   5 +
>   arch/loongarch/include/asm/kvm_host.h  |  14 +++
>   arch/loongarch/include/asm/kvm_vcpu.h  |   2 +
>   arch/loongarch/include/asm/loongarch.h |   1 +
>   arch/loongarch/kvm/exit.c              |   7 ++
>   arch/loongarch/kvm/vcpu.c              | 140 ++++++++++++++++++++++++-
>   6 files changed, 167 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/kvm_csr.h b/arch/loongarch/include/asm/kvm_csr.h
> index 724ca8b7b401..dce556516c79 100644
> --- a/arch/loongarch/include/asm/kvm_csr.h
> +++ b/arch/loongarch/include/asm/kvm_csr.h
> @@ -208,4 +208,9 @@ static __always_inline void kvm_change_sw_gcsr(struct loongarch_csrs *csr,
>   	csr->csrs[gid] |= val & _mask;
>   }
>   
> +#define KVM_PMU_PLV_ENABLE	(CSR_PERFCTRL_PLV0 |		\
> +					CSR_PERFCTRL_PLV1 |	\
> +					CSR_PERFCTRL_PLV2 |	\
> +					CSR_PERFCTRL_PLV3)
> +
>   #endif	/* __ASM_LOONGARCH_KVM_CSR_H__ */
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
> index 2d62f7b0d377..0daa0bde7742 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -54,6 +54,9 @@ struct kvm_arch_memory_slot {
>   struct kvm_context {
>   	unsigned long vpid_cache;
>   	struct kvm_vcpu *last_vcpu;
> +	/* Save host pmu csr */
> +	u64 perf_ctrl[4];
> +	u64 perf_cntr[4];
>   };
>   
>   struct kvm_world_switch {
> @@ -99,6 +102,7 @@ enum emulation_result {
>   #define KVM_LARCH_LASX		(0x1 << 2)
>   #define KVM_LARCH_SWCSR_LATEST	(0x1 << 3)
>   #define KVM_LARCH_HWCSR_USABLE	(0x1 << 4)
> +#define KVM_LARCH_PERF		(0x1 << 5)
>   
>   struct kvm_vcpu_arch {
>   	/*
> @@ -195,6 +199,16 @@ static inline bool kvm_guest_has_lasx(struct kvm_vcpu_arch *arch)
>   	return arch->cpucfg[2] & CPUCFG2_LASX;
>   }
>   
> +static inline bool kvm_guest_has_pmu(struct kvm_vcpu_arch *arch)
> +{
> +	return arch->cpucfg[6] & CPUCFG6_PMP;
> +}
> +
> +static inline int kvm_get_pmu_num(struct kvm_vcpu_arch *arch)
> +{
> +	return (arch->cpucfg[6] & CPUCFG6_PMNUM) >> CPUCFG6_PMNUM_SHIFT;
> +}
> +
>   /* Debug: dump vcpu state */
>   int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu);
>   
> diff --git a/arch/loongarch/include/asm/kvm_vcpu.h b/arch/loongarch/include/asm/kvm_vcpu.h
> index 0cb4fdb8a9b5..7212428022d1 100644
> --- a/arch/loongarch/include/asm/kvm_vcpu.h
> +++ b/arch/loongarch/include/asm/kvm_vcpu.h
> @@ -75,6 +75,8 @@ static inline void kvm_save_lasx(struct loongarch_fpu *fpu) { }
>   static inline void kvm_restore_lasx(struct loongarch_fpu *fpu) { }
>   #endif
>   
> +int kvm_own_pmu(struct kvm_vcpu *vcpu);
> +
>   void kvm_init_timer(struct kvm_vcpu *vcpu, unsigned long hz);
>   void kvm_reset_timer(struct kvm_vcpu *vcpu);
>   void kvm_save_timer(struct kvm_vcpu *vcpu);
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
> index 46366e783c84..644380b6ebec 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -119,6 +119,7 @@
>   #define  CPUCFG6_PMP			BIT(0)
>   #define  CPUCFG6_PAMVER			GENMASK(3, 1)
>   #define  CPUCFG6_PMNUM			GENMASK(7, 4)
> +#define  CPUCFG6_PMNUM_SHIFT		4
>   #define  CPUCFG6_PMBITS			GENMASK(13, 8)
>   #define  CPUCFG6_UPM			BIT(14)
>   
> diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
> index ed1d89d53e2e..ab17d9eb711f 100644
> --- a/arch/loongarch/kvm/exit.c
> +++ b/arch/loongarch/kvm/exit.c
> @@ -83,6 +83,13 @@ static int kvm_handle_csr(struct kvm_vcpu *vcpu, larch_inst inst)
>   	rj = inst.reg2csr_format.rj;
>   	csrid = inst.reg2csr_format.csr;
>   
> +	if (LOONGARCH_CSR_PERFCTRL0 <= csrid && csrid <= LOONGARCH_CSR_PERFCNTR3) {
> +		if(!kvm_own_pmu(vcpu)) {
> +			vcpu->arch.pc -= 4;
> +			return EMULATE_DONE;
> +		}
> +	}
> +
>   	/* Process CSR ops */
>   	switch (rj) {
>   	case 0: /* process csrrd */
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 3a8779065f73..6fb59b805807 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -333,6 +333,12 @@ static int _kvm_get_cpucfg_mask(int id, u64 *v)
>   	case LOONGARCH_CPUCFG5:
>   		*v = GENMASK(31, 0);
>   		return 0;
> +	case LOONGARCH_CPUCFG6:
> +		if (cpu_has_pmp)
> +			*v = GENMASK(14, 0);
> +		else
> +			*v = 0;
> +		return 0;
>   	case LOONGARCH_CPUCFG16:
>   		*v = GENMASK(16, 0);
>   		return 0;
> @@ -351,7 +357,7 @@ static int _kvm_get_cpucfg_mask(int id, u64 *v)
>   
>   static int kvm_check_cpucfg(int id, u64 val)
>   {
> -	int ret;
> +	int ret, host;
>   	u64 mask = 0;
>   
>   	ret = _kvm_get_cpucfg_mask(id, &mask);
> @@ -377,6 +383,18 @@ static int kvm_check_cpucfg(int id, u64 val)
>   			/* LASX architecturally implies LSX and FP but val does not satisfy that */
>   			return -EINVAL;
>   		return 0;
> +	case LOONGARCH_CPUCFG6:
> +		if (val & CPUCFG6_PMP) {
> +			host = read_cpucfg(LOONGARCH_CPUCFG6);
> +			if ((val & CPUCFG6_PMBITS) != (host & CPUCFG6_PMBITS))
> +				/* Guest pmbits must be the same with host */
> +				return -EINVAL;
> +			if ((val & CPUCFG6_PMNUM) > (host & CPUCFG6_PMNUM))
> +				return -EINVAL;
> +			if ((val & CPUCFG6_UPM) && !(host & CPUCFG6_UPM))
> +				return -EINVAL;
> +		}
> +		return 0;
>   	default:
>   		/*
>   		 * Values for the other CPUCFG IDs are not being further validated
> @@ -552,7 +570,8 @@ static int kvm_loongarch_cpucfg_has_attr(struct kvm_vcpu *vcpu,
>   					 struct kvm_device_attr *attr)
>   {
>   	switch (attr->attr) {
> -	case 2:
> +	case LOONGARCH_CPUCFG2:
> +	case LOONGARCH_CPUCFG6:
>   		return 0;
>   	default:
>   		return -ENXIO;
> @@ -844,6 +863,119 @@ void kvm_lose_fpu(struct kvm_vcpu *vcpu)
>   	preempt_enable();
>   }
>   
> +static inline void kvm_save_host_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_context *context;
> +
> +	context = this_cpu_ptr(vcpu->kvm->arch.vmcs);
> +	context->perf_ctrl[0] = read_csr_perfctrl0();
> +	context->perf_cntr[0] = read_csr_perfcntr0();
> +	context->perf_ctrl[1] = read_csr_perfctrl1();
> +	context->perf_cntr[1] = read_csr_perfcntr1();
> +	context->perf_ctrl[2] = read_csr_perfctrl2();
> +	context->perf_cntr[2] = read_csr_perfcntr2();
> +	context->perf_ctrl[3] = read_csr_perfctrl3();
> +	context->perf_cntr[3] = read_csr_perfcntr3();
> +}
> +
> +static inline void kvm_restore_host_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_context *context;
> +
> +	context = this_cpu_ptr(vcpu->kvm->arch.vmcs);
> +	write_csr_perfctrl0(context->perf_ctrl[0]);
> +	write_csr_perfcntr0(context->perf_cntr[0]);
> +	write_csr_perfctrl1(context->perf_ctrl[1]);
> +	write_csr_perfcntr1(context->perf_cntr[1]);
> +	write_csr_perfctrl2(context->perf_ctrl[2]);
> +	write_csr_perfcntr2(context->perf_cntr[2]);
> +	write_csr_perfctrl3(context->perf_ctrl[3]);
> +	write_csr_perfcntr3(context->perf_cntr[3]);
> +}
> +
> +static inline void kvm_save_guest_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct loongarch_csrs *csr = vcpu->arch.csr;
> +
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL0);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR0);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL1);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR1);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL2);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR2);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL3);
> +	kvm_save_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR3);
> +	kvm_write_hw_gcsr(LOONGARCH_CSR_PERFCTRL0, 0);
> +	kvm_write_hw_gcsr(LOONGARCH_CSR_PERFCTRL1, 0);
> +	kvm_write_hw_gcsr(LOONGARCH_CSR_PERFCTRL2, 0);
> +	kvm_write_hw_gcsr(LOONGARCH_CSR_PERFCTRL3, 0);
> +}
> +
> +static inline void kvm_restore_guest_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct loongarch_csrs *csr = vcpu->arch.csr;
> +
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL0);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR0);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL1);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR1);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL2);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR2);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCTRL3);
> +	kvm_restore_hw_gcsr(csr, LOONGARCH_CSR_PERFCNTR3);
> +}
> +
> +static void _kvm_own_pmu(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long val;
> +
> +	kvm_save_host_pmu(vcpu);
> +	/* Set PM0-PM(num) to Guest */
> +	val = read_csr_gcfg() & ~CSR_GCFG_GPERF;
> +	val |= (kvm_get_pmu_num(&vcpu->arch) + 1) << CSR_GCFG_GPERF_SHIFT;
> +	write_csr_gcfg(val);
> +	kvm_restore_guest_pmu(vcpu);
> +}
> +
> +int kvm_own_pmu(struct kvm_vcpu *vcpu)
> +{
> +	if (!kvm_guest_has_pmu(&vcpu->arch))
> +		return -EINVAL;
> +
> +	preempt_disable();
> +	_kvm_own_pmu(vcpu);
> +	vcpu->arch.aux_inuse |= KVM_LARCH_PERF;
> +	preempt_enable();
Disable preemption is not safe enough, maybe there will be host pmu 
interrupt happened where host pmu registers are modified in pmu 
interrupt handler. It will be better if KVM_REQ_PMU is added, host pmu 
register is saved just before entering guest. Like this:
   kvm_make_request(KVM_REQ_PMU, vcpu);

And check pmu request in function kvm_pre_enter_guest() with irq disabled.

Regards
Bibo Mao

> +	return 0;
> +}
> +
> +static void kvm_lose_pmu(struct kvm_vcpu *vcpu)
> +{
> +	struct loongarch_csrs *csr = vcpu->arch.csr;
> +
> +	if (!(vcpu->arch.aux_inuse & KVM_LARCH_PERF))
> +		return;
> +
> +	kvm_save_guest_pmu(vcpu);
> +	/* Disable pmu access from guest */
> +	write_csr_gcfg(read_csr_gcfg() & ~CSR_GCFG_GPERF);
> +	if (((kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL0) |
> +		kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL1) |
> +		kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL2) |
> +		kvm_read_sw_gcsr(csr, LOONGARCH_CSR_PERFCTRL3))
> +			& KVM_PMU_PLV_ENABLE) == 0)
> +		vcpu->arch.aux_inuse &= ~KVM_LARCH_PERF;
> +	kvm_restore_host_pmu(vcpu);
> +}
> +
> +static void kvm_restore_pmu(struct kvm_vcpu *vcpu)
> +{
> +	if (!(vcpu->arch.aux_inuse & KVM_LARCH_PERF))
> +		return;
> +
> +	_kvm_own_pmu(vcpu);
> +}
> +
>   int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
>   {
>   	int intr = (int)irq->irq;
> @@ -982,6 +1114,9 @@ static int _kvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   	/* Control guest page CCA attribute */
>   	change_csr_gcfg(CSR_GCFG_MATC_MASK, CSR_GCFG_MATC_ROOT);
>   
> +	/* Restore hardware perf csr */
> +	kvm_restore_pmu(vcpu);
> +
>   	/* Don't bother restoring registers multiple times unless necessary */
>   	if (vcpu->arch.aux_inuse & KVM_LARCH_HWCSR_USABLE)
>   		return 0;
> @@ -1065,6 +1200,7 @@ static int _kvm_vcpu_put(struct kvm_vcpu *vcpu, int cpu)
>   	struct loongarch_csrs *csr = vcpu->arch.csr;
>   
>   	kvm_lose_fpu(vcpu);
> +	kvm_lose_pmu(vcpu);
>   
>   	/*
>   	 * Update CSR state from hardware if software CSR state is stale,
> 

