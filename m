Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E0638
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 03:16:01 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-589d7755213so51826247b3.2
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 20:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692242160; x=1692846960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lOES28x1vlU2LaHZjcK9BgxDCrzNHUrpAgbOp/z5G4=;
        b=AfTgrTN3o2bP+4yjfvTNeGc5GlYk+imYtU//mfdqolEe1dZJe9pHLEd6l+fas/d+/G
         M3j6cZccCNTcy2zLKQqTpB8l4sio9hD6c4kbNoz3ZclommrTzfrHgjeMM8jW9kpvumaC
         1fr6wdTMBagQWfZ3RCkXK9gTpHGrDJNRk/clRCF/dXWhP7yFxxHcjK/WxQaYyuUgfWni
         irDPtgba9QwOBTs5IFknnjlfIDWlr6Vwv2nq5wzG4/Fpc/kiirXD0L/XsyFzCpsOE2+d
         Qf3oq8ApmdiFMAGV/tWk/lCY0RoNdAboIYuZyJjh86l2kJByz+HErg8UqGuzmSLLZqzu
         HDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692242160; x=1692846960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lOES28x1vlU2LaHZjcK9BgxDCrzNHUrpAgbOp/z5G4=;
        b=fCm2xqyZLcvimfizC065HbDQd7Xga8VD09QFamIwZm6Fooqa8Yk9XUugaFkbBWC1Sk
         oOBnamfRKi06TlqFOD2u8lNLy43hevKPDq4eP/SKcE97245XfeGTgxdA0o0kBTNmJQ10
         1KpI0oV2oisJJYK1Mrnu8JbwPcbk7IserR+/5vLju3vNAlEOVbuXG0SWuOPEgihkVnKJ
         6hiUPs6YIM0lqt0FaDbHEtkAg15UftRCIIdfOuTzFU5CimM14weJ2ID898z6toLHHahL
         WRTmu81lCPvhTplhbqzoHHKTSQPgiTNqKLqvlouCM8ipkL+6TxoMyqYfZdivPOxz1dGT
         qsSw==
X-Gm-Message-State: AOJu0YxvtCOUbWsqrZY8ewZKfOymb3gdzkWRrZ3j/2YKhcGCpLD2lhD5
	Oh9LsueQKTuoVmkpIHO/psWvU+KZx6gTgr3Fjy0=
X-Google-Smtp-Source: AGHT+IG97rKMlejstahverF3sLciAyT8NrV9SnFfJRx78OgxULFe3DNvaUHLr9FOp44L3XzWON0JsYb6uEc2pzfyd58=
X-Received: by 2002:a0d:eb42:0:b0:565:c21d:8ec6 with SMTP id
 u63-20020a0deb42000000b00565c21d8ec6mr3793635ywe.6.1692242160492; Wed, 16 Aug
 2023 20:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692088166.git.zhoubinbin@loongson.cn> <f869b30d119a56abaa67ac78cd981fc0c2f0d28b.1692088166.git.zhoubinbin@loongson.cn>
 <20230815-renounce-reminder-a6728ebefb5f@spud>
In-Reply-To: <20230815-renounce-reminder-a6728ebefb5f@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 17 Aug 2023 11:15:48 +0800
Message-ID: <CAMpQs4+dau2kZ5AJLyzO532x-8A4JmmLBoBVu29SvMwmASUZgQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] LoongArch: dts: DeviceTree for Loongson-2K0500
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor:

Thanks for your reply.

On Tue, Aug 15, 2023 at 10:09=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Aug 15, 2023 at 04:51:10PM +0800, Binbin Zhou wrote:
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
> > +     };
> > +
> > +     cpu_clk: cpu-clk {
> > +             #clock-cells =3D <0>;
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <500000000>;
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
>
> I've not read this whole patch, but from a glance - why is the cpu node
> in the board file, not the soc one?

I'm very sorry, that was my mistake. cpu node should really be part of
soc, I'll put it in dtsi.

Thanks.
Binbin
