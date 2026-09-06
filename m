Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B0D1A6836;
	Sun,  6 Sep 2026 20:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725279; cv=none; b=KLjc8GtGYqUXAVZaumW2yu+ZcBpqfibD0/lkz0pz4eiNEpl8blx+T8+CP+iVDVznsii7ZJg6UD79uTJ9+qcMubtboJPUVuy+Cl1bXj1GkW/jV3CT87hEuIfPOZQKEzfh1MxvHCd4UHLfnrIwW+u5C7x9rDwJAma+oOOTf1+Aphs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725279; c=relaxed/simple;
	bh=vsENwLhouOb64M0cWD/36iHJxZV/i8dC8fcvurpdylA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGtgNr4xtvZ/VG3n2OJBSfi4beJw4Q7LuqiRZ3azCa0yX47uDcsCtQAjjF1TGvAmb9uC7NXeJmWc9Dl5vitkP9lU741/tg0quUIt5W1tOSoiRUapCPojQ+3WieMnAdCmlocEhbL8/d1faAQIPvmO6bHXSSEa5LOYkKiytWAQD+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqoOuRgR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqoOuRgR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AFA1F00A3A;
	Sun,  6 Sep 2026 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788725277;
	bh=6dLtZ4diiABDwf70eKATggUD/DCfK2UIavuZ29uFn94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RqoOuRgRG1enfRI1D9SjcgS9tKVhnFREjkX+IlSFfMW3MsqNns+AWPlyPdeEKBY7e
	 uG2BwFv3LXCAunkIOcVcViIXknbGSpB/bAjMbYO+mF2ZGpYOTTsSbcswzh6Fk7Bspk
	 xoRdD8yV3EJZtO7zX2zPJxTGqrjmO5vXSbfXu6LB+CQU0sfi3Y3uUHxZppAMqYvAoR
	 5eXN/m+EszZdq0meyMub1OCprX5zkG3e4PePLPkwZ7ydRDpkCPRWlF/F33DUyD2oX9
	 OdIfAzYrAWfx2F44BxBIa/LZtftjfA4FnjPC4YITR6DlSoZQynoO34dyoQrkzp6mLU
	 e9LTmn9kZa7gA==
Date: Sun, 6 Sep 2026 23:07:49 +0300
From: Mike Rapoport <rppt@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	changyuanl@google.com, akpm@linux-foundation.org,
	chenhuacai@kernel.org, liukexin@kylinos.cn, guodongtai@kylinos.cn,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] liveupdate: kho: calculate per-node scratch sizes
 before allocation
Message-ID: <ap3IFd2FVvfKkHkV@kernel.org>
References: <20260904025101.9959-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904025101.9959-1-dongtai.guo@linux.dev>

Hi George,

On Fri, Sep 04, 2026 at 10:51:01AM +0800, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> The default percentage-based policy sizes scratch areas from the current
> kernel's MEMBLOCK_RSRV_KERN footprint. This is a reasonable heuristic for
> predicting the early memory demand of the next kernel.
> 
> scratch_size_update() calculates the lowmem and global sizes before either
> area is allocated. However, kho_reserve_scratch() calculates each per-node
> size only after allocating the lowmem and global areas. Since memblock
> allocations are marked MEMBLOCK_RSRV_KERN, the per-node calculation
> includes those newly allocated scratch areas and scales them again.
> 
> This feedback substantially inflates the per-node request. On a 1 GiB
> LoongArch QEMU guest, the relevant reservation baseline is about
> 98.45 MiB. With the default 200% scale and 32 MiB alignment, the old
> ordering allocates 224 MiB of lowmem scratch, then requests 672 MiB for
> node 0, for a total of 896 MiB. The node allocation fails and KHO is
> disabled. The same incorrect calculation is hidden on the tested 1 GiB
> x86 guest because its baseline is smaller and its memory map can satisfy
> the inflated request.
> 
> Calculate and save all per-node sizes in the scratch descriptors before
> reserving any scratch areas, then use the saved sizes during allocation.
> This keeps the percentage heuristic while preventing scratch memory from
> becoming input to the sizing of more scratch memory. On the LoongArch
> guest, the aligned total is reduced from 896 MiB to 448 MiB.
> 
> The KHO vmtest passes on 1 GiB LoongArch and x86 QEMU guests with this
> change.

This reads as LLM-generated text. Please add LLM attribution as per 

https://docs.kernel.org/process/coding-assistants.html#attribution
 
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Reported-by: Kexin Liu <liukexin@kylinos.cn>
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  kernel/liveupdate/kexec_handover.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 7c4d86daf86d..39f489a258d9 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -847,6 +847,17 @@ static void __init kho_reserve_scratch(void)
>  		goto err_disable_kho;
>  	}
>  
> +	/*
> +	 * Calculate the per-node sizes before reserving any scratch areas.
> +	 * memblock allocations are marked MEMBLOCK_RSRV_KERN, so calculating
> +	 * them later would count the lowmem and global scratch areas as kernel
> +	 * allocations and scale them again.
> +	 */
> +	i = 2;
> +	for_each_node_state(nid, N_MEMORY)
> +		kho_scratch[i++].size = scratch_size_node(nid);
> +	i = 0;

Ugh, this really does not look nice.
Can't we just calculated all the sizes first and than do the allocations?

> +
>  	/*
>  	 * reserve scratch area in low memory for lowmem allocations in the
>  	 * next kernel
> @@ -880,7 +891,7 @@ static void __init kho_reserve_scratch(void)
>  	 * memoryless nodes, as we can not allocate scratch areas there.
>  	 */
>  	for_each_node_state(nid, N_MEMORY) {
> -		size = scratch_size_node(nid);
> +		size = kho_scratch[i].size;
>  		addr = memblock_alloc_range_nid(size, SCRATCH_ALIGNMENT_BYTES,
>  						0, MEMBLOCK_ALLOC_ACCESSIBLE,
>  						nid, true);
> -- 
> 2.53.0
> 

-- 
Sincerely yours,
Mike.
