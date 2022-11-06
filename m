Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862467F
	for <loongarch@lists.linux.dev>; Sun,  6 Nov 2022 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1667721321;
	bh=jckOQch8ZWud/7HjlXfJvzhkem2w+yEu11ot5W859/g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VP5gyxHGbFDHctKGvtYbOjDCQFzJrYYO8371UV0JVqRH+Q7E81FIS/ui9vaHbqLfe
	 2/EVjTgjR9ke8eD9qidPZIWfcJFjeVGp8FHdyI2i8jeik+mZZW9isAE3vnvp37ecGA
	 dsg118Dhj3oElUCnrjMopIjNExmly1a6T/uR3QFo=
Received: from [IPv6:240e:358:11b5:d900:dc73:854d:832e:3] (unknown [IPv6:240e:358:11b5:d900:dc73:854d:832e:3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 9486A6697D;
	Sun,  6 Nov 2022 02:55:16 -0500 (EST)
Message-ID: <5809ae1e16eca3b686e1bfc844a2a4fcf5d1ef85.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system
 table
From: Xi Ruoyao <xry111@xry111.site>
To: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>,  WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Ard Biesheuvel <ardb@kernel.org>,  Jianmin Lv
 <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev
Date: Sun, 06 Nov 2022 15:55:08 +0800
In-Reply-To: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2022-11-06 at 14:56 +0800, Binbin Zhou wrote:
> Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency on
> flattened DT"), we can parse the FDT from efi system table.
>=20
> And now, the Loongson-2K series cpus based on LoongArch support booting
> with FDT, so we adds the relevant booting support as well as parameter
> parsing.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
> =C2=A0arch/loongarch/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A0arch/loongarch/include/asm/efi.h=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0arch/loongarch/include/asm/setup.h |=C2=A0 1 +
> =C2=A0arch/loongarch/kernel/efi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 27 ++++++++++-
> =C2=A0arch/loongarch/kernel/env.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ++
> =C2=A0arch/loongarch/kernel/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 75 ++=
+++++++++++++++++++++++++++-
> =C2=A06 files changed, 106 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 903096bd87f8..ce53d1fa2b64 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -111,6 +111,8 @@ config LOONGARCH
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select MODULES_USE_ELF_RE=
LA if MODULES
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select NEED_PER_CPU_EMBED=
_FIRST_CHUNK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select NEED_PER_CPU_PAGE_=
FIRST_CHUNK
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select OF
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select OF_EARLY_FLATTREE

I don't like unconditionally enabling OF or OF_EARLY_FLATTREE because
they are not needed for Loongson-3 workstations or servers.  And you are
already fusing the code with #ifdef CONFIG_OF_EARLY_FLATTREE anyway:

/* snip */

> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 1eb63fa9bc81..2f578f809a54 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c

/* snip */

> +static void __init fdt_setup(void)
> +{
> +#ifdef CONFIG_OF_EARLY_FLATTREE

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
