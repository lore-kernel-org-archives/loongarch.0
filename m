Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49B22578A
	for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810248; cv=none; b=M81I2ku/CJfKG6dsMTfHOT+/rFf4/C4J5DYdSdVgt4TpoJRnJtmJfc7lOEYHbh8iby9JOi8ZOoP4qW7jXiFk6RM4jdAZSM5ObjCdw1o+AB4DAYebrF3MTUwq1SzOeL6Oi+QRRSlAj1G9pNNf6/LXMyiG+WXzFbzyrkWIHFf/blU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810248; c=relaxed/simple;
	bh=gGmAUEWaafmCQUQ4+KQkgUfoEYeY+CBLOaPF/qC3m/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ns0YYj9tmbkeSu+sZkhONZ83YqsmDsU9jh0pnAAINL7Rm54JR3gmBaQfkq2zWZByJCG9DPUwxmIouaPO3KET9sPES+k/LKnEIDaT/xV9wGrau+mrhD5cyXqybmBVcahjM5AoCefOf2eYRZfALb0s15rSi4KFz7Z4ZIcUkgwaOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTpKKALJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTpKKALJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43967004304so21627275e9.2
        for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810245; x=1740415045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/0biRJus/9M4PhuIap27DDVgRLzlMn9BGl57AT63dU=;
        b=DTpKKALJq4i//RnvGc1elSAAJ6PnSveGTsV1ZUmpLW2Mf3Rof+Dpt6pvwiH9i596eI
         OPQprpbOb/rd6jBT9TiSZefZQQ0MNTXAIKzUZ+AkeyhZWsv1VA/BZspl4PiEknDipqWp
         YY/tuyythKoJwKZI7G7P21yyorQcCKwoldxvnJbtwqagfVEqJvnrSvO3pDu9OxK7hcth
         2lbdjvJJ6esfrH7k+1sHwM5o3NEBU1YYV/VXrUIgB+UMCAa/yJXclzrLEf9oNbS47Q60
         paWIT8XVuDwDoVdvCQcNfpeH/5oQ3sSySPc58mqX8HSkOgOgFXLDxBwTjJlP449FmfOo
         BFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810245; x=1740415045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/0biRJus/9M4PhuIap27DDVgRLzlMn9BGl57AT63dU=;
        b=eRGhbdFM/VXoN5VXnoeok//e+7+4/eW0CAeGlS1nyVH/5ms+uT6BuNJKNvfOr/sI80
         Ro7iBLRT3pPmbseJr2FAyh9fcn9XwBvKhpWWEWL9Cf4OVnwQJm2TyIVt/4MiUicNivRq
         BsRoRnBlzjZ/jofJbxYOqhHsTfuSSZtCdxWumaA4Yky7vAkIE2g4Gfe9GHtJtmPEGHb3
         UD4X/WpY+nCU007aB3V7yaylu2BKpdE72dnKyde6u9teCwp0o5W7gSIZVyktIN6hF7fn
         NNYCIydmgadVV3dkR2OSEbrWbl56Y/8E1FzNrfIPRPmO0u64Qrrw/mxw4Phvzyy8qb6L
         9Xpw==
X-Forwarded-Encrypted: i=1; AJvYcCXSjh6O20nSRgzDCAEBrKk7mJENnL1vnoJLYtfHu251Aa5lzpi78UxjIf3yydZcjT+meS0sm78GPmk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGFm0hhPDOsa93eO5TafHwa9mfamXC9R0b06IHkBpm9BdTaxH0
	v/PKLYOOfkOTl/V0EUqnCGsmLofOTF/ggUlRezTKXWPdpeG2fEKJ
X-Gm-Gg: ASbGncuYX9XJkvw92i4yLH8Em9iz/7PgabJ1Z5svrxiZf6zwc+WXkllk73xy3ZHYjc9
	9Qj4lufljz9wcx69GWAp/EnEE8ONZHqOsDTwyI33KD8ECJ5dJL3jLxOq6MG4lYFD4IZ3qNUUjtF
	ABqR7TBJjUCq8HnyaP4BjUcKVdSfY84H087Mi9Q6GFrpd4vT89kALiRC1ahbGbE6TYVVkL9oo8q
	ObDPOpDseMNCtJUsBX4Qx6WFnR8X0qlkUDdyYMBJYcqJz+Lj4GtBreHrHUeADLKr6J+Xx/Xfe39
	LlkepYHy3xATkYuqhfbvEZYtYHFgOg8cMTGOQR6d1O/6k7zpxMwPW4YCK+5xWHvJ086lzi/cR7U
	EYHnYuss=
X-Google-Smtp-Source: AGHT+IGnpGd1arKCvdVh8OB0EDoGo4KblVvIlIVVW7BFnKV8rTfrkS3K0VNVohWAHieTwgBwEJe4Nw==
X-Received: by 2002:a05:600c:4688:b0:439:89e9:4eff with SMTP id 5b1f17b1804b1-43989e951bbmr25428885e9.10.1739810245015;
        Mon, 17 Feb 2025 08:37:25 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4398872fa85sm24012905e9.28.2025.02.17.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:23 -0800 (PST)
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
Subject: [PATCH 2/7] MIPS: Embed syscore_ops in PCI context
Date: Mon, 17 Feb 2025 17:37:08 +0100
Message-ID: <20250217163713.211949-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the PCI context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/mips/pci/pci-alchemy.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index a20de7160b6b..02f0616518e1 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -33,6 +33,7 @@
 
 struct alchemy_pci_context {
 	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
+	struct syscore_ops pmops;
 	void __iomem *regs;			/* ctrl base */
 	/* tools for wired entry for config space access */
 	unsigned long last_elo0;
@@ -46,6 +47,12 @@ struct alchemy_pci_context {
 	int (*board_pci_idsel)(unsigned int devsel, int assert);
 };
 
+static inline struct alchemy_pci_context *
+syscore_to_pci_context(struct syscore_ops *ops)
+{
+	return container_of(ops, struct alchemy_pci_context, pmops);
+}
+
 /* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
  * should suffice for now.
  */
@@ -306,9 +313,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 /* save PCI controller register contents. */
 static int alchemy_pci_suspend(struct syscore_ops *ops)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return 0;
+	struct alchemy_pci_context *ctx = syscore_to_pci_context(ops);
 
 	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
 	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
@@ -328,9 +333,7 @@ static int alchemy_pci_suspend(struct syscore_ops *ops)
 
 static void alchemy_pci_resume(struct syscore_ops *ops)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return;
+	struct alchemy_pci_context *ctx = syscore_to_pci_context(ops);
 
 	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
 	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
@@ -354,11 +357,6 @@ static void alchemy_pci_resume(struct syscore_ops *ops)
 	alchemy_pci_wired_entry(ctx);	/* install it */
 }
 
-static struct syscore_ops alchemy_pci_pmops = {
-	.suspend	= alchemy_pci_suspend,
-	.resume		= alchemy_pci_resume,
-};
-
 static int alchemy_pci_probe(struct platform_device *pdev)
 {
 	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
@@ -478,7 +476,9 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 
 	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore_ops(&alchemy_pci_pmops);
+	ctx->pmops.suspend = alchemy_pci_suspend;
+	ctx->pmops.resume = alchemy_pci_resume;
+	register_syscore_ops(&ctx->pmops);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
-- 
2.48.1

