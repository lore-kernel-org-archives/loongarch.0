Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73EAA45
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 06:25:10 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-58d40c2debeso11690197b3.2
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 23:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692253509; x=1692858309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHlNaNiXCGjdkVNY7zKYgrzV6TCn/yaLYGyCQAJmbHc=;
        b=Mg9k44hSYXoG1IkiDNjgxk6ktFjqqHBaCXh+GMTlzf3gyLoKln4TaPiUucRUu3dP40
         icWZVJxYa2bVcBS+fv8P20FahrY0Kf27Wim5m1+VpnF4SOrMw6+a82WAJOU66vflrkGh
         t1MxGGms2twgsaiKcpsKXL+g+vkmzd62EBtDfY2Vl+MxKFVZ0fxDxmSY0ePyQpzkvqV8
         e6gPH7iBXPWaUL7K6yuOaLz+WQdmlTYi2m+YQZ/XaL6Um8CIF93EZHy0MWsOpzGCQCk1
         r72+MSsdgcPEmzv7IAh0CyEUCHbKTyAQyn6/ZzvUjXY5GISHW/xHXBZ5FNYTSQS9WXg6
         5hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692253509; x=1692858309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHlNaNiXCGjdkVNY7zKYgrzV6TCn/yaLYGyCQAJmbHc=;
        b=g3DxHGU1gVA+AiVska+ykGIzWAOdWnTIXs4up5lprewOqXH3TuYIMN5H7ckL3YjKHy
         MHNPfEliFGzHKfrdYhC8OxJVw2yjYKpkKZJu+BCypDXJudwUSFekYoS/CS/7NllZMbiO
         1TYmbAb9PwMcFkeDgMTV4UZTSodt6VCSIJvyD8k3IHjhxQaeji1g6t6Hk1faKjP/GJQH
         itm+uzGqI5/9Ov4WHFd1EkU7yDUyeQ20RFesKiji95aF1SR/b86A8nzwVK1Wph3t8SLw
         kSMtrEMz5wvmKNQTrgMd0AZK5FqCwzcAVTAhUgrUzd2JhxkpNX7d9LNRnuwvW1wqrmpg
         Emqg==
X-Gm-Message-State: AOJu0YziBQQlg9Ym7nqHdbeHylCHAG+qCpYrHyJCkll0O2UuULI/EsZw
	PTenop3cLtHOS2xxbw6b1GYfgYsKJPV8mOtH8GM=
X-Google-Smtp-Source: AGHT+IG7Yxx1Nla609UJbE/TOrU7OceknPjbG8TjdeXoM7G5cDVNGAYS62LYL4fA7fqpUs3c3rb570Ag+u62L045aJU=
X-Received: by 2002:a0d:ead7:0:b0:58c:4e9f:4ed4 with SMTP id
 t206-20020a0dead7000000b0058c4e9f4ed4mr4229596ywe.42.1692253509396; Wed, 16
 Aug 2023 23:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692088166.git.zhoubinbin@loongson.cn> <6d8d0d8d21e32e0577565158bc1c4960a92fb216.1692088166.git.zhoubinbin@loongson.cn>
 <df40afe9-2596-27db-bcbb-6d57f8fd92c4@linaro.org>
In-Reply-To: <df40afe9-2596-27db-bcbb-6d57f8fd92c4@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 17 Aug 2023 14:24:57 +0800
Message-ID: <CAMpQs4Kas9Bg-kdX5yibyr8mOYRphM259Mj3Tx-8=g4j3FXViw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: loongarch: Add Loongson SoC boards compatibles
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

On Tue, Aug 15, 2023 at 10:49=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/08/2023 10:50, Binbin Zhou wrote:
> > Add Loongson SoC boards binding with DT schema format using json-schema=
.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/loongarch/boards.yaml | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/loongarch/boards.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/loongarch/boards.yaml b/=
Documentation/devicetree/bindings/loongarch/boards.yaml
> > new file mode 100644
> > index 000000000000..5092314b7a52
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/loongarch/boards.yaml
> > @@ -0,0 +1,34 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/loongarch/boards.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson SoC-based boards
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: Loongson-2K0500 processor based boards
> > +        items:
> > +          - const: loongson,ls2k0500-ref
> > +          - const: loongson,ls2k0500
> > +
> > +      - description: Loongson-2K1000 processor based boards
> > +        items:
> > +          - const: loongson,ls2k1000-ref
> > +          - const: loongson,ls2k1000
> > +
> > +      - description: Loongson-2K2000 processor based boards
> > +        items:
> > +          - const: loongson,ls2k2000-ref
> > +          - const: loongson,ls2k2000
>
> This probably is a sign all your bindings are using a bogus compatible.
> You were using compatibles like loongson,ls2k-clk so your SoC cannot be
> ls2k2000... or your compatible is bogus. The same for:
> loongson,ls2k-pm, loongson,ls2k-dwmac, loongson,ls2k-i2c,
> loongson,ls2k-chipid, loongson,ls2k-gpio
>

I'm not sure I understand correctly, are you saying I should rename
all these ls2k-xx compatibles to Soc-based compatible?

For example, loongson,ls2k-i2c should be renamed to something like this:
loongson,ls2k0500-i2c, loongson,ls2k-i2c
loongson,ls2k1000-i2c, loongson,ls2k-i2c
loongson,ls2k2000-i2c, loongson,ls2k-i2c
Even if their driver code is no different.

Thanks.
Binbin

> Best regards,
> Krzysztof
>
