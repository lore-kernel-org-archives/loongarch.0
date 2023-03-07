Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF920EE
	for <loongarch@lists.linux.dev>; Tue,  7 Mar 2023 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1678175521;
	bh=ShRPU3wNTh5O8YKgCsDckBdQYnhVkIA4cX2nF4JG1Iw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iNiaPLkscfV4mobaxImD/omf8R8mWHLjhWPF55T0awkn/Ofr8Dbegly2c00yvlTL2
	 aB6WsY30Yi8qNcVXBFWsFIs+FoEZ1Ujlxh5G95CVaKLjKV1dB36nLYSEtp+6V9vdln
	 +rVxw+vuXM9ZGYxD5tVOHNYiHnDH60/JcJjekN8o=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 95F0165AB5;
	Tue,  7 Mar 2023 02:51:58 -0500 (EST)
Message-ID: <d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site>
Subject: Re: [PATCH] tools/arch/loongarch: Use __SIZEOF_LONG__ to define
 __BITS_PER_LONG
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>,  WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Date: Tue, 07 Mar 2023 15:51:57 +0800
In-Reply-To: <1678174741-19219-1-git-send-email-yangtiezhu@loongson.cn>
References: <1678174741-19219-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-07 at 15:39 +0800, Tiezhu Yang wrote:
> Although __SIZEOF_POINTER__ is equal with _SIZEOF_LONG__ on LoongArch,
> it is better to use __SIZEOF_LONG__ to define __BITS_PER_LONG to keep
> consistent between arch/loongarch/include/uapi/asm/bitsperlong.h and
> tools/arch/loongarch/include/uapi/asm/bitsperlong.h.

I believe we should unify bitsperlong.h for all ports to use
(__SIZEOF_LONG__ * 8).  Now we specify GCC >=3D 5.1 or Clang (LLVM) >=3D
11.0.0 in min-tool-version.sh, where __SIZEOF_LONG__ is usable [1].  The
only remaining compiler is ICC, which is deprecated and won't be
supported for building the kernel after 6.3 [2].

[1]:https://gcc.godbolt.org/z/cnvW38vj6
[2]:https://www.phoronix.com/news/Linux-6.3-Drops-Intel-ICC

>=20
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> =C2=A0tools/arch/loongarch/include/uapi/asm/bitsperlong.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
> b/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
> index d4e32b3..00b4ba1 100644
> --- a/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
> +++ b/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
> @@ -2,7 +2,7 @@
> =C2=A0#ifndef __ASM_LOONGARCH_BITSPERLONG_H
> =C2=A0#define __ASM_LOONGARCH_BITSPERLONG_H
> =C2=A0
> -#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
> +#define __BITS_PER_LONG (__SIZEOF_LONG__ * 8)
> =C2=A0
> =C2=A0#include <asm-generic/bitsperlong.h>
> =C2=A0

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
