Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA3236EAAA
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186665; cv=none; b=QaS0ycHs3Qo6ripapZ/3RWLBLms9udRADm3bFRDjHmCm7ZN0omjRwA8ST06fmXm8qGnWK7cl4Vhn0Aql9Ak4+g1QPEIG9F/Mp5G8ne6VvJchN0BgBBcdR1TDQrzwNURoJb70H5hcd8K5fAXxQtdga8ENgHwwoDF6ndvXz1xgPtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186665; c=relaxed/simple;
	bh=CqiXjdEuAh6VhbCOPAP03nQl+N1BQZlYDVT7h65fvsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLs9CMBEiGLfJqa6AdxlJ4Fu/q2BHE0E9kRiFc1smZ5ltzuykxkeS+8Bw5fPa5C/Cf5tM71kx7Ovdr7ebfrLKYDWYOQ+2Qfi2hTIWjOJYL+omLnaCDR5DoW+rb9A7luxHuNYZwuoknMKb/a9tNFjgCrjfSUHteWUOMmnZJz6FUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rIBzdhCy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rIBzdhCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2DDC2BCB3
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 10:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772186665;
	bh=CqiXjdEuAh6VhbCOPAP03nQl+N1BQZlYDVT7h65fvsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rIBzdhCy5Beog9og8qEfzedoMWQZJthpstLNb6jivOMGfkFIT90rqdA0pEDEyTzid
	 6COoa0ZxsvA1vnERjGwjfYP2jnVJlz1F2wrxG1NyFdKUbddAT45F497xmf279y4Qib
	 vA7utaRF4AN3TW8ZblaXyrttI2JHSDbPgU1uO8dHfRuTCY83+i/WrSefhLJHKtR4GY
	 korQroRyCI7KYSD1d2ZifaJFNoALhwhdR29w6LZjXGByP6BSKn19atJV9Fhm6ZRi9j
	 tIn1BqKiLfwzR4q3w5Io1g2VlIjzAgn6xD7AjYiUQ1dDT3oCc8WsN1idcfsrcdTjx2
	 pLHSsU2cKnm3g==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65c187dfc82so3008616a12.2
        for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 02:04:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgAEzt7ugIEccYP1JOq0+5WlLedy5JQR4Say5aKM+Ep+03vp8xUOR0p9aR+6t3EcoM73CWgaACCPk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxyk0WpC/P1wF8ri5nkbu5+HvdXNS/MleOPZKD0Z9/SLyT4jboR
	7R/U6Im2lFlQas5NuB9mvWxnq9m3WdL+qbbH9Cq/4Qlm72Bk/IPnJbmLUp++x8YdD7MO8ma3C2v
	GaJd2LCzju/ZO+Hyg18OAd+H7/ca0bTg=
X-Received: by 2002:a05:6402:13c9:b0:658:b76f:da7c with SMTP id
 4fb4d7f45d1cf-65fdd6d9f81mr1663776a12.13.1772186663157; Fri, 27 Feb 2026
 02:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227072031.581229-1-xry111@xry111.site> <CAAhV-H5nedWAfUXL-mwuoQGgn24pvS7=w9BwQ=t+iZfqJO0CFA@mail.gmail.com>
 <65a54e3763c903043d8051e3bc83c9cf783047b0.camel@xry111.site>
In-Reply-To: <65a54e3763c903043d8051e3bc83c9cf783047b0.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 27 Feb 2026 18:04:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6+Q_b4cr8jj3hmy1__h3060geMohx7hm1V8NvmeKPSiQ@mail.gmail.com>
X-Gm-Features: AaiRm53DMgyS0YfDP1J0J9HKzqlWUeydOKZ4Mi_TU31TciSZ5gjFEIcbmyBbK2Y
Message-ID: <CAAhV-H6+Q_b4cr8jj3hmy1__h3060geMohx7hm1V8NvmeKPSiQ@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: vDSO: Emit GNU_EH_FRAME correctly
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, Jinyang He <hejinyang@loongson.cn>, 
	WANG Rui <wangrui@loongson.cn>, Mingcong Bai <jeffbai@aosc.io>, Zixing Liu <liushuyu@aosc.io>, 
	"H . Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Menglong Dong <menglong8.dong@gmail.com>, 
	Bibo Mao <maobibo@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Hanlu Li <lihanlu@loongson.cn>, Nathan Chancellor <nathan@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Wentao Guan <guanwentao@uniontech.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 5:57=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Fri, 2026-02-27 at 16:58 +0800, Huacai Chen wrote:
>
> /* snip */
>
> > > diff --git a/arch/loongarch/include/asm/sigframe.h b/arch/loongarch/i=
nclude/asm/sigframe.h
> > > new file mode 100644
> > > index 000000000000..59db3de6db85
> > > --- /dev/null
> > > +++ b/arch/loongarch/include/asm/sigframe.h
> > > @@ -0,0 +1,12 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Separated from arch/loongarch/kernel/signal.c.
> > I think this is also unnecessary.
>
> Will remove this comment.
>
> /* snip */
>
> > > +        * This is also the reason we don't use SYM_FUNC_START.
> > > +        */
> > > +       nop
> > > +SYM_START(__vdso_rt_sigreturn, SYM_L_GLOBAL, SYM_A_ALIGN)
> > Is it possible to define SYM_SIGFUNC_START/SYM_SIGFUNC_END in
> > linkage.h, and then use them here?
>
> How about SYM_FUNC_{START,END}_NOCFI instead?
Of course I don't know how to name them, I just want to define a
wrapper to contain all .cfi_xxxx in this patch.

Huacai

> >
>
> --
> Xi Ruoyao <xry111@xry111.site>
>
