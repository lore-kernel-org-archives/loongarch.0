Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43412941A
	for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788142213; cv=none; b=k/xLONO/mbEvhnudmulmlztvq0/M5XABIncPQcKlYEUhxoarM3VwttvZMuE5HZpl6caN2HwOz8pglrUIfX5P62KsPQj6g6Jh2SlZ+uAOJCZqdNRxpCB+fEh3ECvFhnSehxACOYor8I7K2KNZNLUz6SeYHGW0+1C11AbFvVhkp8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788142213; c=relaxed/simple;
	bh=gOHdHbyFwmSt0pq+fYqTSruFCmYvjBlEASAyj09CZno=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=gSsSCfLcCgtEwa2nQJWwptF8MA5keibF1KshxnfoiabIJtHjeQSM+8vb1Pj0gSLbz73/JoHwZi0I/HKVacTgx1FF3lSlSVp0XHD16+fHwvqAe7AA2Z+cUPfE31b6ap/L/pQ6e7qHnUumVktLSRDsJ//Hx82taScaNZ0hzkiHGqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxX9OB4pRqrrwGAA--.18793S3;
	Mon, 31 Aug 2026 10:10:09 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxf8994pRqOfUXAA--.51660S2;
	Mon, 31 Aug 2026 10:10:07 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Preserve memslot arch flags on
 KVM_MR_FLAGS_ONLY
To: Zeng Chi <zeng_chi911@163.com>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, zengchi@kylinos.cn, stable@vger.kernel.org
References: <20260828094825.357630-1-zeng_chi911@163.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <5cc77794-ffac-f0b3-2b04-c9c322631dc5@loongson.cn>
Date: Mon, 31 Aug 2026 10:09:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260828094825.357630-1-zeng_chi911@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxf8994pRqOfUXAA--.51660S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCFWrtw4kJrWxJF1rAw15ZFc_yoW5Gr45pF
	WxCwn0krWfGrn2kFZ3J347Wa1rZ397KF4I9FyxK34UAr98t34Ikay0ka1DW3yrJ3yxCF42
	qF1Yq3sxK3Wqv3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkU
	UUUU=



On 2026/8/28 下午5:48, Zeng Chi wrote:
> From: Zeng Chi <zengchi@kylinos.cn>
> 
> kvm_arch_prepare_memory_region() computes new->arch.flags, i.e. whether
> a memslot is KVM_MEM_HUGEPAGE_CAPABLE or KVM_MEM_HUGEPAGE_INCAPABLE, only
> for KVM_MR_CREATE and KVM_MR_MOVE, and returns early for every other
> change.  But the generic code allocates a zeroed memslot for every
> change and never copies old->arch, so after a KVM_MR_FLAGS_ONLY update,
> e.g. toggling KVM_MEM_LOG_DIRTY_PAGES for live migration, the active
> memslot has arch.flags == 0.
> 
> With both flags clear, fault_supports_huge_mapping() falls through to
> the alignment check on the HVA range alone, which no longer verifies
> that the GPA and HVA have the same offset within a PMD.  A memslot that
> was marked KVM_MEM_HUGEPAGE_INCAPABLE because of a GPA/HVA offset
> mismatch can then be mapped with PMD entries on read faults, and since
> kvm_map_page() aligns the gfn and the pfn independently, the guest ends
> up accessing the wrong host pages, exactly the "d -> f, e -> g" case
> described in the comment above the check.
> 
> Carry the arch flags over from the old memslot for KVM_MR_FLAGS_ONLY,
> as the GPA, HVA and size are guaranteed to be unchanged for that case.
> 
> Fixes: 7ab6fb505b2a ("LoongArch: KVM: Optimization for memslot hugepage checking")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> ---
>   arch/loongarch/kvm/mmu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index e104897aa532..4ca7c6ea8f08 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -383,6 +383,16 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm, const struct kvm_memory_slot
>   	hva_t hva_start;
>   	size_t size, gpa_offset, hva_offset;
>   
> +	/*
> +	 * The generic code allocates a fresh, zeroed memslot for every change,
> +	 * so the arch flags computed below must be carried over when only the
> +	 * userspace flags change, e.g. when dirty logging is toggled.
> +	 */
> +	if (change == KVM_MR_FLAGS_ONLY) {
> +		new->arch = old->arch;
> +		return 0;
> +	}
> +
>   	if ((change != KVM_MR_MOVE) && (change != KVM_MR_CREATE))
>   		return 0;
>   	/*
> 
 >
yes, when VM starts to migrate and set KVM_MEM_LOG_DIRTY_PAGES flag, or 
cancel migration and clear KVM_MEM_LOG_DIRTY_PAGES flag. The arch 
specified flag in new memslot should be kept the same. Thanks for the 
contribution.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

