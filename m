Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71FB2DEA6B
	for <loongarch@lists.linux.dev>; Tue, 11 Aug 2026 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439059; cv=none; b=i5Go815/5n8C1zp/H3bKqsjPA07Kt2wd7Sk7agrp64W9pWMDc5OSIkTiOOnSmMZooiF1KkwaCgMaJB+oUmeNN3TSYOLmBCPqH+E67Nv7cAT6/tyqgmXE27txAUyyK9xIQCA4ozVRXACT099ylJmTuffDKM17JqX4LdVmpXxOPi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439059; c=relaxed/simple;
	bh=10qM44Kr9OeofzvV+8kWZ1WCNch+/hCgogkMD24DaHg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=htKlymDCFhXQioyaWwhsFO+DFlhu/YRKoTySRisRjjW1xgWckHifLa+4uMisQelmGu/AjWitrogCLUWIkinjqrbu6QlYB83UpdTCqviYpQvWIIjfeuGKr2tpUP1VV2y+rhgqg6o2TpivsmptMcHZRFOUCkhHmaN8ySBK0j9bXSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HVmjra07; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HVmjra07"
Message-ID: <c0e8eb3d-d99c-44d1-819a-f6f0e3b9502f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786439054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ptBUeJ4msaOxN4Yk814gLrRaJ1d8EETljTID6YMlq8Q=;
	b=HVmjra07geLqWSymDzhw1yRRUlKkLRGsj0QWMZkDF+n44463I0BHzEHrvCWqHEfm5b9U/R
	tbl0QcTENU8g3FOTT8j4Hu62ye3wgUWIIQYBZbgEMCm/oS3ONFNn5g3ujVyd3FkrPxVt6l
	O3C3s2vtIpiUXSu9V0JRRyuShbVtisA=
Date: Tue, 11 Aug 2026 17:04:07 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Cc: cui.tao@linux.dev, zhaotianrui@loongson.cn,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC] LoongArch: KVM: VCPU_EVENTS for pending interrupt/exception
 migration
To: Bibo Mao <maobibo@loongson.cn>
References: <7e2648e9-e333-42f7-857a-8337ef033147@linux.dev>
 <ca52efd4-5601-2448-b17c-6d73e1002fd7@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <ca52efd4-5601-2448-b17c-6d73e1002fd7@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



在 2026/8/6 16:48, Bibo Mao 写道:
> Hi Tao,
> 
> On 2026/8/6 下午4:04, Tao Cui wrote:
>> Hi Bibo,
>>
>> I'd like to get your feedback on an approach for migrating the pending
>> interrupt and exception state (irq_pending, irq_clear, exception_pending,
>> esubcode) that is currently not captured by the CSR-based migration path.
>>
>> I noticed your earlier work on this in the "Small enhancement about
>> interrupt injection" series — specifically the kvm_vcpu_sync_intr() patch
>> ([PATCH v3 6/6], 2026-05-19), which tried to fold irq_pending into the
>> software ESTAT register before migration reads.  I see it was removed in
>> v4 with the note that it "does not sync cached" state correctly, and the
>> rest of the series was merged without it.
>>
>> The core difficulty, as I understand it, is that irq_pending represents
>> queued-but-not-yet-delivered interrupts, while ESTAT represents the
> The main problem is that dmsintc is added recently, AI agent reports that interrupt status of dmsintc should be synced also, and synced to software state LOONGARCH_CSR_ISR0-LOONGARCH_CSR_ISR3 register from local state ds->vector_map[], similiar with function dmsintc_inject_irq().
> 
> If dmsintc is synced to software state, hardware registers about CSR_ISR0-CSR_ISR3 will be stale. And it need to restore from software status in _kvm_vcpu_load() even if KVM_LARCH_HWCSR_USABLE in vcpu->arch.aux_inuse is set.
> 
> That will be bigger change, and also AI agent reports variable vector[] is accessed without initialized issue. So this patch is removed :( However I think that vcpu_load()/vcpu_put() can be removed in _kvm_getcsr() at final.
Thanks for the explanation, the DMSINTC part makes sense now.
> 
>> already-delivered state — folding the former into the latter would make
>> the guest see interrupts it should not yet see.
>>
>> My alternative approach is to add KVM_CAP_VCPU_EVENTS with a
>> LoongArch-specific struct that captures these fields independently,
>> without modifying ESTAT:
>>
>>    struct kvm_vcpu_events {
>>        __u64 irq_pending;
>>        __u64 irq_clear;
>>        __u64 exception_pending;
>>        __u32 esubcode;
>>        __u32 reserved[11];
>>    };
> Adding new uapi will lead to compatible issue. I think it is not necessary.
> 
I'll drop the VCPU_EVENTS idea.

Since you're already working on this direction, I'll wait for your
patch.  Happy to help test locally once it's ready.

Thanks,
Tao
> Regards
> Bibo Mao
>>
>> Userspace (QEMU) calls KVM_GET_VCPU_EVENTS during migration save and
>> KVM_SET_VCPU_EVENTS during restore, keeping the queued/delivered
>> distinction intact.  The kernel handler is straightforward — just
>> read/write the four fields to/from vcpu->arch.
>>
>> I've implemented both sides and verified end-to-end on a 3A6000:
>> - Kernel: 3-file patch (uapi struct + cap advertisement + GET/SET
>>    ioctl handlers), built on linux-next 20260805.
>> - QEMU: 4-file patch (LA kvm header struct + CPUState fields +
>>    VMState subsection + get/put in save/load path), built on
>>    QEMU 11.1-rc3.
>> - strace on a real source→dest migration confirms QEMU probes
>>    KVM_CAP_VCPU_EVENTS (=1), then issues KVM_GET_VCPU_EVENTS on save
>>    and KVM_SET_VCPU_EVENTS on restore for both vCPUs (all return 0).
>>
>> Do you think this approach is reasonable?  I wanted to check with you
>> before submitting, since you've worked in this area and might have
>> insights on why the fold-into-ESTAT path was preferred (or if there
>> are concerns with the separate-capture approach I'm missing).
>>
>> Thanks,
>> Tao
>>
> 

