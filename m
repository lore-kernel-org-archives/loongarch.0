Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1FA7C
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 14:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6492FC341CD
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656165839;
	bh=C5zyn33P/zx+/OuoboKif52+Z4ZI1k2KgZZOj1rGIKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eGOJ+M7R2mWnfreF/Y0aGTx6aPyLa8FVD9TCuG1cU5i36xAL34LCR2de3nUIrfCA9
	 XKHn12QDeHPXKkQf/kk/X3DoH4pyd7jdqwjqO8oIepsj7vQvYellIMUcW2i8LB7JyU
	 +wL7jKhC8sEsXrAo1RIzgBNc1+mCh2XRW+36C4XIvrfKy6ids7oBeAHnIwYQjy8QfN
	 8Uvb7pPXVQxRoJxjARNlvzRuvJiglYG9SmqR16ebHpThtpcx+nt4S0eiCWv1cy05fJ
	 FpPrv4fW0Z9ffaj8xx4xXcR0JgcWuJk1Om6u10pFmtqA7KFfUeoi6aGdDdaxR16sBr
	 Px5/YArFDK0qg==
Received: by mail-vs1-f42.google.com with SMTP id 63so4834233vsv.10
        for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 07:03:59 -0700 (PDT)
X-Gm-Message-State: AJIora/VmkixN1t0UAW9ZNuFYLm78XYdZckId7F22hlSEyYX8hbAVL8W
	KkH1zavCd2oawuG8wRKnt6qhz4imNcDTj+G+3Mk=
X-Google-Smtp-Source: AGRyM1v6VtHGN1cdlWiRNaLV08Fcs+aEOaNEQOgBwRhWVk3LFQJtmcSejFESeQ/ppUSgU+hyjIwUB2prsgMwb1L1TTY=
X-Received: by 2002:a67:f588:0:b0:354:35de:4329 with SMTP id
 i8-20020a67f588000000b0035435de4329mr1596413vso.84.1656165838248; Sat, 25 Jun
 2022 07:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220623091412.2479084-1-chenhuacai@loongson.cn>
 <c737a16e-81ee-de53-bf2c-352592a06821@xen0n.name> <743ca1b4-9157-7059-666d-34f7fec0419f@xen0n.name>
In-Reply-To: <743ca1b4-9157-7059-666d-34f7fec0419f@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 25 Jun 2022 22:03:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7ROXWYTTpyMKccnrnvQMX7XhFB0KGfCs9h=09sSAQjVw@mail.gmail.com>
Message-ID: <CAAhV-H7ROXWYTTpyMKccnrnvQMX7XhFB0KGfCs9h=09sSAQjVw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix EENTRY/MERRENTRY setting in setup_tlb_handler()
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

On Sat, Jun 25, 2022 at 6:18 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 6/25/22 17:33, WANG Xuerui wrote:
> > On 6/23/22 17:14, Huacai Chen wrote:
> >> setup_tlb_handler() is expected to set per-cpu exception handlers, but
> >> it only set the TLBRENTRY successfully because of copy & paste errors,
> >> so fix it.
> >>
> >> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >> ---
> >>   arch/loongarch/mm/tlb.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
> >> index 6d050973241c..0cb2f2aa88aa 100644
> >> --- a/arch/loongarch/mm/tlb.c
> >> +++ b/arch/loongarch/mm/tlb.c
> >> @@ -289,7 +289,8 @@ void setup_tlb_handler(int cpu)
> >>           pcpu_handlers[cpu] = virt_to_phys(addr);
> >>           memcpy((void *)addr, (void *)eentry, vec_sz);
> >>           local_flush_icache_range((unsigned long)addr, (unsigned
> >> long)addr + vec_sz);
> >> -        csr_write64(pcpu_handlers[cpu], LOONGARCH_CSR_TLBRENTRY);
> >> +        csr_write64(pcpu_handlers[cpu], LOONGARCH_CSR_EENTRY);
> >> +        csr_write64(pcpu_handlers[cpu], LOONGARCH_CSR_MERRENTRY);
> >>           csr_write64(pcpu_handlers[cpu] + 80*VECSIZE,
> >> LOONGARCH_CSR_TLBRENTRY);
> >>       }
> >>   #endif
> >
> > Kinda interesting no problem showed up on my devbox so far...
> >
> > Reviewed-by: WANG Xuerui <git@xen0n.name>
>
> Actually, my box failed to boot up with this applied, even if the code
> looked innocuous... The boot simply hangs after printing CPU/FPU
> revisions for CPU1 and nothing else after that (apart from a lone "crng
> init done" line) so it's very likely this patch is the culprit. (I was
> boot-testing 5 patches at once.)
>
> Might have to check again; don't apply as-is in the meantime.
Very sorry to hear that, I have fixed that locally but forgot to send
V2, and now the fixed version is in the latest PR.

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
