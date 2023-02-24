Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06757C
	for <loongarch@lists.linux.dev>; Fri, 24 Feb 2023 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1677224406;
	bh=XTnPbVOCMVGJVcNvc/eXslOzCR98VNQGqDY/qUPMfLw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=k/uG1B4m4Y/rJhRakL7lK2iVeWILpnlVLRT072NMwDhM5xdTKjRyBez9LgBfPvKSl
	 THeA/mmOnQthXQvRAHGB97nWAHP8tsDdwx/9hzrNg6b8nCLwyhA4lT6e4JYCJcfLSJ
	 PmENnwyDkVR0n0evbrNdeyH7RNr+B2O9gHlNiAFA=
Received: from [192.168.43.231] (unknown [123.138.183.192])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id CB42E65C53;
	Fri, 24 Feb 2023 02:40:04 -0500 (EST)
Message-ID: <2abc92962b6412f18a7ae0444194804ad96a1d20.camel@xry111.site>
Subject: Re: [PATCH] LoongArch/syscall: remove asm/unistd.h include from
 syscall.c
From: Xi Ruoyao <xry111@xry111.site>
To: Enze Li <lienze@kylinos.cn>, chenhuacai@kernel.org, kernel@xen0n.name
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Fri, 24 Feb 2023 15:40:00 +0800
In-Reply-To: <20230224064921.299908-1-lienze@kylinos.cn>
References: <20230224064921.299908-1-lienze@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-02-24 at 14:49 +0800, Enze Li wrote:
> At first glance, this inclusion looks weird.=C2=A0 After digging further,=
 I
> realized that there's no need to include the "asm/unistd.h" file.

How did you get this conclusion?  When I run "make
arch/loongarch/kernel/syscall.i" it seems the preprocessed result indeed
contains some entries imported from asm/unistd.h:

void *sys_call_table[451] =3D {
 [0 ... 451 - 1] =3D sys_ni_syscall,
# 1 "./arch/loongarch/include/asm/unistd.h" 1
# 9 "./arch/loongarch/include/asm/unistd.h"
# 1 "./arch/loongarch/include/uapi/asm/unistd.h" 1
# 1 "./include/uapi/asm-generic/unistd.h" 1
# 34 "./include/uapi/asm-generic/unistd.h"
[0] =3D (sys_io_setup),
[1] =3D (sys_io_destroy),
[2] =3D (sys_io_submit),
[3] =3D (sys_io_cancel),
[4] =3D (sys_io_getevents),

/* snip */

> I've tested this patch for a few weeks, and didn't see any regressions.

Frankly, I can't believe this.

> Therefore, removes the unnecessary inclusion.
>=20
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
> =C2=A0arch/loongarch/kernel/syscall.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/arch/loongarch/kernel/syscall.c
> b/arch/loongarch/kernel/syscall.c
> index 3fc4211db989..4dea411e9e0d 100644
> --- a/arch/loongarch/kernel/syscall.c
> +++ b/arch/loongarch/kernel/syscall.c
> @@ -31,7 +31,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned
> long, len, unsigned long,
> =C2=A0
> =C2=A0void *sys_call_table[__NR_syscalls] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[0 ... __NR_syscalls - 1]=
 =3D sys_ni_syscall,
> -#include <asm/unistd.h>
> =C2=A0};
> =C2=A0
> =C2=A0typedef long (*sys_call_fn)(unsigned long, unsigned long,
>=20
> base-commit: 804f6d04b1adae9602edbd6410c0ba3a556964fe

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
