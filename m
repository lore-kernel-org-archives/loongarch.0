Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8370E7F6
	for <loongarch@lists.linux.dev>; Mon, 20 Jun 2022 11:26:58 +0000 (UTC)
Received: from mail-yw1-f178.google.com ([209.85.128.178]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MhUDj-1nQb9n1E9r-00egOD for <loongarch@lists.linux.dev>; Mon, 20 Jun 2022
 13:26:56 +0200
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-3178ea840easo58869157b3.13
        for <loongarch@lists.linux.dev>; Mon, 20 Jun 2022 04:26:56 -0700 (PDT)
X-Gm-Message-State: AJIora/o55J8PWlNLAGEeu6pzZQ9YswX0dge1+zlWCZ3aBx65n34Xz30
	6+Jv1tI5dzJ5IWWoKwKC+5qnyoyk2Ja/GKeN3kM=
X-Google-Smtp-Source: AGRyM1u96dMc7NQSr64fMvJHkkfPwQF10BArwoGPZrI0++jMEyDVdKrxQlsin6cZpuKPKbHfsaERKjvgbnrA7J4ywnc=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr11456604ywd.347.1655724415136; Mon, 20
 Jun 2022 04:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145859.582176-1-chenhuacai@loongson.cn>
 <CAK8P3a1L40=P8GnuyK--K7URyrdAb4XcPJ-+HxwY4_+siA25oQ@mail.gmail.com> <CAAhV-H4AO3friSYrpAN_VM6aLO7yfV2svKg=7w_3F3HpV7Dq4Q@mail.gmail.com>
In-Reply-To: <CAAhV-H4AO3friSYrpAN_VM6aLO7yfV2svKg=7w_3F3HpV7Dq4Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Jun 2022 13:26:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Wu7vCzxgjAWugiaBonARqU88NYuQj4JyqATmTDrPEaw@mail.gmail.com>
Message-ID: <CAK8P3a3Wu7vCzxgjAWugiaBonARqU88NYuQj4JyqATmTDrPEaw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add sparse memory vmemmap support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, Min Zhou <zhoumin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bTC9LPGk19j4zbZhdY9ttlFg/aqFrIueyFvc5JOG6IXA2nkhKtm
 szYfZQzk92fU0XU3CsFRp7L/RpcadC7xISGcesOWJg5mU/DWx07Z6wjOyzlXYisG89kX2k/
 BA6y0SZQx/pawUxIEMvjDHiEqxEoQuqNni9DwleL1pmR0jYS9VkrL4iAzgKWE9ijCIM1KZ8
 KLoe/AHYSyDCkMJnu6opA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DsGz0LefbYE=:tdePvepNvaDovSrXSyRaY/
 w/65urQVBy6ELZkBr1rUAB/TZq/iKz3s3fU2SFbDfiSd9SUZlutMsHh0ZD4rbCqkMIpHbeXED
 1kAGdkpiThgJCoWx7ezpYSV6yTZF2PKJO0596HBBL09ukzRgODdLz9Ev2u8DOwIeRYEY7F/W/
 GJm5hDyu9cDdWhP4t4xC9p1qLdXB8c7gH3sHg6O7uswDcIZHHx+hGy2agZvERUMc0hGaPOgL8
 y5anOh/4AsFVSKez62zbZZMdQp8LQhAzy9H2+u3rFu9mp7WlJ1nqYIbzQXz8C7yYU5EUiyTkm
 Cdi6ztH/xbB7roDuts0HK3sO2jdbMIG+o30N7ZHdr1UL0/zKcEAjMfJlF7MKqm/+5e7y0UR2v
 Rf1wSkkZth4+0tflHK402vqVRdpY+T8ZdBtjgYKksrhmndCxzsCae+kNIx6C5dDeXAPPjF+TW
 rRJkX8g3sz3dwsFt26f89eIY1ox+xRSbgkYO7hfuuf4BAvj/8puxn8MLgsQPuzRwprkXXG4I3
 QZ3ikZ2eAJbm2k+IPeRAlWLJh/titBlQeb85z7q/l2CYCu8WIUNw5WGu95Tw0rsMHiOUj77ph
 Dg4Slp0atPAfcrLqmQINpFI+uxN031hFJsQs/MHQ2ofDCTYgzyFMtMyypQalXkvD58F1ZGrFE
 Mu+PlvD1gwksR8xkjxpNlCnW7WG8IViYEDA3nnNLTI5blvq086Hi7HP2qem4IzM19OnA86VaG
 KNybx7tiVYAolnn9EohHPysdQuXw59g7Kf3dZQ==

On Mon, Jun 20, 2022 at 12:24 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> On Fri, Jun 17, 2022 at 11:42 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, Jun 17, 2022 at 4:58 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > >
> > > Add sparse memory vmemmap support for LoongArch. SPARSEMEM_VMEMMAP
> > > uses a virtually mapped memmap to optimise pfn_to_page and page_to_pfn
> > > operations. This is the most efficient option when sufficient kernel
> > > resources are available.
> >
> > I have not looked at this in detail, but from a high-level perspective, it
> > seems very similar to the corresponding code in arch/arm64 and arch/x86.
> >
> > Can you try to merge the three copies into a generic helper and add that
> > to mm/sparse-vmemmap.c? If this does not work, can you describe in the
> > changelog text why these have to be architecture specific?
>
> It is difficult to merge, because LoongArch needs to call pud_init(),
> pmd_init() and other similar things which are unnecessary on ARM64 and
> X86.

 I can see that this part of the code is the same as mips. What is the
initialization
 for? Can it be encapsulated in an architecture specific inline
function (for mips
and loongarch), with a generic version like this?

#ifndef pud_init_invalid
static inline void pud_init_invalid(void *) {}
#endif

       Arnd
