Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B2612DD8A
	for <loongarch@lists.linux.dev>; Sun, 29 Dec 2024 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467005; cv=none; b=lmItMl6UTk5I0rqiy29Z5kUJSjOJJjzuEbya9mrff1x8gCAiY91X+xKwUyvW3NX/EatvgTFXBtDy0Nx+8/9oQW4Gf7Zq5ThN1NmXV2C6p0SanEkTkjpt6B4fOB8sqrGbOIwIoxT6/xyl4nqFus2Kcmj1gVWVExS7//hA2qIkDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467005; c=relaxed/simple;
	bh=MXdX52JXPaPeRjNreD2b8PAGxtJmsLoO66i8UJWgPE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MMddL75+Ywz179sFTV/v6j5QXE+6R+Q2qYnZZrhks8Bt1809BQRNwKx8F5d5dswKTX5ula04CDomIMn0k8xtwzNoh3LgNv1k/IJvc8yl8qto9bLVIPXqQgkHrTrYa1ry1bNwY0zWaG4lINtIwNVEfIwnxlfkP9vCmNDvD87JvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYVijDAB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYVijDAB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436203f1203so12032625e9.2
        for <loongarch@lists.linux.dev>; Sun, 29 Dec 2024 02:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735467001; x=1736071801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khsQQuQ61UqfLoQjYcyUre/fUsjYTl1Aj9lrnLjhkeI=;
        b=hYVijDAB0SVO4bnHXOkfOBejm7ELfMDhQf+5frVwimb8BEmKTDO2krgEScB71O2iQg
         TNuemv1Jf8LvkWqw1Tw4mOlNxBOHom5cPjr9YxiXXXNNn6iKcnxLJ6sDpp1FPRVW3bj5
         B6zEF5jjWabTgg+aRN5rNyDP6ptwya9muGnVkaE800fk2/U/oY2/vGPU8Fyi7vbMpuyW
         FmDBD0jN1qcJf/t4dXDrmdSIXw29Ti3nJaGSSN8d403HT24sdG+T0ZeA2OZHElPGcQlE
         kJeR7gdzCeb9MsYDdNxXHjfHeSA2Bot/w7I1NvS6BVOUJPU360pMvfrh+XzpNihEVDAD
         Di9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735467001; x=1736071801;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khsQQuQ61UqfLoQjYcyUre/fUsjYTl1Aj9lrnLjhkeI=;
        b=gIoxuXRa9wd+hIN4oBUP5Z9/sQcKwzQB9aepORrHBxhwWHSD06UlUmqpOeZD1MZHjV
         2AXIkCtmkud5YeRbnfSGRgkHJK09RYTABQzpuTnN6aVRF3D2F2qZrgJ8Bm+kdH2Ww0aq
         Fq1RdoyMhUzJsumRH/mCEm0TpxqsSclv7W/PxmaJmd6YFiA8PDSQlOzuYUKDFvJdFtnt
         1GXy0Xf8CS3PwmliNoWFO2tWbHGtcrOvxN0MdQIoNYwCIx3MIYZQ/HVGwh39A8SA0S91
         zD/VhuLWQp2Rxl8LVKH3IlyxAarhQfBidLmhb8ODevhPKNtX6jL0qC0VEaJwRykEm90g
         1W4g==
X-Forwarded-Encrypted: i=1; AJvYcCWtcLZs/T4lMEWd0wL7niAD24eWx+8tUhWE8zQZCX7d0vGrF+QCtnTpeDyULllklvNlMkY7CkQ497k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDhlr5blUB7QAwaUgIewtqkVfmbPZBCfV5+rgobBufx+fkKQG9
	M1NIXYamHLfp29JDc+Ue9VuDaFsPanTvUjbFuKQBuXdhd3M8KlfJVdA5Pu7GKR8=
X-Gm-Gg: ASbGncu/MV6WVd+bRCOEpCaqPdfYQA06ICIBMsBxrGkxFKDbHK9thAMBFyXoHTQI7xC
	srTwqOd9zLEi2xHjsTqRW8y8Hf2/ECcl1e/g2EFahU1kpKpqxwdc6wqXh8c8hyWAXTjkLrUMAi9
	EjwhFdos8PSpxxjy3GagdzmDMlE3LNJVlsw1XMsJitRq9FyMqkuh3CyO8yGaOBEzLdTBxAB1vR5
	ya+yafWq1n3DMK7Io/BpiCTa1Qr3aWkxZUOT69B5Joxors3qlGc0EOAZddgt6Z/MYCtjzet
X-Google-Smtp-Source: AGHT+IHe3HeMgdBYJg120JuyBz3xv5V39AfkqdmPSMsMsnaeeM2fsQk5UW2Kgj9EB8ub9FEeeqqGaw==
X-Received: by 2002:a05:600c:4ec7:b0:436:6460:e688 with SMTP id 5b1f17b1804b1-43668bab39amr110519775e9.9.1735467001515;
        Sun, 29 Dec 2024 02:10:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea423sm325608385e9.2.2024.12.29.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:10:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 imx@lists.linux.dev, loongarch@lists.linux.dev
In-Reply-To: <20240717-partake-antivirus-3347e415fb7d@spud>
References: <20240717-anvil-ashy-544e80a1317c@spud>
 <20240717-partake-antivirus-3347e415fb7d@spud>
Subject: Re: (subset) [PATCH v1 4/4] ARM: dts: socfpga: remove non-existent
 DAC from CycloneV devkit
Message-Id: <173546699896.10551.718059378827423411.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:09:58 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 17 Jul 2024 10:37:56 +0100, Conor Dooley wrote:
> There is no Rohm DAC on the CycloneV devkit according to the online
> documentation for it that I could find, and it definitely does not have
> a dh2228fv as this device does not actually exist! Remove the DAC node
> from the devicetree as it is not acceptable to pretend to have a device
> on a board in order to bind the spidev driver in Linux.
> 
> 
> [...]

Applied, thanks!

[4/4] ARM: dts: socfpga: remove non-existent DAC from CycloneV devkit
      https://git.kernel.org/krzk/linux-dt/c/ba9dfa76ebb030df6b605e16239a8052c3c02171

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

