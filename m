Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCCA3C3C;
	Sat, 24 Jun 2023 19:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1687633637;
	bh=IFHbcQKorjSN9Dp63NRvEuStEH8On6qKJMUm6jbMLyU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bPJaTSzlxk2dTxP4Glpfe28xB11ohsQBlz3qYXP/NnIlJUGBzVvYCHyHE3RWEDbpJ
	 ROc91PUW1neKVeD7CKszABYLjjlw3LnE7equmTGybo3m8KMz3DkF36bVZTzWILWbJh
	 1Vftct6yiQaaVC5Yxj49NmPHBuy2Eh9tyINqv3y8=
Received: from [IPv6:240e:358:11d2:6c00:dc73:854d:832e:2] (unknown [IPv6:240e:358:11d2:6c00:dc73:854d:832e:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6703E65ECA;
	Sat, 24 Jun 2023 15:07:13 -0400 (EDT)
Message-ID: <7142bd60ca9764fe836a76d61513bbcc66ded783.camel@xry111.site>
Subject: Re: [PATCH v2 7/9] LoongArch: Tweak CFLAGS for Clang compatibility
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>, loongarch@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org,  WANG Xuerui <git@xen0n.name>
Date: Sun, 25 Jun 2023 03:07:09 +0800
In-Reply-To: <20230624184055.3000636-8-kernel@xen0n.name>
References: <20230624184055.3000636-1-kernel@xen0n.name>
	 <20230624184055.3000636-8-kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2023-06-25 at 02:40 +0800, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
>=20
> Now the arch code is mostly ready for LLVM/Clang consumption, it is
> time
> to re-organize the CFLAGS a little to actually enable the LLVM build.
>=20
> In particular, -mexplicit-relocs and -mdirect-extern-access are not
> necessary nor supported on Clang; feature detection via cc-option
> would
> not work, because that way the broken combo of "new GNU as + old GCC"
> would seem to get "fixed", but actually produce broken kernels.
> Explicitly depending on CONFIG_CC_IS_CLANG is thus necessary to not
> regress UX for those building their own kernels.
>=20
> A build with !RELOCATABLE && !MODULE is confirmed working within a
> QEMU
> environment; support for the two features are currently blocked on
> LLVM/Clang, and will come later.
>=20
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
> =C2=A0arch/loongarch/Makefile | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 366771016b99..82c619791a63 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -51,7 +51,9 @@ LDFLAGS_vmlinux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0+=3D -static -n
> -nostdlib
> =C2=A0
> =C2=A0# When the assembler supports explicit relocation hint, we must use=
 it.
> =C2=A0# GCC may have -mexplicit-relocs off by default if it was built wit=
h an old
> -# assembler, so we force it via an option.
> +# assembler, so we force it via an option. For LLVM/Clang the desired be=
havior
> +# is the default

Actually -mdirect-extern-access is also a part of the desired behavior.
Though it's not strictly needed, it is a micro-optimization to avoid
unnecessary GOT accesses.  Maybe with Clang the LTO pass can optimize
them away but I'm not sure.

Ok with the flags change (for now) but the comment can be more accurate.

> , and the flag is not supported, so don't pass it if Clang is
> +# being used.
> =C2=A0#
> =C2=A0# When the assembler does not supports explicit relocation hint, we=
 can't use
> =C2=A0# it.=C2=A0 Disable it if the compiler supports it.
> @@ -61,8 +63,10 @@ LDFLAGS_vmlinux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0+=3D -static -n -nostdlib
> =C2=A0# combination of a "new" assembler and "old" compiler is not suppor=
ted.=C2=A0 Either
> =C2=A0# upgrade the compiler or downgrade the assembler.
> =C2=A0ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
> +ifndef CONFIG_CC_IS_CLANG
> =C2=A0cflags-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0+=3D -mexplicit-relocs
> =C2=A0KBUILD_CFLAGS_KERNEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0+=3D -mdirect-extern-access
> +endif
> =C2=A0else
> =C2=A0cflags-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0+=3D $(call cc-option,-mno-explicit-relocs)
> =C2=A0KBUILD_AFLAGS_KERNEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0+=3D -Wa,-mla-global-with-pcrel

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
