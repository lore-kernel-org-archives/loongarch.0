Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035251ACECE
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738083472; cv=none; b=OpZUkM1Im6e6gtLVNu2hFyYzOpluN+nuXL4W5vLTFwVBFnlvFkEAPcT/P29tUXsxEpYnd/Kbnd+OKHD33Q5RkcOtd3sWTw2JJ44zbn+4+LMGa7Uhf7vKdmIwTynefpzKtJ8xHNba8FF8B0pkEw0Dna829zGCo64a0YZRapw06Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738083472; c=relaxed/simple;
	bh=zY4gduqpU2Rv7ahjxQZKNIlZS6G+ICACQmU7QQcqJco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STpAsXKFdpxp3AEI75PEwh+JAsa7f2l0Y0GUrnErU2xvOGYlvf3TjMeDWkx88IamckSyFy7wn1g/Zx0AXeIWRnwV1aDSeJGerMqIMyoHGry+6jw8JggHNKdownrrYbj6bnTHVwFbbeVMOFYTfHp7VdXjFmXg1bwPe1+w3Mj2r9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZmLyyFsU; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZmLyyFsU"
Date: Tue, 28 Jan 2025 08:57:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738083464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UJM4fHd4QgXwBIdDd5lWS+VoekouXbBB1gvLIIgshRg=;
	b=ZmLyyFsUu1pFHUnP9ATjSxTqTRhCmn93P+STr2O959r3dtEE6ICtgSBT8OYkBpvsIYfANt
	fvG8+/5omH7/UXz3tYpxLPEcSayT75skcmXZFGu4gzlBPBczXoPax9eN9pMzC/mVCBRUL/
	N49DS1h34uWtaNCYLj9UqWH9lgsf5Bs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vitaly Wool <vitaly.wool@konsulko.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
Message-ID: <b2txiy4sggqlmvdunv4xacciu2klcgfdzq3rp4y3vzbo27ugsq@few2vub23zmj>
References: <Z5gdnSX5Lv-nfjQL@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5gdnSX5Lv-nfjQL@google.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Jan 27, 2025 at 11:58:21PM +0000, Yosry Ahmed wrote:
> The zbud compressed pages allocator is rarely used, most users use
> zsmalloc. zbud consumes much more memory (only stores 1 or 2 compressed
> pages per physical page). The only advantage of zbud is a marginal
> performance improvement that by no means justify the memory overhead.
> 
> Historically, zsmalloc had significantly worse latency than zbud and
> z3fold but offered better memory savings.  This is no longer the case as
> shown by a simple recent analysis [1].  In a kernel build test on tmpfs
> in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the cost
> of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
> sense for zbud in any practical scenario.
> 
> The only alleged advantage of zbud is not having the dependency on
> CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
> zbud is only used by zswap.
> 
> Following in the footsteps of [2], which deprecated z3fold, deprecated
> zbud as planned and remove it in a few cycles if no objections are
> raised from active users.
> 
> Rename the user-visible config options so that users with CONFIG_ZBUD=y
> get a new prompt with explanation during make oldconfig. Also, remove
> CONFIG_ZBUD from defconfig.
> 
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google.com/
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
