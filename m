Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8C3002DD
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 03:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651214; cv=pass; b=JEOoQO9cYA0nQF6zJE+K2STfTjdpQ365f0bWMn+tuATnYky1HTpftS0ghvFhjxNyAscDuSBF/dgZUGLEPcr/scyS3Cccdos8AUQA8l5k7mdnmKlZ/zNxfXgHJrjJrNPPXccSbt6ZJIONj+jL4tuKwpdXyhL8/NOj32ys9J/VUbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651214; c=relaxed/simple;
	bh=drFBxzfc6W2PaLGZNBuSoVjThY1JgVwWxNvEN6zvNfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9/gH3F90BaadHZ8j3FG0TWeUUlHiPN57HyECA7aizPjcpgPFt3pDqQJcpblQ7RruO/hlnlN+okMMeWOtpiQf4VNE0uF0GIQ1iTFApuxqsY1VUja+5FKLhpUWH5SaZWYaYrLP6roL91y5sczd7m3qoBKvqHIjK518qWll7OJMPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXkJTqj7; arc=pass smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXkJTqj7"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac62c88c7cso3989230a12.0
        for <loongarch@lists.linux.dev>; Mon, 28 Sep 2026 20:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790651198; cv=none;
        d=google.com; s=arc-20260327;
        b=XbumGFLIUbuHBTl/T8LQvUFyHieg4xAfHpmXe4MBc/bv/ItPm5HanKlZ6fwccJBJq8
         UHzcSc0676BQCQ73p+KHqH59DPVwuyD0gOzFW3ixIElGFSfVi6MbakBoNHy34iHN9WVv
         F3laGpv7ELDp2QY2KCjVeYmFBowW54LY6YhDsglfLCx2RfTS5IrEIFQLMNYljM2HGDO5
         z0bHsYgPsQmA2dXxuq59QYTPgwuRAbBHRGb3XywHKpADZsyifkZ8jd2w3SRsf/XS7X9i
         dag78uEaofx7U5TT1PeFodcxn673XkMooUYVYmV2fdsJHxjP616SGn1RD3DV1U48WWoe
         0Ldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GsgcGMq63dxBO6lpCOoish/kEuxevaMsXSsx8TcWvog=;
        fh=hIHtt4t/Pqnz+oQ+YWihnyNKzgAe4F/WTJMu44HnN0o=;
        b=IT/6hqbhObq6Irc9hN84cNiZLhGZt9Jjxn2lbwI9cqQsd6MZpynvhyXj53mXJiJwSe
         SBKH05R4WeRBRYzgi42rhVGx3NxDjektgto//cYy11Ub1Oj48hNBC81wgJz8l3jTIJkz
         YuzxHFQZNJvT6uPKgmbo6OAqce3k49EmfWl5trbx7Ean2zVtDTeIBPCHCMli8a3u8GwB
         v4sqdP2yHg7a3HzN8znGSL47Ou5w/bUgO5QBoY156fb4nM9Tawx92x8dlvArNO4FXb0k
         L5bsCjM38RD04kysQkMG0zFLalEO5BGdW2a5DzRnTDw+dve5W+vvrO+E0Uh3ZgV6uxzV
         xk4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790651198; x=1791255998; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GsgcGMq63dxBO6lpCOoish/kEuxevaMsXSsx8TcWvog=;
        b=IXkJTqj7KKX6yd7tMAyPZ4o+vfF9pOOsKaBls63QReOVhI8YTYPMmP2MMLnrD/VdHl
         By1ZUWbWol54y75Uv8iCFeWwE7YTcXFB4a1Org3XC/SE5WI3nQlpQO3K2z69LWU51tbz
         oCYsCBhDItcVvaxVb4bUj+IsL2WFu6kkFIZEJNVGlYy6IHcsPEN97+GraCXd0qgdgVvX
         oIUpskFYA4310FX6lkpYtzTw7o27Ud//O/u4HqGyvuEcyyE3OkqpN0EKvf62XNCtH3n8
         rwXmpKooShLue2N6VmmZt6ZBLU0ZBPQkvSpAVJ3l6AzjRfl0Nrybsc+copmdJlnUHqsw
         RYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651198; x=1791255998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsgcGMq63dxBO6lpCOoish/kEuxevaMsXSsx8TcWvog=;
        b=pcyttFFsr4LNEqLYHc2viQsboGZuk3ulgo8o+hOPaytbJLZe8WYZsPIJOc4mEhQMgJ
         9yfE/iJoIJ2lOuG2cx5iQAFgb0qh1Mg2YOfpIa8IBDOoHkq+25artWhhxcrlcqKc8n9D
         zDlLoOrZYYUdOOKTtx9TfeIW50LDXWKTsbfbUTinDh8BSkBg9P5nrsYEhUrgXrRvK7Q1
         3UTCB7jYoVjrXZyg55jPUPZOae6z+EYp5P/0NoUJw+qbQuAc5Y3REPGEfx+Q621qFOhT
         ZL44+ELRimJ4EPmLY+HEPcrezWdJse4eogjUZ/U8mrKe3beSEYEaVxPyfwTX5dPytbOA
         IDjg==
X-Forwarded-Encrypted: i=1; AKwUvBzNV0W2kvAX5N5VdMZ2jVUGDTKmsFPXL2Z048/UJ7KS0X+m0Y/pFocq00PrIkaan4yz2dSzKM/wkHg=@lists.linux.dev
X-Gm-Message-State: AFq9FYLwEZo0qtxXZu8hk40rSG0qczq2sRzohloFcVts24nxP+ZQ1F4G
	MqRwYkIDiL8bsZHPHKud7KP2WfMuTN91UF802HKW/mBwxF3/V9i8hRAgVjEJOSpcYrmYmI3+og9
	Asj//DDnZg/az0OPxMB7RBdQaL0kn3OY=
X-Gm-Gg: AYBFou2c2ZGu1wSAGc7X5AHbrRT5A1rj+yTZ1lHLNrBYQBZA7obKpFZggnWcyKeFdB+
	mw/+9mrxsm76QsmD8jdg17jHX4h4sVzTRO3v7hhAocmHFC4FY/RFBhHtk0m9Dgw4LjrCh8WwK0g
	SGV8SB0Ntkmh0deVvS0fU/PDmhkmQcaaUdRf8DUTkUdUQ9Tb54HQXlEYxZFmHlpWISTNerhbJBk
	cN0E0p8eNb8g2RKpjezsGmt2DjVmUD1Ddx+ONNwDq0tO4qEANBjkjlTavdjV9Z6tlpDAXWAT7Ok
	92DcxxtijRASGRJroDeH7AI18ULkCbFwiiDQ2jaOm36L4hRwFxkzsNwZT13Uhb8GAUyS
X-Received: by 2002:a05:6402:1d55:b0:6aa:7fb:7678 with SMTP id
 4fb4d7f45d1cf-6aae8a518b4mr7987012a12.6.1790651197346; Mon, 28 Sep 2026
 20:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790561983.git.zhoubinbin@loongson.cn> <502911659e15a51c4e98c11f3cf476dd5f92e75b.1790561983.git.zhoubinbin@loongson.cn>
 <0aaf7166-378c-47d7-98d4-1004fdaeae7b@oss.qualcomm.com> <CAMpQs4+uWMfFib7MhRcc7o-QMXkFrFCtdcGj04y56u44JL4iOg@mail.gmail.com>
 <ed99f62d-cf90-4ba9-89b3-08dbe7f7227e@oss.qualcomm.com>
In-Reply-To: <ed99f62d-cf90-4ba9-89b3-08dbe7f7227e@oss.qualcomm.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 29 Sep 2026 11:06:25 +0800
X-Gm-Features: AclHuK-pCkswqNWZEVmRnm0h2nAuqgvV_q4b0kCJUY7w_QKyo1tWrrar9EH7iE8
Message-ID: <CAMpQs4+hATFf+0w6Wq09RoZB1JJ5L_GP0aWxcGAeraTW7Gfy0w@mail.gmail.com>
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

On Mon, Sep 28, 2026 at 9:23=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> On 9/28/26 10:17, Binbin Zhou wrote:
> > Hi Daniel:
> >
> > Thanks for your review.
> >
> > On Mon, Sep 28, 2026 at 3:15=E2=80=AFPM Daniel Lezcano
> > <daniel.lezcano@oss.qualcomm.com> wrote:
> >>
> >> On 9/28/26 06:44, Binbin Zhou wrote:
> >>> The registration loop in loongson2_thermal_probe() incorrectly uses
> >>> dev_err_probe() when the sensor is not present (-ENODEV). In that cas=
e,
> >>> the driver should continue to the next sensor index rather than treat=
ing
> >>> it as a fatal error.
> >>>
> >>> Fix this by correctly handling -ENODEV and only returning on other
> >>> errors. Also add a final check to ensure at least one thermal zone wa=
s
> >>> registered.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >>> Closes: https://sashiko.dev/#/patchset/cover.1783670011.git.zhoubinbi=
n@loongson.cn?part=3D2
> >>> Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal managem=
ent support")
> >>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>> ---
> >>>    drivers/thermal/loongson2_thermal.c | 8 +++++---
> >>>    1 file changed, 5 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/lo=
ongson2_thermal.c
> >>> index 4d40fc706a53..99b7392fc68f 100644
> >>> --- a/drivers/thermal/loongson2_thermal.c
> >>> +++ b/drivers/thermal/loongson2_thermal.c
> >>> @@ -160,16 +160,18 @@ static int loongson2_thermal_probe(struct platf=
orm_device *pdev)
> >>>
> >>>        for (i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
> >>>                tzd =3D devm_thermal_of_zone_register(dev, i, data, th=
ermal_ops);
> >>> -
> >>>                if (!IS_ERR(tzd))
> >>>                        break;
> >>>
> >>> -             if (PTR_ERR(tzd) !=3D -ENODEV)
> >>> +             if (PTR_ERR(tzd) =3D=3D -ENODEV)
> >>>                        continue;
> >>>
> >>> -             return dev_err_probe(dev, PTR_ERR(tzd), "failed to regi=
ster");
> >>> +             return dev_err_probe(dev, PTR_ERR(tzd), "failed to regi=
ster sensor %d\n", i);
> >>
> >>
> >>>        }
> >>>
> >>> +     if (IS_ERR(tzd))
> >>> +             return dev_err_probe(dev, -ENODEV, "No thermal sensor r=
egistered\n");
> >>> +
> >>>        ret =3D devm_request_threaded_irq(dev, irq, NULL, loongson2_th=
ermal_irq_thread,
> >>>                                        IRQF_ONESHOT, "loongson2_therm=
al", tzd);
> >>>        if (ret < 0)
> >>
> >>
> >> The [no]error paths are confusing and prone to error, eg: 'if there is
> >> no error then check if there is an error', 'when exiting the loop
> >> without registering any sensor, then we assume tzd is -ENODEV'.
> >>
> >> Please make a less cumbersome and implicit checks here. For example
> >> count the number of sensors and then do the check against.
> >
> > I thought about it, and you're right=E2=80=94I made the logic here too =
complicated.
> > Let's use `sensor_count` as the counter. Is the following check logic c=
learer?
> >
> >          u32 sensor_count =3D 0;
> >
> >          for (unsigned int i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM=
; i++) {
> >                  tzd =3D devm_thermal_of_zone_register(dev, i, data,
> > data->chip_data->thermal_ops);
> >                  if (IS_ERR(tzd)) {
> >                          if (PTR_ERR(tzd) =3D=3D -ENODEV)
> >                                  continue;
> >
> >                          return dev_err_probe(dev, PTR_ERR(tzd),
> >                                               "failed to register senso=
r %d", i);
> >                  }
> >
> >                  sensor_count++;
>
> If I'm not mistaken in the previous version, the loop exits at the first
> registered sensor
>
>         if (!IS_ERR(tzd))
>                 break;
>
> Here all the available sensors are registered

The name `sensor_count` might be a bit misleading, but here the loop
exits after the first success:

                sensor_count++;
                break;

Let=E2=80=99s rename it:

bool registered =3D false;
...
for (...) {
    tzd =3D devm_thermal_of_zone_register(...);
    if (IS_ERR(tzd)) {
        if (PTR_ERR(tzd) =3D=3D -ENODEV)
            continue;

        return dev_err_probe(dev, PTR_ERR(tzd),
                             "failed to register sensor %d", i);
    }

    registered =3D true;
    break;
}

if (!registered)
    return dev_err_probe(dev, -ENODEV, "no thermal sensor registered");
>
> >                  break;
> >          }
> >
> >          if (!sensor_count)
> >                  return dev_err_probe(dev, -ENODEV, "no thermal sensor
> > registered");
> >
> >
>

--=20
Thanks.
Binbin
