Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F9182
	for <loongarch@lists.linux.dev>; Tue,  5 Jul 2022 08:45:26 +0000 (UTC)
Received: from mail-yw1-f176.google.com ([209.85.128.176]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N17cq-1nS3700koM-012blW for <loongarch@lists.linux.dev>; Tue, 05 Jul 2022
 10:45:24 +0200
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2ef5380669cso101578467b3.9
        for <loongarch@lists.linux.dev>; Tue, 05 Jul 2022 01:45:23 -0700 (PDT)
X-Gm-Message-State: AJIora/nMdlKG0NwUL+s+krzzQJJgmUOJWmqFLS+hpc+it4kZGdQS0C7
	xDANWjsEPR+t711jrgG4K8+hro4/unrtbUbTJdM=
X-Google-Smtp-Source: AGRyM1uYOtyfJXKuzgeWcPon6/rt8pxK0qL+mbZnG1H+QlCtBup1RqkQZxF1vAGhyIUYZLMpsbPW6k5+SWmkY5+yibA=
X-Received: by 2002:a81:230c:0:b0:31b:f368:d0b0 with SMTP id
 j12-20020a81230c000000b0031bf368d0b0mr38196589ywj.249.1657010722935; Tue, 05
 Jul 2022 01:45:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220704112526.2492342-1-chenhuacai@loongson.cn>
 <20220704112526.2492342-5-chenhuacai@loongson.cn> <CAK8P3a2XBGtJMB=Z-W56MLREAr3sAYKqDHo3yg=4hJ4T6x+QdQ@mail.gmail.com>
 <CAAhV-H5djQOzRsW-JaRPzaAnh64WgHiGvHxc1UdAUV43tirukg@mail.gmail.com>
 <CAMZfGtXLxPO3jmkKpF7n9Scb=542yrf1taWHZGdPwK-tZsJXgQ@mail.gmail.com>
 <CAK8P3a14VTkTjRNTWsGmwLDuVm=QPL17_VZ8QkcCYnyQzBjXHA@mail.gmail.com> <CAMZfGtU0n_-Bq95X+_rZjcyeK3QhKSq2t5HRvx5Kw5+tR9h+oA@mail.gmail.com>
In-Reply-To: <CAMZfGtU0n_-Bq95X+_rZjcyeK3QhKSq2t5HRvx5Kw5+tR9h+oA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 Jul 2022 10:45:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1K9fmLK=dh8shHX2y=fOYzr02D9Ek9uQri-u_2MsBXdQ@mail.gmail.com>
Message-ID: <CAK8P3a1K9fmLK=dh8shHX2y=fOYzr02D9Ek9uQri-u_2MsBXdQ@mail.gmail.com>
Subject: Re: [PATCH V4 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Muchun Song <songmuchun@bytedance.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:F2xXSEZSHmvQ1wkYFqBT9gAA5fhEDBboHLbYfnDkt0Y4d6xTgrY
 7oRv8h5Z6LSe+Xf5JBEmY66jVhB8Z0y8icanI6VE1BHfGpCn89+4Zd42okdqlCGVYH6ACzy
 Vd5hc+jo+0aX8mm3O2KKr6ZoDfpuLWafePw2cmkTBO0Zn4ZD4H4JLDsLGo0QidZID7fFzt4
 6jbLk10xTgVcrjjm4cfdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:g5cVJ9PgMpA=:2SF2DWVXGSqw/+GfMdz+mR
 HFA3EsKwHSyLJb5LhfMyyBJYR3N8pKn2zOkOhOqOafn4nxEVlt2QxuH4/fDrodEH2i79izdzY
 9YgRdKjO75E9oS1NJKQYwQsehoROiC0GCFMI8kpIpu/TAYl0uHv4u1Hbfq3cSR/p6mcJM8VWq
 Y+5GAGd6pOwe7RrV6ATM1mmPNBB5ig3zJtt3LsfWWex3TZWKr7IT+LcnZLGnYKgeTNhy8Mx3j
 OlG0SlHnliSOchTwYYhDPa3ueN/4L0HCQJRsjmZRWSDLfm3DBeWXAj/Qz8UCOzMYGfEw9sBny
 rr+WniTTtSHcqLaU+DakPz4YSFKx9Fp12XsMMV/R7Dw9/gz1YpocXLEbZ1grf8WhMKdqfxtGx
 Er5UizhrMn+9i62ozd+uYaZzyGhcfcy9z1eptiha58LvZuEnHpNMzHx2ltCuAU1CVX1D2HG8B
 Z4pMv6IOZaAdiy14EHkxc1g36jKfVBZIZLpjUv2keWYzSm2k91FHwzvOKNU5qUZ3U/5jyV5Tw
 GmJigHvjDDhNZ1rlHGzodrCEOhR4uygM5CjRtjouDg4OiRa3k60SMJCHQbHwKRaEXrQNvAdbw
 hYtpBlaB8J6SFKc5SkWA/+zxyUdxNNZrv4puSWQjK72ZtZ+O/afLFdyXaf/Rp1Cj9QG7UcBTg
 Si9jopVZ41oWwMOwN/XC1Jg1pXmxCf2h3lP+TZ7tnOJAhJAYaRS6lT7O4jN2e/HeHwAd60GLe
 3vwScu0QFjO2ZRzznNp1ilJSUyHnMgqQkZW22UxwVaG87qVcKBcaMS+YrzB7ErejQpeJrSB8s
 7HvraT46IAieieyIj9Dh0mfe8641lY+35YPA9pvjj9WkK2rwznxWiC/JHlU8uozxCEH5vak1n
 jtXnXzIqekwCwLTGffnw==

On Tue, Jul 5, 2022 at 10:38 AM Muchun Song <songmuchun@bytedance.com> wrote:
> On Tue, Jul 5, 2022 at 4:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Jul 5, 2022 at 9:51 AM Muchun Song <songmuchun@bytedance.com> wrote:
>
> How about including the static key header in the scope of
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP?

That helps a little, but it means we still pay for it on x86 and
arm64, which are the
most common architectures.

       Arnd
