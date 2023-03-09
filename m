Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D77A29
	for <loongarch@lists.linux.dev>; Thu,  9 Mar 2023 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8WqHG1tF5PTwG2ipK1afkhH8fVnCeGYxdGXBPNUWDLY=; b=cGcGdmlQVjslM6qa5YfmT4/k4K
	wAGrnU+s+VtHxBYn2lTOCCGyBGlv4V+v3A4CFCPruynb5kA4n/EYcL9hZJ5OXRt08MnBzNEmXjOns
	srPGMSxZMQNCqN/VKDOItWUz304WbYq2IAOVZYDE4L8qKmybNJIFhQBnZKGEP5bZsD3TDfMt57e/j
	FMzm7nI2wGKYMHg6HiiIyMeJbW6b1WNqz9Xb5Gp943p2kXgnky+umJl0vc/KbvQ1aO6gLxNPgYV4g
	PvzoO7EUOczwxmbOkshrOln3zS+Wkb2zKpWN8Zj7IgVIREGSsKGjrWqDMXvPYSRbhGjSS0wh4fVLN
	GzOMtiEw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paJMg-00BJAR-EH; Thu, 09 Mar 2023 16:43:38 +0000
Date: Thu, 9 Mar 2023 08:43:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH] LoongArch: Provide kernel fpu functions
Message-ID: <ZAoMunXRR+kM7thg@infradead.org>
References: <20230305052818.4030447-1-chenhuacai@loongson.cn>
 <48f508aa-ab40-7032-a68d-90d8986afb2f@xen0n.name>
 <CAAhV-H55QUrkYYR1Lbj=zbquiz3frX2dNAH23fAuN6eCOUddNA@mail.gmail.com>
 <58cc7e6d19628757d6d8dc192d07876288f6077e.camel@xry111.site>
 <CAAhV-H7vv+AE-7kDf7YpU6_f_dTNxKKoRSHC6vA4aBHOVyMRAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7vv+AE-7kDf7YpU6_f_dTNxKKoRSHC6vA4aBHOVyMRAQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Mar 06, 2023 at 09:55:27AM +0800, Huacai Chen wrote:
> On Sun, Mar 5, 2023 at 9:28 PM Xi Ruoyao <xry111@xry111.site> wrote:
> >
> > On Sun, 2023-03-05 at 20:18 +0800, Huacai Chen wrote:
> > > > Might be good to provide some explanation in the commit message as to
> > > > why the pair of helpers should be GPL-only. Do they touch state buried
> > > > deep enough to make any downstream user a "derivative work"? Or are the
> > > > annotation inspired by arch/x86?
> > > Yes, just inspired by arch/x86, and I don't think these symbols should
> > > be used by non-GPL modules.
> >
> > Hmm, what if one of your partners wish to provide a proprietary GPU
> > driver using the FPU like this way?  As a FLOSS developer I'd say "don't
> > do that, make your driver GPL".  But for Loongson there may be a
> > commercial issue.
> So use EXPORT_SYMBOL can make life easier?

No.  All in-kernel FPU helpers must be EXPORT_SYMBOL_GPL.
