Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C613876C8
	for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731623; cv=none; b=pTzjxLJLkerLASl1HLPbqWxu8crNjJXpec/ZUwGeSWMdVjy9QSWHla/IqmB7RmUCPsyKhy+Lp289eMYGBnb0PZpTxETsPf3JOnG+3QeGvybckKQyIvQwsMHNcA21nWipJjQ3sBsrE7M6cLn2NUzCOeHzUVdE6XnEei78vo5hlSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731623; c=relaxed/simple;
	bh=9XCPsaEFBsLeJKDS/R5rxm3SavWCSJKyoybh0Nud3cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VWkLXtLRMTkQ1LnueubERLt36PoAlsZmOTk3R1s3543ZEW6Q8MuSYbMoiwQa75Ck0za+ZcErZrMX4eoCKgK1joRaac3gNUiu8+4XR5CNX5OktmxasMnGBU6D2VxKBoY07YRhX9jAg7JGmQV6PpZDctWTpYV5NHqMAqInGUMB3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8CxLMMh_7hp0NgbAA--.15565S3;
	Tue, 17 Mar 2026 15:13:37 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJDxhcAd_7hpUulWAA--.26475S2;
	Tue, 17 Mar 2026 15:13:36 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Qianhai Wu <wuqianhai@loongson.cn>
Subject: [PATCH] LoongArch: Workaround LS2K/LS7A GPU DMA hang bug
Date: Tue, 17 Mar 2026 15:13:27 +0800
Message-ID: <20260317071327.3588013-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxhcAd_7hpUulWAA--.26475S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrykurWkCw4rXr1fWF1DXFc_yoWrAryDpF
	nxZFZ5Krs3tr43GwnIqr1DGrs8C3Z3C34xuFW3CF12gFyxA34rG3ykZrs8Zr13JrWDXrWx
	ZFZ8Ca1Yka1DJ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

1. Hardware limitation: GPU, DC and VPU are typically PCI device 06.0,
06.1 and 06.2. They share some hardware resources, so when configure the
PCI 06.0 device BAR1, DMA memory access cannot be performed through this
BAR, otherwise it will cause hardware abnormalities.

2. In typical scenarios of reboot or S3/S4, DC access to memory through
BAR is not prohibited, resulting in GPU DMA hangs.

3. Workaround method: When configuring the 06.0 device BAR1, turn off
the memory access of DC, GPU and VPU (via DC's CRTC registers).

Signed-off-by: Qianhai Wu <wuqianhai@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/pci/pci.c | 79 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
index d923295ab8c6..88ef6b16fb31 100644
--- a/arch/loongarch/pci/pci.c
+++ b/arch/loongarch/pci/pci.c
@@ -5,6 +5,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/types.h>
 #include <linux/pci.h>
 #include <linux/vgaarb.h>
@@ -15,6 +16,9 @@
 #define PCI_DEVICE_ID_LOONGSON_DC1      0x7a06
 #define PCI_DEVICE_ID_LOONGSON_DC2      0x7a36
 #define PCI_DEVICE_ID_LOONGSON_DC3      0x7a46
+#define PCI_DEVICE_ID_LOONGSON_GPU1     0x7a15
+#define PCI_DEVICE_ID_LOONGSON_GPU2     0x7a25
+#define PCI_DEVICE_ID_LOONGSON_GPU3     0x7a35
 
 int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn,
 						int reg, int len, u32 *val)
@@ -99,3 +103,78 @@ static void pci_fixup_vgadev(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_DC1, pci_fixup_vgadev);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_DC2, pci_fixup_vgadev);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_DC3, pci_fixup_vgadev);
+
+#define CRTC_NUM_MAX		2
+#define CRTC_OUTPUT_ENABLE	0x100
+
+static void loongson_gpu_fixup_dma_hang(struct pci_dev *pdev, bool on)
+{
+	u32 i, val, count, crtc_offset, device;
+	void __iomem *crtc_reg, *base, *regbase;
+	static u32 crtc_status[CRTC_NUM_MAX] = { 0 };
+
+	base = pdev->bus->ops->map_bus(pdev->bus, pdev->devfn + 1, 0);
+	device = readw(base + PCI_DEVICE_ID);
+
+	regbase = ioremap(readq(base + PCI_BASE_ADDRESS_0) & ~0xffull, SZ_64K);
+	if (!regbase) {
+		pci_err(pdev, "Failed to ioremap()\n");
+		return;
+	}
+
+	switch (device) {
+	case PCI_DEVICE_ID_LOONGSON_DC2:
+		crtc_reg = regbase + 0x1240;
+		crtc_offset = 0x10;
+		break;
+	case PCI_DEVICE_ID_LOONGSON_DC3:
+		crtc_reg = regbase;
+		crtc_offset = 0x400;
+		break;
+	}
+
+	for (i = 0; i < CRTC_NUM_MAX; i++, crtc_reg += crtc_offset) {
+		val = readl(crtc_reg);
+
+		if (!on)
+			crtc_status[i] = val;
+
+		/* No need to fixup if the status is off at startup. */
+		if (!(crtc_status[i] & CRTC_OUTPUT_ENABLE))
+			continue;
+
+		if (on)
+			val |= CRTC_OUTPUT_ENABLE;
+		else
+			val &= ~CRTC_OUTPUT_ENABLE;
+
+		mb();
+		writel(val, crtc_reg);
+
+		for (count = 0; count < 32; count++) {
+			val = readl(crtc_reg) & CRTC_OUTPUT_ENABLE;
+			if ((on && val) || (!on && !val))
+				break;
+			udelay(1000);
+		}
+
+		pci_info(pdev, "DMA hang fixup at reg[0x%lx]: 0x%x\n",
+				(unsigned long)crtc_reg & 0xffff, readl(crtc_reg));
+	}
+
+	iounmap(regbase);
+}
+
+static void pci_fixup_dma_hang_early(struct pci_dev *pdev)
+{
+	loongson_gpu_fixup_dma_hang(pdev, false);
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_GPU2, pci_fixup_dma_hang_early);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_GPU3, pci_fixup_dma_hang_early);
+
+static void pci_fixup_dma_hang_final(struct pci_dev *pdev)
+{
+	loongson_gpu_fixup_dma_hang(pdev, true);
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_GPU2, pci_fixup_dma_hang_final);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_GPU3, pci_fixup_dma_hang_final);
-- 
2.52.0

