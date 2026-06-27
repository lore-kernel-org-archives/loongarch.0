Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76CA396B9D
	for <loongarch@lists.linux.dev>; Sat, 27 Jun 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782555977; cv=pass; b=URdLF9SksS8YIOUZHCvx296pwCD2XvxUZJE/7Gg/3kcltTFukveOlY+dRPbGirxyTAPNA5EXnL4fgMRjDRF0KKzzIzsInJGpwOLyE+BFp/KBCqcb9xVBzcImClBofzdOwotWqkT6H7iCpSo4gWlH+DYLw3SME2izP0gmZe4SUl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782555977; c=relaxed/simple;
	bh=Tyzwc5vQV/Bc9l6Q1lrrqMverf6XUl6aFPZAG6N55h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VY0Wm+vANjn7kBfQlpZ5p0tk/wMQxpZwiKGL+jZfUz4miss0ilBYOM4DOOC7gGYcwS7gY7tjWjC5O+fqq1IrVm1jOfhiZ6w/XFsZmlnkq0L1jWDKr0db1rqCgcfgShrGUzAvCdtbaqE1Q3t9sdQw3K/5ibnkI6/3YO/kb6KCjTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cElwjWTu; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cElwjWTu"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1237aa9315so69780266b.3
        for <loongarch@lists.linux.dev>; Sat, 27 Jun 2026 03:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782555974; cv=none;
        d=google.com; s=arc-20260327;
        b=l/EXtzmSQp3qD6rXjpO1JKzOU3AJLKOAzuBbsqSYaxVe2C4UBDMJXsVfBfD3scQ19R
         oOFq+yUXM6kDZySMdyXwIZ4BF2p/6uYX8Mo7WYlzzQbJitZ2j5a2SNF5M+douFehY2QX
         58n4lsfmY2D1OX+/5rPRmnAhx9hUHFlrPySacaDSzozV/GdBao/RY5T6y95Uf7N9LFqv
         GFkTAIMSO0Vvh0Z9cr6tKeC+mo7sHxlYDREORWvdLNdBcOk0REZu6mmQWJQfxKuxsJb6
         mwep8HIKemy+BfolqKO5HNBmhAeOeWmo5nMrFVd9ULxn8YOIJCAnkDGbV5OyzbmOstVZ
         PR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dRhdXkzmky4M+xi9zzW6VsYPcQ71AzXk59h10EkBcIU=;
        fh=aVQEpG6zoFYGVKuesq3bGI2/gd7UIn+vdGA2P26I5DY=;
        b=Lx6pzxUAFhrmeO6Y/HPOqeXbTFZGEOUsk6KWvi/wV0AlJ8xHbTojnHITJgU+yyqH5r
         HoqPQ7T6A1IAciNpgSWc48akYFIODpvRXK7krelM3Qtn/3lN9qjd3rsR5nGm4AeOvt9g
         D3s1R/8SNsbj3VHczocm64PQyo/7SYmTZN+kLfQ2Cu73y7yNt55f7vi5AgZnbqGmFfdL
         tmPPC9eixwdrNAb47DRhMWWu9QvQUCa1EZ+BujR/hl+iNqxM3xqrd5RDlg1EvNQ7E/fq
         dVIv0+Cvo+Dk0aZoTz03XraBZGz1vUHHXDZ2nJoOmDWPWlsGvd+5KJJKigmSRFGxG8G5
         rgtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782555974; x=1783160774; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRhdXkzmky4M+xi9zzW6VsYPcQ71AzXk59h10EkBcIU=;
        b=cElwjWTu8BnEzOKFmat2rHnbgI+TfyTprnyvEaoNNGdcDImvOrClsAhx4VA2Q/IDMO
         wX2jih4Nnl3OPBNFkvyJJZxbI+ZHA6qSVf6eSu065QUOsfK5qXZbfI8Kxc+ZPBO4qAqC
         sFy1n1QvtII4x/4nFiLWe/pS+8fUyjGDyYXpJsHSlSwXHNXqyspzxzpPRdbISyWIBJrZ
         qmPK3P+0Mh9/B0vaLfEJvZq/3m93fIxooADg0ghlB4AGoqifdE4QWqnux+OYvv2qVHUT
         xFonPCVWXfuRml5deEF/2Oqx3ovfeGw21xjbYnz5nyHhU/91KnSOdw3/GO1I9GS2ct4w
         CcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782555974; x=1783160774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dRhdXkzmky4M+xi9zzW6VsYPcQ71AzXk59h10EkBcIU=;
        b=BVzVqrzycb7ALJvIqq3/QK2A0mDmVErztwkiVzbaZ08VJfE8VHGpz/2t8277Sn7zx/
         SfSXRGFSam2CDa2RzFd1T+3ZGtR42sI4/SCfUfEI2FNmm2EVZ6vu6dZ02kI41evrraE/
         +KS33f1DreBVtFgbmY8cI2UAP2JiomsG8DNbZ34icBSfb8wtVn605Uj/SBRTOxJ8j2nb
         ePdkckoYAzcGZ98W4wHKCMemac1W/o6amiz5HyxjkyB/t3e9kFu2J5/YY2Af6bdiO0CM
         p+XeLEi+ScXHZqbknZrM5jTx/VRgsr/LexUTgi3CcPfKXLDdP/PVcQCc55txMPJOJcJ+
         tRJg==
X-Forwarded-Encrypted: i=1; AHgh+Rpa9LUJVG8DS4GKz72o4Zb5gXW3sMe1ik+z+EosrPvks3AT1rtP4htpCh+HH1nesdPXL9XMtX2vtD0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3BICxZ4JlY3Jfntn/Ot04tP8n40KIk+3ed3jeTyLg8PuFEXXq
	pZOzYHBPvaV/YRgT+KPIkiI2nNFVOF8KxvtS12GRSbnWIKziLhDX247zFibJKfq29tUyqzC/b2W
	+lqxOdQOTAGf6T6j4CLjpRJaAp8s3dZo=
X-Gm-Gg: AfdE7cnb44jYoi22AiM4vRUHZwj2F30NoAKt3yf9TAuzLZdmBgc9f9HUtq/9Go6u7wZ
	LAw2okT5OReZkXYRreO8MJf0F2Xa+N7O3+WPnAaqc6hoTZxCKeLrEICcLD6oyeo+owWi3E9ACJJ
	+7MFLVdnNxRkHs5Q1MchKKvwbytuKwVkMKNO2cev3+oajn4k8EJ2pPNL/ihRhqwXFgSwGxiwuF8
	FEtkOb3ci8d/aJac72i4zyc/s+y/VInxbL6ZVPG6a8boKOltaoGpVu+d002S+MyD14MLLPj
X-Received: by 2002:a17:907:944b:b0:c12:34cd:8f55 with SMTP id
 a640c23a62f3a-c1234cd90a8mr180840966b.63.1782555973984; Sat, 27 Jun 2026
 03:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1782439646.git.zhoubinbin@loongson.cn> <71430fcee5951fb7a7d52e2091a87707db85e06c.1782439646.git.zhoubinbin@loongson.cn>
 <20260626-devout-vulture-of-reading-4fbfad@quoll>
In-Reply-To: <20260626-devout-vulture-of-reading-4fbfad@quoll>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 27 Jun 2026 18:26:00 +0800
X-Gm-Features: AVVi8Cch4DTatr5qzfiiR0Q6wMEZ2Lh4BN6_B1AcmWk900bypd0wcNlkm8ktYOk
Message-ID: <CAMpQs4J=0i_kJHE_impCbKJHE8hVqDjNUm-cgkaUF_BsZ3QpUA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] ASoC: dt-bindings: loongson,ls-audio-card: Add
 ATK-DL2K0300B compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your review.

On Fri, Jun 26, 2026 at 6:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jun 26, 2026 at 10:27:28AM +0800, Binbin Zhou wrote:
> > Add new compatible for the ATK-DL2K0300B development board based on
> > Loongson-2K0300.
> >
> > Unlike others, this board features GPIO-controlled headphone detection,
> > headphone control, and speaker enable.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../sound/loongson,ls-audio-card.yaml         | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-=
card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.=
yaml
> > index 8c214e5d04b1..dc7f4afbb777 100644
> > --- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > @@ -23,6 +23,7 @@ properties:
> >      enum:
> >        - loongson,ls-audio-card  # Loongson-2K1000/Loongson-2K2000/LS7A
> >        - loongson,ls2k0300-forever-pi-audio-card # CTCISZ Forever Pi
> > +      - loongson,ls2k0300-dl2k0300b-audio-card # ATK-DL2K0300B
> >
> >    mclk-fs:
> >      $ref: simple-card.yaml#/definitions/mclk-fs
> > @@ -47,6 +48,18 @@ properties:
> >      required:
> >        - sound-dai
> >
> > +  spkr-en-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that enables the speakers
> > +
> > +  hp-ctl-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that control the headphones
> > +
> > +  hp-det-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that detect headphones are plugged in
> > +
>
> Add allOf:if:then: block after "required:" block and disallow these
> ("...: false") for other variants.

OK, I will add if:then block as follow:

@@ -68,6 +68,18 @@ required:

 unevaluatedProperties: false

+if:
+  properties:
+    compatible:
+      contains:
+        const: loongson,ls2k0300-dl2k0300b-audio-card
+
+then:
+  required:
+    - spkr-en-gpios
+    - hp-ctl-gpios
+    - hp-det-gpios
+
 examples:
   - |
     sound

>
> If these stay, because I have doubts. spkr-en-gpios sounds like
> enable-gpios of each speaker, so not suitable here but should go to
> individual speaker codec nodes.

Speaker codec? Sorry, I=E2=80=99m not quite sure what you mean. `speaker` a=
nd
`headphone` are routing options for the same codec (es8328), and they
are mutually exclusive. Of course, based on the current design, there
aren=E2=80=99t multiple `speakers`.

Also, these three GPIOs are on the CPU side. Is it reasonable to place
them in the `machine` node?

>
> Best regards,
> Krzysztof
>

--=20
Thanks.
Binbin
