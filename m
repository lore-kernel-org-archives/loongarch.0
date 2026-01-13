Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071DF3815C2;
	Tue, 13 Jan 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294951; cv=none; b=eE25JRXueCcHsEmzlRgicjx99+7PgsMlv8uI63/j4bgGY1p1d6sVNhNpEKc1rnVGsypJ3mIFnLTisj2Op+SdwL/zq5DCb+ZRyKgQJ+0DpIrkuQBOWn2aEXDD7D8+ajUSn73n9DVYQSwYPkndmYxL9+Fl9xIDWQJAPrxxh3TXE2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294951; c=relaxed/simple;
	bh=JSiPb2RnLtMPL21l8Qk+GasrgfOQb4XXLrGb5p1UAdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfOi+NgoWT3BzL7Ny0hApD8IdoCq5Bps7ryVTZT9VF0JyOo0s0TAwtcGWWabwwIEBFH5AhC0lGV1xzs6O97O+unFsahKY6zNVvXhF8ziHBvlneaAt+8Fy3rb0Ys3mCgb05cBHY6rWBFrNXZUlltqPLKlANcFmbPF6p4Ba+LB7fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA448C116C6;
	Tue, 13 Jan 2026 09:02:28 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V3 7/7] irqchip: Allow LoongArch irqchip drivers on both 32BIT/64BIT
Date: Tue, 13 Jan 2026 16:59:40 +0800
Message-ID: <20260113085940.3344837-8-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113085940.3344837-1-chenhuacai@loongson.cn>
References: <20260113085940.3344837-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All LoongArch irqchip drivers are adjusted, allow them be built on both
32BIT and 64BIT platforms.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/Kconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f334f49c9791..270f1c4783e3 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -698,7 +698,7 @@ config IRQ_LOONGARCH_CPU
 
 config LOONGSON_LIOINTC
 	bool "Loongson Local I/O Interrupt Controller"
-	depends on MACH_LOONGSON64
+	depends on MACH_LOONGSON64 || LOONGARCH
 	default y
 	select IRQ_DOMAIN
 	select GENERIC_IRQ_CHIP
@@ -708,7 +708,6 @@ config LOONGSON_LIOINTC
 config LOONGSON_EIOINTC
 	bool "Loongson Extend I/O Interrupt Controller"
 	depends on LOONGARCH
-	depends on MACH_LOONGSON64
 	default MACH_LOONGSON64
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_CHIP
@@ -726,7 +725,7 @@ config LOONGSON_HTPIC
 
 config LOONGSON_HTVEC
 	bool "Loongson HyperTransport Interrupt Vector Controller"
-	depends on MACH_LOONGSON64
+	depends on MACH_LOONGSON64 || LOONGARCH
 	default MACH_LOONGSON64
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -734,7 +733,7 @@ config LOONGSON_HTVEC
 
 config LOONGSON_PCH_PIC
 	bool "Loongson PCH PIC Controller"
-	depends on MACH_LOONGSON64
+	depends on MACH_LOONGSON64 || LOONGARCH
 	default MACH_LOONGSON64
 	select IRQ_DOMAIN_HIERARCHY
 	select IRQ_FASTEOI_HIERARCHY_HANDLERS
@@ -743,7 +742,7 @@ config LOONGSON_PCH_PIC
 
 config LOONGSON_PCH_MSI
 	bool "Loongson PCH MSI Controller"
-	depends on MACH_LOONGSON64
+	depends on MACH_LOONGSON64 || LOONGARCH
 	depends on PCI
 	default MACH_LOONGSON64
 	select IRQ_DOMAIN_HIERARCHY
@@ -755,7 +754,7 @@ config LOONGSON_PCH_MSI
 config LOONGSON_PCH_LPC
 	bool "Loongson PCH LPC Controller"
 	depends on LOONGARCH
-	depends on MACH_LOONGSON64
+	depends on MACH_LOONGSON64 || LOONGARCH
 	default MACH_LOONGSON64
 	select IRQ_DOMAIN_HIERARCHY
 	help
-- 
2.47.3

