Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B320300
	for <loongarch@lists.linux.dev>; Wed, 20 Dec 2023 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrfJWi9s"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5cece20f006so46789377b3.3
        for <loongarch@lists.linux.dev>; Wed, 20 Dec 2023 01:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703063841; x=1703668641; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+R1fM9+vLFIoF/9tqH5AXlx2OHJNI3tZEKatxSdScR0=;
        b=ZrfJWi9s0m0Minh0TlPnZfz32wtKTRjU6OJp3tq0FjayUyjmMN2S4bf6kSFcdIfYB7
         g5YefV36npMy4SZhd94gJXoIad3Lt1We++FWJ9ugvKsvwmAXos3layqQLuETkzjHpZF1
         RgrqZZZ0HiF8XwQWafSdGmg8MrQsPOGIyGx/k2dILIs5nIGI3DXlm8GlgyOSwuACJ3bb
         CFkvKYCKsH8IDWlUaGkf8EmEHA5JbfzmC4JLcp2Zhl5TlYrW0g0Iavv+/wh4R6lI8llH
         epfHY4B5cuDrWIRoEML+hLxjMU9F63JvEUvtbN2LY3tVqiDRD3bcXHbtfLHioRYmOuZy
         aXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703063841; x=1703668641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R1fM9+vLFIoF/9tqH5AXlx2OHJNI3tZEKatxSdScR0=;
        b=FvYlfhYGLpQv21S7VOsfcYrv1Nt+P7gO1qOTmGZDFi7tzH91NnYsParMYFNwWudTL0
         xGSyPOjJOD+oJ9D5wk3srqMWenK45J5nf9vXf7pHNDsX/jOd4JYoVIHnkcVAqSL/mSpF
         LI3tLt4c/TsilM/nYAsZPgVQkk5PJs75CZKINCI+wJOFz/L5w02gFM//iwHYK6rbEY+y
         AAwTnA0sI2oYDS9HHcjRRUZypNOzwzlbjlbXgvystyj+xdpbnuo0yPPhaXYMM7bn+mHs
         qOjbqNk2FhZx/nJr7/wOOEqWZL14KK4Oz7UxfZpMLUJr4qtX4nI5eAp/36ukeIYI/OdA
         jTzA==
X-Gm-Message-State: AOJu0YxrXaE1OxusHv13U8qMJburVdcth68MKjFd9kuugQPVd+x3jZG6
	AUaKDzeOptCsAdiUR93cKLI+qFRuKcxF20tlY4k=
X-Google-Smtp-Source: AGHT+IH4fy+M5Mci0jOZFHXk6OQiimrMQ64TBv79ZLaHN2/FkeZEE50f3MA0k25m/HDAViPO6IvSPZDAL2UW8K4a8bg=
X-Received: by 2002:a25:a105:0:b0:dbd:990b:be32 with SMTP id
 z5-20020a25a105000000b00dbd990bbe32mr557075ybh.17.1703063840724; Wed, 20 Dec
 2023 01:17:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1702862778.git.zhoubinbin@loongson.cn> <303e56cb6e5f82623babe18b095069b330cd37da.1702862778.git.zhoubinbin@loongson.cn>
 <aa9cec3e-ee58-4d52-a8ec-d696e3ff70ca@linaro.org>
In-Reply-To: <aa9cec3e-ee58-4d52-a8ec-d696e3ff70ca@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 20 Dec 2023 15:17:09 +0600
Message-ID: <CAMpQs4+2kjNZMHu1+7MvDNFdCgY8bpF2kQTru-ZHSf8RceiP_A@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] LoongArch: dts: DeviceTree for Loongson-2K0500
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 9:37=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 18/12/2023 02:52, Binbin Zhou wrote:
> > Add DeviceTree file for Loongson-2K0500 processor, which integrates one
> > 64-bit dual emission superscalar LA264 processor core.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  arch/loongarch/boot/dts/Makefile              |   2 +
> >  .../boot/dts/loongson-2k0500-ref.dts          |  89 ++++++
> >  arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 274 ++++++++++++++++++
> >  3 files changed, 365 insertions(+)
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
> > index 000000000000..52483127a419
> > --- /dev/null
> > +++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> > @@ -0,0 +1,89 @@
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
> > +             bootargs =3D "console=3DttyS0,115200";
>
> You received here comments already:
> https://lore.kernel.org/all/3543cbf9-d259-8d0f-e78e-d8d5e3f501de@linaro.o=
rg/
>
> Don't waste our time to re-review the same mistakes over and over again.
>
>
Hi Krzysztof:

I am sorry for this, I misunderstood before that `earlycon` is not allowed.
BTW, is there a note about not using the `bootargs` attribute? I
didn't find it in the Documentation.

>
> ...
>
> > +
> > +             i2c@1ff4a800 {
> > +                     compatible =3D "loongson,ls2k-i2c";
> > +                     reg =3D <0x0 0x1ff4a800 0x0 0x0800>;
> > +                     interrupt-parent =3D <&eiointc>;
> > +                     interrupts =3D <19>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             pmc: power-management@1ff6c000 {
> > +                     compatible =3D "loongson,ls2k0500-pmc", "syscon";
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).

Emm...
Here is the compatible description from the latest kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml#n13

I think this compatible should be fine, also, I ensure that `make
dtbs_check W=3D1` is fine before committing.

Thanks.
Binbin
>
> Or you did not test your DTS on the hardware.
>
> > +                     reg =3D <0x0 0x1ff6c000 0x0 0x58>;
> > +                     interrupt-parent =3D <&eiointc>;
> > +                     interrupts =3D <56>;
> > +                     loongson,suspend-address =3D <0x0 0x1c000500>;
> > +
> > +                     syscon-reboot {
>
>
>
> Best regards,
> Krzysztof
>
