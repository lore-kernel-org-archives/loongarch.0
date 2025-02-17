Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED152226532
	for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810257; cv=none; b=FqFoYXA6JBYvNeZInHa5IwjA2W8Ao651gg/UmsoiPlcluj2HRXMVhlwzUIe7yzftr0lv5sdenbzjwkSyJeGYdSvhCYZ0rSbAECVEKYPLIPC4hkvAahNfHhp8dZ5gB7JygtCLFqeCV9NwfFQbYT7eUnisYVDP64kb+aFUYte9ERA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810257; c=relaxed/simple;
	bh=+eCE6Ql4+07nFG1qzGBgKrmMRBOoz2T/3CMljW1oR6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uvaa6vj2OcCQQfoUfSmv2NngyLgwYb47KsvoLP/MRG5+60vR37RUyfBeXcI6BEL4r1STPBBNEqYVp0ag7mjh1fywpOwXsakVBPEKCZKCAFx2gl9ZnS993hsxw3nOpvUkF8KAjtFCZ4ROG+ZjT3Qy5AWMTC8CUKV4nM/PnhVhwQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFhWJSAe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFhWJSAe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f378498c9so1884620f8f.1
        for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810253; x=1740415053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKpi0u6vaUnsrplCnc00ydxIjOGnOYCvPvGm+BeJUhk=;
        b=kFhWJSAeaHQzC9ASjzU85+ACcBAPxYhpwhYqRskIDc6zL5sr7uPgGH3iTkJMxPkxkw
         d9hvS1pDPeETVPNGzi2PY0jt7zDHwn7L/5+K5yaAI76Q7y0zJeiVI3RrgYwCU9i/UvPF
         ywoaK6mRI/GN7F37DtQ/Pxvi6Dpc29YLY6SBjISfwcnIP1Kho25nqCrWcxvyS0sikQN3
         cmyZXCwNlpT2EcY5x4yI2XIax/NDh2Nc5CeFZ4/VEegfNVW5A2CInmpqfbcEqSQAfccT
         5BiftZ3KRfCSiHbvUPEnO19VlSTZWd7jtWixg3uRt8c5O+e1t4S5Zvx3m8hvs7C+gxwx
         U0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810253; x=1740415053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKpi0u6vaUnsrplCnc00ydxIjOGnOYCvPvGm+BeJUhk=;
        b=P5/zxZwYNk5K0Ghhnsm9P3VkDARW4byOC/p5C2C0N+ASxhkVb1WW9xAOxmeLHumWjL
         ObYCl29bkYLT6lsZXBU2zYdFZU58Gjfc/brFj225SbXCqnYuNlVLdfXhgnTrriGXCjBi
         r4eDcOTQdSiltK/8RH4XwVo38v9PvkPfLmG6s/cuusQZCUDfRpa7tPQjiTXnPHQ6+ika
         t7/tFzeBuFELybTZY6jTD0Hy5+JJGbJ+Pk3XdWe4AXoG5bUPzgatUMdl4e3aZzlwnTW+
         RErxYOyfmZE041fI+wlpuj49BTi3mwMW3z2KGQDI2m6+Nm5Cs9lSHQK+CCXmvQdzelKw
         RMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1uMReW70RH0copWwa3XXP/wsbL08M5WHQE8zgz3ue8tkkfIQveKFGtzCkFm/OLLkx8r1xTpIPrp4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+h7s5VTHXLG7I+hsUxGJuM/6ZF9Ntsp49NZwk3SBsYsOiszY+
	rK2eaTR2qOhzTfJjKR0mfRHWabiOnnjCUgrJr0Uc0sEGzXfq4JFu
X-Gm-Gg: ASbGncvYyXumPG/XjtzZxcgdBNlcRFLeBdCf+7++upaFycGeuWJJQk13XxOU3DMh68H
	HRq7vmfltTVV72Nec6LAFVZaM+1IAkp7km4YBkSi9OJItdB8/FqDCYXE2El111HhcTm/1uVId4U
	wuvxOMPUK9GpNyAtbJzGWlbCOsaIL45o/gLxgZRITKykqX0qRGEy3VqTBeOblB82K45xNo07bhd
	T7LF+3zBhe2vfQbpnHeVxGcR4OMvOkNY+rAt+Pr0lPR4iGQWXYSMZb5+OsdQqZznJ+IjGM86dcS
	gks6YulGHnbTZ/u8T13od/eQd/KiRzDAQ1eaQM6bYIIuVnudNnrEoyvdEBEsMvdpAP10/yTfX45
	Cek2sNbQ=
X-Google-Smtp-Source: AGHT+IGTsVCL+NTHpDgAjbfPGCf82Ky2fpMBBCHIOPIzC5FN2MM8zcjn3L7PrIBL8Fr/RKV6YFjIXQ==
X-Received: by 2002:a5d:64c6:0:b0:38d:cab2:921a with SMTP id ffacd0b85a97d-38f33f1249bmr8380187f8f.1.1739810253132;
        Mon, 17 Feb 2025 08:37:33 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259f7979sm12509797f8f.83.2025.02.17.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:32 -0800 (PST)
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
Subject: [PATCH 6/7] irqchip/irq-imx-gpcv2: Embed syscore_ops in chip context
Date: Mon, 17 Feb 2025 17:37:12 +0100
Message-ID: <20250217163713.211949-7-thierry.reding@gmail.com>
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

This enables the syscore callbacks to obtain the IRQ chip context
without relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/irqchip/irq-imx-gpcv2.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 83b009881e2a..61ba06a28fc4 100644
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
2.48.1

