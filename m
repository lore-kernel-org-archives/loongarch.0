Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84B7A
	for <loongarch@lists.linux.dev>; Fri, 29 Jul 2022 02:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1659061684;
	bh=3Vqu37WO9M8OmlJ6f+Ltkq8HAoeghNsD/Pz+erySmno=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NGvT8NGVa1pi/RjmLZIxGd+XVfcuv6XvBcGE2GzHSsqfOR7m+5RlBwsNUYDZqEDoQ
	 AjMecyfpb2o8Bcr+6yNRMjf5O8+WtKYXxcEe52bCdSWaOuKpX10o9H1fswaT9NCFiJ
	 pNaMXW27QBTGvFqHTUUf1XISj+9UZDAQjoaoOaFc=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 8002C66B51;
	Thu, 28 Jul 2022 22:28:02 -0400 (EDT)
Message-ID: <06a332490e21353bcaf0678dc3f2f04e74bb3faf.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Disable executable stack by default
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org, Xuefeng Li
	 <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, Xuerui Wang
	 <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 29 Jul 2022 10:28:01 +0800
In-Reply-To: <20220726130224.3987623-1-chenhuacai@loongson.cn>
References: <20220726130224.3987623-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2022-07-26 at 21:02 +0800, Huacai Chen wrote:
> Disable executable stack for LoongArch by default, as all modern
> architectures do.

Should this be a 5.19 fix?  IIUC after the first release we'll be
impossible to change it because it would "break userspace".

Note that 5.19 release is scheduled this weekend.

> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> =C2=A0arch/loongarch/include/asm/elf.h | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/arch/loongarch/include/asm/elf.h
> b/arch/loongarch/include/asm/elf.h
> index f3960b18a90e..5f3ff4781fda 100644
> --- a/arch/loongarch/include/asm/elf.h
> +++ b/arch/loongarch/include/asm/elf.h
> @@ -288,8 +288,6 @@ struct arch_elf_state {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.interp_fp_abi =3D LOONGA=
RCH_ABI_FP_ANY,=C2=A0=C2=A0\
> =C2=A0}
> =C2=A0
> -#define elf_read_implies_exec(ex, exec_stk) (exec_stk =3D=3D
> EXSTACK_DEFAULT)
> -
> =C2=A0extern int arch_elf_pt_proc(void *ehdr, void *phdr, struct file *el=
f,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bool is_interp, struct arch_elf_state
> *state);
> =C2=A0

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
