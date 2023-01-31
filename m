Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816006ADE
	for <loongarch@lists.linux.dev>; Tue, 31 Jan 2023 12:59:53 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id bk15so41304953ejb.9
        for <loongarch@lists.linux.dev>; Tue, 31 Jan 2023 04:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tmFGl6w1T2X4Iy8+4eFf49j5NvCgFbPb0EL0ASIAaVI=;
        b=eWXVzLfbpi3n2E+VS5aBQxpuKaAQTApd9ALBvi4nr3xCIZcR2372Q+JwCNDnh8SJ3F
         FtiSeLIvLjfs55hR5TQ2QKb/lnp55d3hs73tb14pMvvWWJzgNZOIQfLJF8m0l+HQNglb
         OWamgw70Ge/2LtyVYYjNGUb5CbnBsPzyLAcNDX4WSKckRQ36F4NOCLRJUxs3KpXkZ88g
         QeVy1RS7kpdxNKzOcHZX00s//yteeMaKcSBXqQSveGB7mtqCEvxqd6Ai+CbvHFz4rRAj
         SlkrOVQpAf8kL8EV8676ZX+jWcFiQoa73DoCueWYXzTTKNGatxGvRfzCs89y+rkFtCnq
         9zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmFGl6w1T2X4Iy8+4eFf49j5NvCgFbPb0EL0ASIAaVI=;
        b=DJgl69Rgv215jAtKtuQn1z3Rh7BqornD0dqtfddNc3uh/S/+y4cpQyovGtOj9eq3An
         98ezEJsLTFs/pIlGInExXEU3Gz8YbK4ghA82JCVQvFOEPuksZp9kCa7QnMk2+ug1o2kb
         4OyaHoquywihPCI5fUH+UYW1vrJ1ETJ9/UxQ6Mq1eohVuXXUOB8RTODtRY6P7owfFgUN
         pjvTKlr2iuhyEojowew4fq61R4EB9MK9UccvqwjkCZUN9L5sZwazFKK4UBNIy1DZ4N5c
         jDQdEb/+NtTwhIwff0qvwrksMO2k6c9NYlEXbHEkLyMECxW7aUjhB4q0xjR1CcFV6SlF
         w8Ww==
X-Gm-Message-State: AO0yUKVOLgNgEO5c63XW/X7LB2vh83RJc+WaAaeOu+emhb0uhKiorvXO
	YufY9NCI5eq7ht+5l/+7ta0bFXildjywMmBKmpc=
X-Google-Smtp-Source: AK7set970BlocwV52n44djBoL/Js4qvYthDu+af0gSiKo5LxU6fJE+DM2hEBIFVxOCFGQjMs5MfdOHs1/I3SDYkdMcc=
X-Received: by 2002:a17:906:4950:b0:88a:b6ca:7d3a with SMTP id
 f16-20020a170906495000b0088ab6ca7d3amr1315292ejt.1.1675169991517; Tue, 31 Jan
 2023 04:59:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1673227292.git.zhoubinbin@loongson.cn> <Y88VIXerF5Wk/9kj@mail.local>
In-Reply-To: <Y88VIXerF5Wk/9kj@mail.local>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 31 Jan 2023 20:59:37 +0800
Message-ID: <CAMpQs4+8m0r98eGMHO7ktS2_AuNCA_u3Yk1q06i99TdbVZJ_Cg@mail.gmail.com>
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

Hi Kelvin:

Excuse me.
I am submitting the Loongson-2K/LS7A RTC driver and Alexandre would
like me to merge the ls1x rtc driver in parallel.
Unfortunately I found out that the loongson-1 does not yet support DT
and would like to ask if you have any plans to support DT?

I think this is the prerequisite for the merge.

Regards.


Binbin




On Tue, Jan 24, 2023 at 7:24 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 09/01/2023 09:35:10+0800, Binbin Zhou wrote:
> > Hi all:
> >
> > The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
> > released five versions of patchset before, and all related mail records
> > are shown below if you are interested:
> >
> > https://lore.kernel.org/all/?q=ls2x-rtc
> >
> > In this series of patches, based on the code above, I have added the
> > following support:
> >
> > 1. Add ACPI-related support, as Loongson-3A5000 + LS7A is now ACPI-base
> >    by default under LoongArch architecture;
> > 2. Add rtc alarm/walarm related functions.
> >
> > I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
> > and Loongson-2K0500.
> >
> > BTW:
> > There have been discussions about merging the rtc drivers of ls1x and
> > ls2x, but the following reasons made the merger difficult to achieve:
> >
> > 1. ls1x does not support ACPI, for it is only on MIPS-based system;
>
> This is not a good justification, you have to support both in your
> driver anyway, as shown by your CONFIG_ACPI ifdefery.
>
> > 2. ls1x does not support alarm function.
>
> It is just a matter of clearing a single bit, this is not difficult at
> all.
>
> >
> > Thanks.
> >
> > -------
> > Changes since v1:
> > 1. Rebased on top of latest loongarch-next;
> > 2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
> > errors when the driver gets the IRQ number, Thanks to Qing Zhang for
> > testing;
> > 3. Remove some inexact CONFIG_ACPI.
> >
> > Binbin Zhou (4):
> >   rtc: Add support for the Loongson-2K/LS7A RTC
> >   LoongArch: Enable LS2X RTC in loongson3_defconfig
> >   MIPS: Loongson64: DTS: Add RTC support to LS7A
> >   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
> >
> > WANG Xuerui (3):
> >   dt-bindings: rtc: Add Loongson LS2X RTC support
> >   MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
> >   MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
> >
> >  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
> >  arch/loongarch/configs/loongson3_defconfig    |   1 +
> >  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
> >  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
> >  arch/mips/configs/loongson2k_defconfig        |   1 +
> >  arch/mips/configs/loongson3_defconfig         |   1 +
> >  drivers/rtc/Kconfig                           |  11 +
> >  drivers/rtc/Makefile                          |   1 +
> >  drivers/rtc/rtc-ls2x.c                        | 379 ++++++++++++++++++
> >  9 files changed, 410 insertions(+)
> >  create mode 100644 drivers/rtc/rtc-ls2x.c
> >
> > --
> > 2.31.1
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
