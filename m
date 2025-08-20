Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA872D12F1
	for <loongarch@lists.linux.dev>; Wed, 20 Aug 2025 07:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755675241; cv=none; b=s3F/GC23hcea1c8Tck1tmoRZwizEYzj6z44XkZUEvWUFUlVhB6x2OHBmc60HWRp+baa75YBGA7jn8Vkebnq/+N1+wdqPVl37aMKEJDaXljfPn3D1tsbytv4zrtzYaBUuCbtPenVKuh+I7NjGp6CnsLMZ7GshCPFINuASj/24TfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755675241; c=relaxed/simple;
	bh=NPH4thYTD8d8rX7p3Z0pYtK52dCOuZkaVLpVKBjoEcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAh1fecC4RohgtKrElS9RsmSyQDzr+CxXrUgiL6gAJLXY1xgs4/5hWFKXXACHGIWv+EUc/45jOEmDsGMEJAhByCboQZok8YOBfUniXhvbYA2KvS82lxmWXTOzW65pytslYoLidFUXKIdgBNfU+yJj+KCvos4XHgK/GTOMiIvSnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHFOVPyO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHFOVPyO"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb79db329so843785966b.2
        for <loongarch@lists.linux.dev>; Wed, 20 Aug 2025 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755675238; x=1756280038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPH4thYTD8d8rX7p3Z0pYtK52dCOuZkaVLpVKBjoEcY=;
        b=jHFOVPyOJ3nWHD1H0+dtPoz8hTFcWCWrg2SuruFQ/H309KgrixYOJBmfZGUnOkdAdI
         LJxjqVRwmH3vrlfgY+v/D9agMN9Umey3QmHi5+ys2RelL8j+J2Qxxouw91GiFW2JRIAp
         Uj0267HMjFMxEdmgMTjMvWcjxQn3XCBhaS4dicAhOPwpWKKiKibIAlcjB7BcHYNKBGD4
         rTn3+SvFnufhkhNfxGSXLDEZtudTB9JiapWGBHCIQuZaEOwGhPxrGLzBZ7c7MT4XNgWa
         YXzm840x1Dbg/y9VNdzzbBJ7iZlXehBcupYzdB/+dBEAjgBBze4FGHCHP24jFw1sfcBL
         qDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755675238; x=1756280038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPH4thYTD8d8rX7p3Z0pYtK52dCOuZkaVLpVKBjoEcY=;
        b=DvXAkwyyJcl0vI4NK6dIZCyxXcIGF6yHgH6ehmuOHQ5QqD3SfVJTAKYWVBZV8z6qi5
         N4zequK+62byzpXwvHlz7HAZwxSPMBaed5HYH7YuOEA0axjQhPZ3wbRTZPrIvQ523R3j
         LC96nZdcP6IrxBzFJFke1fYi7KueagISLWhXBkZtdtgitwOXti3pP2JBHFfgcZMr0x7i
         BKAAadknKJN3gpfotve2Rs7dD99jUg1fL1EIoA4lnTGhm657nxIK2mhzE0R7gAQoIdSQ
         1VM1WUqmqbf4FSdjEJ8uuUJT7gk1NS4Rip3aGfkYytrTLXL+v0dfltcwBiAoFac4zarK
         tB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKkgPgNxlHvjEewJ0L0CCnP3p1sE5X47s7ssP3x6xx4usFD8Ik6gnWQcnfrw9g7O33DQ68S/VqyB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKDbarMMOH5GLhMLJ6UzGe9ptLundyDR/vN4HptPgFRG5raKl/
	X5ER4XmzToxhYXlPf6OtFWDSty6mzZPFD0YcVtEDVo0V9M1b7wopEdNDC697f4s+SaxtVKTnqqo
	5hgYBYqDURvxRyslVcCv0fHCz6OXpFJbLAMZqz2I=
X-Gm-Gg: ASbGncufpCJJTZrg2qE0JOL4EjExA8Jjh59/r1f9rcOhazQeo98DQxUMmW4n9d/gBQU
	s+5kFg1MnKA7SdCnmtIEK5CujBBmyKWlOKSFFjjCbpaufjc/8MkC/wDMawB43uj6s0RBGzaQci1
	9+AMlFX3wlkvXtVozrtQpjcQpyabz1Rvj77oezotzII14PaNR3Ubml+gadnBRj72ZEOYWKSuCeS
	xM+Msc=
X-Google-Smtp-Source: AGHT+IFON2NnUMFGQ6y1o/aXI4xJqybFg6ldN2gTu+kqJGZLSRTp0BWFICixSl9b7AT59ymtz1PXsxoM5SGm987YyhU=
X-Received: by 2002:a17:907:3f91:b0:adb:45eb:7d0b with SMTP id
 a640c23a62f3a-afdf00f9432mr143256766b.15.1755675238083; Wed, 20 Aug 2025
 00:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250816104904.4779-2-xry111@xry111.site> <n5kdswq7oduruqiruyup4rcdwrs76tlinz26swotzeqklterey@off5cbv5i4e5>
 <CAMpQs4LqEWSoMUZpcbyknuEvf48FMMgra+Jffk0AXvTiZYjANg@mail.gmail.com> <bssxtcjtp4pnt3cymcrqnuwdzgdhwk5udnqwsh3xvmo2kkd567@5ovlk34bb4or>
In-Reply-To: <bssxtcjtp4pnt3cymcrqnuwdzgdhwk5udnqwsh3xvmo2kkd567@5ovlk34bb4or>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 20 Aug 2025 15:33:45 +0800
X-Gm-Features: Ac12FXz8j4t0pSJL8egL9M4-K1Ue-Gu7CNjtrTekT8MsIOnDzp2kV69vcxiGTCU
Message-ID: <CAMpQs4+GHczLuu6dAE=Qo2sRXWZvQYktMPSgx6FFjnN5SO8BDg@mail.gmail.com>
Subject: Re: [PATCH] pwm: loongson: Fix LOONGSON_PWM_FREQ_DEFAULT
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, linux-pwm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe:

On Wed, Aug 20, 2025 at 2:36=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hi Binbin,
>
> On Mon, Aug 18, 2025 at 05:38:34PM +0800, Binbin Zhou wrote:
> > On Sun, Aug 17, 2025 at 6:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek=
@kernel.org> wrote:
> > >
> > > Hello,
> > >
> > > [adding Juxin Gao to Cc:]
> > >
> > > On Sat, Aug 16, 2025 at 06:49:05PM +0800, Xi Ruoyao wrote:
> > > > Per the 7A1000 and 7A2000 user manual, the clock frequency of their
> > > > PWM controllers is 50 MHz, not 50 kHz.
> > > >
> > > > Fixes: 2b62c89448dd ("pwm: Add Loongson PWM controller support")
> >
> > I have confirmed once again that this was indeed my mistake. Thank you =
again!
> >
> > Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> Thanks for your confirmation.
>
> My gut feeling is that this isn't very urgent and taking this as merge
> window material for 6.18-rc1 is fine. I still applied it to
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fi=
xes
> and will send it along if something more urgent pops up. Please tell me
> if you think I should bother Linus with it and get it into 6.17.

I don't think it's urgent either, so just take it as the merge window
material for 6.18-rc1.
>
> Best regards
> Uwe

--=20
Thanks.
Binbin
