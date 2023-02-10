Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE3CA29
	for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 10:03:22 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id c26so9594842ejz.10
        for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 02:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XHUKpkdGd++gIe1TTqGxf+onHwGJzdjk6BqCtOyUWvo=;
        b=B25J+RQN4hbCSUxZHXRFFwp33OvvgN0dBQzT282s5MI7kUYCNiby7K17JStLnnUCcC
         46mdcIDgqSfpVzx1xpKPLTud12CfnL15O+g5lyV7si4Vuwmlp6JoVi3bGsbf4mck+MnF
         kVQ1nDv85/hVeOQSXgre5inRNCMh0FPNSUtY3MbtAP7f9eutqv2Fj9JOsWwIRWVMY0rE
         OG/tNEROztQ5uJQjLkZj5Xd68jOtfHi3FgmCMY6B76A3/zhmKXBvUFM8WS0eNFOSpRAf
         kz67laa3To7OxMpGMEL1CEmZPrOOuZt9gcE1rmsbFKS1aIXXuSBsDl7f1WuvTT0Z+A5D
         9ShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHUKpkdGd++gIe1TTqGxf+onHwGJzdjk6BqCtOyUWvo=;
        b=KSUHu2tUorIw3sFlc5kINyk/GzlmnlAXAJiHxVaPwgXxkz2fpxydLqwSoAlzGtXFNF
         9KkiZg4pqIzkbLiQ5USOgeaeofhNJ8Yh2zlFq9D693JcbDzACy61L+kHcyStoZ65+Ts2
         vNxdv3xwlEQ6onEnX9Luo4UiKDJuJ3yHIivE+0j5O5kK6gxUncPWehB+Cb//9cSoqvvc
         PaTF/kfQMG3EgVQmGJYCMrDuN7IwvKI765/f2ykBrTHHLVf7RT2D+a8qQk1Ru9kOaNkr
         uaupbM2hVyPmJHj4DzS1nVzlyU3xfWS5JftccVxITk/0vWqviOM0AD4Pdp3efoimIGEH
         uxSw==
X-Gm-Message-State: AO0yUKWgxF8bmPozJPItjg9CdBSlcLHWr98EJSzBiZypcJ6V+GP8wcHp
	rphJZ0ndIvPrfv+9reXRe6bSywbqzMi894wr4j0=
X-Google-Smtp-Source: AK7set8Me7MZ4F9pBrAU7Tp/HAMc22VtwSTNVx3364jQvI8VRWK34oOx3/MuG5UbwaGmdEfiy06Y4EjoA9wWAaCaaFc=
X-Received: by 2002:a17:907:c715:b0:8af:449f:8fae with SMTP id
 ty21-20020a170907c71500b008af449f8faemr763617ejc.3.1676023400392; Fri, 10 Feb
 2023 02:03:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1673227292.git.zhoubinbin@loongson.cn> <Y88VIXerF5Wk/9kj@mail.local>
 <CAMpQs4+8m0r98eGMHO7ktS2_AuNCA_u3Yk1q06i99TdbVZJ_Cg@mail.gmail.com>
In-Reply-To: <CAMpQs4+8m0r98eGMHO7ktS2_AuNCA_u3Yk1q06i99TdbVZJ_Cg@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 10 Feb 2023 18:03:07 +0800
Message-ID: <CAMpQs4+uW75TdkMicdfU+5LYQxA_7kfbdabwO=iDiKwW-PzO9Q@mail.gmail.com>
Subject: Re: [PATCH V2 0/7] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Alessandro Zummo <a.zummo@towertech.it>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, linux-rtc@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	Qing Zhang <zhangqing@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	zhaoxiao <zhaoxiao@uniontech.com>, zhzhl555@gmail.com, 
	Kelvin Cheung <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 31, 2023 at 8:59 PM Binbin Zhou <zhoubb.aaron@gmail.com> wrote:
>
> Hi Kelvin:
>
> Excuse me.
> I am submitting the Loongson-2K/LS7A RTC driver and Alexandre would
> like me to merge the ls1x rtc driver in parallel.
> Unfortunately I found out that the loongson-1 does not yet support DT
> and would like to ask if you have any plans to support DT?
>
> I think this is the prerequisite for the merge.
>
> Regards.
> Binbin
>
>

Hi Alexandre:

Unfortunately there has been no reply from Keguang for the past week
or so. Can we try rtc-ls2x and rtc-ls1x to coexist until Loongson-1
supports DT?
Later on, if Keguang or someone else familiar with Loongson-1 adds DT
support, I would be happy to continue trying to merge the two drivers.

Regards.
Binbin

>
>
> On Tue, Jan 24, 2023 at 7:24 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 09/01/2023 09:35:10+0800, Binbin Zhou wrote:
> > > Hi all:
> > >
> > > The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
> > > released five versions of patchset before, and all related mail records
> > > are shown below if you are interested:
> > >
> > > https://lore.kernel.org/all/?q=ls2x-rtc
> > >
> > > In this series of patches, based on the code above, I have added the
> > > following support:
> > >
> > > 1. Add ACPI-related support, as Loongson-3A5000 + LS7A is now ACPI-base
> > >    by default under LoongArch architecture;
> > > 2. Add rtc alarm/walarm related functions.
> > >
> > > I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
> > > and Loongson-2K0500.
> > >
> > > BTW:
> > > There have been discussions about merging the rtc drivers of ls1x and
> > > ls2x, but the following reasons made the merger difficult to achieve:
> > >
> > > 1. ls1x does not support ACPI, for it is only on MIPS-based system;
> >
> > This is not a good justification, you have to support both in your
> > driver anyway, as shown by your CONFIG_ACPI ifdefery.
> >
> > > 2. ls1x does not support alarm function.
> >
> > It is just a matter of clearing a single bit, this is not difficult at
> > all.
> >
> > >
> > > Thanks.
> > >
> > > -------
> > > Changes since v1:
> > > 1. Rebased on top of latest loongarch-next;
> > > 2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
> > > errors when the driver gets the IRQ number, Thanks to Qing Zhang for
> > > testing;
> > > 3. Remove some inexact CONFIG_ACPI.
> > >
> > > Binbin Zhou (4):
> > >   rtc: Add support for the Loongson-2K/LS7A RTC
> > >   LoongArch: Enable LS2X RTC in loongson3_defconfig
> > >   MIPS: Loongson64: DTS: Add RTC support to LS7A
> > >   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
> > >
> > > WANG Xuerui (3):
> > >   dt-bindings: rtc: Add Loongson LS2X RTC support
> > >   MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
> > >   MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
> > >
> > >  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
> > >  arch/loongarch/configs/loongson3_defconfig    |   1 +
> > >  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
> > >  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
> > >  arch/mips/configs/loongson2k_defconfig        |   1 +
> > >  arch/mips/configs/loongson3_defconfig         |   1 +
> > >  drivers/rtc/Kconfig                           |  11 +
> > >  drivers/rtc/Makefile                          |   1 +
> > >  drivers/rtc/rtc-ls2x.c                        | 379 ++++++++++++++++++
> > >  9 files changed, 410 insertions(+)
> > >  create mode 100644 drivers/rtc/rtc-ls2x.c
> > >
> > > --
> > > 2.31.1
> > >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
