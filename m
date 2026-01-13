Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC0A3816F3;
	Tue, 13 Jan 2026 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294936; cv=none; b=PrqKDXEf8SrWy9HSs6VP852gkgX/5OpUBumCa41bwTevBdj763U424ffQaKjrUCy9EEqKLkGZyMhAPFU1NkBSfNQL69m1oLzAzfmIPxPennprWDSxZhdaBLgYrcsFAvbs4O+6z2Ay59lyPgT+OHF0ylkiUJhkAY4swct+fyujnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294936; c=relaxed/simple;
	bh=sYoFKOzueta7oShUuE+v4VS+babWzv033PSihn5ipl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paKMrXzxULt5Fmdb0oTmybMa4reDi+xMxZNiaK34bs01OHiCSaZuUlN9EjiZhRsuuspn9tQRlFoNJtTwn6J88gN/35wxyFTP9LtMlh281kEk1GZ8/pP2KdhWKq6gYNgiTZSyK52G5RYjp/353qr/zCATE+m+tSbA09qijYiNDT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADDAC19423;
	Tue, 13 Jan 2026 09:02:14 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V3 6/7] irqchip/loongson-pch-pic: Adjust irqchip driver for 32BIT/64BIT
Date: Tue, 13 Jan 2026 16:59:39 +0800
Message-ID: <20260113085940.3344837-7-chenhuacai@loongson.cn>
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

irq_domain_alloc_fwnode() takes a parameter with the phys_addr_t type.
Currently we pass acpi_pchpic->address to it. This can only work on
64BIT platform because its type is u64, so cast it to phys_addr_t and
then the driver works on both 32BIT and 64BIT platform.

BTW, use readl() to get vec_count because readq() is only available on
64BIT platform.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-pch-pic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index c6b369a974a7..2ac7e3245b72 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -343,7 +343,7 @@ static int pch_pic_init(phys_addr_t addr, unsigned long size, int vec_base,
 		priv->table[i] = PIC_UNDEF_VECTOR;
 
 	priv->ht_vec_base = vec_base;
-	priv->vec_count = ((readq(priv->base) >> 48) & 0xff) + 1;
+	priv->vec_count = ((readl(priv->base + 4) >> 16) & 0xff) + 1;
 	priv->gsi_base = gsi_base;
 
 	priv->pic_domain = irq_domain_create_hierarchy(parent_domain, 0,
@@ -449,13 +449,14 @@ static int __init acpi_cascade_irqdomain_init(void)
 int __init pch_pic_acpi_init(struct irq_domain *parent,
 					struct acpi_madt_bio_pic *acpi_pchpic)
 {
-	int ret;
+	phys_addr_t addr = acpi_pchpic->address;
 	struct fwnode_handle *domain_handle;
+	int ret;
 
 	if (find_pch_pic(acpi_pchpic->gsi_base) >= 0)
 		return 0;
 
-	domain_handle = irq_domain_alloc_fwnode(&acpi_pchpic->address);
+	domain_handle = irq_domain_alloc_fwnode(&addr);
 	if (!domain_handle) {
 		pr_err("Unable to allocate domain handle\n");
 		return -ENOMEM;
-- 
2.47.3

