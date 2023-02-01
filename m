Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C420E0
	for <loongarch@lists.linux.dev>; Wed,  1 Feb 2023 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1675249754;
	bh=KgL43wQ3kPsTkQ5m+/+Q26nDzaZ4pmpPRj2FPWVxTUs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=C0t5G+ErswNWyt0GnaHVhVswjZ08pZQpzuQuRdT5Vo7K/UQjjZn6kLPJLNf5hd6Gl
	 Zlc+rOzSYYB2b3grow/e2lwqeKOhPNX8dh+bZe0xiJa9vATsXScMtB7HuVNdi46zWV
	 xDt0zacmto745SsyZTn4CFqAoyPFQpCQ8a/nkslY=
Received: from [IPv6:240e:358:117f:3800:dc73:854d:832e:2] (unknown [IPv6:240e:358:117f:3800:dc73:854d:832e:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6A41F65C7B;
	Wed,  1 Feb 2023 06:09:11 -0500 (EST)
Message-ID: <682fcd7bb7ce1b5d04dafa2cd9d8608e6ba80189.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Fix Chinese comma
From: Xi Ruoyao <xry111@xry111.site>
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 01 Feb 2023 19:09:04 +0800
In-Reply-To: <20230201092904.11070-1-hejinyang@loongson.cn>
References: <20230201092904.11070-1-hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-02-01 at 17:29 +0800, Jinyang He wrote:
> Fix Chinese comma in cpu.h.
>=20
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>

This is obvious, while I'm wondering if we have a "-Werror=3Dsomething"
compiler option which can catch non-ASCII characters immediately.

> ---
> =C2=A0arch/loongarch/include/asm/cpu.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/loongarch/include/asm/cpu.h
> b/arch/loongarch/include/asm/cpu.h
> index 754f28506791..c3da91759472 100644
> --- a/arch/loongarch/include/asm/cpu.h
> +++ b/arch/loongarch/include/asm/cpu.h
> @@ -36,7 +36,7 @@
> =C2=A0
> =C2=A0#define PRID_SERIES_LA132=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x8000=
=C2=A0 /* Loongson 32bit */
> =C2=A0#define PRID_SERIES_LA264=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xa000=
=C2=A0 /* Loongson 64bit, 2-issue */
> -#define PRID_SERIES_LA364=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xb000=C2=
=A0 /* Loongson 64bit=EF=BC=8C3-issue */
> +#define PRID_SERIES_LA364=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xb000=C2=
=A0 /* Loongson 64bit, 3-issue */
> =C2=A0#define PRID_SERIES_LA464=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xc000=
=C2=A0 /* Loongson 64bit, 4-issue */
> =C2=A0#define PRID_SERIES_LA664=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xd000=
=C2=A0 /* Loongson 64bit, 6-issue */
> =C2=A0

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
