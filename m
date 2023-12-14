Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DED4A3E
	for <loongarch@lists.linux.dev>; Thu, 14 Dec 2023 03:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8CxO+l8fHplz+kAAA--.5341S3;
	Thu, 14 Dec 2023 11:54:37 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxCHN3fHplUZcDAA--.5147S3;
	Thu, 14 Dec 2023 11:54:33 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Optimization for memslot hugepage
 checking
From: maobibo <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231127014410.4122997-1-maobibo@loongson.cn>
Message-ID: <b75280ca-433b-22da-63df-6917c1147c4f@loongson.cn>
Date: Thu, 14 Dec 2023 11:54:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231127014410.4122997-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxCHN3fHplUZcDAA--.5147S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3WFW5tF43XrWDZr47uF47WrX_yoW3WFWrpF
	43ArnxCrW5Jr13ursrtw1Duw1UZw4kGw12ka47t34rZFn0yF15Ga1kA3y8AFW5JrykAF42
	qFWYyF4Uu3yDt3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2L05UUUUU

slightly ping.... :)

On 2023/11/27 上午9:44, Bibo Mao wrote:
> During shadow mmu page fault, there is checking for huge page for
> specified memslot. Page fault is hot path, check logic can be done
> when memslot is created. Here two flags are added for huge page
> checking, KVM_MEM_HUGEPAGE_CAPABLE and KVM_MEM_HUGEPAGE_INCAPABLE.
> Instead for optimization qemu, memslot for dram is always huge page
> aligned. The flag is firstly checked during hot page fault path.
> 
> Now only huge page flag is supported, there is a long way for super
> page support in LoongArch system. Since super page size is 64G for
> 16K pagesize and 1G for 4K pagesize, 64G physical address is rarely
> used and LoongArch kernel needs support super page for 4K. Also memory
> layout of LoongArch qemu VM should be 1G aligned.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>   arch/loongarch/include/asm/kvm_host.h |   3 +
>   arch/loongarch/kvm/mmu.c              | 127 +++++++++++++++++---------
>   2 files changed, 89 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
> index 11328700d4fa..0e89db020481 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -45,7 +45,10 @@ struct kvm_vcpu_stat {
>   	u64 signal_exits;
>   };
>   
> +#define KVM_MEM_HUGEPAGE_CAPABLE	(1UL << 0)
> +#define KVM_MEM_HUGEPAGE_INCAPABLE	(1UL << 1)
>   struct kvm_arch_memory_slot {
> +	unsigned long flags;
>   };
>   
>   struct kvm_context {
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index 80480df5f550..6845733f37dc 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -13,6 +13,16 @@
>   #include <asm/tlb.h>
>   #include <asm/kvm_mmu.h>
>   
> +static inline bool kvm_hugepage_capable(struct kvm_memory_slot *slot)
> +{
> +	return slot->arch.flags & KVM_MEM_HUGEPAGE_CAPABLE;
> +}
> +
> +static inline bool kvm_hugepage_incapable(struct kvm_memory_slot *slot)
> +{
> +	return slot->arch.flags & KVM_MEM_HUGEPAGE_INCAPABLE;
> +}
> +
>   static inline void kvm_ptw_prepare(struct kvm *kvm, kvm_ptw_ctx *ctx)
>   {
>   	ctx->level = kvm->arch.root_level;
> @@ -365,6 +375,71 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
>   	kvm_ptw_top(kvm->arch.pgd, start << PAGE_SHIFT, end << PAGE_SHIFT, &ctx);
>   }
>   
> +int kvm_arch_prepare_memory_region(struct kvm *kvm,
> +				const struct kvm_memory_slot *old,
> +				struct kvm_memory_slot *new,
> +				enum kvm_mr_change change)
> +{
> +	size_t size, gpa_offset, hva_offset;
> +	gpa_t gpa_start;
> +	hva_t hva_start;
> +
> +	if ((change != KVM_MR_MOVE) && (change != KVM_MR_CREATE))
> +		return 0;
> +	/*
> +	 * Prevent userspace from creating a memory region outside of the
> +	 * VM GPA address space
> +	 */
> +	if ((new->base_gfn + new->npages) > (kvm->arch.gpa_size >> PAGE_SHIFT))
> +		return -ENOMEM;
> +
> +	size = new->npages * PAGE_SIZE;
> +	gpa_start = new->base_gfn << PAGE_SHIFT;
> +	hva_start = new->userspace_addr;
> +	new->arch.flags = 0;
> +	if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(gpa_start, PMD_SIZE)
> +			&& IS_ALIGNED(hva_start, PMD_SIZE))
> +		new->arch.flags |= KVM_MEM_HUGEPAGE_CAPABLE;
> +	else {
> +		/*
> +		 * Pages belonging to memslots that don't have the same
> +		 * alignment within a PMD for userspace and GPA cannot be
> +		 * mapped with PMD entries, because we'll end up mapping
> +		 * the wrong pages.
> +		 *
> +		 * Consider a layout like the following:
> +		 *
> +		 *    memslot->userspace_addr:
> +		 *    +-----+--------------------+--------------------+---+
> +		 *    |abcde|fgh  Stage-1 block  |    Stage-1 block tv|xyz|
> +		 *    +-----+--------------------+--------------------+---+
> +		 *
> +		 *    memslot->base_gfn << PAGE_SIZE:
> +		 *      +---+--------------------+--------------------+-----+
> +		 *      |abc|def  Stage-2 block  |    Stage-2 block   |tvxyz|
> +		 *      +---+--------------------+--------------------+-----+
> +		 *
> +		 * If we create those stage-2 blocks, we'll end up with this
> +		 * incorrect mapping:
> +		 *   d -> f
> +		 *   e -> g
> +		 *   f -> h
> +		 */
> +		gpa_offset = gpa_start & (PMD_SIZE - 1);
> +		hva_offset = hva_start & (PMD_SIZE - 1);
> +		if (gpa_offset != hva_offset) {
> +			new->arch.flags |= KVM_MEM_HUGEPAGE_INCAPABLE;
> +		} else {
> +			if (gpa_offset == 0)
> +				gpa_offset = PMD_SIZE;
> +			if ((size + gpa_offset) < (PMD_SIZE * 2))
> +				new->arch.flags |= KVM_MEM_HUGEPAGE_INCAPABLE;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   void kvm_arch_commit_memory_region(struct kvm *kvm,
>   				   struct kvm_memory_slot *old,
>   				   const struct kvm_memory_slot *new,
> @@ -562,47 +637,23 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
>   }
>   
>   static bool fault_supports_huge_mapping(struct kvm_memory_slot *memslot,
> -				unsigned long hva, unsigned long map_size, bool write)
> +				unsigned long hva, bool write)
>   {
> -	size_t size;
> -	gpa_t gpa_start;
> -	hva_t uaddr_start, uaddr_end;
> +	hva_t start, end;
>   
>   	/* Disable dirty logging on HugePages */
>   	if (kvm_slot_dirty_track_enabled(memslot) && write)
>   		return false;
>   
> -	size = memslot->npages * PAGE_SIZE;
> -	gpa_start = memslot->base_gfn << PAGE_SHIFT;
> -	uaddr_start = memslot->userspace_addr;
> -	uaddr_end = uaddr_start + size;
> +	if (kvm_hugepage_capable(memslot))
> +		return true;
>   
> -	/*
> -	 * Pages belonging to memslots that don't have the same alignment
> -	 * within a PMD for userspace and GPA cannot be mapped with stage-2
> -	 * PMD entries, because we'll end up mapping the wrong pages.
> -	 *
> -	 * Consider a layout like the following:
> -	 *
> -	 *    memslot->userspace_addr:
> -	 *    +-----+--------------------+--------------------+---+
> -	 *    |abcde|fgh  Stage-1 block  |    Stage-1 block tv|xyz|
> -	 *    +-----+--------------------+--------------------+---+
> -	 *
> -	 *    memslot->base_gfn << PAGE_SIZE:
> -	 *      +---+--------------------+--------------------+-----+
> -	 *      |abc|def  Stage-2 block  |    Stage-2 block   |tvxyz|
> -	 *      +---+--------------------+--------------------+-----+
> -	 *
> -	 * If we create those stage-2 blocks, we'll end up with this incorrect
> -	 * mapping:
> -	 *   d -> f
> -	 *   e -> g
> -	 *   f -> h
> -	 */
> -	if ((gpa_start & (map_size - 1)) != (uaddr_start & (map_size - 1)))
> +	if (kvm_hugepage_incapable(memslot))
>   		return false;
>   
> +	start = memslot->userspace_addr;
> +	end = start + memslot->npages * PAGE_SIZE;
> +
>   	/*
>   	 * Next, let's make sure we're not trying to map anything not covered
>   	 * by the memslot. This means we have to prohibit block size mappings
> @@ -615,8 +666,8 @@ static bool fault_supports_huge_mapping(struct kvm_memory_slot *memslot,
>   	 * userspace_addr or the base_gfn, as both are equally aligned (per
>   	 * the check above) and equally sized.
>   	 */
> -	return (hva & ~(map_size - 1)) >= uaddr_start &&
> -		(hva & ~(map_size - 1)) + map_size <= uaddr_end;
> +	return (hva >= ALIGN(start, PMD_SIZE)) &&
> +			(hva < ALIGN_DOWN(end, PMD_SIZE));
>   }
>   
>   /*
> @@ -842,7 +893,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
>   
>   	/* Disable dirty logging on HugePages */
>   	level = 0;
> -	if (!fault_supports_huge_mapping(memslot, hva, PMD_SIZE, write)) {
> +	if (!fault_supports_huge_mapping(memslot, hva, write)) {
>   		level = 0;
>   	} else {
>   		level = host_pfn_mapping_level(kvm, gfn, memslot);
> @@ -901,12 +952,6 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>   {
>   }
>   
> -int kvm_arch_prepare_memory_region(struct kvm *kvm, const struct kvm_memory_slot *old,
> -				   struct kvm_memory_slot *new, enum kvm_mr_change change)
> -{
> -	return 0;
> -}
> -
>   void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
>   					const struct kvm_memory_slot *memslot)
>   {
> 

