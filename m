Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CADA3B
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 05:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hXZNqqCBlKtrYnD75V9Zin6CQQ9GsiuAV2QuBhHw8t0=; b=wUFjowPZM9tYICB9b/77CU7dnJ
	MB0PIZrQVl9kpzkq8wVJ8MDNqTaW5iKCDxi0d/81sVAJDK/nbnq2NpcDJqEjSxvXNEwtVYlDIVxTm
	JPhFQg/0QP1WqufLtvipNbhtqOiLicjoai9AM8IsH48uTtuQq3CYRP1cYkqCoz6aFIxvcKIgh6zN+
	sn2C13Gm04x1hlaqlOvOh+Ak2RQgeSLS9twVbIpDqrooOQtVzw1nU5OPp0UPLkEA0Jq1tySPE5InC
	cHLKIZHwVvOncey3ttM5gKAz2E3afoUboGUK6OA1ZQuFwAy0a12zBWi+yEscxN1wmGdRMhdPHXOLk
	uLtJ857w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEkD-001OZz-LR; Wed, 01 Mar 2023 05:11:13 +0000
Date: Wed, 1 Mar 2023 05:11:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, arnd@arndb.de,
	christophe.leroy@csgroup.eu, hch@infradead.org,
	agordeev@linux.ibm.com, wangkefeng.wang@huawei.com,
	schnelle@linux.ibm.com, David.Laight@aculab.com, shorne@gmail.com,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, netdev@vger.kernel.org,
	Martin Habets <habetsm.xilinx@gmail.com>
Subject: Re: [PATCH v5 01/17] asm-generic/iomap.h: remove ARCH_HAS_IOREMAP_xx
 macros
Message-ID: <Y/7eceqZ+89iPm1C@casper.infradead.org>
References: <20230301034247.136007-1-bhe@redhat.com>
 <20230301034247.136007-2-bhe@redhat.com>
 <7bd6db48-ffb1-7eb1-decf-afa8be032970@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd6db48-ffb1-7eb1-decf-afa8be032970@gmail.com>

On Wed, Mar 01, 2023 at 04:38:10AM +0000, Edward Cree wrote:
> On 01/03/2023 03:42, Baoquan He wrote:
> > diff --git a/drivers/net/ethernet/sfc/io.h b/drivers/net/ethernet/sfc/io.h
> > index 30439cc83a89..07f99ad14bf3 100644
> > --- a/drivers/net/ethernet/sfc/io.h
> > +++ b/drivers/net/ethernet/sfc/io.h
> > @@ -70,7 +70,7 @@
> >   */
> >  #ifdef CONFIG_X86_64
> >  /* PIO is a win only if write-combining is possible */
> > -#ifdef ARCH_HAS_IOREMAP_WC
> > +#ifdef ioremap_wc
> >  #define EFX_USE_PIO 1
> >  #endif
> >  #endif
> 
> So I don't know how valid what we're doing here is...

Well, x86 defines ARCH_HAS_IOREMAP_WC unconditionally, so it doesn't
affect you ... but you raise a good question about how a driver can
determine if it's actually getting WC memory.

