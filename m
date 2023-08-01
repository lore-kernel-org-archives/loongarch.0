Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43787200AC
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 18:56:15 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8AxV_FLVclk60sOAA--.34200S3;
	Wed, 02 Aug 2023 02:56:12 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxF81JVclkyWREAA--.44250S2;
	Wed, 02 Aug 2023 02:56:09 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Sui Jingfeng <suijingfeng@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Li Yi <liyi@loongson.cn>,
	linux-pci@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH] LoongArch: Remove vgaarb related workarounds
Date: Wed,  2 Aug 2023 02:56:07 +0800
Message-Id: <20230801185607.703295-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxF81JVclkyWREAA--.44250S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFy5Xr13GrWUtrWUAw4xuFX_yoW8CF13pF
	nI9Fs7KrWfGr18GwnIyr17WryDZ3ZrA347uFWaka40kr13Zw1Fq393Ar93Xr4fJa9rXFWx
	ZFs8Cw48KF4DtabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8RuWPUUUUU==

When we have a better approach[1] to handle multiple video cards problems
on Loongarch, we want to drop the vgaarb related workaround.

[1] https://patchwork.freedesktop.org/patch/550708/?series=121740&rev=1

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Li Yi <liyi@loongson.cn>
Cc: linux-pci@vger.kernel.org
Cc: loongson-kernel@lists.loongnix.cn
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 arch/loongarch/pci/pci.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
index 2726639150bc..4319b5d75872 100644
--- a/arch/loongarch/pci/pci.c
+++ b/arch/loongarch/pci/pci.c
@@ -8,13 +8,10 @@
 #include <linux/acpi.h>
 #include <linux/types.h>
 #include <linux/pci.h>
-#include <linux/vgaarb.h>
 #include <asm/cacheflush.h>
 #include <asm/loongson.h>
 
 #define PCI_DEVICE_ID_LOONGSON_HOST     0x7a00
-#define PCI_DEVICE_ID_LOONGSON_DC1      0x7a06
-#define PCI_DEVICE_ID_LOONGSON_DC2      0x7a36
 
 int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn,
 						int reg, int len, u32 *val)
@@ -82,19 +79,3 @@ int pcibios_alloc_irq(struct pci_dev *dev)
 		return 0;
 	return acpi_pci_irq_enable(dev);
 }
-
-static void pci_fixup_vgadev(struct pci_dev *pdev)
-{
-	struct pci_dev *devp = NULL;
-
-	while ((devp = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, devp))) {
-		if (devp->vendor != PCI_VENDOR_ID_LOONGSON) {
-			vga_set_default_device(devp);
-			dev_info(&pdev->dev,
-				"Overriding boot device as %X:%X\n",
-				devp->vendor, devp->device);
-		}
-	}
-}
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_DC1, pci_fixup_vgadev);
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_DC2, pci_fixup_vgadev);
-- 
2.34.1

