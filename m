Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660846D090
	for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461315; cv=none; b=XYTpr58fGn/4Y9FaWPrHYgEs32VlQpYt1bnbJia7JkTR/Oy5wcWBuAMCtfM8sEepCon6UFCF8p+sVl59Ohyj3nY0fJCGGwyEST5JZDXmrXuKe54gP17JPACDcwvlLk0OvwD3KNY1QJnOl5axSz99VvV9hZi72pU7MLpCIpq9SBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461315; c=relaxed/simple;
	bh=L0xgOwgQMY/YiEDRH5Y2m4wsmzuwdOvSsCzLnKAQjdU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jpId4naUDPoM50vBLTcKbTj2CppMSGDM0mBkPQT3Tpz5MvwZawYwAKfSIKtjvfrPh98QCEcm+EOoWGOxNGapczasgt5moDzj9ZHeGPAA+iFHNpdUW4Kjvlkp+esYl+l/8KsQJ2+Thb9MuCg35zFHvtLh8y6SEW8Nr4Dv7IRz7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=ddzNpYYN; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="ddzNpYYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1789460917;
	bh=z358u1wR+49qt4YEKetvKaiKAz+WI+WT/D6qYHndaF8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ddzNpYYNdu56mMuP/Znb+yFJwkAvkHkzBqF3ugqZGrq6S4UJzwFZMm8aSJIQFynCS
	 t1rKSbWLqU87TedOK2Ng7PwLlE5Ele8l8bDouV6ye7B0fBs3mTPNs9KtF+R7SE7w3e
	 ePqNWF2+sx2XXuURyM68bzQtT87zbxBWJGFm2lAU=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id A07CC65BE6;
	Tue, 15 Sep 2026 04:28:36 -0400 (EDT)
Message-ID: <c103b00442e97e257bd999bf322b88b03af67df4.camel@xry111.site>
Subject: Re: [PATCH v2] LoongArch: Remove arch-specific
 __smp_mb__{before,after}_atomic()
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Tue, 15 Sep 2026 16:28:34 +0800
In-Reply-To: <20260908073906.31781-1-yangtiezhu@loongson.cn>
References: <20260908073906.31781-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-09-08 at 15:39 +0800, Tiezhu Yang wrote:
> When running the BPF selftest "test_progs -t timer_lockup" on a LoongArch
> machine, the kernel intermittently experiences soft lockups and panics in
> hrtimer_cancel().
>=20
> The root cause is that bpf_timer_cancel() relies on smp_mb__after_atomic(=
)
> to provide a full data barrier after a relaxed atomic_inc() to ensure the
> proper store-load ordering before performing lockless dependency checks o=
n
> weakly-ordered architectures such as LoongArch, but the current definitio=
n
> of smp_mb__after_atomic() is a plain compiler barrier.
>=20
> This allows a subsequent read to bypass the prior write due to store-load
> reordering, enabling concurrent CPUs to simultaneously bypass the softwar=
e
> deadlock detection, enter hrtimer_cancel(), and then trigger a severe ABB=
A
> deadlock in the hrtimer core.
>=20
> Moreover, there are hundreds of smp_mb__after_atomic() call sites across
> the core kernel (kernel/, drivers/, mm/, net/, fs/) that currently lack
> necessary full data barriers on LoongArch, which have potential risks.
>=20
> To comply with the LKMM specification, fix this by removing the incorrect
> arch-specific definition of __smp_mb__after_atomic(), so that this macro
> can automatically fall back to the generic definition in asm-generic that
> maps to __smp_mb() and emits the required hardware DBAR instruction. Whil=
e
> at it, do the same thing for __smp_mb__before_atomic().
>=20
> With this patch, the BPF timer_lockup selftest was stressed for 1 million
> consecutive loops on a physical LoongArch machine without encountering an=
y
> further lockups.
>=20
> Reported-by: Vincent Li <vincent.mc.li@gmail.com>
> Closes: https://lore.kernel.org/loongarch/CAK3+h2xOSEZUHhou7N2cRL-aGrZCNS=
m45g+P7thObMe+fpgYCA@mail.gmail.com/
> Fixes: 46859ac8af52 ("LoongArch: Add multi-processor (SMP) support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

The Documentation/atomic_t.txt file says:

   These helper barriers exist because architectures have varying implicit
   ordering on their SMP atomic primitives. For example our TSO architectur=
es
   provide full ordered atomics and these barriers are no-ops.

So yes, a compiler barrier cannot be enough.  If I read that file
correctly smp_mb__{before,after}_atomic can only be more permissive than
smp_mb because they allow some accesses *not* against the atomic itself
to pass through, unfortunately LoongArch does not provide such a
"address-aware barrier" so there seems nothing we can do better than a
full barrier.

Reviewed-by: Xi Ruoyao <xry111@xry111.site>

--=20
Xi Ruoyao <xry111@xry111.site>
