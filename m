Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409AF3815C6;
	Tue, 13 Jan 2026 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294924; cv=none; b=rDSjwgM0Ddu9/QVT/epTblnbV7ufZqdFxWisXdSWhoqPRHCDvcrmwRoUjmSkR5PyYHtL3GCj5d+6Hk4Q6NLh3iEs165tOtt7iIr3JygGVQNTZ/EhiZxRWtepryIgfOoTz6dV0n6pkX623RE0CtVbiOHcl6yGdOLNJOFqq1Z0Y9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294924; c=relaxed/simple;
	bh=n0dxeLOCRes34IqYA6NMAtNQXEQIidRUp094thweXPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDj1LDVbrpZ3XEoLTGJ2YtjQn76R93EEFx74oJvi0hP3kfq/WU1hi0zSgta9HBayH6CH6WiQB6zXwrczNTd9x56woUSFHUV+yibHQPnPR7aSTTHzcsQKgllxI73ohH6+DdDmYFUMv6TorlU8dlFLzXylpqyVuurb91iPPPi84iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114C1C19422;
	Tue, 13 Jan 2026 09:02:01 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V3 5/7] irqchip/loongson-pch-msi: Adjust irqchip driver for 32BIT/64BIT
Date: Tue, 13 Jan 2026 16:59:38 +0800
Message-ID: <20260113085940.3344837-6-chenhuacai@loongson.cn>
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
Currently we pass acpi_pchmsi->msg_address to it. This can only work on
64BIT platform because its type is u64, so cast it to phys_addr_t and
then the driver works on both 32BIT and 64BIT platform.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-pch-msi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
index 4aedc9b90ff7..8500662bdb33 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -263,11 +263,12 @@ struct fwnode_handle *get_pch_msi_handle(int pci_segment)
 
 int __init pch_msi_acpi_init(struct irq_domain *parent, struct acpi_madt_msi_pic *acpi_pchmsi)
 {
-	int ret;
+	phys_addr_t msg_address = acpi_pchmsi->msg_address;
 	struct fwnode_handle *domain_handle;
+	int ret;
 
-	domain_handle = irq_domain_alloc_fwnode(&acpi_pchmsi->msg_address);
-	ret = pch_msi_init(acpi_pchmsi->msg_address, acpi_pchmsi->start,
+	domain_handle = irq_domain_alloc_fwnode(&msg_address);
+	ret = pch_msi_init(msg_address, acpi_pchmsi->start,
 				acpi_pchmsi->count, parent, domain_handle);
 	if (ret < 0)
 		irq_domain_free_fwnode(domain_handle);
-- 
2.47.3

