Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DB617EC
	for <loongarch@lists.linux.dev>; Thu, 14 Jul 2022 06:59:49 +0000 (UTC)
Received: from mail-yw1-f173.google.com ([209.85.128.173]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLRDv-1ntWj20O3f-00IS7L for <loongarch@lists.linux.dev>; Thu, 14 Jul 2022
 08:59:47 +0200
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-31c8bb90d09so7834087b3.8
        for <loongarch@lists.linux.dev>; Wed, 13 Jul 2022 23:59:46 -0700 (PDT)
X-Gm-Message-State: AJIora+PVQp7IRi/+ChL48ys/Y+ORPdSe04IMdxSLM23aR0xyp6hjgN/
	JwLIKhDDl0AvehFZDpgpJYu5OyXXc9zF9jehFBs=
X-Google-Smtp-Source: AGRyM1tgxYSVD/gYAxs1WCM6JhzELwA8WwTUgiYEaMRwN6Q6Zg/uUd6yRx65tlEIUnIRkovs/IpphI7wi/ZKPISkkKw=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr8121384ywp.347.1657781985894; Wed, 13
 Jul 2022 23:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220712075255.1345991-1-chenhuacai@loongson.cn>
 <20220712075255.1345991-3-chenhuacai@loongson.cn> <CAMuHMdUazqHLbc80vpZ+Msg9A3j5aPJ3fx+CdCG3kuWDSf8WSw@mail.gmail.com>
 <CAAhV-H775jXMbcR9j=oLBuHo1PfFziZSUQWttJAEw20sUt+GAA@mail.gmail.com>
 <CAMuHMdUHbepd974u5iox3BcOyo_Q2ZgT-znruk+WCt+HMQ_Lgw@mail.gmail.com>
 <CAAhV-H78Fi0aE-h5MOgRa5L+Jt7D0wG0nLcYzx45jVney8T1BQ@mail.gmail.com>
 <CAMuHMdVXFmKR4LuXHYRrSk3Q0VRqATGbsM512DxayWCPCE-wvg@mail.gmail.com>
 <c8c959fa-f17d-f0dd-6a8d-e0b0ce622f3a@xen0n.name> <CAAhV-H6g5nLGJMz0ZsZqC5-73VSGffVdc6r0=3HHBo3Z8PQOBg@mail.gmail.com>
In-Reply-To: <CAAhV-H6g5nLGJMz0ZsZqC5-73VSGffVdc6r0=3HHBo3Z8PQOBg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Jul 2022 08:59:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0GUPSYBai3Z9vzw0wrXGLFiik6hdY3zc6nQ6mQs7yHvQ@mail.gmail.com>
Message-ID: <CAK8P3a0GUPSYBai3Z9vzw0wrXGLFiik6hdY3zc6nQ6mQs7yHvQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] M68K: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
To: Huacai Chen <chenhuacai@gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michal Simek <monstr@monstr.eu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, loongarch@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>, 
	stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:d+U2UyhBtR3jVETLPeN0SIT+Jsv9xe0YREDHEMAlJKchVWmt6C+
 avX4XIGOJ4JiiRaWMJ7bNthuHZW6mh71T7Z5m7weKzjzU0cih0WCZjVePMoGlVnHyjIFNhd
 kYHMTywEXOeZirsUxVo/Zx6Biilak8GMBbIYG1n8cRO0VoWZpZN5GusrchA5kBuRCkb80le
 MOrbYy4exsCdHnvQqE5Pw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XgWN1vCutP0=:qkns28hbgTqVsDKk4b+9I8
 oFYQHJ3v0zjYIIwbWxdao60p0WSoSgsRGZYh1qon4pRYupAkDRqs1vf17VYvUcqvnGwUojie8
 rn5/gFJwFQ85uWE+stMA/17QbeLW795BMu7SJqg5nwgeq9mYuzfNMA9/yk04JFffSvuq8Nwl2
 N9M6D3j2TycufmsvYcDsXKNRvYK6faMNbiCCNF6uPPYz2bIY8C7oP0JmvV4MrUGoHGoBolbkq
 fr+M9zzsrQdQNZmerm5Sa14JYgGWLn5Lami7CK9MDwWc7RZCFFod3UZh2xoPi+oj5/X7oD7Oy
 QtenxSoMzlCD9M/yHeMVZ+AiFH97dOpw1PprRXs8s4vRp1fsTRaHmj8666HBjdzkFKKWIldGU
 kplX0UzH0NouRYOZgeEmGHBhDCxqlVVZjdb4a/3KWWwzt6N62cSLT/jrSvmeox8iqz+vswJUe
 QCg0WC+iFUUqYwJxuDXAYH0qoZTzgQ0v2ZqF6oPNi2aEd25KzHkCCrLEJmOMvh0poRvjZm8hs
 mlvQgJhKMIigrxpzL7J5+FUT8fhWvFuqqFjsK7cUes3TU6or/gKd12mizyHAiQ1cnvtTGootm
 mHDNJolJxNwVj8/vQPISv5vOXKJHlYAFFP2bRX820DWN2ZEpiI2v3or353y50bF/ccbAygEI7
 CoVt5aVxg73Rgw5uwayz/EICDS5rqFzq8jz8OfuAwYMSOxRTIqfArAp0QBtlbPtubtzfTSDgI
 RRJToze7l2HLeZOa8USX+gAlRATIIcBdoE77IYDBasrN2z14IEkfqJBh3L179M8vFLiTT7+qw
 F6ZGgbDTVsRhhY/pP82OPgl/E5d/WgmTiIos46gXYBwcjw1Sziy6Rccl4vj17TH1dx6bqVvDg
 hBYtfk8OihMX40lybwOA==

On Thu, Jul 14, 2022 at 4:07 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> On Tue, Jul 12, 2022 at 6:15 PM WANG Xuerui <kernel@xen0n.name> wrote:
> > On 2022/7/12 17:13, Geert Uytterhoeven wrote:
> >
> > But judging from the intent of this patch series (fixing WARNs on
> > certain configs), and that the triggering condition is currently
> > impossible on m68k (and other non-SMP) platforms, I think cleanups for
> > such arches could come as a separate patch series later. I think the
> > m68k refactoring is reasonable after all, due to my observation above,
> > but for the other non-SMP arches we may want to wait for the respective
> > maintainers' opinions.
>
> It seems that the best solution is only fix architectures with SMP
> support and leave others (m68k, microblaze, um) as is. :)

I think it probably makes sense to do this as a combined cleanup patch,
which I can merge through the asm-generic tree, for all architectures
whose maintainer does not pick it up directly. For SMP architectures,
it's a bugfix that we probably want backported into stable kernels, while
for non-SMP targets it is just a minor cleanup for consistency.

        Arnd
