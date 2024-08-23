Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6446728EA
	for <loongarch@lists.linux.dev>; Fri, 23 Aug 2024 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724409827; cv=none; b=qfYg8Mh6y1PEdefrumt1/q9D9z+4pGXFJRWP2qCX+LhKX4NASAUqepqN3p9YidJwEtdBYkpE8sUck0KPo+NIysKM50TX4ajDktCuD16lgMZJW+zvCMxPK1ZUV/uQnrBZJTsoajhJAqPbvUU4wnnr9TZ42MyWTb9RMXZr0GxgBrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724409827; c=relaxed/simple;
	bh=ELG4SbnY6u3dorUFMxcrz6mNZbq0MRumxaIVIb/Mg4g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jn/nVv35aretsrn5+EhVOs1bJqQD0tyQP7qX5IgEF0Ya1Oq1dCSXAxaJnhZ3fd+i7iJI9uCbf1/0CfLsnsgrQNRe5Li28xWAF0WPyGYwJt47F1RUdeHKagixJGRJQnmndc22y0edb3Jwb59q0e2qRdrnxI5GcdDiAmXW507RR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8AxSZreZ8hmkFYdAA--.25099S3;
	Fri, 23 Aug 2024 18:43:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMCxC2faZ8hm3TgfAA--.40011S2;
	Fri, 23 Aug 2024 18:43:41 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: corbet@lwn.net,
	alexs@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	gaoliang@loongson.cn,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	zhangtianyang@loongson.cn,
	yijun@loongson.cn,
	mhocko@suse.com,
	akpm@linux-foundation.org,
	dianders@chromium.org,
	maobibo@loongson.cn,
	xry111@xry111.site,
	zhaotianrui@loongson.cn,
	nathan@kernel.org,
	yangtiezhu@loongson.cn,
	zhoubinbin@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v11 6/7] irqchip/loongson-pch-msi: Prepare get_pch_msi_handle() for AVECINTC
Date: Fri, 23 Aug 2024 18:43:36 +0800
Message-Id: <20240823104337.25577-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxC2faZ8hm3TgfAA--.40011S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFykCF15Aw1UXw13Ww4xKrX_yoW8Ary5pF
	W3C34jvr45Ca1UuFZ5X3y7Xry3AF93Ga97Jay0k3srXw1DC39YkF17J3ZrurWfAFW0gF1U
	ur4ktr4UCa1DA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUmIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41lF7xvrVCFI7AF6II2Y40_Zr0_Gr1UMxkF7I0En4kS14v26r126r1DMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUgEksDUUUU

On Loongson-3C6000 and higher systems with AVECINTC irqchip, there may
be multiple PCI segments, but only one PCH-MSI irq domain. In this case,
let get_pch_msi_handle() return the first domain handle.

Co-developed-by: Jianmin Lv <lvjianmin@loongson.cn>
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/irq-loongson-pch-msi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
index d43731878800..0dc14550791d 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -255,17 +255,17 @@ IRQCHIP_DECLARE(pch_msi, "loongson,pch-msi-1.0", pch_msi_of_init);
 #ifdef CONFIG_ACPI
 struct fwnode_handle *get_pch_msi_handle(int pci_segment)
 {
-	int i;
+	if (cpu_has_avecint)
+		return pch_msi_handle[0];
 
-	for (i = 0; i < MAX_IO_PICS; i++) {
+	for (int i = 0; i < MAX_IO_PICS; i++) {
 		if (msi_group[i].pci_segment == pci_segment)
 			return pch_msi_handle[i];
 	}
-	return NULL;
+	return pch_msi_handle[0];
 }
 
-int __init pch_msi_acpi_init(struct irq_domain *parent,
-					struct acpi_madt_msi_pic *acpi_pchmsi)
+int __init pch_msi_acpi_init(struct irq_domain *parent, struct acpi_madt_msi_pic *acpi_pchmsi)
 {
 	int ret;
 	struct fwnode_handle *domain_handle;
-- 
2.20.1

