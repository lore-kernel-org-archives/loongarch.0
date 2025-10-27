Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27062D8773
	for <loongarch@lists.linux.dev>; Mon, 27 Oct 2025 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572984; cv=none; b=hioKiisrSERiyCquZI8EQAuaGhsfETPScpLdJyJU/7pg6cwzmgSePF6iDKQ9wkQ8AHayQg1KM95+vPe81tiWjH1NebVNP6AnVAVysLmmyhfqq5552tHj8aa/6y1+I9c/v6GCVdYZn8U+o2KYjkX5wvjU9EuHWfI7AxbtOqSPTDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572984; c=relaxed/simple;
	bh=mNZBbrtJBLOI4jfNhqKTpswdu8s3JqH7B1vngw35JCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AU7pXMWvvqDFAit/f8zCcsHhd0vuUi64kAoYXo2Qk5MyCUgerNbHXG0lDwNbEwW0Y6bFNp3rOa1qGrB5o7DUImXCq2PA3Jote9DuEwg/vBdKZs+eMajEEkwDB9mA6SobBN5D0hKuN+OZ2QI29OJtOw1N30qH+aY1O52E5aX8By8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DmOwMR9K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DmOwMR9K"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so28227605e9.2
        for <loongarch@lists.linux.dev>; Mon, 27 Oct 2025 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761572980; x=1762177780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+kYS15ZJlMDWJI88sBMruJfxX9FP2xe327EPNR98VA=;
        b=DmOwMR9KcoEyB9r5I0QpDICt0YMDKwJ3qtA1OTdwvH21UuN+Y17W2Kf5nsOqKD1vxx
         xfR18YoxE1QFxsFWj+TH/GNAO5BxOKXBH6qCOL70+3RoNACjv35bSA9+Fsfqfkbb+mTa
         dl4en6uX/ssqbQFB/Zt+Cbgyj6TyRbkSqmwewmN4k+/lWvAN3Y7BbvmmiXiI40Hp0x0v
         gXOztJOHn124Zn7t1YgGMfOldVJyQCGn/rD0Op2mADeGPY4/a+GMWyq91ZRupZnbgK6i
         1kUA1DJbyMRU5jognr8YVmjToMCpkfOl0xKIITaVmO2liO5RTxmeZ/6whZX1hx1RikB+
         +3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572980; x=1762177780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+kYS15ZJlMDWJI88sBMruJfxX9FP2xe327EPNR98VA=;
        b=Qujvlom1MFHptT+l/1+v+06xuvHlF/vAZBLWope2VdpYFeDG4WtAAXDIC045TpRPob
         2Ne5xwbXfKEorgVLY4RY1vHOH2nFmVKuuZnG55AVp08HOZQXDtpBlSxLHOZkzcvTUhcy
         qq3V42ZVp2O96kT7t4OF4dcKHIKx90owOAXZpngo9B7tY/+4HgdU78cKObJ2EXoAPXNX
         2ix0CRxNzhEt/5YraMBE3AdG9gnrzc4LWr/GyYrsEWZhU16QTnJRGuMmcskjAT6qGsL6
         pIjXch6Q2BuMFaF4BwRdpTbJ++4/AnQD2eQTNr7fARyodfdhkplU3sqBPNKZlBm8dJ9R
         SvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv0OS0BaQBHOFdC9depCyWNZ3PGpz6sCC/EDGSQ876H1nLMsyOfuGAwC33e66oEqG7SwcIDwSBoHg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeGy0HI+JFVOwfaMDN3m1iz/SETFQgYuJrsIVyVbhqSc1XzOQb
	ZOEvyuzq8AXuxo25Ch5FX0QiA/tbmw8nAojmWSCwi576LEJ/9v6uD9y1WZ2eKQX7O5w=
X-Gm-Gg: ASbGnctEnpoiad4wB4fyF0cz99yReJnrjY9cMVD2/NLF3pkngStK2H0a1UazJZn6ze6
	TQCcAItKebFcpUCZILU4QNDj+2n+QIZUFhNpwxvAXsUP27db0zo0cRJXXyZ9tN4tsR11krLz5tr
	Bw0LW+kKc6HUX8Pdz5iL/K6wYkjpFXCs40JV+UNEqqHjIorubHrLiwyIZGCGlzxnPOcVdXXJacf
	M5/I9tLC2T7Zo34SnfXKAE9JiQ9JSU00jbGfvUVu5/eVd5FZ49PPX8BDDu2eE+HBRiId8xupchq
	NVj4ijgCOwSdX9ZU0T9fnWtv4XgcIekedtOBg0jJSLPMyamboc9Rk7SjwyEGOHUrap615HZRc5v
	y6YwC+aJquD9GKaP5gLaihgVX6UWUYHjDfQJuV1fgirGQk58nTHAH0k2sHUjpXto/ZZXsAzLgP7
	bw
X-Google-Smtp-Source: AGHT+IGEpSOQmcL1jMgvwj3z/4bH8c3C2ATOI0Cp8JyfgXauzdAS5u+No5z57tgv7OTNqHxMeTrU2w==
X-Received: by 2002:a05:600c:4e93:b0:46e:4329:a4d1 with SMTP id 5b1f17b1804b1-4711786d685mr286976325e9.4.1761572980010;
        Mon, 27 Oct 2025 06:49:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm14939219f8f.26.2025.10.27.06.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:49:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH] gpio: loongson-64bit: Switch to dynamic allocate GPIO base in byte mode
Date: Mon, 27 Oct 2025 14:49:38 +0100
Message-ID: <176157297598.48241.17583971960894913932.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
References: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 23 Oct 2025 17:03:46 +0800, Binbin Zhou wrote:
> gpiolib want to get completely rid of static gpiobase allocation, so
> switch to dynamic allocate GPIO base in byte mode, also can avoid
> warning message:
> 
> [1.529974] gpio gpiochip0: Static allocation of GPIO base is deprecated,
> use dynamic allocation.
> 
> [...]

Applied, thanks!

[1/1] gpio: loongson-64bit: Switch to dynamic allocate GPIO base in byte mode
      https://git.kernel.org/brgl/linux/c/3cde66094575a5b1310a7631d28761bd3dfcea63

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
