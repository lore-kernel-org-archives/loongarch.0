Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7B231F9A4
	for <loongarch@lists.linux.dev>; Mon, 29 Jun 2026 04:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707752; cv=pass; b=fSKbf9J8v/3knWWPqaNb74LQwfRk2OxDBzPDn4TVWIvVO2JokuSRVs9e7Jqm0Ie0eVPTjZjBuwY1xJhGC1kVnuASHFgZde/Rvw+Zd8OPurXRqIxIsNWJlcP9s6lA6fazAO43gJJN2GerVN6WkLwVgRZkn9cA8L9e4Uo1/LsY+fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707752; c=relaxed/simple;
	bh=2muzAUWj5D/JqlkRo9dFGKRFyLdNfyC5bWBard2rmAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErY/c8zxIDzzdw3/3qks7CFU6upoDygs3W4p28VW+5lCMGFowIa1IHU1Fs12wcYpGcsncT5TW4VKrhG8IzLAhVnrE+tMZG1RT+SAZLiKjpnqfzJelCcgoi+NxZVAuItfvdTEW1Pcv8ZRmfdVuYHskcoeijrElFdMWPY7YVdAJMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7zgeY3V; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7zgeY3V"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c12645364a5so74922766b.1
        for <loongarch@lists.linux.dev>; Sun, 28 Jun 2026 21:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782707749; cv=none;
        d=google.com; s=arc-20260327;
        b=mqWqvRLS/Iwj9rhbN7sS1XQbWxE7sy8X1gcdatd6VrbT0G5Hm+qveEs2DzOX5EuU0N
         /sUdxOLxNQG9T1MGw39urGuwZu6ajZcHgts0L8O97FYcP1+BR+OpIQ14sjI1ck7RRMp8
         KRDygOGniE59JaA+unT3cZOz+bWsK/xri7ZdHHz88TSdurUYluWdVwNUqgn0nAbhIi8a
         lLMgCmJkh2xKmcmmxm1MVMzOIr3R4MjdM+daPmNz07HUx1oocnMwAgfykDfl/n/o8tS2
         kQUmjmc5jpm47UiTVoewWlu2CLuds2IB7FBe9lg3PUJfIdEJO0a5Lq7Crqqw4NYmfqWE
         ofcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R9/v7FkvKXdZj0GFin7tsYJbb7xrv9WwRRAkYYJomJc=;
        fh=kG1Js57xpS2MNUTYY4LE41rR3PZ5QOCOmO/Ga4PDUG4=;
        b=NXCqW2U1ne26ib1pEI3/6b6ewC0oqJgBw97WxER1Z2a00M5JVFfW2DJMISnXaONdVx
         id5lQYcRaQgN89WXNdVYHcERdWx/fA4cTJNCWmNTsrFUqIWlIOvKbSkOq74zKSWrQQwe
         zMWGEjeAnrMyTPT6X9KbuOzldMOt+FnG1XA8X6S8hlwdbTqhFtfLVQkfHLghWS0OUbjW
         m7/BCGLIG8EFzQ3Q91I0VqrtZuspX5a1nNBLfDRr3olaRWLIa8BXvtmpeKdzQWKR7xNS
         PNtTfbWVYTYKOQiT4fsXsgOSLHPjQOJ9NZdPcpa92f76LBEgOsnBsbJmR2uYzIZ+i1rr
         4YTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782707749; x=1783312549; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9/v7FkvKXdZj0GFin7tsYJbb7xrv9WwRRAkYYJomJc=;
        b=B7zgeY3VH4PMyPXXR1PBivq8OZ3vFSRFpT5NARR+cZAiQDqu1ZKO1pYhCdvykvubNf
         ktGr2dOtnBNhgJjK3dqBd5GQWkBk2PT3C+4tiUSa1A34G4ixB/2rrDqOSnHmbPB2vU4Z
         C7fgXzVVT0pp5Wm511v5e6UhhYkqd4rpD+C15AQt5bk3N2PV4oXeWBVduxGMLZker9Tl
         rlI1f1Y521W86yu940kmxKQIjk8d41LNQjUBEK8f38D00+mDiUiGgkJoQqZ1r670vrUN
         hgJFgr7HfeQLsD1y0H/BY7hpDrALaM02GAPqYYa4eqbxkF4kKWKbiObXzkZgpa4Tgf6a
         bTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707749; x=1783312549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R9/v7FkvKXdZj0GFin7tsYJbb7xrv9WwRRAkYYJomJc=;
        b=OSzbyXILijYryRo8adVy0VvwdSe40rjAGCZ3gle2DJMaFhL+yPrUF1AbAeDN3JY4S+
         ac4Sdm8mox8vfw6jbwtuv0GwBUYMH32wKRIzlPFG9XddsJfY3/sQEveDRfVE3KLBmBq0
         bSw3tD26n6o/hk/qlSSBmbirEsBjXBACP0ulD35QFBnKbaafFOhT+SeIiyPtzfgThXua
         iMg1/sf793QSy9WZZeQbmFQiOeuMCDvwmbt4uV0wssn3p9WyAueV0AjQJIRWaVIopNM2
         pWKrnrD34BT9TW151PxqkozONUeSTXw74bHEGhSnb0ycrYhFDtzi3C8pIj4FHetek530
         6/ZA==
X-Forwarded-Encrypted: i=1; AHgh+RoDRnmh4mAV1OMEJ7ecK0Xcii/mIW2TnL9X6VWQlavJ36Dau5DutKKuPszkW6E6N4Dy0LhPckMSasw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5x5Gy6+LZLGEgAnaV+NE/PsxbZJVk/RQP1LNSGV6mezvNalJk
	JhFVDfBEdPPRMYgbEbM4vKftn40wzHDyD5J0WHYDPscuGGp9t9JyKUl0MMDhSA00Sc0oWfu9vA+
	R9NzouW18EMLHqWiocB+iGcsiySkcer8=
X-Gm-Gg: AfdE7ckpWqFxcRtWEGFQy5Ol5D2CXe/VvJ1fRWhGNIUXTN1ZLq5mrM6ZhEgB3SyUnlH
	BCOh6aGZGH4C9hy3RFVWMXODbK7vWg1YYH5xYB3E+2/ZBqWojKK7Moy7/pYKSTkSSEeJDUQOedF
	CHZM1TEAkFJIgnIp4M8T3BzFLFpEg9OFPRIBaBWpQ/Y4eiZy39voAWqMQzIttZNHlzKJ16niPJR
	0a1IQQtfGITeCCV5lODCkQf9vscFWGdxmRmcTmuBBUU21aBoJ5D6FdYcAd90Ux2xWcl2Nt+aMOy
	ckmsMXt5OA==
X-Received: by 2002:a17:906:9c86:b0:c12:3bce:c3c4 with SMTP id
 a640c23a62f3a-c123bcecceemr304395966b.3.1782707748954; Sun, 28 Jun 2026
 21:35:48 -0700 (PDT)
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
Date: Mon, 29 Jun 2026 12:35:37 +0800
X-Gm-Features: AVVi8Cc7WMGsN5EZIx98cF3b5b5_LIlSupnHTYu_LzUQSZvj-OZPI5GWvv7BNrU
Message-ID: <CAMpQs4LJkaLOPyiATEdEqFNNooUue7j6uJfCA68f0TF1=Qp2fQ@mail.gmail.com>
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

Sorry, the `allOf:if:then` block in the previous email was incomplete.
It has been corrected as follows:

@@ -55,6 +68,24 @@ required:

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
+else:
+  properties:
+    spkr-en-gpios: false
+    hp-ctl-gpios: false
+    hp-det-gpios: false
+
 examples:
   - |
     sound {

>
> If these stay, because I have doubts. spkr-en-gpios sounds like
> enable-gpios of each speaker, so not suitable here but should go to
> individual speaker codec nodes.

About this, please refer to the previous email.
>
> Best regards,
> Krzysztof
>

--
Thanks.
Binbin
