Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976BA4A
	for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 06:07:00 +0000 (UTC)
Received: from mail-yw1-f169.google.com ([209.85.128.169]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MrQR7-1nJegH1nWx-00oVC6 for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022
 08:06:58 +0200
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3176b6ed923so168787737b3.11
        for <loongarch@lists.linux.dev>; Wed, 29 Jun 2022 23:06:58 -0700 (PDT)
X-Gm-Message-State: AJIora9hflyG6QBcJ6pT55epKdRCYH0Ers/ykAXWCGe8v+84j9ooVGR+
	TDvN8Zfdq0PYkftE038+3K72P3jXOAter4JbdqY=
X-Google-Smtp-Source: AGRyM1si8Xct+Du/ZHF969rBnPY4ejd78bmjSd2IBZVFQkb9/WgScc4xVPKj47Mi/RxJU38P5FHTJWTl4A4/3M+aGx4=
X-Received: by 2002:a81:230c:0:b0:31b:f368:d0b0 with SMTP id
 j12-20020a81230c000000b0031bf368d0b0mr8380804ywj.249.1656569217193; Wed, 29
 Jun 2022 23:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220630043237.2059576-1-chenhuacai@loongson.cn> <20220630043237.2059576-5-chenhuacai@loongson.cn>
In-Reply-To: <20220630043237.2059576-5-chenhuacai@loongson.cn>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Jun 2022 08:06:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1x=ZX+W0XL-=MkZebHdbvB0Ngam5LxXJUnm7USpMaFMA@mail.gmail.com>
Message-ID: <CAK8P3a1x=ZX+W0XL-=MkZebHdbvB0Ngam5LxXJUnm7USpMaFMA@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fiCY/sVF1n8Y66nhHSOIuIou7VQ2vpWvl7iulxxQzbMj2JEJaih
 3Vv/651vhEKVZ4FHLpO++9lZ2SbeqbeipbhPYtroEYn3bQqM1rl8xcF/+aCFjqCYkM4MlJi
 0U+LNESxzBrQVRMndkcd8bWLNco2ArLFqkr8ac2JM83xsOsVnEKJo155/12OcEBZqZtptA0
 9vNUGOmSgYQFjM735yL9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DZbJF9kff+k=:E635Tuzs/pkGhlPSyxFtTe
 5EnSIQ/DMaQBmVWpHLTew3Po4udFX8BXgjPoeH5Cx8skZJh634bJhEIIA/TjnKWQ51CRd/pmL
 4hfwmvMozkXisLRSX/NA2oSDF2MXEpJPcj0vHDxU0YwI4mFFD8N4SwKEWvwoVNsZdlYX5er+y
 2aYXcPfTDtm6IQ3QmekBihCgot80Ik4Ym+K9zGy5km8R/aEJ5fH4fK6PCNMOveerBTapcQONs
 oohvLjjTfSakVbP+l0eqTYf/KSIxN58A5VwgjZpH2FIC6URm6qk4mnRdD+lYDssqYhNra92t3
 B8wmMBzr8/H6AkXVyVFrJM/eiIWEb7xng9QQrQUiA4oyQp8pqqbnlCTt4bugAcw2pf7d9lZaV
 t67yBhVqtAZoB6WCegT9sVebv0RppSOlqGR0RD7Lqiz5rcxrPcR6A/rF4MmVeeWXchkEjcaiC
 xLcl+Si9dWGjvxm+2ddUVcn12fTytUk39oRssYGzXhlAllgvBJLSDNE8SJZb0zlyDAhZYIGC7
 dvtPKLuQHJWKP/JhlSeFj4vWVJYoxuMmLDPI93YIskj1cijHPxo0ICaQ3Hj3dp6JVLqAZn7QU
 hqXCaDPl3dw9YDeleJZigIfss+udfENun/KvHJgZzyJvWUyCUTH+zD4wF15vBIYA4rBcJgvUR
 NW0bUxxyQiHwsYG9Nu6xTzt/Tv0MnLyiS/QOhXBzzJQT9SfL2ilJqYkBcEHvTtw0v9+r05GWl
 j+HeQ/j8urIxCIPimkwHWcQWKbTWrlokqWhdrkWnykE9vB2st1FKBCxDgPdnMzI8nep9SqH49
 VgpUJPPHU2oCtUSMxnX+OawPlYz6SKMpn8sFZgDPaths/Ykoldlia8UffgLmhTbzhvrmSfkoX
 qPYSYbdvu+dogfRdxN1PVXpwCLWpj0wuR6K82MeAc=

On Thu, Jun 30, 2022 at 6:32 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> To avoid build error on LoongArch we should include linux/static_key.h
> in page-flags.h.

This is an expensive change in terms of compile speed, as static_key.h has
lots of dependencies, and page-flags.h is included in a lot of places. What
it is actually needed for?

         Arnd
