Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684F0749D
	for <loongarch@lists.linux.dev>; Wed, 17 May 2023 06:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=n96OXagPNbbIGhllOsTU6Nvko8
	sdV81MymooKBut9cKTfx1gLSQWWCaa6jlrT8eH7yrPPupyjAtYapcazQoVvjyKHLUcvXIWV1w2pxT
	xeW9TqL0mOeNPmcq4lTfcCBC4FNudSRMCVVdr0D0Vz1BBYzce557s6zuwzzW7Gz5uyahP20AW1bLp
	FHE82edsFY215RxbDuhspvBGHS4zp0tJEE41IJ+02oT32S2ekD5S7VDcDnOu+5hFZnCamjfz+q0HS
	sNAVxy+iEYmLV5Yr3KUo0RHzprS0X1vpGjMyvLoHk7e5miodpjhcctEzpbNZDBlwsri0pk/R+FlEX
	wq1XDmrg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pzAd2-008S1R-0i;
	Wed, 17 May 2023 06:27:16 +0000
Date: Tue, 16 May 2023 23:27:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, arnd@arndb.de, christophe.leroy@csgroup.eu,
	hch@infradead.org, agordeev@linux.ibm.com,
	wangkefeng.wang@huawei.com, schnelle@linux.ibm.com,
	David.Laight@aculab.com, shorne@gmail.com, willy@infradead.org,
	deller@gmx.de, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 01/17] asm-generic/iomap.h: remove
 ARCH_HAS_IOREMAP_xx macros
Message-ID: <ZGRzxAza23HNPeCU@infradead.org>
References: <20230515090848.833045-1-bhe@redhat.com>
 <20230515090848.833045-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515090848.833045-2-bhe@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
