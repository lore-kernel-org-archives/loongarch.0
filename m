Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BB43C76A0
	for <loongarch@lists.linux.dev>; Mon, 18 May 2026 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098386; cv=none; b=mQfir4CwOsjwKjByvA3PDVe2f8TirLskfsdwsbe0Uy+OhtRi/TKbK20pPBJKp6+5lDrtm0gEx/UBI+Q6BTu0Kv/G2JToA71HDT1G+z6U7vQbXCPenA8loEoubf2a028RMJhn9aeUmoC+3q5xlFUIwnYw+S4hiYPQlPuZzJ6ybSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098386; c=relaxed/simple;
	bh=oyCZ1DMGTSBsBbHc9SWNQko876ePtG6glQ6crX8A/bU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OOcXez3JFdJVbhqSSVBIceN2/hfbuSWX3DZGgjvxm1icyGuaXf2sR/glctNo0wYt1QNfeROBazwUgr4b4ADE25iH45QIqWQE1C9UpSLdVD+iKKYN+rOcAVW2LsooiGSOPWzY+BslkqqIftNdA9Hjj2Yqj4kfoIMbFIvJ6HqhTRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxvekC4wpqbs0KAA--.30383S3;
	Mon, 18 May 2026 17:59:30 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxbcL+4gpqMnKGAA--.56726S3;
	Mon, 18 May 2026 17:59:29 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Add missing slots_lock for EIOINTC
 virtual extension device registration
To: Zeng Chi <zeng_chi911@163.com>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, kernel@xen0n.name
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, zengchi@kylinos.cn
References: <20260518094521.138692-1-zeng_chi911@163.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <af3e9ecc-cb30-6d7d-5f2d-19ddf42755a0@loongson.cn>
Date: Mon, 18 May 2026 17:56:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260518094521.138692-1-zeng_chi911@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxbcL+4gpqMnKGAA--.56726S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw1UJFy3Kryktr15Jr4xuFX_yoW8JFWUpF
	48uayqkrWrXr9rXrZFq3W8Wa1UKa9agw1rWr1rKFWUKr4qqryrtFykAry5X3Wqk3yxAay0
	qFy3Gr98Z3W3AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8r9
	N3UUUUU==



On 2026/5/18 下午5:45, Zeng Chi wrote:
> From: Zeng Chi <zengchi@kylinos.cn>
> 
> The second kvm_io_bus_register_dev() call for device_vext was missing
> kvm->slots_lock protection. Add it to match the first registration.
> 
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> ---
>   arch/loongarch/kvm/intc/eiointc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
> index 2ab7fafa86d5..ce64ffb706df 100644
> --- a/arch/loongarch/kvm/intc/eiointc.c
> +++ b/arch/loongarch/kvm/intc/eiointc.c
> @@ -645,8 +645,10 @@ static int kvm_eiointc_create(struct kvm_device *dev, u32 type)
>   
>   	device = &s->device_vext;
>   	kvm_iodevice_init(device, &kvm_eiointc_virt_ops);
> +	mutex_lock(&kvm->slots_lock);
>   	ret = kvm_io_bus_register_dev(kvm, KVM_IOCSR_BUS,
>   			EIOINTC_VIRT_BASE, EIOINTC_VIRT_SIZE, device);
> +	mutex_unlock(&kvm->slots_lock);
>   	if (ret < 0) {
>   		kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &s->device);
>   		kfree(s);
> 
Hi ZengChi,

Good catch.

There should be the similar lock protection with function call 
kvm_io_bus_unregister_dev() in files pch_pic.c/ipi.c/eiointc.c

Would you like add these together?

Regards
Bibo Mao

