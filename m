Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15BB1B14F7
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869577; cv=none; b=cJDwcc9PXOmVCpLqzIehHjLU1v7RmFLa4cIjN2b4tNdHb/2RFsCd8S/nyc/x81XzGx4FWfg2raRTwhz64pEksLpboQu9EFiV+TuidoLuz4wY3DHfC8j46XqIlDFfBC2K6Oo/8MZAsP4t1r7CJl9XxivKk552saisPsNyPX9+Cus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869577; c=relaxed/simple;
	bh=qn1o8Intnk0JCIq1CUGzHv/zXzVk+ma3u3ksckHSnV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0jk+0k/inUp0pNhhj1s2yi8rrRZmnPvd8tGiJdgGb7g8bE3TJSEzCk/9hUmnfZNTF8sgm7sSo1Y284m6x4gW3hrhmIfcIGwEJqRUbx4f1Cj6M7qdZHsoTs2V0uVqVz15xq/O+wCfm3Sv7J1L73iyMhOQXOkUhqohDC+DX/XoMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxmK3ykd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxmK3ykd"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365aa568ceso3293927e87.0
        for <loongarch@lists.linux.dev>; Mon, 09 Sep 2024 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725869574; x=1726474374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKbJpq6YIA11aEfz21wae3H60/ixEHXlJ4hbELPq0J4=;
        b=mxmK3ykdWwT/Bl58u4nJFuJs7dtJvJ1KH+Aqp/jamaLvyIxWJKjmwuHsXq7LBsoxYd
         uH8DC2tGgj4NvdSx1ngMZq94Z7PBdZfu3ZgF3ccO0MLOx7a21+H1QADTeeRiy5/7Zu2L
         6ah5zAetmOcDdkVtEJn78FSHWN9yVum9h05bJAyq3h+DcRmkWzG8Q2F49vASf/BDftWL
         PUFEXEiAjILR0Z6/TRsWnYsq8UtdtyU++RB7DEZgQohXgrGHzXva93oerImMeUwak455
         Npv1kU6oLhLUoEIhM6ra8U+Q+D5VvLIZmqTavWe4XUn6CvXhGNGfL+pF38/HRkhPVyDB
         lSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869574; x=1726474374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKbJpq6YIA11aEfz21wae3H60/ixEHXlJ4hbELPq0J4=;
        b=RufiVHDrUKonFsQgjQtSAikOJIpYkm4dbsQGQ3uPaf+6SSlvaQgib75KaOpxC8P5ck
         yIhp2N5uBP3eldKQd8GomVzapdUV+mabE/r+rMrsKAIR6/tE/1lDPnetWdPIDl1nnaLD
         I/9bhrfSgsVtPJmekRV3T0hnKB4QDWVhNs8No9LcY4GUMrfX++UBJJgPILE6bl5AUwL1
         ogx2x92KjODqnmfGFa6scVErrgv9qKBeqjcMxLUC6b1aAlhzrlFc1QEzyc/dB8ScwqI1
         g2ve0HY7ZFB6ArcivepWnAyDjJao/qJl8niu/GJskKw/KB6O530SLAl4+xG5Oe10IeqR
         qaBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp7xlGe8PFvu/maAaZSf8eTy81DRZ8oHz9cpwuzkQ1mMCMt+Yok1jcwm5cFz0Eht4Qcx2v+5Sky3s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJLQJ9WtCyIcRqayFFdzYVPEeiO+yLY000iQ6PLynpduycZIIZ
	/5GD47g2DCocoEgZSmrvdOoBbw0Uvj70QRjAE/f25Tst/u14wzKy/nAdulQhINbelYNgsepB8AY
	xA97s6sDsaftPU8wYeG94ehwE8aM=
X-Google-Smtp-Source: AGHT+IHnQ8xuztnsBBgMvF4HoqhobltRiRUWVc47gSpztUAjtDauIHerV4oHBCZhp65S/wW7OsWE+NRnD31fY1WpNhQ=
X-Received: by 2002:a05:6512:1245:b0:536:54bd:8374 with SMTP id
 2adb3069b0e04-53658818949mr5167330e87.60.1725869573576; Mon, 09 Sep 2024
 01:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <e987b0beabba169577c8923557690984f226b29b.1725518229.git.zhoubinbin@loongson.cn>
 <zes7kfwmz57lhyfvxuyk64n7eykb52txxatbqgqnue7e3yab7g@d7cg7ql4gyl4>
In-Reply-To: <zes7kfwmz57lhyfvxuyk64n7eykb52txxatbqgqnue7e3yab7g@d7cg7ql4gyl4>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 9 Sep 2024 14:12:40 +0600
Message-ID: <CAMpQs4Jwms+P7Uu-N1koT8WYKW8KCdMoo7pkPkdaO2aY7TAD+A@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] ASoC: dt-bindings: Add Everest ES8323 Codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your review.

On Fri, Sep 6, 2024 at 4:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Sep 05, 2024 at 03:02:14PM +0800, Binbin Zhou wrote:
> > Add Everest Semiconductor ES8316 low power audio CODEC binding with DT
> > schema format using json-schema.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../bindings/sound/everest,es8323.yaml        | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/everest,es8=
323.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/everest,es8323.yam=
l b/Documentation/devicetree/bindings/sound/everest,es8323.yaml
> > new file mode 100644
> > index 000000000000..0450d0f49d03
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/everest,es8323.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/everest,es8323.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Everest ES8323 audio CODECs
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: everest,es8323
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: clock for master clock (MCLK)
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: mclk
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
>
> No audio-graph-port? Are you sure? It looks exactly like
> everest,es8316...

I checked and they are indeed very similar and it seems I just need to
add to everest,es8316.yaml instead of a new file.

Thanks.
Binbin
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#sound-dai-cells'
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +      codec@10 {
> > +        compatible =3D "everest,es8323";
> > +        reg =3D <0x10>;
> > +        #sound-dai-cells =3D <0>;
>
> Make the example complete. Assuming this binding stays...
>
> Best regards,
> Krzysztof
>
