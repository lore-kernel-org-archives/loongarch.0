Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D1628EE
	for <loongarch@lists.linux.dev>; Fri, 13 Sep 2024 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726215962; cv=none; b=jQoID0gTP1m/2TFMxXD7l13ooeLsxtYaiL1l94RUM3hGaLdwyMUMn6Zw6f+cLJOtiIh0yC7iDfJaVPNwWeTDj8UJKhBI38LT07fkhZQNuYDnMu5x5yahtiAcNznSHK9gWKY2yDO0QGcNQrzv2Sa3TH8ZE7yfdbq97QAd2v+sefk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726215962; c=relaxed/simple;
	bh=7a7WJ2r0b6hRO6CMep05vOcO8PK2KvNTPoIJIsnqAjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5OnXzqAOySCC5XZoFw2fI4+lVwsWeHIWV9D+GoV0ptrBbE5z3wlM2KLKjqlRVIxweSq2nB7a/HvzruFtactdMXqUvymIsLHh5t9kox7MSYmB8QqAJiGHcdc0BXJp2tmeOjHNcweaR4uj5Cpq6gcZGInaeh3tjLL3qjrjHcd5FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVn9cBn4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVn9cBn4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c3400367so563000f8f.2
        for <loongarch@lists.linux.dev>; Fri, 13 Sep 2024 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726215959; x=1726820759; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1U3m6JcetIPiZdTK0Yjh2Sbb/vfGdhku0JpIn5i9K0=;
        b=KVn9cBn4CP81apACOr1/1nIsOhbjBtlAHR/sp3r8jzbB3pTcMz+OsY1UxMSeuABVkL
         IhoP3YVvSYVuktU69b/B/NZHObiaGAh5Fq3vSVGjCY/Ki/u2SgFdL6PgxQ4ZLYEuBcKl
         ueUOt44eq02g41G9JHI87GCxP41Bt/gQPT39sdINHZKNZ+xwIq2mdfizbPhqma9gC97p
         LRD6tpyw5euFBMlieIvoT6waQDcJD43A7K8vbaL9DWSonZnXZPc6IdDmAFoB1UL0j7rC
         nMuPI+hDiwmCneCTqD2cA0NwUvyrkgLt0yspq6KQ7mKaSkY9Xou2jr6Jc/+STPXcFl/V
         k33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726215959; x=1726820759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1U3m6JcetIPiZdTK0Yjh2Sbb/vfGdhku0JpIn5i9K0=;
        b=E6cHUeYd+wvBSzGZ+YJ1P10pM1DGP3QK6sDE9LV+bHZbYRxK1Bw/CT6395a/OhXYxk
         O+HvwVe/Vl/OFrZSOsEG7XiJtVk1nMWk6yHK9SqxcBXNe65YS7rIsJcnSfqpf3q0OawQ
         dQD+8q+bl0o/9Q98CAZA/K6q5f716QgNgJsaR/ch4S9ehqyYmKMmvB35wWaK7HDW+Cda
         UcbMHm1Qw9RmJUBBI57WCBY4dCChiHAk59ZmS0e+UFhI/BqH8T7m2yiQ0lHztiJK/eg+
         4XmuWV0QMbo+fhnEjeI9O1ous2a+Bgts25JUUWmrz25Vm3ZHc87QKiHAiXneVJqXT/mW
         cN5A==
X-Forwarded-Encrypted: i=1; AJvYcCV18aXtwNqDtwTFM83ymYnhLR2pm8IlLBdtM8rwLlCI3zh2LCeFbfzrGIIO8VWZMZL2rMExRpaX/XU=@lists.linux.dev
X-Gm-Message-State: AOJu0YySrgyD9ivVjSuxGCCFSOCbqefYzgEN6xVhVDsXFMb/tyykPuuF
	vSHiI2V2P8L53j1dtNbygWLsQcyG12Q9AHzZnQowft1bsnck6YTYUbPmVo99cA4EId99u3hP08/
	VjawFuwjXG+du2wol2JKN2pgh630=
X-Google-Smtp-Source: AGHT+IEwVBE2KEcxHxmWBTHi12u4QfNYS1NaDUvGBrJYbk+9ILHQxGC0dT6D3EuYJE8DAuuQmPEfh3hUAIl1Qx1j1mU=
X-Received: by 2002:adf:ee47:0:b0:371:8e3c:5c with SMTP id ffacd0b85a97d-378d61d4d8dmr1733060f8f.7.1726215958909;
 Fri, 13 Sep 2024 01:25:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1720516327.git.zhoubinbin@loongson.cn> <63a540e93147eff5e7c942133c462530689f707c.1720516327.git.zhoubinbin@loongson.cn>
 <awru62rcjkkb6n4sa2abmilzmu5ddxiv5s52tnkm2jcwi4isnt@djpzrj6asxok>
In-Reply-To: <awru62rcjkkb6n4sa2abmilzmu5ddxiv5s52tnkm2jcwi4isnt@djpzrj6asxok>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 13 Sep 2024 14:25:43 +0600
Message-ID: <CAMpQs4K+hx36TpYupByGaVcCh=jFsOKvD584QJQs=Z8Qt3p6EQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] pwm: Add Loongson PWM controller support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe:

Thanks for your review.

On Tue, Sep 10, 2024 at 1:00=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Wed, Jul 10, 2024 at 10:04:07AM +0800, Binbin Zhou wrote:
> > diff --git a/drivers/pwm/pwm-loongson.c b/drivers/pwm/pwm-loongson.c
> > new file mode 100644
> > index 000000000000..17ab2a2f48ad
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-loongson.c
> > @@ -0,0 +1,285 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Loongson PWM driver
> > + *
> > + * Author: Juxin Gao <gaojuxin@loongson.cn>
> > + * Further cleanup and restructuring by:
> > + *         Binbin Zhou <zhoubinbin@loongson.cn>
> > + *
> > + * Copyright (C) 2017-2024 Loongson Technology Corporation Limited.
> > + *
> > + * Limitations:
> > + * - The buffer register value should be written before the CTRL regis=
ter.
> > + * - When disabled the output is driven to 0 independent of the config=
ured
> > + *   polarity.
>
> An info about possible glitches and if a period is completed on
> reconfiguration or when the PWM is disabled would be great.
>
> Also if there is a publically available manual, please add a link here.

The descriptions related to our PWM controllers are in the CPU
manuals, e.g. for the Loongson-2K series CPUs. but unfortunately we
only have the Chinese manuals right now, so I don't have a link to
them here.
>
> > + */
> > +
> > [...]
> > +static int pwm_loongson_apply(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> > +                           const struct pwm_state *state)
> > +{
> > +     int ret;
> > +     u64 period, duty_cycle;
> > +     bool enabled =3D pwm->state.enabled;
> > +
> > +     if (enabled && !state->enabled) {
> > +             pwm_loongson_disable(chip, pwm);
> > +             return 0;
> > +     }
>
> You can also shortcut if !pwm->state.enabled. Something like:
>
>         if (!state->enabled) {
>                 if (enabled)
>                         pwm_loongson_disable(chip, pwm);
>                 return 0;
>         }
>
> > +     if (state->polarity !=3D pwm->state.polarity) {
> > +             ret =3D pwm_loongson_set_polarity(chip, pwm, state->polar=
ity);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> Together with the shortcut above this is buggy. Consider:
>
>         pwm_apply_might_sleep(mypwm, &(struct pwm_state){
>                         .period =3D A,
>                         .duty_cycle =3D B,
>                         .polarity =3D PWM_POLARITY_NORMAL,
>                         .enabled =3D true});
>         pwm_apply_might_sleep(mypwm, &(struct pwm_state){
>                         .period =3D A,
>                         .duty_cycle =3D B,
>                         .polarity =3D PWM_POLARITY_INVERSED,
>                         .enabled =3D false});
>         pwm_apply_might_sleep(mypwm, &(struct pwm_state){
>                         .period =3D A,
>                         .duty_cycle =3D B,
>                         .polarity =3D PWM_POLARITY_INVERSED,
>                         .enabled =3D true});
>
> After the 2nd call you left pwm_loongson_apply() early without writing
> the inversed polarity to the register space. In the 3rd call you have
> state->polarity =3D=3D pwm->state.polarity and so skip configuring the
> polarity again.
>
> I suggest to just do pwm_loongson_set_polarity() unconditionally if
> state->enabled =3D true.

I check code and try to do it like:

        if (!state->enabled) {
                if (enabled)
                        pwm_loongson_disable(chip, pwm);
                return 0;
        }

        ret =3D pwm_loongson_set_polarity(chip, pwm, state->polarity);
        if (ret)
                return ret;

Thanks.
Binbin
>
> > +     period =3D min(state->period, NANOHZ_PER_HZ);
> > +     duty_cycle =3D min(state->duty_cycle, NANOHZ_PER_HZ);
> > +
> > +     ret =3D pwm_loongson_config(chip, pwm, duty_cycle, period);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!enabled && state->enabled)
> > +             ret =3D pwm_loongson_enable(chip, pwm);
> > +
> > +     return ret;
> > +}
>
> Best regards
> Uwe
