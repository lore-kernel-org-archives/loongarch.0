Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794A5634
	for <loongarch@lists.linux.dev>; Sat, 16 Aug 2025 03:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755315260; cv=none; b=CxPwQmJo9E6zMzrhdzkSGHtOxlGGlac3w1FrlXYS+twHqYoy4JVlhxaaY2Fe0Q0lLIQBAzw+ivZ4CK3fIY0OrP+IXtsBHlxMu1wKLcAYNSLlwX9LmMQRJmmwuYQYgmCyp1Gwb+GjBs5wknVDRsi2AFHVhu1x1jUYE8iDMA9Q0dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755315260; c=relaxed/simple;
	bh=N/oqJn4ZvxNNFoCwA259VuHk2vtLCnNsRDlcE0nBqtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKatT28vbisdt/IB1UTtDBFlx24/z9REb8y6RkiQqWEFhq1ku3FoTl9LgLar08OsEtG1jyVQsulyHXwiUvZlkLs6R3Kb/AyCZaa8qG//LJ91GP85CiD+bUPQhkgIAKoJYAWE4We6q+mdqE293rUsEaOVSWwXCjfCbo8MF3e+NiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hmS8pZ++; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hmS8pZ++"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AD8EC25E27;
	Sat, 16 Aug 2025 05:34:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQXJYJxO1B6p; Sat, 16 Aug 2025 05:34:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755315254; bh=N/oqJn4ZvxNNFoCwA259VuHk2vtLCnNsRDlcE0nBqtU=;
	h=From:To:Cc:Subject:Date;
	b=hmS8pZ++BVZsO/z9DTcDa7fA3JNsaWGb8+W6b2snuaYetaqdCQiZfCtB6I6ai6Sq0
	 M1NuAAwf/+1dZuq9C+qX2rCC0wybSv1itsPO7cGAtW6BfrL/cd9JS5GBydzNo4O+Px
	 NRySM0fGRtmLvNvX3ukkWtzAfaobTL/FuYy1BMQfBPZLiDzvzVnGGudVUjOpOCCJhA
	 2Zv848mu1+BtQ0nAtm/RrrHtNCFuyDSXZVCLGG1bDob7+a3Bxq9Z4tk7QcGGKtncGW
	 aW1j+Si91lfSABlFit7Qu1J7JfSqHauBlgHYjJdmhNbGG46/Jo2u4TYIeCYjosIW9s
	 KJiyaVC5uCgJg==
From: Yao Zi <ziyao@disroot.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 0/3] Support reset controller of Loongson 2K0300 SoC
Date: Sat, 16 Aug 2025 03:33:25 +0000
Message-ID: <20250816033327.11359-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Different from previous Loongson SoCs, 2K0300 integrates a reset
controller that provides reset signals represented by contiguous,
distinct register bits for almost every SoC function block. This series
adds its dt-binding and implements its support through reset-simple
driver.

Reset functionalities are tested with UARTs and GPIO module, it's
verified the module won't work with the corresponding reset asserted.

The devicetree patch (PATCH 3) depends on series "Support pinctrl for
Loongson 2K0300 SoC" for a clean apply. Thanks for your time and review.

[1]: https://lore.kernel.org/all/20250811163749.47028-2-ziyao@disroot.org/

Yao Zi (3):
  dt-bindings: reset: Document reset controller of Loongson 2K0300 SoC
  reset: simple: Support Loongson 2K0300 SoC
  LoongArch: dts: Add reset controller for Loongson 2K0300

 .../reset/loongson,ls2k0300-reset.yaml        | 35 ++++++++++
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 17 +++++
 drivers/reset/reset-simple.c                  |  2 +
 .../reset/loongson,ls2k0300-reset.h           | 70 +++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/loongson,ls2k0300-reset.yaml
 create mode 100644 include/dt-bindings/reset/loongson,ls2k0300-reset.h

-- 
2.50.1

