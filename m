Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982EF7B
	for <loongarch@lists.linux.dev>; Mon, 20 Jun 2022 04:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38465C341C8
	for <loongarch@lists.linux.dev>; Mon, 20 Jun 2022 04:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655699216;
	bh=OAthta1phLKkQIKQW9+J+eds3olo6VBueIgwDcoHNwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FrzhF+9UTHmUMgHjqx/dRyRX9v4jSHYXTV6rgRGubVNnp/9PIz/LEzY1GHDoYwMCT
	 FWDUTQ1Haww04lDAalm0aAREZQK6+7tuMes3kf//vRJK8UIi69sKIDcpoj2eGceSwL
	 SxcB4IUOq0DUBUQuy6pCKC0B3TaGlHr1DeEpBbsCVtq9hBwcp+KuZM2kAxCxQiRJyK
	 RtShmDPVnQf/ElkbcDvgUxzgyDqqvUGkfOt4HLHYWgP833UzvQn+jhIb78izB/dblP
	 Ybw8i92I0afUvL/BAMbt+uYooaP6VodJHDOQZ3JLzfl05BO6neUMKNhXMax558Fz1C
	 Mu4z1XKOHyN7Q==
Received: by mail-lf1-f51.google.com with SMTP id a2so15302248lfg.5
        for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 21:26:56 -0700 (PDT)
X-Gm-Message-State: AJIora/iDMtevC1lYIO+BLi7qIt0GkhYLDePwopfuobihTCNzupw3va9
	eAi+4vED2CCBnFKIy4VHE3N2YcmcYbWBgN9MVDk=
X-Google-Smtp-Source: AGRyM1uYyyQjf9Decjv0WPr7mJzVYnU+TOsVlPnJvM4Za2MdmoVcQWzOB7ITLBdGYmYg7Kh2IT1KTqP3MSGzl+OkCHc=
X-Received: by 2002:a05:6512:258a:b0:47d:bb62:910f with SMTP id
 bf10-20020a056512258a00b0047dbb62910fmr12198749lfb.447.1655699214150; Sun, 19
 Jun 2022 21:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145828.582117-1-chenhuacai@loongson.cn>
 <CAHirt9hRs_iTvAZ=UxBBK448j7p+pYxKsMVise=Jj2qCtNky2Q@mail.gmail.com>
 <CAAhV-H4=04qygAFqm36RBM-ktXhO7M8HMBeCPBOnB8xYz268Zw@mail.gmail.com> <94bebe28-5988-d6b6-bf82-03ef5901cd69@xen0n.name>
In-Reply-To: <94bebe28-5988-d6b6-bf82-03ef5901cd69@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 20 Jun 2022 12:26:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4-=T5hA1UwFq2uN=PU0L9KV9jU9jkDQh9UuyyuUr=zEQ@mail.gmail.com>
Message-ID: <CAAhV-H4-=T5hA1UwFq2uN=PU0L9KV9jU9jkDQh9UuyyuUr=zEQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add vDSO syscall __vdso_getcpu()
To: WANG Xuerui <kernel@xen0n.name>
Cc: hev <r@hev.cc>, Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	loongarch@lists.linux.dev, linux-arch <linux-arch@vger.kernel.org>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

On Sat, Jun 18, 2022 at 8:56 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 6/18/22 17:10, Huacai Chen wrote:
> > Hi,
> >
> > On Fri, Jun 17, 2022 at 11:35 PM hev <r@hev.cc> wrote:
> >> Hello,
> >>
> >> On Fri, Jun 17, 2022 at 10:57 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> >>> We test 20 million times of getcpu(), the real syscall version take 25
> >>> seconds, while the vsyscall version take only 2.4 seconds.
> >>>
> >>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >>> ---
> >>>   arch/loongarch/include/asm/vdso.h      |  4 +++
> >>>   arch/loongarch/include/asm/vdso/vdso.h | 10 +++++-
> >>>   arch/loongarch/kernel/vdso.c           | 23 +++++++++-----
> >>>   arch/loongarch/vdso/Makefile           |  3 +-
> >>>   arch/loongarch/vdso/vdso.lds.S         |  1 +
> >>>   arch/loongarch/vdso/vgetcpu.c          | 43 ++++++++++++++++++++++++++
> >>>   6 files changed, 74 insertions(+), 10 deletions(-)
> >>>   create mode 100644 arch/loongarch/vdso/vgetcpu.c
> >>>
> >>> diff --git a/arch/loongarch/include/asm/vdso.h b/arch/loongarch/include/asm/vdso.h
> >>> index 8f8a0f9a4953..e76d5e37480d 100644
> >>> --- a/arch/loongarch/include/asm/vdso.h
> >>> +++ b/arch/loongarch/include/asm/vdso.h
> >>> @@ -12,6 +12,10 @@
> >>>
> >>>   #include <asm/barrier.h>
> >>>
> >>> +typedef struct vdso_pcpu_data {
> >>> +       u32 node;
> >>> +} ____cacheline_aligned_in_smp vdso_pcpu_data;
> >>> +
> >>>   /*
> >>>    * struct loongarch_vdso_info - Details of a VDSO image.
> >>>    * @vdso: Pointer to VDSO image (page-aligned).
> >>> diff --git a/arch/loongarch/include/asm/vdso/vdso.h b/arch/loongarch/include/asm/vdso/vdso.h
> >>> index 5a01643a65b3..94055f7c54b7 100644
> >>> --- a/arch/loongarch/include/asm/vdso/vdso.h
> >>> +++ b/arch/loongarch/include/asm/vdso/vdso.h
> >>> @@ -8,6 +8,13 @@
> >>>
> >>>   #include <asm/asm.h>
> >>>   #include <asm/page.h>
> >>> +#include <asm/vdso.h>
> >>> +
> >>> +#if PAGE_SIZE < SZ_16K
> >>> +#define VDSO_DATA_SIZE SZ_16K
> >> Whether we add members to the vdso data structure or extend
> >> SMP_CACHE_BYTES/NR_CPUS, the static VDSO_DATA_SIZE may not match, and
> >> there is no assertion checking to help us catch bugs early. So I
> >> suggest defining VDSO_DATA_SIZE as ALIGN_UP(sizeof (struct vdso_data),
> >> PAGE_SIZE).
> > VSYSCALL usage is very limited (you know, VSYSCALL appears for so many
> > years, but the number nearly doesn't increase until now), so I think
> > 16KB is enough in the future.
>
> I don't think omitting compile-time assertions for *correctness* is
> worth the negligible improvement in brevity and ease of maintenance. In
> fact, static checks for correctness actually *lightens* maintenance
> burden, by explicitly calling out the assumptions so that newcomers
> (i.e. me or some other random linux/arch developer refactoring code)
> would find them very helpful.
>
> So I'm in support for declaring the VDSO_DATA_SIZE explicitly in terms
> of sizeof(struct vdso_data) and PAGE_SIZE.
I'll use hev's method, thank you.

Huacai
