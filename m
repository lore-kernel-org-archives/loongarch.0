Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3606E1F5E4
	for <loongarch@lists.linux.dev>; Wed, 20 Dec 2023 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ED0cVuIZ"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5e86fc3f1e2so4784817b3.0
        for <loongarch@lists.linux.dev>; Wed, 20 Dec 2023 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703065557; x=1703670357; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBKfLMfti1BppNwpdSJrkZ2wpM8VspvRDQTgGYxY7Pk=;
        b=ED0cVuIZ3NHSe4kvoeQt742RuvGeDr/bmOBkDZUb3aef1QHIiWAcvdH0YFunaKDdQx
         iMNc2HZaWqwsFOtonOrHZBtxd9kfQ5ZCDpQqN05kt4MHgSG1lTNZxpkXL4OwVRngTkNn
         ibml9JeGm63YiAwQ+7tp1CtXHNbDWSf87eRGC3FqXVhofZscE79a05jENKlNic3kTUGD
         Q9BOoX9Zd6wYPH8IRR/SwU1Qw+qUgs174WO9xT/MBYjtRC1OiZQN9IRC5OtxulxfDitR
         61Z2FoThIqpRkCV9rH4eSHxFV7x/GGq2bgrjhvJdWwkFVL9FSVbh7JikjxysrGdyPiK6
         gE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703065557; x=1703670357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBKfLMfti1BppNwpdSJrkZ2wpM8VspvRDQTgGYxY7Pk=;
        b=jHjf8OHAxeIigEy1AUnpmz09vazS6cC0cIJ1ErhspZuT9Z/g3eJyLVjej4jWpJbEEv
         WCgaiZ2LUqVpAblzD0nxF4PLGoZ43OJBJtZhje/hsDOcCTAkNYaID6slXAmTzZpKFdmj
         uJkdH39+sMMfM1/KTKgei0G/R2llx+3rCesdlL6AyDvD5OoKxPHvqPtdEl3PYL9M7bNw
         tEQ+pZtrz9CtbALIkPov/OdzdiAqKE4KQ8spEJT+H+SbgCs3X71fyVrztr3/i0kfW1b9
         GRwZWkcDGzaE0F+Vm8fLVIDKijQyWCTac4NUQWW+tDOKhmGDiqWSNAiIp+eDH7PsvIae
         XIKQ==
X-Gm-Message-State: AOJu0YxtajmP07e6Zb8TYHXS/ME3EMxCbx7AX91Tr749JQexvVYc/VPK
	Sju52jgtOehEjCEI7/YNS0X+ymimPx00pti/oS519T504akiKg==
X-Google-Smtp-Source: AGHT+IGPz5rFjpgurD3JR8p7T4WrkJ/GB/KXKssDUEo+kG6oEEyPj/SdK9W2icqQUuq3lcKIpFFnE/fM9ZOKjfCSKCM=
X-Received: by 2002:a05:6902:98e:b0:dbd:4caa:ef09 with SMTP id
 bv14-20020a056902098e00b00dbd4caaef09mr2497067ybb.9.1703065557144; Wed, 20
 Dec 2023 01:45:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1702862778.git.zhoubinbin@loongson.cn> <303e56cb6e5f82623babe18b095069b330cd37da.1702862778.git.zhoubinbin@loongson.cn>
 <20231219-old-outnumber-22ae5dd35a5a@spud>
In-Reply-To: <20231219-old-outnumber-22ae5dd35a5a@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 20 Dec 2023 15:45:44 +0600
Message-ID: <CAMpQs4L0_8OQA9myM7jAq=uGuTvzbpqVWA1+CJ4Ruhp1DnAMKg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] LoongArch: dts: DeviceTree for Loongson-2K0500
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor:

On Tue, Dec 19, 2023 at 10:05=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, Dec 18, 2023 at 09:52:58AM +0800, Binbin Zhou wrote:
> > diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loonga=
rch/boot/dts/loongson-2k0500.dtsi
> > new file mode 100644
> > index 000000000000..1dcb6a20fc6c
> > --- /dev/null
> > +++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> > @@ -0,0 +1,274 @@
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
>
> You have only one CPU, this should not be needed.

OK!
>
> > +
> > +             cpu0: cpu@0 {
> > +                     compatible =3D "loongson,la264";
> > +                     device_type =3D "cpu";
> > +                     reg =3D <0x0>;
> > +                     clocks =3D <&cpu_clk>;
>
> Is this actually a complete description of the cpu? Are there i/d caches
> etc?

The cpu i/d caches are present, but the architecture gets the values
through a particular instruction (`cpucfg`). So I didn't describe it
here.

Thanks.
Binbin
>
> Cheers,
> Conor.
