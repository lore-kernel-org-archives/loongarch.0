Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7479BE7F;
	Tue,  4 Jun 2024 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717503002; cv=none; b=giS2wb93+SbFUCMJaqBZUvBydBpHE1TUn5WplKQVPSuwPkM3pwak/GxGbFZ7u/tO7Gmly/V5eZeMuHJXdj2bTQzo+UcCBZM60L7XEkmmt7qUUyFvbmhlyXz05ordpCNWkVTe07Qkxy863lXZ903yPAM+7Ah/ElXPsyAaUKM1l5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717503002; c=relaxed/simple;
	bh=YcEGrL6uJBPqEoeQ6exmprTcgJvrRPGruJXJpdyf8s0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pb8PSJ9uDpBC3XpHVNqU7AHANltFLv76cpYLsVzMbKT8Ezt61xJ7kTR7qgnpsmbu4MZqdI7hejWiaWTN+Rzj1KM7zqrO9CtuSvHBGmcXOCCXWhpd7qADox8NXOi/OtehKF9RSIfBl+MLEXZlW3Lu2TLlrRPvdkKksh/dNaiXsx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=ctzN1/nJ; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="ctzN1/nJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1717502997;
	bh=YcEGrL6uJBPqEoeQ6exmprTcgJvrRPGruJXJpdyf8s0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ctzN1/nJ2TXszqGZgZC1ecIGDY7ocdyJxI6dq2DwXhYl7+IefZpyKOUH2aIU9jdSm
	 Qc4GxKHCozxWc5A1smK8jcHNzNviNY0AdnBUF7D2MnIO2vlMFu8Gu5pl8c0f8XTs/x
	 mJochk7cWsWujvE+ih6nG12toIQl/TuduzmRuxlE=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3BC5E66D5B;
	Tue,  4 Jun 2024 08:09:55 -0400 (EDT)
Message-ID: <37bc814cf0229b498f455c5d85e9bf72041bb199.camel@xry111.site>
Subject: Re: [rt-devel:linux-6.10.y-rt-rebase 63/93] kernel/printk/printk.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
From: Xi Ruoyao <xry111@xry111.site>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Tiezhu Yang
	 <yangtiezhu@loongson.cn>
Cc: Yujie Liu <yujie.liu@intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, John Ogness <john.ogness@linutronix.de>,
 kernel test robot <lkp@intel.com>,  oe-kbuild-all@lists.linux.dev,
 loongarch@lists.linux.dev
Date: Tue, 04 Jun 2024 20:09:53 +0800
In-Reply-To: <20240604100343.0ZkQ9UcU@linutronix.de>
References: <202405300545.mVqyyvyr-lkp@intel.com>
	 <87ttiamkf4.fsf@jogness.linutronix.de> <Zl5m1ZlVmGKitAof@yujie-X299>
	 <8690e36c-5fce-5f87-be9b-edc30248167f@loongson.cn>
	 <20240604100343.0ZkQ9UcU@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-06-04 at 12:03 +0200, Sebastian Andrzej Siewior wrote:
> On 2024-06-04 17:49:35 [+0800], Tiezhu Yang wrote:
> > Like this:
> >=20
> > diff --git a/arch/loongarch/configs/loongson3_defconfig
> > b/arch/loongarch/configs/loongson3_defconfig
> > index b4252c357c8e..0eb14e9259c2 100644
> > --- a/arch/loongarch/configs/loongson3_defconfig
> > +++ b/arch/loongarch/configs/loongson3_defconfig
> > @@ -983,4 +983,3 @@ CONFIG_DEBUG_FS=3Dy
> > =C2=A0CONFIG_SCHEDSTATS=3Dy
> > =C2=A0# CONFIG_DEBUG_PREEMPT is not set
> > =C2=A0# CONFIG_FTRACE is not set
> > -CONFIG_UNWINDER_ORC=3Dy
>=20
> If ORC/objtool is broken on loongarch, shouldn't you disable it then or
> mask at least via
>=20
> diff --git a/arch/loongarch/Kconfig.debug b/arch/loongarch/Kconfig.debug
> index 98d60630c3d4b..2bce03b8f8309 100644
> --- a/arch/loongarch/Kconfig.debug
> +++ b/arch/loongarch/Kconfig.debug
> @@ -28,6 +28,7 @@ config UNWINDER_PROLOGUE
> =C2=A0
> =C2=A0config UNWINDER_ORC
> =C2=A0	bool "ORC unwinder"
> +	depends on BROKEN
> =C2=A0	select OBJTOOL
> =C2=A0	help
> =C2=A0	=C2=A0 This option enables the ORC (Oops Rewind Capability) unwind=
er for
>=20
> instead? Removing it from defconfig makes it still available to to
> randconfig.

I agree but...

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e38139c576ee..4706aa948a5f 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -143,7 +143,7 @@ config LOONGARCH
        select HAVE_LIVEPATCH
        select HAVE_MOD_ARCH_SPECIFIC
        select HAVE_NMI
-       select HAVE_OBJTOOL if AS_HAS_EXPLICIT_RELOCS
+       select HAVE_OBJTOOL if AS_HAS_EXPLICIT_RELOCS && BROKEN
        select HAVE_PCI
        select HAVE_PERF_EVENTS
        select HAVE_PERF_REGS

should be better?  It looks like everything depending on objtool is
broken, not only ORC.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
