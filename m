Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD8038B;
	Tue,  4 Jun 2024 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717495434; cv=none; b=CWL6GBHudZvCYX0wpb3+EKLKF101PLqZY0Xoinz5IWpHG2YfmqAUj7NRPu6EAWhAh3E0NXTdOkIGadb+UK8RAcXnc20f1b2SlG1NSpgFnxSDr3BFt1SEwco0ri2XG/LQpwmFxrFdLl3RahtbieI+taN0+1OyQTnIw2vtsQeoFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717495434; c=relaxed/simple;
	bh=qlRSe+k2vz6fB8A7xrqWsbzCXMPFabKgMJa+aFTNQXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfCw0ENKw9NhmdN3OTosTtQAGxyfdeJZWm6LVZTsqgcjV+mzBrfxA4ZZqKsLVAE12Mh6X1Z2Dg9CbUbRDtpqz7Dg39O2pyYlergc4vkRFG3QV9KLqpIBoAi7LYTgQSiOvzhUdk89RbS7JM+ekR+DXP6FLTyGjf0oV6ZnptEhn+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Fa9S4xmC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xNrqX/QC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Fa9S4xmC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xNrqX/QC"
Date: Tue, 4 Jun 2024 12:03:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717495424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a7JPtlCelEn3qkTg/NOalgwf1b7UBjDnZjL+hG/GdNw=;
	b=Fa9S4xmCAATySO6+M8RIC1YUg+1NFPR3RCkMqFG3/BvCcaTWv9/8p8UnrbYtVj1At3od/d
	MYIfD1Zi4sXpIUUxGCyx42tz1n51VmXGLu+FVIXHnuigKi86ghiNULYxPhrNqeplB8nI8I
	LUjMdXt91xpINv9L2T6hBkG2pSRGi0I3Dh0yPDWvVu2TiK4EnYvBSU+p3C7uI7oTSVe2bz
	tOKtUdXEx7AjQBV0FgV8Ct4rIutblwzJr3AZ9cFuJEalkDFtnuz8cehufUXXtPo0iiFTQM
	rQIc+IOXcBxLdPuxACRtIQ2rPy1poUtAh8X+uiXzysVEfQUMT/OO4rFBAn3niA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717495424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a7JPtlCelEn3qkTg/NOalgwf1b7UBjDnZjL+hG/GdNw=;
	b=xNrqX/QCe1RZBDNmufBAEhNc+2daXB2nPWeJ86Yq9YMsWP4bClQkFzkqJNurlyaYWJaB5R
	B1y5DAUKOhcz4ADg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Yujie Liu <yujie.liu@intel.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	John Ogness <john.ogness@linutronix.de>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	loongarch@lists.linux.dev
Subject: Re: [rt-devel:linux-6.10.y-rt-rebase 63/93] kernel/printk/printk.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
Message-ID: <20240604100343.0ZkQ9UcU@linutronix.de>
References: <202405300545.mVqyyvyr-lkp@intel.com>
 <87ttiamkf4.fsf@jogness.linutronix.de>
 <Zl5m1ZlVmGKitAof@yujie-X299>
 <8690e36c-5fce-5f87-be9b-edc30248167f@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8690e36c-5fce-5f87-be9b-edc30248167f@loongson.cn>

On 2024-06-04 17:49:35 [+0800], Tiezhu Yang wrote:
> Like this:
> 
> diff --git a/arch/loongarch/configs/loongson3_defconfig
> b/arch/loongarch/configs/loongson3_defconfig
> index b4252c357c8e..0eb14e9259c2 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -983,4 +983,3 @@ CONFIG_DEBUG_FS=y
>  CONFIG_SCHEDSTATS=y
>  # CONFIG_DEBUG_PREEMPT is not set
>  # CONFIG_FTRACE is not set
> -CONFIG_UNWINDER_ORC=y

If ORC/objtool is broken on loongarch, shouldn't you disable it then or
mask at least via

diff --git a/arch/loongarch/Kconfig.debug b/arch/loongarch/Kconfig.debug
index 98d60630c3d4b..2bce03b8f8309 100644
--- a/arch/loongarch/Kconfig.debug
+++ b/arch/loongarch/Kconfig.debug
@@ -28,6 +28,7 @@ config UNWINDER_PROLOGUE
 
 config UNWINDER_ORC
 	bool "ORC unwinder"
+	depends on BROKEN
 	select OBJTOOL
 	help
 	  This option enables the ORC (Oops Rewind Capability) unwinder for

instead? Removing it from defconfig makes it still available to to
randconfig.

> Thanks,
> Tiezhu

Sebastian
