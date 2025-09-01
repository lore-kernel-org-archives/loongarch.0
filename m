Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837E321F3F
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733912; cv=none; b=qY/3vH5jo/BIvXCsabMh5WQr5GLTbfkJDoYrBRLQvzgjDaLf8SHOKKnwFEpSCQHxDn2Q9CwRbhjffyzbnArRxLhTgi4su9gKEYFU0SP9piULhatYjWi9r34hZ86GYTAf7A3bkuf7tC4WoE4Vd5EaO6MfxkIgE9Ee7FU2cSaHfTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733912; c=relaxed/simple;
	bh=ieYcdsd86jg1PezFn6//gKhottikcQbDyhjzNt8NsYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hacbE93kzbBKaIEWF99hl+/oKUy1LNecsZDGKvh29ECEj/KeUV5/CjsAJt0iCEnDauXibo/IeeO9B/cspFrTMfUpmuGuqdE8EVZ+qchTO/kAbiTrvjfMTzhJKM2iImT+3yfH9lb7NwiZxXnquhsSEmkP5LznA5Z/dJy4y+yxK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lY6P4iG4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="lY6P4iG4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3FAFD2052A;
	Mon,  1 Sep 2025 15:38:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jP4eUBOX-ip; Mon,  1 Sep 2025 15:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756733902; bh=ieYcdsd86jg1PezFn6//gKhottikcQbDyhjzNt8NsYY=;
	h=From:To:Cc:Subject:Date;
	b=lY6P4iG4uCL/rKZIXFJgB99CwAuwYcU+zQBA6Z1k6Wj3qoiLv8dnF5hmz24GKhlaN
	 yp5BboZkmO6EzoNlKc8FK3hDvti8wzdGClNSp5zzspsI5gAVMqkr+/AX7Q+OdDjoq2
	 OMh4gu4vMgDfE3YL/kTIvmfnokWAhHVQ/2ynZPN8sAPhKyHZjqPQNg8ElKdwsX+ov+
	 sFLSiSklMODM1AFX4fwTj9oXxatH/eCG5dkjJmTwYEHid082dQVKzR4ZOR2mWbqOh6
	 k9WM+ufKMdvEstVQvEln2Xq+TiH3+YHxvhAYlgq0f1R/SmVZD8IIg8FQdQD/e6ZLzz
	 DzOHzBlB7S6WQ==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 0/3] Support GPIO controller of Loongson 2K0300 SoC
Date: Mon,  1 Sep 2025 13:38:01 +0000
Message-ID: <20250901133804.38433-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for Loongson 2K0300's GPIO controller. While
being mostly identical to previous implementation, its interrupt
functionality hasn't been implemented in gpio-loongson-64bit.c. PATCH 2
implements its interrupt support with an IRQCHIP, and the code could be
reused for other Loongson SoCs with similar interrupt functionality like
2K1500 and 2K2000.

Tested on CTCISZ Forever Pi, reading/writing GPIOs works correctly, and
both level and edge interrupts could be triggered.

The devicetree patch depends on series "Support reset controller of
Loongson 2K0300 SoC"[1] for a clean apply. Thanks for your time and
review.

Changed from v1:
- Rebase on top of gpio/for-next, adapt changes that convert
  gpio-loongson-64bit.c to use generic gpiochip.
- Collect review tags
- Link to v1: https://lore.kernel.org/all/20250816035027.11727-2-ziyao@disroot.org/

[1]: https://lore.kernel.org/all/20250816033327.11359-2-ziyao@disroot.org/

Yao Zi (3):
  dt-bindings: gpio: loongson: Document GPIO controller of 2K0300 SoC
  gpio: loongson-64bit: Add support for Loongson 2K0300 SoC
  LoongArch: dts: Add GPIO controller for Loongson 2K0300

 .../bindings/gpio/loongson,ls-gpio.yaml       |  28 ++-
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  |  20 ++
 drivers/gpio/Kconfig                          |   1 +
 drivers/gpio/gpio-loongson-64bit.c            | 191 +++++++++++++++++-
 4 files changed, 232 insertions(+), 8 deletions(-)

-- 
2.50.1

