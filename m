Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A942AB2B
	for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 08:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1687336712;
	bh=kb1YO24RETNeRnictMxSG2G7loPOdscUfgy/+YYG6Hw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Xj3n/2aokTDjl7MwE7mN2wNstLno3I0wBWlHdmtTmxyuhcaPfPwkNePbYKitj35Zl
	 /3CQ5Iupm+ls01MNvazxLI2ztCIWWxO9cT3rIg6N7eHJ4AcnV8tB0gIM1t+P+UIfId
	 EuvUqGT1BatI/oT3nukiIBDU02CQyj1zGvUu1ps4=
Received: from [192.168.124.11] (unknown [115.155.1.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 532CB65C91;
	Wed, 21 Jun 2023 04:38:31 -0400 (EDT)
Message-ID: <ba031a5af664ae4662218df523913a7b3edbee9d.camel@xry111.site>
Subject: Re: [PATCH] Documentation/features: LoongArch supports
 ARCH_HAS_ELF_RANDOMIZE
From: Xi Ruoyao <xry111@xry111.site>
To: Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 21 Jun 2023 16:38:29 +0800
In-Reply-To: <20230620082837.10006-1-xry111@xry111.site>
References: <20230620082837.10006-1-xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Please disregard, Huacai and Tiezhu will batch update the features doc
for LoongArch in the 6.5 cycle.

On Tue, 2023-06-20 at 16:28 +0800, Xi Ruoyao wrote:
> LoongArch selects ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT, and the
> latter
> selects ARCH_HAS_ELF_RANDOMIZE.
>=20
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
> =C2=A0Documentation/features/vm/ELF-ASLR/arch-support.txt | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/features/vm/ELF-ASLR/arch-support.txt
> b/Documentation/features/vm/ELF-ASLR/arch-support.txt
> index 15164f36f224..21f3bbef5ef0 100644
> --- a/Documentation/features/vm/ELF-ASLR/arch-support.txt
> +++ b/Documentation/features/vm/ELF-ASLR/arch-support.txt
> @@ -13,7 +13,7 @@
> =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csky=
: | TODO |
> =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 hexagon: | TODO |
> =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ia64=
: | TODO |
> -=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 loongarch: | TODO |
> +=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 loongarch: |=C2=A0 ok=C2=A0 |
> =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m68k=
: | TODO |
> =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 microblaze: | TODO |
> =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mips=
: |=C2=A0 ok=C2=A0 |

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
