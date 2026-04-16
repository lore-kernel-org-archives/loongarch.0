Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D6D391510
	for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338891; cv=none; b=ZHFHyZNkumSVuoYK8nIpokMVRb/I95cRMVZHcFaOHySJm3dx1hfIltdMsgr8mAwutWh1L/+l5eApEm1bPC29a1GMmDykgz5gcB1HOzgcta9CzaOZcPCKwZiIgOkQCXhibQytPT0FLJlD3Yac3Ql/wNTH7X91ag+rAv3JVxIM3r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338891; c=relaxed/simple;
	bh=onL90hyVAUlPY0ASaWQwK2lX8QEYr5m106IAfPoIE0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVFMyHP/WOHvftRBUzHXf25p3OiEqrxpcsh1r3pb+4MJkKH5dVN5RntGWrkro45bV+eEjQrMsWtpLKsgUv01Q/hitFGjgTZApTBT92U7UIJzWPyt+VUSTiiQyx8TzueUtals3QiMGtcb1ZlfZl9KzN5Y291fcBIXIzw17ATZVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8a016799d2cso84671266d6.1
        for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 04:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338887; x=1776943687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N28AiHhMQm9a3ncbvMl4jwXcNZbOrN6OiiJm2DjJOE=;
        b=nR41VjGQM9e3oO2lWT7Dnw6ssxf8zU0790NVJR0QFM+yV179045lpo+05b8FWriqOu
         8Wr4w5m7ZwCcsHHH501DxzpENoXWLkaxc/LsCTEuEKWDtP39rZN6ARkGGa/vQ8dgRyYi
         elrZeLzQBa0O1pI3vALw46GxRl23YPlsvsycLMs5vDM30g1CO0h4yv1uGOqGrx89IIt+
         FJNrY4+JKvc+9AFKP+3xZUMRBogD/8KC8ZxDm/DgIG13CAh0A9x7JtXbr6+tJDGj2IPT
         wbSBT7eQ0gKfsj6Wo7WrCnIFrIfblvvshUdEUBkCbGVuP9JDcfIULfzkQ2JJFmbCiNdK
         kCnw==
X-Forwarded-Encrypted: i=1; AFNElJ9pAvgcf1g30u3usDhnsvDXGi3oUjrUFVSnyM0GYR3PJJLkQvW82Xv1CinBVjHIUf+MwBzw8N1V3zQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz81wI2JRkxQABinUV6vaHxSKgCsLXF9hMfCTd8mgLGlTV0gwSS
	GIwY/P45QTpdiw1zLWRhysVip2f7Ln/ljTHddVLEb5QwoOyCnLIZnJbJ5oHHk6++
X-Gm-Gg: AeBDietC1MhTgXBU4ZpaXuLzsbse3IuommfqZQAbNEId01z+kxw5pPIh/p+XV/MkS9b
	oIC7bApbhgzNpYZK1cy/f4Y6rT8zPYnjT9lGQcf77BbijDy45tewpLwvokldt2/cOTT5GX161lD
	yis5ZE982Z0rt+NzHYLZ55UhwUB5IcUu6cxGhOVUiVocXypXTg90/070J5KbD1xeI467aSCr0mC
	lh4/pJvHW0Y8QrSwBM9uYMoQs81KJfUQUexAGQJA0a+PNPcmLpeAL38jmWVSmFjP8hD6jDLTRPk
	BZGPoJePxnIHNNsVWIOaSl+rujyiPBWd22RU0g+uuNf7d9JtJeI2uN1MFPQzKgZDTKfwQCBxtjt
	ggUQ82ZQWySXtFWtXW36MY+YLMytld9kAXAHPW5gwihKFydxQzOjZDqgX6z/tqIVx4LP8IAz9/f
	DZa1WkxGcgnO5JK1chZ4Kx9YW99PJbIDRivB6ZhDaPwyjzdQG7goqctKPZiDSPiTiDQTgR1jk=
X-Received: by 2002:a05:6214:2602:b0:8ac:a546:7753 with SMTP id 6a1803df08f44-8aca5467a17mr274789576d6.8.1776338887428;
        Thu, 16 Apr 2026 04:28:07 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6ceb80f6sm32713526d6.46.2026.04.16.04.28.07
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:28:07 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a016799d2cso84671186d6.1
        for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 04:28:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/tvHVG9b5x0E5CzUUNm31m67HJ3kT2I87VH1RBpUMwN5npT26Q61g1PpPWOGvoPci3/iCoxS2RhYc=@lists.linux.dev
X-Received: by 2002:a05:6102:3fa2:b0:608:1b6e:f4dc with SMTP id
 ada2fe7eead31-609ff0c50e9mr11028119137.11.1776338540828; Thu, 16 Apr 2026
 04:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.045532623@kernel.org>
In-Reply-To: <20260410120318.045532623@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
X-Gm-Features: AQROBzCyA8BqoTVnHFn7fWQMKVWyMF2wrQlYn44P8f0X0RsdCOwGnnxui8decDA
Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
Subject: Re: [patch 07/38] treewide: Consolidate cycles_t
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:19, Thomas Gleixner <tglx@kernel.org> wrote:
> Most architectures define cycles_t as unsigned long execpt:
>
>  - x86 requires it to be 64-bit independent of the 32-bit/64-bit build.
>
>  - parisc and mips define it as unsigned int
>
>    parisc has no real reason to do so as there are only a few usage sites
>    which either expand it to a 64-bit value or utilize only the lower
>    32bits.
>
>    mips has no real requirement either.
>
> Move the typedef to types.h and provide a config switch to enforce the
> 64-bit type for x86.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h      |    2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
