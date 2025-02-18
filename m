Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB8A154C12
	for <loongarch@lists.linux.dev>; Tue, 18 Feb 2025 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879545; cv=none; b=uRjZqEjXQ1DPCsaRyg7lLO2KK/QQbFfxu/eRnWIOdmKR1IgMClnp2/JrtoVrjBnWoAgwlg3TMWygLrox0GI/zItlz7S8d1c8WGhgfoiqBD1Mv8BOkdsGg4Fjcnm89DSfjyGfBsaq0jDq/xtpD38ADHewx7oEXch7MbZYjkDMKLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879545; c=relaxed/simple;
	bh=LMbdQ722oF2bBggs0mcqOmuW06AT9TNi78b/Vj3zpG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DH0B+1Z50U6y/zDzpX7C0XqVN7d7vezkijCAZVbVUNAcxoicQJRAwvMnOSwdg+PEX42aFN6uijBLX9acYSQMq1E/B6lJxyEOGMKUR97lIa5i2lByvHyinszr2NGwIRHN47Hh7FwWuDefwm5vGkRXer7E855sabtgYUZ4/g+7i6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRcl0KTz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRcl0KTz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so5383358a12.0
        for <loongarch@lists.linux.dev>; Tue, 18 Feb 2025 03:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879542; x=1740484342; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfV/B2dEJudDb23dydC4glueP1Q/G17UcuWW05BY26w=;
        b=MRcl0KTzarTkgpBB9kMRpyLBcEJXH91WWtspysr5QxpynOzdKNP3tkKWUYOvWuRJyL
         phRWhTvO8FasoG1eaal0de8tljhRgRLL5bVIsemYl33t47PejSP6GfcCqs/RZ/F36/9S
         pO8ndj3RsXt33yzEXxoK1fZbjkOPJ9GH/w30ZE5BXVn6DbupYq01pJvGycfQB0PUv3Pg
         oBmoUWjNDIyrXBMs0p12wjS0DoKtJbM7ifmJ04QLt02DiHXqo7IZm64mOcE1w3aiMgGN
         b5gk5BK0vhj4wzT61lJa2K65xW2vBWnVuyT1zlvHQuYDtXa3XIBhr5AQJw/qKV8ejd8z
         RoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879542; x=1740484342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfV/B2dEJudDb23dydC4glueP1Q/G17UcuWW05BY26w=;
        b=t5SsJjHMBs12KM9fcXQoXVQpb+tCV/FWvaW121k4Zv07oRV5fcfGNheQbtD5YJwZXX
         4kr9YR6QBSIrjjJFurmGuuwE59IYlxkbS1lYpdfFzGkO7LAqERKE0pPn49doM37JQ8Lp
         KMJZOwrEFgEUVlW5LkouCibHLL9UswtQliuKvtHm8s3wPQksDSFzNI1mXZhq/5Z3aSbl
         iCdZMeEUc6OUrX5KQqH/kyKOslXT3bZQtfFg6Cmk7dlKkrDR1AQoGse1gbXabop3SIxB
         tUP6dJniBhQ4ivckJKI3EU5UiFsuXs3OxgqOZaIaw6fslUVhTucFH/aE+zwgdxWmLKAz
         kbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSJMmcV3bevgA4Bamr7UglzhY9+476L6TrI6zb602kZxs3ME19u0BgcDMIOqlAUlGHz5Ea2Tnkudk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLcZWYGvsm3s6UsUNRdV3t/Itj6BeAF7QOsld/i4OutkljNCS0
	/Gi6FIeuH+a3K03iJ2HqDwFiGJykksML7fH/RbOlfkMLEZkrswdhFjdNjfO+PlpmAU91pSga4a3
	YcSrrNM8/2edBDH4DwH6G+lW407YzqZf01B5u4g==
X-Gm-Gg: ASbGncv6pvNQzmNlBOWkyxjWASrxxz+SRBuI2UJNWmJheZ+U/Jj+5Q7BMiH1MxZIBXR
	sB/wLv2XkfPW+nB56q8yVhlVrqy7uGLDntqnmdU54iA8GG9qMzIIiXNgIv8UBHZjPJ2m7a158tw
	==
X-Google-Smtp-Source: AGHT+IE+3aDBOwQVKDSZ+vM1pc4gav67Z+fWw+dHKzW8xuLIWRTTRe+hxMk5TL69LpCk+67wiznaMJio1qQeCI6/+XU=
X-Received: by 2002:a05:6402:2753:b0:5cf:e9d6:cc8a with SMTP id
 4fb4d7f45d1cf-5e036216f84mr13165127a12.20.1739879542302; Tue, 18 Feb 2025
 03:52:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218111133.3058590-1-zhoubinbin@loongson.cn> <Z7Rv-s4agg0vVO5P@smile.fi.intel.com>
In-Reply-To: <Z7Rv-s4agg0vVO5P@smile.fi.intel.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 18 Feb 2025 19:52:10 +0800
X-Gm-Features: AWEUYZk81laEh0hbWEMPPVQmqph0hfw1fN8MU2NMd50fcvvaeZ3Q_RGIHLuFcZo
Message-ID: <CAMpQs4JgCBF4=woNgMaLbr=e6CHY=ChzW9ev9d2GSL+ORcydcA@mail.gmail.com>
Subject: Re: [PATCH] i2c: ls2x: Fix frequency division register access
To: Andy Shevchenko <andy@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	stable@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thanks for your reply.

On Tue, Feb 18, 2025 at 7:34=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
> On Tue, Feb 18, 2025 at 07:11:33PM +0800, Binbin Zhou wrote:
> > According to the chip manual, the I2C register access type of
> > Loongson-2K2000/LS7A is "B", so we can only access registers in byte
> > form (readb/writeb).
> >
> > Although Loongson-2K0500/Loongson-2K1000 do not have similar
> > constraints, register accesses in byte form also behave correctly.
> >
> > Also, in hardware, the frequency division registers are defined as two
> > separate registers (high 8-bit and low 8-bit), so we just access them
> > directly as bytes.
>
> ...
>
> >       /* Calculate and set i2c frequency. */
> > -     writew(LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1,
> > -            priv->base + I2C_LS2X_PRER);
> > +     val =3D LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
> > +     writeb(FIELD_GET(GENMASK(7, 0), val), priv->base + I2C_LS2X_PRER_=
LO);
> > +     writeb(FIELD_GET(GENMASK(15, 8), val), priv->base + I2C_LS2X_PRER=
_HI);
>
> Now this needs a comment to prevent from appearing a patch that basically
> changes that back to 16-bit write.

I will add a commit here.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

--=20
Thanks.
Binbin
