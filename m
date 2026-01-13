Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B23815C7;
	Tue, 13 Jan 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294911; cv=none; b=jHBaVIZCWbiL0iFweKVcAb63AFsfCKQ1aQ7ebEXeQrfDyBDAWkC3klJMNCke4At0oD6jwCk+cTgbmyw3rvqPr60SYRTl6wSSeyD0tfCO1AV6XuAi+JyGk7miDWU/iiJqN1SZ6NIWV3g7m1z8fyqSpne2Epl/SAsDqv9EmE8tRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294911; c=relaxed/simple;
	bh=YPsKWla8G5Acl7rRSlbGKMRcCpoedfItddAu4Gdzf/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csktxgd/z4niA5/xMR6NM4JfKzKUqL6LuXqCDLpAzJCP7OMDhDCj5bhi9uns2lL+w/w0/I/0CTsyFD9mtyNkGO4a3nG1vTz0fxSpn4j9UZoosy8ot9C94FLctGP2vibzW+zikLJzPBYucPB6ymdenyb3ohRll6N4OxcoXdzaOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11136C116C6;
	Tue, 13 Jan 2026 09:01:48 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V3 4/7] irqchip/loongson-htvec: Adjust irqchip driver for 32BIT/64BIT
Date: Tue, 13 Jan 2026 16:59:37 +0800
Message-ID: <20260113085940.3344837-5-chenhuacai@loongson.cn>
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

