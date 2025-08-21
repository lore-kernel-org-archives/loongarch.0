Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D630E830
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775639; cv=none; b=tePwW4OqWlvtjffgZYHkiUe584w6u1uHCBrxm2QLRuiFQzML2AEyvNLqGg9EUq6gQolPyDNEFH1cCR5zdL1mTOHYDK1fHNezUa80ajmsJpM/RSst4RfJPbbhOivYWk2SSnvHFN4P7xPqDJJxw3zytGydGHs95Ne3xzJZ3KxPzb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775639; c=relaxed/simple;
	bh=2iuhQehcGJ/STLL1wVwziWidGXccPhxvPLuOUY7+u3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMlMIKwdcJMbJlBOJvaTv1/t6xJRZeWRMeewwC5DQWDuGz7XX3vit5j2EbfCD8Nc8uCS8YHCB8POpFSJJpdO6UYf/Bc4aUOxRvsnw4fx+4V/1qX0yw2duzghO0FoeVu/1FtcXPbY0mHkzPQy1t6GswUI5N4GH3CHWTShr63Xkb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QtGux6ZR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QtGux6ZR"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55ce5090b1cso804090e87.0
        for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 04:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755775635; x=1756380435; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iuhQehcGJ/STLL1wVwziWidGXccPhxvPLuOUY7+u3Q=;
        b=QtGux6ZRzwNJFgDBV0euYuqiQ53ZBf2SGdQaJbyEXgrclECvAS+Xr9zPq9WqkcBCXG
         bfiNzxBtJ0GlCvCDE6eObEeP5sr+fvz8y0ZWXKIMN8G/0Ph+DvwhcVR8q4N3MTJd/M5P
         q8Y9Se6B0FWdGM6do/0K956cHdyYA0H/O7dnDOGphnujJZN3PDmNnQy9N0kaTKvzyirC
         P0DVmhVu+Jih6btGpC9uaK7WLYeDo0rw7CvE7deozfoUGF8VMyd+2iwst6IJo2CaUqMB
         gQylYT5kdqYfIpyEpudK1hR3BBVY9dEnXSFHWxF42S03PceDuqR88GL0MtMMA+IFPvMQ
         0aXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755775635; x=1756380435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iuhQehcGJ/STLL1wVwziWidGXccPhxvPLuOUY7+u3Q=;
        b=shQM1LnVw1kBmXZpAUZIjfuvsJ89tV9QgXMLH1infHN4UWpeXicXinfKgO5FZlsNm8
         pV0UxEq7WoTdZE0pqACdIxYh4+92W3QA9YuolaKGvecJNpQe/LGAoQf3JUk8GoxBtmMe
         xVpD2CITPaQrsj7r/GbK56mgleSNaFnnZJGtFqA0Oxu3dGN6YEzLpa5yvRslEaU5u1C2
         NH2FiRZiOrrNsEEncu/jwvUukW0wXLwqaxfQUwzStkuvC93looO0iy/Npkgh5FU6eD/n
         wNzOVEDZ5rgYDBxp5jyzbueQNKaL1pP2L8EzUvP/7tW/3MPUCz1v0cc1Vm6/hFsv3WPU
         iFYA==
X-Forwarded-Encrypted: i=1; AJvYcCXg54cIZ/99/5eb9k9853573zYu3mk72M1GjdFL5wC2tPtDDn88UpYv2nS8Zfywve9Qd2/iwrWBNEw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbKdH6acnfxkyI6MF9WbKNnMB7BHeO/wckJAPWyVXuLJyS590H
	H4fDmDiLxGsoD4GjRj6I+5yqkCcwv9AU7P01qsZ4SY4O1ZO6J9T/LUtCEscCned40V4m2BU0+Iu
	LJjoek2pN9w+XITPDbeTqY1qmhegt0ztW2NMybgjw2w==
X-Gm-Gg: ASbGncuqELkHXEJMqz6NkmnbEvHIFY+jjYf+V5QgJ00Op4ti1wK8QFFGgXBxfKhSRh9
	sbWCnXkjDXc0iXwXfW7nVw7RmvbO7IOCLO5bz4DdTPtFchnI5SksXddGJ1GIij45ddOJKWFUcl/
	rKrCkGWgTZlm3+KIOyrQIHZjyXCaU4MwxVE3fPQDP94W64IwGFqRrdv6pdbwk1NOP6S92HgVaCb
	is7/CE=
X-Google-Smtp-Source: AGHT+IHfxoqcChsLfygBUpUWn2PCNNKaUpVfkw0VSrAeJy75AQZfqbB6MGhf72lV5Y0Gxx16LXjumAnruYNQwdN8gFk=
X-Received: by 2002:a05:6512:2284:b0:553:d702:960c with SMTP id
 2adb3069b0e04-55e0d5c59f0mr805985e87.56.1755775635103; Thu, 21 Aug 2025
 04:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811163749.47028-2-ziyao@disroot.org> <20250811163749.47028-4-ziyao@disroot.org>
 <CACRpkdZp8FLrxgkeZ=xzSPgny51iDZ3KRCrxpoSdgF8_=df=KQ@mail.gmail.com> <aKRw1pEUUwd4cQoW@pie>
In-Reply-To: <aKRw1pEUUwd4cQoW@pie>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:27:03 +0200
X-Gm-Features: Ac12FXx9O5o9dI7NgdWBP_7YslWNrW827bj2s6nLtLSzojwBRCZi2QrMsWTrODw
Message-ID: <CACRpkdZCs6u6Tyos_ufBoeZ9V+51btEQ2wbPv1GRp5RNGZcUyA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ls2k0300: Support Loongson 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 2:41=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:

> > Which is fine if the pins actually cannot be used for GPIO, but if they
> > can, and this is just implicit for unconfigured pins ... then add
> > functions and groups for GPIO.
>
> For 2K0300, we want these pins to be able to multiplexed as GPIOs, but
> since this pinctrl driver could configure nothing for GPIO mode pins, I
> think it's enough to implement only the gpio_request_enable() callback
> and do the multiplexing work here, is this correct?

Yes that is the quick and elegant solution.

> I originally thought it's okay to multiplex pins as GPIO with an usual
> pinctrl configuration, and didn't realize that it causes conflicts on
> strict controllers since the pin will be claimed by both pincontroller
> and GPIO controller. Thanks for the reminder.

This is true as well, some drivers use an explicit "gpio" function
and for these the the new .function_is_gpio() callback is especially
helpful.

I think it is helpful if you're using the callbacks too (we can
determine if we're already in GPIO mode) but it's not necessary.

Yours,
Linus Walleij
