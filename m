Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCED34F241
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755640; cv=none; b=mknruVVcIOl94mnjvRrzQdkq5erIf+oEsjn+H2bEZjdXVW+T/pGjarudG0jv06aARzfylIhLdMus4Lo3yVEIsp5ir2AsgFrM47XIwn/DdppE0DLk9VUucMSOeU1UvZTf89Ub1DCcUQjyFMr//6Bzl36dTPd9kOXu/zi3DdqyaRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755640; c=relaxed/simple;
	bh=KUSAVjewTwFiW9VLR1yzUFBIzCxCjea5cQlqAAL9Lys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfGVsqpkG9uqHyoHWf9TNUSbiaeMYwrCBW19ZC5ouDYoRkePv+9SMbG8A8SPVhqQWyDA3E0KikDJg3Ch+reGTpka2x8UwDeBtUlYViEi7Qous1e28Zw9zEZVuZOUdTmCk/GWTm5MW8rpETAZj0ehAxGWPy+AiTSp1eTHtbiL3Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fp7P9MgK; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fp7P9MgK"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c21467e5bso6152051a12.0
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 09:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755636; x=1762360436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=;
        b=Fp7P9MgKT8+L1QVsRSQHzPOPDGYv9l0QXq4L2Q8C9HUSZQKinjPZmqn0tzqG8QzjzW
         T6L7biMrIXmY7vYkea733z3WLYcdMGgmkXwcg8DUwneUrTytgI/3BnarMfgoOAtGFRc5
         feJNL6mbVepjKrU2mAuNpHvp3FesCMabfuWPOtZ3e8/LeAQ972gFe7eKL1iYIgFc32k/
         IWR46ZEklM2O7IiOIRBNS02p9EMgsW5vUsj+F65RnYLbLbilKBcASqs4hMlc3WSP4/hA
         4GE9047rRnl1s1qc24GrnPz3SIDKHbWhhEkj+6wnmIAFb/t+sSVG629ALrP5riy1J4AG
         oYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755636; x=1762360436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=;
        b=cw2IUuoqHJYebFGO1upPIgkQMb6HkH0FSPhEu18XhflsefzJ+DhBds1Fybr+ffogBo
         FsNvrilWAHDwZ41r+zjhC3fBpvPkI2GiCjrL682YOex08LIzpht8zMvO6Pl5r+I1gfh8
         0MbR8iZeRxM0go8GZint5zmUkb/DTSjTuLwYyc8UB9yEf3jHB5b75gNBoUVCYhPQtalq
         XZviZy2twFwyklDgbq9iX8ZC6ElkifpTDnUbsYPBxbUkYOzW1EBiwnvT5H1jsK7W8XVq
         xvlkOA94Yle1rVxy2QNE+xG+/IvlnbSHdXdHjM2Lt1MwStoXluETdBGjQ6qA21NtX0Fg
         OSLg==
X-Forwarded-Encrypted: i=1; AJvYcCVwhhE3zEFwZMo/in5iOiw21MCnzYUWSxSY1LWgAw0EKl89P3XppP6JEraTQKJBZU+jsKZB14LP+kg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5vNgeGqvtN6XaKKq0SmVkMYmQiAoPYI7RlV6b0p2YHm+3v9dt
	YOch1YFVRpfgiw1dUausWUDfLXrKHxWwO9Q+rgvGb/pnVS+Syl+s2qwz/uzH6Q==
X-Gm-Gg: ASbGncs+ugOqs9n6wQ4lDygzorFvnlTWwb3RUG2KVxN8sphIpEGQx7aA2cIDDGc4z3M
	cm/Nw4CFf1DfS9NDyBz/Ly3kurqABWfc2MTI9CEGOxJwTE4VuroDTzhOBpOU+6/ktuFS4DQNLxv
	DAbIAKBHmYNCGPMnxLlcYgZWfGmsmLObD5Pzcen+MSSnPsQuZsca/ZT77pSwrimJQQwxbK0mHoe
	vikKs2W5tTojgbDB4a4JRRxUhi0stucJMG75qWtymKb9BOeZw9bk9FI7kGwlayXdnxLuLiF3cJr
	FdnJEYAFGgxUvld4ZPFiP4gd/83JbXA275N7rOwK1ZE3OK5BshxiQ15qql0sAQ/O3F4thcvSpAC
	Ox7cbXg/9AgBJa4HRqa4DNPXtYEnLYaXjhOb+bsA4aFsl/LLKtscSrSkdvJpZLWLjoYStzxAgOq
	jutDCeKgB7ijpjTzCzCsacr1XBkrK8t2ab/0lCaQy/GI4Q4Mt7JcDa5AwhhnK4l4ghe09y
X-Google-Smtp-Source: AGHT+IEBhKyqSuQzRg5+jPbNr1lJJJfXBtMjYTViFyDgVE4pc7ia4Gu9caVkoUUyuihmK5MM+ILYDA==
X-Received: by 2002:a05:6402:5c9:b0:62f:50ff:b675 with SMTP id 4fb4d7f45d1cf-6404437f5a7mr2656312a12.33.1761755636037;
        Wed, 29 Oct 2025 09:33:56 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6404de640fcsm1695354a12.8.2025.10.29.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:54 -0700 (PDT)
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
Subject: [PATCH v3 6/7] irqchip/irq-imx-gpcv2: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:35 +0100
Message-ID: <20251029163336.2785270-7-thierry.reding@gmail.com>
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
- remove unused global variable

 drivers/irqchip/irq-imx-gpcv2.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 04f7ba0657be..ebfc659af385 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -19,6 +19,7 @@
 
 
 struct gpcv2_irqchip_data {
+	struct syscore		syscore;
 	struct raw_spinlock	rlock;
 	void __iomem		*gpc_base;
 	u32			wakeup_sources[IMR_NUM];
@@ -26,8 +27,6 @@ struct gpcv2_irqchip_data {
 	u32			cpu2wakeup;
 };
 
-static struct gpcv2_irqchip_data *imx_gpcv2_instance __ro_after_init;
-
 static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 {
 	return cd->gpc_base + cd->cpu2wakeup + i * 4;
@@ -35,14 +34,10 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 
 static int gpcv2_wakeup_source_save(void *data)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = data;
 	void __iomem *reg;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return 0;
-
 	for (i = 0; i < IMR_NUM; i++) {
 		reg = gpcv2_idx_to_reg(cd, i);
 		cd->saved_irq_mask[i] = readl_relaxed(reg);
@@ -54,13 +49,9 @@ static int gpcv2_wakeup_source_save(void *data)
 
 static void gpcv2_wakeup_source_restore(void *data)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = data;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return;
-
 	for (i = 0; i < IMR_NUM; i++)
 		writel_relaxed(cd->saved_irq_mask[i], gpcv2_idx_to_reg(cd, i));
 }
@@ -70,10 +61,6 @@ static const struct syscore_ops gpcv2_syscore_ops = {
 	.resume = gpcv2_wakeup_source_restore,
 };
 
-static struct syscore gpcv2_syscore = {
-	.ops = &gpcv2_syscore_ops,
-};
-
 static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpcv2_irqchip_data *cd = d->chip_data;
@@ -279,8 +266,9 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 */
 	writel_relaxed(~0x1, cd->gpc_base + cd->cpu2wakeup);
 
-	imx_gpcv2_instance = cd;
-	register_syscore(&gpcv2_syscore);
+	cd->syscore.ops = &gpcv2_syscore_ops;
+	cd->syscore.data = cd;
+	register_syscore(&cd->syscore);
 
 	/*
 	 * Clear the OF_POPULATED flag set in of_irq_init so that
-- 
2.51.0

