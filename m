Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A551DE4C4;
	Mon, 19 May 2025 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659256; cv=none; b=hiJZ0FctTfC18OoCFvvEgrbsxo58MnVLU03K/L92ubx92IBhOLQDQ3YXN1g1lOeliWtFo4c+P298mJJMEPbvlzXZgzrl5PYW78Q5RxG94UQbPK5NJ1a5D+6s+o76XiWpPzWyHktrv45g+NMmW5oMb8P3AlNQzYZ08fkQg5/VGwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659256; c=relaxed/simple;
	bh=x78X5Qk2wOaNaE24klYJQRG2UWjwRL7c+W6Yq5b8398=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZP5PXMq+Jjtje3nGgXu4pQMXLrW1YaEkCAGj6KsR3bUKjsUxy5D5QMbhYrcuDZaN4+V3zCCHSWRDD6r8WVvOJKrY1P5Kmzq+YKBNilke/e15shv90VWQSHlZvhlpi8GTg0RJrpnzreq+o+JsGv2FG3pgP+G9UCALYEo3NspksH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e2534c08a5so673267137.1;
        Mon, 19 May 2025 05:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747659252; x=1748264052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRBvgTHgZntCXNJBY5rtdZ4n3FATvNkFDQYn5xNJfuw=;
        b=sZQnRFtNUfyHJhJBJ5ywwaACoGHcFjKN+h1oUNEwYtUQshxD4KoAjQ/SedhI/rzGfr
         9z5wp2PO1pXaG0RUe7xgA900SGevaWd4GFycdL4tzFbzArgtcVZed6fPRUst6Ztm1Prq
         vSKKya2bIWu6WvGrwucZuupwdRUUuu/Q7IKAgmUS6n/VUgfn8P7pTz4675NnHKd1DR8t
         YE2piq9+fM6olOGeAC4VeCLxLZUyNHuzSY6vpXlsekC/OmAgfOGauW3y8mLdQfg3JbeM
         ToVwiuY+1bQIEV48BJJb+g9Id1K1qe4gl3fLpRrQ1x5PIJTs4qHBJAK2QbXOshsn6zNo
         M7/A==
X-Forwarded-Encrypted: i=1; AJvYcCVLf9s1QtD+WnU26CHjmStbZFOffA71qb/IOTkCrjz7a/ZAJoOobzg19Pp7rK8H/ZuHeNN7yCmxh2HcRA==@lists.linux.dev, AJvYcCW+EbUWiDN53gy4kpUh5JopECaK5cUbCnEezxe18A9VYpkyOi0Hapc/quEl4d9bBtSEQOiOc9Q+8/XN@lists.linux.dev
X-Gm-Message-State: AOJu0YyA1iB03FRzbk2YzsUsNKvFDrUcrmatcr93lRMQAeNRorzdGFsO
	EFR+A07rA8WglXJmQL3uaBxvrfh30D9pApDjA1FAbGpZJqEyGCzSUyHcmwVB6OYA
X-Gm-Gg: ASbGnctRY0PppNULRjSJp6iiyqdiOe78XEfpGU4JjHxDAMvn80XmCLhaH0HJu9wDR43
	lmuV/vcUF1vd2hkr3/NXzoWWAFTHx6DK74Mv2F/yxW3asKYD5zoHfRhqGE1SRfbLOHzK7+shi9i
	P43rWwQvep8Gn84sA7c4xJ9sj6NMuenT2jsS2mfnI8UpjJWPna/Z8gRLyo6WYwTqKcDtUzj74v+
	HmLb1zByqarAgiLG2wbnofFlSP6DTlj31ieQ7osZs/CjQ2eEciiw38Soo3Lxay7o21EIoYdL6DR
	c+zy/YoQOzVqjKyby76atFIYTuN+c2ViSxInEqlj9YOrZKNJxupzyFNdDX/CvdoxOA4IYQdvrKy
	SCUWQ8V1xYi9P9pOxqg85u3q3
X-Google-Smtp-Source: AGHT+IFW+DggSgIUxbgeRZ6S1+GM7NArLSr+Xa9yVsGjE0AT5STcrRs6cFiBNNUtNxMNKLr5R8zYVQ==
X-Received: by 2002:a05:6102:2089:b0:4e2:86e6:4688 with SMTP id ada2fe7eead31-4e286e646c2mr2341639137.2.1747659252279;
        Mon, 19 May 2025 05:54:12 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec10c52fsm5826978241.3.2025.05.19.05.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 05:54:12 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4c4ecf86e8bso1492656137.2;
        Mon, 19 May 2025 05:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu19vcoZ3YWQGaUbTX85uBmIJGCwomUejern2ZtLNszKfNRLlEaOqSLeRa027hAWBXb98nIRmuwGoUbg==@lists.linux.dev, AJvYcCVeuw5gV6vhCFdgczuCokXF7ejSLCigm25eoeVNFCiNZqYlH0Yua1wOV/LLb7zK/r236tK6kA4JT660@lists.linux.dev
X-Received: by 2002:a05:6102:50a4:b0:4bc:82f:b4e0 with SMTP id
 ada2fe7eead31-4dfa6c4654bmr11600429137.22.1747659251869; Mon, 19 May 2025
 05:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 May 2025 14:54:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>
X-Gm-Features: AX0GCFs8QnZ4h0I_0NgB8aYbEDIYXLj_xXnsltgGbg-TV1xw1OOT1Ne11-uflm8
Message-ID: <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>
Subject: Re: [PATCH 0/7] archs: use proper node names for GPIO based I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	loongarch@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 19 May 2025 at 14:15, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> A lot of boards across various archs have a superfluous '-' in their
> node name for GPIO based I2C busses. 'dtbs_check' complains, so fix
> them.
>
> Based on linux-next as of 20250516. Build bots are happy. ARM patches
> depend on another cleanup series[1], the rest has no dependencies. I
> suggest that patches go via their subsystem trees.
>
> Tested on Calao USB boards using AT91 chipsets and a Renesas Lager board
> using R-Car H2.

Thanks for your series!

>   arm64: dts: exynos: use proper node names for GPIO based I2C busses
>   arm64: dts: mediatek: use proper node names for GPIO based I2C busses
>   ARM: dts: microchip: use proper node names for GPIO based I2C busses
>   ARM: dts: samsung: use proper node names for GPIO based I2C busses
>   ARM: dts: stm32: use proper node names for GPIO based I2C busses
>   LoongArch: dts: use proper node names for GPIO based I2C busses
>   riscv: dts: allwinner: use proper node names for GPIO based I2C busses

Hmmm... which of these changes affect the R-Car board? ;-)
Am I missing something?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
