Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E272115A3
	for <loongarch@lists.linux.dev>; Mon,  4 Jul 2022 06:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9052CC3411E;
	Mon,  4 Jul 2022 06:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656916654;
	bh=Ev99x2/dGK/AfHwjAp99Abizv7vniBu6IQA5CawQMQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFJVmhiYn6Ic6FTheiyt1yAOHTodfrybFiqBvVQ/qjJyqvMcrf1iEMEQ/sockNodS
	 ONjRsGxOWH8Cfs69RjqlQ6woEHTlfn5jDBz8nPLFjT72zKvzgWfCgsTNTPCO4TvPkj
	 uwLufFvGkCfNTFWsGIoYzNf29FFaGS0USFD+b4wjw7PxPT6FVuf/T0z4or7bBn/A2i
	 NLtBgjQ1GgdHb5h/x2cfDvUqGj0IWK9OcUpaBWJIWtp5mJNteU1glbswFU1WdZNqOb
	 JmmU/VcV1X3eYwOhhr4yzKOS0q9pNiC0cCirbCUjL6QELQ10pfnXNAwNGPmOVMkb4+
	 HTG0pR49rjXDg==
Date: Mon, 4 Jul 2022 09:37:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
Cc: Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@kernel.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-parisc@vger.kernel.org,
	linux-xtensa@linux-xtensa.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 12/14] loongarch: drop definition of PGD_ORDER
Message-ID: <YsKKnSk/kgf2uMg6@kernel.org>
References: <20220703141203.147893-1-rppt@kernel.org>
 <20220703141203.147893-13-rppt@kernel.org>
 <YsIBFVcdJSQNK+pV@casper.infradead.org>
 <aa74c870-e4e9-a2aa-ddae-91cce62a3fe5@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa74c870-e4e9-a2aa-ddae-91cce62a3fe5@xen0n.name>

On Mon, Jul 04, 2022 at 11:57:28AM +0800, WANG Xuerui wrote:
> 
> On 2022/7/4 04:50, Matthew Wilcox wrote:
> > On Sun, Jul 03, 2022 at 05:12:01PM +0300, Mike Rapoport wrote:
> > > +++ b/arch/loongarch/kernel/asm-offsets.c
> > > @@ -190,7 +190,6 @@ void output_mm_defines(void)
> > >   #endif
> > >   	DEFINE(_PTE_T_LOG2, PTE_T_LOG2);
> > >   	BLANK();
> > > -	DEFINE(_PGD_ORDER, PGD_ORDER);
> > >   	BLANK();
> > >   	DEFINE(_PMD_SHIFT, PMD_SHIFT);
> > >   	DEFINE(_PGDIR_SHIFT, PGDIR_SHIFT);
> > Should probably also drop one of these BLANK() lines too?
> > 
> Agreed; IMO the blank lines can and should be removed because the
> surrounding lines are also mm definitions.

They are mm definitions, but still they are separated by blanks to have
nice grouping in the generated asm-offsets.h.

I suspect that there are more unused definitions in asm-offsets.c, worth
taking a look.

-- 
Sincerely yours,
Mike.
