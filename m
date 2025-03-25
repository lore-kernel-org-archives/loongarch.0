Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494025DAEB
	for <loongarch@lists.linux.dev>; Tue, 25 Mar 2025 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742906459; cv=none; b=SbFcJ880/HS6zqat3BEt8ExWCH1OJAeptVcEGj76kbN0VVGF7cFWz8jLVDKWUUmG96naGnoLQ8rc471L9KWwB9Ad6ilopheRIQu4TqZDNnwPNFsdeiCGs9cUHKjeO4y6hYLKWvGeQugl1qpkJorPDUNlc1g8vSa6E5fLW0OcylE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742906459; c=relaxed/simple;
	bh=ejm2A6hhJJ4fbaZdOjKiCdzbvqoQ//rS0S5S0wQB5YQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rADzfsC5cuHcXwh1l0/BBGaAfc3dXIOU9bkRb8/sboiegWeEDuQWC+pYEDHjvqlfrsoOdBvO67FH+bjm++D/mk/5yv3ju6emyz4AgZ+tROHqS7EM/EyiNEKmch7RN/VIlran/2OaBbnSFck4gg8emygvSJui6i0xIyCGIPIkqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=WKFWGnBT; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="WKFWGnBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1742906124;
	bh=TE+vA1UOOULrsjHrZ0BWUUKOHwMObbeETOyJqr0S89Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WKFWGnBT6uZW3rhqc+wV4ktdPPgSU9fZpNR883fWJxWEEafdfFV/DgXqhbLCm3fId
	 S0dGrQ2/xLZ1L4E4kTWkUM0gsdRPzXuJcwVCipb7FlgAdMQLQNRNYHIhQBMsCdRo+B
	 FcekQjoGDleyU9j/UsbAxxjFq31jySoU9tTkpF8w=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 2D28565992;
	Tue, 25 Mar 2025 08:35:24 -0400 (EDT)
Message-ID: <2d9bef01f7cf43d1456d9b0d19715a3b7d0fe234.camel@xry111.site>
Subject: Re: [PATCH loongarch-next] LoongArch: make xor_template.c include
 once
From: Xi Ruoyao <xry111@xry111.site>
To: ye.xingchen@zte.com.cn, chenhuacai@kernel.org
Cc: kernel@xen0n.name, loongarch@lists.linux.dev
Date: Tue, 25 Mar 2025 20:35:22 +0800
In-Reply-To: <20250325190844051uFjo0CxrlPVQEpKrtPO_0@zte.com.cn>
References: <20250325190844051uFjo0CxrlPVQEpKrtPO_0@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-03-25 at 19:08 +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>=20
> The line #include "xor_template.c" has been added twice in the file.
> Modifying it to include the file once and control the logic with macros,
> would likely improve code readability.

Have you ever compile-test your change?

  CC      arch/loongarch/lib/xor_simd.o
In file included from arch/loongarch/lib/xor_simd.c:10:
arch/loongarch/lib/xor_template.c:16:20: error: expected declaration specif=
iers or '...' before numeric constant
   16 | void XOR_FUNC_NAME(2)(unsigned long bytes,
      |                    ^
arch/loongarch/lib/xor_template.c:35:20: error: expected declaration specif=
iers or '...' before numeric constant
   35 | void XOR_FUNC_NAME(3)(unsigned long bytes,
      |                    ^
arch/loongarch/lib/xor_template.c:57:20: error: expected declaration specif=
iers or '...' before numeric constant
   57 | void XOR_FUNC_NAME(4)(unsigned long bytes,
      |                    ^
arch/loongarch/lib/xor_template.c:83:20: error: expected declaration specif=
iers or '...' before numeric constant
   83 | void XOR_FUNC_NAME(5)(unsigned long bytes,
      |                    ^

Nacked-by: Xi Ruoyao <xry111@xry111.site>

>=20
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
> =C2=A0arch/loongarch/lib/xor_simd.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/loongarch/lib/xor_simd.c b/arch/loongarch/lib/xor_simd.=
c
> index 84cd24b728c4..64bb32e526b9 100644
> --- a/arch/loongarch/lib/xor_simd.c
> +++ b/arch/loongarch/lib/xor_simd.c
> @@ -6,6 +6,9 @@
> =C2=A0 */
>=20
> =C2=A0#include "xor_simd.h"
> +#if defined(CONFIG_CPU_HAS_LSX) || defined(CONFIG_CPU_HAS_LASX)
> +#include "xor_template.c"
> +#endif
>=20
> =C2=A0/*
> =C2=A0 * Process one cache line (64 bytes) per loop. This is assuming all=
 future
> @@ -45,7 +48,6 @@
> =C2=A0	ST(3, base, 48)
>=20
> =C2=A0#define XOR_FUNC_NAME(nr) __xor_lsx_##nr
> -#include "xor_template.c"
>=20
> =C2=A0#undef LD
> =C2=A0#undef ST
> @@ -80,7 +82,6 @@
> =C2=A0	ST(1, base, 32)
>=20
> =C2=A0#define XOR_FUNC_NAME(nr) __xor_lasx_##nr
> -#include "xor_template.c"
>=20
> =C2=A0#undef LD
> =C2=A0#undef ST

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
