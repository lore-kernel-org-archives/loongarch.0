Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100B803
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 05:36:47 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-589bcdaa8a4so65381637b3.3
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 22:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692250606; x=1692855406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZm38rFdSTVaVDjojtCWivKLT423Z+K1o31be/2vjmA=;
        b=qDKI09satI1rA28enZ+doozz+4Irl5weKIvepRmQAHSJeyK146AF3/FjJjfJZ8DDMc
         boYbdNobs/hPnrHDoB0KEIRhjr5nG6/jnepyUMzBUIpGBPce2tMqFUEVKqhM2IA5cSxU
         LUo7O4/YgSFXd4JvCk0gJXUOkRSG2TKMizLyJ2x0cP1DBJdoH5mDSQl8O+jucYjm3+QV
         1LQS8QmAh2q86sh1jB0N3RZdsucrL8DYrsg6gaA2kT/2SrJkF7CZTH+8OSyeCojnDp28
         Om9Tmzx7NpWqfYX/dhJ4/g98a+8oOhLq4qSSwgaC+lFLilcYv9Z0WZGGeJ4gvlcYck2j
         5JrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692250606; x=1692855406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZm38rFdSTVaVDjojtCWivKLT423Z+K1o31be/2vjmA=;
        b=ZQQQOfX36Sa1xRVx8qkzVLPxY9Qm532Dn5WFj/8ZmqdH4bqf0a2FvqoTXEyb6TWx9n
         CRvQUZJKRkLKbHTk5VjDTC8ca6OW2ul8i0oQfZ8hicjQ/kqjpu2oUHUC/a3Hw5Ip//AI
         UIaS6DA5aJpuwPdLG0a7Pubu92PQe8nfc4xcVALEh6IIHzc8qhl6cbXZa7sh7ioo3vP1
         lAlC8/wk2gDxBoQ+C+q0JutWmrOYyBwNr0YORcjBElXe6F6JVUN2bn9JHQ0RKhnMS8Id
         YlBYlz7whBZIjYwuTH73CgnBhMZ32Sr6gPdOo6fX6R7W5zWgEEUArPthU8XQ/l+QGVO4
         G8dA==
X-Gm-Message-State: AOJu0Yw17xPmaTlijqvjjjuaSfA8ljrGhw/WW1pTEoTbAU+cUdtNYLtD
	jb1fN0tcMImoJTpr7fwti0KVmLG4yauNLqqXxnw=
X-Google-Smtp-Source: AGHT+IFjxzbuhY78wgmLXChiKfvF3OWAsRqvoFuIk90Mds5NEInG2lCIQFID8/nr/XZarhuFtP5FLEHu2eQuj3aMhck=
X-Received: by 2002:a81:a548:0:b0:57a:9384:4c13 with SMTP id
 v8-20020a81a548000000b0057a93844c13mr3676991ywg.49.1692250605973; Wed, 16 Aug
 2023 22:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692088166.git.zhoubinbin@loongson.cn> <f869b30d119a56abaa67ac78cd981fc0c2f0d28b.1692088166.git.zhoubinbin@loongson.cn>
 <1fdde0f1-998c-a141-6e43-9c13c0b681a8@linaro.org>
In-Reply-To: <1fdde0f1-998c-a141-6e43-9c13c0b681a8@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 17 Aug 2023 13:36:33 +0800
Message-ID: <CAMpQs4LfRPyzqN_0wjQ=jvn132WkvDng=BPKV5mev1dG+7eKFw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] LoongArch: dts: DeviceTree for Loongson-2K0500
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

On Tue, Aug 15, 2023 at 10:48=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/08/2023 10:51, Binbin Zhou wrote:
> > Add DeviceTree file for Loongson-2K0500 processor, which integrates one
> > 64-bit dual emission superscalar LA264 processor core.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  arch/loongarch/boot/dts/Makefile              |   2 +
> >  .../boot/dts/loongson-2k0500-ref.dts          | 115 +++++++++
> >  arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 244 ++++++++++++++++++
> >  3 files changed, 361 insertions(+)
> >  create mode 100644 arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> >  create mode 100644 arch/loongarch/boot/dts/loongson-2k0500.dtsi
> >
> > diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts=
/Makefile
> > index 1e24cdb5180a..aa0b21d73d4e 100644
> > --- a/arch/loongarch/boot/dts/Makefile
> > +++ b/arch/loongarch/boot/dts/Makefile
> > @@ -1,3 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> > +dtb-$(CONFIG_MACH_LOONGSON64)        =3D loongson-2k0500-ref.dtb
> > +
> >  obj-$(CONFIG_BUILTIN_DTB)    +=3D $(addsuffix .dtb.o, $(CONFIG_BUILTIN=
_DTB_NAME))
> > diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loo=
ngarch/boot/dts/loongson-2k0500-ref.dts
> > new file mode 100644
> > index 000000000000..c89662e5a296
> > --- /dev/null
> > +++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> > @@ -0,0 +1,115 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2023 Loongson Technology Corporation Limited
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "loongson-2k0500.dtsi"
> > +
> > +/ {
> > +     compatible =3D "loongson,ls2k0500-ref", "loongson,ls2k0500";
> > +     model =3D "Loongson-2K0500 Reference Board";
> > +
> > +     aliases {
> > +             ethernet0 =3D &gmac0;
> > +             ethernet1 =3D &gmac1;
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +             bootargs =3D "earlycon";
>
> No earlycon in mainline. It's just development, not for products.

I got it, I'll recheck the other dts and delete them.
>
> > +     };
> > +
> > +     cpu_clk: cpu-clk {
> > +             #clock-cells =3D <0>;
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <500000000>;
>
> Conor already commented on this...
>
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
> > +                     };
> > +             };
> > +
> > +             cpu0: cpu@0 {
> > +                     compatible =3D "loongson,la264";
> > +                     device_type =3D "cpu";
> > +                     reg =3D <0x0>;
> > +                     clocks =3D <&cpu_clk>;
> > +             };
> > +     };
> > +
> > +     memory@200000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x0 0x200000 0x0 0xee00000>, /* 238 MB at 2 MB *=
/
> > +                   <0x0 0x90000000 0x0 0x60000000>;
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
> > +};
> > +
> > +&gmac0 {
> > +     status =3D "okay";
> > +
> > +     phy-mode =3D "rgmii";
> > +     bus_id =3D <0x0>;
> > +};
> > +
> > +&gmac1 {
> > +     status =3D "okay";
> > +
> > +     phy-mode =3D "rgmii";
> > +     bus_id =3D <0x1>;
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "okay";
> > +
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     eeprom@57{
> > +             compatible =3D "atmel,24c16";
> > +             reg =3D <0x57>;
> > +             pagesize =3D <16>;
> > +     };
> > +};
> > +
> > +&ehci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ohci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&sata {
> > +     status =3D "okay";
> > +};
> > +
> > +&uart0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&rtc0 {
> > +     status =3D "okay";
> > +};
> > diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loonga=
rch/boot/dts/loongson-2k0500.dtsi
> > new file mode 100644
> > index 000000000000..e6f6476ab558
> > --- /dev/null
> > +++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> > @@ -0,0 +1,244 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2023 Loongson Technology Corporation Limited
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
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
> > +                      <0x0 0x2000000  0x0 0x2000000  0x0 0x2000000>,
> > +                      <0x0 0x20000000 0x0 0x20000000 0x0 0x10000000>,
> > +                      <0x0 0x40000000 0x0 0x40000000 0x0 0x40000000>,
> > +                      <0xfe 0x0 0xfe 0x0 0x0 0x40000000>;
> > +
> > +             isa@16400000 {
> > +                     compatible =3D "isa";
> > +                     #size-cells =3D <1>;
> > +                     #address-cells =3D <2>;
> > +                     ranges =3D <1 0x0 0x0 0x16400000 0x4000>;
> > +             };
> > +
> > +             liointc0: interrupt-controller@1fe11400 {
> > +                     compatible =3D "loongson,liointc-2.0";
> > +                     reg =3D <0x0 0x1fe11400 0x0 0x40>,
> > +                           <0x0 0x1fe11040 0x0 0x8>;
> > +                     reg-names =3D "main", "isr0";
> > +
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <2>;
> > +                     interrupt-parent =3D <&cpuintc>;
> > +                     interrupts =3D <2>;
> > +                     interrupt-names =3D "int0";
> > +
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
> > +             liointc1: interrupt-controller@1fe11440 {
> > +                     compatible =3D "loongson,liointc-2.0";
> > +                     reg =3D <0x0 0x1fe11440 0x0 0x40>,
> > +                           <0x0 0x1fe11048 0x0 0x8>;
> > +                     reg-names =3D "main", "isr0";
> > +
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <2>;
> > +                     interrupt-parent =3D <&cpuintc>;
> > +                     interrupts =3D <4>;
> > +                     interrupt-names =3D "int2";
> > +
> > +                     loongson,parent_int_map =3D <0x00000000>, /* int0=
 */
> > +                                               <0x00000000>, /* int1 *=
/
> > +                                               <0xffffffff>, /* int2 *=
/
> > +                                               <0x00000000>; /* int3 *=
/
> > +             };
> > +
> > +             eiointc: interrupt-controller@1fe11600 {
> > +                     compatible =3D "loongson,ls2k0500-eiointc";
> > +                     reg =3D <0x0 0x1fe11600 0x0 0xea00>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <1>;
> > +                     interrupt-parent =3D <&cpuintc>;
> > +                     interrupts =3D <3>;
> > +             };
> > +
> > +             gmac0: ethernet@1f020000 {
> > +                     compatible =3D "snps,dwmac-3.70a";
> > +                     reg =3D <0x0 0x1f020000 0x0 0x10000>;
> > +                     interrupt-parent =3D <&liointc0>;
> > +                     interrupts =3D <12 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "macirq";
> > +                     status =3D "disable";
>
> That's not a valid status. Run some basic checks on your DTS before
> submitting it (dtbs_check W=3D1)

I actually checked them before committing (dtbs_check W=3D1), except for
the warning about liointc, this needs another patch to fix:

https://lore.kernel.org/all/20230815084713.1627520-1-zhoubinbin@loongson.cn=
/

Since mips Loongson-2k1000 is also needed for it, I'm submitting it separat=
ely.

Thanks.
Binbin
>
>
> Best regards,
> Krzysztof
>
