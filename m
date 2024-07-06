Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF44481D5
	for <loongarch@lists.linux.dev>; Sat,  6 Jul 2024 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720256925; cv=none; b=sJQj1JAC6b9RFuZkEHUY4dkCsMC7cd/tklhqTUy9CJBU/3JsFbDgl1vG3WztJY5VRDULdjiwZGqMHY1gQezXtOKzRh4iSJaEIlTWTZQlkpTNV1Tynq1OEOPYxuKry6VAu3eC9BOZIuQ4lYRzaXs99CdQxADIkMJ64IpKo6XRD28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720256925; c=relaxed/simple;
	bh=fG6F3w5XsMlqbqQaRKmHuITZUAA7HSkYvoR9erwN8ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSNx9wrrxRSNg5G7+yHtwFJuiMGY33ug94bubYMunrr+aw02B+XMA2+bMmG0mHLsEFuUrntfsPyyaj7gB2km5ROSYAka+9mFVtdd0xD2SrORjYb/yzL6LiwSF6chzNa67J0wPGWTJj6S+MqnsIs/Z+U9zA5NgnK6uihDK9J8IS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbFA5xqV; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbFA5xqV"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e036eabc97dso2312275276.3
        for <loongarch@lists.linux.dev>; Sat, 06 Jul 2024 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720256923; x=1720861723; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvNcPTmqNxB21weQxooRmeGNUZ7Ly0Y/MJ1ArZkMpmU=;
        b=CbFA5xqVNgbnmtdw/pJdPdXCsWCdUld6y8UhseZNJo2St7ms4m0cgG4ZEP8IMz+ehe
         Kz6oYwvuvKKHEd9oJmz8KPlpWmzfS/1jAhT1gy3xGBDTyun4CpFPxOvj37+UqqFb3MCE
         k8UH2LeD2TRGqXDBy+5MuJlXkwhOBk0wTTN/FUM4DLtwpAXIlu6Pu3bI0alpEdF2G1Ue
         hAI6TzmU6Eid89Mo/iJGFgLYECnL+BWerszawRXLcqaefANwq+ZVsB+jsT3jeQQPlc9E
         WioIn1Xt+sa6a6Z8Ku6Nfro8CCuC3nrH92L8xszV56L5oZe0MFAHPuUoWuwmzvUILGyA
         B0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720256923; x=1720861723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvNcPTmqNxB21weQxooRmeGNUZ7Ly0Y/MJ1ArZkMpmU=;
        b=jgFjwErzDHoj/1b3+/zt/0TfacKR3vPrest4Bvu0cn7NhTL5A6dBsgY6d77IcdsZXS
         m9zXfaHNP4GsMC555rbeonNutVxho82C5DDzeB5Jhui0yjajLSq9U4eKQJSltrTneFCm
         x0vmi94SfNNXCrysZK7s5fpN+DK4tiICpl9DU3IPvNW8jHqtMnLfriNbH+oU8dzFGvyV
         tbTaEqPkoxK3BRrZ0m8WdNxgMhm2XbasZr+D0nBO1lEWs9vMo92EOF66bVd2/4krKKV9
         BqOAgdRs2HdA/7uXvQRj5CRXnd33ETLVCRXqKk2unEcc4dm99aLP8YwoRI+6EWyMClzh
         U1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlZJU91PprpiCHXu7tGdPh/ZfpVjneeBRZq1G54pIBxjcOeAN0xppPdd4ezd1TY9DbzkBUxJdLxearp9Wo031/hc0cQL8FUkx+
X-Gm-Message-State: AOJu0Yzi+N+EM9LQwSHt1LJMamvB7M6VVDjavvFTxziJgW5z6rckgaoB
	Uz+uh1QiirIg2JiiFfROa0wMEU0froxPkPKjATFAlYuPudY/xpy95MjiNOgPksoH8mc4bZ9+VBm
	FV9IbAVojcM4Rqt/XBR7ItfFhXFw=
X-Google-Smtp-Source: AGHT+IFE3DfCqBS0dBLUuf7e4wOAB+PSbhsnQbFKEqOsySRZmgtE3ogKqcORJbpXpQ7hTP37DJbqioZiEMx0ltxd/Eo=
X-Received: by 2002:a25:c70e:0:b0:e03:abdc:f2a0 with SMTP id
 3f1490d57ef6-e03c1a05b56mr6735108276.60.1720256922772; Sat, 06 Jul 2024
 02:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1716795485.git.zhoubinbin@loongson.cn> <23d08fa45237efd83cb9dd51a259e2c980f01b3f.1716795485.git.zhoubinbin@loongson.cn>
 <b2lyte7dtrdxxoj4rwwrxbt5myc3td7v3psus7h36qc7dp3thh@czfp25bferl4>
In-Reply-To: <b2lyte7dtrdxxoj4rwwrxbt5myc3td7v3psus7h36qc7dp3thh@czfp25bferl4>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 6 Jul 2024 15:08:30 +0600
Message-ID: <CAMpQs4Lo55VhFCNKFxjdA2zMt8GdMTo4sn4BXdy8Nr+kq2OfvQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pwm: Add Loongson PWM controller support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe:

Thanks for your reply.

On Sat, Jul 6, 2024 at 5:26=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Mon, May 27, 2024 at 03:51:12PM +0800, Binbin Zhou wrote:
> > +static int pwm_loongson_apply(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> > +                           const struct pwm_state *state)
> > +{
> > +     int ret;
> > +     u64 period, duty_cycle;
> > +     bool enabled =3D pwm->state.enabled;
> > +
> > +     period =3D min(state->period, NANOHZ_PER_HZ);
> > +     duty_cycle =3D min(state->duty_cycle, NANOHZ_PER_HZ);
> > +
> > +     if (state->polarity !=3D pwm->state.polarity) {
> > +             if (enabled) {
> > +                     pwm_loongson_disable(chip, pwm);
> > +                     enabled =3D false;
> > +             }
> > +
> > +             ret =3D pwm_loongson_set_polarity(chip, pwm, state->polar=
ity);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (!state->enabled) {
> > +             if (enabled)
> > +                     pwm_loongson_disable(chip, pwm);
> > +             return 0;
> > +     }
>
> Given that the configured polarity isn't relevant for a disabled PWM, I
> suggest to swap these two if blocks. However then you have to be a bit
> more careful for the polarity check because otherwise the following
> series of commands yields wrong results:
>
>         pwm_apply_might_sleep(pwm, {.duty_cycle =3D D, .period =3D P, .po=
larity =3D PWM_POLARITY_NORMAL, .enabled =3D true});
>         pwm_apply_might_sleep(pwm, {.duty_cycle =3D D, .period =3D P, .po=
larity =3D PWM_POLARITY_INVERSED, .enabled =3D false});
>         pwm_apply_might_sleep(pwm, {.duty_cycle =3D D, .period =3D P, .po=
larity =3D PWM_POLARITY_INVERSED, .enabled =3D true});
>

Yes, we'd better make sure pwm is enabled first.
I will swap the two if blocks.

> > +     ret =3D pwm_loongson_config(chip, pwm, duty_cycle, period);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!enabled)
> > +             ret =3D pwm_loongson_enable(chip, pwm);
> > +
> > +     return ret;
> > +}
> > +
> > +static int pwm_loongson_get_state(struct pwm_chip *chip, struct pwm_de=
vice *pwm,
> > +                               struct pwm_state *state)
> > +{
> > +     u32 duty, period, ctrl;
> > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> > +
> > +     /* duty_cycle =3D ddata->duty * NSEC_PER_SEC / ddata->clk_rate */
> > +     duty =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_DUTY);
> > +     state->duty_cycle =3D mul_u64_u64_div_u64(duty, NSEC_PER_SEC, dda=
ta->clk_rate);
> > +
> > +     /* period =3D ddata->period * NSEC_PER_SEC / ddata->clk_rate */
> > +     period =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_PERIOD);
> > +     state->period =3D mul_u64_u64_div_u64(period, NSEC_PER_SEC, ddata=
->clk_rate);
> > +
> > +     ctrl =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CTRL);
> > +     state->polarity =3D (ctrl & LOONGSON_PWM_CTRL_INVERT) ? PWM_POLAR=
ITY_INVERSED :
> > +                       PWM_POLARITY_NORMAL;
> > +     state->enabled =3D (ctrl & LOONGSON_PWM_CTRL_EN) ? true : false;
> > +
> > +     return 0;
>
> You didn't test extensively with PWM_DEBUG enabled, right? You need to
> round up the divisions here otherwise you get strange rounding results:
>
> Consider ddata->clk_rate =3D 1594323. When a state with .period =3D 20000=
 is
> applied, LOONGSON_PWM_REG_PERIOD is assigned 31.
> Calling .get_state() in this situation gives .period =3D 19443. Reapplyin=
g
> .period =3D 19443 results in LOONGSON_PWM_REG_PERIOD :=3D 30. Iterating t=
his
> further yields:
>
>  - .period =3D 18816
>  - LOONGSON_PWM_REG_PERIOD :=3D 29
>  - .period =3D 18189
>  - LOONGSON_PWM_REG_PERIOD :=3D 28
>  - ...
>
Yes, I'm very sorry I didn't do extensive testing with PWM_DEBUG enabled.
Here I do need to use DIV64_U64_ROUND_UP().

Below:

        /* duty_cycle =3D ddata->duty * NSEC_PER_SEC / ddata->clk_rate */
        duty =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_DUTY);
        state->duty_cycle =3D DIV64_U64_ROUND_UP((u64)duty *
NSEC_PER_SEC, ddata->clk_rate);

        /* period =3D ddata->period * NSEC_PER_SEC / ddata->clk_rate */
        period =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_PERIOD);
        state->period =3D DIV64_U64_ROUND_UP((u64)period * NSEC_PER_SEC,
ddata->clk_rate);


I'd also like to ask which tests I still need to do to make sure the
driver is more complete?

> > +}
> > +
> > +static const struct pwm_ops pwm_loongson_ops =3D {
> > +     .apply =3D pwm_loongson_apply,
> > +     .get_state =3D pwm_loongson_get_state,
> > +};
> > +
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
> > +     if (!has_acpi_companion(dev)) {
> > +             ddata->clk =3D devm_clk_get_enabled(dev, NULL);
> > +             if (IS_ERR(ddata->clk))
> > +                     return dev_err_probe(dev, PTR_ERR(ddata->clk),
> > +                                          "failed to get pwm clock\n")=
;
> > +             ddata->clk_rate =3D clk_get_rate(ddata->clk);
> > +     } else {
> > +             ddata->clk_rate =3D LOONGSON_PWM_FREQ_STD;
> > +     }
> > +
> > +     chip->ops =3D &pwm_loongson_ops;
> > +     dev_set_drvdata(dev, chip);
> > +
> > +     ret =3D devm_pwmchip_add(dev, chip);
> > +     if (ret < 0) {
> > +             clk_disable_unprepare(ddata->clk);
>
> This is wrong. You aquired the clk using devm_clk_get_enabled(), so you
> don't need (and must not) care for disable.
>
Sorry, I had some misunderstanding about devm_clk_get_enabled(), I will fix=
 it.

Thanks.
Binbin
> > +             return dev_err_probe(dev, ret, "failed to add PWM chip\n"=
);
> > +     }
> > +
> > +     return 0;
> > +}
>
> Best regards
> Uwe
