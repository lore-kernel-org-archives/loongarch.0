Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E9E3E5A1F
	for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872952; cv=none; b=MkDHRVCgWGZdv/m41dfoCXu/YrBtzaOOMBo3i/MKgyXstZeR8ftYVFFytBgFDOG3Yl+mNzRWY/E4y0F9x2j75R5BbyDNQPSSeEr1fNGJHHdto6z120aR41jAFvjFxnJHvYvpYCVo0xCPZ7kmxB9QhNqLfhaic/lax8DpHDL0qUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872952; c=relaxed/simple;
	bh=xxwooIXKq+m4uUJQsJqQFpwowoOLvD1kUDEYIApfh0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9o2zVp+UICyD0Q9S2EpfFaKNIr7SIv9JQMK+eZWuk/coD++ZC7uIuKCnKRZ7zy79rX/1J2DBpqTYaoRETqlgBdC4mOGTQkZQDX2MT9oW5AaUh7lF8y37dC3hqf7yjIQWpGz+ColEh/fHs+aXdCqRCPb+ArTuZ3H/+5CPDMpF9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8BxhvC0z81qYD8VAA--.61447S3;
	Tue, 13 Oct 2026 14:29:08 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJBxJs2yz81qlLcrAA--.50357S2;
	Tue, 13 Oct 2026 14:29:08 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Use pa_to_nid()/nid_to_addrbase() rather than hard-code
Date: Tue, 13 Oct 2026 14:28:58 +0800
Message-ID: <20261013062858.60822-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxJs2yz81qlLcrAA--.50357S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFyfKw47tr45Kw1xXr4fJFc_yoW8Aw47pF
	ZruF4ktrZ5GF1xC3ZYkasY9r15J3Z7G39IqF42kFy8AF17Zr1Yqw48ur9rZF1Utay0qFW0
	qFWfAr4YvF4DXwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8P5r7UUUUU==

NODE_ADDRSPACE_SHIFT is 44 now but may be changed in future, so use
pa_to_nid()/nid_to_addrbase() rather than hard-code.

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/irq.c | 3 ++-
 arch/loongarch/pci/pci.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/irq.c b/arch/loongarch/kernel/irq.c
index 7bf68a7a5f4b..29e0f2baaa8c 100644
--- a/arch/loongarch/kernel/irq.c
+++ b/arch/loongarch/kernel/irq.c
@@ -20,6 +20,7 @@
 
 #include <asm/irq.h>
 #include <asm/loongson.h>
+#include <asm/numa.h>
 #include <asm/setup.h>
 
 DEFINE_PER_CPU(unsigned long, irq_stack);
@@ -69,7 +70,7 @@ static int __init early_pci_mcfg_parse(struct acpi_table_header *header)
 
 	for (i = 0; i < n; i++, mptr++) {
 		msi_group[i].pci_segment = mptr->pci_segment;
-		pch_group[i].node = msi_group[i].node = (mptr->address >> 44) & 0xf;
+		pch_group[i].node = msi_group[i].node = pa_to_nid(mptr->address);
 	}
 
 	return 0;
diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
index f33c7ea1443d..0b99b32110a5 100644
--- a/arch/loongarch/pci/pci.c
+++ b/arch/loongarch/pci/pci.c
@@ -12,6 +12,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <asm/cacheflush.h>
 #include <asm/loongson.h>
+#include <asm/numa.h>
 
 #define PCI_DEVICE_ID_LOONGSON_HOST     0x7a00
 #define PCI_DEVICE_ID_LOONGSON_DC1      0x7a06
@@ -43,7 +44,7 @@ int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devfn,
 
 phys_addr_t mcfg_addr_init(int node)
 {
-	return (((u64)node << 44) | MCFG_EXT_PCICFG_BASE);
+	return (nid_to_addrbase(node) | MCFG_EXT_PCICFG_BASE);
 }
 
 static int __init pcibios_init(void)
-- 
2.52.0

