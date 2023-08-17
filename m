Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A754D80C
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 06:41:16 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-586a684e85aso79261247b3.2
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 23:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692254475; x=1692859275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMJC7hrurW391WkZyGokn2Ex5jeN7WUEe63sxXlCMEc=;
        b=GatgLQeM2z+W7S/8vmAjUV/3fi2Ksnqm7CABFckzma1OiWlpmyWFPVxxmUzCEnunjO
         FG2yKE4OhrOSqBtVbnfQpXPPbfikt+O/5pp0/Fj2sMeG79dgzGqzndpn6ijc+8gPzDx0
         jELAHUDKBSTK4RHyJ2X6N/I604tsyTEAU3gvWV2K8OYGcyit6e5Y+TANyYxBmtt4ApPM
         iH0Z3x+esmOlLP0dpGqBrrLrEsPEVxwI+LyZRCkky2muEzo0Chr6II8a2l8ViGMYxp9U
         aD9lE3nFYEdD2czPPuGv5GvTYEZRoADaRaDwd8hpObZun63PQXffRD5EXwDltszXSWiV
         YY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692254475; x=1692859275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMJC7hrurW391WkZyGokn2Ex5jeN7WUEe63sxXlCMEc=;
        b=XydGZ7RIjQHor6QvcaFt6OwsKBcn/S9oB1qJCFWzat0k7JQZJ80S2Ft0FtPDliZeVW
         91nuFKxpo9VwXHMcHwNbq4onyUrz0JrMyTzP35Am2EBST8WOLJ4xMYHLFmW9u3yGSuDC
         LbPWb6PImwLduJv+HOkiY99pASiKRDxzioxrSmbkuTtLBerNJ8QYVvg24jVqkGNv1Lhm
         ZdwaQrzNwp3rrD0/641MWTcV/z2n9BdotDz4gTgox+hPXY+g7fVFiCJCJyZqOfVZXN62
         uO6PdZFTxNeXDxTyo9+Bfcyg3Q25rgHr4Auke2PVrg/8zUzVncYxrUIwRDZA4lGV5cUw
         I1Tg==
X-Gm-Message-State: AOJu0YyXoo0gae3b6xjeIX1t1P29fbdlpTfcRA7sdgGUtczma62xicM2
	oyBTPAvA2Rx7XfPwqnjll78rgW1Vx4gc5Kmn7XA=
X-Google-Smtp-Source: AGHT+IE8bdg/RKBBNeeuzSK6h8v0sD0UWc5eDuE4rJwG85pcCmfDV4Nei4/yI5JxDCeelXjclxXp+2IzO58JS8A/ZkM=
X-Received: by 2002:a0d:fec5:0:b0:589:dc7a:3d79 with SMTP id
 o188-20020a0dfec5000000b00589dc7a3d79mr3351500ywf.21.1692254475397; Wed, 16
 Aug 2023 23:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692088166.git.zhoubinbin@loongson.cn> <dcd87b8934c9b9869ffb24b3c904905587dcaa42.1692088166.git.zhoubinbin@loongson.cn>
 <175ab37b-2b01-bd67-cfbc-914efc810a7f@linaro.org>
In-Reply-To: <175ab37b-2b01-bd67-cfbc-914efc810a7f@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 17 Aug 2023 14:41:03 +0800
Message-ID: <CAMpQs4JzwjYvj=XO3S-9GqatVuH1g-2cDkUKkEc70-+U1M+=+g@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] LoongArch: dts: DeviceTree for Loongson-2K1000
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your reply.

On Tue, Aug 15, 2023 at 10:56=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/08/2023 10:51, Binbin Zhou wrote:
> > Add DeviceTree file for Loongson-2K1000 processor, which integrates two
> > 64-bit dual emission superscalar LA264 processor cores.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  arch/loongarch/boot/dts/Makefile              |   3 +-
> >  .../boot/dts/loongson-2k1000-ref.dts          | 217 +++++++++++
> >  arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 345 ++++++++++++++++++
> >  3 files changed, 564 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/loongarch/boot/dts/loongson-2k1000-ref.dts
> >  create mode 100644 arch/loongarch/boot/dts/loongson-2k1000.dtsi
> >
> > diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts=
/Makefile
> > index aa0b21d73d4e..dc0782315bed 100644
> > --- a/arch/loongarch/boot/dts/Makefile
> > +++ b/arch/loongarch/boot/dts/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> > -dtb-$(CONFIG_MACH_LOONGSON64)        =3D loongson-2k0500-ref.dtb
> > +dtb-$(CONFIG_MACH_LOONGSON64)        =3D loongson-2k0500-ref.dtb \
> > +                               loongson-2k1000-ref.dtb
> >
> >  obj-$(CONFIG_BUILTIN_DTB)    +=3D $(addsuffix .dtb.o, $(CONFIG_BUILTIN=
_DTB_NAME))
> > diff --git a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts b/arch/loo=
ngarch/boot/dts/loongson-2k1000-ref.dts
> > new file mode 100644
> > index 000000000000..950a2df4e33f
> > --- /dev/null
> > +++ b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
> > @@ -0,0 +1,217 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2023 Loongson Technology Corporation Limited
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "loongson-2k1000.dtsi"
> > +
> > +/ {
> > +     compatible =3D "loongson,ls2k1000-ref", "loongson,ls2k1000";
> > +     model =3D "Loongson-2K1000 Reference Board";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +             bootargs =3D "earlycon";
> > +     };
> > +
> > +     cpus {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             cpu-map {
> > +                     cluster0 {
> > +                             core0 {
> > +                                     cpu =3D <&cpu0>;
> > +                             };
> > +                             core1 {
> > +                                     cpu =3D <&cpu1>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             cpu0: cpu@0 {
> > +                     compatible =3D "loongson,la264";
> > +                     device_type =3D "cpu";
> > +                     reg=3D <0x0>;
> > +                     clocks =3D <&clk LOONGSON2_NODE_CLK>;
> > +             };
> > +
> > +             cpu1: cpu@1 {
> > +                     compatible =3D "loongson,la264";
> > +                     device_type =3D "cpu";
> > +                     reg =3D <0x1>;
> > +                     clocks =3D <&clk LOONGSON2_NODE_CLK>;
> > +             };
> > +     };
> > +
> > +     memory@200000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x0 0x200000 0x0 0x6e00000>,
> > +                   <0x0 0x08000000 0x0 0x7000000>,
> > +                   <0x0 0x90000000 0x1 0xe0000000>;
> > +     };
> > +
> > +     reserved-memory {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             linux,cma {
> > +                     compatible =3D "shared-dma-pool";
> > +                     reusable;
> > +                     size =3D <0x0 0x2000000>;
> > +                     linux,cma-default;
> > +             };
> > +     };
> > +
> > +     i2c-gpio-0 {
> > +             compatible =3D "i2c-gpio";
> > +             scl-gpios =3D <&gpio0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRA=
IN)>;
> > +             sda-gpios =3D <&gpio0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRA=
IN)>;
> > +             i2c-gpio,delay-us =3D <5>;        /* ~100 kHz */
> > +             status =3D "disabled";
>
> Disabled node in board, without comment providing a reason, is useless.
> Drop the node or fix the status.

I got it, I will check it again.
>
> > +     };
> > +
> > +     i2c-gpio-1 {
> > +             compatible =3D "i2c-gpio";
> > +             scl-gpios =3D <&gpio0 33 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DR=
AIN)>;
> > +             sda-gpios =3D <&gpio0 32 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DR=
AIN)>;
> > +             i2c-gpio,delay-us =3D <5>;        /* ~100 kHz */
> > +             status =3D "disabled";
>
> Ditto
>
> > +     };
> > +};
> > +
> > +&gmac0 {
> > +     status =3D "okay";
> > +
> > +     phy-mode =3D "rgmii";
> > +     phy-handle =3D <&phy0>;
> > +     mdio {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             compatible =3D "snps,dwmac-mdio";
>
> compatible is always the first property.

OK...
>
> > +             phy0: ethernet-phy@0 {
> > +                     reg =3D <0>;
> > +             };
> > +     };
> > +};
> > +
> > +&gmac1 {
> > +     status =3D "okay";
> > +
> > +     phy-mode =3D "rgmii";
> > +     phy-handle =3D <&phy1>;
> > +     mdio {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             compatible =3D "snps,dwmac-mdio";
>
> compatible is always the first property.
>
> > +             phy1: ethernet-phy@1 {
> > +                     reg =3D <16>;
> > +             };
> > +     };
> > +};
>
> ...
>
> > +};
> > diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loonga=
rch/boot/dts/loongson-2k1000.dtsi
> > new file mode 100644
> > index 000000000000..fc3bb6368a5e
> > --- /dev/null
> > +++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> > @@ -0,0 +1,345 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2023 Loongson Technology Corporation Limited
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/clock/loongson,ls2k-clk.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <2>;
> > +
> > +     ref_100m: clock-ref-100m {
> > +             compatible =3D "fixed-clock";
> > +             #clock-cells =3D <0>;
> > +             clock-frequency =3D <100000000>;
> > +             clock-output-names =3D "ref_100m";
> > +     };
> > +
> > +     cpuintc: interrupt-controller {
> > +             compatible =3D "loongson,cpu-interrupt-controller";
> > +             #interrupt-cells =3D <1>;
> > +             interrupt-controller;
> > +     };
> > +
> > +     bus@10000000 {
> > +             compatible =3D "simple-bus";
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +
> > +             ranges =3D <0x0 0x10000000 0x0 0x10000000 0x0 0x10000000>=
,
> > +                      <0x0 0x2000000 0x0 0x2000000 0x0 0x2000000>,
> > +                      <0x0 0x20000000 0x0 0x20000000 0x0 0x10000000>,
> > +                      <0x0 0x40000000 0x0 0x40000000 0x0 0x40000000>,
> > +                      <0xfe 0x0 0xfe 0x0 0x0 0x40000000>;
> > +
> > +             dma-coherent;
> > +
> > +             liointc0: interrupt-controller@1fe01400 {
> > +                     compatible =3D "loongson,liointc-2.0";
> > +                     reg =3D <0x0 0x1fe01400 0x0 0x40>,
> > +                           <0x0 0x1fe01040 0x0 0x8>,
> > +                           <0x0 0x1fe01140 0x0 0x8>;
> > +                     reg-names =3D "main", "isr0", "isr1";
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <2>;
> > +                     interrupt-parent =3D <&cpuintc>;
> > +                     interrupts =3D <2>;
> > +                     interrupt-names =3D "int0";
> > +                     loongson,parent_int_map =3D <0xffffffff>, /* int0=
 */
> > +                                               <0x00000000>, /* int1 *=
/
> > +                                               <0x00000000>, /* int2 *=
/
> > +                                               <0x00000000>; /* int3 *=
/
> > +             };
> > +
> > +             liointc1: interrupt-controller@1fe01440 {
> > +                     compatible =3D "loongson,liointc-2.0";
> > +                     reg =3D <0x0 0x1fe01440 0x0 0x40>,
> > +                           <0x0 0x1fe01048 0x0 0x8>,
> > +                           <0x0 0x1fe01148 0x0 0x8>;
> > +                     reg-names =3D "main", "isr0", "isr1";
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <2>;
> > +                     interrupt-parent =3D <&cpuintc>;
> > +                     interrupts =3D <3>;
> > +                     interrupt-names =3D "int1";
> > +                     loongson,parent_int_map =3D <0x00000000>, /* int0=
 */
> > +                                               <0xffffffff>, /* int1 *=
/
> > +                                               <0x00000000>, /* int2 *=
/
> > +                                               <0x00000000>; /* int3 *=
/
> > +             };
> > +
> > +             global-utilities@1fe00000 {
> > +                     compatible =3D "loongson,ls2k-chipid";
> > +                     reg =3D <0x0 0x1fe00000 0x0 0x3ffc>;
> > +                     little-endian;
> > +             };
> > +
> > +             pctrl: pinctrl@1fe00420 {
> > +                     compatible =3D "loongson,ls2k-pinctrl";
> > +                     reg =3D <0x0 0x1fe00420 0x0 0x18>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             clk: clock-controller@1fe00480 {
> > +                     compatible =3D "loongson,ls2k-clk";
> > +                     reg =3D <0x0 0x1fe00480 0x0 0x58>;
> > +                     #clock-cells =3D <1>;
> > +                     clocks =3D <&ref_100m>;
> > +                     clock-names =3D "ref_100m";
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             gpio0: gpio@1fe00500 {
> > +                     compatible =3D "loongson,ls2k-gpio";
> > +                     reg =3D <0x0 0x1fe00500 0x0 0x38>;
> > +                     ngpios =3D <64>;
> > +                     #gpio-cells =3D <2>;
> > +                     gpio-controller;
> > +                     gpio-ranges =3D <&pctrl 0x0 0x0 15>,
> > +                                   <&pctrl 16 16 15>,
> > +                                   <&pctrl 32 32 10>,
> > +                                   <&pctrl 44 44 20>;
> > +                     interrupt-parent =3D <&liointc1>;
> > +                     interrupts =3D <28 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <29 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <30 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <30 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <26 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <>,
> > +                                  <>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <27 IRQ_TYPE_LEVEL_HIGH>;
> > +             };
> > +
> > +             uart0: serial@1fe20000 {
> > +                     compatible =3D "ns16550a";
> > +                     reg =3D <0x0 0x1fe20000 0x0 0x10>;
> > +                     clock-frequency =3D <125000000>;
> > +                     interrupt-parent =3D <&liointc0>;
> > +                     interrupts =3D <0x0 IRQ_TYPE_LEVEL_HIGH>;
> > +                     no-loopback-test;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             i2c2: i2c@1fe21000 {
> > +                     compatible =3D "loongson,ls2k-i2c";
> > +                     reg =3D <0x0 0x1fe21000 0x0 0x8>;
> > +                     interrupt-parent =3D <&liointc0>;
> > +                     interrupts =3D <22 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             i2c3: i2c@1fe21800 {
> > +                     compatible =3D "loongson,ls2k-i2c";
> > +                     reg =3D <0x0 0x1fe21800 0x0 0x8>;
> > +                     interrupt-parent =3D <&liointc0>;
> > +                     interrupts =3D <23 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             rtc0: rtc@1fe27800 {
> > +                     compatible =3D "loongson,ls2k1000-rtc";
> > +                     reg =3D <0x0 0x1fe27800 0x0 0x100>;
> > +                     interrupt-parent =3D <&liointc1>;
> > +                     interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             pcie@1a000000 {
> > +                     compatible =3D "loongson,ls2k-pci";
> > +                     device_type =3D "pci";
> > +                     #size-cells =3D <2>;
> > +                     #address-cells =3D <3>;
> > +
> > +                     reg =3D <0x0 0x1a000000 0x0 0x02000000>,
> > +                           <0xfe 0x0 0x0 0x20000000>;
> > +
> > +                     ranges =3D <0x1000000 0x0 0x8000 0x0 0x18008000 0=
x0 0x8000>,
> > +                              <0x2000000 0x0 0x60000000 0x0 0x60000000=
 0x0 0x20000000>; /* mem */
> > +
> > +                     gmac0: ethernet@3,0 {
> > +                             reg =3D <0x1800 0x0 0x0 0x0 0x0>;
> > +                             interrupt-parent =3D <&liointc0>;
> > +                             interrupts =3D <12 IRQ_TYPE_LEVEL_HIGH>,
> > +                                          <13 IRQ_TYPE_LEVEL_HIGH>;
> > +                             interrupt-names =3D "macirq", "eth_lpi";
> > +                             status =3D "disabled";
> > +                     };
> > +
> > +                     gmac1: ethernet@3,1 {
> > +                             reg =3D <0x1900 0x0 0x0 0x0 0x0>;
> > +                             interrupt-parent =3D <&liointc0>;
> > +                             interrupts =3D <14 IRQ_TYPE_LEVEL_HIGH>,
> > +                                          <15 IRQ_TYPE_LEVEL_HIGH>;
> > +                             interrupt-names =3D "macirq", "eth_lpi";
> > +                             status =3D "disabled";
> > +                     };
> > +
> > +                     ehci0: usb@4,1 {
> > +                             reg =3D <0x2100 0x0 0x0 0x0 0x0>;
> > +                             interrupt-parent =3D <&liointc1>;
> > +                             interrupts =3D <18 IRQ_TYPE_LEVEL_HIGH>;
> > +                             status =3D "disabled";
>
>
> All these PCI devices are part of SoC? The SoC?

Yes, these PCI devices are SoC on-chip integrated.
They are connected to the IO interconnect module via a multi-stage
interconnect bus.

Thanks.
Binbin

>
> Best regards,
> Krzysztof
>
