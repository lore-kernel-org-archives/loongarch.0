Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538A42DEA9D
	for <loongarch@lists.linux.dev>; Sat, 30 Aug 2025 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756583400; cv=none; b=uWQs2o1bqvp8QOKpGwZnmni4nJ2++YKP1gSa2/xBGDyw2uZdiyswYeXyAgQl1c6aDdkm2rF1qz9tGH7iSq0Hbjxcl+2eDn3zGaxY9eyKCfArmxMNzJNHy6Gx/xB9Q77EBnFXiyq+YqKIEB0uUdBpuRZbMZ4kWRYO/x8rGZFdGHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756583400; c=relaxed/simple;
	bh=RESvPL6lZSU1LVrX5w1VrBJByLVlXWsRl2ULoQXIrYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmEcdL7edInu0HC30SvS/e3X9xyjXT4zghzFdi08WbxbgFwFuScAEOO79EbkKDp1n7cU3oGn0q/lndBCMZM4mLbXYehAiqpLJVcvorXMj5dL3mq/iaK5uneccen4s351o57HN4tEddyd2BZ1XW3SOJDGv6jZl80EbELKj8Qs5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qycCpYq9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qycCpYq9"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so1523118e87.2
        for <loongarch@lists.linux.dev>; Sat, 30 Aug 2025 12:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756583397; x=1757188197; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RESvPL6lZSU1LVrX5w1VrBJByLVlXWsRl2ULoQXIrYw=;
        b=qycCpYq9AF0p1OdLMqzrHrGObewQCHOouynC2FsmzVn+06/GZWk10N8s2inV+/izWC
         ZZoHdxhjxkeAPot08qu5E71xHILwb5BFPFhWA6tbpMBnGgqEOvqykZhIBLiqochGkqBd
         ZZUAvpOFrBa45PzZGf9UuQJIQFFj/oKeHJjyIXu2BymKlKQJS8CGr0pWYbXVAwpFxQgG
         luoHIfhBtZA/up5uusP1zPPEzCqJ6uPoqgUYoPX6fCxGihtJY37PyZafddsTL+a/P3Nz
         4Os7TRVrjHe5RxlK+trjL/VYVRD0pLdAVeEXsUOsQ6blIhkttxB5e3DsVEWY2s+CIwvr
         CWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756583397; x=1757188197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RESvPL6lZSU1LVrX5w1VrBJByLVlXWsRl2ULoQXIrYw=;
        b=eqTGxyzV+h3TO2JhozTmlEzL3OiXnn8E4BxNYEAlG6fi46NVeB6sV0SLxVn5K6QsG6
         Zjp2mf5yfd3fbBZ5eylb0E5wI44EJz0P3/jWhnBQupRbybBwiiWFTjKVBLCq1uqe3M7U
         6nfIw+jgMhy6/6V/lR+++U/2L0IDhD/DC51S7LqQRWpRbFexAyHw6Q2UZuNbIfB13Hhe
         JmuUFdFD7LxtL8UVjW8N7irTB7ubvKnw/0HedSs/TvkhoOTTJ6Ycbew9e9RrzZ9QHY32
         uIqEvWW8EUdm1KBeBs2m4lFcNyu0J0+8M60bibnbDC4HcbvXnAaDVxhVBQY8ERskP1II
         sYOg==
X-Forwarded-Encrypted: i=1; AJvYcCW+y0YxFNKeR5su9SZQidGP1OeQOzNv82U+dJ/4nLvtjr+VdY5d6Nd/VhBb2x8soaxMgDJQJqkMCpU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmGvyb04PTE8YrIwFJUGFresBatFl6Rz/IHUWWPQzFJHWM1hQW
	0WsABwXmHdp5E6dmvDCTdWXXvb+lcB63ZLiF5ysd9SBd9C12WxBkklTlWtvus2UleRv+fi+TrUR
	Z/hr8qfea4x1dqP4Soa66DTCmLwcJh3wRtnaneRM0gg==
X-Gm-Gg: ASbGncuORpTL5sZkMonJYrh5goVDrZMhAePYsfy+7Y7IhHbx5NhWyAp4HO6rdZYEvV7
	ejcvZTbhQ2RTtPx4skQSX/J7RDxUZoN+cM6IDirIqiFnio4S6A/YxvdUF9+rJApXwieQfwLzw8/
	7fzQhw5MHVxu88O3UW2wgYwBCuMU0/++VUbk8eZLk54Y6/mXKnT5RbEJWFB4rbXV1lNRWE87KcN
	ySukjUWwwdy0qOGrCMuYl1nQdwnik04ElPBBYYDfrIE04iu5A==
X-Google-Smtp-Source: AGHT+IE50mGD6Wsp5fjlHRmoMQ5rebLnfakE86Vnr2ujarxjBgcFlbm1KFCExKkXTA2m/S8rPEWfnwfaAxEiJLlgF8g=
X-Received: by 2002:a05:6512:3b9e:b0:55f:486b:7e44 with SMTP id
 2adb3069b0e04-55f708ecf52mr685020e87.37.1756583397500; Sat, 30 Aug 2025
 12:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250816035027.11727-2-ziyao@disroot.org>
In-Reply-To: <20250816035027.11727-2-ziyao@disroot.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 30 Aug 2025 21:49:46 +0200
X-Gm-Features: Ac12FXyuG3vAb6oO4Z4zArYVmCFaF-tcxGvuqQuACijURT9dTtrTa_sARjkZMYw
Message-ID: <CAMRc=Meed_x_OODv1fw1m7rpLY4uGic=0pacjV+Mj147_WMZPg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support GPIO controller of Loongson 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 5:50=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:
>
> This series adds support for Loongson 2K0300's GPIO controller. While
> being mostly identical to previous implementation, its interrupt
> functionality hasn't been implemented in gpio-loongson-64bit.c. PATCH 2
> implements its interrupt support with an IRQCHIP, and the code could be
> reused for other Loongson SoCs with similar interrupt functionality like
> 2K1500 and 2K2000.
>
> Tested on CTCISZ Forever Pi, reading/writing GPIOs works correctly, and
> both level and edge interrupts could be triggered.
>
> The devicetree patch depends on series "Support reset controller of
> Loongson 2K0300 SoC"[1] for a clean apply. Thanks for your time and revie=
w.
>
> [1]: https://lore.kernel.org/all/20250816033327.11359-2-ziyao@disroot.org=
/
>

Hi!

This doesn't apply on top of current gpio/for-next. Can you please
rebase and resend?

Bart
