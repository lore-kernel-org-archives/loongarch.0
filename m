Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F219546BF
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738082736; cv=none; b=fNnu0d6VciYdsDjcufAPN866Hi+hgSL/y5eamzcHHvmWp5CosjbbI+C7I8fI60saAmzJBfpitR+q9/yFvHU1Tj0DsQxuaY/DsJY2o3x8cC5JLB5Mll7Xehp4aQHngUSg/A3ehTSghZ/IyQJxqncQ4FjnwETsycvRtdn9TgQDw7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738082736; c=relaxed/simple;
	bh=cdU4GTM/bJvuqIR1zxMvjZ+i6L8USuTCMLnCGs7dnZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VD0Tapeh64Dbw2tMJ0swC6IIVKoYV9SW8AXP139ucc0uws/MX0N1dpwngIsD8KV1XfTmXZl0bcFgHMGKHQ5fRRg43UKaiKI4hb9MxVslT9vyUVDZEn5AbZSc26uxdGgKsWRsAHUQt2wcJONzhFMW6s9/nyYifoE7KkI/gdRxhm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dU4N4Rtd; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dU4N4Rtd"
Date: Tue, 28 Jan 2025 16:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738082730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFn2LRktG0Yh49QeDRr4sIglpLvhfNsWy0wwyTzZW7o=;
	b=dU4N4RtdaNXQdjsYxVWbiur5qO45uVfOc1rAYBA/k2e7UilCJWv/EKZkThc4R+Fj+NlLXx
	TxrCFFhqKRqApt47wQR3eRHw2rTDgDOFrFrVhdHPKOfjUCPT6E0OrzS5pc15SfK73+OHUN
	W7nMZ90raGJsKMl11CBoCpIcfcrc3Bo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Seth Jennings <sjenning@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Dan Streetman <ddstreet@ieee.org>, WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
Message-ID: <Z5kJpCtpfH3bJrbE@google.com>
References: <Z5gdnSX5Lv-nfjQL@google.com>
 <42b24914-719a-4ff1-9d77-f6517717344f@suse.cz>
 <Z5j4HrzbT2sEOIqn@google.com>
 <CAC8qmcDZ8DeXEX23N0Xscjg_wR6HKL=AVE_5Y+68gCeLzv4bEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC8qmcDZ8DeXEX23N0Xscjg_wR6HKL=AVE_5Y+68gCeLzv4bEQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jan 28, 2025 at 10:04:27AM -0600, Seth Jennings wrote:
> On Tue, Jan 28, 2025 at 9:37 AM Yosry Ahmed <yosry.ahmed@linux.dev> wrote:
> >
> > On Tue, Jan 28, 2025 at 11:21:10AM +0100, Vlastimil Babka wrote:
> > > On 1/28/25 00:58, Yosry Ahmed wrote:
> > > > The zbud compressed pages allocator is rarely used, most users use
> > > > zsmalloc. zbud consumes much more memory (only stores 1 or 2 compressed
> > > > pages per physical page). The only advantage of zbud is a marginal
> > > > performance improvement that by no means justify the memory overhead.
> > > >
> > > > Historically, zsmalloc had significantly worse latency than zbud and
> > > > z3fold but offered better memory savings.  This is no longer the case as
> > > > shown by a simple recent analysis [1].  In a kernel build test on tmpfs
> > > > in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the cost
> > > > of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
> > > > sense for zbud in any practical scenario.
> > > >
> > > > The only alleged advantage of zbud is not having the dependency on
> > > > CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
> > > > zbud is only used by zswap.
> > > >
> > > > Following in the footsteps of [2], which deprecated z3fold, deprecated
> > > > zbud as planned and remove it in a few cycles if no objections are
> > > > raised from active users.
> > > >
> > > > Rename the user-visible config options so that users with CONFIG_ZBUD=y
> > > > get a new prompt with explanation during make oldconfig. Also, remove
> > > > CONFIG_ZBUD from defconfig.
> > > >
> > > > [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> > > > [2]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google.com/
> > > >
> > > > Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> > >
> > > Seems weird not to Cc the folks listed in MAINTAINERS for ZBUD? Unless their
> > > addresses are known to bounce?
> >
> > Ugh I had them in the CC list, but I played around with it and probably
> > lost them :/
> >
> > Seth, Dan, apologies.
> 
> I haven't contributed in this space for quite some time so I defer to
> more active contributors on this.
> 
> If it is true that zsmalloc has no/negligible deficiencies compared to
> zbud, it seems reasonable.

Zsmalloc has been the default allocator and is widely used, I am unaware
of any zbud users in prod settings.

> > but at the cost of using ~32% more memory
> 
> I do push back here as this % could be highly variable depending on
> the compressibility of the data.

100% agreed, this is just an example from this specific testing
scenario.

> If the average compressibility is ~50%, zbud should be very memory efficient.
> 
> If the average compressibility is very high or very low, it is less
> memory efficient.

That being said, the average compression ratio hovers around 30% for
workloads I am familiar with. I think I have seen similar ratios from
others as well but I will let others chime in.
