Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE883E16B9
	for <loongarch@lists.linux.dev>; Mon, 25 May 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702818; cv=none; b=VZ3eKDRNJxBMk58uVjnPkJcQwXPnt0Zu447AAg0Qe23jZzw1TWw0QNIyeFSvz8nDGZdOBzoJID9V3HECjTXqduTqaqLIn+j0ozaZ6p42vEIj3WLx1GkdSAC6ZK8MRtZGzjz+iDAPb7pRetHIOixHrpaW9bOURhkkEd0OtVXAWF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702818; c=relaxed/simple;
	bh=nl4ZwqaZzWO4TpX5//aMEvyipqRok3uOxlOGFlrgtWM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qb0GEa/kyS/DC75RDZ37WbKxp5kiXMkFlrjgnBRQ31WOpVdOBUizCGLUPG5okCwk5Ll+X4XB0Mp1gCoQNQ9yzB3NfdNO5CS8oGcrt9GzxYAzmNr/kHiinbDHHBtm6UURaABTAFb78Qdb8pQ2naqCShoZgsy32Pnt3x5arJmiWnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxVXgbHBRqDQkNAA--.12667S3;
	Mon, 25 May 2026 17:53:31 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxSeAWHBRqhkKQAA--.11008S3;
	Mon, 25 May 2026 17:53:27 +0800 (CST)
Subject: Re: [PATCH v2 net] LoongArch: KVM: Add missing slots_lock for IO bus
 device register/unregister
To: Zeng Chi <zeng_chi911@163.com>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, kernel@xen0n.name, kees@kernel.org,
 siyanteng@cqsoftware.com.cm, maqianga@uniontech.com, gaosong@loongson.cn,
 yury.norov@gmail.com
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, zengchi@kylinos.cn
References: <20260518094521.138692-1-zeng_chi911@163.com>
 <20260525092633.1706633-1-zeng_chi911@163.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <75a7525a-28d9-fdcb-a696-e56942530e7c@loongson.cn>
Date: Mon, 25 May 2026 17:50:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260525092633.1706633-1-zeng_chi911@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeAWHBRqhkKQAA--.11008S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGry7uF18uw48Kw48ur43twc_yoWrJFW8pF
	45ua4q9r4rWrnrXrZ2qr1DWF4Uuanagw1rury8CFW7uF4qqryrtF95AFy5WFyq93yxuFW0
	qF15GFn0v3WUAabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2MKZDUUUU



On 2026/5/25 下午5:26, Zeng Chi wrote:
> From: Zeng Chi <zengchi@kylinos.cn>
> 
> kvm_io_bus_register_dev() and kvm_io_bus_unregister_dev() should be
> called under kvm->slots_lock. The unregister calls in ipi.c, pch_pic.c
> and eiointc.c were missing this protection. Add it to match the
> register side.
one small nit, the mail tile is [PATCH v2 net], I think it should be 
[PATCH v2] :)

> 
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> ---
>   arch/loongarch/kvm/intc/eiointc.c | 6 ++++++
>   arch/loongarch/kvm/intc/ipi.c     | 2 ++
>   arch/loongarch/kvm/intc/pch_pic.c | 2 ++
>   3 files changed, 10 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
> index 2ab7fafa86d5..2b14485d14a7 100644
> --- a/arch/loongarch/kvm/intc/eiointc.c
> +++ b/arch/loongarch/kvm/intc/eiointc.c
> @@ -645,10 +645,14 @@ static int kvm_eiointc_create(struct kvm_device *dev, u32 type)
>   
>   	device = &s->device_vext;
>   	kvm_iodevice_init(device, &kvm_eiointc_virt_ops);
> +	mutex_lock(&kvm->slots_lock);
>   	ret = kvm_io_bus_register_dev(kvm, KVM_IOCSR_BUS,
>   			EIOINTC_VIRT_BASE, EIOINTC_VIRT_SIZE, device);
> +	mutex_unlock(&kvm->slots_lock);
>   	if (ret < 0) {
> +		mutex_lock(&kvm->slots_lock);
>   		kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &s->device);
> +		mutex_unlock(&kvm->slots_lock);
>   		kfree(s);
>   		return ret;
>   	}

I prefer something like this, however it is only my personal option.
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -645,13 +645,16 @@ static int kvm_eiointc_create(struct kvm_device 
*dev, u32 type)

         device = &s->device_vext;
         kvm_iodevice_init(device, &kvm_eiointc_virt_ops);
+       mutex_lock(&kvm->slots_lock);
         ret = kvm_io_bus_register_dev(kvm, KVM_IOCSR_BUS,
                         EIOINTC_VIRT_BASE, EIOINTC_VIRT_SIZE, device);
         if (ret < 0) {
                 kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &s->device);
+               mutex_unlock(&kvm->slots_lock);
                 kfree(s);
                 return ret;
         }
+       mutex_unlock(&kvm->slots_lock);
         kvm->arch.eiointc = s;

@chenhuacai what is your option?

The others look good to me.

Regards
Bibo Mao
> @@ -667,8 +671,10 @@ static void kvm_eiointc_destroy(struct kvm_device *dev)
>   
>   	kvm = dev->kvm;
>   	eiointc = kvm->arch.eiointc;
> +	mutex_lock(&kvm->slots_lock);
>   	kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &eiointc->device);
>   	kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &eiointc->device_vext);
> +	mutex_unlock(&kvm->slots_lock);
>   	kfree(eiointc);
>   	kfree(dev);
>   }
> diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
> index 1f6ebbd0af5c..4fa0897d7bdb 100644
> --- a/arch/loongarch/kvm/intc/ipi.c
> +++ b/arch/loongarch/kvm/intc/ipi.c
> @@ -447,7 +447,9 @@ static void kvm_ipi_destroy(struct kvm_device *dev)
>   
>   	kvm = dev->kvm;
>   	ipi = kvm->arch.ipi;
> +	mutex_lock(&kvm->slots_lock);
>   	kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &ipi->device);
> +	mutex_unlock(&kvm->slots_lock);
>   	kfree(ipi);
>   	kfree(dev);
>   }
> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
> index aa0ed59ae8cf..175a630aceb4 100644
> --- a/arch/loongarch/kvm/intc/pch_pic.c
> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> @@ -481,7 +481,9 @@ static void kvm_pch_pic_destroy(struct kvm_device *dev)
>   	kvm = dev->kvm;
>   	s = kvm->arch.pch_pic;
>   	/* unregister pch pic device and free it's memory */
> +	mutex_lock(&kvm->slots_lock);
>   	kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &s->device);
> +	mutex_unlock(&kvm->slots_lock);
>   	kfree(s);
>   	kfree(dev);
>   }
> 

