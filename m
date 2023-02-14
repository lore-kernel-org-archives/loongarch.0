Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB67C
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 09:02:05 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id b3so22552941lfv.2
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 01:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo1pwF0Y3+477kchtQyZldRaytGfE/r9ZXPNmjOtQDY=;
        b=i8BUVcIlwbe5TJ8LrEegdOmytlKzPWe1VQ+/dbiwCX5xHcOozuKXFEXik2E356WQAO
         AhBR+cveONSay5PgYAjwWnFiTcIAbNjTghzUI6Hl0ZolG3uqtzDblFxv1tWaYW+R0dyv
         S9M+LdVtY7kyTkikQ6tKm5OATDfNlhFxf7It82+hQD69/aZjpb70WngSyZGmozLx7+ap
         n7s/05PN/rBRRdGuYyC5Hrdusv2bQFsqyPxaDXEIFsYnHXItCuTlNTrKIKbtgVjGALw2
         jZ5TL6BA+kozk34GgZ8H7L6NWu/Q/w74AnlCr/gDNJULCqQ/dhERPezQFaKZ0p+vfJ7T
         2tIg==
X-Gm-Message-State: AO0yUKUcFPmGX70yDq1YsTHFvlF7s7Et2uOBXzVV++dF3esbZwlqyamb
	mkXCJvAYSXcy4I/EUH01qeVdiU/83EWzcwZ7
X-Google-Smtp-Source: AK7set+Wq6PJuMdhbhcu1TqwN069GE73Ocis+U1I9ceUuE5fdP27H8cdLHsFEUKrGi7agHODlMRFBw==
X-Received: by 2002:ac2:514c:0:b0:4a4:68b7:f863 with SMTP id q12-20020ac2514c000000b004a468b7f863mr783014lfd.7.1676365323299;
        Tue, 14 Feb 2023 01:02:03 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id d12-20020ac244cc000000b004d8540a1f51sm1049759lfm.107.2023.02.14.01.01.59
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:02:00 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id a9so17560959ljr.13
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 01:01:59 -0800 (PST)
X-Received: by 2002:a2e:9448:0:b0:293:5264:ad89 with SMTP id
 o8-20020a2e9448000000b002935264ad89mr149971ljh.37.1676365308893; Tue, 14 Feb
 2023 01:01:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-16-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-16-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 10:01:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQeh4ZqSmVXkNJTOCZ_Ywi0b0JiGpg2EQFRWZXzkNeyw@mail.gmail.com>
Message-ID: <CAMuHMdVQeh4ZqSmVXkNJTOCZ_Ywi0b0JiGpg2EQFRWZXzkNeyw@mail.gmail.com>
Subject: Re: [PATCH v3 15/24] m68k: Remove empty <uapi/asm/setup.h>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 9:05 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
