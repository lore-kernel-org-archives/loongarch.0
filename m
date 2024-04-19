Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BCC522E
	for <loongarch@lists.linux.dev>; Fri, 19 Apr 2024 04:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713501449; cv=none; b=emFhoCeZyB0YBdFQpxC91cPlcqVh8zn9Q0h1pNbtZ+GuVdYmySqslQkhMVy94qxXQU+mTgrUDh787m8kGk3q2rf5GdM719IdmDsfDtIW4ooa0tukJbEwNAxlqxKN4wpBWHTI4h9tBL64XSXnwgOIv1WNctJ+4fEbEbvD889QZ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713501449; c=relaxed/simple;
	bh=aA0eWf4lTjyJXrzsPGUfl9MnnAc/P4pB9uRI/dobEws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjEIg0T6qK4cUTunp9TCpaYCb9lChzlVVW38f3pzPR3H9z2RRhrtfaf36TA7Xoy2QQwxvYP0fOLGHknTcxM6YC4TDNj4fIZylMqF1XaQV01IgCmtrSYb3EZX/d9Z+8/nJ8f7OjaHxlQjYUJM5RdQgQEKb4uvvdvDehRHwcbY6MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ea8Oqu/+; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ea8Oqu/+"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de45e5c3c68so1860246276.0
        for <loongarch@lists.linux.dev>; Thu, 18 Apr 2024 21:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713501446; x=1714106246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFpAdFUlK6c+FuOE2UkmdUUly6ellBWMJzLFthxSKp4=;
        b=ea8Oqu/+HefRShJqIOKoH/sOgEAwMrYHkNLWFYU+acnQjjYRP7cNjSG4cbXNx7mpRf
         LF5xg9pPQ7iTzEY2TVb6Dkq8+ByudJJisClDCzp0Ij8f1p0IL5wlBPohk2DWcDNuUG1+
         rHWKxmqr1ZZYQN0QU+JWtIpNAc35QvlA+IPIyyleHVg16bHbXHFp1KYPx0L8LUW4xULR
         1reyvQt3jCPv4xFcQXG5kgtuhgEq8H6hGEMrKJPWMTQEHbxn1AcIE1mksMo/ZHRysQ4z
         ZzFgA/3Sc2+NJx1IZrnXqdItMU6HTapSnf0K8gtRqYlII5YTckIQxulse4tN6Za3U13R
         qQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713501446; x=1714106246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFpAdFUlK6c+FuOE2UkmdUUly6ellBWMJzLFthxSKp4=;
        b=uCU04rW39jb50esAapdbcirRBW8VylJDR8+FHcK3bXjNyzvU1PkDCDjOADKkUj+1tx
         U9lxV9x0Wsh3ZH6JPpRskuykM7n0efM/OZzrLoSj7Z/LeFtspB6fknPtvyEaUFqKOnap
         Ko3N5bIm+Gacr6BEDFsjg+CkGnKoDbtgt6c0bRaRbgctPEguVYEwBYkwc0kLGFsdL4Ut
         ZfdsIOmgVaS/yTPbNRcLIwCua/kzVdVwnNbwa3N0zIKIkF/BM/aUF8za22BnEhMzZw3S
         tfdIK5eBkghnXtuhwX6GtxweD6m0x2G2MHgF0jWkgd5Kxbk+nFmWLTPSoeVhYqiAuNyF
         rNYw==
X-Forwarded-Encrypted: i=1; AJvYcCVElnOLkFuSL07s184feV6xqShLtvPo/FV7//phO+B4LbWz68R4lHAuzz8j60cy5FPrBCwN0TVIUu4gU3vAdjy86rpbx0JLC2Z1
X-Gm-Message-State: AOJu0Yzrb7917eEtciTMfzxd8yIp3HgiPhx3+ACumJN7nAn07GXqMJRX
	YJ6qD4U0kI77o4Igt/FS8LzxmDjsQnCefbXCWx8squCoqPxHWnrEMcjioqwJfkGwqfImBRcDAeB
	e8BOrvpxUbxzc7+1z2dWOsFN6Gos=
X-Google-Smtp-Source: AGHT+IGTBPvZEpv98oIQFH2424OjkFzeVum4zf0vfYLvtPIGm4i4ccBnGSIz8ZL6mTZ/+r66PKpvcXJU8KZMx2xCLfg=
X-Received: by 2002:a25:8046:0:b0:dc7:4c21:fbd5 with SMTP id
 a6-20020a258046000000b00dc74c21fbd5mr716876ybn.0.1713501446407; Thu, 18 Apr
 2024 21:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713147645.git.zhoubinbin@loongson.cn> <9d2132d4713321a83cdeef3cdc8887b7d39340e6.1713147645.git.zhoubinbin@loongson.cn>
 <7396c6d4-878f-4b07-9b7f-bc793bebe4bd@linaro.org>
In-Reply-To: <7396c6d4-878f-4b07-9b7f-bc793bebe4bd@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 19 Apr 2024 10:37:14 +0600
Message-ID: <CAMpQs4JDWd3=ne3KisBXi3pYZWtRuu=3VsMv1+Gj0zHxL0TBRA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: thermal: loongson,ls2k-thermal: Fix
 incorrect compatible definition
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 2:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/04/2024 04:31, Binbin Zhou wrote:
> > The temperature output register of the Loongson-2K2000 is defined in th=
e
> > chip configuration domain, which is different from the Loongson-2K1000,
> > so it can't be fallbacked.
> >
> > We need to use two groups of registers to describe it: the first group
> > is the high and low temperature threshold setting register; the second
> > group is the temperature output register.
> >
> > It is true that this fix will cause ABI corruption, but it is necessary
> > otherwise the Loongson-2K2000 temperature sensor will not work properly=
.
> >
> > Fixes: 72684d99a854 ("thermal: dt-bindings: add loongson-2 thermal")
> > Cc: Yinbo Zhu <zhuyinbo@loongson.cn>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../thermal/loongson,ls2k-thermal.yaml        | 23 +++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-th=
ermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-therma=
l.yaml
> > index 9748a479dcd4..fac6f64d6c67 100644
> > --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.y=
aml
> > +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.y=
aml
> > @@ -18,14 +18,15 @@ properties:
> >      oneOf:
> >        - enum:
> >            - loongson,ls2k1000-thermal
> > +          - loongson,ls2k2000-thermal
> >        - items:
> >            - enum:
> >                - loongson,ls2k0500-thermal
> > -              - loongson,ls2k2000-thermal
> >            - const: loongson,ls2k1000-thermal
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> >
> >    interrupts:
> >      maxItems: 1
> > @@ -41,6 +42,24 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +if:
>
> This goes before unevaluatedProperties, just like in example schema.
>
Hi Krzysztof:

Thanks for your reply.
I will adjust the position of this part in the next version.

Thanks.
Binbin
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Best regards,
> Krzysztof
>
