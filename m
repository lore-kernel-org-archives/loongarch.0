Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753012EB857
	for <loongarch@lists.linux.dev>; Mon,  8 Sep 2025 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317145; cv=none; b=bkK+4yLtu6vm2mEn+Va8o//XrDz40I8eGmNKvDiwzj05zIBWOzh75MUdnUZZIz9xIIeXY47VV7nUZ9eFpFcVjYocgE/HvcQVVLom85b6CSPMCDODUEK072KP52kvBc/jRCex1yEM2ziRSoHU+KAcPjT7QR9knef2njFXOx/gdz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317145; c=relaxed/simple;
	bh=4mkikRFBIlnv519piceNvC2q0vRXXnxeCTIIkGspFak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJcbxmpa9nnXBFpWagCdjDrTUt066w5Tv+nYSH7pmhB4VaqkFMBeo9FafQ+cgn/Y5HuDjkHB/tQs8odJWRmxCjrEFMXgMJX3z+BB4SPJYAjpZhEAkUxeSpuVG9JaXuYoL0zGQ0mDjxwHPS2qwoOOulg7StGs+V+SfXCtQC9QIr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M0F8tWqk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M0F8tWqk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45ddcf50e95so13925905e9.0
        for <loongarch@lists.linux.dev>; Mon, 08 Sep 2025 00:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757317142; x=1757921942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VA1N5nJE0Y2B6m6KjWxlCd1B6fND0SNZY3zp3/3Jook=;
        b=M0F8tWqkDJee5IED/Ip23ztPWAevYSxL3M+uvTD0sIMNd5R35eC4FXKSQkUlZ3Ov14
         vrzo52JdiTePIbHu09wp4dMIErIjRW9/o3j+WSYIcvmKqJC6JRxhwhLoZcqh+HPzgJDl
         ZmJ06VyigJJgdfe+EbloxmfPy1XEGjNsrkQqnXe7FRlexYwW+CO0VnnqAd4CoHmGUBr7
         PEz0SfoeHJ+AX9TPCtQ3JAa9SaLwJRnGV/zY+kUgmOaHmmcxU0l0CQCqXcxj77b3TgRo
         G8r086vEbK/YRHbVzP35R2+QzkZ+rrYutGfmoA4vr2A3HuJllR53z347U4VHp5DpftlM
         xelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317142; x=1757921942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VA1N5nJE0Y2B6m6KjWxlCd1B6fND0SNZY3zp3/3Jook=;
        b=Dz3mXzda6wDHf3OvHPblmoJVOw6Ejnkk++tUL2BtkJcK1AN/51GDQnjT28k+uivYEV
         BgjbsZmjJ4jaG1pj9YUqQTQ0Ox/E8BlqlLyXGkNy3UGBQIhid2fKFT3fhvBJyJGvTTxb
         tNJbGgV9dv9KixoM/9LJaHYoxh/9FIZ518ka912Pwnuri42fNgAlxw9xEPzDs7AN1wll
         n+ltjbIS7Nt/+HxN9AC1co1YpEJPW876SoWSC1NnBAKv8mhLPEr6IvGYcYyZTl4tE9uz
         XF647HDq/oSvmnh67ukKo42alLWBjSB9YwkLsBWmgC63Ja87V2t6mshmnzWeXSufkqrb
         iw+w==
X-Forwarded-Encrypted: i=1; AJvYcCXMNNziKB/uPd13Y2ubQhPEboX+BeJGWhzRhUjt+6neY4EZccUHV/UHLKoEQZPW0WZ7+Kcx8CLwRR0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr9owmt3F8Bas5l2awa7KIFSnnCi6bCOUo+IA29AjNS0aq+0Y5
	FQXza1PphMeGaYAda2Ckib0cGd0wycQbWZOE2IvX1oCZxtM2NbAFl+Cqe+SbiBIVXWA=
X-Gm-Gg: ASbGncsqKuq6nYieEo486F2vcYxNxoSX3tdQxLuW7Wcqs60fiq3ZsCp69KHvvXmoP3G
	8dwIJt3IQkZ/IXxSndMTcxhsQhdW5mG/fuC6LPYxuUOlShRL6ga9iycbpGBEeaRo2gc051G5tgm
	GkcWMzbmTdlLbnRSbM5hsW0mOEwUt/qKt0g4dDSLXyHHWYVuYsOvlaxoN9aHE07xQ/zoLEShxNx
	PGyTM+BnRywzUlJY9QhuNc84Wny5Q1t3NQTYClQ7Xom+o2tAuc3BzdQj3giBXsfeN6fGEYEW2E9
	DlkYMIYE9AikKnZApkktF0BKOOe/PrL8pWb+9ZtH4S+WkIYP6bO22ZAsvxFr/BKSe0uTYg3HEdb
	B9FCCNtfwJu+W06qiEHaBejf0HIGbTFjMDOA=
X-Google-Smtp-Source: AGHT+IF1yoHE8XBNSmCWKbccFdvIceSk9MKmYJ3MajrUvEDp0LEWk3b7vAXOa2mkv3XALARmVE71Vg==
X-Received: by 2002:a05:600c:1994:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-45dddec8c71mr59299725e9.26.1757317141785;
        Mon, 08 Sep 2025 00:39:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5cdc:d980:b6fb:1eb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e92a42asm429977665e9.20.2025.09.08.00.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:38:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yao Zi <ziyao@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: (subset) [PATCH v3 0/3] Support GPIO controller of Loongson-2K0300 SoC
Date: Mon,  8 Sep 2025 09:38:53 +0200
Message-ID: <175731712490.48218.8429152317469745500.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250904013438.2405-1-ziyao@disroot.org>
References: <20250904013438.2405-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 04 Sep 2025 01:34:35 +0000, Yao Zi wrote:
> This series adds support for Loongson-2K0300's GPIO controller. While
> being mostly identical to previous implementation, its interrupt
> functionality hasn't been implemented in gpio-loongson-64bit.c. PATCH 2
> implements its interrupt support with an IRQCHIP, and the code could be
> reused for other Loongson SoCs with similar interrupt functionality like
> LS2K1500 and LS2K2000.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: gpio: loongson: Document GPIO controller of LS2K0300 SoC
      https://git.kernel.org/brgl/linux/c/084d01a173f5f41afd326b1dfe73085972530ca7
[2/3] gpio: loongson-64bit: Add support for Loongson-2K0300 SoC
      https://git.kernel.org/brgl/linux/c/03c146cb6cd14fdab2d2c7ab1b4e8035b54df8cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
