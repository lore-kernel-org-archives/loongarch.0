Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5B05225
	for <loongarch@lists.linux.dev>; Sun, 12 Nov 2023 04:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9IHCfRS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4999EC4339A
	for <loongarch@lists.linux.dev>; Sun, 12 Nov 2023 04:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699762947;
	bh=FJL4JNEf9Nr1DoflQgnKi0tfP9lyYuVjCmmad2iv8TA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T9IHCfRSJCCiMNO/B2lnKhTDg7vzSLaSof7ydAGyTQokfwHc0UzVrA9vy+3S4mFHO
	 Mpc/gtpML1wYUcpX2bPDBy9pPY5QgOuHgc/QzsPUa8mOygZ56/qPbpHlwwajazH46U
	 1n3ZTA/MJFWE7HGwSGp8kR738Ey0K/PgQf5/mwzV91s5bTFFTjRfOkgcW5rDr+NefW
	 70g/doUyhEQMNRVBFV9M32HHKhYl3CB4VPe3qN0mLdZDr/+kodq44fJDaQC3vcGEqX
	 U3rqX7e9UEtc3XjfnoI7xoUubZMR0tX2Ciz3rIWEnZ55X4l4ocVhndGYJ7soDuUgJ2
	 X1txJX8483BHg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso46134921fa.2
        for <loongarch@lists.linux.dev>; Sat, 11 Nov 2023 20:22:27 -0800 (PST)
X-Gm-Message-State: AOJu0YyngfW+6xJ6VHAnt0srHnd6lQ5ZvTxbXaTbhHZ1D4eLBfW3n6jB
	42gYlX49erio0qX1skaqZWviHTxImzmH3qzHvWU=
X-Google-Smtp-Source: AGHT+IGKtBb4zpepnAgJWTPQf4OFL8Yxg0IypTLD7L38xtqORdph/fQnU2/w9oi/MfemCZAy/+rZ76w/2ug+y+JaBNQ=
X-Received: by 2002:a05:6402:3d9:b0:53f:731a:e513 with SMTP id
 t25-20020a05640203d900b0053f731ae513mr2174574edw.25.1699762924720; Sat, 11
 Nov 2023 20:22:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-13-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-13-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Nov 2023 23:21:53 -0500
X-Gmail-Original-Message-ID: <CAJF2gTSEziwKn+f6DfZXRuzW1SXaWraKL2HdXMRkEOGyuHq3MQ@mail.gmail.com>
Message-ID: <CAJF2gTSEziwKn+f6DfZXRuzW1SXaWraKL2HdXMRkEOGyuHq3MQ@mail.gmail.com>
Subject: Re: [PATCH 12/22] csky: fix arch_jump_label_transform_static override
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Geoff Levand <geoff@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Heiko Carstens <hca@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	x86@kernel.org, Helge Deller <deller@gmx.de>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Timur Tabi <timur@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, David Woodhouse <dwmw2@infradead.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Kees Cook <keescook@chromium.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Al Viro <viro@zeniv.linux.org.uk>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, netdev@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-bcachefs@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2023 at 8:02=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The arch_jump_label_transform_static() function in csky was originally me=
ant to
> override the generic __weak function, but that got changed to an #ifndef =
check.
>
> This showed up as a missing-prototype warning:
> arch/csky/kernel/jump_label.c:43:6: error: no previous prototype for 'arc=
h_jump_label_transform_static' [-Werror=3Dmissing-prototypes]
>
> Change the method to use the new method of having a #define and a prototy=
pe
> for the global function.
>
> Fixes: 7e6b9db27de9 ("jump_label: make initial NOP patching the special c=
ase")
> Fixes: 4e8bb4ba5a55 ("csky: Add jump-label implementation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/include/asm/jump_label.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/csky/include/asm/jump_label.h b/arch/csky/include/asm/j=
ump_label.h
> index d488ba6084bc..98a3f4b168bd 100644
> --- a/arch/csky/include/asm/jump_label.h
> +++ b/arch/csky/include/asm/jump_label.h
> @@ -43,5 +43,10 @@ static __always_inline bool arch_static_branch_jump(st=
ruct static_key *key,
>         return true;
>  }
>
> +enum jump_label_type;
> +void arch_jump_label_transform_static(struct jump_entry *entry,
> +                                     enum jump_label_type type);
> +#define arch_jump_label_transform_static arch_jump_label_transform_stati=
c
> +
>  #endif  /* __ASSEMBLY__ */
>  #endif /* __ASM_CSKY_JUMP_LABEL_H */
> --
> 2.39.2
>
>
Thank you!
Reviewed-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
