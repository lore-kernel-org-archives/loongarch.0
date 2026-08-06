Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5F841F5E7
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006151; cv=none; b=hgiw3M/lZG+8ks8ZrvOunVnkT3DdZhn0r1j1iDdS7IQoowO0UXD2z64IgntK5P8qb12C69hGTjnESp8Fq+Zc7waTUusdh5G6iYzRQ0TP05foHtPDYLMbuJPvl14fdPb21R1z14MGIa8qD8tUj1OFw9PR4iGRKUk2+MRqkXhD7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006151; c=relaxed/simple;
	bh=DvYLoNLAtAxRVhg7OD+VCabaq824SGrf+ilSWJn9sjc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pfTyP2n2eJGjDydKG9S0X9V/3AnMHO0EivPc9zGerKFTyI3eu2Wv5paKzGiLflStf4YwNB62Id6qKlVDwaGvXgZAaZBRtwM64oJ9VLNhQx2PbRbeCL/iIG1eaRByx9oWQQIFu+qByz/g8sKxJGMcBeKEZpD1SCc47j4FzXVKuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Dxtup_SnRqq+8KAA--.35107S3;
	Thu, 06 Aug 2026 16:49:03 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxTsV+SnRqGpMlAA--.6361S2;
	Thu, 06 Aug 2026 16:49:02 +0800 (CST)
Subject: Re: [RFC] LoongArch: KVM: VCPU_EVENTS for pending interrupt/exception
 migration
To: Tao Cui <cui.tao@linux.dev>
Cc: zhaotianrui@loongson.cn, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <7e2648e9-e333-42f7-857a-8337ef033147@linux.dev>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <ca52efd4-5601-2448-b17c-6d73e1002fd7@loongson.cn>
Date: Thu, 6 Aug 2026 16:48:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7e2648e9-e333-42f7-857a-8337ef033147@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxTsV+SnRqGpMlAA--.6361S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw13Gw18JFyxZF17Kry8WFX_yoW5Zw47pF
	W8tw15uF48tF18Zws2qayj9r10vrWrGw4I9FsY934Fyrs8Xr9FyFsakFW5ZF98CwnY9r1I
	qrW0v34Uua4DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70Pf
	DUUUU

Hi Tao,

On 2026/8/6 下午4:04, Tao Cui wrote:
> Hi Bibo,
> 
> I'd like to get your feedback on an approach for migrating the pending
> interrupt and exception state (irq_pending, irq_clear, exception_pending,
> esubcode) that is currently not captured by the CSR-based migration path.
> 
> I noticed your earlier work on this in the "Small enhancement about
> interrupt injection" series — specifically the kvm_vcpu_sync_intr() patch
> ([PATCH v3 6/6], 2026-05-19), which tried to fold irq_pending into the
> software ESTAT register before migration reads.  I see it was removed in
> v4 with the note that it "does not sync cached" state correctly, and the
> rest of the series was merged without it.
> 
> The core difficulty, as I understand it, is that irq_pending represents
> queued-but-not-yet-delivered interrupts, while ESTAT represents the
The main problem is that dmsintc is added recently, AI agent reports 
that interrupt status of dmsintc should be synced also, and synced to 
software state LOONGARCH_CSR_ISR0-LOONGARCH_CSR_ISR3 register from local 
state ds->vector_map[], similiar with function dmsintc_inject_irq().

If dmsintc is synced to software state, hardware registers about 
CSR_ISR0-CSR_ISR3 will be stale. And it need to restore from software 
status in _kvm_vcpu_load() even if KVM_LARCH_HWCSR_USABLE in 
vcpu->arch.aux_inuse is set.

That will be bigger change, and also AI agent reports variable vector[] 
is accessed without initialized issue. So this patch is removed :( 
However I think that vcpu_load()/vcpu_put() can be removed in 
_kvm_getcsr() at final.

> already-delivered state — folding the former into the latter would make
> the guest see interrupts it should not yet see.
> 
> My alternative approach is to add KVM_CAP_VCPU_EVENTS with a
> LoongArch-specific struct that captures these fields independently,
> without modifying ESTAT:
> 
>    struct kvm_vcpu_events {
>        __u64 irq_pending;
>        __u64 irq_clear;
>        __u64 exception_pending;
>        __u32 esubcode;
>        __u32 reserved[11];
>    };
Adding new uapi will lead to compatible issue. I think it is not necessary.

Regards
Bibo Mao
> 
> Userspace (QEMU) calls KVM_GET_VCPU_EVENTS during migration save and
> KVM_SET_VCPU_EVENTS during restore, keeping the queued/delivered
> distinction intact.  The kernel handler is straightforward — just
> read/write the four fields to/from vcpu->arch.
> 
> I've implemented both sides and verified end-to-end on a 3A6000:
> - Kernel: 3-file patch (uapi struct + cap advertisement + GET/SET
>    ioctl handlers), built on linux-next 20260805.
> - QEMU: 4-file patch (LA kvm header struct + CPUState fields +
>    VMState subsection + get/put in save/load path), built on
>    QEMU 11.1-rc3.
> - strace on a real source→dest migration confirms QEMU probes
>    KVM_CAP_VCPU_EVENTS (=1), then issues KVM_GET_VCPU_EVENTS on save
>    and KVM_SET_VCPU_EVENTS on restore for both vCPUs (all return 0).
> 
> Do you think this approach is reasonable?  I wanted to check with you
> before submitting, since you've worked in this area and might have
> insights on why the fold-into-ESTAT path was preferred (or if there
> are concerns with the separate-capture approach I'm missing).
> 
> Thanks,
> Tao
> 

