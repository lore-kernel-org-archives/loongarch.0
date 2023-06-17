Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7282E0EA
	for <loongarch@lists.linux.dev>; Sat, 17 Jun 2023 06:59:21 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5701eaf0d04so17709727b3.2
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686985160; x=1689577160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uckLMjvzIaZTWhXCpigTz423wFbz8o6FswSoizd2WBk=;
        b=eisGvaZUi3gAoHoa4vj7Ys0ura9VncuZXTFZ1MVIeLxZoZ9CMQCtOftO7ctNRAeMti
         udNCWOgCQAC+MbZYtIAFgh+nyackO17gZqAwXaG5EUvZa1lt3Ym+O7C0om/yT2ZFlIWW
         SKtJbYhMQbutdWEXTeiQ4f1HM27bjj/WvMWjJ6Q6UiNm67UGGhyAI6mFBuwNnffxzw94
         VMcMFoNoFU/Ge3Zs957l3le7odUqxrhZrs5myqppbyf+cU8JEzAd1wE8x98tpi1tJ8Qc
         d7plYrRzgPHgxzKSel3sir/9FQ2lTIAgWfnByKRFfyH4dzZjYlcrJx5kAv6ADuEJMZi9
         k4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686985160; x=1689577160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uckLMjvzIaZTWhXCpigTz423wFbz8o6FswSoizd2WBk=;
        b=IorY7WPsb3oN7Wm0K9AWcVNHPGqRwz2MDFZmDJth7cdVMwx3tQcfi6CO+JkDwitm7U
         bV78zYGSpenthgaLbcXA3F82n18LBt+//kzaGMin20f6PMtqi1I7E3dqTWqoFwIp2WWq
         EoHRoKGixnOq6Dbpj3Twm6AdOxLvTDABaln9qPixtJPsZU29N0AxVG6WjKtaagNwjK4X
         SEmVN/Ud3Mk6RS/xHxSim2N/X3KxsbehJChbVitr0L1Vyin1GGqmPsqT0RX/Sgje5ZZh
         qcovWigd6BS6pOvq2ZCcNNAowuWN8gtslwiA4xisN32jEMrTnSySBrC5fPjJ9yJ1FPo0
         t8ew==
X-Gm-Message-State: AC+VfDwt5IHNMSJv+gIiATPBvyKfqCNalFEkr/WTWTkC3ACy25YFDJJL
	3QrEgaNx+LQUk+nfRxNdt2RB4fHmjTJktRFO6YY=
X-Google-Smtp-Source: ACHHUZ5SwcgbC3RQPe/SWrhKQcJ7vCFyxqVvJuq6FtyoL6Z5FZxu2wZ9owz33UnREb4AAtOTn368iEvkRkQdKFKV+Oo=
X-Received: by 2002:a81:7206:0:b0:570:209a:a4fe with SMTP id
 n6-20020a817206000000b00570209aa4femr3997833ywc.32.1686985160487; Fri, 16 Jun
 2023 23:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686882123.git.zhoubinbin@loongson.cn> <99bdbfc66604b4700e3e22e28c3d27ef7c9c9af7.1686882123.git.zhoubinbin@loongson.cn>
 <493a28b2-8ad5-2e9a-462b-bdc7d585b722@linaro.org>
In-Reply-To: <493a28b2-8ad5-2e9a-462b-bdc7d585b722@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 17 Jun 2023 14:59:08 +0800
Message-ID: <CAMpQs4JJWryScd_nEi+LpKGPXup=RZXw=rBhb7HQkxJuBXgTBw@mail.gmail.com>
Subject: Re: [PATCH 5/6] LoongArch: DeviceTree for Loongson-2K1000
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

On Fri, Jun 16, 2023 at 5:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/06/2023 08:11, Binbin Zhou wrote:
> > Add DeviceTree file for Loongson-2K1000 processor, which integrates two
> > 64-bit dual emission superscalar LA264 processor cores.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  arch/loongarch/boot/dts/Makefile            |   3 +-
> >  arch/loongarch/boot/dts/loongson_2k1000.dts | 565 ++++++++++++++++++++
> >  2 files changed, 567 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/loongarch/boot/dts/loongson_2k1000.dts
> >
> > diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts=
/Makefile
> > index 0e5ed373b1b4..c0464bb8e430 100644
> > --- a/arch/loongarch/boot/dts/Makefile
> > +++ b/arch/loongarch/boot/dts/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> > -dtb-$(CONFIG_MACH_LOONGSON64)        =3D loongson_2k0500.dtb
> > +dtb-$(CONFIG_MACH_LOONGSON64)        =3D loongson_2k0500.dtb \
> > +                               loongson_2k1000.dtb
> >
> >  obj-$(CONFIG_BUILTIN_DTB)    +=3D $(addsuffix .dtb.o, $(CONFIG_BUILTIN=
_DTB_NAME))
> > diff --git a/arch/loongarch/boot/dts/loongson_2k1000.dts b/arch/loongar=
ch/boot/dts/loongson_2k1000.dts
> > new file mode 100644
> > index 000000000000..9fd9d400d97f
> > --- /dev/null
> > +++ b/arch/loongarch/boot/dts/loongson_2k1000.dts
> > @@ -0,0 +1,565 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/clock/loongson,ls2k-clk.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +     model =3D "LS2K1000 Reference Board";
> > +     compatible =3D "loongson,ls2k1000";
> > +
>
> All the same comments apply here. Don't mix SoC (DTSI) with boards.

Hi Krzysztof:

I'm very sorry, this is the first time I've written a full DTS.
Do you mean that I need to put the descriptions of these devices into
DTSI and the descriptions of the boards into DTS?

>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

Ok, I will do these checks before the next version.

Thanks.
Binbin

>
> Best regards,
> Krzysztof
>
