Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884D18634
	for <loongarch@lists.linux.dev>; Mon, 22 Jan 2024 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705909340; cv=none; b=L1sUZ3731D3jbzHVJOSE2iKeeowGi3+3kzt5chlLCEVOnza+wKe7Ha0F7zKHLtd+TY8/eS/DL6efdht2H3IWT6VkT/eDH/PNyOYBRenP/0r5HqEV5uXbTR4N1G6TkGSsUq3KN3p+ecinS+169jz8rPQlojPG7fSNGH0GknTjhjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705909340; c=relaxed/simple;
	bh=K8h8xMsDdt/c1nr/baY/X91EqM9/dwWbKRlvMR14DZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUanI5RV3mFcNuzPNIxMcwM1VWXiR867goakzouA4v5PiTBF4KYorIhSzfi2DhMt5C31/F1AIqx12z7LKC6AN4LsVsVof8YQWRHZLEo0RRpAM6QkIWs91orjb/72g5MAnpVVHKm7bk2odJyS1GC6TXIAkR4RMjIMsxmu+OT9LlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WBu8+uXr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WBu8+uXr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dR6yx6tN67WvcGk22bfKMLtWLGB0Su5dqNJD6Sk4JUQ=; b=WBu8+uXrPFN46pwRaBFARTzEwz
	BTwc4Pz8LPt1Fqn8IVxHsE4uzB01j9gUoHrZg1sOYkZYoAVys53D0DpJ8iSKFPpjTP8YS7AAaec0c
	3mEQN405x+d3rJ3RuYaVyhVkhmJzmcDbV0S+m25vaJlc4nmjvu5Yw89rNHHf0lTGhOsgKsKVqOWV1
	6W7K/KrBBAl+kJK4s9uL5uYbGtywtn8YWThJg3rcDEsPhRKD1LyF46FZTVbDjoezyc0jAsDenhi2K
	aoMnIZ9xkfG/2SiyVHT5Dkc7DlWhSmUKoGQJhKQhVBEJ3s/J1Cm5aCtRYaT6r+uASa0BJgXOZ72/R
	CI7KFzJw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rRowZ-00Atfo-0s;
	Mon, 22 Jan 2024 07:42:07 +0000
Date: Sun, 21 Jan 2024 23:42:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, Nhat Pham <nphamcs@gmail.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org,
	loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Minchan Kim <minchan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Chris Li <chrisl@kernel.org>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to
 CONFIG_Z3FOLD_DEPRECATED
Message-ID: <Za4cT3tATxVlMki3@infradead.org>
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
 <ZaajDheNtqKkCoeD@infradead.org>
 <CAJD7tkaYu2+g-3y3k35KaiLEsrFVtfpSS=9uv+ic3Zwv6fTS3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJD7tkaYu2+g-3y3k35KaiLEsrFVtfpSS=9uv+ic3Zwv6fTS3w@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Jan 16, 2024 at 12:19:39PM -0800, Yosry Ahmed wrote:
> Well, better compression ratios for one :)
> 
> I think a long time ago there were complaints that zsmalloc had higher
> latency than zbud/z3fold, but since then a lot of things have changed
> (including nice compaction optimization from Sergey, and compaction
> was one of the main factors AFAICT). Also, recent experiments that
> Chris Li conducted showed that (at least in our setup), the
> decompression is only a small part of the fault latency with zswap
> (i.e. not the main factor) -- so I am not sure if it actually matters
> in practice.
> 
> That said, I have not conducted any experiments personally with z3fold
> or zbud, which is why I proposed the conservative approach of marking
> as deprecated first. However, if others believe this is unnecessary I
> am fine with removal as well. Whatever we agree on is fine by me.

In general deprecated is for code that has active (intentional) users
and/or would break setups.  I does sound to me like that is not the
case here, but others might understand this better.
