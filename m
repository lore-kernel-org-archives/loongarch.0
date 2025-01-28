Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC740F9F8
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 15:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738078247; cv=none; b=SAfc4N1ZxDoQUE+Z38UYejgj3Ju94l3bEOEtmPhSBmV8XWqKqOu+WzTHmx2Fct8nrLM7RCKmkKhqOxNUI2ukisIJAwznO6GiZiDqnZsjXUQMPpX+snfAsRuqVlDci/7y7J6ObCLWa/M/TV11eqOABWwwya9fSzPqENrJ0l7y1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738078247; c=relaxed/simple;
	bh=AtxV5mlsUBDXUDuOZCXYwx5qww0t4tsSrMrgwxeDwrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVqT9j1JeYm4L2TO50dLWhM1wiQ/Swl34tzs13CXvuYu8H0wPdDacqdF7npYEBvbErGnYp6+srRqrF2Z/5w2Vz75P8yslrVCa0WnI2ZsVV6C7p4bypIMFkHfcRciZI2iFx4r4b0KohlIJKA+F5WBkYVVqFpjhmXCetwA9omM5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ivdYqZiY; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ivdYqZiY"
Date: Tue, 28 Jan 2025 15:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738078243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MpQv8Hh0xINXsVuX3lZlqa25GjQTW93nhOM7BZmZ9s0=;
	b=ivdYqZiY5EgeWAuXkLXRy8MtRDyIJ79frDYwuNdm9/VXZwFzq/49VMduUCcL3QzJC/rTIf
	ez0I2MKAQCbzh3ZFiebLpUNpwDnOzYHl0CQlFY6vP8d8ZhUIkyv1tigrh+tii+nfrk956g
	DClZGfQs/DfeQtemfy/ooU73tywvMj4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Seth Jennings <sjenning@redhat.com>,
	Dan Streetman <ddstreet@ieee.org>, WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
Message-ID: <Z5j4HrzbT2sEOIqn@google.com>
References: <Z5gdnSX5Lv-nfjQL@google.com>
 <42b24914-719a-4ff1-9d77-f6517717344f@suse.cz>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42b24914-719a-4ff1-9d77-f6517717344f@suse.cz>
X-Migadu-Flow: FLOW_OUT

On Tue, Jan 28, 2025 at 11:21:10AM +0100, Vlastimil Babka wrote:
> On 1/28/25 00:58, Yosry Ahmed wrote:
> > The zbud compressed pages allocator is rarely used, most users use
> > zsmalloc. zbud consumes much more memory (only stores 1 or 2 compressed
> > pages per physical page). The only advantage of zbud is a marginal
> > performance improvement that by no means justify the memory overhead.
> > 
> > Historically, zsmalloc had significantly worse latency than zbud and
> > z3fold but offered better memory savings.  This is no longer the case as
> > shown by a simple recent analysis [1].  In a kernel build test on tmpfs
> > in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the cost
> > of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
> > sense for zbud in any practical scenario.
> > 
> > The only alleged advantage of zbud is not having the dependency on
> > CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
> > zbud is only used by zswap.
> > 
> > Following in the footsteps of [2], which deprecated z3fold, deprecated
> > zbud as planned and remove it in a few cycles if no objections are
> > raised from active users.
> > 
> > Rename the user-visible config options so that users with CONFIG_ZBUD=y
> > get a new prompt with explanation during make oldconfig. Also, remove
> > CONFIG_ZBUD from defconfig.
> > 
> > [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> > [2]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google.com/
> > 
> > Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> 
> Seems weird not to Cc the folks listed in MAINTAINERS for ZBUD? Unless their
> addresses are known to bounce?

Ugh I had them in the CC list, but I played around with it and probably
lost them :/

Seth, Dan, apologies.

> And ZRAM maintainers should also be Ccd?

ZRAM does not use zbud, I can definitely CC them but I don't want to be
a source of noise :)
