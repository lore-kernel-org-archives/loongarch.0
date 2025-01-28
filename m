Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CD91A841B
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 15:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738078524; cv=none; b=prROPT5dn4qMcOQ51Xtl01hE93kE92ptYbeUCxjZnrswpAhPpX7txefBxOHzeHOxiJAZy32MDc9eMQY4F0Rj/SMbSdkYkDCoWF5TTRp7xmInMHCiib9Pc5RtdgfhuEfiZXZJWV+U1ERr1i4LuW3yZDrF6hEC4RqIHnfrPD2qfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738078524; c=relaxed/simple;
	bh=zKW//L45gMAw80qVTjbflNq4PFoKBz31Qrx43GwfFrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvN8Gct85unomPmiaVR3gQVGoPv+YwoerNL5g7VGRZjX6K5y9vU1EH1e0O60t1BL7agml94N6sSwFbiTj09Vg5J8qtYBKxH4MBzHYftln7ao+POmEURWvxKaX9uoHm4zi5zHa+CrY3wO7Tkd5/TXeMrTtap6RDddK1Du4RQH7aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xn3RLCWz; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xn3RLCWz"
Date: Tue, 28 Jan 2025 15:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738078513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hfq/eIjzj8S6iojUm/63hxfMaERSCqjmB2zuGNBQkuU=;
	b=Xn3RLCWzyabKfmoX0T542QQJLVQ6Q1mCbeoaSvnoZZkrOFiXdKUb2TWATDCtN06Og5VEsK
	vjUe1k65e6TX9OC2mvrgGoKrShCP56BbT8zco5lUKX1QvJyZphpMypjmSGfliVJirPiooz
	KQS3YvvIV9/Q0N1JjwWMItQK7iXmLsw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Seth Jennings <sjenning@redhat.com>,
	Dan Streetman <ddstreet@ieee.org>, WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
Message-ID: <Z5j5K6DqU5JnltyX@google.com>
References: <Z5gdnSX5Lv-nfjQL@google.com>
 <CAM4kBBKdhSyX4_+L0b1o+Abxg0LPgO=SzJ_d6wWJyNbq7DxjKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM4kBBKdhSyX4_+L0b1o+Abxg0LPgO=SzJ_d6wWJyNbq7DxjKg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jan 28, 2025 at 11:29:07AM +0100, Vitaly Wool wrote:
> Hi Yosry,
> 
> On Tue, Jan 28, 2025 at 12:58 AM Yosry Ahmed <yosry.ahmed@linux.dev> wrote:
> 
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
> > [1]
> > https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> > [2]
> > https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google.com/
> >
> > Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> >
> 
> Let me disagree here. The footprint for zbud and the ability to work in
> MMU-less setups make it self sufficient and I don't support its deprecation.
> I can give a formal NAK if that's required.

What's the advtange of the ability to work on MMU-less setups when
CONFIG_SWAP itself depends on MMU? Please elaborate.

I agree that zbud has a smaller footprint, but I don't think that's
enough reason to keep it around if it's not being used, especially that
its memory utilization is really low.
