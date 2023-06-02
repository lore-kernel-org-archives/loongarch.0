Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785EB15B2
	for <loongarch@lists.linux.dev>; Fri,  2 Jun 2023 03:07:42 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8BxGvL1XHlkun4DAA--.7673S3;
	Fri, 02 Jun 2023 11:07:34 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxfTv0XHlk3jaFAA--.19342S2;
	Fri, 02 Jun 2023 11:07:32 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH] LoongArch: Align pci memory base address with page size
Date: Fri,  2 Jun 2023 11:07:32 +0800
Message-Id: <20230602030732.1047696-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxfTv0XHlk3jaFAA--.19342S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uw1UWFyrGryDtryUCFW7urg_yoW8Aw1rpF
	yxAa9xAFs5KrnIqwsxtw1DZFnYga92ka13JrWfAr9xGanxZ34xZrn3AryUZFW8Ar4kGFW0
	qF4Yyr4UWFyUAa7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxU7fMaUUUUU

LoongArch linux kernel uses 16K page size by default, some pci devices have
only 4K memory size, it is normal in general architectures. However memory
space of different pci devices will share one physical page address space.
This is not safe for mmu protection, also UIO and VFIO requires base
address of pci memory space page aligned.

This patch adds check with function pcibios_align_resource, and set base
address of resource page aligned.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/pci/pci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
index 2726639150bc..1380f3672ba2 100644
--- a/arch/loongarch/pci/pci.c
+++ b/arch/loongarch/pci/pci.c
@@ -83,6 +83,29 @@ int pcibios_alloc_irq(struct pci_dev *dev)
 	return acpi_pci_irq_enable(dev);
 }
 
+/*
+ * memory space size of some pci cards is 4K, it is separated with
+ * different pages for generic architectures, so that mmu protection can
+ * work with different pci cards. However page size for LoongArch system
+ * is 16K, memory space of different pci cards may share the same page
+ * on LoongArch, it is not safe here.
+ * Also uio drivers and vfio drivers sugguests that base address of memory
+ * space should page aligned. This function aligns base address with page size
+ */
+resource_size_t pcibios_align_resource(void *data, const struct resource *res,
+		resource_size_t size, resource_size_t align)
+{
+	resource_size_t start = res->start;
+
+	if (res->flags & IORESOURCE_MEM) {
+		if (align & (PAGE_SIZE - 1)) {
+			align = PAGE_SIZE;
+			start = ALIGN(start, align);
+		}
+	}
+	return start;
+}
+
 static void pci_fixup_vgadev(struct pci_dev *pdev)
 {
 	struct pci_dev *devp = NULL;
-- 
2.27.0

