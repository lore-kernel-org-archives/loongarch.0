Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA722917
	for <loongarch@lists.linux.dev>; Tue,  5 Jul 2022 07:51:44 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id o2so15164150yba.7
        for <loongarch@lists.linux.dev>; Tue, 05 Jul 2022 00:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k8cdnnptoSm5AJC45vIjlcJ8J1DipiYnWtE0ruW2rxs=;
        b=hrW9cMR7Z3PxWD/FtQwAajFkdScrx1WIecOy3tNPSPFj7ZpT3MS6GjAIcWTagfEmKJ
         gkd2p1YtA2R+Hh+5XgkXthXfwg2R5jG2gKm0g6phV8Lrz5F4whqrhU83Dj4tyPwZFMtM
         uh781jvQ7OZBXq+KPR5Hc8P02RQW8jmkhPaUJ/ZwYrOawwLL/FrmV28X7ASFhZjVAiDC
         4PMU4qslIoAXQOx4rSi7700OVzBPHPOTQk+OIii9voMpdvQNDRlo5aNm95xeq1Ki2eBG
         hdoFAWundROhfmqT1kj2LM1sDGiWNawV/jwFpZ3ps+48699ORO58C04c2n4NkdSQvBX9
         lJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k8cdnnptoSm5AJC45vIjlcJ8J1DipiYnWtE0ruW2rxs=;
        b=bkK52hzUMpLD/TataZP+AxXeEydh9K7ABPxHBprkSz5B9HzYV7w5YDaiD0ZoBtGOhf
         eSn5AuG1pZpMQyue5rhNERbADpII30DmEY600Vyr4Tp4RBZeDgdj+Nm1ZcvNad4CNr+9
         xuxF2RczCixKbluBtEZd9d1I00fnEgmNjja7ZiR9MXEkKyCaafgz0JYfR6+X8039Mh9b
         y8LYKbE/xQ1taw7euse4cuayY6o3VCecRwgCgv/qjJHhtoUiKKz4jM5NiY4bO3DfAs1x
         tIIR34o1pvLfOITe5nx0yHW8nT4JjH9k6TxHPN6wH+Z8lhTyrMXZMwIovDsHBF3Udwae
         0jqg==
X-Gm-Message-State: AJIora/ZYGy175j45kRIMvrGpBOdbuApdoVhXefdbaPFPd+jagW8k8GQ
	uAEdsNxl6VWavTpJcsscbww3d+H6C0GSgbPXN/xBDw==
X-Google-Smtp-Source: AGRyM1tcec4ZVozLeG3AHgF0JBmdcEQv61u7/2ayYABYM50nQefJuIIBRyMGNOqvt0ngm0odO3V8Tx51FRXcuMYED+M=
X-Received: by 2002:a25:4290:0:b0:66e:53b2:56ed with SMTP id
 p138-20020a254290000000b0066e53b256edmr7670009yba.254.1657007503251; Tue, 05
 Jul 2022 00:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220704112526.2492342-1-chenhuacai@loongson.cn>
 <20220704112526.2492342-5-chenhuacai@loongson.cn> <CAK8P3a2XBGtJMB=Z-W56MLREAr3sAYKqDHo3yg=4hJ4T6x+QdQ@mail.gmail.com>
 <CAAhV-H5djQOzRsW-JaRPzaAnh64WgHiGvHxc1UdAUV43tirukg@mail.gmail.com>
In-Reply-To: <CAAhV-H5djQOzRsW-JaRPzaAnh64WgHiGvHxc1UdAUV43tirukg@mail.gmail.com>
From: Muchun Song <songmuchun@bytedance.com>
Date: Tue, 5 Jul 2022 15:51:06 +0800
Message-ID: <CAMZfGtXLxPO3jmkKpF7n9Scb=542yrf1taWHZGdPwK-tZsJXgQ@mail.gmail.com>
Subject: Re: [PATCH V4 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
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

On Tue, Jul 5, 2022 at 2:22 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Arnd,
>
> On Mon, Jul 4, 2022 at 8:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Mon, Jul 4, 2022 at 1:25 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > To avoid the following build error on LoongArch we should include linux/
> > > static_key.h in page-flags.h.
> > >
> > > In file included from ./include/linux/mmzone.h:22,
> > > from ./include/linux/gfp.h:6,
> > > from ./include/linux/mm.h:7,
> > > from arch/loongarch/kernel/asm-offsets.c:9:
> > > ./include/linux/page-flags.h:208:1: warning: data definition has no
> > > type or storage class
> > > 208 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
> > > | ^~~~~~~~~~~~~~~~~~~~~~~~
> > > ./include/linux/page-flags.h:208:1: error: type defaults to 'int' in
> > > declaration of 'DECLARE_STATIC_KEY_MAYBE' [-Werror=implicit-int]
> > > ./include/linux/page-flags.h:209:26: warning: parameter names (without
> > > types) in function declaration
> >
> > I wonder if page_fixed_fake_head() should be moved out of line to avoid
> > this, it's already nontrivial here, and that would avoid the static key
> > in a central header.
> I have some consideration here. I think both inline function and
> static key are instruments to make things faster, in other words,
> page_fixed_fake_head() is a performance critical function. If so, it
> is not suitable to move it out of line.

+1

The static key is an optimization when HVO is disabled.

Thanks.

>
> Huacai
> >
> >        Arnd
> >
