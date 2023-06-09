Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B50ED7
	for <loongarch@lists.linux.dev>; Fri,  9 Jun 2023 02:20:55 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8CxPuuAjIJkk9gAAA--.2730S3;
	Fri, 09 Jun 2023 10:20:48 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxbMp_jIJkDnwJAA--.20801S2;
	Fri, 09 Jun 2023 10:20:47 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Will Deacon <will@kernel.org>,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4] PCI: Align pci memory space base address with page size
Date: Fri,  9 Jun 2023 10:20:47 +0800
Message-Id: <20230609022047.2195689-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxbMp_jIJkDnwJAA--.20801S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGr1rurW3JF48uF4UArWkAFc_yoW5Gr15pF
	y3A3ZrCrW8Kr1fJ3yDt34kuFZxXan2g3yYvryfCas3GFnrZF9rCw1kAry2qFyUCr4kGryj
	qFn5KF15Xay5XagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU

Some PCI devices have only 4K memory space size, it is normal in general
machines and aligned with page size. However some architectures which
support different page size, default page size on LoongArch is 16K, and
ARM64 supports page size varying from 4K to 64K. On machines where larger
page size is use, memory space region of two different pci devices may be
in one page. It is not safe with mmu protection, also VFIO pci device
driver requires base address of pci memory space page aligned, so that it
can be memory mapped to qemu user space when it is passed-through to vm.

It consumes more pci memory resource with page size alignment requirement,
here extra option PCI_MEMRES_PAGE_ALIGN is added, it can be enabled by
different architectures.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
Change history
v4: add extra kernel option PCI_MEMRES_PAGE_ALIGN to set memory resource
    page aligned.

v3: move alignment requirement to generic pci code

v2: add pci resource alignment requirement in arch specified function
    pcibios_align_resource on arm64/LoongArch platforms

---
 arch/loongarch/Kconfig  | 1 +
 drivers/pci/Kconfig     | 3 +++
 drivers/pci/setup-res.c | 7 +++++++
 3 files changed, 11 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d38b066fc931..65b2f6ba9f8e 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -142,6 +142,7 @@ config LOONGARCH
 	select PCI_LOONGSON
 	select PCI_MSI_ARCH_FALLBACKS
 	select PCI_QUIRKS
+	select PCI_MEMRES_PAGE_ALIGN
 	select PERF_USE_VMALLOC
 	select RTC_LIB
 	select SMP
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 9309f2469b41..9be5f85ff9dc 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -128,6 +128,9 @@ config PCI_LOCKLESS_CONFIG
 config PCI_BRIDGE_EMUL
 	bool
 
+config PCI_MEMRES_PAGE_ALIGN
+	bool
+
 config PCI_IOV
 	bool "PCI IOV support"
 	select PCI_ATS
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index 967f9a758923..6ad76734a670 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -339,6 +339,13 @@ int pci_assign_resource(struct pci_dev *dev, int resno)
 		return -EINVAL;
 	}
 
+#ifdef CONFIG_PCI_MEMRES_PAGE_ALIGN
+	/*
+	 * force minimum page alignment for vfio pci usage
+	 */
+	if (res->flags & IORESOURCE_MEM)
+		align = max_t(resource_size_t, PAGE_SIZE, align);
+#endif
 	size = resource_size(res);
 	ret = _pci_assign_resource(dev, resno, size, align);
 
-- 
2.27.0

