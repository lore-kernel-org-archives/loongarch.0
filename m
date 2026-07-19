Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFCF218ADD
	for <loongarch@lists.linux.dev>; Sun, 19 Jul 2026 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784475233; cv=none; b=InUMOFDIBBs+wXOWVX8Cl6iayyWV1lGmvg0ZOsDvYSEeVFy8TSAIyV1Wu8QKpb0DRUx+cmaASxndRkmtehheoAANp5rtZ0yPtKMR3rev/hqCe5xs8FJTbwWjgeqF37pxseCuI+AbDeVjNcMJFDTOVWbjBtgsf08ZSH3T38mmydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784475233; c=relaxed/simple;
	bh=/uFlyb+28tTvPicpyZS5LtL4/WBr4ICoyLUmuQn3zho=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KD16ml9es2wAm6ypUBjP0dQo/7SVPYEZxBo2AcnkRJysaacSe3SiEaW7a/mpEt6vJhSoGA9J8bJVHbBT473xsAhW2O5mUgpSDINC9bNj4m5uPglqnfPxlnbCFa4zcq137tGfCTUAsX3tcVBswT7Rr208J08amtqnTXPH7TtMq1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=Y8kU9WkK; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="Y8kU9WkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1784474890;
	bh=M9cLc5KCeavLvqvey8T3GJaSSlkbnhyK7B2xSlP36cQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Y8kU9WkK+cdpVa1FWwTNo33TCNLbqs+CtsMBNDUsubka/GMmKe7voYk++QzGXo1L+
	 JnXolGtLv2PvKOgNQ/Mu1ieUXJ0QLNEwPf3JkqXb28VssziLakwknNZRItJrAB7c75
	 hbLVp5xY69RnooxwRJA47xHYIUpzfbP0Djr+5zYQ=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E34CE65982;
	Sun, 19 Jul 2026 11:28:08 -0400 (EDT)
Message-ID: <ba8b2723b563cd290c5c00fb4ec2402626fba06c.camel@xry111.site>
Subject: Re: [PATCH v1 2/2] LoongArch: mm: Expand modules virtual address
 space to 2GB
From: Xi Ruoyao <xry111@xry111.site>
To: Mike Rapoport <rppt@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>, Huacai Chen
	 <chenhuacai@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sun, 19 Jul 2026 23:28:06 +0800
In-Reply-To: <alySgaaQen6ZtwSo@kernel.org>
References: <20260717075715.25513-1-yangtiezhu@loongson.cn>
	 <20260717075715.25513-3-yangtiezhu@loongson.cn>
	 <alySgaaQen6ZtwSo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2026-07-19 at 12:01 +0300, Mike Rapoport wrote:
> On Fri, Jul 17, 2026 at 03:57:15PM +0800, Tiezhu Yang wrote:
> > Frequent "execmem: unable to allocate memory" warnings are observed
> > during kernel module loading when updating the latest kernel.
> >=20
> > This is because the modules virtual address region on LoongArch is
> > tightly constrained to 256MB, while ARM64 and RISC-V are natively
> > configured with a spacious 2GB region.
>=20
> The constraint follows architecture ability to address kernel instruction=
s
> and data from modules code.
>=20
> I don't know what are loongarch requirements, but I remember that arm64
> added a layer of relocation support to allow 2G module address space.

IIUC on LoongArch the size of one module is limited to 256MB, but the
total size of modules can be up to 2GB, as the module loader creates PLT
entries for calls across the module boundary.

I'd seen the "execmem: unable to allocate memory" error loading the
large amdgpu module.  But after I stripped the amdgpu module those
warnings gone away.  To me this is very strange: shouldn't the module
loader just ignore the debug info even if it's not stripped instead of
requesting execmem for it???

--=20
Xi Ruoyao <xry111@xry111.site>
