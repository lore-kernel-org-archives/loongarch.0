Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC49A29
	for <loongarch@lists.linux.dev>; Thu,  9 Mar 2023 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O06NXR+UHvYx/lElqCqrRFhF5ehPGyQ2puyAkUI53Is=; b=Ifgp0TzxpPd/XkQ5gdtUAo8OMM
	7Xq+uSdI086Pb8iGYYOyS8ip3B669AHxb9Aud2hqLwiYtLt4/Hd7LumujuxUYOsmcpF5VjGv4zshX
	E61xVEqp+D4kU1pVnOTP1gQYLkbiqsHPIknYuUcJp2DxnmFEODKgsKjQ9fnKNTny51oXScut4doIU
	CvunYx1Xv69UNX1G85qQaVwLGU0DMVZS7Ob318lusFZBCJp99kfr03NbS1HZsv0RPr4hshRVPbLja
	AlEW11D7UCmYh0xD/w6T03mBtJ7M/4+eaX9K5SMaBYaBXAR22OhLfJjLfr/iBak4ROM/dtxx/PSZE
	qrV2ev+A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paJOo-00BJg8-AP; Thu, 09 Mar 2023 16:45:50 +0000
Date: Thu, 9 Mar 2023 08:45:50 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH V2] LoongArch: Provide kernel fpu functions
Message-ID: <ZAoNPuyHQTqucYxn@infradead.org>
References: <20230306031258.99230-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306031258.99230-1-chenhuacai@loongson.cn>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

NAK, this needs to be an EXPORT_SYMBOL_GPL.

Also no way we're going to merge this without an actual user.
