Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AEE350D47
	for <loongarch@lists.linux.dev>; Tue, 23 Dec 2025 01:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766453272; cv=none; b=XJqQQsIpJes3hNqEVuXJuXNHSrroKJhQxGLxGjBbbwf0RCTixeEbGpDblnHemU69tZEYj91iydEBgq08Dc+aKsBAg511YlDOCgT2x1OPQAK+YxYmKqqCj+UpvAwLmUjAPV5Gk7oPalNndPt6Edu4Pr9wcABIZ/2YY9438SzJ6I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766453272; c=relaxed/simple;
	bh=EiSccUwHH1y9gPi/yQ/Pfx3UYwckUvKIjhlNFOmdrXI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FGcW3aBJd/v/H2dqwmIxOXCBfanmYyC3P8eo6SjEWSWLVQisziKyXvVBYpTB2yEZN6AEywB2sM9lnZFUeLC6SVMOG+TUhotu6zDVc9Vy9lNhY2t6vjt4CuJpWFBcFoqW6VlYjzzrnrtAEW8AVw4PEhE8EXW4P687oPQSF9biWJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxWcIQ8ElpAToCAA--.6766S3;
	Tue, 23 Dec 2025 09:27:44 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxSeAN8ElpnaMDAA--.11084S3;
	Tue, 23 Dec 2025 09:27:43 +0800 (CST)
Subject: Re: [PATCH V2 2/2] LoongArch: KVM: fix "unreliable stack" issue
To: Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: stable@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Charlie Jenkins <charlie@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20251222113409.2343711-1-lixianglai@loongson.cn>
 <20251222113409.2343711-3-lixianglai@loongson.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <e1f4b85e-0177-91b7-c422-22ed60607260@loongson.cn>
Date: Tue, 23 Dec 2025 09:25:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251222113409.2343711-3-lixianglai@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeAN8ElpnaMDAA--.11084S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF1Dur48tr1xKFyftrW5Jwc_yoW5GFWxpa
	4avF1qqF4kKw1vga1DG34qkr4xZFWkWr1xWrn7tryrZr1kWryrXF18GwsxAFn8Gw48WF4k
	XFy8KFn0vay8AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8sXo7UU
	UUU==



On 2025/12/22 下午7:34, Xianglai Li wrote:
> Insert the appropriate UNWIND macro definition into the kvm_exc_entry in
> the assembly function to guide the generation of correct ORC table entries,
> thereby solving the timeout problem of loading the livepatch-sample module
> on a physical machine running multiple vcpus virtual machines.
> 
> While solving the above problems, we have gained an additional benefit,
> that is, we can obtain more call stack information
> 
> Stack information that can be obtained before the problem is fixed:
> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
> [<0>] kvm_exc_entry+0x100/0x1e0
> 
> Stack information that can be obtained after the problem is fixed:
> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
> [<0>] kvm_exc_entry+0x100/0x1e0
> [<0>] kvm_arch_vcpu_ioctl_run+0x260/0x488 [kvm]
> [<0>] kvm_vcpu_ioctl+0x200/0xcd8 [kvm]
> [<0>] sys_ioctl+0x498/0xf00
> [<0>] do_syscall+0x94/0x190
> [<0>] handle_syscall+0xb8/0x158
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
> ---
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Tianrui Zhao <zhaotianrui@loongson.cn>
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: Charlie Jenkins <charlie@rivosinc.com>
> Cc: Xianglai Li <lixianglai@loongson.cn>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> 
>   arch/loongarch/kvm/switch.S | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
> index 93845ce53651..e3ecb24a3bc5 100644
> --- a/arch/loongarch/kvm/switch.S
> +++ b/arch/loongarch/kvm/switch.S
> @@ -170,6 +170,7 @@ SYM_CODE_START(kvm_exc_entry)
>   	/* restore per cpu register */
>   	ld.d	u0, a2, KVM_ARCH_HPERCPU
>   	addi.d	sp, sp, -PT_SIZE
> +	UNWIND_HINT_REGS
>   
>   	/* Prepare handle exception */
>   	or	a0, s0, zero
> @@ -214,6 +215,7 @@ SYM_FUNC_START(kvm_enter_guest)
>   	addi.d	a2, sp, -PT_SIZE
>   	/* Save host GPRs */
>   	kvm_save_host_gpr a2
> +	st.d	ra, a2, PT_ERA
Had better add some comments here to show that it is special for unwind 
usage since there is "st.d ra, a2, PT_R1" already in macro 
kvm_save_host_gpr().

Regards
Bibo Mao
>   
>   	addi.d	a2, a1, KVM_VCPU_ARCH
>   	st.d	sp, a2, KVM_ARCH_HSP
> 

