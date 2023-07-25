Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972C01ED52
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W4+IDhlcrDbUmP2vgXqSK60uiq6DZVNSM07T9xTo0tw=; b=MI8sFFH978ZOaQcAVIcrDmvus5
	J/LUazhV/YTLnIasr8XIF0SEMT8IGY+Zp3etNe78zTDdcag3W0dWzaLfxESsm7lqncUyqLJaH+QmE
	ej7bgFo4mTlG2C41RuJHSFNiSn9L9uOCJZ9l4W6vZtR39AxTJ+PAJ6yV6FMUIjwViTQ/P1flEgh81
	Iei0jULb38te5EXZXEX/JBvAjtnume8n/C6iF5vFLEix+NgMiM1ZHo+qUknTd47RgazOUpKyUwCG0
	JYi/dpjpceQ7nJ+/t2pUjpRpmBFJYNEOY+eKetaYLEdLBKDy3/7NedNGnBJUhegev5V2ILkMmCINb
	4/YMRiDg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qOGj2-0047VX-2k;
	Tue, 25 Jul 2023 12:01:13 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D974C300155;
	Tue, 25 Jul 2023 14:01:10 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C6B092612ABE5; Tue, 25 Jul 2023 14:01:10 +0200 (CEST)
Date: Tue, 25 Jul 2023 14:01:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v1 0/6] Add objtool and orc support for LoongArch
Message-ID: <20230725120110.GF3765278@hirez.programming.kicks-ass.net>
References: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>

On Tue, Jul 25, 2023 at 04:15:04PM +0800, Tiezhu Yang wrote:

> To be honest, there still exist some objtool warnings, I will try my best
> to fix them in the later versions or the other separate patches.

Please give us some examples of what's still going wrong. Are you
running into jump-tables? IIRC I've not seen code for those yet.
