Received: from mail-m11877.qiye.163.com (mail-m11877.qiye.163.com [115.236.118.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02735C9F
	for <loongarch@lists.linux.dev>; Fri, 19 Aug 2022 07:25:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPV6:240e:36a:14ad:4200:c235:eeb6:bee9:4da8])
	by mail-m11877.qiye.163.com (Hmail) with ESMTPA id B62444005DE;
	Fri, 19 Aug 2022 15:25:02 +0800 (CST)
From: Yupeng Li <liyupeng@zbhlos.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	lvjianmin@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yupeng Li <liyupeng@zbhlos.com>,
	Caicai <caizp2008@163.com>
Subject: [PATCH 2/2]     LoongArch: Fixed Loongarch LOONGSON_PCH_MSI func built errors
Date: Fri, 19 Aug 2022 15:24:47 +0800
Message-Id: <20220819072447.60846-1-liyupeng@zbhlos.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTRpNVhlLHUpDT0MfH0xOGlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUlPSx5BSE0aQUpPGh9BT0lLS0EYSUhOQR4eGU1BGR4eQkFPHxpDWVdZFhoPEhUdFF
	lBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OTI6NAw5Lj05ThY2Fj4fLw0R
	DBhPCUlVSlVKTU1LQ0JIQktISU5DVTMWGhIXVRcSAg4LHhUcOwEZExcUCFUYFBZFWVdZEgtZQVlJ
	T0seQUhNGkFKTxofQU9JS0tBGElITkEeHhlNQRkeHkJBTx8aQ1lXWQgBWUFJS0JLNwY+
X-HM-Tid: 0a82b4fdb8212eb3kusnb62444005de

When CONFIG_LOONGSON_PCH_MSI was disabled,kernel build 
with errors like:

MODPOST vmlinux.symvers
MODINFO modules.builtin.modinfo
GEN     modules.builtin
LD      .tmp_vmlinux.kallsyms1
loongarch64-linux-gnu-ld: arch/loongarch/pci/pci.o: in function `pcibios_device_add':
pci.c:(.text+0x1b8): undefined reference to `get_pch_msi_handle'
make: *** [Makefile:1171：vmlinux] 错误 1

Reviewed-by: Caicai <caizp2008@163.com>
Signed-off-by: Yupeng Li <liyupeng@zbhlos.com>
---
 arch/loongarch/pci/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
index e9b7c34d9b6d..44cf57dafcdf 100644
--- a/arch/loongarch/pci/pci.c
+++ b/arch/loongarch/pci/pci.c
@@ -65,13 +65,14 @@ subsys_initcall(pcibios_init);
 
 int pcibios_device_add(struct pci_dev *dev)
 {
+#ifdef CONFIG_LOONGSON_PCH_MSI
 	int id;
 	struct irq_domain *dom;
 
 	id = pci_domain_nr(dev->bus);
 	dom = irq_find_matching_fwnode(get_pch_msi_handle(id), DOMAIN_BUS_PCI_MSI);
 	dev_set_msi_domain(&dev->dev, dom);
-
+#endif
 	return 0;
 }
 
-- 
2.34.1

