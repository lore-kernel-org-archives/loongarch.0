Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B5B1369BA
	for <loongarch@lists.linux.dev>; Wed,  6 Mar 2024 17:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709745481; cv=none; b=E2/7mUeVG8hKR8wqGroH5jBuu0cypq0+okYdMpAHvQpBSczZ9qyI9opwPJmyhwlLBX0pSiKInoBsUIQZ4KODJvrGImor20wQYnY5QRv4VMX4RX57JSGt2R1qGUQHd03Bpb/yG8az9AIKSp7Gu2tYckpUTPoOdgdfISJ9DbUPPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709745481; c=relaxed/simple;
	bh=cGH9oveyYZrJR4sQqUZvr3RgdUZ1IunEgpUKcc2IsXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PdCMc6kxoelxZbWp0EEjnQHbWCdce5IDZ//I6/CKtUsC4dpB///CMPevISvUbNJZltyHcMOu2bjVPzUHdUKFE/jTAeF0kniCJlrv4s/WsBbMkzNCos3+oGK4o2KNjGbuKmG9BHHI2YwDkrTz9geXc6/xlSiaaeJiv4KbSt0ut1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gDCCIQT1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ba8NRrLO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gDCCIQT1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ba8NRrLO"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709745479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/OQqHSSiFO9QvgB4mY2J+LyWd+etZHTC3EZIIQab4fo=;
	b=gDCCIQT1qxbWXTzhufSmoNS52MsO6T6khcDRU4R/DvjT4G7MoNh9Ky1nmGGMUA5kBJGmB5
	azsjDUOsuP8fnYd10g8AahY82D+0bOAV5U3WP5daAn+croDLWUY3Ux3Xh7i9JWhMGu7ILz
	CZx/MWC+XoyW1OE1/HgI9ImOzMQ3Hsu7ZGgFD0XsFBH1gJkU/OqCW7ZFdp75gTfSAIe5PP
	r0Jjoh6AeTDkw4LFACDFt43V3o5FzJyQ23zOJdJCOPm4FdIlpDNblApjxSKyFng8p2xu18
	6rz3+EZYW43r4daGc6RkeHzoLH9pHS88uirHCfRuC4FSfS7+MEcP8Bkyg26BgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709745479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/OQqHSSiFO9QvgB4mY2J+LyWd+etZHTC3EZIIQab4fo=;
	b=Ba8NRrLO9SKa1kou0+rIbBztNEAwJsDv3WFMK2NllzRQnMhckZV3x6THtTFG81tO6REjSx
	6aQnDwMJIY/8bAAA==
To: Arnd Bergmann <arnd@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet
 Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, Brian Cain
 <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller
 <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Palmer Dabbelt <palmer@dabbelt.com>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson
 <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Andy Lutomirski
 <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org
Subject: Re: [v2 PATCH 0/3] arch: mm, vdso: consolidate PAGE_SIZE definition
In-Reply-To: <20240306141453.3900574-1-arnd@kernel.org>
References: <20240306141453.3900574-1-arnd@kernel.org>
Date: Wed, 06 Mar 2024 18:17:58 +0100
Message-ID: <87wmqfth2x.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Mar 06 2024 at 15:14, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Naresh noticed that the newly added usage of the PAGE_SIZE macro in
> include/vdso/datapage.h introduced a build regression. I had an older
> patch that I revived to have this defined through Kconfig rather than
> through including asm/page.h, which is not allowed in vdso code.
>
> The vdso patch series now has a temporary workaround, but I still want to
> get this into v6.9 so we can place the hack with CONFIG_PAGE_SIZE
> in the vdso.

Thank you for cleaning this up!

      tglx
