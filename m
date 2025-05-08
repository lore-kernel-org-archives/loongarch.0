Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3DD2A1D8
	for <loongarch@lists.linux.dev>; Thu,  8 May 2025 05:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681854; cv=none; b=hxlRDoOw7laV9omthW04AltgEcUJRYOoLbEnwJpd6JZ+LsauN+appwEKuq49gGuzRivRFD8A4A9gSCgF8bSYgLgkASrTKtT352YSiJMs8LPKIJVq3K45xdAlZ1+39gR04cCrReg0GKSx77NaOPC+lX56pbU6iNvtynOMa1s+/qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681854; c=relaxed/simple;
	bh=PsVeIXpetmTJz2KsjyiCV+ChWzavZCMgq5gjCSPu0v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTSjUz1fFqJdI6yVecQLovd2lfPJi1w500FsoR/sz6GVUheGgHzTvXkscmko7X29QJ35lcw3gv3kmm2eQN41xWWzlH8kYNL9dPSA6KjH3HKFNjvfjroefa/BXZPHoh6G+bce9nBS4jLmSmIHi8lwwHDJFjbMkCfp5BWTvlJb8SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sgbcTdhi; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sgbcTdhi"
Message-ID: <ca0a9d8d-9a89-4727-9b4d-732f716b80fc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746681848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZo6AWSDFRctu1ZaTcXG+BO+4JLhZ2xI/KtfrNnkUX0=;
	b=sgbcTdhiEd2Voxrl6+XkTz1LW8FC9Pg2sVgFEN8ztOfnz+pcW4PnsGWLiZrOFenLkydu+M
	J5TtnXV4RBgXJAGSoVvMSHIuMYBi+QJj8NdsdY7PxqjyPoyBVGkUm/oX9TBizRYNir1LkG
	D+sKbl538LBnE7LZINiSfT03M0RYCKo=
Date: Thu, 8 May 2025 13:23:38 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] LoongArch: mm: remove redundant pte occupancy check
 in __set_fixmap()
To: george <dongtai.guo@linux.dev>, chenhuacai@kernel.org, kernel@xen0n.name
Cc: rppt@kernel.org, akpm@linux-foundation.org, dave.hansen@linux.intel.com,
 geert@linux-m68k.org, ptesarik@suse.com, guoweikang.kernel@gmail.com,
 maobibo@loongson.cn, loongarch@lists.linux.dev,
 George Guo <guodongtai@kylinos.cn>
References: <20250508030506.7076-1-dongtai.guo@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250508030506.7076-1-dongtai.guo@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/8/25 11:05 AM, george 写道:
> From: George Guo <guodongtai@kylinos.cn>
This is unnecessary. Please remove it.

Thanks,
Yanteng
> 
> This check could falsely report errors when PTEs are remapped:
> arch/loongarch/mm/init.c:204: bad pte 0000000107b601c3.
> 
> The check was unnecessary because:
> - Fixmap slots are designed to be reusable
> - Other architectures (x86/arm64) allow PTE overwrites
> - Callers are responsible for proper mapping management
> 
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>   arch/loongarch/mm/init.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index 06f11d9e4ec1..7b7e3b1aa00d 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -200,10 +200,6 @@ void __init __set_fixmap(enum fixed_addresses idx,
>   	BUG_ON(idx <= FIX_HOLE || idx >= __end_of_fixed_addresses);
>   
>   	ptep = populate_kernel_pte(addr);
> -	if (!pte_none(ptep_get(ptep))) {
> -		pte_ERROR(*ptep);
> -		return;
> -	}
>   
>   	if (pgprot_val(flags))
>   		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));

