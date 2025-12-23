Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA632877D2;
	Tue, 23 Dec 2025 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766477163; cv=none; b=LJRfhUEpgPrNIx3WJvhdDAxHVpyvQFflqY2gKrFGx9a5bxknX/vGKxh2kk9LVAEkIwjAFCHEguXvQwsLN7vWOlfK7oU5MqOsZBlk9plHhbRSmlS3HWNAfG6Jq+fAka1I2CKdgJycBLTRcegiTpPtbmBZvn0xm43YcQ7/ENwN/Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766477163; c=relaxed/simple;
	bh=v0wMB9OKBwgl0i0tO5YIIXLePVV5l8Dck3oqzf/anQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qL6NjWiDis4dZbZHDsiEHIeiPQtf+V+D8SFXctIToaa+blEX8sLnwRS1KxxY5+rqPZGDkNQlxQWUUor2XR90KxSNh9eMOsTIqaK6pAlo+Sc8QT661VjAtnOLGhygyPuGtJo0rGB+gzUyLZFkCq+LfOpOP8jtU8dHD8sKBlHO5MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D4EC113D0;
	Tue, 23 Dec 2025 08:06:01 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 2/7] irqchip/loongson-liointc: Adjust irqchip driver for 32BIT/64BIT
Date: Tue, 23 Dec 2025 16:04:32 +0800
Message-ID: <20251223080437.3367240-3-chenhuacai@loongson.cn>
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
Currently we pass acpi_liointc->address to it. This can only work on
64BIT platform because its type is u64, so cast it to phys_addr_t and
then the driver works on both 32BIT and 64BIT platform.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-liointc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 0033c2188abc..f001a34878ba 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -394,8 +394,9 @@ static int __init acpi_cascade_irqdomain_init(void)
 
 int __init liointc_acpi_init(struct irq_domain *parent, struct acpi_madt_lio_pic *acpi_liointc)
 {
-	int ret;
+	phys_addr_t addr = acpi_liointc->address;
 	struct fwnode_handle *domain_handle;
+	int ret;
 
 	parent_int_map[0] = acpi_liointc->cascade_map[0];
 	parent_int_map[1] = acpi_liointc->cascade_map[1];
@@ -403,7 +404,7 @@ int __init liointc_acpi_init(struct irq_domain *parent, struct acpi_madt_lio_pic
 	parent_irq[0] = irq_create_mapping(parent, acpi_liointc->cascade[0]);
 	parent_irq[1] = irq_create_mapping(parent, acpi_liointc->cascade[1]);
 
-	domain_handle = irq_domain_alloc_fwnode(&acpi_liointc->address);
+	domain_handle = irq_domain_alloc_fwnode(&addr);
 	if (!domain_handle) {
 		pr_err("Unable to allocate domain handle\n");
 		return -ENOMEM;
-- 
2.47.3

