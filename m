Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7A1C2B2
	for <loongarch@lists.linux.dev>; Tue, 16 Jan 2024 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="o9Gjjz+T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WtuVntAUUaCAXXG4ld9RtlJPqwKTyVWfU729/RL/Hsw=; b=o9Gjjz+T5kDv5mjN1O1rCFpBHe
	GjyMdKlmHDPVacqgG9J02XTK47cYYGykjg8ppuXuvAip5m4Oo2tZLsNq/ngiRennfsaO7LQKCRdfC
	qWURBIOAj24mTBDP391o0WgYKYUTHzpdUcfKs3kbVaNIZ3LB13sVKEE6AuyhSZI1FfgYniot97q0q
	JwU9NGmxE4jrQ9E6lIc+yc9ue+6pJmffS5jgVXYFfDhm3V3qQxg9AAxGjzIYXx53VVaa2MtDMXvR/
	GH6yMxn9hYJ3LX3R0eVMBCTME4Qo8RVdm1YcrTt67RUCn8gs2XfbgYO2reqzRoAig72MObiBsStBH
	VwK/lYgA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rPlWg-00CSYJ-1w;
	Tue, 16 Jan 2024 15:38:54 +0000
Date: Tue, 16 Jan 2024 07:38:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, Miaohe Lin <linmiaohe@huawei.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org,
	loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Minchan Kim <minchan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>,
	Vitaly Wool <vitaly.wool@konsulko.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to
 CONFIG_Z3FOLD_DEPRECATED
Message-ID: <ZaajDheNtqKkCoeD@infradead.org>
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Jan 12, 2024 at 04:38:30PM -0800, Nhat Pham wrote:
> >
> > I thought deprecating z3fold is the low hanging fruit. Then, once we
> > can sort out the MMU dependency in zsmalloc, we can go after zbud as
> > well.
> 
> Makes sense to me. Should we do the same thing to zbud? We probably
> have even less of a case for it, no?

Is there any user visible effect of switching the allocator?  If not it
seems a bit pointless to deprecate them vs just removing them (or maybe
making z3fold depend on !MMU for now).
