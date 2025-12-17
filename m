Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9D2194098
	for <loongarch@lists.linux.dev>; Wed, 17 Dec 2025 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765955857; cv=none; b=YGu3EtTZiIERYUhbVAB2ZG24tTylKP1uFt3SJS3+m0DLDaNTDHdJqxvRI1b5O/gWZmYZIY6qoSIJI4bnFXgZXozmIJcQeYR4wWqti6rkaj9CpBgaeUGVBScWoZLpdXor21JVKSLoKQXfcPtfQDeMd/frZyz6+1BrMzLKngCGXmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765955857; c=relaxed/simple;
	bh=sGSFw6wrWWy3/bnR6CFHivvMHCvhSF4J7Dxsir/YNYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvJ+yTX8pCZswuS5RPhWmGHO+awc/FyhbGGP9Avzo+rRTNjcNTKMRmvX75emOAu/w8m/f0sTyafJDJa4BkCp46lHrlh9Pa+BCC5zhBHLfYF7G04If4gy6NxGqISg6GzVYrq61Tv4Zx9C7ehdjCMVx7I3NvWJJkssQVlmkMwbKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjjSwoqR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjjSwoqR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7697e8b01aso980359166b.2
        for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 23:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765955854; x=1766560654; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pH+BlCZQbXYqO+26tPiDrGWno89MfVLt4htiZPlW28=;
        b=JjjSwoqRJzeMc+0cBDVxbZMDPWN6beRg//hIzzLZfZ89EsAnhJSnBpyKaVEN5byuf4
         9vYnwEqqRN/AONc/JQYhck6QS8ZwGP0reyuZ+uwOqN5fME7XFiLk7EdggQcXlnFLVzpt
         05Jrg8X/DPHeosuTUzR3PHTTxqp5sCzLWp6oJVnJ6F/Nom8dWLDT2Hqw1Fs8Ot0lCHi8
         qVSJOFa7UxGVnJBxWXcV6iJumHIuwF0RSKcU6+HYJ3dGxgGNRqT9bpKMoEzc6kap/G6q
         LQSpWBjMyh6X34y+EGvnw9WzSPPhvuM92x8c6u8ftSRB1XzaN8c08Ibk8sYTCQOqgMYE
         X7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765955854; x=1766560654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pH+BlCZQbXYqO+26tPiDrGWno89MfVLt4htiZPlW28=;
        b=rwqZG/gCKe0x4fqyqAq17Yk0nbFZ9GDsZRY7FS7It5h8Retbxl5p6ClSXGfpGxzN33
         ldPKHBoceOl7SjYdaIv5vTDonMCzINHfEaYqiwi01dLuYTkmZ0+Pm3lrVjF+ZBxPnYhv
         TbrqYyOtPqIYdG8oKpi3Q/oahSq8balu8CUIpvCNDRGrmxzTXNPzdg3sfTCDsPrMS1pM
         Rsk6Hcqen1DfeRJ2ZeEdshHtcuVoEmVTA9Xp1Ol4UQlvsPH9v6xnW2YNcwyIJVTGvZK4
         LW8OqR+iFCxNUG8nOXkAwUDULvHp39Mb8IQWrYMvGDRwTe5s7pYLgFoNnpGAvarhqB84
         UqMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4I9GFgQ/k4BTR/ALB6elQGW8mIvXI89QAXk6Aiz9Vi7d5GI/YLa0FPpAZg8SpaafroLTpQlRr3SE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzW6SZlnIBpiy4DD+4GlT5RH8csJRERiW1M9hL7I8GJNEvIK2Lx
	aoZEPo8oRY032C9BoURMcwkT6KdUlxWD5d4Z9uHX5eu7CG6lg5iaRFp1M9NEeoQLOj+pxbsoz57
	6C4ghscKgBc6vXGl2svYbvVrgIA3Fa6w=
X-Gm-Gg: AY/fxX7aiqr+d29fksu+u0e+RgpJGQ62qkPAdMsco+5XcLfeQO17Reno12aIw6PNZM3
	OKnAGvbOy/JnNljIzOfbgddVAPPdtiqbSXOPfcX0E9QK7281/L8C/vBl46pPt0shdNF8plyPmW6
	N+QK099sbMYoUtLMlE8MVBMT5tg/UB6jta3qiIlhbrk1zolCkOva+AUpUXjCIuSiwyHXFR620nw
	UGs0+dHZ7T5JG09GPVfIOd13vKcxS4ohSFBoZYt7sQLkIsGAUEVp6Ws06QM/PrWN+nqSuJ9Lg==
X-Google-Smtp-Source: AGHT+IHtoWqu9KIpjpAGTsT8eSeVzj6hClh0q487/PK/po+pRqU5dVKydRl7jwtPeUieGqGoWu0p2H4MVgHYuv7iX3g=
X-Received: by 2002:a17:906:9f88:b0:b76:f090:768c with SMTP id
 a640c23a62f3a-b7d23c19ce3mr1788182266b.30.1765955854222; Tue, 16 Dec 2025
 23:17:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1765778124.git.zhoubinbin@loongson.cn> <db24b6366bb0d49e9dcc04328ffad7a37f687a89.1765778124.git.zhoubinbin@loongson.cn>
 <20251216161641.GA2573095-robh@kernel.org>
In-Reply-To: <20251216161641.GA2573095-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 17 Dec 2025 15:17:21 +0800
X-Gm-Features: AQt7F2qQrdS_pneRFz3w-uSIWdtleZiWhz-8aYHoPaaqOQqdhxOueQMyYHD3klo
Message-ID: <CAMpQs4KUze8TPXV0Lmk8fP9cc0s4PsJY9bU9YrF-_kWJ8dtBog@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: interrupt-controller: loongson,pch-pic:
 Change to unevaluatedProperties
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Yao Zi <me@ziyao.cc>, 
	Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your review.

On Wed, Dec 17, 2025 at 12:16=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Dec 16, 2025 at 03:55:13PM +0800, Binbin Zhou wrote:
> > Change additionalProperties to unevaluatedProperties because it refs to
> > interrupt-controller.yaml.
> >
> > Fix below CHECK_DTBS warnings:
> > arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: interrupt-controller@1=
0000000 (loongson,pch-pic-1.0): '#address-cells' does not match any of the =
regexes: '^pinctrl-[0-9]+$'
> >         from schema $id: http://devicetree.org/schemas/interrupt-contro=
ller/loongson,pch-pic.yaml
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/interrupt-controller/loongson,pch-pic.yaml      | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/loo=
ngson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/loongson,pch-pic.yaml
> > index b7bc5cb1dff2..1f818316082e 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,p=
ch-pic.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,p=
ch-pic.yaml
> > @@ -14,6 +14,9 @@ description:
> >    transforming interrupts from on-chip devices into HyperTransport vec=
torized
> >    interrupts.
> >
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
>
> Adding this does not define the value(s) #address-cells must be. I'd
> assume it is 0 in this case.

Indeed, interrupt-controller.yaml only defines #address-cells, and
does not specify values. But the addition of interrupt-controller.yaml
is still necessary, besides that, I would add the following:

@@ -37,12 +37,16 @@ properties:
   '#interrupt-cells':
     const: 2

+  '#address-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - loongson,pic-base-vec
   - interrupt-controller
   - '#interrupt-cells'
+  - '#address-cells'

 unevaluatedProperties: false

>
> > +
> >  properties:
> >    compatible:
> >      const: loongson,pch-pic-1.0
> > @@ -41,7 +44,7 @@ required:
> >    - interrupt-controller
> >    - '#interrupt-cells'
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
> >
> >  examples:
> >    - |
> > --
> > 2.47.3
> >

--=20
Thanks.
Binbin
