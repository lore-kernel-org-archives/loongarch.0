Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476AF317715
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 02:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777256276; cv=none; b=Jkn9qz6frpz103ZlCThxSIJJF60qLoSLucCbSj5ct+00Y7gk/Gvqe1QeLlcV5hswZlsr48yMeeSq7DC+PBFy2hNf/VGigR+bJazWTk069xqBUEreQlW1k2vXp/rddie5pNSTah2k7Nw6hSEHwJmwNL/3UC9oPbfBrg4jyN4pubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777256276; c=relaxed/simple;
	bh=ksJMFRGbnH+gw97nFmhZow6+AiF/QRcWVG2VBQx4Z7s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q8rHo9UQ9v5eCSJplwb/XGsgoaB4RWI4xqhz1F16HlbW0sC5CNA1/L0/XoLJRdXs8nRpHtoQvVGvTb55RBDgyG44MXdpIPDmSq30y38XNxrzhlIjnSijnKAy+voZEAuFK8hFBumT5PJvM4BquL0O8l1gx5xiEd+KOKeXpd4H0mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=F1Jg7Fqx; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="F1Jg7Fqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1777256272;
	bh=+HW95JT08RXAY64sa/fHE5bmpe9N9qPhDrlrBfUWB7k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=F1Jg7FqxIz4oB5sm2ETItfdhsdbJq76bdd9TU6e8iIK3WWNEs2d7/teZ6Sl7GWh4t
	 iixAoyBjpsoFN9bIQH0kOj2UC6Fjw7UPS0adAFUELB1+kLVPKG6rsu9mnOjIrCky/r
	 9jiB54qY8Yylss/EUPfetqXEl3DlTEHVRfEN25Vg=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 0966F65A96;
	Sun, 26 Apr 2026 22:17:49 -0400 (EDT)
Message-ID: <de142a5e34f9158500361e51d5a025bf3366699e.camel@xry111.site>
Subject: Ping: [PATCH v2] LoongArch: detect and disable sc.q if erratic
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, 
	loongarch@lists.linux.dev, Zixing Liu <liushuyu@aosc.io>, Mingcong Bai
	 <jeffbai@aosc.io>, Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang
	 <jiaxun.yang@flygoat.com>, George Guo <dongtai.guo@linux.dev>, 
	linux-kernel@vger.kernel.org
Date: Mon, 27 Apr 2026 10:17:48 +0800
In-Reply-To: <20260409121936.871418-1-xry111@xry111.site>
References: <20260409121936.871418-1-xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Ping.

On Thu, 2026-04-09 at 20:19 +0800, Xi Ruoyao wrote:
> We've observed that, on some Loongson 2K3000/3B6000M systems with earlier
> firmware revisions, the sc.q instruction may write incorrect data into
> the upper half of the written 128-bit datum.
>=20
> It seems upgrading the firmware (for example, the 202602 release from
> Loongson [1]) will resolve the issue. But since not all systems may be
> running the most up-to-date firmware, based on firmware update avail-
> ability and the environment in which they are running in.
>=20
> To help with system compatibility and ensure correct behavior, check if
> sc.q behaves erratically and disable if so.
>=20
> Link: https://github.com/loongson/Firmware/pull/156=C2=A0[1]
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
> =C2=A0arch/loongarch/kernel/cpu-probe.c | 39 ++++++++++++++++++++++++++++=
++-
> =C2=A01 file changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index 657bbae6c1c7..5fcf2672172f 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -132,6 +132,43 @@ static void set_isa(struct cpuinfo_loongarch *c, uns=
igned int isa)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/*
> + * Some LoongArch has broken sc.q which incorrectly handles the upper wo=
rd
> + * when the lower word is zero. Newer firmware versions (such as the 202=
602
> + * release from Loongson) seem to contain a workaround for this issue.
> + *
> + * Disable sc.q if erratic to ensure reliability and compatibility.
> + */
> +static bool sc_q_is_sane(void)
> +{
> +	struct {
> +		long word[2];
> +	} __aligned(16) mem;
> +	register long tmp asm("t0");
> +	register long one asm("t1") =3D 1;
> +	register long *ptr asm("t2") =3D &mem.word[0];
> +
> +	/*
> +	 * The sc.q instruction is hard coded with .word so the HWCAP bit
> +	 * exported to the userspace won't depend on the assembler version
> +	 * used to build the kernel.
> +	 */
> +	asm (
> +		"1:ll.d\t$r0, %[ptr], 0\n\t"
> +		"move\t%[tmp], $r0\n\t"
> +		".word\t0x385735cc\n\t" /* sc.q %[tmp], %[one], %[ptr]*/
> +		"beqz\t%[tmp], 1b"
> +		: [tmp] "=3D&r" (tmp), "=3Dm" (mem)
> +		: [ptr] "r" (ptr), [one] "r" (one));
> +
> +	if (mem.word[1] !=3D 1) {
> +		pr_warn_once("Warning: sc.q is erratic on this platform, disabling for=
 both kernel and HWCAP. Please try a firmware update.");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> =C2=A0static void cpu_probe_common(struct cpuinfo_loongarch *c)
> =C2=A0{
> =C2=A0	unsigned int config;
> @@ -177,7 +214,7 @@ static void cpu_probe_common(struct cpuinfo_loongarch=
 *c)
> =C2=A0		c->options |=3D LOONGARCH_CPU_LAM;
> =C2=A0		elf_hwcap |=3D HWCAP_LOONGARCH_LAM;
> =C2=A0	}
> -	if (config & CPUCFG2_SCQ) {
> +	if ((config & CPUCFG2_SCQ) && sc_q_is_sane()) {
> =C2=A0		c->options |=3D LOONGARCH_CPU_SCQ;
> =C2=A0		elf_hwcap |=3D HWCAP_LOONGARCH_SCQ;
> =C2=A0	}

--=20
Xi Ruoyao <xry111@xry111.site>
