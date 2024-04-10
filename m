Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ADD15B10C
	for <loongarch@lists.linux.dev>; Wed, 10 Apr 2024 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712749865; cv=none; b=IKuaFfVDQkfMRcqpvTj4O+zpv9/3jVdwDoc3U+DLtejQJr2/Y38IRCiSqIGY7VVy9zh57lrnXrovMi4BmR/llyB9gVEGxOkf0ST+AqxJE3ZsK1IPFbA9uMyBBLx9YgGiwveXgJHs3vlAhVkOpAPc243wilQhwuHPMMLDe9v6O2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712749865; c=relaxed/simple;
	bh=hawNKPqy/fSDPubMAcYwReqXvoa96fubMIudJNnky40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQZo1o7zwXqQRW9I+i4XBBVvMTrSubJ/XPTOouoziCeko3Z5hvr7A2QZUNr95qrgrBVvVN6OlyrnYPo3xVMFlyg5O5jO6ozcofQlMTAGWRlteVqn84pjXUJz/D2v98U40ZlZKrrrbxc8lboz7iYmMOHNuXLfN45ulsufzC57mZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuTByU3k; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuTByU3k"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-617ddc988f5so56521957b3.2
        for <loongarch@lists.linux.dev>; Wed, 10 Apr 2024 04:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712749863; x=1713354663; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGFqD2H8A4IC39eJXBGYkefpyZOqcgp427WuDNRfz3I=;
        b=ZuTByU3kO8myzhKfYEa4ewRimG5rdmhB6V1posfsmxXI9VVLE3nCcornh8Z+X2JfaO
         DXwNOUPhkpSu4jLrQT7hAv3d0DDJRbk9JIiFHnved611UaA6HvqLjna3+v6BbP5Umq2Q
         YdNo0pCQQthwNobEQZWXW/1y0doMX/zARQBrbOwQKfaMU+ZAz01bmKP1BGhQ/I6NnpAU
         gt7C0V7A8qEtm4CoGeKz5YvCI8uuwYz/bqVTOSaVGgUpletp+P4e6ml9IjyKCLAeg22A
         0ybDtKUli5oRjz2nvSSehwjhD6VE3y+GximcOsvLNg9uU9YXfj524+oBQj2ZE+iXgdYq
         Aw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712749863; x=1713354663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGFqD2H8A4IC39eJXBGYkefpyZOqcgp427WuDNRfz3I=;
        b=bjt6hffMd5LrtvEgp2xy+fNKSwDiSSHZt9E0txTVnwDfuodw62VjsFOqtSZTmgWO8m
         nAF59g6YoK+VINBiC+TRX4aSsKAo5+x90aTSgAn50EjiD4lX6JZXxRU8n6ieHfLWDFfa
         2g91pxL0CD0ea+3YgG65rJUqjODkFUpCW3YHwQ5BtmZaL0Bru6peVPq8WhtBNLXO5djF
         IEDDC3fTtap4kT88QWpQcxoKO0CL4azAS2mwo6EBL8P3ELrOLuXSwc+kUHION8p2Q1fr
         /UccqKC3XbyI6MznZ2alMR+vcEoHp7I6K4Jz01g3wWV8UJZvi7oTxf0Y2rTpYBTDXgZz
         4low==
X-Forwarded-Encrypted: i=1; AJvYcCVnKeKJR6Iu3Xsy+7dg6LV978C1adSWjlL0YgoLgOk0ELdO3bfQCm7PShEJRZJPzaAFsZBTBhUNGAQudLAx2wRZvQJxTLAvNe20
X-Gm-Message-State: AOJu0YxWgcTK0JhV15JIGwZwtljLjH+GLYWnjLff5w4xt3tkxH6RTf00
	NJG28T8pcizVj/0TOPqeXIBvhWTuaficZ7Bz6L5sJJDu7wm6B7TpGudbIBd29e+wGfS8z58AY8v
	+nvRmOIaWCF4EnUI58ZWZpwIKXFw=
X-Google-Smtp-Source: AGHT+IEsPgbEvEI3iNDVlGUf1oUGjPIue/N/ftTR/UIOXIGrffHXCAqtPUghlz24jBdTp6dOSLPDroMYdDmNBXtMXGo=
X-Received: by 2002:a81:5210:0:b0:617:ca11:c7e7 with SMTP id
 g16-20020a815210000000b00617ca11c7e7mr2539289ywb.40.1712749863399; Wed, 10
 Apr 2024 04:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1712733065.git.zhoubinbin@loongson.cn> <217ce2745a8787c504bbda1d085daba7e9cb2f70.1712733065.git.zhoubinbin@loongson.cn>
 <20240410-wrecker-procreate-11e0915f7bbd@spud>
In-Reply-To: <20240410-wrecker-procreate-11e0915f7bbd@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 10 Apr 2024 19:50:52 +0800
Message-ID: <CAMpQs4KSJB3wksDO2TJA1HSMuEW2=r13UtXbvZPFkKAPhvBdvg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: thermal: loongson,ls2k-thermal: Fix
 incorrect compatible definition
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

On Wed, Apr 10, 2024 at 6:00=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Apr 10, 2024 at 05:49:02PM +0800, Binbin Zhou wrote:
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
> >  .../thermal/loongson,ls2k-thermal.yaml        | 22 +++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-th=
ermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-therma=
l.yaml
> > index 9748a479dcd4..a25b42702788 100644
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
> > @@ -41,6 +42,23 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls2k2000-thermal
> > +
> > +then:
> > +  properties:
> > +    reg:
> > +      maxItems: 2
>
> You need a minItems: 2 here also, so that providing only the original
> reg is not allowed anymore.

Hi Conor:

Indeed, it is necessary that the whole description is more rigorous.
I'll fix it in the next version.

Thanks.
Binbin
>
> Cheers,
> Conor.
>
> > +
> > +else:
> > +  properties:
> > +    reg:
> > +      maxItems: 1
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/interrupt-controller/irq.h>
> > --
> > 2.43.0
> >
