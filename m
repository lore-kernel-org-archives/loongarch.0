Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11A230F541
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331160; cv=none; b=rI3PyQj3vDw32Mp2Q/HBSzFipmlGZM3v8QJa7fOlY4arDp3R21zcQs81eM2xOc53evFJS8xxxLyJTYLKUfgs/09u9/ZknQrE6gO0ai/Ttq0vy57OMvFKR7sqZqid05DbBzZiaHF21XwGRcnd7JyX+eeR7KkTz1AjE3QB3gATdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331160; c=relaxed/simple;
	bh=FlbAgT3Fsp2QFJzt34+r8ldrh8ZXqT2HNPYCtznDzS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BN3C5vg6p7tkHKwETM4Tam8f8bh9vqbVVhWypWOiEFijPVYjolNSoc5IkXzegCuwlZIrEpV5Yr+FprWn4maxV2COFUToESf5ZOXi2LOnmSWDDjqTwZ96UtGdpzYpKldJ+GmRETrhmNDK+f22g79KOgI64uSg5PPt7aE5E/hLZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OG/DKkZp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OG/DKkZp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775895d69cso7741145e9.0
        for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 03:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764331156; x=1764935956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vzfBzGWa4ODlWjmtVQJGXcxzSl0srJUX999pZiDEZM=;
        b=OG/DKkZpzquwvCT/2ouLiURznQr26HHsLwgdDA/wvbI1YldJNFrd6xfWpl8cqufZuk
         C0iVkDR9bTT5LhBfZb77ibEHORjmIwc8VG2oyPYmqiXLdPtJHqjiP5tLPwNsnLogl6Mr
         6IZiyZpAe4B7DYDpNZAvuvk8ojUtDBkdflHhlaTX6PCUfF1dmQ3Q2b3YKmkVbLGgf6Ra
         ExHkA4cUfP95Vg/3WAtfbb6E835zY0l+ToLcz5v2eYh7NzYTGtGEkEa+SL/1M/X7SlGe
         E72wDiMXz+biIWmNHTjcAp/Zjg4LpRQGeWyAauof47R7R3CdTckFo+DD2gnmbyRgqhVc
         vNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331156; x=1764935956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vzfBzGWa4ODlWjmtVQJGXcxzSl0srJUX999pZiDEZM=;
        b=q+U5cE2YVPZRi3PPY5T84HMI+IALS+kaCZqEN23/3n1oTdPa+IuuH3IsouFKpIF2eA
         T6g124cbruyVEtp3t00dvErHpo0SRYO+nc6UNsNOITp6gl3oOJ+gz4eYwliN5EKGcA/m
         KF4lYe3vPkqw9bIa5grCZ9rT9IMlxYvwWY1QPZweFcj6qcZ+j1DjoCEKvcYolw7CYu/2
         BWyQYQY43K9Z5vnWdrhfVPihRKqAYo5puU6m7i3tD6MGL+uRqGWlORkWVgpoGr5OhqLZ
         4XEapgkWIiFQ9s196rhirOheOvdzOF1JxCqNJfv89A6LXFqTaoM6tslEIx0omin16P9t
         U5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXPSTgLSp+Oah8mctkedI3lbfAtSG64V69kxbLQhzjXyluIdiVNxOg42jfPfTrzqJgmharcDtF/bds=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMi3pfVoW1laAZLKHJQBnhQI4qvVzBtGEY0++ZMNQJ5bq5Wk/8
	TuiMDBfmjQ0wTor6xQ5mT0Qme/38PWPdXMaNsuhhPJ/Y8YAM6mh3uwSzh6PRc/Ag0yI=
X-Gm-Gg: ASbGncseb9XLSwieBtXqE24R+kz2RpMBn8VcQQTap5AAQwzRy7vhSY82ygFi8PKlMfK
	kP8guARvihlAim32zwY8NT7DS9OG+3xoOsS7W6W3g4KyXYmXHNzwXk8U0934214qt6QQYA09PoN
	5XeIaoQHoeZnHvgP4CF8rZb8OOBBQ30wxDTlQcnpfnYDTU0AL9V7uo18a5FPMnBjMVze2IPmqrK
	uJ4YdYlI3tE+dwiU8nPyQkL5vpSmSrCdK4VDCKOSXKQCzX6xXsRCwXOs1vdxdknVI0LrBNnTrO3
	RgEV1gi8bqqX7tSF0aFkc7rrZshHo/QtaWW6KlRuYWdp/qK4391QFdOu3R0XVszNRqaNG2sPxck
	XUJhTbdgPCVGxM/5itsJDVXabCQifvJ9pr4ZZoDG64ckJYQdkaIluN5b4TcbL4r67doFu6ej2vc
	DPZicI
X-Google-Smtp-Source: AGHT+IEblarfzojmnW5H0khhj7fcQLRiTfu2IrK6EsUrlrrVoe2bsVmRXDHPwcSd7mEc/1Ggu5xZRg==
X-Received: by 2002:a05:600c:460a:b0:471:700:f281 with SMTP id 5b1f17b1804b1-47904b1b2dfmr89703405e9.25.1764331155967;
        Fri, 28 Nov 2025 03:59:15 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111565a1sm81343515e9.5.2025.11.28.03.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:59:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Mingcong Bai <jeffbai@aosc.io>,
	loongarch@lists.linux.dev,
	stable@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE
Date: Fri, 28 Nov 2025 12:59:14 +0100
Message-ID: <176433115039.40295.3243947969244377474.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128075033.255821-1-xry111@xry111.site>
References: <20251128075033.255821-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 28 Nov 2025 15:50:32 +0800, Xi Ruoyao wrote:
> The manuals of 2K2000 says both BIT_CTRL_MODE and BYTE_CTRL_MODE are
> supported but the latter is recommended.  Also on 2K3000, per the ACPI
> DSDT the GPIO controller is compatible with 2K2000, but it fails to
> operate GPIOs 62 and 63 (and maybe others) using BIT_CTRL_MODE.
> Using BYTE_CTRL_MODE also makes those 2K3000 GPIOs work.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE
      https://git.kernel.org/brgl/linux/c/dae9750105cf93ac1e156ef91f4beeb53bd64777

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
