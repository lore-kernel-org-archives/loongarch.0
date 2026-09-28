Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D706B3B95EC
	for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 08:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583438; cv=pass; b=SGQpLBnp3y+XNjwDqtYubAe2vOW1mbZoYMwJh/NiN5jHUW6lREhPo6XXFsiCP0VpspxWrDzPcuAiYBHlTSQVscKMoMKOZjXiYo3Oj00w5p7kJyicNcTI0ax5XBJateGl6vA7fxfcM+y4a4lsjowxb+YluihYQTIVFM3mWhscqSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583438; c=relaxed/simple;
	bh=aYwJC4BScg6xo8RaWoJ6AsT9nwuM3VqyxukWf+p+5lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7fFTYQmvhSmhMqZoTD49/xtjj5kPZL023aSmZicWJPzG8NcBDwdYfGuzlNyeHEGM2Ah21+7uzpycCPf2UHTx4eM0TnQYpbxQZ3q2QMqLh54yhUGUx0wM3lMoaHY5Vh5CN4kG10MV4Q5ggYW1ATkf2/UwjCAqdKB+psBsNg53R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bdd3fM9z; arc=pass smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bdd3fM9z"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso4475583a12.0
        for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 01:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790583435; cv=none;
        d=google.com; s=arc-20260327;
        b=Vk/2XI9yX2RNt6oW7nN03cRH79evTYsnnHVjVmAEfWkCAWIFWmf8lQmGhG1Mg219Ns
         rXYUylwK1RfDJ+rDEcDBUuE3Qc0VY+4wyul7rjy5jxUX6MSWzNPWMmZX1uYUWN/nU7zF
         QjsbgiWf6AZVNcMivrp7e1HD1qHIQikr3dDx3WXUqb2AwvmVWtSjoYO2zAf/fmFJtcDw
         PJGZnW2Yv40lcnc3bpzJVJxwNVupGNIFVdRsLbJVskuhkiUQ4Q8dTVulpZOd4z8VHKCr
         3ZPnSK882qFhqXkIQfhP+gV6DelB6tIhB5dWVbn/T988Ok3JWBB6CQmzobH6NP/lJJfX
         VypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x52vdN3RGFH8b7Z3g2Hq5cceezp96zx3/fKU5lU+Vhs=;
        fh=z1o2PFAVKbaBzOd1GVVi4az0uaF7+tYUGG+iiYwMVcY=;
        b=DGrWXAc9YOQRrfUFzTnSuo7zM92hWxTyM4JGtfXNi5PoBq20FRWT8Mnq7mkAI3XJOb
         Z1InxX4fjUVYEjTcSvL9XLO3mUMRWzj1U7wJ8Lax17g3K6huaCzaX3fCW5UblZxvOni9
         khptKBqw8O3mdzbWhCdi3EZz4NcvW/bHzgUAeb/Rzjkq63cx15vmoXa6dAt/GU9HvCFC
         VzLDDwH+4DyVmpbccv5soAHwfhkttlViQNDFXKh/rC+6IZzbMiXaxyCS4IAMeQBq2f1l
         NxdttuX8SFPgxqGcE5hbRGtKx/Er536WtObKdMcJXzSX2KOWs8uZSGXVtIftg6jb0355
         vvNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790583435; x=1791188235; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x52vdN3RGFH8b7Z3g2Hq5cceezp96zx3/fKU5lU+Vhs=;
        b=Bdd3fM9zbHkvLHvnK4MhmTzYDYWV4Nssp4K39rdyf/PEIFmZHH2fdzOsxQFu7HmqkO
         OKlUCROYhGB5KdshCAHrYl90GmBsyWS/TQB467Rf2NTjkvyypM07C5LYAvhf1bHxtU69
         NM6dzIi3CM+/PlIbr/qzYWILU4Xxea+PifI4g850taDb3QjjkI2c4JV8gzQqNU7BIQyz
         /G4B9u/rYeewqF2M6GJmxliX/hoOWLmVrF9xs5zCP6s+/QbjWddsx2tIRp0egUrLt/vP
         E1/wvR3V3YyFy7D8VjzlDztyGHpL+kySUQHD3XzS2E2wOLZagplu0Q+VKRhasIN0ZlD8
         8NAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583435; x=1791188235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x52vdN3RGFH8b7Z3g2Hq5cceezp96zx3/fKU5lU+Vhs=;
        b=MGYR+t/3kkgJU0rfeE73swtBp/gaFS+/qOSuQ/0qPe6ge+3fs54YhweAlPDBMXdhJV
         7Gf3020laV5a388PyFJ1ffIsIz8AEimkFQhtKRO9NEM6biOCmVSK04C4mB8mMKrQO39l
         Lc2XOyw9W5eti4BlzzdY9w8SGP8dijbVlRcFtlhWYwrPEGm+l7jIMrk2CVmKfeMpxDUY
         NYQrJfvkgklxyFzJjSBihTeq8zWcZMmmqIVYjzG97aL5LqW60ojdRB5nEtnTkK1uvffm
         0NdqvxvyTGmh1XURqlBIXphz4TySTZQ5pZ8vU4FQcELqbM3kDcZAxWaQxouT4x9zwwVm
         dsKA==
X-Forwarded-Encrypted: i=1; AKwUvBy5d16o6vw67iuL5+vYjrllAxpBfHVbONzs2RYdC2pjWmLEOBTArm/M2bBAIA130/96sfmnlGOhW8M=@lists.linux.dev
X-Gm-Message-State: AFuF++nyeSiqgfv5WD0f4hjKG8NRi3qqvoSF00f7Sd3iFd/op5mc158N
	a7YUvvrp/CZOFTaJybVyOSeUo+22DRl+lRpPP3mDt2TWfuJb2k1EhNWiWLmS8BegO4t1SkbOFRb
	TtZWBzfVBSpHJKuAvXQgJRkhgeTMVwxU=
X-Gm-Gg: AYBFou0tUFgwh6jdEN+sYzMK4Clb4S+5oeIw29FVOB282QxUcLSjwwI5DaZNdA0dX5b
	y3rwoCcsRJQ7Q7vrkJEsX5QywWeWVhVquWf+x2Uwg8XHBmL7Sn5mDfmvQUIiqYicLzRGIxVMeBr
	Uxu3JMY4/qZRdzj3LQowHGmCkyfo+FPxhWzksJB2jfv7sS/NqZl7VU+IvFvApK2H2Uf1nEPN/YD
	qQh55mdTSMU+bSINvKPN0txDACAns61QJVSBgI02/JV+yRGUVGmj2AsyhjbDpWtDcbA+eJ1OCPB
	GDEmrhvQFZ9G1zB7XuUz5bCo/YGrhI1f6cBiw9HWtuUd7eKx+u4CooqJ6g==
X-Received: by 2002:a17:907:c491:b0:c26:1648:a06f with SMTP id
 a640c23a62f3a-c2ac253fd57mr1046162166b.42.1790583434617; Mon, 28 Sep 2026
 01:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790561983.git.zhoubinbin@loongson.cn> <502911659e15a51c4e98c11f3cf476dd5f92e75b.1790561983.git.zhoubinbin@loongson.cn>
 <0aaf7166-378c-47d7-98d4-1004fdaeae7b@oss.qualcomm.com>
In-Reply-To: <0aaf7166-378c-47d7-98d4-1004fdaeae7b@oss.qualcomm.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 28 Sep 2026 16:17:02 +0800
X-Gm-Features: AclHuK9Vua98KWEJM57MhTJw4SsJBaEsxZP1W-rR6PIaRSRBPFPETsYhRw_q6Fo
Message-ID: <CAMpQs4+uWMfFib7MhRcc7o-QMXkFrFCtdcGj04y56u44JL4iOg@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] thermal/drivers/loongson2: Correct thermal sensor
 registration loop
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel:

Thanks for your review.

On Mon, Sep 28, 2026 at 3:15=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> On 9/28/26 06:44, Binbin Zhou wrote:
> > The registration loop in loongson2_thermal_probe() incorrectly uses
> > dev_err_probe() when the sensor is not present (-ENODEV). In that case,
> > the driver should continue to the next sensor index rather than treatin=
g
> > it as a fatal error.
> >
> > Fix this by correctly handling -ENODEV and only returning on other
> > errors. Also add a final check to ensure at least one thermal zone was
> > registered.
> >
> > Cc: stable@vger.kernel.org
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/patchset/cover.1783670011.git.zhoubinbin@=
loongson.cn?part=3D2
> > Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal managemen=
t support")
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >   drivers/thermal/loongson2_thermal.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loon=
gson2_thermal.c
> > index 4d40fc706a53..99b7392fc68f 100644
> > --- a/drivers/thermal/loongson2_thermal.c
> > +++ b/drivers/thermal/loongson2_thermal.c
> > @@ -160,16 +160,18 @@ static int loongson2_thermal_probe(struct platfor=
m_device *pdev)
> >
> >       for (i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
> >               tzd =3D devm_thermal_of_zone_register(dev, i, data, therm=
al_ops);
> > -
> >               if (!IS_ERR(tzd))
> >                       break;
> >
> > -             if (PTR_ERR(tzd) !=3D -ENODEV)
> > +             if (PTR_ERR(tzd) =3D=3D -ENODEV)
> >                       continue;
> >
> > -             return dev_err_probe(dev, PTR_ERR(tzd), "failed to regist=
er");
> > +             return dev_err_probe(dev, PTR_ERR(tzd), "failed to regist=
er sensor %d\n", i);
>
>
> >       }
> >
> > +     if (IS_ERR(tzd))
> > +             return dev_err_probe(dev, -ENODEV, "No thermal sensor reg=
istered\n");
> > +
> >       ret =3D devm_request_threaded_irq(dev, irq, NULL, loongson2_therm=
al_irq_thread,
> >                                       IRQF_ONESHOT, "loongson2_thermal"=
, tzd);
> >       if (ret < 0)
>
>
> The [no]error paths are confusing and prone to error, eg: 'if there is
> no error then check if there is an error', 'when exiting the loop
> without registering any sensor, then we assume tzd is -ENODEV'.
>
> Please make a less cumbersome and implicit checks here. For example
> count the number of sensors and then do the check against.

I thought about it, and you're right=E2=80=94I made the logic here too comp=
licated.
Let's use `sensor_count` as the counter. Is the following check logic clear=
er?

        u32 sensor_count =3D 0;

        for (unsigned int i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM; i++=
) {
                tzd =3D devm_thermal_of_zone_register(dev, i, data,
data->chip_data->thermal_ops);
                if (IS_ERR(tzd)) {
                        if (PTR_ERR(tzd) =3D=3D -ENODEV)
                                continue;

                        return dev_err_probe(dev, PTR_ERR(tzd),
                                             "failed to register sensor %d"=
, i);
                }

                sensor_count++;
                break;
        }

        if (!sensor_count)
                return dev_err_probe(dev, -ENODEV, "no thermal sensor
registered");


--=20
Thanks.
Binbin
