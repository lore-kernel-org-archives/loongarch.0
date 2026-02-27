Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81213624D3
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186240; cv=none; b=L0O2bm6hvXsapzyH7rKWlHDH0+g+a8xnNkxgFfGLXSpXQA/slT2ENuHtAq6RqFGqXFuaJ5Y9XXjFnWtWnZ7CPvJw3vPPERAQZ/kEOrcCQ1sVYDkHsHDP27AY6Se1UHJHjRMm0CwtktmSDexLgMKzo/Onw6ahLQSxTqtbcceA3+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186240; c=relaxed/simple;
	bh=U8KjsawmFn9EyBHO+DBqcFRZKBwY3+Sev0YcB+s929E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uJK60UFxC1oKnV/yZdxAUNYv+jtk4f0YaiMd0PH0fHrRibSDkday1Mg5WcdWuIy8k1JekxkMM6tHrZM5zeHmU+zkZctQ8kqMaho814YG3Gi6t+4phbFw217mRtlm+pVK0k4G/IuhL1XnDwhnri3QUH9uUv496rS5Mfpv7jcKgp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=NDDxO1EW; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="NDDxO1EW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1772186236;
	bh=U8KjsawmFn9EyBHO+DBqcFRZKBwY3+Sev0YcB+s929E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NDDxO1EWxGTs/flt56FRnC7iYhgyjPk8AnD25WhjkX5bpTS8SxIsWIBFo/eMO9y68
	 LQbvvmL1YJJceg9mei9z6e0SXi/EtIGs34YjpSlAkz1fEWS9Y+e+JW1ql2EvW9Dpgz
	 X9wsyQTClR+cFQg/qgwp+TJX/vuwm3/kNlUnLnug=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E84C01A4229;
	Fri, 27 Feb 2026 04:57:10 -0500 (EST)
Message-ID: <65a54e3763c903043d8051e3bc83c9cf783047b0.camel@xry111.site>
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
Date: Fri, 27 Feb 2026 17:57:07 +0800
In-Reply-To: <CAAhV-H5nedWAfUXL-mwuoQGgn24pvS7=w9BwQ=t+iZfqJO0CFA@mail.gmail.com>
References: <20260227072031.581229-1-xry111@xry111.site>
	 <CAAhV-H5nedWAfUXL-mwuoQGgn24pvS7=w9BwQ=t+iZfqJO0CFA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-02-27 at 16:58 +0800, Huacai Chen wrote:

/* snip */

> > diff --git a/arch/loongarch/include/asm/sigframe.h b/arch/loongarch/inc=
lude/asm/sigframe.h
> > new file mode 100644
> > index 000000000000..59db3de6db85
> > --- /dev/null
> > +++ b/arch/loongarch/include/asm/sigframe.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Separated from arch/loongarch/kernel/signal.c.
> I think this is also unnecessary.

Will remove this comment.

/* snip */

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This is also the reason w=
e don't use SYM_FUNC_START.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nop
> > +SYM_START(__vdso_rt_sigreturn, SYM_L_GLOBAL, SYM_A_ALIGN)
> Is it possible to define SYM_SIGFUNC_START/SYM_SIGFUNC_END in
> linkage.h, and then use them here?

How about SYM_FUNC_{START,END}_NOCFI instead?
>=20

--=20
Xi Ruoyao <xry111@xry111.site>
