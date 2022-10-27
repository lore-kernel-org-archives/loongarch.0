Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA767B
	for <loongarch@lists.linux.dev>; Thu, 27 Oct 2022 12:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E665EC43141
	for <loongarch@lists.linux.dev>; Thu, 27 Oct 2022 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666874960;
	bh=ayJrA1JTyWdSi5OrotRFQzWnZgKlqWS2GTryuNv9C3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TENQaZ0qX8wT35paDg5nMw/zzqDcDEv6gQ/cVQgdGrgSOg6rcYgV82zB7lSd+aKWc
	 +im2fBZ6iDwS66vc3HKhmIPvDnkBzPWzAuPyrSgWZBgy+bdveHDvSvE1AQKBXXIAxh
	 LUksZbDLfpInJJ/P1SCJwJjBmGBzqyoa1xU2sRP3wdoDXnDJs6eHXezpsQxybLNmeU
	 UkuSpNW5BkYyHlEmTO/b46g/KZ5ZjdzER4j5ojkKYDlkhFith0OED+wB31MqxveAac
	 +bZnYuUAxtnuisxPxgDeKsNxiT++anokNcEa5KmETwhByjekKjuO5E86WulWhhVDMz
	 k5alL+wp+TuZA==
Received: by mail-ej1-f52.google.com with SMTP id k2so4266361ejr.2
        for <loongarch@lists.linux.dev>; Thu, 27 Oct 2022 05:49:20 -0700 (PDT)
X-Gm-Message-State: ACrzQf2hm+CoY/574Q4kgCaosCaegaszp8wQMxfN6NStRzo4eD9Bf5Uu
	LLyToR67m7tJtOLqQqFdW5qk5C2PjGYq9XB5Pg8=
X-Google-Smtp-Source: AMsMyM4y/u9sWFlXV8p8VaH9Xlg1ipNTnnAKSXBRsvzTB2BIHk4F2a4+XmGNyWABLqhGPAldl4sABjzRtQ5+fY6VgnY=
X-Received: by 2002:a17:907:3ea2:b0:7ad:86f9:7b15 with SMTP id
 hs34-20020a1709073ea200b007ad86f97b15mr4488706ejc.272.1666874959084; Thu, 27
 Oct 2022 05:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221024070105.306280-1-chenhuacai@loongson.cn>
 <20221024070105.306280-5-chenhuacai@loongson.cn> <CAJF2gTSN3zzvgAdiM8rYc3EGFxR4JJnHSh12mvsfUOQsqRRvkg@mail.gmail.com>
 <CAAhV-H40fcUW3jwGZXpPNjbpizXb85zytCpKGHvEGwoRpG3c0Q@mail.gmail.com> <3eb9b612-e765-7ad0-aed8-a50e28677e9c@linaro.org>
In-Reply-To: <3eb9b612-e765-7ad0-aed8-a50e28677e9c@linaro.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Oct 2022 20:49:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7uTTaSqrYwhvy78CAVmAJi_jJ4BipgfOW6LV5vYm8=NQ@mail.gmail.com>
Message-ID: <CAAhV-H7uTTaSqrYwhvy78CAVmAJi_jJ4BipgfOW6LV5vYm8=NQ@mail.gmail.com>
Subject: Re: [PATCH V13 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2022 at 9:44 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 26/10/22 14:59, Huacai Chen wrote:
> > On Mon, Oct 24, 2022 at 4:04 PM Guo Ren <guoren@kernel.org> wrote:
> >> On Mon, Oct 24, 2022 at 3:05 PM Huacai Chen <chenhuacai@loongson.cn> w=
rote:
> >>>
> >>> From: Feiyang Chen <chenfeiyang@loongson.cn>
> >>>
> >>> The feature of minimizing overhead of struct page associated with eac=
h
> >>> HugeTLB page is implemented on x86_64. However, the infrastructure of
> >>> this feature is already there, so just select ARCH_WANT_HUGETLB_PAGE_
> >>> OPTIMIZE_VMEMMAP is enough to enable this feature for LoongArch.
> >>>
> >>> To avoid the following build error on LoongArch we should include lin=
ux/
> >>> static_key.h in page-flags.h. This is straightforward but the build
> >>> error is implicitly a LoongArch-specific problem, because ARM64 and X=
86
> >>> have already include static_key.h from their arch-specific core heade=
rs.
>
> >>> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> >>> index 0b0ae5084e60..1aafdc73e399 100644
> >>> --- a/include/linux/page-flags.h
> >>> +++ b/include/linux/page-flags.h
> >>> @@ -9,6 +9,7 @@
> >>>   #include <linux/types.h>
> >>>   #include <linux/bug.h>
> >>>   #include <linux/mmdebug.h>
> >>> +#include <linux/static_key.h>
> >> Em... riscv needn't this.
>
> Would guarding the header suffice and make riscv OK with this patch?
Emm, since LoongArch has no build errors due to an accident now, I
will send a new version without static_key.h inclusion. If one day the
build error comes back, we can send a separate patch to fix it.

Huacai
>
>   #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>   #include <linux/static_key.h>
>   #endif
>
> > I found that after 36d4b36b69590fed99356a4426c940a25 (" lib/nodemask:
> > inline next_node_in() and node_random()"), build errors have gone. But
> > I think this is just an accident. Because that commit adds random.h
> > inclusion in nodemask.h, then asm-offsets.c --> sched.h --> nodemask.h
> > --> random.h --> once.h --> jump_label.h. If one day this chain is
> > adjusted, then build errors come again.
> >
> > On the other hand, page-flags.h is obviously using some static_key
> > macros, including static_key.h is straightforward for building.
> >
> > Huacai
