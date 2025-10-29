Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787A345CD6
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 16:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755631; cv=none; b=YUrbKZp71B2uJ/Q4m80HxrmqfQn+I+RAOKVNbyEtkpQtAY+hrvcOOi/DAeC24/u6buErU+hnSTuwsO4UwAU6HXy/dnJGuCts/hsjsMusmb4LvhQfKvqEgYLuBjILjH4TSPte8Km4chMOaNsiEkYwK9LutkDnH1Od0rB9nGN6AVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755631; c=relaxed/simple;
	bh=nyc2pqrGN622czbqL752mZIP4IX12KOgaXiQ7fJqL2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTFw8KkYwwGe5TLLRfxy9dyHZDbndArZeQae45LItGt9l2psdDsykgPHavlSkQ3w3afLS0tAZ3eX4LmdVjkvM5XOLqFZUBlBFrlcQvGnqzvFG46YiCCXDG16zf9JO9zoO6fFtt8lTuBLzaxPNjoqnjHwG845oLRYUg/b1OkvgpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6CA68X6; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6CA68X6"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b6d53684cfdso16397166b.0
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755627; x=1762360427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=O6CA68X6UK8g1n7yikSKNVzsYDm6yRfuTcLfbW9cBStcqCqaWMw/oIc5vz4ObXyhfM
         x08juHaect4ED0J+C/nZyy5elPWXNQiNBh/H8IwxNSWOPMJwgqItNYdMBiKUNDL/Xz5g
         e46/kSMk6SyncilrjpdWQkYiz1NeQOzQT8bGQ9oaE+aKqwVFFEh3zB/U1fLzyFfvWn52
         EWeJd5lkX4M9malQ602GWYKYxSLiTyN1J94t+XpYd9OAqGBG+9JyrSJpDjCYXqRyeiPH
         NHMKqryGjEx4eUknM4PdeqzXPmnG0+S0Ko7h1NadWDxEvXaY8+hIJM1goCvxx2A2v3V4
         TxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755628; x=1762360428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=hiNqsByzrS/hOj+yJZcKkPTkFulWt1kBctDUZtmivQdkqaAzdOTzHOBHM+87WpbkfW
         yJH/j4nlOSDQQIpXbMDiaCZqPBC4KCsv1yVwK4vCGrXqkyse6zIu7p5N2W6tHkGMD9aJ
         NseH/xnN8dXg8kLqeVdh+vTa9SyDjpAT6jmD2Tee8JYQIz6PcCqr0nIik3shRg2EKjPU
         NQRGnwNTUyyATO/ngHWZRGim+u/j2l3EMBsIJAMd55nJWlO6AbtSk7kEyeZBTnXyAwIu
         2BUBtBHST3VT7ibwNv7aoNmqYazXz264nO4TPiWTeAKpxmu3giYz0IYVSMD/z5FU4j7j
         Zrxg==
X-Forwarded-Encrypted: i=1; AJvYcCVBRheQH1pIJTJvnlKm24h039JbI6n6Z1k5RAWfdHLz/XdWjmj0Av6Od+HGL3HVLEmax1/MXuDlnRA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPeIcxpRSpLkj1nawDtHRC2/dXn+yAwV0IS0qQ87pyUVjQ54Mc
	8DcMJTg9QkrmdXZggASnZ67J88qi56quuBURI4ZAsFuVVqLcRFIoFubD
X-Gm-Gg: ASbGncuEeLll/HXp+s3yP/gMv2dMsFRs7YysbFU4WY41ab7tc6OBl2VAghSecfAmbWr
	uAbCshnYCkQM9Xg+EPYQFEgFJXsROQOLnhVAxVS/38IUqF9uFGmKOb0FAsntgfERU+Ai3wD5GJV
	cSAsVdW5377jkwZhcR9s9k2I1rzOEusJ48kg5Nc0UrN1MevbrKoh5B4Jyfr6nPGyQB25xOYoAr6
	7ekw+FmYYNRtyrGJvH/C5te8wxU0NnzGbjxLd1aDNYriQVa4kftQUNxiRPnXiPtPumllb38mkxF
	MT2nXYsmVEEWwxfQDYKvS6Uy9m8MkaSfPxo/uShThpkXl5a02oGpVTjOlnWgJhv1kjpOfqqtVVg
	9RBnxPR9m4CJooGO4dQfz4K6Z4hvOE+gsMn52pFUyjnKFd81L3023N+s3y7PFT9wsDN03O3RBNl
	plZPeicActBXyHuHflO6nkm5sISBCL+VDxP5WlayWhCo0E5X+U234R7A==
X-Google-Smtp-Source: AGHT+IFucoSpcC/sMHQ4BHPU2Sj/4WR5SsWuPVRxpOY+Rb83Lsjw7eIU5fItk/Z3WAxH0T7dO6D6kQ==
X-Received: by 2002:a17:906:ee81:b0:b6d:7e01:cbc5 with SMTP id a640c23a62f3a-b703d55289bmr367879066b.53.1761755627345;
        Wed, 29 Oct 2025 09:33:47 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853e5138sm1485764866b.44.2025.10.29.09.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
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
Subject: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:31 +0100
Message-ID: <20251029163336.2785270-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

Changes in v2:
- remove unused global variable

 arch/mips/pci/pci-alchemy.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 6bfee0f71803..f73bf60bd069 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -33,6 +33,7 @@
 
 struct alchemy_pci_context {
 	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
+	struct syscore syscore;
 	void __iomem *regs;			/* ctrl base */
 	/* tools for wired entry for config space access */
 	unsigned long last_elo0;
@@ -46,12 +47,6 @@ struct alchemy_pci_context {
 	int (*board_pci_idsel)(unsigned int devsel, int assert);
 };
 
-/* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
- * should suffice for now.
- */
-static struct alchemy_pci_context *__alchemy_pci_ctx;
-
-
 /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
  * in arch/mips/alchemy/common/setup.c
  */
@@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 /* save PCI controller register contents. */
 static int alchemy_pci_suspend(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return 0;
+	struct alchemy_pci_context *ctx = data;
 
 	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
 	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
@@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
 
 static void alchemy_pci_resume(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return;
+	struct alchemy_pci_context *ctx = data;
 
 	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
 	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
@@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscore_ops = {
 	.resume = alchemy_pci_resume,
 };
 
-static struct syscore alchemy_pci_syscore = {
-	.ops = &alchemy_pci_syscore_ops,
-};
-
 static int alchemy_pci_probe(struct platform_device *pdev)
 {
 	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
@@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
 	wmb();
 
-	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore(&alchemy_pci_syscore);
+	ctx->syscore.ops = &alchemy_pci_syscore_ops;
+	ctx->syscore.data = ctx;
+	register_syscore(&ctx->syscore);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
-- 
2.51.0

