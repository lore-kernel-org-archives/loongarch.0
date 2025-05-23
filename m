Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B371A0BF3
	for <loongarch@lists.linux.dev>; Fri, 23 May 2025 06:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747982616; cv=none; b=ZTVf8RVXdxJH5BQkKHZmlxKhZMA/iaZr8uBPY0E7lT+M94WUtWBAcd6AjMA0OLyBt+yM9SjlhIxyBjatE+Mg1wyg0CLASosQWmabNhGFkTc7M2VyQHR8TzgFBui43Frw2aXdu2LnPrHWQuY8s8CFrCBOshf9tQVoiRw4E8bxjZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747982616; c=relaxed/simple;
	bh=K3LHh5smnTrZnCr6oGKjBk9SCGo95PI4g5B2KlxG7jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdVdo4gSihBtdkNafLwcVgQv7WYMDGNibFiZHCdErlS+IBMrOZXsM0UEF0t8BS2n73Y/ATMmiDnduof/DMP6yYXIShDHLuMNASBHUnN+QxSQN8F4oEmxtt75n3yL3zlAHxLWytU49ypHyw8z3ymUSFC7CmlXvSm8BQM0k+28cAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jB1Cz9ji; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jB1Cz9ji"
Message-ID: <c491ab26-dc44-4bc9-b481-29b4ba62f658@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747982610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJJ+pU32sx4Yy5ZF3W5MNBuswj8wCkrqLbPd3tq++B0=;
	b=jB1Cz9jiqVkv9BvLbBNgmCOtxZSMQbwz1d6pHZXR4QNG13vaLZqWjpkRAbfxLBxUtm8wUd
	+TyLBdLJR2sYg8L2DegSjzC+QdJHHeGjPwlziVju7AIvFtI1WeE0TYFjLKRqFjCdI7K0+b
	0adK55YH+Y+7lijAyVxRS5dlFPZ45Z8=
Date: Fri, 23 May 2025 14:43:23 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: Avoid using $r0/$r1 as "mask" for csrxchg
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, WANG Rui <wangrui@loongson.cn>
References: <20250522125050.2215157-1-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250522125050.2215157-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/22/25 8:50 PM, Huacai Chen 写道:
> When building kernel with LLVM there are occasionally such errors:
> 
> In file included from ./include/linux/spinlock.h:59:
> In file included from ./include/linux/irqflags.h:17:
> arch/loongarch/include/asm/irqflags.h:38:3: error: must not be $r0 or $r1
>     38 |                 "csrxchg %[val], %[mask], %[reg]\n\t"
>        |                 ^
> <inline asm>:1:16: note: instantiated into assembly here
>      1 |         csrxchg $a1, $ra, 0
>        |                       ^
> 
> The "mask" of the csrxchg instruction should not be $r0 or $r1, but the
> compiler cannot avoid generating such code currently. So force to use t0
> in the inline asm, in order to avoid using $r0/$r1.
> 
> Cc: stable@vger.kernel.org
> Suggested-by: WANG Rui <wangrui@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   arch/loongarch/include/asm/irqflags.h | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/irqflags.h b/arch/loongarch/include/asm/irqflags.h
> index 319a8c616f1f..003172b8406b 100644
> --- a/arch/loongarch/include/asm/irqflags.h
> +++ b/arch/loongarch/include/asm/irqflags.h
> @@ -14,40 +14,48 @@
>   static inline void arch_local_irq_enable(void)
>   {
>   	u32 flags = CSR_CRMD_IE;
> +	register u32 mask asm("t0") = CSR_CRMD_IE;
> +
>   	__asm__ __volatile__(
>   		"csrxchg %[val], %[mask], %[reg]\n\t"
>   		: [val] "+r" (flags)
> -		: [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD)
> +		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>   		: "memory");
>   }
>   
>   static inline void arch_local_irq_disable(void)
>   {
>   	u32 flags = 0;
> +	register u32 mask asm("t0") = CSR_CRMD_IE;
> +
>   	__asm__ __volatile__(
>   		"csrxchg %[val], %[mask], %[reg]\n\t"
>   		: [val] "+r" (flags)
> -		: [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD)
> +		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>   		: "memory");
>   }
>   
>   static inline unsigned long arch_local_irq_save(void)
>   {
>   	u32 flags = 0;
> +	register u32 mask asm("t0") = CSR_CRMD_IE;
> +
>   	__asm__ __volatile__(
>   		"csrxchg %[val], %[mask], %[reg]\n\t"
>   		: [val] "+r" (flags)
> -		: [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD)
> +		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>   		: "memory");
>   	return flags;
>   }
>   
>   static inline void arch_local_irq_restore(unsigned long flags)
>   {
> +	register u32 mask asm("t0") = CSR_CRMD_IE;
> +
>   	__asm__ __volatile__(
>   		"csrxchg %[val], %[mask], %[reg]\n\t"
>   		: [val] "+r" (flags)
> -		: [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD)
> +		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>   		: "memory");
>   }
>   

