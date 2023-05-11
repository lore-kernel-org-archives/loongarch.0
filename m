Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B631B8E0
	for <loongarch@lists.linux.dev>; Thu, 11 May 2023 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wBXjskPx8hEOJnHSctqAejGh2IMM+muzSI0KeP2yQrM=; b=d8uE/iRFbR5cJozqHolXlIngkK
	s0M5XV/l16K3V6IVU0ohjHELX2UkMEi4nK7mL1Ogg2+ijJHpEYlfSi5+X/QGbcZwITYSpHbz3Z/0B
	coPuHx5STz6DGPjbz0cXjF/Q9mNKYpvCppPC+ynR3diGsU6p3WjZ++v4MPebwAQtpFzDRUjBsyoZd
	Kr2V9hl24aO3AnzsXw37Jl1GuYkaE8bKlEbI+9LpD2U6Hn5GPGqzqFy9KAULyPmR9rd5oq4q5Qe4d
	uDZ8N/J/C9KVURxhLeAGwexNjjIcwHahp1HUcODg3tgg5CsPX0RVZ4rpiKZHcQya9XT7sVUIsVpqr
	/266kvVA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1px0y1-00Gzr6-DC; Thu, 11 May 2023 07:44:02 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 78562300786;
	Thu, 11 May 2023 09:43:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 55A0C235CC445; Thu, 11 May 2023 09:43:59 +0200 (CEST)
Date: Thu, 11 May 2023 09:43:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Youling Tang <tangyouling@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Zhangjin Wu <falcon@tinylab.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2] LoongArch: Add jump-label implementation
Message-ID: <20230511074359.GQ4253@hirez.programming.kicks-ass.net>
References: <1683710206-23905-1-git-send-email-tangyouling@loongson.cn>
 <3b360532-6ad5-b22c-b02a-103be491be4c@xen0n.name>
 <72b6c81a-d4ee-575a-ff48-6be7e034ac96@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72b6c81a-d4ee-575a-ff48-6be7e034ac96@loongson.cn>

On Thu, May 11, 2023 at 09:33:37AM +0800, Youling Tang wrote:

> > > +void arch_jump_label_transform(struct jump_entry *entry,
> > > +                   enum jump_label_type type)
> > > +{
> > > +    void *addr = (void *)jump_entry_code(entry);
> > > +    u32 insn;
> > > +
> > > +    if (type == JUMP_LABEL_JMP)
> > 
> > Please use a switch for dealing with enum-typed values.
> 
> Because the current type only has JUMP_LABEL_NOP and JUMP_LABEL_JMP,
> using if may be simpler than switch.

IIRC we used an enum with descriptive names instead of a boolean because
true/false just doesn't tell you much.

The whole thing fundamentally is a boolean descision though, either
you write a JMP or a NOP, jump-labels don't have more options.


