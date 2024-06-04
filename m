Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C45D30B;
	Tue,  4 Jun 2024 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717514270; cv=none; b=kuUFcta0OVvLLkvszI9IMhNzn3r2RRYpQONd4TLBm2FHXcLI+P68dCm2M/z49mXFM2gJKfuZT5svYLBqiPd7jA5ycaNiRO3GWWzLPNG3GJDyq+HpOrqoliNY0i5UoJxj8m7x5+qxEL9/MiphEEptwWM637DB8SemSk1UvVh751Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717514270; c=relaxed/simple;
	bh=Egks3/WNwy9LYtfT6ZUNZZhj71JaiUQKLwCKNh/fJ10=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bt3Fq+PSg8QduCywbgRmBhhhf7HbKl1NWGD0kFi+75aFTe0ZSArWyOgqJjd/1Ksg9Kc52SR8hjZaSjvrIkE9s322T07sYrexQLZpCHGN6MXq9Ml+I2sm4TCdHu9/XXhJ9z4TNoQBEJBSY9EbuPDt61AYuYi/ojh4xTqkJgv+FOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=XU/4/7Si; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="XU/4/7Si"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1717514268;
	bh=Egks3/WNwy9LYtfT6ZUNZZhj71JaiUQKLwCKNh/fJ10=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XU/4/7Sig+nr0Hm7SLVDqTkZ/pvvOaR9G0Af8cClrEEw6LjCigBSmfttKCTsORaz+
	 dORY/j2bFGpVJLeHKIJvNP3sZdkpVePt2vrbPJTnSv7gdxfJ4qF9YYDzT4D2xYJGPH
	 9pPz22YKO1EWbZLveRrOZorDo6BfMxULdCTFnkLo=
Received: from [IPv6:240e:457:1110:1471:fd75:6c0d:bd6f:6068] (unknown [IPv6:240e:457:1110:1471:fd75:6c0d:bd6f:6068])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B458467263;
	Tue,  4 Jun 2024 11:17:42 -0400 (EDT)
Message-ID: <3faeda8f8ce4eb6356c16151dc3970b583b709c4.camel@xry111.site>
Subject: Re: [rt-devel:linux-6.10.y-rt-rebase 63/93] kernel/printk/printk.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
From: Xi Ruoyao <xry111@xry111.site>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Tiezhu Yang
	 <yangtiezhu@loongson.cn>
Cc: Yujie Liu <yujie.liu@intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, John Ogness <john.ogness@linutronix.de>,
 kernel test robot <lkp@intel.com>,  oe-kbuild-all@lists.linux.dev,
 loongarch@lists.linux.dev
Date: Tue, 04 Jun 2024 23:17:37 +0800
In-Reply-To: <37bc814cf0229b498f455c5d85e9bf72041bb199.camel@xry111.site>
References: <202405300545.mVqyyvyr-lkp@intel.com>
	 <87ttiamkf4.fsf@jogness.linutronix.de> <Zl5m1ZlVmGKitAof@yujie-X299>
	 <8690e36c-5fce-5f87-be9b-edc30248167f@loongson.cn>
	 <20240604100343.0ZkQ9UcU@linutronix.de>
	 <37bc814cf0229b498f455c5d85e9bf72041bb199.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-06-04 at 20:09 +0800, Xi Ruoyao wrote:
> On Tue, 2024-06-04 at 12:03 +0200, Sebastian Andrzej Siewior wrote:
> > On 2024-06-04 17:49:35 [+0800], Tiezhu Yang wrote:
> > > Like this:
> > >=20
> > > diff --git a/arch/loongarch/configs/loongson3_defconfig
> > > b/arch/loongarch/configs/loongson3_defconfig
> > > index b4252c357c8e..0eb14e9259c2 100644
> > > --- a/arch/loongarch/configs/loongson3_defconfig
> > > +++ b/arch/loongarch/configs/loongson3_defconfig
> > > @@ -983,4 +983,3 @@ CONFIG_DEBUG_FS=3Dy
> > > =C2=A0CONFIG_SCHEDSTATS=3Dy
> > > =C2=A0# CONFIG_DEBUG_PREEMPT is not set
> > > =C2=A0# CONFIG_FTRACE is not set
> > > -CONFIG_UNWINDER_ORC=3Dy
> >=20
> > If ORC/objtool is broken on loongarch, shouldn't you disable it then or
> > mask at least via
> >=20
> > diff --git a/arch/loongarch/Kconfig.debug b/arch/loongarch/Kconfig.debu=
g
> > index 98d60630c3d4b..2bce03b8f8309 100644
> > --- a/arch/loongarch/Kconfig.debug
> > +++ b/arch/loongarch/Kconfig.debug
> > @@ -28,6 +28,7 @@ config UNWINDER_PROLOGUE
> > =C2=A0
> > =C2=A0config UNWINDER_ORC
> > =C2=A0	bool "ORC unwinder"
> > +	depends on BROKEN
> > =C2=A0	select OBJTOOL
> > =C2=A0	help
> > =C2=A0	=C2=A0 This option enables the ORC (Oops Rewind Capability) unwi=
nder for
> >=20
> > instead? Removing it from defconfig makes it still available to to
> > randconfig.
>=20
> I agree but...
>=20
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index e38139c576ee..4706aa948a5f 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -143,7 +143,7 @@ config LOONGARCH
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_LIVEPATCH
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_MOD_ARCH_SPECIFIC
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_NMI
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_OBJTOOL if AS_HAS_EXPLI=
CIT_RELOCS
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_OBJTOOL if AS_HAS_EXPLI=
CIT_RELOCS && BROKEN
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_PCI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_PERF_EVENTS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_PERF_REGS
>=20
> should be better?=C2=A0 It looks like everything depending on objtool is
> broken, not only ORC.

No longer needed, I've root-caused the issue:
https://lore.kernel.org/loongarch/20240604150741.30252-1-xry111@xry111.site=
/

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
