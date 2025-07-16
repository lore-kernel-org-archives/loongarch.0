Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A7233149
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752657451; cv=none; b=t/PdS4XFwvwcBLflceyGFpeMT3n0qyyr0piJT2qRtd41+eC+xx3QPImf3xcz3u6bC20HU+evhjaAy6BkQ6n8dLRj2O/jXTOvXbzoMfvibfWbh1RGpKmLOsFgGfpMNr+mhlUvOh2/2YSRAnWUM1TrysKWOmcxhgVd9fqkzOQbcBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752657451; c=relaxed/simple;
	bh=B8pIb3//fnjXonWNeyZLRydupO9ewvyQuQ9hPCmNGiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEdZSrrQH/5cCdZdfxbjPVI7Jzj8Tv6nlZQMbqmu4ZuJZILdHxYrp/XbWachgm/jpMTRTmgvYqVOpL5kF9iT8gyYBT0DByrCwuX+F/wIMJynq7zAjqsviTwnmACveaYi1P50g+JlyW0YDTgDsUB9agZ8Vm58fIrsh3kl7FPyD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2wKkDYN; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2wKkDYN"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so10611431a12.3
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752657448; x=1753262248; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8pIb3//fnjXonWNeyZLRydupO9ewvyQuQ9hPCmNGiU=;
        b=Z2wKkDYNgxyaU6VHckqq/k9V7MAzgnDeooauDUMxN2LkdZayUAlgbM8MqKnB5apT07
         xnkKwsROJ29HDUhdTwrk3rsRfCcuawgq+iD+/w60fqdSfD4UoNno8YrdlENEVvgYvRmT
         VSlrfBWy/YFRxw5WTG0DCMwvrIrEsWhcCqo87yvfn34FChwQKr8TDZTh1g1f7aoiCr4w
         I1G1PHCtS2/AU1V3gbklaB0rpi9U2GvOhKcnw3/SX00/gGCU/svSjr2jewdC03zLD6zq
         6zl+S9DPgM7mQ+KLdVLOKn2O8Hu61TeZZJbiub3V0t5DjeXlcacYEJeQhJAAJVws5KGl
         Xi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752657448; x=1753262248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8pIb3//fnjXonWNeyZLRydupO9ewvyQuQ9hPCmNGiU=;
        b=E6pFvBg2d3BSmGK92vTy9tnLaPEAo7O0MuFY1kV4OX09LrUdFgmzRHZZm2sK+HiHtl
         Y6JMhPsjTIihyxPD4qZ8wO5pXWM6iu+gqbB1bGXP2/XMQ98JZLa/oAXlqObXSYx7jMxQ
         4hkn9ByEre5s6vREkkdfA90YT7YxN3NmT9tcEL1bsGc0Hn8eAbSLs35QZKTlOOMa7jVp
         kp2igdsK33sWS9NHOXcuYX2yWnf7t00NVY3bE27Vvoe9vEzDnJGqHb0Wv0WdxLLLAKBX
         7D6e3uHPpC+FW9f5OG7MgdkWk7rMZB22xO4YlSgj8meHKITRUoPTpzIGlbXQdE58/2PJ
         O21g==
X-Forwarded-Encrypted: i=1; AJvYcCVOHoMWADJdVcYvssHQpgLh+7i7OZLeeXAact/Sy8xK8cYyhyNlSZWLQdA6RxFLdUST237aBHd/R6s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgqpnBeOAzpQJp9xlEA0Fstsrmq4cBf1WRrtNkRnxk3Hw+rVQD
	tk0Cijp2cAU5ePSxx6RBjyxks5ekGjZhuQ8Eqgk86bVA1e7yd4VPZfjXENPjLO+4PxFin3/vGnw
	Q3iCyzfkfTps+1+E/K2hHMD/mIiMXll8D2iKzZFE=
X-Gm-Gg: ASbGncu2FdylaDBjuIJsnRRktymq8PUZZRMI/anUfRcJCRRYt/2HA/lJ8+0jtntYki7
	aK0vtBifNL3mIDuyFoiwfcE981iHWnKoHpUofYckAgKR4pF6Of/EDQmDLQ6RSQFuk1iMama4u9j
	45yB3lXwPZB+h/ZWM5yo1iXf57XLFUcASId9NlF5MHtjDLu6zYCmNJyrWf/a52tZFN0X7K2ZPfc
	WJ1mNNg
X-Google-Smtp-Source: AGHT+IHQDAzi45aRhCZnxl1bC8eDi6W6RNajDVCN3Gjrqf87+jCiAKUbzSzwiO0Qcc94Sy1m+4uuh6ImB3fwdzOZTFA=
X-Received: by 2002:a17:907:a709:b0:ae3:d5f2:393a with SMTP id
 a640c23a62f3a-ae9c9b218b0mr259553766b.44.1752657447367; Wed, 16 Jul 2025
 02:17:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714064542.2276247-1-zhoubinbin@loongson.cn> <CAMRc=Mch5d3=vbRqCohh8viPpp_dTOd8iQBD1fEQVeZrRJD90w@mail.gmail.com>
In-Reply-To: <CAMRc=Mch5d3=vbRqCohh8viPpp_dTOd8iQBD1fEQVeZrRJD90w@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 16 Jul 2025 17:17:13 +0800
X-Gm-Features: Ac12FXyLyRSH1E7-pxNtloxl8fOa7MDzIIBKW0_IRyi9AZAxHf-xeiYdWRW6Rbo
Message-ID: <CAMpQs4LcD3+gN54WUwHSU4vKgO=mWGiiZ5b_PCr7HZYWbLORwg@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson-64bit: Add loongson gpio irq support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Linus Walleij <linus.walleij@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz:

Thanks for your reply.

On Wed, Jul 16, 2025 at 5:01=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Jul 14, 2025 at 8:45=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > Add the interrupt enable register offset (inten_offset) so that GPIO
> > interrupts can be enabled normally.
> >
> > According to the latest interface specifications, the definition of GPI=
O
> > interrupts in ACPI is similar to that in FDT. The GPIO interrupts are
> > listed one by one according to the GPIO number, and the corresponding
> > interrupt number can be obtained directly through the GPIO number
> > specified by the consumer.
> >
> > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
>
> Seems like the message should say: "Extend loongson gpio irq support"
> or "Add loongson gpio irq support for mode models"? The driver already
> supports interrupts, you just seem to extend the support. Tell me if
> I'm right and I can amend the message when applying.

Yes, you are right, there should be "Extend loongson gpio irq support".
>
> Bart


--=20
Thanks.
Binbin
