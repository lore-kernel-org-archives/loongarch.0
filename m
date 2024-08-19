Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82283347C7
	for <loongarch@lists.linux.dev>; Mon, 19 Aug 2024 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724080966; cv=none; b=t4xZ7iDvtuFdrceuu4WllvlYam/ueak9khWQAS9VFZhjxGLzxh7XN43NDrnwlblXwHjl2inNTEsgjWNEgwWj/cMGvJWvHQOncdU5o9qp8lfkh0gEBPQei56Hd6BNcBlU8ctMN5pwF/Oiq3/DMT3l4AlVeB8u+bJasn++s87VVv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724080966; c=relaxed/simple;
	bh=u9SQN/jwBMd33HW5yJVkXJWT61e1P0urff/Krc79cmY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qhiEX2dYZVTrnXyQ402g5qeQO2CxVK9hd50gpacB2TJ5HwIBYn7LG7eE52Uf+lgRUTomU7SipXc1Kiqj16RN3HNxybTk/V3/1FCCpjD6AHmDTS1MkGF/jY6tfTNmoGzdCJKLAtdzL6eakLwFqI8u/BRx1b/RwLwxBj/XynvM9EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=ifRwA9JB; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="ifRwA9JB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1724080958;
	bh=u9SQN/jwBMd33HW5yJVkXJWT61e1P0urff/Krc79cmY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ifRwA9JBcHwtJHWOH2NTwisHnWC1HNR/3Tly7MsbT3c6ekP9yIYZhElCYrISxz69U
	 dDpMmnYk2lTT48KyVZ5AgS7EbhftWhEynyBjgPCt6b9WJqeDLZMiJJv8l/1Lu2PY9f
	 19HpOLYR6QRCQu3B94fM0wrAP4uNr+1lhz/MsyqQ=
Received: from [192.168.124.6] (unknown [113.200.174.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 008FD66F26;
	Mon, 19 Aug 2024 11:22:33 -0400 (EDT)
Message-ID: <d10c0e620ae26e0c53e50aaae6efc87719b034f0.camel@xry111.site>
Subject: Re:
From: Xi Ruoyao <xry111@xry111.site>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen
 <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, linux-crypto@vger.kernel.org, 
	loongarch@lists.linux.dev, Jinyang He <hejinyang@loongson.cn>, Tiezhu Yang
	 <yangtiezhu@loongson.cn>, Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Aug 2024 23:22:29 +0800
In-Reply-To: <ZsNCPKo9XZG52Yph@zx2c4.com>
References: <20240816110717.10249-1-xry111@xry111.site>
	 <CAAhV-H5a42p6AAda=ncqCdmpHyc_tpXHjDVHq_F1pPZumfGeLw@mail.gmail.com>
	 <ZsNCPKo9XZG52Yph@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2024-08-19 at 13:01 +0000, Jason A. Donenfeld wrote:
> > I don't see significant improvements about LSX here, so I prefer to
> > just use the generic version to avoid complexity (I remember Linus
> > said the whole of __vdso_getrandom is not very useful).
>=20
> I'm inclined to feel the same way, at least for now. Let's just go with
> one implementation -- the generic one -- and then we can see if
> optimization really makes sense later. I suspect the large speedup we're
> already getting from being in the vDSO is already sufficient for
> purposes.

Ok I'll drop the 2nd and 3rd patches in the next version.  But I'm
puzzled why the LSX implementation isn't much faster, maybe I made some
mistake in it?

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
