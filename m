Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E071F191D
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736326580; cv=none; b=RZxHlfB20AKWfy/KomdvZ9st+2+RMgHE0iVflAI0P8mgQWn+CBx8WTaX01MgxTzzH6Q6fl7jfpaczTT0SAR24boJO6tQx2PXlhpvZqcg8OgzUYisTYbal8E8FAxaikvn0Ormst2VfzVtnm2UI/5mgf7Popu9BQnoYQkDNTf310A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736326580; c=relaxed/simple;
	bh=Onk2sSYGQZds3QFhzUS5kPgszj+f/9AnZ44JPnWgoPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXpeKwHshw6UbbHdqK+JOjgMwXgDkHJY2axa5LfDXXrExWnwuufHn+AaYDaE0pGjtImnKVOf1D5fO5yr4Chs57rBcMSDM47QfS8YcY4Z0olETizdvtzqjovMZdETx29kY3nCGJY8x+AZmHLO/ZurTciOEEKYLvI1OlhUS5KXKmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YpjehHhd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YpjehHhd"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862d6d5765so9591133f8f.3
        for <loongarch@lists.linux.dev>; Wed, 08 Jan 2025 00:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736326577; x=1736931377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO+JB9RNaOgeHTnZl65iiSYnag2FqtwWn60OLDwZTBs=;
        b=YpjehHhdxWTwpaWST/sOgc6jb+RGhir1jJizawe6dofV8716a9hxs3ApKisLg+JXJB
         GUj9gAhZ8fnKh40plBkH0TKKAUsgClGeSxyI0XWJBJYlLsOopxiYdKuHUZkm5EzMH/9i
         x1Fe0G9pm9Ew8cMGv+uas318ru+nK2k0WbOLGDrPDm2He2/IPEE/dEHCKGrtl3bCaIP5
         OqrDg0077nlXu5MbwnLvfEcBndhHuoW+L0UqakG1sZ+QzP2CCecRZ8XyrQS0RqxwRmKq
         ybdPm+h2wLCIcj/k1Mpq9RcTYBP37vQXBnDLuM1kIPvAZAnBf+7SXqMeZq27BDYeJWY8
         pBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736326577; x=1736931377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO+JB9RNaOgeHTnZl65iiSYnag2FqtwWn60OLDwZTBs=;
        b=t8UpOcUQlGZDF2Mi1Ygd2M78RlvOW4+41IPZ8r7bUp6kUUw7GV8/dqVTZ+ij8rvHjS
         D4hatZdPkFBnKMZyk+NiSH+NifbEgRA7r5gu481+WZ+q0TyPg9mySKd4DQVKng2RoVL7
         rbPqbPKgH6QRBY1jJ7KCvOS5KbQ88tlqB1nnlWe2Jlps3xP+7FLKB6FYQdkKytcAC+W3
         WMEabk9Cq5JLWYg8LsZ3PWnCVtNO+h6POene1ydBt+7xsNGWQzv5AuH6HcJY1gLBotil
         lsMi40WjdBr8+ydzcxIS28EDLQNWfkWfCOZ8vTkdUhZo/2/I9b2DQJ3yboEOjdgwSD6Q
         PQXw==
X-Forwarded-Encrypted: i=1; AJvYcCVQkmi52njI9tZ7UX9lqvhJbbrNhjAev20t8w5KpqN5zTQdWr6+fHM9jWb9otV80WE2sVD13h3FKhk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8xhuqhcYke2730VJ+ppbpU5gHNIQ+IzQR6BW0oM0DH2d/n0eU
	mdiX51qNrFojNg5YBaCUff3erinFqtI4hs3cEWttL51BY+IwEn9zkuM7LJjLhfg=
X-Gm-Gg: ASbGnct2YjTWlhqUoQfZMCFfOdpQpdXPe006o+EhYVxkGweWzr0jUZN/LzGPxw6EBm7
	co/5uGCXP453jXO0v75HT8D6d1QLSnuTmJn9KvjJxjpg4gzNzNWl/eyVeHW72bN2bUDXIibNEMy
	JKVhEQN/pAxS//j48LVCwXGBfjmr6i9E52DFXWpXtpLumg+APM2LZ4/qgRrHvKd/dOyzQe4s9tV
	9wcLQH558yb+Da2nRYpA4Zb0ubmhHpXSQc0/EExFgglpOtPstXQveOk
X-Google-Smtp-Source: AGHT+IETKzpogOxHCS5WOaTSk4WK0hUbdMVAsdx0TJoWpMC7K7QUnIRdsGKQkBaIeB8n8RulNzo2vw==
X-Received: by 2002:a05:6000:1446:b0:385:f47a:e9d1 with SMTP id ffacd0b85a97d-38a872dec76mr1506977f8f.17.1736326576734;
        Wed, 08 Jan 2025 00:56:16 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2bec:9854:befe:756c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c6ad3e3sm54122526f8f.0.2025.01.08.00.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:56:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	stable@vger.kernel.org,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH] gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset
Date: Wed,  8 Jan 2025 09:56:15 +0100
Message-ID: <173632657312.7338.10059795793670742517.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107103856.1037222-1-zhoubinbin@loongson.cn>
References: <20250107103856.1037222-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 07 Jan 2025 18:38:56 +0800, Binbin Zhou wrote:
> Since commit 3feb70a61740 ("gpio: loongson: add more gpio chip
> support"), the Loongson-2K2000 GPIO is supported.
> 
> However, according to the firmware development specification, the
> Loongson-2K2000 ACPI GPIO register offsets in the driver do not match
> the register base addresses in the firmware, resulting in the registers
> not being accessed properly.
> 
> [...]

Applied, thanks!

[1/1] gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset
      commit: e59f4c97172de0c302894cfd5616161c1f0c4d85

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
