Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01338FA3
	for <loongarch@lists.linux.dev>; Thu, 19 Feb 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496485; cv=none; b=K1mlqqcKCDhwzhowocZprY7vqgkE+Bn5cYahkoA+3PDRMSJiG3sqiYyHzmILpryK3rIAyguXiMrP4q7rmBx/J9LgonO72/dukrf+zTWspis7i265FhbdJYzGU2Hk9bFeTfn/AI5a0HNilTj2Xlguy773hJ0WWtnkYxkuvUvIO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496485; c=relaxed/simple;
	bh=M/Bc2mxrouj4q/x1Kx0AGre0ZycWbFlEjJMogPmVSig=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kRnO1hcEJH04bXKstTFGAUcsEnnJ2DhrTkF1CBk+NRmsyWH7zsZ20+mZ/O/twjGdPyatzcu3VHMiGGkzmIvSumsV6m+NADnpXCzpvGlfcGtBnLwBwoFadm8/0KHgANn+HU8V9K5jBVsRQCSCp/xRnjiG2uRxmTJl0+tcc8ENbI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=jeSF71Gv; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="jeSF71Gv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1771496476;
	bh=M/Bc2mxrouj4q/x1Kx0AGre0ZycWbFlEjJMogPmVSig=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jeSF71Gv9DAg8GcIkO/QfRypt8/rfjz7Q93hiklutO6k+aTArmUc19ONcOOCYPQ/7
	 EzRnqlp1pYuo1z01gwA2IjQlx8YfpPvgrM2aZfm1Q0yeEOszKuiZyEZPq6Iler+R/6
	 AcsbuxnUIWpP/0mnkxTpq/cXuP9u3mrdEOxu95EI=
Received: from [IPv6:240e:424:760:6b1c:48e9:261:52f4:d21f] (unknown [IPv6:240e:424:760:6b1c:48e9:261:52f4:d21f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 5A32D66C5C;
	Thu, 19 Feb 2026 05:21:14 -0500 (EST)
Message-ID: <47e7eac65966408b28417e5be3bd6b24dd397a08.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: jump_label: Batch icache maintenance
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Youling Tang
 <youling.tang@linux.dev>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>
Date: Thu, 19 Feb 2026 18:21:10 +0800
In-Reply-To: <CAAhV-H6mQJ5RR4Oad9aOA2nbVa4BeFYfTHLTvdj=5dL56O7FTw@mail.gmail.com>
References: <20251028065139.10227-1-youling.tang@linux.dev>
	 <CAAhV-H6mQJ5RR4Oad9aOA2nbVa4BeFYfTHLTvdj=5dL56O7FTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-02-19 at 11:44 +0800, Huacai Chen wrote:
> > +static inline void local_flush_icache_range(unsigned long start,
> > unsigned long end)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_flush_icache_all();
> Just use a plain "asm volatile ("\tibar 0\n"::);", and put them after
> __flush_cache_all().

IMO for consistency it should be "ibar\t0" (without the leading \t and
trailing \n: we don't have those in any of other inline assemblies).

--=20
Xi Ruoyao <xry111@xry111.site>
