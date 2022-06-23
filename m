Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A882D43EB
	for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 08:26:59 +0000 (UTC)
Received: from mail-oi1-f179.google.com ([209.85.167.179]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MKKlN-1oNtUS1xh1-00LkWn for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022
 10:26:51 +0200
Received: by mail-oi1-f179.google.com with SMTP id v4so24409639oiv.1
        for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 01:26:51 -0700 (PDT)
X-Gm-Message-State: AJIora8dha0ZDYoBBwSDWi6LMMAROX4cLCNnK0V9BVNRmI3rYnH6ZYRI
	nH9cy7StjJv+djC2507Mwa8C77WdsHpEriQrvGw=
X-Google-Smtp-Source: AGRyM1u9pqhopZfdeBwO5Xx/VVhkNHcq295BMkoofP9ZNnYY2D6jA3KH7S/W8w1wfJ7YkyJ8w4hAFE87FHJq0iNcABM=
X-Received: by 2002:a05:6808:1147:b0:32f:1a3a:2210 with SMTP id
 u7-20020a056808114700b0032f1a3a2210mr1518557oiu.155.1655972810216; Thu, 23
 Jun 2022 01:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220623044752.2074066-1-chenhuacai@loongson.cn>
 <20220623044752.2074066-2-chenhuacai@loongson.cn> <CAJF2gTR1ksvWWT1tec1QnOt6rzDucx5qzWO44nA_vHFhqMtG_g@mail.gmail.com>
 <CAAhV-H7p=zr7vjzENLgByqRUsH1mNQb8fFxNBkQu2YsWp1gMWA@mail.gmail.com>
In-Reply-To: <CAAhV-H7p=zr7vjzENLgByqRUsH1mNQb8fFxNBkQu2YsWp1gMWA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jun 2022 10:26:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0pKc7=iLcFY028HqJXmGupacm=tV7Wqgx0+bYSqczoog@mail.gmail.com>
Message-ID: <CAK8P3a0pKc7=iLcFY028HqJXmGupacm=tV7Wqgx0+bYSqczoog@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] LoongArch: Add qspinlock support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Rui Wang <wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2IEc3W9Y3VIm545kZ5mGWfLILC0nnxbYvfeaQ5CIZgyo9tMDz+e
 8CReAjioRap1sRlbxasr4fFS1pPwDWcM+CfJeWGpiMUD4xSkkFp3z+bZuVYCA2k3Uy4fXKr
 AlVy/EBTAE5CosXJvcNn985JZHXFdTTRUyUT5CXcSUdHtEn262v1Pz+w3vDjVSfBIpHVwts
 lBuF2lG7sIf/HehuR2TWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qIDdZ9tAWrA=:ujEBRfMTl3Uu91jMqadCXi
 Moopxik8Yg9cmiugcKiFJPG16hsVpGyQbfe9n+Lz48jzAFLZuF92/uUv8zTjvz/GjQfFYk+BS
 yg4zyNfZ1i92AQwlN/QiR55eKajNgiHwOmQ/3f2Ox5/88ZiFEsntgTCPWK7bV4Bo+Y9AinswR
 IAx3tbIhEOI9mJvclT9VK+GrUlIhRBxe62OtAWjjPY+Ueztm21zDvjsySUehFdXAQMSwXGuJS
 wciET9Nxw00twiGJcIdPBwb82qti+khj3vL1R0bryp9gHt3rUPvny/ZFkcnB6lrSEl//k5FK8
 ekyLLup7/HUWdEt3C/F+y7nUrSSlF6FY5KJhAfqeDsgAei+rhFykkf1gRelY3gTAMw27GIx6I
 UL0n6ODyaQpDXxyGQVIU4Mn+Iug/O/2f6TmP4KjEmWdjC+jpRNupTM93Uk/9WubDHJPyLwDr5
 iGZG5fKWhHdWGUiMIMRu/noMwewWCSSaj1O8tkTnASxEJyp3wfmyv2q/kJRfKdY+4TFjBuyaL
 1/+qdy405fJMg1GIRR3Y0ij/gtNMc2R0orBb4sphttoazYbuJiIEGmU5FD9ZSWFE2DR6udIdO
 tE/l98haSL77Qw+rEPvCBzCtgmPqzeTvl3rj5wm2LsxVy4ZrVWxmoxtKnTRaeyc1o4PFfDt+2
 VdvFwdLz2jYs8EwIYj1ha65uUZCdrHxhSO2TJ3YY1vtlqbSyES1iNPRh9+vue/yvKiptNN4Xq
 xqi/gYA+5nIPXvu3l7iJfUPCczP6jKlL1dlfQte2S6AdNe+qw15f4vzL2JHxj8fqMoqUHVGg8
 pkP/2coEquZvNwWvBVYPu+1F857K8P4pqZ10Px113uP25a95XCd4s8WNHpkBXICTnpPY/k8ir
 uSKYmBhiX1hypYQyCSUg==

On Thu, Jun 23, 2022 at 9:56 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> On Thu, Jun 23, 2022 at 1:45 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Thu, Jun 23, 2022 at 12:46 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > >
> > > On NUMA system, the performance of qspinlock is better than generic
> > > spinlock. Below is the UnixBench test results on a 8 nodes (4 cores
> > > per node, 32 cores in total) machine.

You are still missing an explanation here about why this is safe to
do. Is there are
architectural guarantee for forward progress, or do you rely on
specific microarchitectural
behavior?

> > Could you base the patch on [1]?
> >
> > [1] https://lore.kernel.org/linux-riscv/20220621144920.2945595-2-guoren@kernel.org/raw
> I found that whether we use qspinlock or tspinlock, we always use
> qrwlock, so maybe it is better like this?
>
> #ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> #include <asm/qspinlock.h>
> #else
> #include <asm-generic/tspinlock.h>
> #endif
>
> #include <asm/qrwlock.h>

Yes, that seems better, but I would go one step further and include
asm-generic/qspinlock.h
in place of asm/qspinlock.h here: The two architectures that have a
custom asm/qspinlock.h
also have a custom asm/spinlock.h, so they have no need to include
asm-generic/spinlock.h
either.

        Arnd
