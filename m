Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B95E1EE7D9
	for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260941; cv=none; b=UQgWtNBZ0o7M+x6v+gmANiqrNHKFDzBQgOlhEgmAYWx2BEeBeyymE7Ec5EDuzg6YO4u0iQeKvjKxdUslIU3knAZ9OwkuLa98YHxpva7vvvBOVbUl5oVXN6bq04SxLMBdONoCGJpxXdp9qlfhPw8KxZGe/G4sY391jgtmW3nD2HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260941; c=relaxed/simple;
	bh=+uHQKTIzq5GE3CWvKvtfbS7YT9eH9p4Dx3wyUgQGlJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtnRuMj/ACH2WZohtO85VoRWQ9+4pXJoGQns8wNGGcdasKxetB5+qpXwQ0obD2uiI43XptwNEsUwATLP6SlxdXY8sm106T8mVAPO/Fj6hORSZztlnXUDie+C2ZFSka4+Lfuemv9i2maebE5gR6RRzlzU8CXeKWkj9d99sU/XpTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Li8dFZrb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li8dFZrb"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab771575040so1011103866b.1
        for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 00:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739260938; x=1739865738; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZFoIS+87CGERMiZGAfXdO21tG9EGSdnHyZy8LxjOHs=;
        b=Li8dFZrb8W2Eq/pBVVcrJKsBthr088NQUobMZtKwIUlQK1Sj1QSr/NTZ7ZUJflcweu
         AEdiMG2qotW4NlDCLPjpzKns9fm5Plqq1Ybu1npMwJSoJGux8r0kKuE7Q4dVsgSVdVri
         QbN521fabejxgy6G9OVvWsA4MK6B1o87tuL936XZcQtjGKkekU+j+QXapjCEebnCPPp/
         0UkF5kAPNhyTfP0SCh4b5I3BOBdiXKnHklBWCFcIlW9bbe+GfbkuIXhDiNK8qJyh1JbS
         1Stvo6gUTh6rEVcofbe9ZE/EDqC//ix/LGeYI1KB1JxPww9V32zFCxqVpIUISdIeh0oj
         Tf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739260938; x=1739865738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZFoIS+87CGERMiZGAfXdO21tG9EGSdnHyZy8LxjOHs=;
        b=bE0Ws8hLrI66mLX9kZpfFI3YY5Ylnz//B3rkVYuIfQuU9jPpl7vzqP186ZjAhn56Er
         sUkIq0mxTUvgcUXkFZBoOyjtqw58uxGMxYl8pxP9HCW0Cuf2Feg1LSYDFxhJfq5zm5gY
         D6rLJ08W1peHINlb4Q0LhNQXPLAXhcRSfmdl8XS4mAvgA4lB8KQ5LYdWQkyGu33C3RQ9
         70CSJfRhFDZZlvcDrGeuDflZmfwD2CD9+aAZrYNO7JITIm4xHxZB9cD5T3GrUZ6jBqoQ
         6TBGe+2mavNIihxJX8MQRehrSQRmFHYx07DaCR3Db1vjX/GXsdN/GJyUOxT/+XBPOeSb
         ZsDQ==
X-Forwarded-Encrypted: i=1; AJvYcCULaQc+n+vSL/CtHmHVWliP38dP9I8AGjj07bdOmpPfC5hhDJnginuQ6EDNppRi9sTiKRVPAUl4tn4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk7ptPLLbpDWFRlQBwbI9epEz2c7m542HV6p2oTyeSq+7NcdWD
	F33wNSXNmzllUcQAnZ5pzRS6MJyV1QLeLSAhEgP4wmH1p1VYKfuQ8aYQy1qP7wHtKnbEeO14iTs
	4JhvocaLoaqhgjwACNu/1h++R7cI=
X-Gm-Gg: ASbGncvUOlcNbseURk/5UeSm1R0prgRRrWF1ilVpYiXmHZuq7jjqdiBKyFgOoIlYf+j
	afOHDpWF3Wlx2pKGuQI0wk1jcWqOcIew3wY/uZ3xq/ab0UGSqX8FJ/79UV2MzyCoTyA/r7b2JIU
	A=
X-Google-Smtp-Source: AGHT+IFO9b+MEF0Zijlm2BseQCRKpeRg2dYdZFviAmzJUl45KpyJaKlW+OmrTyKJvhZxgelfvb5X9XS4JahSlUZmBvk=
X-Received: by 2002:a17:907:1c29:b0:ab7:bd8c:3501 with SMTP id
 a640c23a62f3a-ab7db35bf15mr230744366b.18.1739260937390; Tue, 11 Feb 2025
 00:02:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1733823417.git.zhoubinbin@loongson.cn> <be76165d1ab09ec41cdfd4e5fbdae1b415f516b9.1733823417.git.zhoubinbin@loongson.cn>
 <obegtfup7f6w6erh4arubk2fkk2wrcum5frs5kbqa4uniexmr5@6uti3d3hv7np>
In-Reply-To: <obegtfup7f6w6erh4arubk2fkk2wrcum5frs5kbqa4uniexmr5@6uti3d3hv7np>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 11 Feb 2025 14:02:03 +0600
X-Gm-Features: AWEUYZnbIwrCK7szyLgcqOJLyhnXo71Bav9CKmNsq2gv-heSYyMSlwosE83h9Qg
Message-ID: <CAMpQs4+nVSorAeR92F22T5dnzyh1h4BDR6UqrZbTSUhEyWbGyA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] pwm: Add Loongson PWM controller support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe:

Thanks for your review.

On Tue, Feb 11, 2025 at 12:26=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ke=
rnel.org> wrote:
>
> Hello Binbin,
>
> On Tue, Dec 10, 2024 at 08:37:06PM +0800, Binbin Zhou wrote:
> > +static int pwm_loongson_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +     struct pwm_chip *chip;
> > +     struct pwm_loongson_ddata *ddata;
> > +     struct device *dev =3D &pdev->dev;
> > +
> > +     chip =3D devm_pwmchip_alloc(dev, 1, sizeof(*ddata));
> > +     if (IS_ERR(chip))
> > +             return PTR_ERR(chip);
> > +     ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     ddata->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(ddata->base))
> > +             return PTR_ERR(ddata->base);
> > +
> > +     ddata->clk =3D devm_clk_get_optional_enabled(dev, NULL);
> > +     if (IS_ERR(ddata->clk))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->clk),
> > +                                  "failed to get pwm clock\n");
> > +     if (ddata->clk) {
> > +             ret =3D devm_clk_rate_exclusive_get(dev, ddata->clk);
> > +             if (ret)
> > +                     return ret;
>
> Error message please. Also please make all errors start with a capital
> letter.

Ok, I will do it.
>
> > +             ddata->clk_rate =3D clk_get_rate(ddata->clk);
> > +     } else {
> > +             ddata->clk_rate =3D LOONGSON_PWM_FREQ_DEFAULT;
> > +     }
> > +
> > +     /* Explicitly initialize the CTRL register */
> > +     pwm_loongson_writel(ddata, 0, LOONGSON_PWM_REG_CTRL);
>
> This disables all outputs, right? Ideally the driver takes over running
> channels. Consider the bootloader initialized a display with a splash
> screen. Disabling the PWM might disable the backlight of the display
> which hurts the visual experience.

Indeed, there may be similar problems.
I don't have similar hardware at the moment, and just in case, I think
it would be more appropriate to follow the pwm settings of the
bootloader.
I'll try to drop it in the next version.
>
> > +     chip->ops =3D &pwm_loongson_ops;
> > +     chip->atomic =3D true;
> > +     dev_set_drvdata(dev, chip);
> > +
> > +     ret =3D devm_pwmchip_add(dev, chip);
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "failed to add PWM chip\n"=
);
> > +
> > +     return 0;
> > +}
> > +
> > +static int pwm_loongson_suspend(struct device *dev)
> > +{
> > +     struct pwm_chip *chip =3D dev_get_drvdata(dev);
> > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     ddata->lss.ctrl =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CT=
RL);
> > +     ddata->lss.duty =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_DU=
TY);
> > +     ddata->lss.period =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_=
PERIOD);
> > +
> > +     clk_disable_unprepare(ddata->clk);
> > +
> > +     return 0;
>
> Is this needed assuming that before suspend the consumer stopped the
> PWM?

Actually, I don't quite understand the problem you're pointing out. It
seems to me that the register and clk operations are required
regardless of the state of the pwm.
At least from the experimental results, the logic is now as expected.
Of course, I may be missing some critical information.
>
> Best regards
> Uwe
>


--=20
Thanks.
Binbin
