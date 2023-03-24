Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D48D210D
	for <loongarch@lists.linux.dev>; Fri, 24 Mar 2023 06:09:06 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8BxEJV7Ph1kSpwQAA--.25349S3;
	Fri, 24 Mar 2023 14:08:59 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axmr12Ph1kY_QKAA--.2874S5;
	Fri, 24 Mar 2023 14:08:58 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH V1 3/5] irqchip/loongson-pch-pic: Fix pch_pic_acpi_init calling
Date: Fri, 24 Mar 2023 14:08:52 +0800
Message-Id: <20230324060854.29375-4-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230324060854.29375-1-lvjianmin@loongson.cn>
References: <20230324060854.29375-1-lvjianmin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axmr12Ph1kY_QKAA--.2874S5
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tw17uw1xJw4DGF1UCFy7Awb_yoW8urWDpF
	Wag39Iyr48JryxCFZ7C3y5XryfAwnxu3y2gF4rC3yFvr4qkas5Gr4xta1UCrWkCrsrJF4a
	vr4FqF1j93WUAaDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxU4AhLUUUUU

For dual-bridges scenario, pch_pic_acpi_init() will be called in
following path:

cpuintc_acpi_init
  acpi_cascade_irqdomain_init(in cpuintc driver)
    acpi_table_parse_madt
      eiointc_parse_madt
        eiointc_acpi_init /* this will be called two times corresponding
                             to parsing two eiointc entrys in MADT under
                             dual-bridges scenario*/
          acpi_cascade_irqdomain_init(in pch_pic driver)
            acpi_table_parse_madt
              pch_pic_parse_madt
                pch_pic_acpi_init /* this will be called depend on valid parent IRQ
                                     domain handle for one or two times corresponding
                                     to parsing two pchpic entrys in MADT druring
                                     calling eiointc_acpi_init() under dual-bridges
                                     scenario*/

During the first eiointc_acpi_init() calling, the pch_pic_acpi_init()
will be called just one time since only one valid parent IRQ domain
handle will be found for current eiointc IRQ domain.

During the second eiointc_acpi_init() calling, the pch_pic_acpi_init()
will be called two times since two valid parent IRQ domain handles
will be found. So in pch_pic_acpi_init(), we must have a reasonable
way to prevent from creating second same pch_pic IRQ domain.

The patch matches gsi base information in created pch_pic IRQ domains
to check if the target domain has been created to avoid the bug
mentioned above.

Change-Id: Iacba57be83dcbfe7f61b94632d472bccfaaddc22
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
---
 drivers/irqchip/irq-loongson-pch-pic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index 437f1af693d0..e3c698ca11e9 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -403,6 +403,9 @@ int __init pch_pic_acpi_init(struct irq_domain *parent,
 	int ret, vec_base;
 	struct fwnode_handle *domain_handle;
 
+	if (find_pch_pic(acpi_pchpic->gsi_base) >= 0)
+		return 0;
+
 	vec_base = acpi_pchpic->gsi_base - GSI_MIN_PCH_IRQ;
 
 	domain_handle = irq_domain_alloc_fwnode(&acpi_pchpic->address);
-- 
2.31.1

