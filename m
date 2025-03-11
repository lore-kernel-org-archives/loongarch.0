Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89514F117
	for <loongarch@lists.linux.dev>; Tue, 11 Mar 2025 21:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741729309; cv=none; b=H3ILGuN46u+AeVPPyzUqHa0+BjTx43jc3QpCz3efXJC2Z6b+9aPH9okIIM4G4o/qCgfXGfKWci054gAnH9JOhVE2l5Dn/EDkaF4VPz6nuKGulbZ3QrtP+HtVoP9Z3XmXK4rBzFLoY/GgGYyI38TjdINmvmNr1nxB0alLIx6jz4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741729309; c=relaxed/simple;
	bh=TXKNlSM0TKSxzdZrN7xHlcVd6ac01W3pV0YwZDnIsdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+2rBywe2xuY7UfNJAeqiDPNHlNPKEsU0dx77PnMxRiRCqoVu90IAlBVDSdJ+VJkAR4LP0hHJvVXgRYKkEIzszMZj09EDsah8L4fBbvu6A+pTJ8LPnpiCaM/q/5x4Fc5+i7LXHiD9RtXUCx3HkuTgtfLdUjuRPwdC3xU9zrql/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-860f0e91121so270332241.0
        for <loongarch@lists.linux.dev>; Tue, 11 Mar 2025 14:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741729304; x=1742334104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ/N6RDNJhsKkhEU6U2fwKdV9v3px1FNP1P5wQQOOck=;
        b=kb6zg9LegMAWqxzgJnHtjvMC2iDGXMilm5yQBQI7VXi42kWhnmCn7gFjIv13B2uZzn
         SoqJcD14UexebCPwGxjrcsE/Xa6cTXf2n6TE5N1dVBvPBmjIL9dCyUsfWq8TWQqhm3s0
         IkiaetaK1Pp93kLZlPxBrKwietD+YgdFOCVeRtOW4B7ERGNEHR0Rtk3Qv8mnhpkdBlTH
         vOE2rwOFwOiIEuV8b6GQOGXeozu3RBqDi4y022oAi4xf8+dqsMvv4W0sXtiV+VDnenS1
         WZpeU/gQgigc9XHWwPhjEW9UpdYlgwyc8g+L+1KTcQRXls4k82+xUGN94YZJDRmWSI1H
         vuMg==
X-Forwarded-Encrypted: i=1; AJvYcCUgtohnBxOebqtGM+tDHlbQxphnqWzIE87rubTqw7+/uTlvVz1CyHeI848zXVuzSPdU9G2aL/MeIoo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIxSNyDpo7bzDmZQUKjIoXRzWduJ1muy3hYlkQv2pAFLSX31+9
	j58P937wL89TOuhaMuSRkD+5A/F5A7F2bYo/eJ3M3xdJKlL8S18201wn3Fq5
X-Gm-Gg: ASbGncs+YVHvl7VLNx8FgTbB7WHAw3ndOaaqOsX+XNhdmckC/z55aHGkIfD1ZSAr6kt
	P8S9tVRz0EzcT2b+I/Xb+J3xOf7fGERDtma3RRDFJu6JuYGyB4fy5NOplL0fSLCcTieTKZWVCuk
	slkLiLDpaCXjzES7PpdClLj+cG+ghYCABIU2fbfYyLbg4YyMgjUZbuLueBHziuW9GpGlh9/vKtK
	068LUa5FmsqNY0cMm43okjTiIe7ei09y7rqt25ftOkC4TuVOp8HQ0fBHET/r78+/NjzvpMd+4Vt
	HIYvkN4tfaG0J4yXJM1SesM0Pxm0H8LKFzfjlFMPpkyg5iTGfSObCYeq/zdvp1RXXseteKKCB2/
	8W48F2VX09Tw=
X-Google-Smtp-Source: AGHT+IGu/l4FZPtcH4ULx0aILa9sG8H0IK563KXmbJlNAiFnMO8mOaBhmjxR8wB2y8f2u4SACcChcA==
X-Received: by 2002:a05:6102:390a:b0:4af:ed5a:b68d with SMTP id ada2fe7eead31-4c34dd70926mr3456960137.6.1741729304112;
        Tue, 11 Mar 2025 14:41:44 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c2fb482e62sm2461111137.14.2025.03.11.14.41.43
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 14:41:43 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-524038ba657so270810e0c.0
        for <loongarch@lists.linux.dev>; Tue, 11 Mar 2025 14:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmdusmHPSIOf6mtAX8Ze5GMnYgl1G+D+K0ZoNTSV1KSxtBQgCOXt8Moy/4fLghdp6glzJylM/k0G4=@lists.linux.dev
X-Received: by 2002:a05:6122:489c:b0:523:e4c6:dddb with SMTP id
 71dfb90a1353d-52419478380mr4380371e0c.0.1741729302782; Tue, 11 Mar 2025
 14:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk> <Z9Cl8JKkRGhaRrgM@kernel.org>
 <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
In-Reply-To: <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Mar 2025 22:41:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jp2UP71Gi3RsrYhaKY-FGNeXSzj4L3BI-snK3mtBDJzZMW7SrRY1lIN6cU
Message-ID: <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] arch, mm: set high_memory in free_area_init()
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Tue, 11 Mar 2025 at 22:33, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Mar 11, 2025 at 11:06:56PM +0200, Mike Rapoport wrote:
> > On Tue, Mar 11, 2025 at 05:51:06PM +0000, Mark Brown wrote:
> > > This patch appears to be causing breakage on a number of 32 bit arm
> > > platforms, including qemu's virt-2.11,gic-version=3.  Affected platforms
> > > die on boot with no output, a bisect with qemu points at this commit and
> > > those for physical platforms appear to be converging on the same place.
>
> > Can you share how this can be reproduced with qemu?
>
> https://lava.sirena.org.uk/scheduler/job/1184953
>
> Turns out it's actually producing output on qemu:
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.14.0-rc6-next-20250311 (tuxmake@tuxmake) (arm-linux-gnueabihf-gcc (Debian 13.3.0-5) 13.3.0, GNU ld (GNU Binutils for Debian) 2.43.1) #1 SMP @1741691801
> [    0.000000] CPU: ARMv7 Processor [414fc0f0] revision 0 (ARMv7), cr=10c5387d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
> [    0.000000] OF: fdt: Machine model: linux,dummy-virt
> [    0.000000] random: crng init done
> [    0.000000] earlycon: pl11 at MMIO 0x09000000 (options '')
> [    0.000000] printk: legacy bootconsole [pl11] enabled
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] efi: UEFI not found.
> [    0.000000] cma: Reserved 64 MiB at 0x00000000
>
> - I'd only been sampling the logs for the physical platforms, none of
> which had shown anything.

Hangs that early need "earlycon", which the qemu boot above does have.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
