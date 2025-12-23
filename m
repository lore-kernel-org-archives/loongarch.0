Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EDF306B06;
	Tue, 23 Dec 2025 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766477246; cv=none; b=f49tagKlBSjz24dGrFzyb0fSfdE/3F+pQPBtX3NoHwXlW50nyfxNSYktsr9XBbSKa0gl0l8KMuLn0BBVcQ5AZK3+BdeKA3dmIiT9y73b3lmCbZqxAKWMXmR6D9X/FQDuJJ8AgmD3EtGGKj7jl/j0TrBlMZf0lP4eLJ5f4uLGs0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766477246; c=relaxed/simple;
	bh=+IVGLA5ogZ7PuqmNmMeAw93CXJPoFkzTeYSzwyuQ5Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSs4NFCNmAZuaoDnCKtOsrV9810jiMU3v+urhaD5q6XnkUkH9nT5E9g0j0fvFCn71UoawPLhDV7rbP3hNzm/X/BKvIjnBosiAs3+U6fdFamb57FvyySEQBmRScSoyTucKiAOKtVqpcBgzBOtW3rn+UASwOUEOjR6ENIijqp8uzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAE7C113D0;
	Tue, 23 Dec 2025 08:07:23 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 4/7] irqchip/loongson-htvec: Adjust irqchip driver for 32BIT/64BIT
Date: Tue, 23 Dec 2025 16:04:34 +0800
Message-ID: <20251223080437.3367240-5-chenhuacai@loongson.cn>
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

irq_domain_alloc_fwnode() takes a parameter with the phys_addr_t type.
Currently we pass acpi_htvec->address to it. This can only work on 64BIT
platform because its type is u64, so cast it to phys_addr_t and then the
driver works on both 32BIT and 64BIT platform.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-htvec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index d2be8e954e92..03c3992b39c8 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -298,8 +298,8 @@ static int __init acpi_cascade_irqdomain_init(void)
 int __init htvec_acpi_init(struct irq_domain *parent,
 				   struct acpi_madt_ht_pic *acpi_htvec)
 {
-	int i, ret;
-	int num_parents, parent_irq[8];
+	int i, ret, num_parents, parent_irq[8];
+	phys_addr_t addr = acpi_htvec->address;
 	struct fwnode_handle *domain_handle;
 
 	if (!acpi_htvec)
@@ -307,7 +307,7 @@ int __init htvec_acpi_init(struct irq_domain *parent,
 
 	num_parents = HTVEC_MAX_PARENT_IRQ;
 
-	domain_handle = irq_domain_alloc_fwnode(&acpi_htvec->address);
+	domain_handle = irq_domain_alloc_fwnode(&addr);
 	if (!domain_handle) {
 		pr_err("Unable to allocate domain handle\n");
 		return -ENOMEM;
-- 
2.47.3

