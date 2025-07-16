Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A12EF664
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658471; cv=none; b=oFjP/pIn6IQ/zcNwvOo6zLIJCbiM0FMyLFeMe9msBvc0pq/wm89AsMnTyX5avp2xR46z6KkeubPEfsGphofd4EE5BmNZ9hTZ0/yUqwBWhbZXWhsjn9sKWkWR0ys4kjBwWI32zJn6AeF447KIgASQOTsAvvS68eDKq8DH7ziv3cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658471; c=relaxed/simple;
	bh=Q5vaseOVMicvKjKhJ1PcLGMQRqy2eYGoRNUY8CbcxBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qhm1o1wUuxEnfM7C+E/Srh3HaxPSAYS7jCsOLdv9P+PW9qamOP/gNm5y8xeCQlN+FwdRcVevPYnhqLBqCzmkqvxqmaYrZh+52CV7URtQ/enLmrAchMoD0VNmvOivstaqngvyI8KDMQQsG2X4LAZnw/cLBZ2PUp7kmVNop3dRltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=J7bhKkc8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="J7bhKkc8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso47773205e9.2
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752658467; x=1753263267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vR1kEx5MpapX5QiqbMmlgDd5/xNfubElkSwNGlcT7SU=;
        b=J7bhKkc84eb7bcnM+/DN6f/w71RJeBGv+U0IDjnhs494PdKANguqUt9wCjOsXiUk9+
         RgmdoGwe880hB1l+xc38MO9P3SroEB+9L9lZ6p8CxdOA3NvSXuljychEiSRUV6iVtzxL
         ylm3tkZqTMAweGp5FLFFBJMtBAptC5dFYlU/HTkP9BuhyGMEwXaxRHU0AO/9HBBeZeya
         05+Km7LjXUOtIawn98rHS1WlyLm4kRjApvXfrOuS8lqifjzr2H82xPnPZH6qsr9e1ZVQ
         /Y0/BqcjAEtGZn6xwRp2WksMGToeF4lHDPL4VYwtTI+tdR6c6oP0zeKWe4416O8qAiuy
         ywng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658467; x=1753263267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR1kEx5MpapX5QiqbMmlgDd5/xNfubElkSwNGlcT7SU=;
        b=WDDH84cBMiEDIcPJCv8r92N4KWAi30yfxlMTLE+HIFbxn/G8EkTuMVebP7EhGYubwb
         hQmdrLi4rwUrW6HfNd+VKaPtdJLKg7/bgn9DStbbS3DBgy6jML4VIJ4zQeKP/A+ZxZ2O
         bngmeRb7r3zSDetXNbtE2uyyj4ezANXUEgvzpNb68AZLYkua2eBd0sNSFEgywp6xzDoF
         mQPSci26dBmrJco3zfGjcu5gfh9h0i8xG1Dw5hHFz+8GnS8Z95jzEtDLZOJUCpHz6pCh
         djLvD/M1YoRwZvdINTqhG3b8UjzXYLPy98C9DeH9Da7I3/95CwDUVoOyyK3X4OZFOBx2
         tfWw==
X-Forwarded-Encrypted: i=1; AJvYcCUt8w3DQN/JMHUkrTIgJMSyZ64Pe9rU/SGmwlTSCodj+soe2fG8wNSEyceelziDi6AV+0BTp53+5a8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3SCxgLMTFudRh+GLeiourSD48mStnLuS5tr/mTRqwGs+GV5Lh
	7jJHHDWaeh9q571YoTn3A9YId9wtbZdSi3hIat+bnaHRKF7/0DONH3fYwXHbFZH0Qcg=
X-Gm-Gg: ASbGnctRR97ko34dL2IfDkNi8DAaUHsLXMz372O6RSvS3xTar+LkZPuA7sedZRblzHF
	PVH7Ni8pyFQ/mLIbqPY5+WnFQpWgKHDiUtt45/rxM+25hawligbzXgCLC2DiilSA04LNG+wdHAd
	g9ayS55Vj3oXDtxF2Fkv2T3HnUBREo6Agxv0ki9NT5kD6nAYgfchOVqZvToUHJAvje1GdWLp+5w
	5rkJMEFO5fZ23APM0Uj6/eYz5ao5XlQ3KthTVwYtiE5fYms/QEfN+qDbwokxWo/K+MZssfBuY+B
	iemUGphkL2TkL3Zb7cLxPAvw9CTfdc5gDA3kSpa00geHhtqvMbaaG0PsxTXJzUFUvWF+U6nQTAW
	m0voJbU3hbWkiJg/A6WiYI9A=
X-Google-Smtp-Source: AGHT+IFGBjF281E0tPFetmhFR4EVWxWxpTuFGQ7+pIU175wapos6MK+1PLaWqFhEzeIF6rpsAbFwiw==
X-Received: by 2002:a05:600c:8b08:b0:456:d25:e41f with SMTP id 5b1f17b1804b1-4562e03bdb0mr17600755e9.7.1752658467236;
        Wed, 16 Jul 2025 02:34:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e8b9:11d7:19c9:41b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e8027f9sm15511895e9.14.2025.07.16.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:34:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH] gpio: loongson-64bit: Add loongson gpio irq support
Date: Wed, 16 Jul 2025 11:34:25 +0200
Message-ID: <175265846346.17224.4425884504505052017.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
References: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 14:45:42 +0800, Binbin Zhou wrote:
> Add the interrupt enable register offset (inten_offset) so that GPIO
> interrupts can be enabled normally.
> 
> According to the latest interface specifications, the definition of GPIO
> interrupts in ACPI is similar to that in FDT. The GPIO interrupts are
> listed one by one according to the GPIO number, and the corresponding
> interrupt number can be obtained directly through the GPIO number
> specified by the consumer.
> 
> [...]

Applied, thanks!

[1/1] gpio: loongson-64bit: Add loongson gpio irq support
      https://git.kernel.org/brgl/linux/c/27cb8f702eb789f97f7a8bd5a91d76c65a937b2f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
