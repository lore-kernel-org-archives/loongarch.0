Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8B5395
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 06:16:26 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58c6b6b4953so17468107b3.3
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 23:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692252985; x=1692857785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p301VUbckwJM4qtfIHklyJ3pzB8D4EWoaznI1J4TO6g=;
        b=XwvY1WlTgY+aLGfexF9UUuHaEoZPpGT61xvfkNw0t+4bHJPfutCIptSR6LDmWTGCkp
         BQbxut11IvbwDL+jq3vuJRQqMKrk5GFnlpg/NkXKuT35V++HkoQem2yA3HQ+HxFduv2s
         jzgBGkI2qVTvciTdp90LrsVdglDw3x5rvJnWPQyUGmhzkFB/s971WzCkPyOZzC50PplQ
         fa6mBhawRZTAKkbem2VmC2Rkk3XIoJoXMskDZBt66dE58y8orOhmyZyqIxCFQwhTuY0+
         LSyNChU5/lkybXTcxTyk59DTT1i3R5OaB9YJFSOwa2nBODVogKeNtTdKE9uR+o2YvIwW
         qwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692252985; x=1692857785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p301VUbckwJM4qtfIHklyJ3pzB8D4EWoaznI1J4TO6g=;
        b=OvkZHL9b+kXQABXXztA3qlmzlwjyPKMMaDONve8uOiQ+0I34rHUzCdgpqZvL46n6+j
         6EPCSPcLhtna9kKBnbT0lCcEvGdiY0YHxAyhSHdILFjzcb4aUL0XhMzj+YeePKkwAxZq
         fHMivMBZL+t+CNqpiWbb3l2ojoc1wdHx09UrZil6Zdl+BhaRYXVqaYrYjGdbEocroGTc
         ldAx4PwOVzS/V6s8PrMWYp2EvhhyDk1K6ds6yjP4Tcf6t14EHK4gLDOa5QNV/mBuaFXr
         cs/dy2TJK88xdzQ8Ers17lY1pa2aqTf1NAnNpZ9qp12/Wv7XiN1cUyUM82t5Kd24w9ho
         bH2Q==
X-Gm-Message-State: AOJu0YwYcYCrGAVjtHlu9AXjEu75B3h1/DyGxv+ie3/8+S4TBIV0VkdN
	+RWPK8KtGdZX3NRiMEo4hP2BR0TVEHrXXoh/aDk=
X-Google-Smtp-Source: AGHT+IGw5Mt8Ez7wW5rftElo8mirCx2NKA7aun14TEsgoSCgntJDVl0XybM19ZeITpu01clYjSNjCASxCKGWYCLNEt8=
X-Received: by 2002:a0d:ea01:0:b0:56d:4d34:20c with SMTP id
 t1-20020a0dea01000000b0056d4d34020cmr4116837ywe.37.1692252985341; Wed, 16 Aug
 2023 23:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692088166.git.zhoubinbin@loongson.cn> <6d8d0d8d21e32e0577565158bc1c4960a92fb216.1692088166.git.zhoubinbin@loongson.cn>
 <20230815-fineness-lesser-d807c051dd36@spud>
In-Reply-To: <20230815-fineness-lesser-d807c051dd36@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 17 Aug 2023 14:16:13 +0800
Message-ID: <CAMpQs4JY0=mdSvw64aMAk0Vq5qBcfvqzyXzscsdOhOS4vNuTwA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: loongarch: Add Loongson SoC boards compatibles
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

On Tue, Aug 15, 2023 at 10:13=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Aug 15, 2023 at 04:50:47PM +0800, Binbin Zhou wrote:
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
> Do all of these SoCs just have a single reference/dev board?

Yes, I have development boards for each Soc on hand now, and it has a
relatively complete interface. My original idea was to use the
development boards as examples to show you the Loongson-2K Soc.
I'm sure more boards will be added in the future.

Thanks.
Binbin
>
> > +
> > +additionalProperties: true
> > +
> > +...
> > --
> > 2.39.3
> >
