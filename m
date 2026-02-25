Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1709E392824
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016508; cv=none; b=n8pHyf46jY7hgSJkDUqQfWsbUDvu/lpzRn16vKnkq/OFm+DOnwVFCry/874tIUoNhR3lt7XIPUTDX+8sd1izFWYz973LUWM0v3ICz85SxK+KgPpjquaKPV2i5pnuFo2vyMcuEWS6+IA5IQ8EA15JDchm3EUkIvCDPEiq6qnYsts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016508; c=relaxed/simple;
	bh=3G7eOh3gPI7+Assdr0E7boXKHEgdJi4r6Nk5nD2RUXg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j+5BUgpu3Dd4YcdCCTCjk/qb7huc49L1KNJQ/2oys/hFlW6mzJGCBKpBXmyqftCbhm4SQNBPyOOpiGug20Mu5vYPxZZWtz4mRQco3o+cR+fd5yObJqUo2BJiyU04Qv9CGEnBq+a7pen43pV1sNUxcskbNqhT8RB4faGuV4JBo2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=dB0qHVDQ; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="dB0qHVDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1772016506;
	bh=W4Wx3SDh/mzpMoyF21pwdIx2JTnFftFUlUrWx6YcEGE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=dB0qHVDQK8WCjozgi9aURdAHZxSXZU5POoFUuDF61+8Lby/hbfAzjDPKn8re5zbrz
	 S/Ou91VZDR3csonTRCBRaXfxEdhc9E8Pq5CgYQsMynMJh0nSp63VZ7IRM+Kj497IBP
	 bbI3XHztkFtLG4VId+zExOrNXJzJDUJRwB4xF9XQ=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id A3C6C1A42B5;
	Wed, 25 Feb 2026 05:48:24 -0500 (EST)
Message-ID: <9fea14633756325f822c5d5242224494c0cb4cbe.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Only use SC.Q when supported by the assembler
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 George Guo <guodongtai@kylinos.cn>,  Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 25 Feb 2026 18:48:22 +0800
In-Reply-To: <20260225-loongarch-scq-v1-1-47acc2e45ec2@linutronix.de>
References: <20260225-loongarch-scq-v1-1-47acc2e45ec2@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-02-25 at 11:09 +0100, Thomas Wei=C3=9Fschuh wrote:
> The 128-bit atomic cmpxchg implementation uses the SC.Q instruction.
> Older versions of GNU AS do not support that instruction, erroring out:
>=20
> ERROR:root:{standard input}: Assembler messages:
> {standard input}:4831: Error: no match insn: sc.q	$t0,$t1,$r14
> {standard input}:6407: Error: no match insn: sc.q	$t0,$t1,$r23
> {standard input}:10856: Error: no match insn: sc.q	$t0,$t1,$r14
> make[4]: *** [../scripts/Makefile.build:289: mm/slub.o] Error 1
>=20
> (Binutils 2.41)
>=20
> Test support for SC.Q in kconfig and disable the atomics if the
> instruction is not available.
>=20
> Fixes: f0e4b1b6e295 ("LoongArch: Add 128-bit atomic cmpxchg support")
> Closes: https://lore.kernel.org/lkml/20260216082834-edc51c46-7b7a-4295-8e=
a5-4d9a3ca2224f@linutronix.de/
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

I have written something similar (only the identifier of the config
entry is different), but I just didn't get the time to set up an old
toolchain and test it.

Reviewed-by: Xi Ruoyao <xry111@xry111.site>

> ---
> =C2=A0arch/loongarch/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A0arch/loongarch/include/asm/cmpxchg.h | 5 +++++
> =C2=A02 files changed, 8 insertions(+)
>=20
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d211c6572b0a..92068ff38685 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -304,6 +304,9 @@ config AS_HAS_LBT_EXTENSION
> =C2=A0config AS_HAS_LVZ_EXTENSION
> =C2=A0	def_bool $(as-instr,hvcl 0)
> =C2=A0
> +config AS_HAS_SCQ_EXTENSION
> +	def_bool $(as-instr,sc.q \$t0$(comma)\$t1$(comma)\$t2)
> +
> =C2=A0config CC_HAS_ANNOTATE_TABLEJUMP
> =C2=A0	def_bool $(cc-option,-mannotate-tablejump)
> =C2=A0
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/includ=
e/asm/cmpxchg.h
> index 58cabab6d90d..909f9274fe71 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -238,6 +238,8 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsi=
gned long new, unsigned int
> =C2=A0	arch_cmpxchg((ptr), (o), (n));					\
> =C2=A0=C2=A0 })
> =C2=A0
> +#ifdef CONFIG_AS_HAS_SCQ_EXTENSION
> +
> =C2=A0union __u128_halves {
> =C2=A0	u128 full;
> =C2=A0	struct {
> @@ -290,6 +292,9 @@ union __u128_halves {
> =C2=A0	BUILD_BUG_ON(sizeof(*(ptr)) !=3D 16);				\
> =C2=A0	__arch_cmpxchg128(ptr, o, n, "");				\
> =C2=A0})
> +
> +#endif /* CONFIG_AS_HAS_SCQ_EXTENSION */
> +
> =C2=A0#else
> =C2=A0#include <asm-generic/cmpxchg-local.h>
> =C2=A0#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((=
ptr), (o), (n))
>=20
> ---
> base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
> change-id: 20260218-loongarch-scq-2434ec5aec4d
>=20
> Best regards,

--=20
Xi Ruoyao <xry111@xry111.site>
