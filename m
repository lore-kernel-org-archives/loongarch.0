Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CCD145FFB
	for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713783885; cv=none; b=kj4+w8IacFF9bD/PolJWfeGJr954b+TW3YI6enMXt1hP0PYi4v/yVFo685kMVP+EoJINk05AyBZS5B6G9A++FKzszuQJbK/SE0dfIjU5rLIe5k2gM/QG71SM+5blS+VIny4rk/ybj1LKQHy3NPqsx7WaWH89Zr6TRbEh7MAMMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713783885; c=relaxed/simple;
	bh=JXm16zia0YU1+Iyv4sWJ/YcpjrXxKfv23uz2LVLhOJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozpr1TvxBxVCDV8tbTowbBzI7unLvuT9kJ3Yjiupdz/zQMU/NE30rrlmGXJkoqNs4ybj5QRja4kWgOd+NGGrMKidUh+zrnXL6a/W5hvskpKuHX4xkttS9WYS7IU+vUhFw2IwZ/btSPQ6ixjkEPk16UN5D7f5Mcuw9gIfsY6RVj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lp7k+mBO; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp7k+mBO"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-617d25b2bc4so44758907b3.2
        for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713783882; x=1714388682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6BTTO2yQGavTdTVfo1GBEafZqwKHuqYzmiVDOWg2UY=;
        b=Lp7k+mBOD8N5fBLe/3amukVn7hIAWgp2FzBUaOi3KgHAMg8NG+dbAGj9WC5qORVsEj
         JUxnNSSJpLzFC5wm0q4jp6XpckhoUAAKn2+UsBS6sI/UV8xYFLBMolNNdRHW/WQyk75f
         jPKhRFqYRscsdkStwWU2irI21TCP4pjFRf7p5Ktu7ryFX+k4NjcklC/lO5bjIIts5+DL
         iJmuj19mIf8q4lzNyokghZtivA7WWnP+tbw7xtZHNRf1eUqG4CgLVi1rBMKui/1u0B0K
         u6AG1tJKHSDlrwb+gvFeuomBZY3ADkcvH4Bg9GtaWQQhMO50ZkZpxvbzpSAV73QyYCVA
         xxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713783882; x=1714388682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6BTTO2yQGavTdTVfo1GBEafZqwKHuqYzmiVDOWg2UY=;
        b=w/d7mg4Nj0L96M+IIHgvoi34W5I7BPncCfobLY118tr6kvtp4wHQlTW9jEq/U17Klu
         aZgCDRyVIv2nFPwlxcg1Q6MBg0xiqH5xRBpzJn08cow/dTiIo1I6/pwNI3M1I02rxpDe
         NtzPLPNv877ZZe5kK4UaiBxhayVpmfrNdqDD2FUfdiUU53Z9vsF2nfmTpitMDce07xrW
         xetAVgmFuj+zlAx9dA+K+AfyN2nCuJwnalfnp2ZbJwdBlozx9clTc0/APKWtX49jiBSS
         QonxDzy/OLMHUx9NZsooosoiugQn4XD7xfzBCxz/GUP9byEn+kWQKSSjyCIQ0jj71mqA
         HHsA==
X-Forwarded-Encrypted: i=1; AJvYcCWm5WtUglWnx4uiqRlXzTl+KlNdm4rGyp/9bp8b772dgZWhCEawgQpXt8uxKlfZpcOtuRA2XGKCaDXQGZ467n7NXduFZYaBshuY
X-Gm-Message-State: AOJu0YxE5BqRoFPfQgWnAg9VfovpExJ7nwirRlLcPwoPRXEx/DCC+6jS
	PVnymNz+u4TCP/N7prL23HpQ4sGzek4y0oDwLhGqxKsVBOTz22PBPPLDekAPGN8H63Z3BRkCddn
	pkl0SDHL57r01gi47xsnPncBx8Ak=
X-Google-Smtp-Source: AGHT+IGveC/J65PgWtnx+selqqsT+dy8tuTanqgztq6SLmxMWWHSinBBaF2mUzxy5QdluHtHp25UD+yBpLy4mHAP6qE=
X-Received: by 2002:a05:690c:6f85:b0:618:1ce6:b618 with SMTP id
 je5-20020a05690c6f8500b006181ce6b618mr10180692ywb.12.1713783882560; Mon, 22
 Apr 2024 04:04:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713509889.git.zhoubinbin@loongson.cn> <58c3a812746affb331147d0d9f2f5b8f62f120cf.1713509889.git.zhoubinbin@loongson.cn>
 <e2cd6b13-62ca-415a-a015-0bf30e77535c@linaro.org>
In-Reply-To: <e2cd6b13-62ca-415a-a015-0bf30e77535c@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 22 Apr 2024 19:04:31 +0800
Message-ID: <CAMpQs4JPuECothtpTgOQhKvttOcGQHQWeZ0TcZVdm8vf8EEcuQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] thermal: loongson2: Trivial code style adjustment
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 5:44=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 20/04/2024 03:45, Binbin Zhou wrote:
> > Here are some minor code style adjustment. Such as fix whitespace code
> > style; align function call arguments to opening parenthesis, and add
> > devm_thermal_add_hwmon_sysfs() return value checking.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
>
> [ ... ]
>
> >       }
> >
> >       ret =3D devm_request_threaded_irq(dev, irq, NULL, loongson2_therm=
al_irq_thread,
> > -                     IRQF_ONESHOT, "loongson2_thermal", tzd);
> > +                                     IRQF_ONESHOT, "loongson2_thermal"=
, tzd);
> >       if (ret < 0)
> >               return dev_err_probe(dev, ret, "failed to request alarm i=
rq\n");
> >
> > -     devm_thermal_add_hwmon_sysfs(dev, tzd);
> > -
> > -     return 0;
> > +     return devm_thermal_add_hwmon_sysfs(dev, tzd);
>
> You may not want to do this change. If the devm_thermal_add_hwmon_sysfs
> function fails, that does not jeopardize the initialization of this drive=
r.
>
Hi Daniel:

Okay, it would seem to make more sense not to make the change.
I'll remove the change in the next version.

Thanks.
Binbin
>
> >   }
> >
> >   static const struct loongson2_thermal_chip_data loongson2_thermal_ls2=
k1000_data =3D {
> > @@ -167,4 +167,5 @@ static struct platform_driver loongson2_thermal_dri=
ver =3D {
> >   module_platform_driver(loongson2_thermal_driver);
> >
> >   MODULE_DESCRIPTION("Loongson2 thermal driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> >   MODULE_LICENSE("GPL");
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
