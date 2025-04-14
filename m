Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B933F28EB
	for <loongarch@lists.linux.dev>; Mon, 14 Apr 2025 01:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744594307; cv=none; b=QuH7j4oXnow+7xfSr7rku23HghZXm6YNXnS7hy9eXWtF5/10o1+zdmkEnK3B4KLB9zMxbijgW7AC23l/QKKCSw2e6J5+pSHr2dL2h2m7urt5soW9ecFkeFfuLHM2855FL/oY2pZD579l7waAnlQOqq1Ywz0lReSJRfpZldGTn44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744594307; c=relaxed/simple;
	bh=9xECK2ehynHxAbLBfaqh/9OBldVcrjO20TqR4gRuQUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e++twJaw0zVN9Y6/tD6QdXJzEFSz+Oru1KIlAK/O98db9/OJM6ZIW+9JDEQPtEF9bMHUn+oAsQXChZdpFnh7ea6bgKIQt4Cmj/HFgL0bTIv4o3wpoZ5AAVOKNWO3b5tib0z+4EiQSowpU4ob+8Yd2qS49hYhwbFIyR4hpVN/5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8wVXE1I; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8wVXE1I"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so6703138a12.2
        for <loongarch@lists.linux.dev>; Sun, 13 Apr 2025 18:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744594303; x=1745199103; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBcdawRnzTZ8ZY4dlNm0WG8aDh/pMvgAkt6S8wOu0R0=;
        b=T8wVXE1IcoZxtkLKulomn/6ricsrc8ybrVr55p1XrlMFOzkwPQN2Kzd6bbaKX1SbyI
         06v8nETDSCNBjhcbfA01dlFmwbOFifH1MO06lirM19Wt+mAoey/LUxtc4Zedp9jKUiZb
         yNr8T1cYPmrMPUMSRgLIWETBR62niKQC0bj9jyP5gjUEvmAOO4xBocPOczVhLmuIqOwQ
         Upk3ETgrmIaD1pmQQPA1zdYEbxH3pg3fjAxxakSxXo0c5lYpRRSjIVeqxo8ssyx9Bv7r
         4zhtV4XrGihDZBdjP2RJ7QPmLEcZcXNfCv+NYbKxKYazDSZk/f2dPmLkxjK/R5JN92o2
         jqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744594303; x=1745199103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBcdawRnzTZ8ZY4dlNm0WG8aDh/pMvgAkt6S8wOu0R0=;
        b=fe6yCh5Hk9F2UPpr4PixzIMJlRpJDWlCl05pQXKFk2C+IcxK2TRr736r7JVwl40Oj6
         x88ls8OKZPNPRzCb9HTHro39OPEcVOoc5FF/pbr7C6S1hr20kQXi0wzKm5mW/TMfJGOm
         cmL9kFktZ/+FpcHy3HqRYdu9yDcoMuTg1HBBz1Jf16ODo27q3tYDrh9ZQJATP47XRtKA
         A8hZfaMB5dTY8JCkuqaY6U51O/DWYbqMPot3i03eThP/SStJEnWaLYHdAI2SninXqxqM
         LvlD7TU0ETnyaXVonSGW1keErotmTNDexgiGvnpEEJcC7IZlkTmMH9TO9/LGYZA8kkaP
         zqdw==
X-Forwarded-Encrypted: i=1; AJvYcCUqq7e0JTj59zH4ga4vPh8P+8jC1egrK4TpKtnegdcKZoJiVz5gy/Rp1shR4f3XKbBfCf4dfbSbVAE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyty00DcWgC4uVk1cchhxGFuywqd3R6XbImJrj4D2GJO11fSs5r
	EC0+uacnUDfED8VRroaZselcEDMPlv70RaqBEe4Ok5jZVE6xtzE32zmBdL0BkjbVYL9rON6xdP9
	nwZb5XtdA+prxGaCNrdhVHQ5nwCtlnL4dtaM=
X-Gm-Gg: ASbGncsZKzSSLFeIgEA/r4DaZdiNqtVndozVUGfXXmRctYOk5hka/AE/ERGpX7Wck5b
	hxrBoD4jz1t/sdHuccRc17PDYVubuV+6JD7UAA1i86f/Q97hiZtrmolmkkMSx7iJZ8vMIYHNVWq
	lprpqPi/56Oer46AqsuUXo
X-Google-Smtp-Source: AGHT+IEWHVetZm0u5D2BM27qSiXz/lDX/oFTQJDOz5qkv2RHDUgoCD5ISwlVKLKNeGcIQw/0Z5POs6FbMsmeOjtQQVI=
X-Received: by 2002:a05:6402:254a:b0:5ec:c990:b578 with SMTP id
 4fb4d7f45d1cf-5f36f67797amr8516043a12.19.1744594302836; Sun, 13 Apr 2025
 18:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744273956.git.zhoubinbin@loongson.cn> <cefcd16d303936247b94bc13047c8a1861bb8330.1744273956.git.zhoubinbin@loongson.cn>
 <20250411170535.GA3391061-robh@kernel.org>
In-Reply-To: <20250411170535.GA3391061-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 14 Apr 2025 09:31:30 +0800
X-Gm-Features: ATxdqUGXQwM-0SBsWpuCh-Gl2xc_HzNH9Z4F3bB7Sn1XybEc-5t-g0XOW9_YDmM
Message-ID: <CAMpQs4L=aNY9okXq+m=x+WdDBpoLa8v1FQ39ZSY14Qb9joH7YA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] dt-bindings: mmc: loongson,ls2k-mmc: Add
 compatible for Loongson-2K2000
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your reply.


On Sat, Apr 12, 2025 at 1:05=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Apr 10, 2025 at 04:40:37PM +0800, Binbin Zhou wrote:
> > Add the devicetree compatible for Loongson-2K2000 EMMC/SD/SDIO controll=
er.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/mmc/loongson,ls2k-mmc.yaml       | 47 ++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.ya=
ml b/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
> > index f3e94f5f3a35..24d217a9bbe6 100644
> > --- a/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/loongson,ls2k-mmc.yaml
> > @@ -9,6 +9,9 @@ title: The SD/SDIO/eMMC host controller for Loongson-2K=
 family SoCs
> >  description:
> >    The MMC host controller on the Loongson-2K0500/2K1000 (using an exte=
rnally
> >    shared apbdma controller) provides the SD and SDIO device interfaces=
.
> > +  The two MMC host controllers on the Loongson-2K2000 are similar,
> > +  except that they use internal exclusive DMA. one controller provides
> > +  the eMMC interface and the other provides the SD/SDIO interface.
> >
> >  maintainers:
> >    - Binbin Zhou <zhoubinbin@loongson.cn>
> > @@ -21,8 +24,10 @@ properties:
> >      enum:
> >        - loongson,ls2k0500-mmc
> >        - loongson,ls2k1000-mmc
> > +      - loongson,ls2k2000-mmc
> >
> >    reg:
> > +    minItems: 1
> >      maxItems: 2
>
> Missed this in the first patch, but you need to define what each entry
> is.
Are you thinking that =E2=80=9CminItems=E2=80=9D should be added in patch-1=
?
I'm not sure if I'm right, but for patch-1 (Loongson-2K1000), his reg
count must be 2, so it doesn't need the =E2=80=9C minItems: 1=E2=80=9D limi=
tation,
whereas Loongson-2K2000 needs this limitation, and so it was put in
this patch.

Of course, for the reg description, it is true that I missed it, and I
will add it in patch-1.

>
> >
> >    interrupts:
> > @@ -42,11 +47,31 @@ required:
> >    - reg
> >    - interrupts
> >    - clocks
> > -  - dmas
> > -  - dma-names
> >
> >  unevaluatedProperties: false
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls2k0500-mmc
> > +          - loongson,ls2k1000-mmc
> > +
> > +then:
> > +  properties:
> > +    reg:
> > +      minItems: 2
> > +
> > +  required:
> > +    - dmas
> > +    - dma-names
> > +
> > +else:
> > +  properties:
> > +    reg:
> > +      maxItems: 1
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > @@ -65,3 +90,21 @@ examples:
> >          bus-width =3D <4>;
> >          cd-gpios =3D <&gpio0 22 GPIO_ACTIVE_LOW>;
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/loongson,ls2k-clk.h>
> > +
> > +    mmc@79990000 {
> > +        compatible =3D "loongson,ls2k2000-mmc";
> > +        reg =3D <0x79990000 0x1000>;
> > +        interrupt-parent =3D <&pic>;
> > +        interrupts =3D <51 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&clk LOONGSON2_EMMC_CLK>;
> > +        bus-width =3D <8>;
> > +        non-removable;
> > +        cap-mmc-highspeed;
> > +        mmc-hs200-1_8v;
> > +        no-sd;
> > +        no-sdio;
> > +    };
> > --
> > 2.47.1
> >

--
Thanks.
Binbin
