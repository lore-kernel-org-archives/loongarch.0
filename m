Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68352EA2
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 02:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE12C43470
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 02:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664419216;
	bh=pLPnFBMn5aCaXNkrU1u/KzK79Oy1dcjNZ2+U1bKrMgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KVOyBAAzMR80GebggwikOR8qNMbk2MEAjwjDP/M5CtEpbKZ+LC9mnOt3sMO3wp0b4
	 gapiDnHtk0dbWHi6UZPfL4xvf2G4ztARgPt9nQ4ziSb2wc9B4tiA8qTzQxZYLu8bQf
	 TjNHw9JdyU8P2HmoqIXrgg9Tft1l50iR804IEx7PLpX4cdYxCz+QG+Zhc9tz8NKsXu
	 0Q2wJ4LTt93R6Ye5/krT7zNXi9TmYIZ4rum8soHPh4EYKoEKk4IGVxhYgGcqQsKeAQ
	 AEBvt+wOoWGpR2k985ZGX3JLz9BNv8v7arI872B5rfoF7MK/FW6w0QyT5MSK7IcDUs
	 3kY/l+Kt1FLSg==
Received: by mail-vk1-f182.google.com with SMTP id v192so1731vkv.7
        for <loongarch@lists.linux.dev>; Wed, 28 Sep 2022 19:40:16 -0700 (PDT)
X-Gm-Message-State: ACrzQf3sJPS9i+62egsXJ1pxhsBFQIKNd53ctesVb2wzHUVjzhQsWPpc
	w+fcdj7pNKrdpmiqeeghNXAgn1PkJt5HBYWcEgg=
X-Google-Smtp-Source: AMsMyM4yUlGXqcvcrqkovn9NEeTtr/L9xuEjuFVFB27HyEcPIqKB/SKh6K9tAikwhAeyWvnsYxd77RwQnLQcrSH+ft8=
X-Received: by 2002:a1f:60cf:0:b0:3a7:a632:3649 with SMTP id
 u198-20020a1f60cf000000b003a7a6323649mr387926vkb.12.1664419215017; Wed, 28
 Sep 2022 19:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929023735.319481-1-chenhuacai@loongson.cn>
In-Reply-To: <20220929023735.319481-1-chenhuacai@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 29 Sep 2022 10:40:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6mp_LNqYp81iQ66i_nJfpcmMDqC-1JZoRoHDjxzJNGbg@mail.gmail.com>
Message-ID: <CAAhV-H6mp_LNqYp81iQ66i_nJfpcmMDqC-1JZoRoHDjxzJNGbg@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch fixes for v5.19-rc4
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	loongarch@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

I sent the wrong mail, please ignore this. Sorry.

Huacai

On Thu, Sep 29, 2022 at 10:38 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> The following changes since commit a111daf0c53ae91e71fd2bfe7497862d14132e3e:
>
>   Linux 5.19-rc3 (2022-06-19 15:06:47 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-5.19-3
>
> for you to fetch changes up to ea18d434781105ce61ff3ef7f74c9e51812f0580:
>
>   LoongArch: Make compute_return_era() return void (2022-06-25 18:06:07 +0800)
>
> ----------------------------------------------------------------
> LoongArch fixes for v5.19-rc4
>
> Some bug fixes and a trivial cleanup.
> ----------------------------------------------------------------
> Huacai Chen (4):
>       LoongArch: Fix the !THP build
>       LoongArch: Fix the _stext symbol address
>       LoongArch: Fix sleeping in atomic context in setup_tlb_handler()
>       LoongArch: Fix EENTRY/MERRENTRY setting in setup_tlb_handler()
>
> Tiezhu Yang (2):
>       LoongArch: Fix wrong fpu version
>       LoongArch: Make compute_return_era() return void
>
>  arch/loongarch/include/asm/branch.h  |  3 +--
>  arch/loongarch/include/asm/pgtable.h | 10 +++++-----
>  arch/loongarch/kernel/cpu-probe.c    |  2 +-
>  arch/loongarch/kernel/head.S         |  2 --
>  arch/loongarch/kernel/traps.c        |  3 +--
>  arch/loongarch/kernel/vmlinux.lds.S  |  1 +
>  arch/loongarch/mm/tlb.c              |  7 ++++---
>  7 files changed, 13 insertions(+), 15 deletions(-)
