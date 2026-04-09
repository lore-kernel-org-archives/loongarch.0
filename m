Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D58733E34B
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 06:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775716508; cv=none; b=cA/rmm+zRC5MLHIgDb3qK5/s7nBk979WsVvR/VvMIZrwfDfmoU+6NI5o49pJTed2ngqXudpyZhcnNFPkRZtoJHwbZkaL+qqe7Ah47XP1lR6FBEl66r5AJnzeGaYkCGmgw+A8P7RkkAcjjYdBLQ3Awbe+AHG19cPkEvLmSwaP6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775716508; c=relaxed/simple;
	bh=m/ottLhq7IvhEE6is/OMjv1qp6ppppCUsCQiFgl95XI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=tuaLsu0EWHT0yCyanDo8MH1oBJjldzK0VuoZ0YoUwQr8PAgyU3dPkUlgXnvNsCxbG+ACS3qYcbuKUK6L3htdy0uf7xs+nAX03LDCCGH3/+cRC9TmbubuSq+LavV0SQcktLrJklPeM6RXOHN33hy0s2dG8d/2pAEzgZueLgYLoX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxnsOMSNdpT3UjAA--.33683S3;
	Thu, 09 Apr 2026 14:34:53 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxWcGMSNdp60JpAA--.56844S3;
	Thu, 09 Apr 2026 14:34:52 +0800 (CST)
Subject: Re: [PATCH] LoongArch/KVM: Use CSR_CRMD_PLV instead of CSR_PRMD_PPLV
 in kvm_arch_vcpu_in_kernel
To: cuitao <cuitao@kylinos.cn>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, loongarch@lists.linux.dev
Cc: kernel@xen0n.name
References: <20260409042255.31338-1-cuitao@kylinos.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <b616ef68-2dae-0e6c-65d4-72a8d33af690@loongson.cn>
Date: Thu, 9 Apr 2026 14:32:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260409042255.31338-1-cuitao@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxWcGMSNdp60JpAA--.56844S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF18Kw4xKr45CF4UArW3twc_yoWfZFb_Jw
	1xuw4UKrWktws2q3WrG395Gryagw4kKFZ09a47Zrn7twn8Jwnxuw4kW3Z5ZFy5KrW7CFZ8
	Z39FgasxC343tosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2G-eUUUUU



On 2026/4/9 下午12:22, cuitao wrote:
> The function reads LOONGARCH_CSR_CRMD but uses CSR_PRMD_PPLV to
> extract the privilege level. While both masks have the same value
> (0x3), CSR_CRMD_PLV is the semantically correct constant for CRMD.
> 
> Signed-off-by: cuitao <cuitao@kylinos.cn>
> ---
>   arch/loongarch/kvm/vcpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 831f381a8fd1..ed2cfcd76f60 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -402,7 +402,7 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
>   	val = gcsr_read(LOONGARCH_CSR_CRMD);
>   	preempt_enable();
>   
> -	return (val & CSR_PRMD_PPLV) == PLV_KERN;
> +	return (val & CSR_CRMD_PLV) == PLV_KERN;
>   }
>   
>   #ifdef CONFIG_GUEST_PERF_EVENTS
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

