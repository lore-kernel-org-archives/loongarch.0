Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140ACEBC
	for <loongarch@lists.linux.dev>; Fri,  7 Apr 2023 08:35:08 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8Cxztq81S9krMcXAA--.25345S3;
	Fri, 07 Apr 2023 16:35:08 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxGL2t1S9kKRwYAA--.21995S4;
	Fri, 07 Apr 2023 16:35:07 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	loongson-kernel@lists.loongnix.cn,
	stable@vger.kernel.org
Subject: [PATCH V3 2/5] irqchip/loongson-eiointc: Fix incorrect use of acpi_get_vec_parent
Date: Fri,  7 Apr 2023 16:34:50 +0800
Message-Id: <20230407083453.6305-3-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230407083453.6305-1-lvjianmin@loongson.cn>
References: <20230407083453.6305-1-lvjianmin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxGL2t1S9kKRwYAA--.21995S4
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZw45trW8Jw1xWrW3uF1fCrg_yoW5Ww1UpF
	WUAFWDtr43X3y3uryfKFs8X34rtw1rZanFqa1fCaySyF43uryUGF1rCF1DCryYkrW8WF4Y
	va1YqFyUZF13AwUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8XyCJUUUUU==

In eiointc_acpi_init(), a *eiointc* node is passed into
acpi_get_vec_parent() instead of a required *NUMA* node (on some chip
like 3C5000L, a *NUMA* node means a *eiointc* node, but on some chip
like 3C5000, a *NUMA* node contains 4 *eiointc* nodes), and node in
struct acpi_vector_group is essentially a *NUMA* node, which will
lead to no parent matched for passed *eiointc* node. so the patch
adjusts code to use *NUMA* node for parameter node of
acpi_set_vec_parent/acpi_get_vec_parent.

Cc: stable@vger.kernel.org
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index 62a632d73991..d16ed64feb3d 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -280,9 +280,6 @@ static void acpi_set_vec_parent(int node, struct irq_domain *parent, struct acpi
 {
 	int i;
 
-	if (cpu_has_flatmode)
-		node = cpu_to_node(node * CORES_PER_EIO_NODE);
-
 	for (i = 0; i < MAX_IO_PICS; i++) {
 		if (node == vec_group[i].node) {
 			vec_group[i].parent = parent;
@@ -349,8 +346,16 @@ static int __init pch_pic_parse_madt(union acpi_subtable_headers *header,
 static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
 					const unsigned long end)
 {
+	struct irq_domain *parent;
 	struct acpi_madt_msi_pic *pchmsi_entry = (struct acpi_madt_msi_pic *)header;
-	struct irq_domain *parent = acpi_get_vec_parent(eiointc_priv[nr_pics - 1]->node, msi_group);
+	int node;
+
+	if (cpu_has_flatmode)
+		node = cpu_to_node(eiointc_priv[nr_pics - 1]->node * CORES_PER_EIO_NODE);
+	else
+		node = eiointc_priv[nr_pics - 1]->node;
+
+	parent = acpi_get_vec_parent(node, msi_group);
 
 	if (parent)
 		return pch_msi_acpi_init(parent, pchmsi_entry);
@@ -379,6 +384,7 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 	int i, ret, parent_irq;
 	unsigned long node_map;
 	struct eiointc_priv *priv;
+	int node;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -421,8 +427,12 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 				  "irqchip/loongarch/intc:starting",
 				  eiointc_router_init, NULL);
 
-	acpi_set_vec_parent(acpi_eiointc->node, priv->eiointc_domain, pch_group);
-	acpi_set_vec_parent(acpi_eiointc->node, priv->eiointc_domain, msi_group);
+	if (cpu_has_flatmode)
+		node = cpu_to_node(acpi_eiointc->node * CORES_PER_EIO_NODE);
+	else
+		node = acpi_eiointc->node;
+	acpi_set_vec_parent(node, priv->eiointc_domain, pch_group);
+	acpi_set_vec_parent(node, priv->eiointc_domain, msi_group);
 	ret = acpi_cascade_irqdomain_init();
 
 	return ret;
-- 
2.31.1

