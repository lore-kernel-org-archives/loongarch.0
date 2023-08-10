Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB9E815
	for <loongarch@lists.linux.dev>; Thu, 10 Aug 2023 03:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1691637640;
	bh=ZRjJK9TO0Kh+oqy8NFNgUNVHu1d04LQHN4wnO364oMU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=i7NJL4nYaNSqA2zY3DyYUXUi33suyrd5kzo3KjY4dLOL9XqSBO6+U4tYHPvsrpDVh
	 4hSOYE1rI0iuEBUUaMlSRbL5/Tn4ZHkdcGusTSdxp2kB5/W8u9b4iDcaiX8V8bjbm1
	 sOZIO62fkRJ3/BTq1b27ZrupdxjxuecXcnllQeP8=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 5AF79659AD;
	Wed,  9 Aug 2023 23:20:37 -0400 (EDT)
Message-ID: <ce4cee2d76340d1776560c124c1894080ded13bb.camel@xry111.site>
Subject: Re: [PATCH V2] LoongArch: Fix module relocation error with binutils
 2.41
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org, Xuefeng Li
 <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, Xuerui Wang
 <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn, WANG
 Xuerui <git@xen0n.name>, stable@vger.kernel.org
Date: Thu, 10 Aug 2023 11:20:35 +0800
In-Reply-To: <20230710050024.2519893-1-chenhuacai@loongson.cn>
References: <20230710050024.2519893-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Can we backport this patch into stable?  It fixes a build error with
binutils >=3D 2.41.

On Mon, 2023-07-10 at 13:00 +0800, Huacai Chen wrote:
> Binutils 2.41 enables linker relaxation by default, but the kernel
> module loader doesn't support that, so just disable it. Otherwise we
> get such an error when loading modules:
>=20
> "Unknown relocation type 102"
>=20
> As an alternative, we could add linker relaxation support in the kernel
> module loader. But it is relatively large complexity that may or may not
> bring a similar gain, and we don't really want to include this linker
> pass in the kernel.
>=20
> Reviewed-by: WANG Xuerui <git@xen0n.name>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> =C2=A0arch/loongarch/Makefile | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 09ba338a64de..7466d3b15db8 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -68,6 +68,8 @@ LDFLAGS_vmlinux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0+=3D -static -n -nostdlib
> =C2=A0ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
> =C2=A0cflags-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0+=3D $(call cc-option,-mexplicit-relocs)
> =C2=A0KBUILD_CFLAGS_KERNEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0+=3D $(call cc-option,-mdirect-extern-access)
> +KBUILD_AFLAGS_MODULE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0+=3D $(call cc-option,-mno-relax) $(call cc-option,-Wa$(comm=
a)-mno-relax)
> +KBUILD_CFLAGS_MODULE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0+=3D $(call cc-option,-mno-relax) $(call cc-option,-Wa$(comm=
a)-mno-relax)
> =C2=A0else
> =C2=A0cflags-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0+=3D $(call cc-option,-mno-explicit-relocs)
> =C2=A0KBUILD_AFLAGS_KERNEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0+=3D -Wa,-mla-global-with-pcrel

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
