Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC48216BE17
	for <loongarch@lists.linux.dev>; Sat, 22 Feb 2025 08:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740212464; cv=none; b=FfpnrqbFNxulVFBaVurOXHeX/zzhHPhdnRTIoYUR1/sQ8+k4TOtFp5cdzbJ5025wMlTD325pTwAZRec08Ekdtt0i2Xz7g1/6gO3GEz63a4GocYkV/58XJ8ae5+tGmsjaXkXtb4rR5MpzU1xhF8hqjF5rLocp2vthVpVa0j6bWLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740212464; c=relaxed/simple;
	bh=C95UfLmMcJXU7vJhaKdMpplzfIPky73B5XuPmB/zLbg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/MJUrM6wYV0noO1bzc8JnunV+jPmY+pMHX/Ngy6mUHoWZhzu3ZEdV26w6SFIlrCawCafhZPSyqy3cifbd6Ai4KDdR4ble7CZzSX8f5fmxt/iu/G+O1Kt04/98aZt4ApLqg9a2+yyoVd71WujDDk5e6eQXDiIbrWOv2WD+84lP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=ndlk6Xh1; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="ndlk6Xh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740212460;
	bh=1q+MziLP+LRP2VrK2FzjijCA1tPSm0Mct61S8QV7OY4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ndlk6Xh1LDQ4IVzyCwXm+//RroUMYlrg93bkaGOnu/PB6zPDKJjYVM1f8u1zbnorm
	 6Wj9dxVkDjMZ8iYBCSeLLJkBb4sDAbSbTyaqhai1+lbpRWyuiyTuixexNlOL6xLK8h
	 Mbghzm1Uih9WOBd+JPF+dxhjdCJtmTB+W3bP4HQ8=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id BF6C9676E3;
	Sat, 22 Feb 2025 03:20:52 -0500 (EST)
Message-ID: <afc16fdc2417c3a761b880950c6c03998366e92f.camel@xry111.site>
Subject: Re: [PATCH v3 10/18] LoongArch: vDSO: Switch to generic storage
 implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anna-Maria Behnsen	 <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"	 <Jason@zx2c4.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt	 <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen	 <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Russell King	 <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao	 <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Ingo Molnar	 <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen	 <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,  Arnd Bergmann	
 <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	linux-csky@vger.kernel.org
Date: Sat, 22 Feb 2025 16:20:51 +0800
In-Reply-To: <20250204-vdso-store-rng-v3-10-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
	 <20250204-vdso-store-rng-v3-10-13a4669dfc8c@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-02-04 at 13:05 +0100, Thomas Wei=C3=9Fschuh wrote:
> The generic storage implementation provides the same features as the
> custom one. However it can be shared between architectures, making
> maintenance easier.
>=20
> Co-developed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Tested-by: Xi Ruoyao <xry111@xry111.site>

/* snip */

> diff --git a/arch/loongarch/include/asm/vdso/getrandom.h b/arch/loongarch=
/include/asm/vdso/getrandom.h
> index e80f3c4ac7481ba7f9f5d9210fefa78c3293243b..48c43f55b039b42168698614d=
0479b7a872d20f3 100644
> --- a/arch/loongarch/include/asm/vdso/getrandom.h
> +++ b/arch/loongarch/include/asm/vdso/getrandom.h

You can drop "#include <vdso/vdso.h>" in this file.

> @@ -28,11 +28,6 @@ static __always_inline ssize_t getrandom_syscall(void =
*_buffer, size_t _len, uns
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_d=
ata(void)
> -{
> -	return &_loongarch_data.rng_data;
> -}
> -
> =C2=A0#endif /* !__ASSEMBLY__ */
> =C2=A0
> =C2=A0#endif /* __ASM_VDSO_GETRANDOM_H */

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
