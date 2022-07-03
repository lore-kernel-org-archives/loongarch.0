Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DBB2CA5
	for <loongarch@lists.linux.dev>; Sun,  3 Jul 2022 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cMSIxin7oXYajBrjcogDr6Jg2H5oPa2BGPSYC1gk66c=; b=G46m0MCCZAaQ2uy0ORNXP1aWhG
	RG+pcbjT2NS4qPMOTf5ylOwDyXGiXNi8U+z9uKPxp/KM/s1jKx4K+8rCDu8lV2LKFtOHR/1/jU5Su
	IywjwRRJtpum8cB9ChnTfDcICLdrd1TbflqItXEgsOmWu1eCUKg6lfbx1I6NELbCESw0mKV/QEF+b
	7xSv0PoxrwX87RwZ6UUUs2KJuVTULDK47HLbW6oi2gH9dYZGGSFFfBo2JJ1CQLbsycvfglQ4bY6Gg
	WBkf5u9zTeqa655lb5YiTa1zZSS6KoOqRNDAB4gARH0ygB1nifPFbVIiGnCQSvUjyAYZuEQ3Sdfot
	2+B91CMA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o86Y1-00Gh9T-LA; Sun, 03 Jul 2022 20:50:29 +0000
Date: Sun, 3 Jul 2022 21:50:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@kernel.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 12/14] loongarch: drop definition of PGD_ORDER
Message-ID: <YsIBFVcdJSQNK+pV@casper.infradead.org>
References: <20220703141203.147893-1-rppt@kernel.org>
 <20220703141203.147893-13-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220703141203.147893-13-rppt@kernel.org>

On Sun, Jul 03, 2022 at 05:12:01PM +0300, Mike Rapoport wrote:
> +++ b/arch/loongarch/kernel/asm-offsets.c
> @@ -190,7 +190,6 @@ void output_mm_defines(void)
>  #endif
>  	DEFINE(_PTE_T_LOG2, PTE_T_LOG2);
>  	BLANK();
> -	DEFINE(_PGD_ORDER, PGD_ORDER);
>  	BLANK();
>  	DEFINE(_PMD_SHIFT, PMD_SHIFT);
>  	DEFINE(_PGDIR_SHIFT, PGDIR_SHIFT);

Should probably also drop one of these BLANK() lines too?

