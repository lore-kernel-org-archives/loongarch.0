Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C013C2F
	for <loongarch@lists.linux.dev>; Mon,  7 Jul 2025 05:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751865652; cv=none; b=Ym5NAc5b+qRmqsTv17TLN3U/iZYXtYHLRmOKvHbUhcxy3es1jngUXmGHHagI2yUgaUEsArJnuHOEqcCAFqweOAtdZy2wWHcZyeeZNsQWlAk4GN9AvlTGZV1Bf+vWEXsrdX02GHO5o/gb63QCgR8fwnyOh3Q0GECcYz1uvedSNl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751865652; c=relaxed/simple;
	bh=XrClrX/nEf0YWvPsWg5bqf8P1996WjPOwqrihIHRpaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9hWTXbwS/8Gq8tbaqpOzuoXf/awysAz2JwhydQy/7A8qVX7cFE/vLSRHZGg4J63O5CiTIdmU4DKzfXqgoK9xKWjLqq0M2mXN07tfACO9/WKhhp/YWZWLqNnr01B3FiD7QFidUujcEHIw0TBpH/XARzmDPIJKJrXPAAedks3qtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AMtGmCKy; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AMtGmCKy"
Message-ID: <85f2fdc0-a624-4aaa-9ab4-14be45864f5f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751865647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tcV7bNjrkAkk7dneD01bWPinJ5BTlr1h2gpNebjCFUs=;
	b=AMtGmCKylVAw6fCdsCBxnPtk8IOI3JNTz7bF1oUsKedbvBKGIQ9kllWS/tBe4ZiMevjgsJ
	cIX3aVVBqgaqhDnX4FlPcwd8Kdg5yFLTqtbPWJXwwoktjtvRO9KShFx6rZ6p/HY9SggFqq
	azOUFGQLEvuF0dN8a7vfn0AYnIIPvOI=
Date: Mon, 7 Jul 2025 13:20:37 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: KVM: Add some feature detection on host with
 3C6000
To: Bibo Mao <maobibo@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250707035143.1979013-1-maobibo@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250707035143.1979013-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 7/7/25 11:51 AM, Bibo Mao 写道:
> With 3C6000 hardware platform, hardware page table walking and avec
> features are supported on host. Here add these two feature detection
> on KVM host.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>

Thanks,
Yanteng
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

