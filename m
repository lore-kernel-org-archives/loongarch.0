Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BA12E612E
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 01:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776131611; cv=none; b=SoM/5ErO7i/4EdMEA8jjAHH7aLk7mbDdE0opHKkq413knI02MBHvNUEGSCxwArPw75iWc/Db1Oz39ZaNJpICTXygrSf8cddLHV3pFO26xv9qzCDquGZUr0g/X6ycUvGcPSE8XM3D/Zam3+OYSEYCxpOClsaSocISCeeaC8CkjoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776131611; c=relaxed/simple;
	bh=zp5z0MM84fEKdhf7zjmzZEP0DI3jUfbshHlO29hr1hY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=AXHW8KJO6M3A5i9lg896TAoG32C7SS1FXR+tX06Y2GPLL6n2vTWbK0tdjjVQ+PxctjeY+ureg4+RfLN/IZQVShRksBwZ4IiTx41M98mQ74UnqxsNX/PO8emJKfdMydwvsGM8LdgJvEazUurcq5Uc4EvlbTf/aRMS0eEZBya3U3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxAusVnt1p_loAAA--.1877S3;
	Tue, 14 Apr 2026 09:53:25 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCx_8ISnt1pYI5sAA--.10083S3;
	Tue, 14 Apr 2026 09:53:25 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Fix data race in kvm_ipi_regs_access
To: cuitao <cuitao@kylinos.cn>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, loongarch@lists.linux.dev
Cc: kernel@xen0n.name
References: <20260414013316.306075-1-cuitao@kylinos.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <ce3d170a-56a4-9343-49fa-2d8b3cbc9ebe@loongson.cn>
Date: Tue, 14 Apr 2026 09:50:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260414013316.306075-1-cuitao@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8ISnt1pYI5sAA--.10083S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur1UKr1xKF4DGFWDAw18Zwc_yoW8CrWDpF
	y2kan3uryrXr48ZrnxWw1UZFZF93s2qryjga97JFyrAF1Yvr9YkFWFkrZxZa1UXw1fZrs3
	Xa1qyF98Z3yDu3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UU
	UUU==



On 2026/4/14 上午9:33, cuitao wrote:
> Add spin_lock protection around ipi_state field accesses in
> kvm_ipi_regs_access(). get_user/put_user are performed
> outside the lock since they may sleep on page faults.
> 
> Signed-off-by: cuitao <cuitao@kylinos.cn>
> ---
>   arch/loongarch/kvm/intc/ipi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
> index 1f6ebbd0af5c..e6a4a461a0c8 100644
> --- a/arch/loongarch/kvm/intc/ipi.c
> +++ b/arch/loongarch/kvm/intc/ipi.c
> @@ -348,18 +348,26 @@ static int kvm_ipi_regs_access(struct kvm_device *dev,
>   		if (len == 4) {
>   			if (get_user(val, (uint32_t __user *)attr->addr))
>   				return -EFAULT;
> +			spin_lock(&vcpu->arch.ipi_state.lock);
>   			*(uint32_t *)p = (uint32_t)val;
> +			spin_unlock(&vcpu->arch.ipi_state.lock);
>   		} else if (len == 8) {
>   			if (get_user(val, (uint64_t __user *)attr->addr))
>   				return -EFAULT;
> +			spin_lock(&vcpu->arch.ipi_state.lock);
>   			*(uint64_t *)p = val;
> +			spin_unlock(&vcpu->arch.ipi_state.lock);
>   		}
>   	} else {
>   		if (len == 4) {
> +			spin_lock(&vcpu->arch.ipi_state.lock);
>   			val = *(uint32_t *)p;
> +			spin_unlock(&vcpu->arch.ipi_state.lock);
>   			return put_user(val, (uint32_t __user *)attr->addr);
>   		} else if (len == 8) {
> +			spin_lock(&vcpu->arch.ipi_state.lock);
>   			val = *(uint64_t *)p;
> +			spin_unlock(&vcpu->arch.ipi_state.lock);
>   			return put_user(val, (uint64_t __user *)attr->addr);
>   		}
>   	}
> 
I am not sure whether spinlock need be added here. When get/set ipi 
register of vCPU from VMM side, the vCPU should be kicked out at safe 
state by VMM; Otherwise even if lock is added, VMM will get one register 
at a time and vCPU may write these registers at the same time, part of 
registers acquired by VMM still are stale.

Regards
Bibo Mao

