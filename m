Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADE3242D6B;
	Wed,  6 May 2026 01:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778032275; cv=none; b=X30kmcA1Kl+XcCogtZ8WTJBcPV4O4y7OD9WWfp2FlKzy/Yh75zf6+zr2vCJdoeu2VeFz2KCi3Ehn6QSQ2INv+msS+xz6kGI7USXk6lHhf++HwMUK5F3Xvx91g9mRfiQqOlgVBkDhIzCWHlM7OB1kvuV9q8CSZ3Z68jX0++xPgQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778032275; c=relaxed/simple;
	bh=rZGbP7UVSJQLbomugjy0SBe34Yd1bEsmhshX1oItOXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVHXrqpjvDVEr2BnKanJahYTTdJPpWfTHjWs0f5PeIsc3x39iRTeT0+QCpnpllxFKzjYtoQQTeiAW+syAE/AhcV65SLLOQK7td7s1/u1ne/D1esi5CHDoD29I0n5V9AXoGgPPQh08k64WaDZNcHv0YUOVLX4819//ur3mJM+w3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKnMC9Af; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKnMC9Af"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E996C2BCB4;
	Wed,  6 May 2026 01:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778032274;
	bh=rZGbP7UVSJQLbomugjy0SBe34Yd1bEsmhshX1oItOXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKnMC9Af9zyMVkAZ3683otI/LgubBaZvrCRPg4y2mubUZ8JHFwvPcQC4rztW27bOm
	 kOm7cwUT07yU8UYQz4zLdvuVbzLSWaprXSNOZzVhfuTni8P0PxH6BM681/2D3j+/ob
	 CjALN1Mhcgdob4ftf2pzjZp9Nh3j3IM3tQcpEi8mRqDKrm54QcW1LESyIla3EGmwip
	 H29FY6TLiKOswKlzYRB6BS9cvZJm/2U96hMnZzDeAv/wkdgs+f2Shuf6VeUsJOdB2X
	 0hAMQ1Je+3KqqL6lZe4Hn8OJ8OSJJzIz8HlF9vIFq8Ywqbs/TkTcDj9dNhN/KGiB90
	 +HV47N+hmO7/Q==
Date: Tue, 5 May 2026 20:51:12 -0500
From: Rob Herring <robh@kernel.org>
To: Chen Wandun <chenwandun1@gmail.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, akpm@linux-foundation.org,
	bhe@redhat.com, rppt@kernel.org, pasha.tatashin@soleen.com,
	pratyush@kernel.org, ruirui.yang@linux.dev, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, saravanak@kernel.org,
	chenwandun@lixiang.com, zhaomeijing@lixiang.com, everyzhao@126.com
Subject: Re: [PATCH 02/11] of: reserved_mem: reject reserved memory outside
 physical address range
Message-ID: <20260506015112.GA286568-robh@kernel.org>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-3-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065831.1510858-3-chenwandun@lixiang.com>

On Wed, Apr 29, 2026 at 02:58:22PM +0800, Chen Wandun wrote:
> early_init_dt_reserve_memory() does not validate whether the region
> falls within physical memory. If a device tree incorrectly specifies a
> reserved memory region outside the physical address range:
> 
>  - For the non-nomap path, memblock_reserve() blindly adds the region
>    to memblock.reserved, creating a stale entry that refers to
>    non-existent memory.
> 
>  - For the nomap path, memblock_mark_nomap() silently fails to match
>    any region in memblock.memory, but still returns success.
> 
> Add a memblock_overlaps_region() check at the entry of
> early_init_dt_reserve_memory() to reject such regions before any
> memblock operation takes place. This also simplifies the existing nomap
> guard: the original "overlaps && is_reserved" condition reduces to just
> "is_reserved", since the overlap with physical memory is already
> guaranteed by the new check.

While I agree, I suspect we already have cases abusing reserved-memory 
like this.

> 
> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
> ---
>  drivers/of/of_reserved_mem.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 9d1b0193864c..03c676052dab 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -112,14 +112,21 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
>  static int __init early_init_dt_reserve_memory(phys_addr_t base,
>  					       phys_addr_t size, bool nomap)
>  {
> +	if (!memblock_overlaps_region(&memblock.memory, base, size)) {
> +		phys_addr_t end = base + size - 1;
> +
> +		pr_warn("Reserved memory region %pa..%pa is outside of physical memory\n",
> +			&base, &end);
> +		return -EINVAL;
> +	}
> +
>  	if (nomap) {
>  		/*
>  		 * If the memory is already reserved (by another region), we
> -		 * should not allow it to be marked nomap, but don't worry
> -		 * if the region isn't memory as it won't be mapped.
> +		 * should not allow it to be marked nomap. The region being
> +		 * physical memory is guaranteed by the overlap check above.
>  		 */
> -		if (memblock_overlaps_region(&memblock.memory, base, size) &&
> -		    memblock_is_region_reserved(base, size))
> +		if (memblock_is_region_reserved(base, size))
>  			return -EBUSY;
>  
>  		return memblock_mark_nomap(base, size);
> -- 
> 2.43.0
> 
