Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF7A296BBC
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 03:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774235813; cv=none; b=gqkMch8vwkqG58YVVhp6le+NtgmZlZ4oLC9SNeSQGibtTTuLwyHm1AjBDBgLLxZFLb5ws64h12/iWEPE/GzuJ6BhR6niyHT8qn9PfxFlD/s3s/rvbiPvHaVwdTflRwlK2A0m2tDGZ5rrwdYPXb3PjI8AE2cZOyUMR1vwoqgZdeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774235813; c=relaxed/simple;
	bh=YuVQUXfe8MAM+ZjW6m/Dc5BJWsK8geS7PtG88iyPWyA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=oSeb5F+tU6vmNI8azYGTWjMDjM6wKIuzgyht+yTSsrCX+0mE/lSKINqhD3zPakuo5xWa9iEYY7uH0TVgNaVuaroM3tp0ZcRp0K1sxYEL3wsAN+HKfrIaHJ122u6fpWt+iPdrggl6isQVMQY51RoEOimwMrHiFP/blWeV8TZG28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxmsKisMBpEKgdAA--.20073S3;
	Mon, 23 Mar 2026 11:16:50 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxB8GgsMBpRhFbAA--.29168S3;
	Mon, 23 Mar 2026 11:16:49 +0800 (CST)
Subject: Re: [PATCH 2/2] LoongArch: KVM: Handle the case that EIOINTC's
 coremap is empty
To: Huacai Chen <chenhuacai@loongson.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org,
 Aurelien Jarno <aurel32@debian.org>
References: <20260322135346.3720577-1-chenhuacai@loongson.cn>
 <20260322135346.3720577-2-chenhuacai@loongson.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <faf3a249-4290-8d91-8a28-738af28032c1@loongson.cn>
Date: Mon, 23 Mar 2026 11:14:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260322135346.3720577-2-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxB8GgsMBpRhFbAA--.29168S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF1kCF1kGr18XrW5WFy5Jrc_yoW8Gr1DpF
	W7C393K3yrKFy5Xa48tayfWF47Zr95Wr1IqF1UKFyUAFn8XF15XrWrZrs8XFn3C34rKF40
	qF1rKw109a1UAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EeHDUUUUU==



On 2026/3/22 下午9:53, Huacai Chen wrote:
> EIOINTC's coremap in eiointc_update_sw_coremap() can be empty, currently
> we get a cpuid with -1 in this case, but we actually need 0 because it's
> similar as the case that cpuid >= 4.
> 
> This fix an out-of-bounds access to kvm_arch::phyid_map::phys_map[].
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 3956a52bc05bd81 ("LoongArch: KVM: Add EIOINTC read and write functions")
> Reported-by: Aurelien Jarno <aurel32@debian.org>
> Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131431
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/kvm/intc/eiointc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
> index d2acb4d09e73..c7badc813923 100644
> --- a/arch/loongarch/kvm/intc/eiointc.c
> +++ b/arch/loongarch/kvm/intc/eiointc.c
> @@ -83,7 +83,7 @@ static inline void eiointc_update_sw_coremap(struct loongarch_eiointc *s,
>   
>   		if (!(s->status & BIT(EIOINTC_ENABLE_CPU_ENCODE))) {
>   			cpuid = ffs(cpuid) - 1;
> -			cpuid = (cpuid >= 4) ? 0 : cpuid;
> +			cpuid = ((cpuid < 0) || (cpuid >= 4)) ? 0 : cpuid;
>   		}
>   
>   		vcpu = kvm_get_vcpu_by_cpuid(s->kvm, cpuid);
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

