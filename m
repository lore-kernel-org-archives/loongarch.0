Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794923;
	b=ZwVRsidD3eUC/eaeniU2B5AxWs4cdsBCJEV5lbjWbHpzP+JlH2CqnjZLRkocBm0QmNaR
	 7rss+1UuckXQD5ob39ZkPnAA2eOv4y8d+06LUk/cg8zNjMVBPdzVYGVXO+KOk7XC8PM1o
	 JsUzSvdB/+AzZ8oviyK4wUhgwDinp9QadbWa1nkRNpc0Pgno+XtDf8qEzw5PuwXJURptB
	 AKLFfEhxe1sEZ4TYs8Kyt67m0lDvNE0eEZbkC/C0lrLfGzoE1eqokdsz2PkTo/5o1slT5
	 MbNKyBDJcJnu022ZRaBHW76iR7h/hBrT2E4h6REVfH2+TtIE739pgomCADBSxWcchyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794923;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=UC1kThlbPqW+f+LDYJkhrrmVvgZLypqCj094W+zliBk=;
	b=gC658uV13LimrRw0kgUoYJVStHjLmLIfWmQ0+82SmRHZYDpsDOSYBY6VN8nhOdjNol0L
	 C5+CsYJLu3Zxn8d1hezi4WPBv4vAzX/7T5QBxFcN8YYhh6l4g9UuEdHRo/VKbQK73yWkQ
	 0oWnkLF+YokDBn7NWDURS3JjPI9PRRLlUQMv4W3tH3LhzbbapYaqFCBZj9XxGs6XRo7CC
	 QgrHxgOhHmmU28V8Ym3G2QKyRLBE2ja8ZANM1D0nsS4NO2iuIAHzqKuUGPqDYVPO4gR+p
	 AA5efrwhZlTBuN9Wb29WjbW6EeLYQeBK9HpPFtU+IRS9S5INb49pbX2V2h8A9KXqfIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tbk3IRWD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE9606A333
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tbk3IRWD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EE81F0089A;
	Fri, 27 Nov 2026 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794922;
	bh=UC1kThlbPqW+f+LDYJkhrrmVvgZLypqCj094W+zliBk=;
	h=From:To:Cc:Subject:Date;
	b=Tbk3IRWDY7B4/OLzhvEmHFfj5aYECWEhodx4JT70zjRcmN1uLkYuY5K5A37TMKt9Q
	 N4L5jfac24YC53xcrhmTwmLtBaFa18ll8i/lF53RnSIA9znVXQTAtZs3f4yBcyDvwy
	 Y3i7iHQOWTAIvDZiyk4GZxcH/P6ggImR79045zlwUOIyXNFIfJbg8BI1EQWb3BYb1e
	 g7E8sptaX9stweQHlrAYzEdHH1W2GcJn4HGkHGjryCeLCdxY+TI8+hpwXGi7/YgHON
	 acdF0qUDolLDkeme22gacVYGVryX+3BU5pN6SOl9ni997zP56yYIBPYc1bYyemqLTZ
	 Cj4PoQarPSFRA==
From: Thorsten Blum <blum@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: loongarch@lists.linux.dev,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH] platform/loongarch: laptop: Reject negative max brightness values
Date: Fri, 27 Nov 2026 16:55:08 +0100
Message-ID: <20261127155507.805377-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=blum@kernel.org; h=from:subject; bh=1c86cRxhf79ZIh5VyJY41/r3ydJUYRVyK+rtUtUFBR8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDNmcy28H9r9duZ7xhZfMwcDkFxfeCGn4bT2aPv2twUK94 kdSW3g/dJSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEjvxl+KclldaW0l3gLvHr rxjHrVXPrPovO1WrRHNM1Fx+9IK2GBsjw49tt6xfPcjg1rsj+lJT9NFWu5S2cO+3nrISUz1d8+c aMwIA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

laptop_backlight_register() uses the maximum brightness reported by the
ECLL ACPI method without validating it. A negative result could cause
the driver to register a backlight with an invalid brightness range.

Return -EINVAL for negative values before powering on and registering
the backlight.

Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Found by code inspection and compile-tested only.

 drivers/platform/loongarch/loongson-laptop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index 4ec56621db24..d582eec765ef 100644
--- a/drivers/platform/loongarch/loongson-laptop.c
+++ b/drivers/platform/loongarch/loongson-laptop.c
@@ -415,6 +415,11 @@ static int laptop_backlight_register(void)
 	if (!acpi_evalf(hotkey_handle, &status, "ECLL", "d"))
 		return -EIO;
 
+	if (status < 0) {
+		pr_err("Invalid maximum brightness: %d\n", status);
+		return -EINVAL;
+	}
+
 	ret = ec_backlight_set_power(true);
 	if (ret)
 		return ret;
