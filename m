Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2AEA2C
	for <loongarch@lists.linux.dev>; Thu,  2 Mar 2023 10:44:36 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id s12so17440555qtq.11
        for <loongarch@lists.linux.dev>; Thu, 02 Mar 2023 02:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHoXp6+7/Ivp8TZOu6tqpc5Wq/dN7ibmjBTE7vH9gt0=;
        b=buhNEsrSvdTXjWTG0cku/8epf89E6o5XFPNHCHqbFAVneE+NaK46v6rDveBcWk3mwK
         qoXgeUeRC2oOL6AdWEU3Gg+AbEJFlzb+O4GzNhFas+o0x5F9S8s5Y8unx8xGw0oM0D/j
         Aejs3tTMugRuceOWWKAXGydaG3aUGdbUDJ5z0NhW0qNA4CVRs2ULGSPXaViLnrOt/vb7
         zyC8WEcn7aLoLKrX6DSlQT4TwzXXx8pmxhHDyNabSE+a0JcROjAJSqJvskSL969xudbD
         1lGPdV3BzrRsHntBi4iX4hhO7Lv+TJ48smzsopFM+XX8LP48DuheP10M71vaHdzEmALW
         B8vw==
X-Gm-Message-State: AO0yUKVymxF/jmm/3aZkncOnquVunpjK0JtqaUt7NNhyBalJxnKhVD3A
	WzXfEvHat9rSnIMdLJ23QyIhUTqZJYCvMg==
X-Google-Smtp-Source: AK7set9ejComjYnBzqjvIHs3KMmKXALwLErZPSQogvGUgQddrFLVDM39xGnaMJbQ9Gzj9kogScgsmA==
X-Received: by 2002:a05:622a:1184:b0:3b9:a42b:7099 with SMTP id m4-20020a05622a118400b003b9a42b7099mr17315078qtk.30.1677753875648;
        Thu, 02 Mar 2023 02:44:35 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 190-20020a3705c7000000b0073b9ccb171asm10534576qkf.130.2023.03.02.02.44.34
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 02:44:34 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5384ff97993so420472697b3.2
        for <loongarch@lists.linux.dev>; Thu, 02 Mar 2023 02:44:34 -0800 (PST)
X-Received: by 2002:a5b:1cf:0:b0:a43:52fe:c36f with SMTP id
 f15-20020a5b01cf000000b00a4352fec36fmr4318975ybp.7.1677753853997; Thu, 02 Mar
 2023 02:44:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
 <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com> <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
In-Reply-To: <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Mar 2023 11:44:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
Message-ID: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
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
	linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Thu, Mar 2, 2023 at 11:09=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
> On 3/2/23 10:47, Geert Uytterhoeven wrote:
> > On Thu, Mar 2, 2023 at 10:35=E2=80=AFAM Alexandre Ghiti <alexghiti@rivo=
sinc.com> wrote:
> >> This all came up in the context of increasing COMMAND_LINE_SIZE in the
> >> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is t=
he
> >> maximum length of /proc/cmdline and userspace could staticly rely on
> >> that to be correct.
> >>
> >> Usually I wouldn't mess around with changing this sort of thing, but
> >> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SI=
ZE
> >> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> >> increasing, but they're from before the UAPI split so I'm not quite su=
re
> >> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> >> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> >> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> >> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> >> asm-generic/setup.h.").
> >>
> >> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> >> part of the uapi to begin with, and userspace should be able to handle
> >> /proc/cmdline of whatever length it turns out to be.  I don't see any
> >> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> >> search, but that's not really enough to consider it unused on my end.
> >>
> >> This issue was already considered in s390 and they reached the same
> >> conclusion in commit 622021cd6c56 ("s390: make command line
> >> configurable").
> >>
> >> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE reall=
y
> >> shouldn't be part of uapi, so this now touches all the ports.  I've
> >> tried to split this all out and leave it bisectable, but I haven't
> >> tested it all that aggressively.
> >>
> >> Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-=
alexghiti@rivosinc.com/>:
> >> * Added RB/AB
> >> * Added a mention to commit 622021cd6c56 ("s390: make command line
> >>    configurable") in the cover letter
> > Thanks for the update!
> >
> >   Apparently you forgot to add your own SoB?
>
> I do not know, should I? Palmer did all the work, I only fixed 3 minor
> things

If you are picking up patches, and submitting them to someone else
for upstream inclusion, you should add your own SoB.
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submit=
ting-patches.rst#L419

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
