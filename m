Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D917F5
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 05:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1676439367;
	bh=rVyZAFFRh7e/R88WQ0bLxVMue6cqCoIBHLnwDLoBYqA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=dX/daGUGivN0y6yEX4yhthTptihmU5h3T7aaehDQeiSKw2GGfJqGQYB82/OxMJT2j
	 qy6PltM1z8OFV5nr/7ZWzTKJmh2q8qIYH8kjx6BaLgYZP1Daf/f9Ki02muxgSQpYyv
	 AEmEygft9BGUG8eS6TAM4t0VNREO7hMwLCOdzpuE=
Received: from [IPv6:240e:456:1020:352:6860:35c9:52f4:b84b] (unknown [IPv6:240e:456:1020:352:6860:35c9:52f4:b84b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 95DAA667C4;
	Wed, 15 Feb 2023 00:36:02 -0500 (EST)
Message-ID: <511d385675ea7a846ff791974c6ae7feeeec2589.camel@xry111.site>
Subject: Re: "kernel ade access" oops on LoongArch
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>
Cc: loongarch@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org
Date: Wed, 15 Feb 2023 13:35:56 +0800
In-Reply-To: <2e902dfa-cb84-7ef0-6b50-02b16354a139@loongson.cn>
References: <1e6f4d35946e4e2e7c7f5dcc7b69d5e609de8184.camel@xry111.site>
	 <2e902dfa-cb84-7ef0-6b50-02b16354a139@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-02-15 at 12:52 +0800, Youling Tang wrote:
> ../stdlib/stdlib.h:141:8: error: =E2=80=98_Float32=E2=80=99 does not name=
 a type
> =C2=A0=C2=A0 141 | extern _Float32 strtof32 (const char *__restrict __npt=
r,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~

This is because Glibc expects GCC 13 to support _Float32, but early GCC
13 snapshots did not.

> /usr/bin/ld: /home/loongson/build_glibc/libc.a(dl-reloc-static-pie.o):
> in function `_dl_relocate_static_pie':
> /home/loongson/glibc/elf/dl-reloc-static-pie.c:44: undefined reference
> to `_DYNAMIC'

Oh, this one is my fault.  The check for compiler static PIE support was
not written correctly.  I'll fix it for Glibc later, but now you can
update GCC to the latest git master to proceed.
--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
