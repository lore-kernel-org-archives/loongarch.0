Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE291377
	for <loongarch@lists.linux.dev>; Sun, 21 Aug 2022 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wh63hAobc1uVljLnJ+kI643Y5QH17ip9W3Tm3J/v7dA=; b=lxj1L3R2YRxu87z0ZJ+bgooI9o
	NW+gwuzuGaPN6AVBGJEnno6SRG/SZI/L7Mw92tlmqNgofzA+R2NxMM+1vvkWneixst24iTCG0fLE2
	QAEPW+mAidZGlp+z3Ly5puWR6vbkyF8qYSz6k7Ozu1t8BmOEKwnxuofPKfBvwIIKc3v/agPHJGayN
	BZY2G/GdiNbcqH9CeHCKs8WEl5y68hpqBECAriNXK4baid8DOFkJPre9Z2XXKjZKdSO+gQI9MQDPk
	X7YqXRbYA7+bW18hThXnPobhomG40fhktnPgkeBrwzmznPSWIyH8dOwn/9pCr5Ir2XjbvCA9FePGG
	LHySku4Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPkvP-00Ac7b-7l; Sun, 21 Aug 2022 13:23:35 +0000
Date: Sun, 21 Aug 2022 06:23:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Use TLB for ioremap()
Message-ID: <YwIx1xoAmsp8cHMN@infradead.org>
References: <20220815124612.3328670-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815124612.3328670-1-chenhuacai@loongson.cn>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Aug 15, 2022 at 08:46:12PM +0800, Huacai Chen wrote:
> We can support more cache attributes (CC, SUC and WUC) and page
> protection when we use TLB for ioremap().

Please build this on top of the series that extents the generic ioremap
code for these use cases instead of duplicating the generic ioremap
code.
