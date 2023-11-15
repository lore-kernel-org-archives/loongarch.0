Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E13D6C
	for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 06:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQgpHdXz"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dafe04717baso2250494276.1
        for <loongarch@lists.linux.dev>; Tue, 14 Nov 2023 22:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700031053; x=1700635853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POR86ACWq50gnyaMlW3Qse0dtzLOhtouY3Pos+VsSEI=;
        b=GQgpHdXzJMUlr3eQnvnh3874uGNTbcXMePk4FDOmkqA+4qOOLP87SHKbDKigHqLZwi
         AZDB3Y8tUJcUVZnXcLiJx0H4NE4emifYwhn7ryDkHeZkyzG5jxP9jPPFyJHc2N19WhIT
         u8btaKzbsnWvvT52hkUFG069VIVftvTj2usyuun8YyQZi4vJfZxzBw9k3OCgSf8KvrvN
         /XVwZx0bEubzRG0NxRnINJzV3KUybjD8QTTQcVQNhLa6LADM9VUrM+9J8FtvJNRR1S+H
         uG+0QWxOGfIGBqhMfYEpI/jZLutDX+juyyVkLQk5arOiVVH0K6Jf9wNj7HrJy13ENYXG
         htNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700031053; x=1700635853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POR86ACWq50gnyaMlW3Qse0dtzLOhtouY3Pos+VsSEI=;
        b=MQWXjxqsxR26ma22E38k5bvWB2cnjWi99ADNyiFhoX9VcJGXBRTr5zGo1mO8URUeA3
         t2+n1Kh+K++gX43FgQCbPSTVpaDAMzO5Vume1dxlEpVAVCjrFawlV4fYfuQgkJsHGsgp
         aVUSrR5HJxoKKHS9IBIZ2f4VFx41vw2+0qcC9iucgaz7XplLgMToTf2SAvhw/J+DXAIh
         eihvKvm7Yr2TYutx2ghTiQz1J9gNp+/u+84Afp1UFrp+LogT+OgdQMcv9UXSQFus/Nlg
         aGH1NPQry+hM2e1A9UJenebfHpWoEag+YUtBAtNUO35/SmEHKf7qYd3NLvGcgaWlLtuA
         SPfQ==
X-Gm-Message-State: AOJu0YzyfXPA2fRu1UVcz58E3Fvd5xF9GReWpNeUJ7fQf3jDJ/1heWWZ
	9DKnlxej+lU6lmJq4+zn+DsI0KcIuhca1opadsI=
X-Google-Smtp-Source: AGHT+IEvWU+xADG1vVrhuo05S5yemv8lG8npJc7Gem1sHpS7JujsnjhW9DN6x9wSerRwOITRWwumplSH2YEoe+kS57E=
X-Received: by 2002:a25:383:0:b0:da0:6257:8da4 with SMTP id
 125-20020a250383000000b00da062578da4mr9881399ybd.57.1700031053336; Tue, 14
 Nov 2023 22:50:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1698743706.git.zhoubinbin@loongson.cn> <944559ea3bf7ba0a1540f831ccd7d33591622b22.1698743706.git.zhoubinbin@loongson.cn>
 <20231031-negative-giveaway-6191a2da0cd5@spud> <CAMpQs4+3T9RATpJ5VycnEzkOTx_M2vdt6WPJv_B1Efy81RzCjA@mail.gmail.com>
 <20231101-clone-facsimile-fd4c37333842@spud>
In-Reply-To: <20231101-clone-facsimile-fd4c37333842@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 15 Nov 2023 12:50:41 +0600
Message-ID: <CAMpQs4L_85yPQXR4t=kaCEuwXK-Jr=L6G=omhAtrOn7CWUMCKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: loongson,ls2k-thermal: Fix
 binding check issues
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 1:59=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Nov 01, 2023 at 07:38:39AM +0600, Binbin Zhou wrote:
> > On Tue, Oct 31, 2023 at 10:58=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > >
> > > On Tue, Oct 31, 2023 at 07:05:49PM +0800, Binbin Zhou wrote:
> > > > Add the missing 'thermal-sensor-cells' property which is required f=
or
> > > > every thermal sensor as it's used when using phandles.
> > > > And add the thermal-sensor.yaml reference.
> > > >
> > > > Fixes: 72684d99a854 ("thermal: dt-bindings: add loongson-2 thermal"=
)
> > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > ---
> > > >  .../bindings/thermal/loongson,ls2k-thermal.yaml        | 10 ++++++=
+++-
> > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2=
k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-th=
ermal.yaml
> > > > index 7538469997f9..b634f57cd011 100644
> > > > --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-therm=
al.yaml
> > > > +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-therm=
al.yaml
> > > > @@ -10,6 +10,9 @@ maintainers:
> > > >    - zhanghongchen <zhanghongchen@loongson.cn>
> > > >    - Yinbo Zhu <zhuyinbo@loongson.cn>
> > > >
> > > > +allOf:
> > > > +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> > > > +
> > > >  properties:
> > > >    compatible:
> > > >      oneOf:
> > > > @@ -26,12 +29,16 @@ properties:
> > > >    interrupts:
> > > >      maxItems: 1
> > > >
> > > > +  '#thermal-sensor-cells':
> > > > +    const: 1
> > > > +
> > > >  required:
> > > >    - compatible
> > > >    - reg
> > > >    - interrupts
> > > > +  - '#thermal-sensor-cells'
> > >
> > > Why does it need to be a required property now though?
> > > Adding new required properties is technically an ABI break.
> >
> > Hi Conor:
> >
> > I don't think it makes sense to have a separate thermal sensor
> > definition, it needs thermal-zones to describe specific behaviors,
> > e.g. cpu-thermal, so we need '#thermal-sensor-cells' to specify the
> > reference.
> > And the Loongson-2K1000 has 4 sets of control registers, we need to
> > specify the id when referencing it.
>
> Unfortunately, none of this is an answer to my question.

Hi Conor:

Sorry for my late reply.

Over the past few days, I've been communicating offline with Yinbo
(the driver author) about the use of the '#thermal-sensor-cells'
attribute. He retested the attribute and determined that it is
'required'.

We can see that the '#thermal-sensor-cells' attribute in the
dt-binding was dropped between the V12 patchset[1] and the V13
patchset[2]. Yinbo may have misunderstood Daniel's comment and removed
the '#thermal-sensor-cells' attribute from the dt-binding. But the
attribute was carelessly still left in the dts file, resulting in the
issue not being found during functional validation.

Indeed, re-adding the '#thermal-sensor-cells' attribute as "required"
is technically an ABI breakage, but the driver does not work properly
under the current dt-binding rules.
Also, the driver is only valid under LoongArch and will have no effect
on other architectures.

[1]=EF=BC=9Ahttps://lore.kernel.org/all/20221114024709.7975-2-zhuyinbo@loon=
gson.cn/
[2]=EF=BC=9Ahttps://lore.kernel.org/all/20230221095355.9799-2-zhuyinbo@loon=
gson.cn/

Thanks.
Binbin
