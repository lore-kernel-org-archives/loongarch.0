Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B211A3172
	for <loongarch@lists.linux.dev>; Fri, 10 Apr 2026 01:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775784807; cv=pass; b=I88s+LfFANN20QPkyX4tZCqFoEVYQHBT0OJBKC9Z5JBPR+ug6RbD0GIngBkeuCimKouvBd8nc4E1chOcVXNmSBzGOIs8HTUb+faP/2QH0uM1KLiCH/UjFOFl21PemjkUlkEFCnKnbc+zlGv0WLDANo2ASbeK4ZuelS3bTIoGtR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775784807; c=relaxed/simple;
	bh=v0RxlfXW3Yt4r9QqOZBaKvi8zTLZ/zaxLSOp6ntgf+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZm5hS8u9NnjVD8zdsLw5H0fgbm+TULX8ChmC0HeFUjLTJogA8mhQJqLNI0gA3g2ygzew9gqmYW3KwXaDep2pmqBvDOVLKDB+JaAUqbY3s4031BOxEfJhbTnBIFd6BUGp54gqLlK44N+uTKBAjYLhDHwSP22CkqRDt/yLbY5+Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bl4fTFmS; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bl4fTFmS"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9bfcbaa81eso242146966b.1
        for <loongarch@lists.linux.dev>; Thu, 09 Apr 2026 18:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775784805; cv=none;
        d=google.com; s=arc-20240605;
        b=OvEXL8x25Kuo9kHDBuHV9PChX6IkDPFQPvXmyF0Z9y//Rizba6H1NsEB7PMqzJQyqe
         lgnn4UQ9svzb+MkhmhuZvuMxmWahAEeacVMoZ6ciFe9BVAxeivXZC0cJtqQtm7IX47u6
         jLgjkw+pDkcNgEky7T+QBzgpr1wnIEzc1H98SbXrt5tYpFdOB005SlCbvuOrIdUj1j7D
         lFlKyHi4TQ7K0V12e+N4HfX1iBb+ItzKlXqJUuQoJ5LDZbY0V9d3Acan1UcnaDlZ3fZg
         ZLS9dVa0Ny+R2njfeTsWbuuQc9A6pSiqRruk1pTTK/Zqy3JsI1wl5vDoCF3Z3zHxHbw3
         PYrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TAZr5maqNwb2p7O3QeXeUeWJQwU2bOpGNhJioqUYzWw=;
        fh=N8p9/gbacb54Ye0cfgQKohtpqZEkqNWzs7CU+iOyYXE=;
        b=US0GOTycpKLsOt9tD45El3F9ot+YC7ToXt52dt6XjEeszR232EPwTxXNQHfQXlbfDp
         NuZeptWvI7rOKN1+cSYJBdo4/jYrqDGv4hK1dDj5t4dX9JHj/TVquzCg6o46KkD3xUld
         AD9Rh/Y7s6iaHKKeTn0F7wRIPjPzdjG2xP15Xlbsi0yntDku4v1POJ3vVDNOPDKQ866Y
         K3Zyz0qNE4P3i5t5fO2xP1AySFzeqR75EAQuTOoe7y3riQfOm7+4IykKxdU4ZCqjphpy
         R2ELrb++gYO9QCcR7Mk3w3rbbR2qYWM7bbKOxoM8DszPY7ws+uoVpyXzWBhiYFqsoO9G
         Raxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775784805; x=1776389605; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAZr5maqNwb2p7O3QeXeUeWJQwU2bOpGNhJioqUYzWw=;
        b=Bl4fTFmS+NDQNbcUVD0BBPbBH6faPUFrSPQxJgehlFj8OZGPmg4BU/7OFmiXkOwXnM
         fMsk3e0MYmNNtKJ5nswgQMO3+uNcGYT2//R2k6HzBRPNLqZsGDaFrcRu4T3OxzdYONdF
         ONW1ZYHwnndmtd7jlMC1ypY8X7egSUKiU5QLx5kafQrwcRXUHkB0IaZyxYaPEY9yJSAP
         66Ft3J+tQvwtAyLgaGsFHQ2ycxaGxEo+DJtkHr0CfesUB9+jrdgOMrz8uk6YRExI0bFL
         j2q3o9F3y7pxBDRUXK+Bg8O68duZAfTXUA+egYx42ByFXY2jqUMMEfE/ynzyaTBm5V2G
         31hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775784805; x=1776389605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAZr5maqNwb2p7O3QeXeUeWJQwU2bOpGNhJioqUYzWw=;
        b=kGsfmaWJ/YkcKNyd9e3XDIOzC/BIVzBx2pU8xvYUPKzuybAaYm6HGk8nXGQtNRBqia
         zCpgnptuDrgbtfV9+h/0a5QHbHuqC6bLjKCtxW63IZmJQX0gHyy7tyzxRDL5lZEZHs5p
         IHH/DQZDJBMi8782L1Jeo0gSnH4aCqg5cvY+eim3FNaRe31lCSBLxa44mCrNH4sj/o/l
         PNMYCxF+PInhL6t1Z4j6PUyJqRvhmiyjIEve93ljPqm/kGyGy1ezQ6gO4qXfNvA/V1Tn
         rtaC/huCqe/s7Fs+CC75Pbl7WWliningv2zdlejYaEHASKbxuCnzEU3d+3R2DdtCddCJ
         9jpw==
X-Forwarded-Encrypted: i=1; AJvYcCWQHbsGy2X2llJYqfM89/MDhlWKUzkn0Qe4+v6j9HWHJRXbage0pKKMDQVCh09sv7l3nzc5BOBdcu8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcC+ko0ei6i8YuvdxhU09Qg6KYsvHbT8z0Yml+2fCU/2i39Kqb
	aWdHLzMTuMa5rU7wGT5y7cy5we1EF5lz1UGf4HhGoa/HJa66kdoZvhTxATsga0Lm03f6xwqWSyq
	SP5q3TL6xQ5nXuF32zZHEfeMAFfhEsq8=
X-Gm-Gg: AeBDiesg8VilLPRetMEQHNDPSrE6myyxuyW/hizFA3W48aCVLJMINJkW5O66/UBaVYs
	X41KRhk9G5iTZHGWZaWivwgXDrSHhWCSMThLwt5mJLcMmeD408pgXoiTnrbSVGSdCjnQXAE4iif
	SvTcXFQyE5fZ0Fa+BsCV42ekPCc6t+7oVakYKEeN8e092s9ngPvghOu3WzPUQqAzwKYoI/FFIlc
	dLTwqmuV9EnKdOK8+ufaV5qCxWrE4+QihCq20Zp3xSsaUYsxD6GQgcUaS3IDzIRW+x7PN52h42m
	IgGUYdhB
X-Received: by 2002:a17:906:33c8:b0:b9c:8da:15ab with SMTP id
 a640c23a62f3a-b9d72ad229amr50444266b.44.1775784804564; Thu, 09 Apr 2026
 18:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773991081.git.zhoubinbin@loongson.cn> <4236113143cc88b45062c1b8a34a1f840f29a0ac.1773991081.git.zhoubinbin@loongson.cn>
 <adfMBWyDh27NRe0T@zenone.zhora.eu>
In-Reply-To: <adfMBWyDh27NRe0T@zenone.zhora.eu>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 10 Apr 2026 09:33:12 +0800
X-Gm-Features: AQROBzAlSa5JEpCh7UCmcjzWRk8bSKAVEwCcV1FA_1Ptmw1ZcZ9lnGSVxWuLbF8
Message-ID: <CAMpQs4KYDVJnok5UfPJb3b=WR6u3OTdps+976YOox9dAFKkEcg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-i2c@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi:

Thanks for your review.

On Thu, Apr 9, 2026 at 11:57=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Binbin,
>
> > +config I2C_LS2X_V2
> > +     tristate "Loongson-2 Fast Speed I2C adapter"
> > +     depends on LOONGARCH || COMPILE_TEST
> > +     help
>
> I'm getting a compile error here, I guess you also need
> REGMAP_MMIO here, right?

Yes, that is indeed necessary. I=E2=80=99ll double-check to see if there ar=
e
any other omissions.
It seems my other driver has a similar omission as well. Thank you very muc=
h.

>
> Andi

--=20
Thanks.
Binbin
