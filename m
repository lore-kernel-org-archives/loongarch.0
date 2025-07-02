Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BFD18D656
	for <loongarch@lists.linux.dev>; Wed,  2 Jul 2025 02:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422318; cv=none; b=AZd8/F4pMGpdhSRiV9gVk+sagrDB0SiteVQNqT4FOPpLKaX07G9JYfeD5GEPAjBz3tZJ1EdbkamIrk9S4DQ3r9mI9/8TrEQH0zfW+Hf/enTpW06xNOWve5tY5YQSHt7oVYMiGziQbfcf2iKXljZLG+MSnLZrtGJ+Uf2+7DNk6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422318; c=relaxed/simple;
	bh=oK1Shwu4Lk05/QEqU2lnVfOho5aeA6R+7xSGIYM5wck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwPwMR6waDTdzoOV7Xn//P2K6wXEVXzQxdaXls54h9dJzh2+rm/xO/h0Hi6ZW5FUEAYc4UF0V7UrLZ5h0gf7LFkp65NWXUcLnGA4+/VdUqeuJbHWGArE8YEaUCVUolQxatAc6zClJyeEc99d/pX43UqcQz50KMFQzcHlP8KsxE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=awnVcTwi; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="awnVcTwi"
Message-ID: <0561da2c-a4d7-49bb-8394-930f10880610@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751422314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44R59HWijpEJxOJR76qd3Y0z7tg9JtGI0wJfTjFw3So=;
	b=awnVcTwiZOD+NS68d0yzctO3ap+VvoitOCfZcBxGLAXq4+6NaL0AQroj8lB9t1LI4ceed7
	GFjbfckKg/pPmIEyzML8g+J0SdkexYUYVrlfXpXCa0h9UZSj9xzpZEMAnkJRAvxWvNIrrw
	Lmm3f6A4lg5Ze29PsyqRsiHTZrwoL1g=
Date: Wed, 2 Jul 2025 10:11:48 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: Support mem=SIZE kernel parameter
To: Ming Wang <wangming01@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Bibo Mao <maobibo@loongson.cn>, Hari Bathini <hbathini@linux.ibm.com>,
 Guo Weikang <guoweikang.kernel@gmail.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Usama Arif
 <usamaarif642@gmail.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: lixuefeng@loongson.cn, chenhuacai@loongson.cn, gaojuxin@loongson.cn
References: <20250701090449.2426151-1-wangming01@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250701090449.2426151-1-wangming01@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 7/1/25 5:04 PM, Ming Wang 写道:
> The LoongArch mem= parameter parser was previously limited to the
> mem=SIZE@START format. This was inconvenient for the common use case
> of simply capping the total system memory, as it forced users to
> manually specify a start address. It was also inconsistent with the
> behavior on other architectures.
> 
> This patch enhances the parser in early_parse_mem() to also support the
> more user-friendly mem=SIZE format. The implementation now checks for
> the presence of the '@' symbol to determine the user's intent:
> 
> - If mem=SIZE is provided (no '@'), the kernel now calls
>    memblock_enforce_memory_limit(). This trims memory from the top down
>    to the specified size.
> - If mem=SIZE@START is used, the original behavior is retained for
>    backward compatibility. This allows for defining specific memory
>    banks.
> 
> This change introduces an important usage rule reflected in the code's
> comments: the mem=SIZE format should only be specified once on the
> kernel command line. It acts as a single, global cap on total memory. In
> contrast, the mem=SIZE@START format can be used multiple times to
> define several distinct memory regions.
> 
> Signed-off-by: Ming Wang <wangming01@loongson.cn>
> ---
>   arch/loongarch/kernel/setup.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> index b99fbb388fe0..af59ba180dc2 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -191,6 +191,16 @@ static int __init early_parse_mem(char *p)
>   		return -EINVAL;
>   	}
>   
> +	start = 0;
> +	size = memparse(p, &p);
> +	if (*p == '@')	/* Every mem=... should contain '@' */
> +		start = memparse(p + 1, &p);
> +	else {			/* Only one mem=... is allowed if no '@' */
> +		usermem = 1;
> +		memblock_enforce_memory_limit(size);
> +		return 0;
> +	}
> +
>   	/*
>   	 * If a user specifies memory size, we
>   	 * blow away any automatically generated
> @@ -201,14 +211,6 @@ static int __init early_parse_mem(char *p)
>   		memblock_remove(memblock_start_of_DRAM(),
>   			memblock_end_of_DRAM() - memblock_start_of_DRAM());
>   	}
> -	start = 0;
> -	size = memparse(p, &p);
> -	if (*p == '@')
> -		start = memparse(p + 1, &p);
> -	else {
> -		pr_err("Invalid format!\n");
> -		return -EINVAL;
> -	}
I don't understand. Isn't it better to modify the else{} directly here?

Thanks,
Yanteng

