Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380A829C33A
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748383; cv=none; b=QrQqucTvghM//8tJxjLskdHl3FZcmpzxaHciQpr7gYrn/BMGUOTAyJR6MMPlmOIkJBwh+AqUkjgX0l/828G3ydZa0/ivnJdl/GOuUNMgXuexk4xQz4Jiwy45F3dLWnvXtmxK0QbM2RmpWqUAQ0e9DYj/cK2hTnHW4izAviYcJhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748383; c=relaxed/simple;
	bh=HzpHN8YcpcUGQ8cTxUMkyRM0WI773zFQRBMcOx7t8Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpFm9/QlUNV3VNZJWzMfqBKGGlIQvOrKfhnu6PTQz8SUH8AnVRTCDETMkidb4uf0aure3KdvpK57S6YGpuQCTvpVm7Eg0Rv6RxPPp8jQuGCQhPuKzcFy/xGLa0Nin/wQ4F6Hh2X9aaOHu9Lrkg5FF/TbqMLyRTw/hOqeTAhALZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek8lNG3R; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek8lNG3R"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a588da60dfso467945f8f.1
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748381; x=1753353181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGNFpZqODfmzhJr9aiRrd+TX86pzNqh5cw08oNQmcLU=;
        b=Ek8lNG3R9vXSTz9vqqCaNAYGXGPPijb2a168wNa2KsvHasxr+T1MTISyAf40wgmPXp
         sLIUtx3NWOA2h23FOH5IK9YlejFlqESMme64hwyc9OmqvlVJE1Qj7k2J9llHBXaKH49u
         cFhICGfRhiswf2Bkg5G/Tx7yLtTm0B+tu7B6BWTUXKRjwTEOZcP3J3gMcKWSzT0sSl2z
         QULwXmNbP11JiwAUqoSE292frcjjR4NlAKeuwUW+UpkMeIjBILCx9yZpjLCJhF0ga6Ua
         U8VowrlMzhZi9RLTR0d1wv/9nkpJgBF6ulct3+sIv5/Or9xpExMHC5cq1rhbylT0RWBr
         na/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748381; x=1753353181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGNFpZqODfmzhJr9aiRrd+TX86pzNqh5cw08oNQmcLU=;
        b=wu1Z5bezO+1sYG1Sfw8e9v/fKjWO68tZH58UYKLNWErZYbSmKSdLvvEMk4aaVTLRFZ
         rqrDVEi0P9wsoHAVM1UL34uu3v27tmNowRa9SpDezsyZRcW3NZjmd1bYEl88l0rfPWMf
         Smn8l9QNrfADAoiBrFn+tFeMeLqWoBQbmQtlenIR4pSbTYvXksbbmppDjAHGVs3j1O+s
         8vMw2Nrzbiz04SuLYXXFsJidKGFC2E1IYC70S8bNmtjOBfFoxTXn/pObmADFqDEYRgVD
         mOdLNCgUsWCVS2IXegI7WZSXCD7uzHeamrNgt3DArhx9tYE8Dl33Bvc0G7DGXTmft2lX
         rsuA==
X-Forwarded-Encrypted: i=1; AJvYcCUDNJL3Q+7l3d/gmkOrKLBMeHoZlpwTBu6jW7uB4jkEQHOKf6+if9PtF4kBNLBkA4UXrQFasAPPhqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTY/kAFYy8Hx2tqBrz0gus8s9kKuasiC0HoUGFc27SmiEs1FgK
	ErCN0i9/VljFDt8NTe0TfPLJbYDDaYYOiusnzSuQX9/1MF3u702dxORc
X-Gm-Gg: ASbGnctQSB0SAFvrUry9xyJmEzQSyuWzAahQ231sbkcaOcc+kan97SlLpZUhhB3PSsJ
	T2Y/M6Yo+6S2bYWCWZnbmgjU8T1aTlBrSOWpm1oH5civ+B+2k0rFfbadUvx7R8vneqktqHs3WIt
	hxfZ0ze8siWKQ3P8nw5u50mdNLFqhP65RMF9lMsroydLe6FdzGLFX0XdIsBj1j+GdIh3+WjK6DS
	s+7XZeTrJ1Q46dVOR7o6O6PMbFFObRk/OnNkYpV8eVdZ0Qpg3NEiuIWGoPVP4f+FH2LbtAvRYCU
	y5zqRGPk9OYr8cKrad4dhwEYefOqxGzsE9SbSaCmCeiyg0YplloFohrB5NwBB1jL1VIIVZ3ea77
	bnyyH8uxggoEICjS5XSVUhng1qfnvW7PUpCCAoVR254r8MPJwzkxe4nSSenAal3UsesCeTLvgik
	xrhwL6bbDfhBIYRg==
X-Google-Smtp-Source: AGHT+IEJyseOSQ7/RZYPnww/L9LgeDBNM4g6hD4cUsfsALyidX4LqCToCF9T7Owp+uYfqFCAdatHoQ==
X-Received: by 2002:a05:6000:2901:b0:3b6:1ed:9ad2 with SMTP id ffacd0b85a97d-3b60e51b8bdmr5306916f8f.42.1752748380572;
        Thu, 17 Jul 2025 03:33:00 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd1924sm20547938f8f.16.2025.07.17.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:59 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] irqchip/irq-imx-gpcv2: Embed syscore_ops in chip context
Date: Thu, 17 Jul 2025 12:32:40 +0200
Message-ID: <20250717103241.2806798-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the IRQ chip context
without relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/irqchip/irq-imx-gpcv2.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index bdee15a327f3..8e606baf3a01 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -19,6 +19,7 @@
 
 
 struct gpcv2_irqchip_data {
+	struct syscore_ops	syscore;
 	struct raw_spinlock	rlock;
 	void __iomem		*gpc_base;
 	u32			wakeup_sources[IMR_NUM];
@@ -26,7 +27,11 @@ struct gpcv2_irqchip_data {
 	u32			cpu2wakeup;
 };
 
-static struct gpcv2_irqchip_data *imx_gpcv2_instance __ro_after_init;
+static inline struct gpcv2_irqchip_data *
+from_syscore(struct syscore_ops *ops)
+{
+	return container_of(ops, struct gpcv2_irqchip_data, syscore);
+}
 
 static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 {
@@ -35,14 +40,10 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 
 static int gpcv2_wakeup_source_save(struct syscore_ops *ops)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = from_syscore(ops);
 	void __iomem *reg;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return 0;
-
 	for (i = 0; i < IMR_NUM; i++) {
 		reg = gpcv2_idx_to_reg(cd, i);
 		cd->saved_irq_mask[i] = readl_relaxed(reg);
@@ -54,22 +55,13 @@ static int gpcv2_wakeup_source_save(struct syscore_ops *ops)
 
 static void gpcv2_wakeup_source_restore(struct syscore_ops *ops)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = from_syscore(ops);
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return;
-
 	for (i = 0; i < IMR_NUM; i++)
 		writel_relaxed(cd->saved_irq_mask[i], gpcv2_idx_to_reg(cd, i));
 }
 
-static struct syscore_ops imx_gpcv2_syscore_ops = {
-	.suspend	= gpcv2_wakeup_source_save,
-	.resume		= gpcv2_wakeup_source_restore,
-};
-
 static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpcv2_irqchip_data *cd = d->chip_data;
@@ -275,8 +267,9 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 */
 	writel_relaxed(~0x1, cd->gpc_base + cd->cpu2wakeup);
 
-	imx_gpcv2_instance = cd;
-	register_syscore_ops(&imx_gpcv2_syscore_ops);
+	cd->syscore.suspend = gpcv2_wakeup_source_save;
+	cd->syscore.resume = gpcv2_wakeup_source_restore;
+	register_syscore_ops(&cd->syscore);
 
 	/*
 	 * Clear the OF_POPULATED flag set in of_irq_init so that
-- 
2.50.0

