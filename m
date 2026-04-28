Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3125443635D
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391384; cv=none; b=Ou3ryKehz6CL8mMvWcBeYvINRuuRzryq8mZ6gMrCigs+uxvNmxpUS8Y7wv5jL+xGLjprupeBdvazU+K97jen3uV2gFl9z/pvw4rbc/N2k9zHeps6GOY44hbBbPMqM5kflpDgCMDLHV4+5vf19hPPfeldrKb/I4Uk5Ab597bM1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391384; c=relaxed/simple;
	bh=hww34gezLX5SXww78rRJceJbzwSkvYyreEUZD0SA6lw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h6x5LRPlB4Vi24qLRBY7ELWZJsxFtCJ7YJ++bt3rGLPLHUlW1rD56OfhQ1qSKTmDsBWQofxCLXBh6yS6ZR1+pFdu6Og/EEr6A75kFtVkvKh83ax7yyoH2wDF9/HyONMHzOlQFRnK/n2aJi2pnbMNcRN6MDYenhaFjLnpfnMnfdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=LHBOgV2R; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="LHBOgV2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1777391382;
	bh=cArcjWCpQjLhfqvalRJtm0OUzcg81/IF2RLxxMoEE3Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LHBOgV2Rnf4WMoWA3P20pGtppQZraZM7uMWpzGk4d1OZANNqaGVv8/dQTLJhh9nIf
	 eUlfMnxMkjydDEZYDJwQCvp7Vx9icApqbYVfTf9Y93URUwt8PS7idYMxESlPyNpQRR
	 652qzgSjliREnRFtif4COQMXsH3+ceZMUAwqjFtI=
Received: from [IPv6:2408:824e:304:a151:7a8a:a6f3:c5da:fb7] (unknown [IPv6:2408:824e:304:a151:7a8a:a6f3:c5da:fb7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B034865992;
	Tue, 28 Apr 2026 11:49:37 -0400 (EDT)
Message-ID: <f71d329c66c873cf756623037d1e5806a9c94898.camel@xry111.site>
Subject: Re: Ping: [PATCH v2] LoongArch: detect and disable sc.q if erratic
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=	
 <linux@weissschuh.net>, loongarch@lists.linux.dev, Zixing Liu
 <liushuyu@aosc.io>,  Mingcong Bai <jeffbai@aosc.io>, Arnd Bergmann
 <arnd@arndb.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,  George Guo
 <dongtai.guo@linux.dev>, linux-kernel@vger.kernel.org
Date: Tue, 28 Apr 2026 23:49:23 +0800
In-Reply-To: <CAAhV-H4kxm-yfgxkxo+8NTvcRtz=uc8G0iTuKEbynkB6pMBSwQ@mail.gmail.com>
References: <20260409121936.871418-1-xry111@xry111.site>
	 <de142a5e34f9158500361e51d5a025bf3366699e.camel@xry111.site>
	 <CAAhV-H4kxm-yfgxkxo+8NTvcRtz=uc8G0iTuKEbynkB6pMBSwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2026-04-27 at 16:43 +0800, Huacai Chen wrote:
> Hi, Ruoyao,
>=20
> On Mon, Apr 27, 2026 at 10:17=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> w=
rote:
> >=20
> > Ping.
> Can we keep this as an out-of-tree patch? It's a bit ugly and I think
> the corrct way is update firmware.

We can try harder urging the vendors to release the firmware update
(there are other firmware bugs those the kernel cannot deal with anyway)
but in many cases the users just complain "hey your distro doesn't boot"
to the distro maintainers.  And some rogue ODM/OEM tend to ignore any
reports relayed by the distro maintainers unless the distro pays some
thousands of dollar.

Thus IMO it's better to make the system at least bootable with a message
(the pr_warn_once line in the patch) to clearly indicate the users that
they need a firmware update, and the vendors may become motivated a
little with more users complaining directly.
>=20

--=20
Xi Ruoyao <xry111@xry111.site>
