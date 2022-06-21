Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A15C7E2
	for <loongarch@lists.linux.dev>; Tue, 21 Jun 2022 06:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F79C341CD
	for <loongarch@lists.linux.dev>; Tue, 21 Jun 2022 06:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655793355;
	bh=JMKqhOBxXrawPUykfqx8Oj6WlbWJ2UBiXKkbqFUY/2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YNZ1BvzH/JV3KRB/pcCYfdia99mSD8myaVMIPanEMRhUV+uCAA3jD6BAw1J0x6sRE
	 QUADNPx1WTiCErefSzEhpZtMw4iEawWbQXV8deeBrHqtJvLkUumD1S1sNb6Ikb5b3L
	 O/QEimttGnmv/SS4XetUp8zCr41zfyrY3XqFSyh1wPUg+cOnd/EaG+609hKm0uD5D+
	 MK7EHQ2FDTEV4mYbvoGfbgk+ljN+sZ4G3kUdjKny0HZ4ABkVB+N53Fe3RR1H0VCXkZ
	 WfZep/HnUrP/AsPfv+cgCwlbTjAs7juqH3QBiYSYXy9GZDdn+Ape+zXWG3kxK85Edu
	 re262lm7BG22g==
Received: by mail-lj1-f175.google.com with SMTP id b23so5682861ljh.7
        for <loongarch@lists.linux.dev>; Mon, 20 Jun 2022 23:35:55 -0700 (PDT)
X-Gm-Message-State: AJIora/Ii5j3QzAdkywrAuDqsIYZb+8cjYvB2mEALSeIhaVEmIwqogCm
	AtpuQuUFhqdqXGW5dW6eMY66vs4Ywquo48OmKFU=
X-Google-Smtp-Source: AGRyM1u8F7ekZm6P3bDtbQ3fBC4j9z9rBNp8ZDBt+lKEqlDTGIM4Z9uLIBnSKBHWFZROilPTeGS0oi70rueSET/SqB4=
X-Received: by 2002:a05:651c:506:b0:257:c12:b941 with SMTP id
 o6-20020a05651c050600b002570c12b941mr13701498ljp.429.1655793353606; Mon, 20
 Jun 2022 23:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145859.582176-1-chenhuacai@loongson.cn>
 <CAK8P3a1L40=P8GnuyK--K7URyrdAb4XcPJ-+HxwY4_+siA25oQ@mail.gmail.com>
 <CAAhV-H4AO3friSYrpAN_VM6aLO7yfV2svKg=7w_3F3HpV7Dq4Q@mail.gmail.com> <CAK8P3a3Wu7vCzxgjAWugiaBonARqU88NYuQj4JyqATmTDrPEaw@mail.gmail.com>
In-Reply-To: <CAK8P3a3Wu7vCzxgjAWugiaBonARqU88NYuQj4JyqATmTDrPEaw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 21 Jun 2022 14:35:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4YiixeMW=3Bi-nqhchp2cvQWWKkfADBrFCkVxpfqxocg@mail.gmail.com>
Message-ID: <CAAhV-H4YiixeMW=3Bi-nqhchp2cvQWWKkfADBrFCkVxpfqxocg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add sparse memory vmemmap support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, Min Zhou <zhoumin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Arnd,

On Mon, Jun 20, 2022 at 7:27 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jun 20, 2022 at 12:24 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > On Fri, Jun 17, 2022 at 11:42 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Fri, Jun 17, 2022 at 4:58 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > >
> > > > Add sparse memory vmemmap support for LoongArch. SPARSEMEM_VMEMMAP
> > > > uses a virtually mapped memmap to optimise pfn_to_page and page_to_pfn
> > > > operations. This is the most efficient option when sufficient kernel
> > > > resources are available.
> > >
> > > I have not looked at this in detail, but from a high-level perspective, it
> > > seems very similar to the corresponding code in arch/arm64 and arch/x86.
> > >
> > > Can you try to merge the three copies into a generic helper and add that
> > > to mm/sparse-vmemmap.c? If this does not work, can you describe in the
> > > changelog text why these have to be architecture specific?
> >
> > It is difficult to merge, because LoongArch needs to call pud_init(),
> > pmd_init() and other similar things which are unnecessary on ARM64 and
> > X86.
>
>  I can see that this part of the code is the same as mips. What is the
> initialization
>  for? Can it be encapsulated in an architecture specific inline
> function (for mips
> and loongarch), with a generic version like this?
>
> #ifndef pud_init_invalid
> static inline void pud_init_invalid(void *) {}
> #endif
OK, let's have a try.

Huacai
>
>        Arnd
