Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4822172B
	for <loongarch@lists.linux.dev>; Wed, 11 Jun 2025 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645228; cv=none; b=QpOh0hoSuK0bzIpqW9a/3m4lxNVATc247mrdl11Nrjbz7pVjV3tOEp+CdWWCxr+HW10zqNB5FOcmvIMAs0R51pXIO+ZOqg3t7FXw6ZQ/hdQGdHIAaNBF97LwaU3rtmc/Sb5FALdTJ6hAy0l95inLNMAxjsxz0yekrWK0Uf0OsWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645228; c=relaxed/simple;
	bh=g3NAXjEVv53ME39m4WFK3zaviYHTbygBx9suNW1Gghc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TuPdIcO+MBmkD8VK8KsCgTO+Rg6kCmZaueolN756Yg2Ua8MkPT3nJMqdqTZfxVPQxACySsW2kpE5Q1GfUHV+tBgPCWlulA3xt8iK3zvYx8kmRQn962sORPAdfhKuf40twyZoSfiA3FdFEs9yXzyj5/GJF1R3F/EvLc9hUArbejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ediz3vxq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ediz3vxq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-452f9735424so17875705e9.3
        for <loongarch@lists.linux.dev>; Wed, 11 Jun 2025 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749645225; x=1750250025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58tB31KJ4kl8/PiwakZKBV9Caj2k0aAHpQ5UO46MXf8=;
        b=Ediz3vxqZ1HpdwfBJavOoIpFRGg6ebfHXBVxwu5WgjOcXBGZavyOf7woi6ZmRbFGLS
         Lbt/GIb9JUFBowp9386txWgc7ey71DS03nV6MbLI1ovvQCNzzYpkxOAmhiWv9IOgEGjk
         CyJ0hilfBzs71BniNceldACLrjIgSjCgvhWxf0HXWN0D+irvzZZ0zgKvrKwDzMficIVU
         9hU7GtIhTJl9GwmKw/9fFhjUrVBhxLRjQ63Gb5VHM4zew7Sqlc/nseM4+fV517J0QPJe
         +VXmOnObIvQLgzKGrXiJoZnMNuqxMZxdPQL0vot+QYDvPM3NFEfkmcum1oz0Yfdq3ZpZ
         6edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749645225; x=1750250025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58tB31KJ4kl8/PiwakZKBV9Caj2k0aAHpQ5UO46MXf8=;
        b=MSbcdLt1am8+VCERpQBQRmhxIRFD1ztUsnM606c3NkS/AN2wtmhqntzAd6acNBm4qn
         dW55UhOjiqTJrxuRkyh1xz6FCGSlt5KoMhzkZw9ZGGundUexw0+5Uehz/n/XT8Nxxrxl
         CeEVDkTzBmlBKmvdoLs7v4ZmhHpT44RbACE50lkHizZXA9yzA3ypyXcNEZCFgu3Te2/B
         UyqUZbN4U4M2B3FuQBWVPl6k5+elJ6INGeYjY3xSRpuphhpXn0IboUAzezlpzsIhIqzt
         tnKSGgSt8kGgQcdAwgd9RgEp2PStKMNAKts5UVKOCd+PsCye/bsJTC6/NdXDoF3NvUhP
         HjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwFOs+EIYFs0ZsnI65I75rd7LCm+BmuisKB1Xg3jI2+KgGhvDh5Rn55gXft7xFrHDXfdHsnhC7FUE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxM59fKLHUWPBtvSWu60LYuttrrV/gcsVrP84X2PbZwWfZ5wxvc
	if2m/JIWtp7/J5P12eZTXxIb6SOmUMKPjw3aTCpTLVetOHxeAbY2rbHJCyy+tsyyzoU=
X-Gm-Gg: ASbGncvveFg6dUrKmKxDiSOGj3tAmGuUVpCpKavn/jcbBlKQkP/2DJqQ/0TQsz7rRoc
	hKxkCkkvJABZ5OMufupAXXDl8X2VyHYXT/KXtXGn9RMI3DsB3FbtYLf94QtIHdGGO2pKZbeG4mL
	LqgekXX8C2uB9NXVI2FGrxIDyjTdBsu9DfQL+6utt2f4pibOyDXwrO0WhOIcKh1ovqWJqpbqRqt
	I/ppe9o1sa93QTRBf8EN3d74rfQMQd0vweYU0T1CQ/5q4gaFD493WI9J9UzIB6+O9rSHsT/NXiW
	LiBGzBNgu5S5Q5ua0GW5MqNOvUTsq4k8RnSgbYivWhnXZ6S+Sw+SWavGNgpqh8U=
X-Google-Smtp-Source: AGHT+IH+yTHZNTGeC/+RF5wU+jFRSmzOWMhHxhfFM0B/77rWsjy5ljPuBPABLlLuzVsDVde3T5b07A==
X-Received: by 2002:a05:600c:4686:b0:453:9b3:5b65 with SMTP id 5b1f17b1804b1-453248b09a4mr27662635e9.8.1749645224718;
        Wed, 11 Jun 2025 05:33:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453252165c6sm19762355e9.29.2025.06.11.05.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:33:44 -0700 (PDT)
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
	stable@vger.kernel.org
Subject: Re: [PATCH] gpio: loongson-64bit: Correct Loongson-7A2000 ACPI GPIO access mode
Date: Wed, 11 Jun 2025 14:33:40 +0200
Message-ID: <174964521463.38087.18017006359179937333.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250610115926.347845-1-zhoubinbin@loongson.cn>
References: <20250610115926.347845-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 10 Jun 2025 19:59:26 +0800, Binbin Zhou wrote:
> According to the description of the Loongson-7A2000 ACPI GPIO register in
> the manual, its access mode should be BIT_CTRL_MODE, otherwise there maybe
> some unpredictable behavior.
> 
> 

Applied, thanks!

[1/1] gpio: loongson-64bit: Correct Loongson-7A2000 ACPI GPIO access mode
      https://git.kernel.org/brgl/linux/c/72f37957007d25f4290e3ba40d40aaec1dd0b0cf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
