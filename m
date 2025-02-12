Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAA6204584
	for <loongarch@lists.linux.dev>; Wed, 12 Feb 2025 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739346700; cv=none; b=kvsU+dt+JGGsx82pEdeI/iW6SdE9e1ES1iHH9phFOMNfvy7ob+5B93JHAWIl4ePuHFZX3TV6+JT11u6YHk5COlU0HzF7it6rYJ/2Pn6IMgdwW3doGv0n1Nx1e973y27nYSEmbMG2AOcxUgeoc5vXgeHEbCFrmEtHDDF316W6aII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739346700; c=relaxed/simple;
	bh=PT4rGShEWh3DzWcWOCHpI21yltkgPZv4xIGMiqRgdQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3aPohMZDQgO7085R8z75TsfjEer4vgyGEi1+WlsJsQPcf3ecx6xhzwSH4YTUqspUfY5RfOLA+97pvbDGlVVqmdWzUbpLVtm0qJnmXd4fp0KEltIp4ajIcjfmiuFXHnzBW7ZB9RWqOgNsXT5lMkYPfjtjTZclGyUQLZlOQWqFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HcdM17vc; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcdM17vc"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5de51a735acso9159389a12.0
        for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 23:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739346697; x=1739951497; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9m4RpcHMEGyjcSsbihXpefKBea9DX/lIwf1QjZ3ahQ=;
        b=HcdM17vc70RyZTkwXktUkkhsNPzaVpk6+A64keIHncpzQiAZkl4bwkAOni+Ok124qX
         iY68xXcYFNjITE8mYNPFKTv2NJ09NCiFaE12yx+4MqDSjbRkeAWiD2sROBSv3fhT7Q52
         cDNNHnH+lZmyGgPzJcd0NLrcYwdv6+jhX3+KYyjmV9cahECEDmb/nIvAsTnJ+h/e20/X
         wltxX+paeaWzhgKj/VCfTDB9Vlf/nbj+P7KNaALG2Nzn98A6JQCO+uA6NjmNBUPVu5Ei
         xj8cfAbbuSXVspICPCii0yA0JDgl8ZmaeXIHp3rxSZbD9jvbObuA59raBjP2CqCLPj/a
         FlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739346697; x=1739951497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9m4RpcHMEGyjcSsbihXpefKBea9DX/lIwf1QjZ3ahQ=;
        b=ic7bS3DC6JW5qkz9xXIq5fFIjJtZvd8kRcgRRSVGD1s3UGIAJvQGFs89k9WNf9PMhR
         PPaOuskedR0C9pPO7qWo5RHompwxQAh+qhDRmm2NcbqY8td18JLA2egYWhRyLUlHjRvb
         9k4+vp5dVsy/9tjLyoZsEYRd/0ZUXy2GOqjcWvuip7PYfJBFrwR1R73sRI/QHChU+7fH
         3j8Y39L9eKFPqP5fZDMCFRCDWi3nO8ijqZR8V6/Jh9FmzJuwQbHSmajExxyenqtHJP0x
         44K6bdGnJ7AjsvbR+vi7j7t6jbt22CII1dW6x2z8VOyYGNYqHbsN0BORanhpLHvdjz+s
         4G4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq+TX9sOpiU78aSXQ2x4YXuJbEykGvutHWaAzHorvJiONA0xqOd2ghgQ/k4FSfm8gqHDXr2szUNVU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj229KvLWnF94nduApMulJzH6tQ7lJ9NQE6gU1zSfcFwdvBqal
	ELkCWfejA4VIJnlyjruxTE41FegLYZUhbL7f0B73hUQiExh/tHeDmJOpmyeN9dAifRxl2XSo3d+
	nrWpb65XvVAEO6YPPXYnrGFr1Xy4=
X-Gm-Gg: ASbGncvjUjMGDlZqDIAkMTwI5hdmlb3XfETCHwIpeYafo7raKeNLbqDoiRhf95BtBvl
	1g+GT3euASz3OHQGHMDrsaPRCfckX5ecjnBSYDby5DzBpPn0ZU+wKZkLu7WJL+7s0M0mDK+4=
X-Google-Smtp-Source: AGHT+IFTu3gb3HC/gTL7ZO2Hkvnwgt7SCIv2ukWCJdf5Hv2sq1C8t89CjBEo0ofNGytsdWZNMj3FBLTzqpa6ZVtjQZA=
X-Received: by 2002:a05:6402:510f:b0:5dc:113c:46c3 with SMTP id
 4fb4d7f45d1cf-5deade0429dmr1666658a12.21.1739346696982; Tue, 11 Feb 2025
 23:51:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1733823417.git.zhoubinbin@loongson.cn> <be76165d1ab09ec41cdfd4e5fbdae1b415f516b9.1733823417.git.zhoubinbin@loongson.cn>
 <obegtfup7f6w6erh4arubk2fkk2wrcum5frs5kbqa4uniexmr5@6uti3d3hv7np>
 <CAMpQs4+nVSorAeR92F22T5dnzyh1h4BDR6UqrZbTSUhEyWbGyA@mail.gmail.com> <vyth3k4smtsp4qvbkugi7vkhaqii3gysgjmenzhl27iy74fy6w@rleajhaork2j>
In-Reply-To: <vyth3k4smtsp4qvbkugi7vkhaqii3gysgjmenzhl27iy74fy6w@rleajhaork2j>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 12 Feb 2025 13:51:24 +0600
X-Gm-Features: AWEUYZndaGkxnP_eAs8RjoY9H_Ss2OZaz6eBH_mYhYyxveHw2EhylSheiy1pMgQ
Message-ID: <CAMpQs4+r0zHsheF5qC1Jj-JMmV-J8DWicHVsx2aB91Eexfekfw@mail.gmail.com>
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

On Tue, Feb 11, 2025 at 11:36=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ke=
rnel.org> wrote:
>
> Hello,
>
> On Tue, Feb 11, 2025 at 02:02:03PM +0600, Binbin Zhou wrote:
> > On Tue, Feb 11, 2025 at 12:26=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleine=
k@kernel.org> wrote:
> > > On Tue, Dec 10, 2024 at 08:37:06PM +0800, Binbin Zhou wrote:
> > > > +static int pwm_loongson_suspend(struct device *dev)
> > > > +{
> > > > +     struct pwm_chip *chip =3D dev_get_drvdata(dev);
> > > > +     struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(ch=
ip);
> > > > +
> > > > +     ddata->lss.ctrl =3D pwm_loongson_readl(ddata, LOONGSON_PWM_RE=
G_CTRL);
> > > > +     ddata->lss.duty =3D pwm_loongson_readl(ddata, LOONGSON_PWM_RE=
G_DUTY);
> > > > +     ddata->lss.period =3D pwm_loongson_readl(ddata, LOONGSON_PWM_=
REG_PERIOD);
> > > > +
> > > > +     clk_disable_unprepare(ddata->clk);
> > > > +
> > > > +     return 0;
> > >
> > > Is this needed assuming that before suspend the consumer stopped the
> > > PWM?
> >
> > Actually, I don't quite understand the problem you're pointing out. It
> > seems to me that the register and clk operations are required
> > regardless of the state of the pwm.
> > At least from the experimental results, the logic is now as expected.
> > Of course, I may be missing some critical information.
>
> When a PWM goes into suspend it's expected that its consumer already
> disabled it.
>
> Until I come around to do that properly in the core for all drivers, I
> think the right approach in a driver is:
>
>         for (i =3D 0; i < chip->npwm; ++i) {
>                 if (chip->pwms[i].state.enabled)
>                         return -EBUSY;
>         }

OK, I will add the approach into pwm_loongson_suspend().
Since our pwm is single channel, it can be changed to:

+       struct pwm_device *pwm =3D &chip->pwms[0];
+
+       if (pwm->state.enabled)
+               return -EBUSY;


>
> and if you then know that all PWMs are disabled, maybe you don't need to
> store all the registers you did in pwm_loongson_suspend()?
>
> Best regards
> Uwe



--
Thanks.
Binbin
