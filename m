Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BB08F4D
	for <loongarch@lists.linux.dev>; Wed, 10 May 2023 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QbzoChfNbmTPAWVYTeVTH2VekWVcJSNCB9AwQAbgzcA=; b=FgxufkvO0GetjfD6zrhAGQ8OT1
	KOYVMDTYuYoeCc25K0fCN/t0UcEn1LE+dP93KXRPDRmwXVOd7HkbsIl9LZMFh6tGqRC+M0c5o6Lw5
	Jg15V5qs4F5hDFKQQ6zjgFFaF95r2zGNUEdtI7nGL6FVy9PiYWJs1RsPA/KISDiikM2zXwiE2R10m
	s2OUSWm03W7jstFisa0+5qRKuuVzDtHnyw+PI2aXHVUeM5JOtztCZ9K6qQuyNQXw7rA/Zqb0Fgo6J
	cGvdFpYGpdTUriawNxVFJCxDK2dzEHWiYhMIT34iWbhVkgJPdgu4piKQxzQ/kSDaWENkeZ/dyxNwG
	C5CuKsbw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwhuc-00GDJC-Pd; Wed, 10 May 2023 11:23:14 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9ECCD300023;
	Wed, 10 May 2023 13:23:11 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 65E3720B04BA9; Wed, 10 May 2023 13:23:11 +0200 (CEST)
Date: Wed, 10 May 2023 13:23:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: WANG Xuerui <kernel@xen0n.name>
Cc: Youling Tang <tangyouling@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Zhangjin Wu <falcon@tinylab.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2] LoongArch: Add jump-label implementation
Message-ID: <20230510112311.GA2176161@hirez.programming.kicks-ass.net>
References: <1683710206-23905-1-git-send-email-tangyouling@loongson.cn>
 <20230510092723.GK4253@hirez.programming.kicks-ass.net>
 <15594820-0a95-94bb-132f-5008d31c041f@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15594820-0a95-94bb-132f-5008d31c041f@xen0n.name>

On Wed, May 10, 2023 at 05:34:33PM +0800, WANG Xuerui wrote:
> Hi Peter,
> 
> My 2 cents:
> 
> On 2023/5/10 17:27, Peter Zijlstra wrote:
> > On Wed, May 10, 2023 at 05:16:46PM +0800, Youling Tang wrote:
> > > Add jump-label implementation based on the ARM64 version.
> > > 
> > > Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> > 
> > > <snip>
> > > 
> > > +	if (type == JUMP_LABEL_JMP)
> > > +		insn = larch_insn_gen_b(jump_entry_code(entry), jump_entry_target(entry));
> > > +	else
> > > +		insn = larch_insn_gen_nop();
> > > +
> > > +	larch_insn_patch_text(addr, insn);
> > > +}
> > 
> > This all implies Loongarch is fine with the nop<->b transition (much
> > like arm64 is), but I found no actual mention of what transitions are
> > valid for the architecture in your inst.c file -- perhaps you could put
> > a small comment there to elucidate the occasional reader that doesn't
> > have your arch manual memorized?
> 
> Do you mean by "valid transition" something like "what kind of
> self-modification is architecturally sound, taking ICache /
> micro-architecture behavior etc. into consideration"?

Yes that. There are definitely architectures that have limitations on
what instructions can be hot-patched in the face of concurrent execution
without jumping through too many hoops.



