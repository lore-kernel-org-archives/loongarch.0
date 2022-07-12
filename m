Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E27A
	for <loongarch@lists.linux.dev>; Tue, 12 Jul 2022 09:01:19 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id l15so2123893qvo.11
        for <loongarch@lists.linux.dev>; Tue, 12 Jul 2022 02:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9ec7iguCfy6L3waGgPnWXclPbbw0CysomvMpi7xE8A=;
        b=jCF3DzrR933nGrp485pjqd1uTs7tVT8GFK9JN95vmlDL4oUQVHAY7F+Dy2+Yf1g7Wn
         cZ5/IFmQbdJ8SjmTMN0BGcG/wwgy0PLUxEUUBPN++yAG0rcvrne1qeHnav3reTgrevI5
         abYSk0YCxPGE8cu8HEQ6x+0dqVIFhPcNMhs7zb3Vh0i5Y+HIkGD2MeeSVLNnneQYvvbT
         oMFcNZCs3gycie1Qllgmgo362L904iIIQOK8hxQ4gGBstxnpCS0t5N19kOw/QA5Zh+TA
         84yEg+xA32gtHSknytPktkuSCKcj8wcOjMJhrZn3vk5TxmF3/EbN9EGimUAeMTqMbKJ+
         ekdQ==
X-Gm-Message-State: AJIora8m7US23hYxWowcF1mn3SqyUMFf2/oTBC1+Tn2EzygZGyY7mkJi
	Y839MO6Gr/rzyrx0l1RfQIEnDwNmQu36MA==
X-Google-Smtp-Source: AGRyM1tTP+Z3Czv69e/ysFVCyG6kMY5b1Qxm0HSc1ngIgACyMho6DOr+CLz3haMkvk0A3/HJeH72ZQ==
X-Received: by 2002:a0c:a94b:0:b0:473:2a12:8d2a with SMTP id z11-20020a0ca94b000000b004732a128d2amr16754739qva.65.1657616478396;
        Tue, 12 Jul 2022 02:01:18 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id bs18-20020a05620a471200b006a6b564e9b8sm8639853qkb.4.2022.07.12.02.01.14
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:01:17 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id p129so12862508yba.7
        for <loongarch@lists.linux.dev>; Tue, 12 Jul 2022 02:01:14 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr20596635ybt.604.1657616474618; Tue, 12
 Jul 2022 02:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220712075255.1345991-1-chenhuacai@loongson.cn>
 <20220712075255.1345991-3-chenhuacai@loongson.cn> <CAMuHMdUazqHLbc80vpZ+Msg9A3j5aPJ3fx+CdCG3kuWDSf8WSw@mail.gmail.com>
 <CAAhV-H775jXMbcR9j=oLBuHo1PfFziZSUQWttJAEw20sUt+GAA@mail.gmail.com>
In-Reply-To: <CAAhV-H775jXMbcR9j=oLBuHo1PfFziZSUQWttJAEw20sUt+GAA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Jul 2022 11:01:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHbepd974u5iox3BcOyo_Q2ZgT-znruk+WCt+HMQ_Lgw@mail.gmail.com>
Message-ID: <CAMuHMdUHbepd974u5iox3BcOyo_Q2ZgT-znruk+WCt+HMQ_Lgw@mail.gmail.com>
Subject: Re: [PATCH 3/6] M68K: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
To: Huacai Chen <chenhuacai@gmail.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michal Simek <monstr@monstr.eu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, loongarch@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>, 
	stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Huacai,

On Tue, Jul 12, 2022 at 10:53 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> On Tue, Jul 12, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jul 12, 2022 at 9:53 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > When CONFIG_CPUMASK_OFFSTACK and CONFIG_DEBUG_PER_CPU_MAPS is selected,
> >
> > DEBUG_PER_CPU_MAPS depends on SMP, which is not supported on m68k,
> > and thus cannot be enabled.
> This patch is derived from MIPS and LoongArch, I search all
> architectures and change those that look the same as MIPS and
> LoongArch.
> And the warning message below is also a copy-paste from LoongArch, sorry.
>
> Since M68K doesn't support SMP, then this patch seems to make no
> difference, but does it make sense to keep consistency across all
> architectures?

Yes, having consistency is good.  But that should be mentioned in the
patch description, instead of a scary warning CCed to stable ;-)

BTW, you probably want to update the other copy of c_start() in
arch/m68k/kernel/setup_mm.c, too.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
