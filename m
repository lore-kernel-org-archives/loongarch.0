Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219BF15748B
	for <loongarch@lists.linux.dev>; Fri, 12 Jul 2024 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720767317; cv=none; b=DfkPyo6rqGiG8PZ8coFp6BN3b0gpl2RN4peDdPwZWyuigPao0SNtZwfx7WtIamv3eR1Vd34DVhdmNdnPAQTwh9H1Asi2UkkxojyuY05oW5C2SgrN8kX86jZQGcl9S7E4iTr8lRyvOCM/VJ9Y6T7PrqQFGg38qBq6jmkdh41TKKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720767317; c=relaxed/simple;
	bh=usMyPBmwjlLAVglz+9yx79fn8nmpfP6b3u/cmknSBb4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=p89UgT2wmAi3GyUuWBSg73e46ea2EmqrpYwQ/TcWxluxz+GZVbjIkb6aXHfjuZvFg/vc2zrCjsynC7VMeaImR4g7sjp7UOnGci8FZ+oKaUHhbOpVqghqNwurl2c56wnnlLloo5sGYAPg3o17FcMY9q66o6B1pCp415I/WbLGdP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Cxo+lN05BmN5UDAA--.1144S3;
	Fri, 12 Jul 2024 14:55:09 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axw8RI05Bmn4BFAA--.16410S3;
	Fri, 12 Jul 2024 14:55:07 +0800 (CST)
Subject: Re: [PATCH 01/11] LoongArch: KVM: Add iocsr and mmio bus simulation
 in kernel
To: Xianglai Li <lixianglai@loongson.cn>, linux-kernel@vger.kernel.org
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, Min Zhou <zhoumin@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, WANG Xuerui <kernel@xen0n.name>
References: <20240705023854.1005258-1-lixianglai@loongson.cn>
 <20240705023854.1005258-2-lixianglai@loongson.cn>
From: maobibo <maobibo@loongson.cn>
Message-ID: <4bd4a664-25c8-d86d-533a-d3dc338e0bec@loongson.cn>
Date: Fri, 12 Jul 2024 14:55:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240705023854.1005258-2-lixianglai@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axw8RI05Bmn4BFAA--.16410S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3JF18Xr4Uur4DGw1DXr17CFX_yoW7urWUpF
	y5u3srZw4rtrZ7AwnrWrsa9ry2v395GFy7X3s7JrWfur1UtF95Ar40krWjvFWUJr9avF4x
	Z3WfJFy7C3WUA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
	VUUUUUU==



On 2024/7/5 上午10:38, Xianglai Li wrote:
> Add iocsr and mmio memory read and write simulation to the kernel.
> When the VM accesses the device address space through iocsr
> instructions or mmio, it does not need to return to the qemu
> user mode but directly completes the access in the kernel mode.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
> ---
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: kvm@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: Min Zhou <zhoumin@loongson.cn>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Tianrui Zhao <zhaotianrui@loongson.cn>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Xianglai li <lixianglai@loongson.cn>
> 
>   arch/loongarch/kvm/exit.c | 69 ++++++++++++++++++++++++++++-----------
>   include/linux/kvm_host.h  |  1 +
>   2 files changed, 51 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
> index a68573e091c0..e8e37e135dd1 100644
> --- a/arch/loongarch/kvm/exit.c
> +++ b/arch/loongarch/kvm/exit.c
> @@ -148,7 +148,7 @@ static int kvm_handle_csr(struct kvm_vcpu *vcpu, larch_inst inst)
>   int kvm_emu_iocsr(larch_inst inst, struct kvm_run *run, struct kvm_vcpu *vcpu)
>   {
>   	int ret;
> -	unsigned long val;
> +	unsigned long *val;
>   	u32 addr, rd, rj, opcode;
>   
>   	/*
> @@ -161,6 +161,7 @@ int kvm_emu_iocsr(larch_inst inst, struct kvm_run *run, struct kvm_vcpu *vcpu)
>   	ret = EMULATE_DO_IOCSR;
>   	run->iocsr_io.phys_addr = addr;
>   	run->iocsr_io.is_write = 0;
> +	val = &vcpu->arch.gprs[rd];
>   
>   	/* LoongArch is Little endian */
>   	switch (opcode) {
> @@ -194,15 +195,21 @@ int kvm_emu_iocsr(larch_inst inst, struct kvm_run *run, struct kvm_vcpu *vcpu)
>   		break;
>   	default:
>   		ret = EMULATE_FAIL;
> -		break;
> +		return ret;
How about directly return such as *return EMULATE_FAIL;* ?

>   	}
>   
> -	if (ret == EMULATE_DO_IOCSR) {
> -		if (run->iocsr_io.is_write) {
> -			val = vcpu->arch.gprs[rd];
> -			memcpy(run->iocsr_io.data, &val, run->iocsr_io.len);
> -		}
> -		vcpu->arch.io_gpr = rd;
> +	if (run->iocsr_io.is_write) {
> +		if (!kvm_io_bus_write(vcpu, KVM_IOCSR_BUS, addr, run->iocsr_io.len, val))
It exceeds 80 chars, it will be better if line wrapper is added.

> +			ret = EMULATE_DONE;
> +		else
> +			/* Save data and let user space to write it */
> +			memcpy(run->iocsr_io.data, val, run->iocsr_io.len);
> +	} else {
> +		if (!kvm_io_bus_read(vcpu, KVM_IOCSR_BUS, addr, run->iocsr_io.len, val))
Ditto.
> +			ret = EMULATE_DONE;
> +		else
> +			/* Save register id for iocsr read completion */
> +			vcpu->arch.io_gpr = rd;
>   	}
>   
>   	return ret;
> @@ -438,19 +445,33 @@ int kvm_emu_mmio_read(struct kvm_vcpu *vcpu, larch_inst inst)
>   	}
>   
>   	if (ret == EMULATE_DO_MMIO) {
> +		/*
> +		 * if mmio device such as pch pic is emulated in KVM,
> +		 * it need not return to user space to handle the mmio
> +		 * exception.
> +		 */
> +		ret = kvm_io_bus_read(vcpu, KVM_MMIO_BUS, vcpu->arch.badv,
> +				run->mmio.len, &vcpu->arch.gprs[rd]);
> +		if (!ret) {
> +			update_pc(&vcpu->arch);
> +			vcpu->mmio_needed = 0;
> +			return EMULATE_DONE;
> +		}
> +
>   		/* Set for kvm_complete_mmio_read() use */
>   		vcpu->arch.io_gpr = rd;
>   		run->mmio.is_write = 0;
>   		vcpu->mmio_is_write = 0;
>   		trace_kvm_mmio(KVM_TRACE_MMIO_READ_UNSATISFIED, run->mmio.len,
>   				run->mmio.phys_addr, NULL);
Should the trace function be called for KVM_MMIO_BUS also? I think the 
trace function should be called before kvm_io_bus_read.

> -	} else {
> -		kvm_err("Read not supported Inst=0x%08x @%lx BadVaddr:%#lx\n",
> -			inst.word, vcpu->arch.pc, vcpu->arch.badv);
> -		kvm_arch_vcpu_dump_regs(vcpu);
> -		vcpu->mmio_needed = 0;
> +		return EMULATE_DO_MMIO;
>   	}
>   
> +	kvm_err("Read not supported Inst=0x%08x @%lx BadVaddr:%#lx\n",
> +			inst.word, vcpu->arch.pc, vcpu->arch.badv);
> +	kvm_arch_vcpu_dump_regs(vcpu);
> +	vcpu->mmio_needed = 0;
> +
Empty line is not necessary from my view :)
>   	return ret;
>   }
>   
> @@ -591,19 +612,29 @@ int kvm_emu_mmio_write(struct kvm_vcpu *vcpu, larch_inst inst)
>   	}
>   
>   	if (ret == EMULATE_DO_MMIO) {
> +		/*
> +		 * if mmio device such as pch pic is emulated in KVM,
> +		 * it need not return to user space to handle the mmio
> +		 * exception.
> +		 */
> +		ret = kvm_io_bus_write(vcpu, KVM_MMIO_BUS, vcpu->arch.badv,
> +				run->mmio.len, data);
> +		if (!ret)
> +			return EMULATE_DONE;
> +
>   		run->mmio.is_write = 1;
>   		vcpu->mmio_needed = 1;
>   		vcpu->mmio_is_write = 1;
>   		trace_kvm_mmio(KVM_TRACE_MMIO_WRITE, run->mmio.len,
>   				run->mmio.phys_addr, data);
Ditto, trace function should be put before kvm_io_bus_write.

> -	} else {
> -		vcpu->arch.pc = curr_pc;
> -		kvm_err("Write not supported Inst=0x%08x @%lx BadVaddr:%#lx\n",
> -			inst.word, vcpu->arch.pc, vcpu->arch.badv);
> -		kvm_arch_vcpu_dump_regs(vcpu);
> -		/* Rollback PC if emulation was unsuccessful */
> +		return EMULATE_DO_MMIO;
>   	}
>   
> +	vcpu->arch.pc = curr_pc;
> +	kvm_err("Write not supported Inst=0x%08x @%lx BadVaddr:%#lx\n",
> +			inst.word, vcpu->arch.pc, vcpu->arch.badv);
> +	kvm_arch_vcpu_dump_regs(vcpu);
> +	/* Rollback PC if emulation was unsuccessful */
>   	return ret;
>   }
>   
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 692c01e41a18..f51b2e53d81c 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -219,6 +219,7 @@ enum kvm_bus {
>   	KVM_PIO_BUS,
>   	KVM_VIRTIO_CCW_NOTIFY_BUS,
>   	KVM_FAST_MMIO_BUS,
> +	KVM_IOCSR_BUS,
>   	KVM_NR_BUSES
>   };
I just think this patch should be after PCH/EXTIOI/IPI is created and 
IOCSR/MMIO space is registered in kernel space.It is only my points, I 
am not good at this:(

Regards
Bibo Mao
>   
> 

