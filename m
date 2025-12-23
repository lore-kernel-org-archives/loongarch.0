Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D830FF23;
	Tue, 23 Dec 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766477331; cv=none; b=N3qhyd3OWmQEFZj1kTUJv6B01A2x71fnLDR8jBc6W2/fnMi9iRC1Xop7ss2isemJEql3LP8xPK+jO8VETZHN1mF5sMuQz13idAeTcQqv6oV6uW8zi3Ngp7BkF1VXpN+3fCfkhMtmweNQ2kqOHKR9VC0mhm4MfZNcmMSxZ/K6K8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766477331; c=relaxed/simple;
	bh=Rl2FAny2OVwcdTD9DmNUnGF8zPnafuH238LDsxkuWKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7U5mUb42+bq7YF/n4xZ7PtJHfPHfhhmL9yu6euyLn+Wb6M40NCg3Oz7+TMZCv3RdUuqoQmGvqkopCK+1pp00Gzet346R6ZQpK2yvz6aZ7KVKqUzcChJI4GwOuOrFehMLs+0b12OUzzwEan9R3rwO/5PH/UFEEEBTcrFDccocMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA517C113D0;
	Tue, 23 Dec 2025 08:08:48 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 7/7] irqchip: Allow LoongArch irqchip drivers on both 32BIT/64BIT
Date: Tue, 23 Dec 2025 16:04:37 +0800
Message-ID: <20251223080437.3367240-8-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223080437.3367240-1-chenhuacai@loongson.cn>
References: <20251223080437.3367240-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All LoongArch irqchip drivers are adjusted, allow them be built on both
32BIT and 64BIT platforms.

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

