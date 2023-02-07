Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D379747F
	for <loongarch@lists.linux.dev>; Tue,  7 Feb 2023 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XM5/DhrpywJuIcEgHHCo/8ZgkbeDJDYpTgAA6DELtws=; b=U421OkqtCK6gXcQf62Ryz9sZ/W
	LZu+W2C5RVzWjNR1EJOlHTdtbUA8ODN3LbSVdDS3DjxVjKsvyfrdU85iUtIK1EgYxrddQ0m2wTalm
	OssTp+Q+6OmZYy35VF4f8TBsgThmOB3u+RJ5a68V/pzMcXN/KM/Ez/WO3wthlQHUm0ELHHtc9xZYE
	D46tkAcEKppoPWtpXr3+JsOkVr4ibVV2RCEgi+21G7Cx3eq2LJAbAe7NpSaz6q0Nunm9jiFI6Bw1a
	MDE52Mqb5eTuWPKHiCG+W54+Ozx9KzoajI/jLRKPpRgEHssXN6Hk+ibtCKSSi8VsmJPAbnS9pIDOm
	jRVggYwA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUZ1-000XLi-7h; Tue, 07 Feb 2023 20:27:39 +0000
Date: Tue, 7 Feb 2023 20:27:39 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-arch@vger.kernel.org
Cc: Yin Fengwei <fengwei.yin@intel.com>, linux-mm@kvack.org,
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, openrisc@lists.librecores.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: API for setting multiple PTEs at once
Message-ID: <Y+K0O35jNNzxiXE6@casper.infradead.org>
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9wnr8SGfGGbi/bk@casper.infradead.org>

On Thu, Feb 02, 2023 at 09:14:23PM +0000, Matthew Wilcox wrote:
> For those of you not subscribed, linux-mm is currently discussing
> how best to handle page faults on large folios.  I simply made it work
> when adding large folio support.  Now Yin Fengwei is working on
> making it fast.

OK, here's an actual implementation:

https://lore.kernel.org/linux-mm/20230207194937.122543-3-willy@infradead.org/

It survives a run of xfstests.  If your architecture doesn't store its
PFNs at PAGE_SHIFT, you're going to want to implement your own set_ptes(),
or you'll see entirely the wrong pages mapped into userspace.  You may
also wish to implement set_ptes() if it can be done more efficiently
than __pte(pteval(pte) + PAGE_SIZE).

Architectures that implement things like flush_icache_page() and
update_mmu_cache() may want to propose batched versions of those.
That's alpha, csky, m68k, mips, nios2, parisc, sh,
arm, loongarch, openrisc, powerpc, riscv, sparc and xtensa.
Maintainers BCC'd, mailing lists CC'd.

I'm happy to collect implementations and submit them as part of a v6.
