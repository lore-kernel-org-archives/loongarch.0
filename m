Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEF230EF9A;
	Tue, 23 Dec 2025 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766477291; cv=none; b=WtrUrlhGTlmYOdrvh4q5JdvzalGEC2N5evNCjkP6nNSKI63I1ivEkKnFxSFms+ng1ffgNbAjY2QCoQMA9tvkHbLnHETE6XpR6cBp4WSIolCoM+qjIsrrz/EB59504Y//pfLLa2nqv9e6zhcswZirXFBL1VN9Sgma9f+s9/qWPNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766477291; c=relaxed/simple;
	bh=F30Xn/tK26X8XyipYPeBBASRkv7sdoRmPDULBO9UX4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmgXQrLg9DMzQSqw6tZwvyLckFovVxMj7vko6HfUyVDlXIpA+Rq867QXIhRjvJWbsRMdGl/cx1djliZNKSDJVQvCEfVbsq/V0959hKnUfgx63sofwj7PDR6OqHuAW6f3GHBEH6pTqI3n+1X2kOKyKvsJ1PfYvOcon5wdw9Rtu6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA61C113D0;
	Tue, 23 Dec 2025 08:08:08 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 5/7] irqchip/loongson-pch-msi: Adjust irqchip driver for 32BIT/64BIT
Date: Tue, 23 Dec 2025 16:04:35 +0800
Message-ID: <20251223080437.3367240-6-chenhuacai@loongson.cn>
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
Currently we pass acpi_pchmsi->msg_address to it. This can only work on
64BIT platform because its type is u64, so cast it to phys_addr_t and
then the driver works on both 32BIT and 64BIT platform.

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

