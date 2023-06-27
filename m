Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3831E13072;
	Tue, 27 Jun 2023 16:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA8FC433C0;
	Tue, 27 Jun 2023 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687883536;
	bh=p3EvKGU59+hD5m9qSyESw/ZXbFaiyZSKzEhNI6ZWGL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWLGnVhWDBHvyqAfkgUtlAd3ilHkpkaHbBFmRiVOjFf3qmweZDmdzxz6NYrfyRdhh
	 1gpGzcqDNeWx0ulFx+9eDzml0CN7Bs0imCY52jKXfeD9lJvyjUXnphHkWR/41PLKmJ
	 Mr3+DjDcM9varbMfJmFJgUk/z7dMC/Wqs5Fs04h7UJhP+4+L8uzxOCw5OO66V98u3H
	 mPXSfnZECFE1/rpHOkTFcN8MFYqG7B1OQTayVz3hM9lrp6hGn2rnEgxTfOjspQb4XG
	 56bWfIDMAWbtrsfGwwsAltwW6CYb8UfFhTQ8CsfvsRPAoozWh7J7EOFPFPO11rLdIQ
	 1dXWqFuaVH5aw==
Date: Tue, 27 Jun 2023 09:32:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Rui <wangrui@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH 0/2] Fix cross-compilation issues with Clang
Message-ID: <20230627163214.GA665894@dev-arch.thelio-3990X>
References: <20230627130122.1491765-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627130122.1491765-1-kernel@xen0n.name>

On Tue, Jun 27, 2023 at 09:01:20PM +0800, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
> 
> Hi,
> 
> Just some quick fixes to the recently accepted Clang patches, thanks to
> Nathan's followup testing. (I test-compiled natively so didn't notice

It is good to hear that everything works natively as well :)

> that cross-compilation was broken, and by chance the LLVM snapshot I
> used didn't contain the breaking commit either.)

And we can already see this effort making the compiler better! The
problematic LLVM patch is only a week old so we were able to catch it
before it made it into a released version. Thanks again for the work you
have done getting this working so far.

Cheers,
Nathan

> 
> With an additional LLVM patch https://reviews.llvm.org/D153865 the Clang
> builds should now get fixed.
> 
> WANG Xuerui (2):
>   LoongArch: vDSO: Use CLANG_FLAGS instead of filtering out '--target='
>   LoongArch: Include KBUILD_CPPFLAGS in CHECKFLAGS invocation
> 
>  arch/loongarch/Makefile      | 2 +-
>  arch/loongarch/vdso/Makefile | 5 +----
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> -- 
> 2.40.0
> 
