Received: from mta1.migadu.com (out-64.mta1.migadu.com [95.215.58.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E60A3AC0D9
	for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 04:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151872; cv=none; b=W3IH0XXmpmHeyFeyiYiQSG0oTqf8tfrCcIhPjl5552ZL3fGmi1ijc6zxJhTCfTeDMEKzztQH+XDIV2X0xqf6XNGlX+c5LhdNPaQn71sm85/QSs1UvqITor/kRA4KfOflo/6xEDwOFbfKb6mPHNcjiE7Luqvtr4dpuJeEe4hAzzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151872; c=relaxed/simple;
	bh=AcF1yxm9rT2KMssISiyjtOURrrincnoiFbuUpLLOO0A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZOmy2xF8zDdqVPKSYnagdUN8byDoIdc/rvOnfGJAp52cwr2WMSkeaOk0SYdh+zmQVWHoQyj1JfnfPwHwL/tkyWN+lg87O0U3LlxF7ZIpKeHIdL53C32/Vvu0xLAagNLVwvhY0wca6HytX/3iAykjDid/TCE6qjy6D66iCyR1lm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lkv66w/r; arc=none smtp.client-ip=95.215.58.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lkv66w/r"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=AcF1yxm9rT2KMssISiyjtOURrrincnoiFbuUpLLOO0A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788151867; v=1; x=1788756667;
 b=Lkv66w/rZIDGCWWR4IfP827bsrYokzTfSmoNx61LJYLlVxeHst9/9swFTPsRj2C/+I3WCZZq
 kO+zNseKHBYfrUT6U2ziGCzwKLniX6X8GHWD0RphBtOFd5olTky/NwvkEQOqGs7O7+ykV/hJpoM
 7HprNF7X7wwrXA9pdxsayqMI=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 10f2ff9aafc7c54e;
	Mon, 31 Aug 2026 04:50:57 +0000
X-Mizu-Trace-ID: 10f2ff9aafc7c54e
X-Migadu-Flow: FLOW_OUT
Message-ID: <fa3e1ee9-beb3-42f4-9034-8e065f343c05@linux.dev>
Date: Mon, 31 Aug 2026 12:50:53 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, yury.norov@gmail.com, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, zengchi@kylinos.cn,
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] LoongArch: KVM: Validate MSI data before routing it to
 EIOINTC
To: Zeng Chi <zeng_chi911@163.com>, zhaotianrui@loongson.cn,
 maobibo@loongson.cn, chenhuacai@kernel.org
References: <20260828093604.56622-1-zeng_chi911@163.com>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260828093604.56622-1-zeng_chi911@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/28 17:36, Zeng Chi 写道:
> From: Zeng Chi <zengchi@kylinos.cn>
> 
> pch_msi_set_irq() passes e->msi.data straight into eiointc_set_irq() as
> the irq number.  The MSI data comes from userspace, either via a
> KVM_IRQ_ROUTING_MSI entry set with KVM_SET_GSI_ROUTING (used by irqfd
> and KVM_IRQ_LINE) or directly via KVM_SIGNAL_MSI, and is never checked
> against EIOINTC_IRQS.
> 
> eiointc_set_irq() uses the value with __set_bit()/__clear_bit() on the
> 256-bit isr bitmap, eiointc_update_irq() then indexes sw_coremap[] and
> the per-cpu coreisr/sw_coreisr bitmaps with it.  A data value >= 256
> therefore reads and writes memory past the end of those arrays, i.e.
> any process holding a VM fd can corrupt kernel memory beyond the
> loongarch_eiointc allocation.
> 
> Reject MSI data that doesn't fit in the EIOINTC irq space.  The DMSINTC
> path is unaffected as it decodes the vector from the address and masks
> it.
> 
> Fixes: 1928254c5ccb ("LoongArch: KVM: Add irqfd support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260531140921.1B1181F00893@smtp.kernel.org/
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> ---
>  arch/loongarch/kvm/intc/pch_pic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
> index e7b77705c516..81fb534ce8dd 100644
> --- a/arch/loongarch/kvm/intc/pch_pic.c
> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> @@ -78,6 +78,9 @@ int pch_msi_set_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e, int
>  		return dmsintc_set_irq(kvm, msg_addr, e->msi.data, level);
>  	}
>  
> +	if (e->msi.data >= EIOINTC_IRQS)
> +		return -EINVAL;
> +
>  	eiointc_set_irq(kvm->arch.eiointc, e->msi.data, level);
>  
>  	return 0;
Nice fix, thanks!

Reviewed-by: Tao Cui <cuitao@kylinos.cn>

BTW, the NULL deref in pch_pic_update_irq() that Sashiko mentioned is
a pre-existing issue — it might be worth addressing in a separate
patch:
https://lore.kernel.org/all/20260828100204.CC38D1F000E9@smtp.kernel.org/

