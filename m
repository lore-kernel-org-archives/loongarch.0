Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9477C
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 09:00:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id w11so22486698lfu.11
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 01:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mNyenBvavxUdV7/ZOu+dVcpWueC+FqvBBNVPDVl8j0=;
        b=t2CcOG0vMNbyoOvrfBn+aOWQ3iTnRqXBqEtZcSADg3HDfrt9gVbVilgYtrpkpqTjHR
         LA01dF4WuzrE7IHiLq61GLMRRctcQOEneQoORkjtxALyzl5R1fyWKjgwCybyEKGnvK1C
         8FjMgXAPAshgCZKplRbcDeyMeQYpvNkovjEo3NfKnhmQqtVaI3QZ81JGF00fxa7GXPdu
         yQlkRryF6WHcHSPKY/De5hHRyNDVpde46OMCtpG8UMQKW0ukqvt6dfa2RMQ4WiXJ96uE
         Mcre54JqFBzdl/4UWO/7jlG23h1JVTXuq87M111NV/W4NsKTBrLTnvLD3kv0Fd7CiJ49
         au1Q==
X-Gm-Message-State: AO0yUKU1v1qUWvhnfld6t33cJXYXMWCWkW0NJ1bdokdU1sMl3GU5Jao7
	b2Gh/Ax21bIDC7+5JWOdbnFM3zoMs7nbj+XU
X-Google-Smtp-Source: AK7set9Xu5w9uQ3EVkLQWxnzCA87uusHUlgS0jArXKgqhRZyTlu5fFUIHvXnU5e4VrBfxVfqYTaO0Q==
X-Received: by 2002:ac2:548d:0:b0:4cc:7ff3:ab4d with SMTP id t13-20020ac2548d000000b004cc7ff3ab4dmr555647lfk.20.1676365254383;
        Tue, 14 Feb 2023 01:00:54 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id r25-20020ac25a59000000b004cc9edb0f99sm1054194lfn.44.2023.02.14.01.00.46
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:00:50 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id x40so22478296lfu.12
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 01:00:46 -0800 (PST)
X-Received: by 2002:a2e:9448:0:b0:293:5264:ad89 with SMTP id
 o8-20020a2e9448000000b002935264ad89mr149587ljh.37.1676365235984; Tue, 14 Feb
 2023 01:00:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-6-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-6-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 10:00:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxgRrZqn=Ex4gSSL58gciuHp-6ye+FTR0wgw=jp=4=DA@mail.gmail.com>
Message-ID: <CAMuHMdWxgRrZqn=Ex4gSSL58gciuHp-6ye+FTR0wgw=jp=4=DA@mail.gmail.com>
Subject: Re: [PATCH v3 05/24] m68k: Remove COMMAND_LINE_SIZE from uapi
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

On Tue, Feb 14, 2023 at 8:55 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
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
