Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263CC242D6A
	for <loongarch@lists.linux.dev>; Mon, 14 Jul 2025 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752487143; cv=none; b=tdcI3Z1dGA4DOrMvezDnKK3u312KHALahR1+NMDDPgHyPloeaW2LKnMA59/3cXVJ1WNwaEu2eGdfErzdtNcBF0mAvBHkXbcf97u66ZajGodnDJcwmnkiD9xylUEq5DNhC4RJ+4IXjhJF+WRH/BeTH2wMOMomf+pYiJc0zYbX0QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752487143; c=relaxed/simple;
	bh=lHk2IUnwJuUw4LIROoT7XX5z7h9Wq0IAV/QNY3bBi7k=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=UB817jElCPqYN6CVaRhcL8gHb9Bc9klyUfePL5/+0Lrm+pTZeav3OOPkaxv/5dVTS5uzSnGoLQd0cYTPX7KhjiX5f1IeIB9TFkAAeQqp1wI+D/T4V8/ohkLe7h+Fz+/a32PfmIBzKf+QBU05X/+8mHqnX+gHjG8+5zvh+lLq+GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxHHLi1HRovCopAQ--.20185S3;
	Mon, 14 Jul 2025 17:58:58 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxH8Lf1HRoTqsWAA--.5040S3;
	Mon, 14 Jul 2025 17:58:57 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Add some feature detection on host with
 3C6000
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250707035143.1979013-1-maobibo@loongson.cn>
Message-ID: <de4c715f-db47-70b5-91a7-a436bf3a1c1b@loongson.cn>
Date: Mon, 14 Jul 2025 17:57:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250707035143.1979013-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxH8Lf1HRoTqsWAA--.5040S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kry5CF17Kr4Uuw4DXw4UKFX_yoW8Aw17pF
	yDAF4kJr4Fkr1fAan5tw1q9r43Xa1Ikr4Fga429rW5Arn0qrykAr1kKr9ruFy5tw4rW34x
	uFnYkw4Yva1qqwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7pnQ
	UUUUU

Maybe it is too early to submit such patch :(

At least there is new CSR registers about AVEC feature which are not 
saved and restored in vCPU context switch function. And the AVEC feature 
in KVM is not tested also.

Regards
Bibo Mao

On 2025/7/7 上午11:51, Bibo Mao wrote:
> With 3C6000 hardware platform, hardware page table walking and avec
> features are supported on host. Here add these two feature detection
> on KVM host.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>   arch/loongarch/include/uapi/asm/kvm.h | 2 ++
>   arch/loongarch/kvm/vm.c               | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/arch/loongarch/include/uapi/asm/kvm.h b/arch/loongarch/include/uapi/asm/kvm.h
> index 5f354f5c6847..0b9feb6c0d53 100644
> --- a/arch/loongarch/include/uapi/asm/kvm.h
> +++ b/arch/loongarch/include/uapi/asm/kvm.h
> @@ -103,6 +103,8 @@ struct kvm_fpu {
>   #define  KVM_LOONGARCH_VM_FEAT_PMU		5
>   #define  KVM_LOONGARCH_VM_FEAT_PV_IPI		6
>   #define  KVM_LOONGARCH_VM_FEAT_PV_STEALTIME	7
> +#define  KVM_LOONGARCH_VM_FEAT_PTW		8
> +#define  KVM_LOONGARCH_VM_FEAT_AVEC		9
>   
>   /* Device Control API on vcpu fd */
>   #define KVM_LOONGARCH_VCPU_CPUCFG	0
> diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
> index edccfc8c9cd8..728b24a62f1e 100644
> --- a/arch/loongarch/kvm/vm.c
> +++ b/arch/loongarch/kvm/vm.c
> @@ -146,6 +146,14 @@ static int kvm_vm_feature_has_attr(struct kvm *kvm, struct kvm_device_attr *attr
>   		if (kvm_pvtime_supported())
>   			return 0;
>   		return -ENXIO;
> +	case KVM_LOONGARCH_VM_FEAT_PTW:
> +		if (cpu_has_ptw)
> +			return 0;
> +		return -ENXIO;
> +	case KVM_LOONGARCH_VM_FEAT_AVEC:
> +		if (cpu_has_avecint)
> +			return 0;
> +		return -ENXIO;
>   	default:
>   		return -ENXIO;
>   	}
> 

