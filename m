Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB041E5724;
	Thu, 23 Apr 2026 22:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982012; cv=none; b=bw69v4TlDj6IHcPFufZU7dMqLVhnCbj/nl/i38UYRRhBGU7Y9C6jgFPmmeKI3CbJNpOAXqHdBJZGYgX9vWXMV07yE9/H6KkzXUl1mTIh0uGiGa7q6+FZhLN6VUhZ5gp2fGa92MXUWe1HOP0k2qe4zdqXwh1bh9UAsHk851R0iuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982012; c=relaxed/simple;
	bh=xScWSgCaj1n1EFvBbdk54t0SvcqR3SuacR2YS7d54T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFSqqrKiOh/nm75UeOjX9ZMMaNTOFUebcjJrGoAU+l0hTcXcCcBPPT1+euy/RWUcmc9BhxFAFG5KCJ1ZUR3Qkm1DBQ7Zwz85sVd9kGaW04lfckngDAdZSO2/WNg+3GqGmqWmgKf3X95vezhraPUwBaXEtOOk+cIB6pCI6UJO+gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJ3CVlgM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJ3CVlgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0C6C2BCAF;
	Thu, 23 Apr 2026 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776982012;
	bh=xScWSgCaj1n1EFvBbdk54t0SvcqR3SuacR2YS7d54T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJ3CVlgMLozZYkp5PjQVd/71un9iI/NIvrVTfS6yL3K35FdmIofyVLouZP22Jkszq
	 7w2cLgiOMbYjEZ/I0+PuGYym8p6cNl1JjXOpBMwRvcH7LC4HHgAsE8pGhEUxie4h8o
	 s3ykLE3rkg1Hn7U6ThhlTi5o3O+XNdTFcE9j8ZKIZ5qS0NTWE90qBRwY/UrbVPJ/F3
	 6B9I6fLuVxl3cpYEZr2B92PV9nrDW+1X6ibQn4p2LBNdsWR6Dw21uktAw380ueJ/vf
	 9AlXRc72v2bTnEHXDTbTwqGOa/GiiyRgr/o2Zegg3FVdmXZXmUhNP5cqqU6a3ZsYrV
	 4vD9jQirjQmag==
Date: Thu, 23 Apr 2026 15:06:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V4 14/14] LoongArch: Adjust build infrastructure for
 32BIT/64BIT
Message-ID: <20260423220647.GA3447678@ax162>
References: <20251127154832.137925-1-chenhuacai@loongson.cn>
 <20251127154832.137925-15-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127154832.137925-15-chenhuacai@loongson.cn>

Hi Huacai,

Now that this is in -next as commit 3d9aba6618d1 ("LoongArch: Adjust
build infrastructure for 32BIT/64BIT"), I am seeing two issues:

On Thu, Nov 27, 2025 at 11:48:32PM +0800, Huacai Chen wrote:
> Adjust build infrastructure (Kconfig, Makefile and ld scripts) to let
> us enable both 32BIT/64BIT kernel build.
...
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 730f34214519..4bacde9f46d1 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> +menu "Kernel type and options"
> +
> +choice
> +	prompt "Kernel type"
>  
>  config 32BIT
> -	bool
> +	bool "32-bit kernel"
> +	help
> +	  Select this option if you want to build a 32-bit kernel.
>  
>  config 64BIT
> -	def_bool y
> +	bool "64-bit kernel"
> +	help
> +	  Select this option if you want to build a 64-bit kernel.
> +
> +endchoice

The way this is written results in a 32-bit kernel when building
ARCH=loongarch allmodconfig or having a previously 64-bit configuration
and running olddefconfig on it, which seems surprising to me. I think it
would be good to either adjust the ordering such that 64BIT is first or
include an explicit default statement like so:

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 3b042dbb2c41..3addd06b3f5a 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -220,6 +220,7 @@ menu "Kernel type and options"
 
 choice
 	prompt "Kernel type"
+	default 64BIT
 
 config 32BIT
 	bool "32-bit kernel"
--

> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 8d45b860fe56..47516aeea9d2 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
...
> @@ -62,9 +66,19 @@ ifneq ($(SUBARCH),$(ARCH))
>    endif
>  endif
>  
> +ifdef CONFIG_32BIT
> +ifdef CONFIG_32BIT_STANDARD
> +ld-emul			= $(32bit-emul)
> +cflags-y		+= -march=la32v1.0 -mabi=ilp32s -mcmodel=normal
> +else  # CONFIG_32BIT_REDUCED
> +ld-emul			= $(32bit-emul)
> +cflags-y		+= -march=la32rv1.0 -mabi=ilp32s -mcmodel=normal
> +endif
> +endif

As a result of the above problem, I see

  clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
  clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
  clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]

when building configurations that I expected to be 64-bit but had been
turned into 32-bit ones with LLVM. This was also reported by the test
robot with allnoconfig.

  https://lore.kernel.org/202604232041.ESJDwVG4-lkp@intel.com/

Maybe some change is needed on the LLVM side?

Cheers,
Nathan
