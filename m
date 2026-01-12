Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B45C343D6F;
	Mon, 12 Jan 2026 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207536; cv=none; b=taSB10mvedn5LE8129Fzp9YZdkov9RCJGyG8L4Xi2uYStLsQQWUGc9aiByYP3ChUhBWMrnKBAVW+xgmff/VpC2gbou0mvJ0JRM23RE7tzTmKfLzptAESUJ3Y+imkSMlj9Gvg2zdibTLHpJGcAaIqEf/+5xy3bO4DqI01EMIYBw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207536; c=relaxed/simple;
	bh=n0dxeLOCRes34IqYA6NMAtNQXEQIidRUp094thweXPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFCq8G1yjbEKFc7TOeiu7ph2GzOFKoGi5gYEsS5A6c2onphTjlDmYpUkuAALwziyGap+HeSYQOsqCyGIlFQwRdB0gz73C501IgwB1JHVgGALxyT+mbIryP5Ifq8NKQRULBQySHnsPAo42+uN3S8lzAVUqMcEuUV2yImcocVrG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51921C116D0;
	Mon, 12 Jan 2026 08:45:34 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V2 5/7] irqchip/loongson-pch-msi: Adjust irqchip driver for 32BIT/64BIT
Date: Mon, 12 Jan 2026 16:43:18 +0800
Message-ID: <20260112084320.1982244-6-chenhuacai@loongson.cn>
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

