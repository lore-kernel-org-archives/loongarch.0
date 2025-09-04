Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3CD26E6E3
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 19:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757015087; cv=none; b=hJQHR0d/Y1oYY8csloHtMKv3eAGq+hfW7TdxCxpom8spl8IOfyUf/Z59rjDWJiY7OS13y7+eSxpsPu4QeqFBKGaFoQvsfH64wDWXAIZJcMlUgo72wuUAg1CjES5c5NHrM1L0aVYxJpYbj8z6YdvEB3da2AYHKeEERFItPkwH19A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757015087; c=relaxed/simple;
	bh=nrsoN2cRsUh6+oDjNodKxMkbhTbg0va/okCb6ReI6KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tweEfq1CjKCm5GXVs+4Et0k0HmVlkrwB/yM/HSsiFIIr6tNVsGz/nIDdu0HSaIlikpsxE7W7bJDS+LsJuLYBwOYnUIJVhla1zQU54+Rk8WRHDW6lBLsKx+EfJBXF4VyxobpYQJmnQ2qD6PEKbj9r1k1yE1sZRj9Jxdy0Wsr9PqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=okDYUyUf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="okDYUyUf"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-336dd55aae1so13659811fa.1
        for <loongarch@lists.linux.dev>; Thu, 04 Sep 2025 12:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757015084; x=1757619884; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrsoN2cRsUh6+oDjNodKxMkbhTbg0va/okCb6ReI6KA=;
        b=okDYUyUfjkbzZxXJYYKoTMFHWu0tLrjlsEluYKY82CLIYSfRcDt/sKTWlnHrBGY02/
         WvNnjOIM2okR9XBJEbDdc4620tCcIxq4BU8ynlDODG8VobIwkZ310uFGYmIUEdVjtlFt
         PndMsX/aHVMdTPJJ1LRYjYDLmYlBGfN7yaPeYSJjcVqv1s2LuZ/ukY1MwqoLXAjBGXB/
         +0ZvVj68Rd6tOKr9wozdTVxHcVXosxbRASXkg5VyRSDVZLXA3oayGPPtJBqnew80nA1d
         P5fWFyNGHltOybluXplMvhmgA/o+O7Wa0zIHY7Vq5CdVkx0+L+TWdvehtSRFesLM+AQB
         9A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757015084; x=1757619884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrsoN2cRsUh6+oDjNodKxMkbhTbg0va/okCb6ReI6KA=;
        b=I7O4/XDF9XWaA1XJ4T4ZW5ePM9FByl6RJvkTUYzt4/dvD0akTLbohLXp83kllicOtS
         YXdJzX6As0uBcONt10qoD4KyE1SnF5N7/pufQLxTDcNuiFRNsG+bEM1syBcggAeHo75k
         bvrDwQwxvDe8WoJJh6Qkf6xvMBwwC90CHXVBCMEDBXo8d7IC9xuyJ20/bBuXNBe55RAK
         Vo5aTKgUc+yg+udvFv9DeWGR/hFC1Bi4B7M+tfNKD+TVhlFKsE3+UDt3CZ5ocZKOZiLi
         9eh/VDSY3V2kG5d4sedt5HMJ3AnR83cXVnWc0APqacqLg5eEbBHO1NBslw/C8AOBusIP
         YJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0bxGoXCV/0MWDlE7Vuw4E5i2WVxpA7pTSEglfseFuFE39HfcJdIPvW2nZLsTtz+6RIlpv5/3yqg4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDBXfUnHIc2MM7yj2DbOpsDTEj6HpjcRvNQ+94NJvjAxZUjWSU
	pxnQAhHzZewnKu6tvaEeTiRWjL9KwkMVh+LpAXz1RC2HGxAMygL52HlkEmUc9DMy7r+Y4/xP2md
	qRRR1ArjhKjsQ3FtQfkhU3a4JTlWLV+u6yk6fkq/TLaE5GI58CQK+
X-Gm-Gg: ASbGnctMRYGTa6UJCWKsnv1ea2N7f4SemUlmJtBo9So4bsw7yhkt/9iySuSCdo4UJxw
	veODs18xANcE9Ry+P/Ck3IoL1FtkX90uzuhcwVw6qS6yTa6E1G5wPWLgfDRbVSavktsJNkLk7bJ
	2lJTPZ8VNwBjpzgL9oXqrF9ZaVVQYQFNmAci0Ox5et1FqbOeMBq+8Vblh4clK51f/UBfckefqmE
	rs67FJBz+HdhwrktA==
X-Google-Smtp-Source: AGHT+IGW3Q5mVQSa4T86jRPxMcDx+PrjgBKT3CCZeXO2AlCJTgPkak9+H+1Qa+5a1Zu0cS0PJQgLLRFuw4VSi8OlYhY=
X-Received: by 2002:a05:651c:1118:10b0:334:45a:6e65 with SMTP id
 38308e7fff4ca-336ca9dc2e6mr50813331fa.18.1757015083748; Thu, 04 Sep 2025
 12:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250904013438.2405-1-ziyao@disroot.org> <20250904013438.2405-3-ziyao@disroot.org>
In-Reply-To: <20250904013438.2405-3-ziyao@disroot.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:44:31 +0200
X-Gm-Features: Ac12FXzijnUJnUS4O1_UBtocPghj3eDGF7zfv9ZNj6v1waFbdxgsEZ7rJIcKPss
Message-ID: <CACRpkdZJ16O+t87aB6dVm7kqCNkiFQiExDVjRJCRgNUhDbzV4w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: loongson-64bit: Add support for
 Loongson-2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 3:35=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:

> This controller's input and output logic is similar to previous
> generations of SoCs. Additionally, it's capable of interrupt masking,
> and could be configured to detect levels and edges, and is supplied with
> a distinct reset signal.
>
> The interrupt functionality is implemented through an irqchip, whose
> operations are written with previous generation SoCs in mind and could
> be reused. Since all Loongson SoCs with similar interrupt capability
> (LS2K1500, LS2K2000) support byte-control mode, these operations are for
> byte-control mode only for simplicity.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Uses generic GPIO IRQCHIP which is great,
and generic_handle_domain_irq() so I think it looks
great.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
