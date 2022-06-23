Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B11C43C7
	for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 08:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E59C3411B
	for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 08:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655973166;
	bh=qjoajs6KrD+4eN0dLTEOJrQtt3Y8Oj7z6UaGm0HvRO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YFbtuSAny9WJYEhzgEf7ttjJoOq4GdwB5aPvhEEL5ZZXq5pEqYDgWSrJiU843EjbL
	 5XE7HHTaXsJwWLHXDSH0Y6n7303C+cMCICqBpbMWi1xwn+SljBVNCtyjtFvepnWTxN
	 /FIrvKl4SNZ1zyAzS79GWYtEYm3YgNd6L5zkBxb/HiuAQ0KoUHV2jw2KAlGHdOPkTH
	 onL5rGNFQ1Jr1KHiJuwYEQqqSPW9fc25wqAGox+9Pt5RZgfRZYFXeUceupttQKFFfP
	 rmjHy+YWRBRLqM6IC4zhIwW198v7wEwOLDqZ2QCcYsGpVVBgf00j8IRe0Pe3kpVGCB
	 mftsNRFuya4uw==
Received: by mail-vs1-f41.google.com with SMTP id o13so7379606vsn.4
        for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 01:32:46 -0700 (PDT)
X-Gm-Message-State: AJIora+0F+r5ytZRme/nd2V8qfnWB/asNVD38lB7/QdyB1KvMrJ8Y9sE
	hMieWHiGRvW3JV7OtRZY0sOliD3sXseXQGZ+V/0=
X-Google-Smtp-Source: AGRyM1tWO475WJ6aUiOWgn69uUw2ewMpDHDVutEzxXF76ys4cEJ6Peqc//So8JIzbfW3eV6Aid+QzyZqE4BImR8k1rQ=
X-Received: by 2002:a67:f958:0:b0:354:3f56:8a2d with SMTP id
 u24-20020a67f958000000b003543f568a2dmr8144881vsq.59.1655973165119; Thu, 23
 Jun 2022 01:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220623044752.2074066-1-chenhuacai@loongson.cn>
 <20220623044752.2074066-2-chenhuacai@loongson.cn> <CAJF2gTR1ksvWWT1tec1QnOt6rzDucx5qzWO44nA_vHFhqMtG_g@mail.gmail.com>
 <CAAhV-H7p=zr7vjzENLgByqRUsH1mNQb8fFxNBkQu2YsWp1gMWA@mail.gmail.com> <CAK8P3a0pKc7=iLcFY028HqJXmGupacm=tV7Wqgx0+bYSqczoog@mail.gmail.com>
In-Reply-To: <CAK8P3a0pKc7=iLcFY028HqJXmGupacm=tV7Wqgx0+bYSqczoog@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Jun 2022 16:32:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRoQ2oUa9Kj9vGqH2ZQj7TendCVhVHc6+3iRjOHWR6rsQ@mail.gmail.com>
Message-ID: <CAJF2gTRoQ2oUa9Kj9vGqH2ZQj7TendCVhVHc6+3iRjOHWR6rsQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] LoongArch: Add qspinlock support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	loongarch@lists.linux.dev, linux-arch <linux-arch@vger.kernel.org>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>, Rui Wang <wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 23, 2022 at 4:26 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jun 23, 2022 at 9:56 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> > On Thu, Jun 23, 2022 at 1:45 PM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Thu, Jun 23, 2022 at 12:46 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > >
> > > > On NUMA system, the performance of qspinlock is better than generic
> > > > spinlock. Below is the UnixBench test results on a 8 nodes (4 cores
> > > > per node, 32 cores in total) machine.
>
> You are still missing an explanation here about why this is safe to
> do. Is there are
> architectural guarantee for forward progress, or do you rely on
> specific microarchitectural
> behavior?
>
> > > Could you base the patch on [1]?
> > >
> > > [1] https://lore.kernel.org/linux-riscv/20220621144920.2945595-2-guoren@kernel.org/raw
> > I found that whether we use qspinlock or tspinlock, we always use
> > qrwlock, so maybe it is better like this?
> >
> > #ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > #include <asm/qspinlock.h>
> > #else
> > #include <asm-generic/tspinlock.h>
> > #endif
> >
> > #include <asm/qrwlock.h>
>
> Yes, that seems better, but I would go one step further and include
> asm-generic/qspinlock.h
> in place of asm/qspinlock.h here: The two architectures that have a
> custom asm/qspinlock.h
> also have a custom asm/spinlock.h, so they have no need to include
> asm-generic/spinlock.h
> either.
Okay, thx Huacai & Arnd

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
