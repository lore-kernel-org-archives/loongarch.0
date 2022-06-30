Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB25813
	for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 06:05:24 +0000 (UTC)
Received: from mail-yb1-f179.google.com ([209.85.219.179]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MXoQG-1o7tmR0KsO-00YDi1 for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022
 08:05:23 +0200
Received: by mail-yb1-f179.google.com with SMTP id p7so30521398ybm.7
        for <loongarch@lists.linux.dev>; Wed, 29 Jun 2022 23:05:22 -0700 (PDT)
X-Gm-Message-State: AJIora85ALM29t6aEA39DRMRCATNtKsa2mMHtQetBlB7wve0w/El5Nyf
	RiVa1tqanK/o6fagpUbk7/RpdEfAcAfW2cIOwpk=
X-Google-Smtp-Source: AGRyM1vtT3pzk3IDIUdnI7V5TjBcb4k7QQp50McXs21ca3emcSDlR6eKLW5igXc4ObexSkfmEIzbtJFUPtpYReNpT5o=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr7959756ybu.134.1656569121704; Wed, 29
 Jun 2022 23:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220630043237.2059576-1-chenhuacai@loongson.cn> <20220630043237.2059576-4-chenhuacai@loongson.cn>
In-Reply-To: <20220630043237.2059576-4-chenhuacai@loongson.cn>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Jun 2022 08:05:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1f94z4oSnMr73PuiXkMR7uGhthzY_EWVniB+G4KXBcBQ@mail.gmail.com>
Message-ID: <CAK8P3a1f94z4oSnMr73PuiXkMR7uGhthzY_EWVniB+G4KXBcBQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] mm/sparse-vmemmap: Generalise vmemmap_populate_hugepages()
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
X-Provags-ID: V03:K1:/JfdNA0TfEPMsPrr3//8FnMQvWXMDzrncXcriBhxd/w11uu9qUZ
 NlDB3f1rdZpABW6H1Xpt+XGXQH5cHwgpn78QBdsXU4Gzwxghf/ekBKgIxOZ9AgrBoY7tBWc
 OT3zQi/ZSE/svwWKEIPTl7S+vYb+60OKxnj5ZAoCPA+ZesmLpCbZcMC/jKnjX2okwLykhV8
 p3eyzCRb/ZkuzghTAr7/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aNnmyKQHbOk=:SJ1OUJouP2NN0lHroGCDJ8
 LpWBt+H7GYvdtY1ISaiOvLwOARND1pYH2SabxXhKIQyMe6IUlhd8xVF4XwLqsBMB1iLtToSMY
 kEyOdWiCSNvKfL/VEMHlbDOcTjqvkekY5WwOybRYSyY8LoG941sv00ebPoevf/UXEsPc2j2a4
 PVlwgu5t6nQgCtxQjGKQnxSI36H2RkOUmUr88o8kSLF0GmqFcqO+h1WjirDbXn2TsFDRSLmHm
 3D3zy5ZmRFOg9fjcwXJaLG3uvQvRTvJ77Bs7CN/Kv3b5gPY5SetC7MiCNJg15po3QCTlSEPFv
 otDkiFnw2Ka0egYocnme6b5aP2gY1mxVL17VLyppQn542D+OSnYMaVsE3oUb4Utz7iHLpLQmu
 b+lulI6RSnncfrcuEK/H4QDw1QHHsYK1dnGRl3cGUneLzjR3grXBUkbLCNkM96CT+J3A0Y0Bi
 cWEapge7+nYjNahiyXGMhL8ZKPwSX4ti1hcAVJaCQg/SyYdm9veytPyuxq11kBoW+zoJulSHv
 CbxUDhgog+CDwJslEQfpILC3Ppvrz6vBRPoujrzALQJPsdexrH3Wf9ykryQx7MvhbFXqcPvp7
 7JIjPU2n2IqMKlZ8nxPAstfbXC6+kn4Y8My3CjSVAO4WFRfNjoJ0dASC2VnZRNMNacLrMUUEU
 EkaPvsXmd6SyLssrWDhelxcWMpVOH7HNmLBBZj277trew53wmkjAR1GmcJw7smReJi6QRO1LL
 WNln9wlDhrUv1Xy/WiQJn77KakgMy+bek/PiBA==

On Thu, Jun 30, 2022 at 6:32 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> From: Feiyang Chen <chenfeiyang@loongson.cn>
>
> Generalise vmemmap_populate_hugepages() so ARM64 & X86 & LoongArch can
> share its implementation.

Sharing this function is good, thanks for consolidating this

> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>

The Signed-off-by lines are in the wrong order, it should start with the author
and end with the final submitter.

> index 33e2a1ceee72..6f2e40bb695d 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -686,6 +686,60 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
>         return vmemmap_populate_range(start, end, node, altmap, NULL);
>  }
>
> +void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
> +                                     unsigned long addr, unsigned long next)
> +{
> +}
> +
> +int __weak __meminit vmemmap_check_pmd(pmd_t *pmd, int node, unsigned long addr,
> +                                      unsigned long next)
> +{
> +       return 0;
> +}
> +

I think inline functions would be better here, both for compiler optimization
and to make it easier to track the code flow. The normal way we do these
in architecture specific headers is to override the functions by defining a
macro of the same name.


        Arnd
