Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDED146BE
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 08:45:43 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8Bxb+sz8n5k0w0AAA--.407S3;
	Tue, 06 Jun 2023 16:45:40 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTMoz8n5kzAkCAA--.301S2;
	Tue, 06 Jun 2023 16:45:39 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Will Deacon <will@kernel.org>,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3] PCI: Align pci memory space base address with page size
Date: Tue,  6 Jun 2023 16:45:39 +0800
Message-Id: <20230606084539.1694441-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxTMoz8n5kzAkCAA--.301S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AF15tFy7CrWfZFWrGr45Jwc_yoW8Xr13pF
	W7AanrCry8Gr13Gw4vqw1kuF4fWa1v93yYyrWfAasag3ZrCas2yr1UAFy5Zry8ur47GF1U
	XFs8tr1fZFWrXagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2eT5DUUUU

Some PCI devices have only 4K memory space size, it is normal in general
machines and aligned with page size. However some architectures which
support different page size, default page size on LoongArch is 16K, and
ARM64 supports page size varying from 4K to 64K. On machines where larger
page size is use, memory space region of two different pci devices may be
in one page. It is not safe with mmu protection, also VFIO pci device
driver requires base address of pci memory space page aligned, so that it
can be memory mapped to qemu user space when it is passed-through to vm.

It consumes more pci memory resource with page size alignment requirement,
it should not be a problem on 64 bit system.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 drivers/pci/setup-res.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index 967f9a758923..55440ae0128d 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -339,6 +339,14 @@ int pci_assign_resource(struct pci_dev *dev, int resno)
 		return -EINVAL;
 	}
 
+#ifdef CONFIG_64BIT
+	/*
+	 * force minimum page alignment for vfio pci usage
+	 * supposing there is enough pci memory resource on 64bit system
+	 */
+	if (res->flags & IORESOURCE_MEM)
+		align = max_t(resource_size_t, PAGE_SIZE, align);
+#endif
 	size = resource_size(res);
 	ret = _pci_assign_resource(dev, resno, size, align);
 
-- 
2.27.0

