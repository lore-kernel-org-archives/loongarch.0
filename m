Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DF020E334
	for <loongarch@lists.linux.dev>; Sat, 14 Feb 2026 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771075291; cv=none; b=Y9NwUf+U1Yw1uGgSguBLqKbu3ytebzFXCW8ten9Cdkhu1qlup1qn/hFag9fRRDweUUroMyHMr9CbMSRKfUIJpi5LnsbrMe6QpQyArJqbLT0+50SKQF6ygH9eIsVq3XkxdLYahYTj0yP33oCl8IJiYURtJsvHQmYxmI2upNcCzEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771075291; c=relaxed/simple;
	bh=TgAINh7AkrQHq98HFKAPjnS1TrOaofTq6HlgB/QHRvY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O5Yd5TRHkiCzQAmXsKF2AOpn035HKMna6Yr0oprLyQxr2VXqz7NnA47UCjkpMRbNhm4TIbDuhF6CLpg/O7vraiJqkkTIPnqYSyVclF1NKbKlPIUjP0RVGERh8YjDnvS6Fi4/4UAwEQa9+y4UCheB+9vwtgu6MrkbGpoQs2Nmo2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=A9IPDM0c; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="A9IPDM0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1771075281;
	bh=TgAINh7AkrQHq98HFKAPjnS1TrOaofTq6HlgB/QHRvY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=A9IPDM0c2SFwFfPeUQ5I1YnXmgogs7X+3u3k/73f8pAqBzmW0EYrRK6ly0u0cxT25
	 i4W2WRXvYiNSXzIMsAi7w2BeWR44daFZvToEA5wcCfR4FVSYbKAF9vvC5Im/7JWyt8
	 TCR0n5eKzcsCCU7S9VHinzeOAZQ+SNru/HHaKt8Y=
Received: from [IPv6:2408:8427:6a1:ffef:9848:ba49:67aa:3472] (unknown [IPv6:2408:8427:6a1:ffef:9848:ba49:67aa:3472])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3DB1666222;
	Sat, 14 Feb 2026 08:21:16 -0500 (EST)
Message-ID: <183595cad33ba7aa85482d7e566b914a8c917584.camel@xry111.site>
Subject: Ping: [PATCH] LoongArch: Don't define __ARCH_WANT_NEW_STAT for LA32
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Arnd Bergmann
	 <arnd@arndb.de>
Cc: Mingcong Bai <jeffbai@aosc.io>, loongarch@lists.linux.dev, Jiaxun Yang
	 <jiaxun.yang@flygoat.com>, open list <linux-kernel@vger.kernel.org>
Date: Sat, 14 Feb 2026 21:21:11 +0800
In-Reply-To: <20251215033443.196159-2-xry111@xry111.site>
References: <20251215033443.196159-2-xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Ping.

On Mon, 2025-12-15 at 11:34 +0800, Xi Ruoyao wrote:
> While on LA64 we had added __ARCH_WANT_NEW_STAT back for technological
> aesthetics reason, on LA32 the newstat family suffers Y2038 issue and it
> should not be used at all, as the commit 82b355d161c9 ("y2038: Remove
> newstat family from default syscall set") has already pointed out.
>=20
> Fixes: 14338e631afd ("LoongArch: Adjust system call for 32BIT/64BIT")
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
> =C2=A0arch/loongarch/include/asm/unistd.h | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/arch/loongarch/include/asm/unistd.h b/arch/loongarch/include=
/asm/unistd.h
> index e2c0f3d86c7b..4a7e4a6b6627 100644
> --- a/arch/loongarch/include/asm/unistd.h
> +++ b/arch/loongarch/include/asm/unistd.h
> @@ -8,7 +8,10 @@
> =C2=A0
> =C2=A0#include <uapi/asm/unistd.h>
> =C2=A0
> +#if defined(__LP64__) && !defined(__SYSCALL_COMPAT)
> =C2=A0#define __ARCH_WANT_NEW_STAT
> +#endif
> +
> =C2=A0#define __ARCH_WANT_SYS_CLONE
> =C2=A0
> =C2=A0#define NR_syscalls (__NR_syscalls)

--=20
Xi Ruoyao <xry111@xry111.site>
