Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBDD1F92C
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 20:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64345C433C0
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 20:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946762;
	bh=2gFsvIXhZCi6KoizK2mVR8ubH1d6zKHpuStaPaewE2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=odf6iFy8lo1eFW+F91kkl6LkwFjzixBdQJWY2UrKzrQcy5MfXmLWGuJTodjIMkgej
	 ZySuLEH9iDCNaGqlZGjtQqC0o9WZZYyBdgpjgPIith+FuSoQkqvvJCCm6qlfBZ86nW
	 IrjtVcB1/My5Mzo7BwqAcKUMxH21XTOoTDqbcXAdH+kvJkymIpe8w1FIaW8wS5dO84
	 lyoqFCMiGq2/n1d4gE4brBARZKEB4+dufyBqrDCsFT+T/zN9yVkgrB72P5sQCuiPjo
	 p5TCj2S/9EFuJofT0N2Gq4wRBO5du/Lakveqc7OjRLd4Z1peg4Edlq+EKloAxFPZ4k
	 WcV+p9dCq1UeQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b45b6adffbso12958891fa.3
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 13:19:22 -0700 (PDT)
X-Gm-Message-State: AC+VfDzN//VJ9/Rbxe/C+DdlAKETZxZRZNpdNdFrH0UdTSqf0tPGO5ca
	KxFpUXqd+MO8kEAjq/67lPFirEqIFpUzDU6c07I=
X-Google-Smtp-Source: ACHHUZ4xCjWLdj6bUZgrYEqyfT0+mWbIpLp7dl+h+OA2H/SetbsgMpyruMyrfqh6ldv/ey70g6BKmUQ4Jmh+AiNCLf0=
X-Received: by 2002:a19:5e02:0:b0:4f7:69b9:fa07 with SMTP id
 s2-20020a195e02000000b004f769b9fa07mr2191315lfb.45.1686946740318; Fri, 16 Jun
 2023 13:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-12-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-12-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:18:48 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5N3RuBijpyXrzVk_mpAyUQ5TeTuS2jic6Y-ybFVJpBjg@mail.gmail.com>
Message-ID: <CAPhsuW5N3RuBijpyXrzVk_mpAyUQ5TeTuS2jic6Y-ybFVJpBjg@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 1:52=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Dynamic ftrace must allocate memory for code and this was impossible
> without CONFIG_MODULES.
>
> With execmem separated from the modules code, execmem_text_alloc() is
> available regardless of CONFIG_MODULES.
>
> Remove dependency of dynamic ftrace on CONFIG_MODULES and make
> CONFIG_DYNAMIC_FTRACE select CONFIG_EXECMEM in Kconfig.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>

> ---
>  arch/x86/Kconfig         |  1 +
>  arch/x86/kernel/ftrace.c | 10 ----------
>  2 files changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 53bab123a8ee..ab64bbef9e50 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -35,6 +35,7 @@ config X86_64
>         select SWIOTLB
>         select ARCH_HAS_ELFCORE_COMPAT
>         select ZONE_DMA32
> +       select EXECMEM if DYNAMIC_FTRACE
>
>  config FORCE_DYNAMIC_FTRACE
>         def_bool y
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index f77c63bb3203..a824a5d3b129 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -261,8 +261,6 @@ void arch_ftrace_update_code(int command)
>  /* Currently only x86_64 supports dynamic trampolines */
>  #ifdef CONFIG_X86_64
>
> -#ifdef CONFIG_MODULES
> -/* Module allocation simplifies allocating memory for code */
>  static inline void *alloc_tramp(unsigned long size)
>  {
>         return execmem_text_alloc(size);
> @@ -271,14 +269,6 @@ static inline void tramp_free(void *tramp)
>  {
>         execmem_free(tramp);
>  }
> -#else
> -/* Trampolines can only be created if modules are supported */
> -static inline void *alloc_tramp(unsigned long size)
> -{
> -       return NULL;
> -}
> -static inline void tramp_free(void *tramp) { }
> -#endif
>
>  /* Defined as markers to the end of the ftrace default trampolines */
>  extern void ftrace_regs_caller_end(void);
> --
> 2.35.1
>
