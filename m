Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A53038E5CA
	for <loongarch@lists.linux.dev>; Thu,  2 Apr 2026 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117114; cv=none; b=HC1rHYZNAnZbsl4vcPt6u11AjbmiB/B37NPHfX0IK1VZOUNgHd4heGVPv0pV1c7AJ+ylEbLMxZAQ8UmKjvrWelI+u5mTKZD6FRXnEtinogsqfLlU1rkM0QLjX4lZm8SnH1ULDfkTQldPpAI0Q3N8Wn9eZgGWGEzhhCnjiczpLso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117114; c=relaxed/simple;
	bh=IC6qBL6DkDLm5/qrWSyyQom+nACvaG0j+gFDEdORCp8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qKCXH5YfAjrYPYVsIq46ILEvlFHlgABD0a4z2Epq1YXpHRvROfGW6by739hKM36zNIeZG2HSBq5L8lNJ8ZAxiixWrecx1FPsgQ5CmL+rpEEmc93piE5JU3ORvuneY6tetb6XwVpV8pj60wpizvpchPWWmO7Gi6V0CV/CSiWv/5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=MkXtbAQV; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="MkXtbAQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1775117110;
	bh=LYEjOQEqMDRgy4MTlRPRj1NDOwr2T5DSOpjTKMJbock=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MkXtbAQVFrZfPn8ac4MwZJLBbsGeGGjyDBsY8Dor0ZhpL9W3KZRiNnsTg8+t1VSqc
	 dgkFL+BO+Y0knCw7lLNGEmpCByivLIAx8xzeSo0We+2nQDkiC1YQFkheMC2R4rp/jW
	 nDYI7g7Nk1OgoUdeh95SpkgwBbHbbcZeH89dkxbE=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id F101965992;
	Thu,  2 Apr 2026 04:05:07 -0400 (EDT)
Message-ID: <6c9662c0f45131d8aa607d6962cb4237d3c7f129.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: detect and disable sc.q if erratic
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Zixing Liu <liushuyu@aosc.io>, Mingcong Bai
	 <jeffbai@aosc.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Arnd Bergmann
	 <arnd@arndb.de>, Yangyang Lian <lianyangyang@kylinos.cn>, Yawei Li
	 <liyawei@loongson.cn>, George Guo <dongtai.guo@linux.dev>, 
	linux-kernel@vger.kernel.org
Date: Thu, 02 Apr 2026 16:05:05 +0800
In-Reply-To: <b484cc9e-3582-41bf-bf5e-0a432e74a8f4@t-8ch.de>
References: <20260402044732.164294-2-xry111@xry111.site>
	 <b484cc9e-3582-41bf-bf5e-0a432e74a8f4@t-8ch.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-04-02 at 08:39 +0200, Thomas Wei=C3=9Fschuh wrote:
> On 2026-04-02 12:47:30+0800, Xi Ruoyao wrote:
>=20
> (...)
>=20
> > +/*
> > + * Some LoongArch has broken sc.q which incorrectly handles the upper =
word
> > + * when the lower word is zero. Newer firmware versions (such as the 2=
02602
> > + * release from Loongson) seem to contain a workaround for this issue.
> > + *
> > + * Disable sc.q if erratic to ensure reliability and compatibility.
> > + */
> > +static bool sc_q_is_sane(void)
> > +{
> > +	struct {
> > +		long word[2];
> > +	} __aligned(16) mem;
> > +	register long tmp;
> > +
> > +	asm (
> > +		"1:ll.d\t$r0, %[mem]\n\t"
> > +		"move\t%[tmp], $r0\n\t"
> > +		"sc.q\t%[tmp], %[one], %[mem]\n\t"
>=20
> This probably needs to be gated behind CONFIG_AS_HAS_SCQ_EXTENSION to
> avoid errors on older toolchains.

I guess I'd code the insn with .word instead...

This also affects HWCAP, and I don't want the userspace to see neither a
false positive nor a false negative simply because the kernel was built
with an old toolchain.

--=20
Xi Ruoyao <xry111@xry111.site>
