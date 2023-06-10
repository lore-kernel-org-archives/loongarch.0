Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793C408F8
	for <loongarch@lists.linux.dev>; Sat, 10 Jun 2023 05:35:12 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-bc43a73ab22so394623276.0
        for <loongarch@lists.linux.dev>; Fri, 09 Jun 2023 22:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686375311; x=1688967311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66j/h+9cZEjKb4UdwLgMXHl/kBywtFkqb8wIoqWmDMo=;
        b=Fgz9LE+WgSayy0gqznU4nHufTkzzOdkWA77tPaKYuOOBIE9nSZwtWlWTcLvi3I83Nm
         yCIfnuvzBhkEvNL0TO3VEtAZZ8fhuE+QVZkNV13GWT8P7/Q1lOA+c2S9TbrH05K9BLbI
         aJNSicKHM0yT4TIW2AMc4rUuuEp82Gxhf0pYn3KJMsnBRl52zleKRI5AFi9n1w1ntddC
         qtpHb7ZgfWhXx0Kg5s8hU2ZU5sbR6lgSUbYyXqMocfve5ZNbM3OxXfSG8ENvGfy9YzF+
         t4rZndmqRZNdYPwZlPGCiN63QGEx3E7n8/XVuMKO2N8A7vT/bLDCQny0///xi9fV/HD0
         4WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686375311; x=1688967311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66j/h+9cZEjKb4UdwLgMXHl/kBywtFkqb8wIoqWmDMo=;
        b=FW8AsW5msSgONUrxiPX40CdlBo4qzfEtRrNY9EpG2ajtfiFOsBJry1C0gF+aMF9Hud
         /1xcQl2qVkYfhHZasJZ6Roarlsc7RftPCxr/nhjEa9pUDCzvLFvP6iy/50OjpOkkBj9U
         lFQ507MVEOq/q/vr+B9wLsL3QqB3diTC2szP7F/A1RVgMyBNpfWEFIlzlEY17xQGrzEW
         KQmbAKlNvEF04+s7owISUbJB+Qpw/LLPsWYibm5VtQHCdB2HqdEgRZ0pMtoXUtCmhvb0
         UuqsJB8C44l9vNJbT6qWAA8ijWb12SkWHmIzwBawqtLxZv3/Zi8xMov4enIAzUcgIhqa
         TpkQ==
X-Gm-Message-State: AC+VfDy/Z6VD9l4mIQoAfgI8ZdaEyKPBcpoM6JpxSfxiNDq2/mkFWgYb
	bdQVqEu7jYh+3bE5hrFhYsb6R2Kux1u7RUrBKcA=
X-Google-Smtp-Source: ACHHUZ44wzkF29g4xzNfFH994CgHcQled1GvWddTD2bcNqr/f4iQNWBbImwZgeL8vGFigKA1//NILymWMxvSlQDXSiY=
X-Received: by 2002:a25:54f:0:b0:bac:46f2:8d0f with SMTP id
 76-20020a25054f000000b00bac46f28d0fmr6290839ybf.3.1686375311574; Fri, 09 Jun
 2023 22:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686192243.git.zhoubinbin@loongson.cn> <bb2d5985a3d9fd8e7ccbe2794842d93a8978d8a6.1686192243.git.zhoubinbin@loongson.cn>
 <68bb3816-d707-3a21-59a2-8785dce7210a@linaro.org>
In-Reply-To: <68bb3816-d707-3a21-59a2-8785dce7210a@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 10 Jun 2023 13:35:00 +0800
Message-ID: <CAMpQs4JF-HtHpb_3YJBUNo2x6_E=S-gf1p9kJ7vp01S62PYSxw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: dmaengine: Add Loongson LS2X
 APB DMA controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Yingkun Meng <mengyingkun@loongson.cn>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 12:49=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/06/2023 04:55, Binbin Zhou wrote:
> > Add Loongson LS2X APB DMA controller binding with DT schema
> > format using json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
>
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: loongson,ls2k1000-apbdma
> > +      - items:
> > +          - const: loongson,ls2k0500-apbdma
> > +          - const: loongson,ls2k1000-apbdma
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  "#dma-cells":
> > +    const: 1
> > +
> > +  dma-channels:
> > +    const: 1
>
> If it is const, why do you need it?
>
Hi Krzysztof:

IMO, although it is a single-channel DMAC, the "dma-channels" are
still needed for a more comprehensive description of the hardware.

Thanks.
Binbin

> Best regards,
> Krzysztof
>
