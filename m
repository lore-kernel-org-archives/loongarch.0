Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E231618B
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186916; cv=none; b=ZaJRio1h6EHkU57W8YQq6irMGIlCYC/fLl/antWEU2wiuB35d4XL/gkE3DDwmNQSloNgoWoaIAirNOLUxTgkuzxTaL7FhxarKp0tw9G9q8AvOQuzSb3Gp4ekAr8m+IHLMu1KhAXu+mh+5WCtAJdsmvpgb6Q9E6hLZn6nxnhyVyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186916; c=relaxed/simple;
	bh=xzLBxhUzHaoYvh/TPNEHN/Fc5xqc3qnU0sARp6jxXbQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o/waGvl6fA8D+kk1bjwTG6JpoyfjVa/lKqWq9W+UBReNw8fSw3SaEYCDMDWM0u4YK8F0KHTsJ8JpxxyKJleySnpxR8jXyREGSXH8kqzzfM2jcTs01eEHubGcMbFGqEdOotcVkk/OHaHQTIMWtq1Dhu8kOeRfmGa7khDAtyIoQu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=gY2/4Kdo; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="gY2/4Kdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1772186913;
	bh=lygb0fPXZydd/Pz9if/FAPr5SsV7QwxcaFSXSOPPIMs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gY2/4KdoNXvIsiclthw0uBT1/mGt9dyJ73DAsNtq42qhemB9bVtRw5rCflOuGtVIM
	 /oB1/LxydPeLKYapoARFHyhCFZZlgjM7LqXsAxWMn9dBzfmb9b6hJa4DqWUjgZFKaQ
	 ySiQ8lafD2iZcVHwhPJr+FO1Ujc18VR6Z3O3fhoo=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 9BB271A422D;
	Fri, 27 Feb 2026 05:08:27 -0500 (EST)
Message-ID: <dfc96603201cf067e341c13e5aa5e9bee9712e2f.camel@xry111.site>
Subject: Re: [PATCH v2] LoongArch: vDSO: Emit GNU_EH_FRAME correctly
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Jinyang He <hejinyang@loongson.cn>, 
 WANG Rui <wangrui@loongson.cn>, Mingcong Bai <jeffbai@aosc.io>, Zixing Liu
 <liushuyu@aosc.io>, "H . Peter Anvin"	 <hpa@zytor.com>,
 stable@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,  Menglong
 Dong <menglong8.dong@gmail.com>, Bibo Mao <maobibo@loongson.cn>, Tiezhu
 Yang <yangtiezhu@loongson.cn>,  Hanlu Li <lihanlu@loongson.cn>, Nathan
 Chancellor <nathan@kernel.org>, Jiaxun Yang	 <jiaxun.yang@flygoat.com>, Ard
 Biesheuvel <ardb@kernel.org>, Wentao Guan	 <guanwentao@uniontech.com>,
 loongarch@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Fri, 27 Feb 2026 18:08:23 +0800
In-Reply-To: <CAAhV-H6+Q_b4cr8jj3hmy1__h3060geMohx7hm1V8NvmeKPSiQ@mail.gmail.com>
References: <20260227072031.581229-1-xry111@xry111.site>
	 <CAAhV-H5nedWAfUXL-mwuoQGgn24pvS7=w9BwQ=t+iZfqJO0CFA@mail.gmail.com>
	 <65a54e3763c903043d8051e3bc83c9cf783047b0.camel@xry111.site>
	 <CAAhV-H6+Q_b4cr8jj3hmy1__h3060geMohx7hm1V8NvmeKPSiQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-02-27 at 18:04 +0800, Huacai Chen wrote:
> On Fri, Feb 27, 2026 at 5:57=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wr=
ote:
> >=20
> > On Fri, 2026-02-27 at 16:58 +0800, Huacai Chen wrote:
> >=20
> > /* snip */
> >=20
> > > > diff --git a/arch/loongarch/include/asm/sigframe.h b/arch/loongarch=
/include/asm/sigframe.h
> > > > new file mode 100644
> > > > index 000000000000..59db3de6db85
> > > > --- /dev/null
> > > > +++ b/arch/loongarch/include/asm/sigframe.h
> > > > @@ -0,0 +1,12 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > +/*
> > > > + * Separated from arch/loongarch/kernel/signal.c.
> > > I think this is also unnecessary.
> >=20
> > Will remove this comment.
> >=20
> > /* snip */
> >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This is also the reas=
on we don't use SYM_FUNC_START.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nop
> > > > +SYM_START(__vdso_rt_sigreturn, SYM_L_GLOBAL, SYM_A_ALIGN)
> > > Is it possible to define SYM_SIGFUNC_START/SYM_SIGFUNC_END in
> > > linkage.h, and then use them here?
> >=20
> > How about SYM_FUNC_{START,END}_NOCFI instead?
> Of course I don't know how to name them, I just want to define a
> wrapper to contain all .cfi_xxxx in this patch.

Will do it.  If they contain all the .cfi_ directives your naming is
better.

--=20
Xi Ruoyao <xry111@xry111.site>
