Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0BE63BF
	for <loongarch@lists.linux.dev>; Sat, 25 May 2024 05:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716613731; cv=none; b=Iwnw+z9B3/0R3tu2fbuSdpZXY3y9ZjIFgVCfwK3xBS0ABuCM+lyPsHvF8OZaAaFeWRONfxDCJcEF3EhQfeNYdhVxxWRAqALNF9i4hbhL85Khp6vVNZed5HtbWCao3jR1y4c94qUnsKUhH1oeEpTWAIXXkK+wTBKfYL5FQvfSKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716613731; c=relaxed/simple;
	bh=Ch8fTXsEA6nnZ1sGlkl9+pY+oU2puWTkcg2fbAtuuvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJu+m7X9UUBIf8h9WrhoERkNU6T2LWTnCGmWzdnZclt//nQs2v9Efw4QvI/1lhGqJHdN0IHJ4DGd2vc/9GiVRkuIQ/9Q4kHcWJtY2YnOzCzwrGFJifn6Ni9+ZTldhC1EJ+7lHEl+TTyBNxzS3P9ypyZ1wp91okP+uZOUbZ8px5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSm02T4R; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSm02T4R"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-627dde150d0so41405647b3.3
        for <loongarch@lists.linux.dev>; Fri, 24 May 2024 22:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716613729; x=1717218529; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSgk+baR844zAblUaDMkEpfZeYyV0sBZ5dGlC1oDI/A=;
        b=LSm02T4ReySl/z/p7Q9Z5Kts675DLy9gRLSrqf124KGdzdEp8pN54zfQQVMzBwbaJC
         BIUcLFyH//g8ZSjy90uHriMc3rj/QdQNOixoiC4KlgKpd8vDZQTbU4BmRNn28dtm5E5j
         DV4cBLtEeYX0hsdDhFgBE6YrR+57jPTEK9r0jLg9JrwK9EfxNTKL0ZrEw+/S52x0ntd+
         h5/0ckSs5HLlgGBnfL+dsJ9TD5HtVVA9Hn0vt2kclmuuyh/J4doyGq6rXLKXA4KTNqMA
         TTS6p6jkc1iPUtSlUN4lGfuH3bG12c2YLzjE4/V8BPvCTZKrWjn8LP5zQJY2CJaFbRAE
         C6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716613729; x=1717218529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSgk+baR844zAblUaDMkEpfZeYyV0sBZ5dGlC1oDI/A=;
        b=DH7Wr+lPAU+HTDkl9R2JODPnkr2WKZuBhHWiJD67VLlCiNJNqcwAqGn8XALUBHxhYO
         VPu1dZkIrjofDJXHxyadpC4+9jgDirq3A+7VXdeuH7s55HhGqAeZbnb9ZU/mmrBysEF2
         cxa1rKEWjA99FDjWsVI2WWw7bxbocMedoUwnih9JGQuDkFvSGFdezju8+H0BLgJeydaP
         Bld304p097henHxgzhEvF0Oebdf/eoN/O6xfwGzSrPIZTX5bbk5CTnscR5uubp16kkgV
         ADx/Ba+nLpwlOWSY5tl+kdYcAENgwZBc+9CqfqSJz8kmtSCotCL1QJUZkN0jylWZM4QI
         T8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgaJCAuGA9XHN4kWLNF+6T8+I6xIc2/PpeYp/xiDHDxoiOuqdB44KxikiAQ3vJQPT7CuzTNDZ+TcxEuhb8K0V/efabZ63nnv+p
X-Gm-Message-State: AOJu0Yw/QluXLkoEHQ3WazD7N6O+4Uk0i6Xaplqepzy3uynGOfXahnfd
	76xCTZ2y6QrltW3P4DdwXnARZ8Hv2zrtQv4nrvCWjOjR93kqpCgcUPG86OqQpyJbCT80DwP2Ads
	kgFDi6Y/IF5bvjlAloUk3iSyMBWY=
X-Google-Smtp-Source: AGHT+IEe7T93CH3JvuuRNGnGd/OvQHiVdTzH9WQxyAVXavCVmBP09n+osepSlfsoMrC0vCqXCTQlEhoHubeqYF2/rLs=
X-Received: by 2002:a0d:cb85:0:b0:61b:9369:ef37 with SMTP id
 00721157ae682-62a08fa9dd2mr38836907b3.46.1716613728725; Fri, 24 May 2024
 22:08:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713164810.git.zhoubinbin@loongson.cn> <c89917023b49fff70bc89ddb66be7da4e0fe67ef.1713164810.git.zhoubinbin@loongson.cn>
 <t3efvxh4d2xvjh4pfrdnho6mwonwm6spjer72ww3wiqx2v3a2x@52ufzsdhc44i>
 <CAMpQs4KyX3A-Bxyp7+evBT5Umb03OvpV0VtqrNjAnZPYZ_dNQw@mail.gmail.com> <aqcpf2tjt4iywxc7vgddkzaxtotlua2mnnpfsivpwobrc64neo@gylq5sl6sahk>
In-Reply-To: <aqcpf2tjt4iywxc7vgddkzaxtotlua2mnnpfsivpwobrc64neo@gylq5sl6sahk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 25 May 2024 13:08:37 +0800
Message-ID: <CAMpQs4KH97LXJSU5g6r55UKDA6Rg9UdCO2+6K5owDDVcG2YCkA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pwm: Add Loongson PWM controller support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe:

On Fri, May 24, 2024 at 10:01=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello Binbin,
>
> On Fri, May 24, 2024 at 02:29:35PM +0600, Binbin Zhou wrote:
> > > > +     ddata->duty =3D pwm_loongson_readl(ddata, PWM_DUTY);
> > > > +     ddata->period =3D pwm_loongson_readl(ddata, PWM_PERIOD);
> > >
> > > The rounding looks wrong. Did you test with PWM_DEBUG enabled?
> > >
> > > I think the value assigned to ddata->period and the other members isn=
't
> > > used. Unless I'm mistaken, please drop the assignment.
> > >
> >
> > The period, duty and ctrl are prepared for PM. I plan to put these
> > three parameters separately into the pwm_loongson_context structure. I
> > think it will look clearer:
> >
> > struct pwm_loongson_context {
> >         u32 ctrl;
> >         u32 duty;
> >         u32 period;
> > };
>
> But .suspend() reads the value from the registers and rewrites these
> three members itself, too. So the write in .apply() is unused and can be
> dropped.

Yes, you are right, I will fix it.
>
> The suggestion to put this in a struct is nice. I'd call it something
> with "suspend" though, maybe "pwm_loongson_suspend_store"?
>

Ah, The name sounds more readable.

Thanks.
Binbin
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
