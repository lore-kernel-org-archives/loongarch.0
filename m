Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6137C917
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776000186; cv=pass; b=P9bOTN2W0ZUTfIjfr61rPh4R9tCSGvbzsSmlzwTe4lsxgo3RPocqaDZcLJstwGvDjJB1vMWr24Eh2IQP4uaGPSjl+nNYicGec0Du/TteVlgn0WCMofPST6VwWFd4me/vjqrqTbCWbqOMiyE7sobnguan21zpRKfaaCOmH/l5lgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776000186; c=relaxed/simple;
	bh=1p6x7PvyQL+5PGqdAnx23TY8v0cVXdqCOnUZdmPD2Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSPq1Z8/fHxarQ8dip4s6M3AIHb3v5FPCwpjj7UPOA9tk+zMAlfQuYxN1fU3GXqGOPflLR6paLHXdB4R11veCwXlE5wHkjpjvCDV2N/pgjy9cLqAJKjOUdislADP465nJLbfUyDHo0HtHTX5P4m0swRi3tCxMb5cK8oF2HkM4zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5/cDF1v; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5/cDF1v"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c1da7ac63so541556766b.0
        for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 06:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776000183; cv=none;
        d=google.com; s=arc-20240605;
        b=kXrq63kfbKfJTqSLVtJiEDNvJPCz7HpTfsxMBMokZkioy63llZ6k5knscteLp+3lJY
         Odu8cNHlwdQJ5PdshaEZGvYcxW8dHVMkIplwBZ+sy8rUxSoLqoIJT9rs0W3AwAkl28ee
         kVuEDfAo1Von/XZ8cNSG+4LvfOZDCFG65bhDcs7DhEN0Xf7H3ZEU7Nhe8ap0Lk7+sTz4
         OmgzU5lIbioUJdQITZaelRsGQ1RhfiLMxEdzGMecxScFGRnnY5PrpCoTw1rYWDgqSwBS
         w1J3AjUPQCAKaPwGmEqxkzUobt/n36JkhyAmjFJ9RMIB6TIGqXVD/IzqDExrpNQF6EGU
         vkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        fh=XLf4NR7bx18+RFrcAQAZNqxbu0q2sYFipEkthEObp5A=;
        b=BP87NmAMa2Fz7ao0gmSUDfwbALFbMnaR//Ra6HNkFsNkM4MU7+7v6j2Z1+xcLRYuaR
         CbFppPhbs4Jvb9XD+fTVnnEFSnnj6p3y9H6l43i/xUv+Zj5I34EhHtQ5ZPjmMpd6QINa
         amGR3z1vtCWySoqyKBk/SSuqRQ1UGUDCAO2sYmqx8tWVwijUhWWhAS/gHXJSCQoiRPRU
         oLleR6Wiqxa/nRvJpAOylbowu0+YL6g/ATcnx0x+53IE+VzK3d4Wxi5BdeSGvu7+ZfYo
         gETGR1vm6pdtbjb9Y0Grq5+OVovhu/EZuOrX95LEG5o+5jtGFEoszZWEzjbBypz8tyfx
         90Og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776000183; x=1776604983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=X5/cDF1vlPO3SRArCCvdx9L191BAbqdDJW/GnFDOwD8F6oyzeqRAZdo9dTWXlUlEHF
         +xNxJtujaNqf51jGhTv0i5MHpVMtm88KUy/HeKH6C2vRbMtkAhSAZPtQTDT6xNPTkROk
         MCO/GJU96foyd16u630qrjayud9Nw+OizbVW6f3v5wCnF43kQxqTjLtHiuxGsHSg88Zi
         UpFHMHn4AsbCPAiSCSkic8/ClkyvXOBfuO1oRE77K41NTlP8fQUApaoJjqnCQTWJj2nf
         BDyPwAWpsC2bWF41cmztu4V2Wc+TyI8gjb04/K8gZcUMBeyEjFEucd3ajlboWd2/Qxor
         HIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776000183; x=1776604983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=Etxyk2Wj3jSB00AHvFpmmoNbw+K9MowEibuTpRYUGvVnyWF0uvPvsbQSI7u0S+xCjk
         7rq4wcMDcqARmxYAG+puWSoag+Kl0CJH62DXVN2g3VadPZ1mcIXSnlT1gspQG584WNWZ
         7pNElqj/LZVw+kQrVNwlXy9zwuE2VJHSyfmAKpmLmZsg+UHd5urfp0PvaJKpORDtBrT+
         tLB+GfVyO0IrHfUxWHM+resr1R+8cp5oHGBIeNMZj8HqbPl1ubJeeRMbHU2ubmxfyvA8
         Es3yrUqEgmwyu9x4GnMqJOn0h07z5nkCH1eBUppGb28Z1AAXuRno1Ko74rfSBC+qGUHu
         Ck5g==
X-Forwarded-Encrypted: i=1; AJvYcCXxbsnTnsKEXufc+AECSz0mT328y240OfTkoihX5RyM4+IIHNaXEfd8yJ6nNgFYmlGgRigByu3TCJ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNaAzCpiFyBEheJhwW28N7XWRQ0pnPGrfTyr3sf6gnkAxTUuaO
	34G6B3A7wQBRVVYlPxfhOPPHzDkPpt4w3YMmONlQRVH4rB5d0zxgRtu3ETDuHQVW+DtA8ui+yX5
	iDShwt3cTVP1OaMxStTBSACe0AysrYpU=
X-Gm-Gg: AeBDieuceHGoxq9Iu0UkT29iVigLkianttF0ho42asY4KpVme56HWin6hs6GVenxeT+
	Abr2yxy9tQ4wSMjwYaikPvCWeZl95YqjEfLXihSlgx6NvNx/t41mGMXLqOxSHPbaiZIZA+qX5jV
	XxtdamwmpY8ZyysNSr0n/Bc6NVZX8i2qwN7PvVlSj4vq+SHWeWyS55rPjAZGnqzwKTqSYvHfmvL
	Mw7fLwo1HqsZ8KiQxBqvkHfYkoLkYFiO5ZiZ6ZAnrI1uSpcB4OugPa3+7WDTwt0yMSFKH4h9YDD
	TG9u0C3zEuZvuUOLyriQauuqez0UPAp5V5kHf/0+
X-Received: by 2002:a17:907:e113:b0:b9c:6ef1:ed18 with SMTP id
 a640c23a62f3a-b9d727aa4fdmr352963766b.25.1776000183133; Sun, 12 Apr 2026
 06:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.131582521@kernel.org>
In-Reply-To: <20260410120319.131582521@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 15:22:51 +0200
X-Gm-Features: AQROBzAeMsaeSVePCJ__tEd4f2rWAY6MixXzp_fii2b8vyUpLt4xjSbtYzENFaw
Message-ID: <CA+=Fv5S68wZQapeaYTspOfsuGk=nBj60sx-ojHBSqrxV59Q+ZA@mail.gmail.com>
Subject: Re: [patch 23/38] alpha: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 2:36=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch alpha over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: linux-alpha@vger.kernel.org
> ---
>  arch/alpha/Kconfig              |    1 +
>  arch/alpha/include/asm/random.h |   14 ++++++++++++++
>  arch/alpha/include/asm/timex.h  |   26 --------------------------
>  3 files changed, 15 insertions(+), 26 deletions(-)

Hi,

The Alpha side looks fine to me.

I've applied this patch on top of v7.0-rc7, built a kernel successfully,
boot-tested it on an Alpha UP2000+ (SMP) without issues.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
