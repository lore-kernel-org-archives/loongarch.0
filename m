Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC617A
	for <loongarch@lists.linux.dev>; Tue, 12 Jul 2022 09:13:40 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id l2so2137895qvt.2
        for <loongarch@lists.linux.dev>; Tue, 12 Jul 2022 02:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qbAwHtAb/u/Ek/RuPM5JbYjzEl/C/Q4rkrYxQHQ2tOE=;
        b=JJRYFEijvAOVWcSCaEhy2pX/7p7ka9rOeN4KaI0O//6rwBKhOJTy2YeFtukxYk5ARD
         JTMbzk70hVbfpHyT/ikL6VZcYQAfLzsoh0fJ4f05O8sLmfGCHibi7ULK/tJuedsvD+eA
         +bsps9bxIMLSi3NbCgiCZG29fl8mjQSG3MdJwV2KMvXY51oPiFYIrRMSas8k3OPmz/td
         INo0ECEXY2oxXw3tNPjdnshUD1uJBULiC1pDPAEHr2kCCkiENY4843JjuXCb0FHj49Af
         U9kznq5SGTn/OrxGLEyWoTHdJvSDaYVo29ONEGQbmY8bUfV9ocB8QE4DV7Dg3g6mmtj5
         dzhA==
X-Gm-Message-State: AJIora+UwaSMyCIoQLV7sSFf1xWqKQknLYJurf8iIRvjNpvg1ntWAiPf
	hO/LBpfDE2UHeY6AxAts8ywn8L2Mershgw==
X-Google-Smtp-Source: AGRyM1sHXz/uaj0vrCK7hNzNosZgs6tStclNoBjy8d5WTnkb02unP1w1OBlM4IQQYUoaiA2Ma5aoVg==
X-Received: by 2002:a05:6214:76d:b0:473:2a39:45fb with SMTP id f13-20020a056214076d00b004732a3945fbmr16752514qvz.129.1657617219006;
        Tue, 12 Jul 2022 02:13:39 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id w16-20020a05620a0e9000b006b4880b08a9sm2519342qkm.88.2022.07.12.02.13.36
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:13:37 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id h62so10268253ybb.11
        for <loongarch@lists.linux.dev>; Tue, 12 Jul 2022 02:13:36 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr20912003ybr.380.1657617216068; Tue, 12
 Jul 2022 02:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220712075255.1345991-1-chenhuacai@loongson.cn>
 <20220712075255.1345991-3-chenhuacai@loongson.cn> <CAMuHMdUazqHLbc80vpZ+Msg9A3j5aPJ3fx+CdCG3kuWDSf8WSw@mail.gmail.com>
 <CAAhV-H775jXMbcR9j=oLBuHo1PfFziZSUQWttJAEw20sUt+GAA@mail.gmail.com>
 <CAMuHMdUHbepd974u5iox3BcOyo_Q2ZgT-znruk+WCt+HMQ_Lgw@mail.gmail.com> <CAAhV-H78Fi0aE-h5MOgRa5L+Jt7D0wG0nLcYzx45jVney8T1BQ@mail.gmail.com>
In-Reply-To: <CAAhV-H78Fi0aE-h5MOgRa5L+Jt7D0wG0nLcYzx45jVney8T1BQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Jul 2022 11:13:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXFmKR4LuXHYRrSk3Q0VRqATGbsM512DxayWCPCE-wvg@mail.gmail.com>
Message-ID: <CAMuHMdVXFmKR4LuXHYRrSk3Q0VRqATGbsM512DxayWCPCE-wvg@mail.gmail.com>
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

On Tue, Jul 12, 2022 at 11:08 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> On Tue, Jul 12, 2022 at 5:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jul 12, 2022 at 10:53 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> > > On Tue, Jul 12, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Jul 12, 2022 at 9:53 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > > > When CONFIG_CPUMASK_OFFSTACK and CONFIG_DEBUG_PER_CPU_MAPS is selected,
> > > >
> > > > DEBUG_PER_CPU_MAPS depends on SMP, which is not supported on m68k,
> > > > and thus cannot be enabled.
> > > This patch is derived from MIPS and LoongArch, I search all
> > > architectures and change those that look the same as MIPS and
> > > LoongArch.
> > > And the warning message below is also a copy-paste from LoongArch, sorry.
> > >
> > > Since M68K doesn't support SMP, then this patch seems to make no
> > > difference, but does it make sense to keep consistency across all
> > > architectures?
> >
> > Yes, having consistency is good.  But that should be mentioned in the
> > patch description, instead of a scary warning CCed to stable ;-)
> >
> > BTW, you probably want to update the other copy of c_start() in
> > arch/m68k/kernel/setup_mm.c, too.
> For no-SMP architectures, it seems c_start() in
> arch/m68k/kernel/setup_mm.c is more reasonable (just use 1, neither
> NR_CPUS, nor nr_cpu_ids)?

The advantage of using nr_cpu_ids() is that this is one place less
to update when adding SMP support later...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
