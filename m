Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9C2524E
	for <loongarch@lists.linux.dev>; Sat,  8 Jul 2023 14:32:38 +0000 (UTC)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qI8fN-00023x-00; Sat, 08 Jul 2023 16:12:05 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 11AC8C01C1; Sat,  8 Jul 2023 16:11:52 +0200 (CEST)
Date: Sat, 8 Jul 2023 16:11:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	dri-devel@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-alpha@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
Message-ID: <ZKluqG2ZqKtAmnEG@alpha.franken.de>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707095415.1449376-2-arnd@kernel.org>

On Fri, Jul 07, 2023 at 11:52:24AM +0200, Arnd Bergmann wrote:
> diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
> index ee044261eb223..3c14548353e47 100644
> --- a/arch/mips/jazz/setup.c
> +++ b/arch/mips/jazz/setup.c
> @@ -76,7 +76,7 @@ void __init plat_mem_setup(void)
>  
>  	_machine_restart = jazz_machine_restart;
>  
> -#ifdef CONFIG_VT
> +#ifdef CONFIG_VGA_CONSOLE
>  	screen_info = (struct screen_info) {
>  		.orig_video_cols	= 160,
>  		.orig_video_lines	= 64,

that wssn't intended for VGA but for fbdev/g364fb, which doesn't use
it. So removing it is probably the best thing.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
