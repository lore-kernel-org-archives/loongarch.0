Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2701135403
	for <loongarch@lists.linux.dev>; Wed,  6 Mar 2024 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709742245; cv=none; b=Gjp7vquKkmUU9O2iTcm9D3enzHap4L4kFqytHDtM7+h0XKWtQUHhVG+OrLYqCGmAqA/g9Yd5i7VKT6GYPrs/eW8IWG4lpl3Mq7k/N+OPhi94Y1Pga4a4I5qBpbLByhXBZUfVRSGe9tKNTVtWWnQqVysKWSc6utX6OjWAaPUHKrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709742245; c=relaxed/simple;
	bh=n9KzasEm6N9ttGn6mpPVBfxcCLfd5JbkdxZ4Q6PxRSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ilQywWmH5He7pf9LFxnOEz3ux9X3V60b04xKIrA5cMM8QAtbk6UH4E5HdQFjUZ3AoqqbMjNWfmyOUtTA41srYeztqqWH1zl64TJ3bIC5pMJh5j6GgX18aBWVUjnsZedTjFlCjUiGDL8a6o15SncR98GVSWBJNXLA3fo7F/EMqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-365bd66bea9so25320675ab.3
        for <loongarch@lists.linux.dev>; Wed, 06 Mar 2024 08:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742242; x=1710347042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7JdIeS9zNSJ+HV+qdpk2QYV7GDhHiD75PCrvSyuiH4=;
        b=tAJEg4zSQvqMPVMclSEJRVsnEfSOUaxgB/sYRUsmAGWnW3S5tMibx//b1B0z+j/f0/
         9SzwJTA/JpciPBeLArfmF9j6FEsX8UaIW1nZZSQAcTQmoV9Y1cmWvF51MIIhYX9UrRub
         /2yvyNLWkmbYqxn3BgAvpy2aeNbyZJOO8bnL2qyDWWA8zU+yaSMhGRhtSS4zGQ3cUyIy
         212/sNZGaImA1WWdhRsIh9koAb93BiZnqZMRVmPLQ+x/atn3t/YUt34kNZR8YqAMnaLs
         sYjxyBb7MOpHytqWRQEzvFAqhLdu1rx9IY6LzPydk7yRD4kIzK4K/rRb99FaRg1EwufK
         yrwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ElMKhzRCku4dNcEoO47QqFb194nNUXl2WF2xddEhxJLWnioiaC5882enl+JT3SGoUgLms/0WGkaUtjKqz2LQVFQZRSADOtaW
X-Gm-Message-State: AOJu0YyhJcoLBGLNGNJUo9W/W0ZSTQjtPayTh9sZIi60KEPp4xJbGd1i
	f50sjNyeeE4Q/bU8ncCksL8rAhj9YQe60cmsWHjc45B2ZXCrae0z2x8TMyAy3rQ=
X-Google-Smtp-Source: AGHT+IGmtYQMl04NHz2da6AILACG5bJsfHT+eItXyZBCUIapvbAa9iylPkLDEVNUzOHMrPyhFbOrYg==
X-Received: by 2002:a05:6e02:1a01:b0:363:bdb9:72af with SMTP id s1-20020a056e021a0100b00363bdb972afmr19908863ild.23.1709742242378;
        Wed, 06 Mar 2024 08:24:02 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id a7-20020a056e02120700b00363ea1209basm3745702ilq.11.2024.03.06.08.24.01
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:24:02 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3650c7e0dd2so24093725ab.2
        for <loongarch@lists.linux.dev>; Wed, 06 Mar 2024 08:24:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6zrjXJCTWK5hK6pxkpKYRBy32Od3ccqdRn1VjOo8mkdI7LqChrFzunnNE4XKziwIpF6sh7EBjKffJV3N3RaD6J5zdtF32ezGs
X-Received: by 2002:a25:580b:0:b0:dcf:c7ef:e4e0 with SMTP id
 m11-20020a25580b000000b00dcfc7efe4e0mr11968959ybb.1.1709742220242; Wed, 06
 Mar 2024 08:23:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240306141453.3900574-1-arnd@kernel.org> <20240306141453.3900574-4-arnd@kernel.org>
In-Reply-To: <20240306141453.3900574-4-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Mar 2024 17:23:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5ut09=b+5Qti6CD17XOOmsm+VtfA7TKac7qHNOBC2-A@mail.gmail.com>
Message-ID: <CAMuHMdU5ut09=b+5Qti6CD17XOOmsm+VtfA7TKac7qHNOBC2-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <keescook@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, 
	Stafford Horne <shorne@gmail.com>, Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 3:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
>
> Acked-by: Guo Ren <guoren@kernel.org>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> Acked-by: Stafford Horne <shorne@gmail.com>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> No changes from v1

>  arch/m68k/Kconfig                  | 3 +++
>  arch/m68k/Kconfig.cpu              | 2 ++
>  arch/m68k/include/asm/page.h       | 6 +-----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
