Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A111EA8A
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 12:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zV+MKFs0Ek/F4CDO6/XiX2nafcwDJWDb5aXZEN1DceI=; b=S9FNMwBMzkvE+fZ14ylxcUw30g
	ev4K4QQWOYn5S5GLUsYACkTA/cXow8hT4p401VAdYWjkh5K+p47n3jJswhzTnR8gJtgDsvyOKX4vf
	EMMDOQPLlrWCgZiPrFwtF1mgSjIYPa2cbIzekZ9V3/LscpwRT96CJUPRkQXN/5Bg/C8yo5GRb1Or8
	1kUNoiuolfemDWXkFD9/dTTV+E/GH4V6bM+C2Ko2sC7rE9EEy4xibszDtRiQZ9dOKgdXpfsHejDqA
	HNAKzY/gvBUhUFq1dF+E/wn0Rbt1KB+lkm5NHoWck30+DsZ8g33ve1ILu9Cp5H8gkHTyWZM5nJ1nX
	IOvpnU3g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qRXAW-003Xnq-OW; Thu, 03 Aug 2023 12:11:04 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 434E330007E;
	Thu,  3 Aug 2023 14:11:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 29CFE20727FD6; Thu,  3 Aug 2023 14:11:03 +0200 (CEST)
Date: Thu, 3 Aug 2023 14:11:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v1 5/6] objtool: Add skipped member in struct reloc
Message-ID: <20230803121103.GE214207@hirez.programming.kicks-ass.net>
References: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
 <1690272910-11869-6-git-send-email-yangtiezhu@loongson.cn>
 <20230725115959.GE3765278@hirez.programming.kicks-ass.net>
 <b111cb87-3f30-860a-640b-2f7264a16838@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b111cb87-3f30-860a-640b-2f7264a16838@loongson.cn>

On Thu, Aug 03, 2023 at 07:36:24PM +0800, Tiezhu Yang wrote:

> > 			".long " __stringify_label(c) "b - .\n\t"          \

> I discussed offline with the engineers who are familiar with gnu
> assembler of LoongArch, maybe it can modify the gnu assembler
> to use R_LARCH_32_PCREL to replace a pair of R_LARCH_ADD32 and
> R_LARCH_SUB32, then I will test it again and drop this change if
> possible.

Yes, this is exactly what PC relative relocations are for.
