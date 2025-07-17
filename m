Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424E829A309
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748376; cv=none; b=iK2OQFDuCSfY8ihhmivw/b8Tc720kGbMhFTRHCs3Gg0bFkfyEQWBNet0KYXnWcUW3zC4RrvlLZkxIq9KZQqOZzUdH/N1Tx/F+ZOTJeCqyhgJgM8aqkJr47oU5h7dexcYBzFEeCtWccnQdbiA9vVsoWOTTbaF0escFRX22cMn8lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748376; c=relaxed/simple;
	bh=ZDH9nnnANcSRpb0zEHcYNiYeeyt7UKzoc2r8+K/c0NE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVIjMed2bbaDQscZk/DrMlqEdpGs/PgPrq/NsGMI8BhGs36G8XQhGXqDV0inY+iY7Dh7hPHuPp9ipbLgcElqOlKxHESiN9TFtWERAppBcsWtE5V9Vwvc0ANxYZluG1gr9PO2WBpG8t6JtpPZPd//VPHFba8eg4MfnNoQaNXOHwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3nITFgf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3nITFgf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so8288415e9.1
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 03:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748372; x=1753353172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aLo6QmBH2sfDcjFNDrVzv+tdtk/K/9cagqqXKGweA0=;
        b=I3nITFgfKHjVWh8Ad98hmhia14W5lH/dJvIFnuXs4403B8cQIsaO1Q+mTin19JCvb1
         vuSvUijM8cGMsJSxOmLCALaLt91dDydsvCsUwgO8uYHX8iyMxP/X20nXViGdXCUOtUZG
         SqQhW8srP1lxdzQ8+guC+ysPiG3Ft+vQmA0vlQT5DxglAXMo61ht711CMlF9kByv5hWg
         BRFMfJoG5f3swERLVpEmL+s4IQBL/2mgpnKg4eSEpFwM8rKaQZDpZA4z7UIvn/5NShsx
         OTlc832VKdWLZDOnizwZrTdHPIeUwqIhJJu3sYetDhXi6HAM1MyCrcnmobxdxgfvyeDS
         2SHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748372; x=1753353172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aLo6QmBH2sfDcjFNDrVzv+tdtk/K/9cagqqXKGweA0=;
        b=Zdd1xzMM9XBBgTqwSqLTt2WfhZdpS61563kh4m7Y3v1nDntemImHlaYPQV0yuI1epZ
         50Umlacma7lGPHzA4ICbHExknqtAYMKoH6ECmHWrVZUsOInuh/he8lYuO4gRXuTjSslq
         e3G+6FKLCeYd+72boKUsX3XwQSjTuBSla5HV70u28/ZMqW9bcNoqJ476bkodl/sttj0W
         q08ADzYCC+skOUl7GkBhSPdy6/SGwoJrOMYYuVLL+9nKnt62LXFKa5aQ1Xrr8KR9tzBM
         8VQxQ/m8h98fsrnzpvgBqlhfUFoemoxpl4jDs/TzUkOC8dNRNVEz1mRulejB5L6OQF3F
         tbSg==
X-Forwarded-Encrypted: i=1; AJvYcCVI1OUAVM1+qtiXpimsVVW6qJFSmyMy865gXWvzi39gmHxY3lazkMOlmn75w1UTrII/wPJbB4taPTo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+AdyJ76iOdk45ChiJUEFiBpwEp+i8XmoJmjaL+U8tpMwVrSVU
	1TXug1A+F+Yz0asD1kGyaIYmO0GF5vvY1UGzbQr7l8lksrghVpfYmj1j
X-Gm-Gg: ASbGncvi6ndJet+UOYBx5Zdwn1oZYutZwMAg37CUi67CQD8jtgFUZlnwgV5OWarPEY9
	sXqeZIOqanMPfs8Y3flZqiZ9K9WQHwgFGd23IB6ziySdVTfNB+ziztNTS44jIBtlePC0Wupp2sH
	/c8kSIt4ZA/mREG+XA9dBUI1YxaaokgkmcnJ9w1QGI2907CEa/78RGf28rSHH6EChDTuvfa08zV
	+NafozQCdkPDxeUJJ08NmL6ukvUZmKLKsnQjgFh3Rc7u8IL+dBl722nan1ZfZruU0eQu9G/9z+T
	LLqHy7Bm6UtPjlicHwP57d5X+IlozBjSGfbIgCgx4xVPzNOMcJd+dYAH3RuSs8h2QQregGkmCpZ
	TFnVG1yp9Nxf4soeYErXdBGd1IvF1ILiPU25+nUzYTnpjMFJRiZCfBhdP1nmefmgKvYto90sCaV
	MyafevlEZFwOIXsw==
X-Google-Smtp-Source: AGHT+IHy7PA+ydb4zAWKmtnVkxvp2yVipMuhRsPFmT5ULPVHvkEqwkx5+jJwmnytUHEZv9na/OVQiw==
X-Received: by 2002:a05:600c:1d20:b0:454:a37a:db67 with SMTP id 5b1f17b1804b1-4562e36c7a6mr69982365e9.17.1752748372489;
        Thu, 17 Jul 2025 03:32:52 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd15bfsm20610595f8f.19.2025.07.17.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:50 -0700 (PDT)
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
Subject: [PATCH v2 2/7] MIPS: Embed syscore_ops in PCI context
Date: Thu, 17 Jul 2025 12:32:36 +0200
Message-ID: <20250717103241.2806798-3-thierry.reding@gmail.com>
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
2.50.0

