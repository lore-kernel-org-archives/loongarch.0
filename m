Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6858BF0
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 11:59:39 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.116])
	by gateway (Coremail) with SMTP id _____8BxL_Cqq4lksB0FAA--.10975S3;
	Wed, 14 Jun 2023 19:59:38 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.116])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxNeSoq4lkzJMaAA--.10424S3;
	Wed, 14 Jun 2023 19:59:37 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>,
	loongson-kernel@lists.loongnix.cn,
	stable@vger.kernel.org,
	liuyun <liuyun@loongson.cn>
Subject: [PATCH V3 1/5] irqchip/loongson-pch-pic: Fix initialization of HT vector register
Date: Wed, 14 Jun 2023 19:59:32 +0800
Message-Id: <20230614115936.5950-2-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230614115936.5950-1-lvjianmin@loongson.cn>
References: <20230614115936.5950-1-lvjianmin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxNeSoq4lkzJMaAA--.10424S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr1DZFy8WFyfXr1fXF1xtFc_yoW8tw15pa
	yaqa1avr4UJr1UKF1kGayrXFy3J39xC39rKayYyr1fXwn8C3sFkrsrA3W8ZFWxCrWUZF13
	ZrWSyF18C3W5AFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU7fOzDUUUU

In an ACPI-based dual-bridge system, IRQ of each bridge's
PCH PIC sent to CPU is always a zero-based number, which
means that the IRQ on PCH PIC of each bridge is mapped into
vector range from 0 to 63 of upstream irqchip(e.g. EIOINTC).

      EIOINTC N: [0 ... 63 | 64 ... 255]
                  --------   ----------
                      ^          ^
                      |          |
                  PCH PIC N      |
                             PCH MSI N

For example, the IRQ vector number of sata controller on
PCH PIC of each bridge is 16, which is sent to upstream
irqchip of EIOINTC when an interrupt occurs, which will set
bit 16 of EIOINTC. Since hwirq of 16 on EIOINTC has been
mapped to a irq_desc for sata controller during hierarchy
irq allocation, the related mapped IRQ will be found through
irq_resolve_mapping() in the IRQ domain of EIOINTC.

So, the IRQ number set in HT vector register should be fixed
to be a zero-based number.

Cc: stable@vger.kernel.org
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Co-developed-by: liuyun <liuyun@loongson.cn>
Signed-off-by: liuyun <liuyun@loongson.cn>
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
---
 drivers/irqchip/irq-loongson-pch-pic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index e5fe4d50be05..921c5c0190d1 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -401,14 +401,12 @@ static int __init acpi_cascade_irqdomain_init(void)
 int __init pch_pic_acpi_init(struct irq_domain *parent,
 					struct acpi_madt_bio_pic *acpi_pchpic)
 {
-	int ret, vec_base;
+	int ret;
 	struct fwnode_handle *domain_handle;
 
 	if (find_pch_pic(acpi_pchpic->gsi_base) >= 0)
 		return 0;
 
-	vec_base = acpi_pchpic->gsi_base - GSI_MIN_PCH_IRQ;
-
 	domain_handle = irq_domain_alloc_fwnode(&acpi_pchpic->address);
 	if (!domain_handle) {
 		pr_err("Unable to allocate domain handle\n");
@@ -416,7 +414,7 @@ int __init pch_pic_acpi_init(struct irq_domain *parent,
 	}
 
 	ret = pch_pic_init(acpi_pchpic->address, acpi_pchpic->size,
-				vec_base, parent, domain_handle, acpi_pchpic->gsi_base);
+				0, parent, domain_handle, acpi_pchpic->gsi_base);
 
 	if (ret < 0) {
 		irq_domain_free_fwnode(domain_handle);
-- 
2.31.1

