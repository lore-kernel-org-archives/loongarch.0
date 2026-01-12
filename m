Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B0331A5D;
	Mon, 12 Jan 2026 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207500; cv=none; b=f7hT0lSRhnys+PxGynoVg4XqzKZmCrzbGRuHVFM6Pi9d+WtCRqYL3fFjSLbAw5wz49taX3ih6wORdFqtXGtMua9G0t2r4MM2rY2JrFU2/IAZ8bf658b2xBxmlt4K7JWkwJMvlIMe18U0xEprtTT6s9vHRp5FcauZaM8UmGfTWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207500; c=relaxed/simple;
	bh=YPsKWla8G5Acl7rRSlbGKMRcCpoedfItddAu4Gdzf/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PjLBnHJvlWiYXaQj4SPWotc24KQW0NaDzn3pp9RChXUQtrs9dfQVolRnv5mViMHhgbEG/6ihNScBcYuGj1a48K5LsBWVqmujJkNHS/cgLyaC5P6D6AWncfQy/eJ+baZVCMlejqnkQEcS63i33NQpskrIr4Cg1Gf3GtKyKvrpNzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B143C116D0;
	Mon, 12 Jan 2026 08:44:57 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V2 4/7] irqchip/loongson-htvec: Adjust irqchip driver for 32BIT/64BIT
Date: Mon, 12 Jan 2026 16:43:17 +0800
Message-ID: <20260112084320.1982244-5-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112084320.1982244-1-chenhuacai@loongson.cn>
References: <20260112084320.1982244-1-chenhuacai@loongson.cn>
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

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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

