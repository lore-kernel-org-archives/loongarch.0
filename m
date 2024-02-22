Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA57B41212
	for <loongarch@lists.linux.dev>; Thu, 22 Feb 2024 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708603152; cv=none; b=i2O/9mgub/eZhV5v/zA+/ds8mPrqic851Q+QUXHeT1yLTa12DEdz905BPLWjz/8bvYBTDVnDV9rd8n0Hi54oI1CECYMRd7BIL/1fIz6eaPshHodhSQeSEf85sNN16E3ReMkKVYiXvFKZk290e/jw825h/X/gPyr44KBA0jRdKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708603152; c=relaxed/simple;
	bh=lAlR1MpRJtgLUp8F9iTL0liBr+p7INogvN8UsHKVfI0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=AM/m9qZHZumFYKBCGK0y+Tm1fFLgJSntfTcZ5i87dIhbjTWqO/6LsHpkzRXVImtsOIn5nuTi4/R1MnI7nMze0g1MiWY8eG7RMXVYlaJt4cFyguvNwYHCSMaMrRCey7z3cqGB/8c2Ah+jS/HNqkey7u4O2Hi7dv5YCEaw61rmkwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8DxqegKN9dlZjMQAA--.22413S3;
	Thu, 22 Feb 2024 19:59:06 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxnhMJN9dl1sg+AA--.43078S3;
	Thu, 22 Feb 2024 19:59:05 +0800 (CST)
Subject: Re: [PATCH for-6.8 v4 2/3] LoongArch: KVM: Rename _kvm_get_cpucfg to
 _kvm_get_cpucfg_mask
To: WANG Xuerui <kernel@xen0n.name>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 WANG Xuerui <git@xen0n.name>
References: <20240222105109.2042732-1-kernel@xen0n.name>
 <20240222105109.2042732-3-kernel@xen0n.name>
From: maobibo <maobibo@loongson.cn>
Message-ID: <9e738ae8-8209-f194-9d4e-692c8b107ba5@loongson.cn>
Date: Thu, 22 Feb 2024 19:59:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240222105109.2042732-3-kernel@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxnhMJN9dl1sg+AA--.43078S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw1fCF45Gw4DuFy5Aw17XFc_yoW8Xr45pF
	47Can0gr4FyF17Wa4vy3yDK3y7XrZrKryxtF92k34vkFs8tr10qrW8KrZ2qr15C3s3AF48
	XayftF4YvanrA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F
	4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	csjjDUUUU



On 2024/2/22 下午6:51, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
> 
> The function is not actually a getter of guest CPUCFG, but rather
> validation of the input CPUCFG ID plus information about the supported
> bit flags of that CPUCFG leaf. So rename it to avoid confusion.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   arch/loongarch/kvm/vcpu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 7fd32de6656b..9f63bbaf19c1 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -298,7 +298,7 @@ static int _kvm_setcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 val)
>   	return ret;
>   }
>   
> -static int _kvm_get_cpucfg(int id, u64 *v)
> +static int _kvm_get_cpucfg_mask(int id, u64 *v)
>   {
>   	if (id < 0 || id >= KVM_MAX_CPUCFG_REGS)
>   		return -EINVAL;
> @@ -339,7 +339,7 @@ static int kvm_check_cpucfg(int id, u64 val)
>   	u64 mask = 0;
>   	int ret;
>   
> -	ret = _kvm_get_cpucfg(id, &mask);
> +	ret = _kvm_get_cpucfg_mask(id, &mask);
>   	if (ret)
>   		return ret;
>   
> @@ -567,7 +567,7 @@ static int kvm_loongarch_get_cpucfg_attr(struct kvm_vcpu *vcpu,
>   	uint64_t val;
>   	uint64_t __user *uaddr = (uint64_t __user *)attr->addr;
>   
> -	ret = _kvm_get_cpucfg(attr->attr, &val);
> +	ret = _kvm_get_cpucfg_mask(attr->attr, &val);
>   	if (ret)
>   		return ret;
>   
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

