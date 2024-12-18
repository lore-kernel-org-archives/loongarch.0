Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC1C183CB8;
	Wed, 18 Dec 2024 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519860; cv=none; b=PCfUdYBdWIEzOVsvOJHWuuUvgPwlYOkjDy/Gn9ymryeIH/KHMCpVSQiL1pc4J+FFGv1e/RvPTzW+3sKkUx6RQnveAewdhfFy0Mdq7/t4oxVYBCgZTfzuW6yUZAQGLsYn5xe7SGPrp1mvVNZ3LXGepveGmMy1iZFqQwe7h1W7fUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519860; c=relaxed/simple;
	bh=7cdL5Gdndwj7rfXR+HELzvvNqxwzD9TJWNXCcKqvkDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjjugSM7qcN6aUJeEIXVnMz0MEFG8w6zHfteDL3ghf0MNvxAth8G1xsE3E3Q6wVRp8C03eCn5eVVQd9/0fvtioezqvAl5/4OzfuwlBwcjUep8X5ZC7AjP+IEYX4HfSBB5/RJjf1PvoqvH7qcgfvyPBzGu/EQCrYgtbbZKISoX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PjFMlKbM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PjFMlKbM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5cD8OmJ5EJImHph/nljKjaiMeqKYmN9nRcxx7bv6biY=; b=PjFMlKbMqlAS16sFSWEmfZC7Wd
	P7RU2meHq1qSBPCPI+5O0Bh/UHfH0kgThLleV7PBlaDHhdnqij+O9+8Hp8P/6XzTslcCs618A7xxh
	tTLN9cM00EolRE8v+YoiFzZndhiPA+6wE+3Ubn3QGkohQahyOph6hylE2SWfo0pUZRsD3zl4Nc3Sa
	lZqPfJim7Xwwv0wyux9ztirXGgIH89idyA11QqWas8x1zZUdEreN6vSS4jkeDzXjC6mf/OFIRFTKv
	8ZhluUYWcGVMvRbYbKlt3+MTKxhQzy5XdREKx1B7Bnq+GN34QEohDXpca+yegnhUQtM8Q9o+YDhvO
	XDIMqFsw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrqb-0000000AfzQ-0dqQ;
	Wed, 18 Dec 2024 11:04:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4EE883000CA; Wed, 18 Dec 2024 12:04:08 +0100 (CET)
Date: Wed, 18 Dec 2024 12:04:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn,
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu
Subject: Re: [PATCH v2 1/5] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm
 code sharing with Rust
Message-ID: <20241218110408.GF2484@noisy.programming.kicks-ass.net>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
 <20241218062009.2402650-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218062009.2402650-2-fujita.tomonori@gmail.com>

On Wed, Dec 18, 2024 at 03:20:05PM +0900, FUJITA Tomonori wrote:
> Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
> Rust to avoid the duplication.

This conflicts with some patches I've been sitting on, but nothing that
I can't resolve I think.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  arch/x86/include/asm/bug.h | 51 ++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> index 806649c7f23d..71df68e2a731 100644
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
> @@ -28,45 +28,42 @@
>  #ifdef CONFIG_GENERIC_BUG
>  
>  #ifdef CONFIG_X86_32
> -# define __BUG_REL(val)	".long " __stringify(val)
> +# define __BUG_REL(val)	".long " val
>  #else
> -# define __BUG_REL(val)	".long " __stringify(val) " - ."
> +# define __BUG_REL(val)	".long " val " - ."
>  #endif
>  
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> +#define __BUG_ENTRY(file, line, flags)					\
> +	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
> +	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
> +	"\t.word " line        "\t# bug_entry::line\n"			\
> +	"\t.word " flags       "\t# bug_entry::flags\n"
> +#else
> +#define __BUG_ENTRY(file, ine, flags)					\
> +	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
> +	"\t.word " flags       "\t# bug_entry::flags\n"
> +#endif
> +
> +#define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
> +	"1:\t" ins "\n"							\
> +	".pushsection __bug_table,\"aw\"\n"				\
> +	__BUG_ENTRY(file, line, flags)					\
> +	"\t.org 2b + " size "\n"					\
> +	".popsection\n"							\
> +	extra
>  
>  #define _BUG_FLAGS(ins, flags, extra)					\
>  do {									\
> -	asm_inline volatile("1:\t" ins "\n"				\
> -		     ".pushsection __bug_table,\"aw\"\n"		\
> -		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
> -		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
> -		     "\t.word %c1"        "\t# bug_entry::line\n"	\
> -		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
> -		     "\t.org 2b+%c3\n"					\
> -		     ".popsection\n"					\
> -		     extra						\
> +	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
> +					   "%c1", "%c2", "%c3", extra)	\
>  		     : : "i" (__FILE__), "i" (__LINE__),		\
>  			 "i" (flags),					\
>  			 "i" (sizeof(struct bug_entry)));		\
>  } while (0)
>  
> -#else /* !CONFIG_DEBUG_BUGVERBOSE */
> -
> -#define _BUG_FLAGS(ins, flags, extra)					\
> -do {									\
> -	asm_inline volatile("1:\t" ins "\n"				\
> -		     ".pushsection __bug_table,\"aw\"\n"		\
> -		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
> -		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
> -		     "\t.org 2b+%c1\n"					\
> -		     ".popsection\n"					\
> -		     extra						\
> -		     : : "i" (flags),					\
> -			 "i" (sizeof(struct bug_entry)));		\
> -} while (0)
> -
> -#endif /* CONFIG_DEBUG_BUGVERBOSE */
> +#define ARCH_WARN_ASM(file, line, flags, size)				\
> +	_BUG_FLAGS_ASM(ASM_UD2, file, line, flags, size, "")
>  
>  #else
>  
> -- 
> 2.43.0
> 
> 
