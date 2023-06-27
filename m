Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC9819E7E;
	Tue, 27 Jun 2023 16:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36845C433C0;
	Tue, 27 Jun 2023 16:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687883114;
	bh=abXpFTTuUCBmcbnkpnmJtVpSKqQCH7MmcQizSI+8UwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bf+1nHmWvUr3kRD0ZuwmHSoep1vIrh0qJZgvsk8nlnHqA5vuW61Onv1xwnq27FNZn
	 DTxsQPAr9qLEegeAaZOBj5tuT89gXMkQacVqnbuxJ6bamy3FsSqu1zcNCe2pQoxJ7q
	 JoCiI78enrsBgw6ZeUlOEB5XKdk3itmXLTshpMceWLZVhyaIqmbPLi7QZXQIFTQUwL
	 xgf1ASuRdFn+dLX5KDIhHNWcoItUX2H6WDl3M6Jfud3oz3LVi1AqVGwsN9Ni1UE3aL
	 C07SEc1ObwLcp3NdFrRGZX1iOdq2HbiKW2++8KS0njjlnP4H6tFM25d968N1BZE7ro
	 CrFo3eXRWzW0g==
Date: Tue, 27 Jun 2023 09:25:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Rui <wangrui@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH 2/2] LoongArch: Include KBUILD_CPPFLAGS in CHECKFLAGS
 invocation
Message-ID: <20230627162512.GB223742@dev-arch.thelio-3990X>
References: <20230627130122.1491765-1-kernel@xen0n.name>
 <20230627130122.1491765-3-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627130122.1491765-3-kernel@xen0n.name>

On Tue, Jun 27, 2023 at 09:01:22PM +0800, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
> 
> This is a port of commit 08f6554ff90e ("mips: Include KBUILD_CPPFLAGS
> in CHECKFLAGS invocation") to arch/loongarch, for fixing
> cross-compilation of Linux/LoongArch with Clang, where previously the
> `--target` flag would no longer be present for the CHECKFLAGS cc
> invocation leading to build failure.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1787#issuecomment-1608306002
> Signed-off-by: WANG Xuerui <git@xen0n.name>

Thanks for the patch!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/loongarch/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index a63683da3bcf..09ba338a64de 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -112,7 +112,7 @@ KBUILD_CFLAGS += -isystem $(shell $(CC) -print-file-name=include)
>  KBUILD_LDFLAGS	+= -m $(ld-emul)
>  
>  ifdef CONFIG_LOONGARCH
> -CHECKFLAGS += $(shell $(CC) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
> +CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
>  	grep -E -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
>  	sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
>  endif
> -- 
> 2.40.0
> 
