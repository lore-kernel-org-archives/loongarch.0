Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A216E4F6
	for <loongarch@lists.linux.dev>; Mon, 20 Mar 2023 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PB5HYAZGv9HMfQ1pr0vDKU45cXNH5QgD4Xzo7ZuzTGs=; b=nhCZ2HVyP6i0qpXdnrwj4yKV9L
	lY3fNDHz5CYzPC9trnpffz9DShtCZ81A8g35WeHwhdWRAU6bH0CbJIVPileSo5p4dAZIywBGyUAli
	nBhQS9Mai+oJLiKJ9uC3exaOEon3uXi+SjRnXhLvxrwchEbx+i7cc2hSRaDPsuhiHv7atay7eMW0s
	liBhAemjna/Dif0dewXRTaBN76hKdMbX8iYRxdlSeLl0r1k8pycrgswVz+/uDwGTAEM3tbOaDw+Y+
	VSXKTdKl2SYH9vryLajjjnC++90Qp50eou+dud6yW879o6hsWUvZtntsURHgQiWSHNDS4NroemJf/
	q2ju+LAA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1peFrq-009EVA-1y;
	Mon, 20 Mar 2023 13:48:06 +0000
Date: Mon, 20 Mar 2023 06:48:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: WANG Xuerui <kernel@xen0n.name>
Cc: Christoph Hellwig <hch@infradead.org>,
	Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH V2] LoongArch: Provide kernel fpu functions
Message-ID: <ZBhkFmGfalw/GgTY@infradead.org>
References: <20230306031258.99230-1-chenhuacai@loongson.cn>
 <ZAoNPuyHQTqucYxn@infradead.org>
 <428e2df8-d5b7-a200-62c2-59497f3facea@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <428e2df8-d5b7-a200-62c2-59497f3facea@xen0n.name>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Sat, Mar 11, 2023 at 04:10:44PM +0800, WANG Xuerui wrote:
> again, and making the loongarch FPU helpers GPL-only works for me. However
> there's probably another question that Ruoyao pointed out: do we want to
> mark the neon/altivec/s390x helpers GPL-only right away? IMO this particular
> feature is not inherently arch-specific (the same would have to happen for
> every arch with optionally enabled extra state and instructions, not limited
> to FPU actually) so availability of such feature should preferably be made
> symmetric over arches.

In general we should, and all new code most.  For existing code please
contact the relevant maintainers first.
